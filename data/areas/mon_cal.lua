-- Mon Calamri
-- Last saved Monday 01-Jun-2020 11:08:46

AreaEntry
{
   Mobiles = 
   {
      [21000] = 
      {
         Credits = 0, 
         Alignment = 1000, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "elderly saint", 
         NumberOfAttacks = 0, 
         Position = "standing", 
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
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [2] = "_02", 
            [0] = "parry", 
            [8] = "_08", 
         }, 
         DefaultPosition = "standing", 
         Level = 50, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 500, 
            HitPlus = 300, 
            HitNoDice = 25, 
         }, 
         Race = "Human", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         DamRoll = 0, 
         AffectedBy = 
         {
            [7] = "Sanctuary", 
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         LongDescr = "A elderly saint wearing only a dark robe wanders here.\
", 
         Sex = "female", 
         Weight = 0, 
         Name = "healer jedi saint", 
         Height = 0, 
         ArmorClass = 0, 
         HitRoll = 0, 
         Vnum = 21000, 
         Damage = 
         {
            DamNoDice = 0, 
            DamPlus = 0, 
            DamSizeDice = 0, 
         }, 
      }, 
      [21001] = 
      {
         Credits = 0, 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "Anikem the shopkeeper", 
         LongDescr = "Anakiem the shopkeeper stands here.\
", 
         NumberOfAttacks = 6, 
         Position = "standing", 
         Weight = 0, 
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
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         DefaultPosition = "standing", 
         Level = 50, 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30000, 
            HitNoDice = 1, 
         }, 
         Race = "Quarren", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         DamRoll = 4, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         Shop = 
         {
            KeeperShortDescr = "Anikem the shopkeeper", 
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            ProfitBuy = 120, 
            ProfitSell = 90, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
         }, 
         Sex = "male", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "corusca", 
               Code = "smile\
nod\
' ahh the rare corusca crystal is what you seek \
' the only one i know of was given to a young jedi by Master Luke.\
' Seek him out if you seek that crystal.\
smile $n\
", 
            }, 
         }, 
         Name = "Anakiem shopkeeper", 
         Height = 0, 
         ArmorClass = -300, 
         HitRoll = 34, 
         Vnum = 21001, 
         Damage = 
         {
            DamNoDice = 20, 
            DamPlus = 100, 
            DamSizeDice = 100, 
         }, 
      }, 
      [21002] = 
      {
         Credits = 0, 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "the repair tech", 
         RepairShop = 
         {
            KeeperShortDescr = "the repair tech", 
            FixTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [0] = "none", 
            }, 
            ShopType = 1, 
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            ProfitFix = 120, 
         }, 
         NumberOfAttacks = 5, 
         Position = "standing", 
         Weight = 0, 
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
         AttackFlags = 
         {
            [5] = "kick", 
         }, 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         DefaultPosition = "standing", 
         Level = 50, 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30000, 
            HitNoDice = 1, 
         }, 
         Race = "Twi'lek", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         DamRoll = 0, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         LongDescr = "Torval the repir tech works on armor.\
", 
         Sex = "male", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "10 ", 
               Code = "mpecho You hear loud bangs as Torval hammers out dents in the\
mpecho weapons\
", 
            }, 
            [2] = 
            {
               MudProgType = "all_greet_prog", 
               Arguments = "100", 
               Code = "Say hello, if you don't have a weapon for me to repair please leave I'm\
mpecho busy!\
", 
            }, 
         }, 
         Name = "Torval repair", 
         Height = 0, 
         ArmorClass = -300, 
         HitRoll = 0, 
         Vnum = 21002, 
         Damage = 
         {
            DamNoDice = 1, 
            DamPlus = 1000, 
            DamSizeDice = 1, 
         }, 
      }, 
      [21003] = 
      {
         Credits = 0, 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "the spice dealer", 
         NumberOfAttacks = 6, 
         Position = "standing", 
         LongDescr = "The Rodian spice dealer stands behind the counter.\
", 
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
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         DefaultPosition = "standing", 
         Level = 50, 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30000, 
            HitNoDice = 1, 
         }, 
         Race = "Wookiee", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         DamRoll = 0, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         Shop = 
         {
            KeeperShortDescr = "the spice dealer", 
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            ProfitBuy = 115, 
            ProfitSell = 90, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
         }, 
         Sex = "female", 
         Weight = 0, 
         Name = "Shana spice dealer", 
         Height = 0, 
         ArmorClass = 0, 
         HitRoll = 0, 
         Vnum = 21003, 
         Damage = 
         {
            DamNoDice = 4, 
            DamPlus = 100, 
            DamSizeDice = 5, 
         }, 
      }, 
      [21004] = 
      {
         Credits = 0, 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "the Shuttleee", 
         NumberOfAttacks = 6, 
         Position = "standing", 
         LongDescr = "The Shuttleee sits here.\
", 
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
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         DefaultPosition = "standing", 
         Level = 50, 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30000, 
            HitNoDice = 1, 
         }, 
         Race = "Wookiee", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         DamRoll = 0, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         Shop = 
         {
            KeeperShortDescr = "the Shuttleee", 
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            ProfitBuy = 120, 
            ProfitSell = 90, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
         }, 
         Sex = "male", 
         Weight = 0, 
         Name = "Shuttleee", 
         Height = 0, 
         ArmorClass = 0, 
         HitRoll = 0, 
         Vnum = 21004, 
         Damage = 
         {
            DamNoDice = 4, 
            DamPlus = 100, 
            DamSizeDice = 5, 
         }, 
      }, 
      [21006] = 
      {
         Credits = 0, 
         Alignment = -1000, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [6] = "StayArea", 
            [10] = "Practice", 
         }, 
         ShortDescr = "skill teacher", 
         Resistant = 
         {
            [1] = "cold", 
            [4] = "blunt", 
            [20] = "magic", 
         }, 
         NumberOfAttacks = 3, 
         Position = "standing", 
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
         AttackFlags = 
         {
            [12] = "_12", 
            [20] = "_20", 
            [6] = "_06", 
            [11] = "_11", 
         }, 
         Susceptible = 
         {
            [0] = "fire", 
            [5] = "pierce", 
         }, 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         DefaultPosition = "standing", 
         Level = 50, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30000, 
            HitNoDice = 1, 
         }, 
         Race = "Human", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         DamRoll = 0, 
         AffectedBy = 
         {
            [19] = "Flying", 
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         LongDescr = "The skill teacher awaits a student.\
", 
         Sex = "male", 
         Weight = 0, 
         Name = "guildmaster", 
         Height = 0, 
         ArmorClass = 0, 
         HitRoll = 0, 
         Vnum = 21006, 
         Damage = 
         {
            DamNoDice = 1, 
            DamPlus = 20, 
            DamSizeDice = 1, 
         }, 
      }, 
      [21007] = 
      {
         Credits = 0, 
         Alignment = 1000, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "the Calamrian doll", 
         NumberOfAttacks = 0, 
         Position = "standing", 
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
         DefaultPosition = "standing", 
         Level = 1, 
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
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 100, 
            HitNoDice = 1, 
         }, 
         Race = "Human", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         LongDescr = "A Calamrian doll hangs limply here.\
", 
         DamRoll = 0, 
         Sex = "female", 
         Height = 0, 
         Name = "Mon Calamrian doll", 
         Weight = 0, 
         ArmorClass = 0, 
         HitRoll = 0, 
         Vnum = 21007, 
         Damage = 
         {
            DamNoDice = 0, 
            DamPlus = 0, 
            DamSizeDice = 0, 
         }, 
      }, 
      [21009] = 
      {
         Credits = 0, 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         ShortDescr = "the Builder", 
         NumberOfAttacks = 5, 
         Position = "standing", 
         LongDescr = "A Builder offers you his selection of Mon made ships.\
", 
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
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         AttackFlags = 
         {
            [5] = "kick", 
         }, 
         DefaultPosition = "standing", 
         Level = 50, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30000, 
            HitNoDice = 1, 
         }, 
         Race = "Human", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         DamRoll = 0, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         Shop = 
         {
            KeeperShortDescr = "the Builder", 
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            ProfitBuy = 120, 
            ProfitSell = 90, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
         }, 
         Sex = "male", 
         Weight = 0, 
         Name = "Ship builder", 
         Height = 0, 
         ArmorClass = 0, 
         HitRoll = 0, 
         Vnum = 21009, 
         Damage = 
         {
            DamNoDice = 0, 
            DamPlus = 0, 
            DamSizeDice = 0, 
         }, 
      }, 
      [21010] = 
      {
         Credits = 0, 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [2] = "Scavenger", 
            [0] = "Npc", 
         }, 
         ShortDescr = "the waitress", 
         NumberOfAttacks = 0, 
         Position = "standing", 
         LongDescr = "The cute Calamrian waitress awaits your order.\
", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
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
         DefaultPosition = "standing", 
         Level = 50, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30000, 
            HitNoDice = 1, 
         }, 
         Race = "Human", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         DamRoll = 0, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         Shop = 
         {
            KeeperShortDescr = "the waitress", 
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            ProfitBuy = 120, 
            ProfitSell = 90, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
         }, 
         Sex = "female", 
         Weight = 0, 
         Name = "waitress", 
         Height = 0, 
         ArmorClass = 0, 
         HitRoll = 0, 
         Vnum = 21010, 
         Damage = 
         {
            DamNoDice = 0, 
            DamPlus = 0, 
            DamSizeDice = 0, 
         }, 
      }, 
      [21011] = 
      {
         Credits = 0, 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         ShortDescr = "the printer", 
         NumberOfAttacks = 3, 
         Position = "standing", 
         LongDescr = "A thin Calamrian printer sits behind a stack of papers.\
", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
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
         DefaultPosition = "standing", 
         Level = 50, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30000, 
            HitNoDice = 1, 
         }, 
         Race = "Human", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         DamRoll = 0, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         Shop = 
         {
            KeeperShortDescr = "the printer", 
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            ProfitBuy = 120, 
            ProfitSell = 90, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
         }, 
         Sex = "male", 
         Weight = 0, 
         Name = "printer", 
         Height = 0, 
         ArmorClass = 0, 
         HitRoll = 0, 
         Vnum = 21011, 
         Damage = 
         {
            DamNoDice = 0, 
            DamPlus = 0, 
            DamSizeDice = 0, 
         }, 
      }, 
      [21012] = 
      {
         Credits = 0, 
         Alignment = 1000, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [6] = "StayArea", 
            [10] = "Practice", 
         }, 
         ShortDescr = "the Guild Father", 
         NumberOfAttacks = 5, 
         Position = "standing", 
         Immune = 
         {
            [21] = "paralysis", 
            [10] = "sleep", 
            [11] = "charm", 
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
         DefaultPosition = "standing", 
         Level = 50, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30000, 
            HitNoDice = 1, 
         }, 
         Race = "Human", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         DamRoll = 0, 
         AffectedBy = 
         {
            [7] = "Sanctuary", 
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         LongDescr = "The Guild's Shuttleer meditates here.\
\
", 
         Sex = "male", 
         Weight = 0, 
         Name = "Shuttleer father", 
         Height = 0, 
         ArmorClass = 0, 
         HitRoll = 0, 
         Vnum = 21012, 
         Damage = 
         {
            DamNoDice = 100, 
            DamPlus = 800, 
            DamSizeDice = 5, 
         }, 
      }, 
      [21013] = 
      {
         Credits = 0, 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "the bartender Monei", 
         LongDescr = "Monei the bartender stands behind his counter.\
", 
         NumberOfAttacks = 5, 
         Position = "standing", 
         Weight = 0, 
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
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         DefaultPosition = "standing", 
         Level = 50, 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30000, 
            HitNoDice = 1, 
         }, 
         Race = "Human", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         DamRoll = 0, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         Shop = 
         {
            KeeperShortDescr = "the bartender Monei", 
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            ProfitBuy = 120, 
            ProfitSell = 90, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
         }, 
         Sex = "male", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "all_greet_prog", 
               Arguments = "100", 
               Code = "Say Pull up a chair and have a drink, we only live once ya know.\
", 
            }, 
            [2] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "10 ", 
               Code = "mpemote You hear the bartender say, \"I wish those dman vendors would shut\
up!\"\
", 
            }, 
         }, 
         Name = "Monei bartender", 
         Height = 0, 
         ArmorClass = 0, 
         HitRoll = 0, 
         Vnum = 21013, 
         Damage = 
         {
            DamNoDice = 5, 
            DamPlus = 800, 
            DamSizeDice = 100, 
         }, 
      }, 
      [21014] = 
      {
         Credits = 0, 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "Joyta, Mon Calamarian Jewler", 
         NumberOfAttacks = 0, 
         Position = "standing", 
         LongDescr = "&C Joyta, Mon Calamarian Jewler displays here jems in the case.\
", 
         Weight = 0, 
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
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         AttackFlags = 
         {
            [5] = "kick", 
         }, 
         DefaultPosition = "standing", 
         Level = 50, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30000, 
            HitNoDice = 1, 
         }, 
         Race = "Human", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         DamRoll = 0, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         Shop = 
         {
            KeeperShortDescr = "Joyta, Mon Calamarian Jewler", 
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            ProfitBuy = 95, 
            ProfitSell = 90, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
         }, 
         Sex = "female", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "yes", 
               Code = "Say Good come take a look at my display!\
", 
            }, 
            [2] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "ultima pearl ultima_pearl", 
               Code = "say Sorry those are not for sale, protected by the governement.\
say Shhhh , I hear there are more in the ocean, get me one and I'll pay you\
a high\
price.\
say but you didn't here that from me.\
", 
            }, 
            [3] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "5 ", 
               Code = "Yell Come in , I've got the best Jewlery in the Galexy!\
", 
            }, 
            [4] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "hi hello ", 
               Code = "Say Hello $n in the mood for buying some Jewlery?\
", 
            }, 
         }, 
         Name = "jeweler", 
         Height = 0, 
         ArmorClass = 0, 
         HitRoll = 0, 
         Vnum = 21014, 
         Damage = 
         {
            DamNoDice = 0, 
            DamPlus = 0, 
            DamSizeDice = 0, 
         }, 
      }, 
      [21015] = 
      {
         Credits = 0, 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "the Rax armourer", 
         RepairShop = 
         {
            KeeperShortDescr = "the Rax armourer", 
            FixTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [0] = "none", 
            }, 
            ShopType = 1, 
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            ProfitFix = 100, 
         }, 
         LongDescr = "Rax the armourer is here fitting a Mon Calamrian  helm.\
", 
         NumberOfAttacks = 5, 
         Position = "standing", 
         Weight = 0, 
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
         AttackFlags = 
         {
            [5] = "kick", 
         }, 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         DefaultPosition = "standing", 
         Level = 50, 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30000, 
            HitNoDice = 1, 
         }, 
         Race = "Human", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         DamRoll = 0, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         Shop = 
         {
            KeeperShortDescr = "the Rax armourer", 
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            ProfitBuy = 130, 
            ProfitSell = 90, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
         }, 
         Sex = "female", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "all_greet_prog", 
               Arguments = "100", 
               Code = "Say Welcome $n Heard you were in town.\
say If you want any equipment just tell me.\
", 
            }, 
         }, 
         Name = "rax armourer", 
         Height = 0, 
         ArmorClass = 0, 
         HitRoll = 0, 
         Vnum = 21015, 
         Damage = 
         {
            DamNoDice = 1, 
            DamPlus = 1000, 
            DamSizeDice = 1, 
         }, 
      }, 
      [21016] = 
      {
         Credits = 0, 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "the Bonta weaponsmith", 
         NumberOfAttacks = 5, 
         Position = "standing", 
         LongDescr = "The weaponsmith Bonta, labors over a lengthy blade.\
", 
         Weight = 0, 
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
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         AttackFlags = 
         {
            [5] = "kick", 
         }, 
         DefaultPosition = "standing", 
         Level = 50, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30000, 
            HitNoDice = 1, 
         }, 
         Race = "Human", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         DamRoll = 0, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         Shop = 
         {
            KeeperShortDescr = "the Bonta weaponsmith", 
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            ProfitBuy = 120, 
            ProfitSell = 90, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
         }, 
         Sex = "male", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "all_greet_prog", 
               Arguments = "100", 
               Code = "Say Welcome to my shop care to buy a weapon?\
mpecho Bonta grins at you evily.\
", 
            }, 
         }, 
         Name = "bonta weaponsmith", 
         Height = 0, 
         ArmorClass = 0, 
         HitRoll = 0, 
         Vnum = 21016, 
         Damage = 
         {
            DamNoDice = 0, 
            DamPlus = 0, 
            DamSizeDice = 0, 
         }, 
      }, 
      [21017] = 
      {
         Credits = 0, 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "the postmaster", 
         NumberOfAttacks = 3, 
         Position = "standing", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
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
         DefaultPosition = "standing", 
         Level = 50, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30000, 
            HitNoDice = 1, 
         }, 
         Race = "Human", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         DamRoll = 0, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         LongDescr = "The postmaster sorts the day's mail.\
", 
         Sex = "male", 
         Weight = 0, 
         Name = "postmaster", 
         Height = 0, 
         ArmorClass = 0, 
         HitRoll = 0, 
         Vnum = 21017, 
         Damage = 
         {
            DamNoDice = 0, 
            DamPlus = 0, 
            DamSizeDice = 0, 
         }, 
      }, 
      [21018] = 
      {
         Credits = 0, 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "the chef Wannie", 
         NumberOfAttacks = 3, 
         Position = "standing", 
         LongDescr = "A chef Wannie greets you.\
", 
         Weight = 0, 
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
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         AttackFlags = 
         {
            [5] = "kick", 
         }, 
         DefaultPosition = "standing", 
         Level = 50, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30000, 
            HitNoDice = 1, 
         }, 
         Race = "Human", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         DamRoll = 0, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         Shop = 
         {
            KeeperShortDescr = "the chef Wannie", 
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            ProfitBuy = 120, 
            ProfitSell = 90, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
         }, 
         Sex = "male", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "all_greet_prog", 
               Arguments = "100", 
               Code = "Say Hello just step right up and get my galexy famous barbecue.\
", 
            }, 
            [2] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "5 ", 
               Code = "Yell Barbecue, fresh and hot, falls of the bones. \
", 
            }, 
         }, 
         Name = "chef", 
         Height = 0, 
         ArmorClass = 0, 
         HitRoll = 0, 
         Vnum = 21018, 
         Damage = 
         {
            DamNoDice = 1, 
            DamPlus = 800, 
            DamSizeDice = 1, 
         }, 
      }, 
      [21019] = 
      {
         Credits = 0, 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "the baker", 
         NumberOfAttacks = 3, 
         Position = "standing", 
         LongDescr = "The Mon Calamarian baker is here, covered with seaweed flour.\
", 
         Weight = 0, 
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
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         AttackFlags = 
         {
            [5] = "kick", 
         }, 
         DefaultPosition = "standing", 
         Level = 50, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30000, 
            HitNoDice = 1, 
         }, 
         Race = "Human", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         DamRoll = 0, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         Shop = 
         {
            KeeperShortDescr = "the baker", 
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            ProfitBuy = 120, 
            ProfitSell = 90, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
         }, 
         Sex = "male", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "all_greet_prog", 
               Arguments = "100", 
               Code = "say Welcome to my shop when you want to buy just yell!\
", 
            }, 
            [2] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "5", 
               Code = "Yell Fresh Hot Seaweed Bread, Get it while it's Hot!\
", 
            }, 
         }, 
         Name = "baker", 
         Height = 0, 
         ArmorClass = 0, 
         HitRoll = 0, 
         Vnum = 21019, 
         Damage = 
         {
            DamNoDice = 1, 
            DamPlus = 500, 
            DamSizeDice = 1, 
         }, 
      }, 
      [21020] = 
      {
         Credits = 0, 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "the Mon Calamrian girl", 
         NumberOfAttacks = 3, 
         Position = "standing", 
         LongDescr = "A young Mon Calamarian girl smiles as you enter.\
", 
         Weight = 0, 
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
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         AttackFlags = 
         {
            [5] = "kick", 
         }, 
         DefaultPosition = "standing", 
         Level = 100, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 1000, 
            HitNoDice = 20, 
         }, 
         Race = "Human", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         DamRoll = 20, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         Shop = 
         {
            KeeperShortDescr = "the Mon Calamrian girl", 
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            ProfitBuy = 120, 
            ProfitSell = 90, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
         }, 
         Sex = "female", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "all_greet_prog", 
               Arguments = "100", 
               Code = "say Hello, can I intrest you in anything?\
", 
            }, 
            [2] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "sex you fuck", 
               Code = "Say Noy noe $n I'm working...maybe later!\
stare $n\
", 
            }, 
            [3] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "5", 
               Code = "Yell Fresh blue seacow milk, get it while it's here.\
", 
            }, 
         }, 
         Name = "Mon Calamrian girl", 
         Height = 0, 
         ArmorClass = -150, 
         HitRoll = 20, 
         Vnum = 21020, 
         Damage = 
         {
            DamNoDice = 10, 
            DamPlus = 2, 
            DamSizeDice = 4, 
         }, 
      }, 
      [21021] = 
      {
         Credits = 0, 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "&z Lokist the tailor", 
         NumberOfAttacks = 6, 
         Position = "standing", 
         LongDescr = "&z Lokist the tailor is here showing off the latest fashion.\
", 
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
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         DefaultPosition = "standing", 
         Level = 50, 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30000, 
            HitNoDice = 1, 
         }, 
         Race = "Human", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         DamRoll = 0, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         Shop = 
         {
            KeeperShortDescr = "&z Lokist the tailor", 
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            ProfitBuy = 120, 
            ProfitSell = 90, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
         }, 
         Sex = "male", 
         Weight = 0, 
         Name = "Lokist tailor", 
         Height = 0, 
         ArmorClass = 0, 
         HitRoll = 0, 
         Vnum = 21021, 
         Damage = 
         {
            DamNoDice = 4, 
            DamPlus = 100, 
            DamSizeDice = 5, 
         }, 
      }, 
      [21022] = 
      {
         Credits = 0, 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "the bantha keeper", 
         NumberOfAttacks = 6, 
         Position = "standing", 
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
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         DefaultPosition = "standing", 
         Level = 50, 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30000, 
            HitNoDice = 1, 
         }, 
         Race = "Human", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         DamRoll = 0, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         LongDescr = "The bantha keeper tends to his animals.\
", 
         Sex = "male", 
         Weight = 0, 
         Name = "bantha keeper", 
         Height = 0, 
         ArmorClass = 0, 
         HitRoll = 0, 
         Vnum = 21022, 
         Damage = 
         {
            DamNoDice = 4, 
            DamPlus = 100, 
            DamSizeDice = 5, 
         }, 
      }, 
      [21023] = 
      {
         Credits = 0, 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [10] = "Practice", 
         }, 
         ShortDescr = "the Master Thief", 
         NumberOfAttacks = 0, 
         Position = "standing", 
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
         AttackFlags = 
         {
            [6] = "_06", 
            [9] = "_09", 
         }, 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         DefaultPosition = "standing", 
         Level = 50, 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [19] = "disarm", 
         }, 
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30000, 
            HitNoDice = 1, 
         }, 
         Race = "Human", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         DamRoll = 0, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         LongDescr = "A master thief is here to demonstrate the ways of thievery.\
", 
         Sex = "male", 
         Weight = 0, 
         Name = "thief master", 
         Height = 0, 
         ArmorClass = 0, 
         HitRoll = 0, 
         Vnum = 21023, 
         Damage = 
         {
            DamNoDice = 0, 
            DamPlus = 0, 
            DamSizeDice = 0, 
         }, 
      }, 
      [21025] = 
      {
         Credits = 0, 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "the hotel keeper", 
         RepairShop = 
         {
            KeeperShortDescr = "the hotel keeper", 
            FixTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [0] = "none", 
            }, 
            ShopType = 1, 
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            ProfitFix = 100, 
         }, 
         NumberOfAttacks = 4, 
         Position = "standing", 
         Weight = 0, 
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
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         DefaultPosition = "standing", 
         Level = 50, 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30000, 
            HitNoDice = 1, 
         }, 
         Race = "Human", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         DamRoll = 0, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         LongDescr = "The hotel keeper stands here, looking rather gruff.\
", 
         Sex = "male", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "all_greet_prog", 
               Arguments = "", 
               Code = "Say Welcome $n your room awits you.\
", 
            }, 
            [2] = 
            {
               MudProgType = "all_greet_prog", 
               Arguments = "100", 
               Code = "say Welcome $n your room awaits.\
", 
            }, 
            [3] = 
            {
               MudProgType = "bribe_prog", 
               Arguments = "200", 
               Code = "if inroom($i) == 21069\
  say Go on back and pick a room.\
  , points over his shoulder.\
  mptransfer $n 21146\
  mpat $n mea $n The hotel keeper points you down the hall.\
  mpat $n say When you wan'na leave, just tell me. And don't mess up the sheets\
  mppurge coins\
endif\
", 
            }, 
            [4] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "leave exit", 
               Code = "if inroom($i) == 21146\
if inroom($n) == 21146\
  mptransfer $n 21069\
  mpat $n mea $n The hotel keeper leads you out.\
endif\
endif\
", 
            }, 
         }, 
         Name = "hotel keeper", 
         Height = 0, 
         ArmorClass = 0, 
         HitRoll = 0, 
         Vnum = 21025, 
         Damage = 
         {
            DamNoDice = 100, 
            DamPlus = 1000, 
            DamSizeDice = 15, 
         }, 
      }, 
      [21028] = 
      {
         Credits = 0, 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [10] = "Practice", 
         }, 
         ShortDescr = "the sage", 
         NumberOfAttacks = 5, 
         Position = "standing", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
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
         DefaultPosition = "standing", 
         Level = 50, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30000, 
            HitNoDice = 1, 
         }, 
         Race = "Human", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         DamRoll = 0, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         LongDescr = "A pensive sage mulls over new Jedi's .\
", 
         Sex = "male", 
         Weight = 0, 
         Name = "sage man", 
         Height = 0, 
         ArmorClass = 0, 
         HitRoll = 0, 
         Vnum = 21028, 
         Damage = 
         {
            DamNoDice = 100, 
            DamPlus = 800, 
            DamSizeDice = 5, 
         }, 
      }, 
      [21029] = 
      {
         Credits = 0, 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "the storekeeper", 
         NumberOfAttacks = 4, 
         Position = "standing", 
         LongDescr = "A large man stands here, selling equipment for adventurers.\
", 
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
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         DefaultPosition = "standing", 
         Level = 50, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30000, 
            HitNoDice = 1, 
         }, 
         Race = "Human", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         DamRoll = 0, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         Shop = 
         {
            KeeperShortDescr = "the storekeeper", 
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            ProfitBuy = 120, 
            ProfitSell = 90, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
         }, 
         Sex = "male", 
         Weight = 0, 
         Name = "storekeeper", 
         Height = 0, 
         ArmorClass = 0, 
         HitRoll = 0, 
         Vnum = 21029, 
         Damage = 
         {
            DamNoDice = 100, 
            DamPlus = 1000, 
            DamSizeDice = 10, 
         }, 
      }, 
      [21031] = 
      {
         Credits = 0, 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [10] = "Practice", 
         }, 
         ShortDescr = "the ranger Shuttleer", 
         NumberOfAttacks = 5, 
         Position = "standing", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
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
         DefaultPosition = "standing", 
         Level = 50, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30000, 
            HitNoDice = 1, 
         }, 
         Race = "Human", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         DamRoll = 0, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         LongDescr = "The ranger Shuttleer demonstrates combat maneuvers.\
", 
         Sex = "male", 
         Weight = 0, 
         Name = "man ranger", 
         Height = 0, 
         ArmorClass = 0, 
         HitRoll = 0, 
         Vnum = 21031, 
         Damage = 
         {
            DamNoDice = 100, 
            DamPlus = 800, 
            DamSizeDice = 5, 
         }, 
      }, 
      [21416] = 
      {
         Credits = 0, 
         Alignment = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         ShortDescr = "a newly created newbie mob", 
         NumberOfAttacks = 0, 
         Position = "standing", 
         DefaultPosition = "standing", 
         Level = 1, 
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
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         Race = "Human", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         LongDescr = "Some god abandoned a newly created newbie mob here.\
", 
         DamRoll = 0, 
         Sex = "undistinguished", 
         Height = 0, 
         Name = "newbie mob", 
         Weight = 0, 
         ArmorClass = 0, 
         HitRoll = 0, 
         Vnum = 21416, 
         Damage = 
         {
            DamNoDice = 0, 
            DamPlus = 0, 
            DamSizeDice = 0, 
         }, 
      }, 
      [21034] = 
      {
         Credits = 0, 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [10] = "Practice", 
         }, 
         ShortDescr = "the officers Shuttleer", 
         NumberOfAttacks = 4, 
         Position = "standing", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
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
         DefaultPosition = "standing", 
         Level = 50, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30000, 
            HitNoDice = 1, 
         }, 
         Race = "Human", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         DamRoll = 0, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         LongDescr = "A robed woman is here, Shuttleing initiate officers.\
", 
         Sex = "female", 
         Weight = 0, 
         Name = "woman Shuttleer", 
         Height = 0, 
         ArmorClass = 0, 
         HitRoll = 0, 
         Vnum = 21034, 
         Damage = 
         {
            DamNoDice = 100, 
            DamPlus = 1000, 
            DamSizeDice = 10, 
         }, 
      }, 
      [21035] = 
      {
         Credits = 0, 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [10] = "Practice", 
         }, 
         ShortDescr = "the Warrior Shuttleer", 
         NumberOfAttacks = 5, 
         Position = "standing", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
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
         DefaultPosition = "standing", 
         Level = 50, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30000, 
            HitNoDice = 1, 
         }, 
         Race = "Human", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         DamRoll = 0, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         LongDescr = "A giant man stands here, waiting to Shuttle young warriors.\
", 
         Sex = "male", 
         Weight = 0, 
         Name = "man Shuttleer", 
         Height = 0, 
         ArmorClass = 0, 
         HitRoll = 0, 
         Vnum = 21035, 
         Damage = 
         {
            DamNoDice = 5, 
            DamPlus = 800, 
            DamSizeDice = 100, 
         }, 
      }, 
      [21420] = 
      {
         Credits = 0, 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "the bounty hunter", 
         NumberOfAttacks = 1, 
         Position = "standing", 
         Weight = 0, 
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
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         DefaultPosition = "standing", 
         Level = 10, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         Description = "A dark Mon Calamrian stands before you, seemingly wearing the shadows around him\
like a cloak.  His gaze bores into your soul, and he appears to beckon\
you over to speak with him.  The glint of a blaster by his side alerts you\
that this man is probably bounty hunter.\
", 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 200, 
            HitNoDice = 1, 
         }, 
         Race = "Human", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         DamRoll = 0, 
         AffectedBy = 
         {
            [15] = "Sneak", 
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         LongDescr = "A dark figure lurks here, hiding in the shadows.\
", 
         Sex = "undistinguished", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "p what price", 
               Code = "if isnpc($n)\
else\
  mpechoat $n The dark figure stares unflinchingly into your eyes.\
  mpechoaround $n $I draws close to $n and says something.\
   mpechoat $n $I matter-of-factly says, '200 credits.'\
endif\
", 
            }, 
            [2] = 
            {
               MudProgType = "bribe_prog", 
               Arguments = "45000", 
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
            }, 
            [3] = 
            {
               MudProgType = "all_greet_prog", 
               Arguments = "25", 
               Code = "if isnpc($n)\
else\
  mpechoat $n A man hidden in the shadows beckons you over to him.\
  tell $n I have some information which may be of some value...\
  tell $n And for a price I will perhaps share it with you.\
endif\
", 
            }, 
            [4] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "p how much", 
               Code = "if isnpc($n)\
else\
  mpechoat $n The dark figure stares unflinchingly into your eyes.\
  mpechoaround $n $I draws close to $n and says something.\
    mpechoat $n $I matter-of-factly says, '200 credits.'\
endif\
", 
            }, 
         }, 
         Name = "dark figure bounty hunter", 
         Height = 0, 
         ArmorClass = 0, 
         HitRoll = 0, 
         Vnum = 21420, 
         Damage = 
         {
            DamNoDice = 0, 
            DamPlus = 0, 
            DamSizeDice = 0, 
         }, 
      }, 
      [21037] = 
      {
         Credits = 0, 
         Alignment = 1000, 
         Flags = 
         {
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         ShortDescr = "the guard", 
         SpecFuns = 
         {
            [1] = "spec_police_attack", 
            [0] = "spec_guardian", 
         }, 
         NumberOfAttacks = 3, 
         Position = "standing", 
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
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         DefaultPosition = "standing", 
         Level = 15, 
         VipFlags = 
         {
            [5] = "Mon Calamari", 
         }, 
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 15, 
            HitPlus = 300, 
            HitNoDice = 15, 
         }, 
         Race = "Human", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         DamRoll = 2, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
         }, 
         LongDescr = "A Mon Calamrian guard patrols the streets of the city.\
", 
         Sex = "male", 
         Weight = 0, 
         Name = "guard man", 
         Height = 0, 
         ArmorClass = 0, 
         HitRoll = 2, 
         Vnum = 21037, 
         Damage = 
         {
            DamNoDice = 1, 
            DamPlus = 20, 
            DamSizeDice = 1, 
         }, 
      }, 
      [21041] = 
      {
         Credits = 100, 
         Alignment = 1000, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "the guard", 
         NumberOfAttacks = 2, 
         Position = "sleeping", 
         DefaultPosition = "standing", 
         Level = 5, 
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
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 20, 
            HitNoDice = 1, 
         }, 
         Race = "Human", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         LongDescr = "A tired guard is here.\
", 
         DamRoll = 0, 
         Sex = "male", 
         Height = 0, 
         Name = "guard", 
         Weight = 0, 
         ArmorClass = 90, 
         HitRoll = 0, 
         Vnum = 21041, 
         Damage = 
         {
            DamNoDice = 2, 
            DamPlus = 3, 
            DamSizeDice = 3, 
         }, 
      }, 
      [21043] = 
      {
         Credits = 500, 
         Alignment = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         ShortDescr = "the guard", 
         NumberOfAttacks = 2, 
         Position = "standing", 
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
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         DefaultPosition = "standing", 
         Level = 15, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 15, 
            HitPlus = 300, 
            HitNoDice = 15, 
         }, 
         Race = "Human", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         DamRoll = 0, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
         }, 
         LongDescr = "A E-Web guard stares out over the area.\
", 
         Sex = "male", 
         Weight = 0, 
         Name = "E-web guard", 
         Height = 0, 
         ArmorClass = 0, 
         HitRoll = 0, 
         Vnum = 21043, 
         Damage = 
         {
            DamNoDice = 1, 
            DamPlus = 10, 
            DamSizeDice = 4, 
         }, 
      }, 
      [21044] = 
      {
         Credits = 0, 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "the Executioner", 
         NumberOfAttacks = 4, 
         Position = "standing", 
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
         Immune = 
         {
            [21] = "paralysis", 
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         DefaultPosition = "standing", 
         Level = 50, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30000, 
            HitNoDice = 1, 
         }, 
         Race = "Human", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         DamRoll = 0, 
         AffectedBy = 
         {
            [2] = "DetectEvil", 
            [3] = "DetectInvis", 
            [13] = "Protect", 
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [7] = "Sanctuary", 
         }, 
         LongDescr = "A executioner stands silently before you.\
", 
         Sex = "male", 
         Weight = 0, 
         Name = "executioner", 
         Height = 0, 
         ArmorClass = 0, 
         HitRoll = 0, 
         Vnum = 21044, 
         Damage = 
         {
            DamNoDice = 1, 
            DamPlus = 800, 
            DamSizeDice = 1, 
         }, 
      }, 
      [21045] = 
      {
         Credits = 0, 
         Alignment = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         ShortDescr = "a stray", 
         NumberOfAttacks = 0, 
         Position = "standing", 
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
         DefaultPosition = "standing", 
         Level = 5, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 35, 
            HitNoDice = 1, 
         }, 
         Race = "Yevetha", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         LongDescr = "A stray Mosny dog noses along the street.\
", 
         DamRoll = 0, 
         Sex = "female", 
         Height = 0, 
         Name = "dog stray", 
         Weight = 0, 
         ArmorClass = 100, 
         HitRoll = 0, 
         Vnum = 21045, 
         Damage = 
         {
            DamNoDice = 2, 
            DamPlus = 2, 
            DamSizeDice = 5, 
         }, 
      }, 
      [21431] = 
      {
         Credits = 0, 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [10] = "Practice", 
         }, 
         ShortDescr = "Kinalsta", 
         NumberOfAttacks = 0, 
         Position = "standing", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
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
         DefaultPosition = "standing", 
         Level = 51, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30000, 
            HitNoDice = 1, 
         }, 
         Race = "Human", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         DamRoll = 0, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         LongDescr = "A proud man stands here, deliberating over his theories.\
", 
         Sex = "male", 
         Weight = 0, 
         Name = "kinalsta man", 
         Height = 0, 
         ArmorClass = 0, 
         HitRoll = 0, 
         Vnum = 21431, 
         Damage = 
         {
            DamNoDice = 100, 
            DamPlus = 1000, 
            DamSizeDice = 10, 
         }, 
      }, 
      [21433] = 
      {
         Credits = 0, 
         Alignment = 40, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         ShortDescr = "A sleeping Security Guard", 
         NumberOfAttacks = 0, 
         Position = "incapacitated", 
         Weight = 0, 
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
         DefaultPosition = "standing", 
         Level = 49, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         Race = "Human", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         DamRoll = 0, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [3] = "DetectInvis", 
         }, 
         LongDescr = "A sleeping Security Guard rests here.\
", 
         Sex = "undistinguished", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "all_greet_prog", 
               Arguments = "100", 
               Code = "mpecho You hear the sweat sounds of a guard snoring.\
say &c ZZZZZZZZZZzzzzzzzzzz    ZZZZZZZZZZZZZzzzzzzzzzz\
", 
            }, 
         }, 
         Name = "guard sleeping", 
         Height = 0, 
         ArmorClass = 0, 
         HitRoll = 0, 
         Vnum = 21433, 
         Damage = 
         {
            DamNoDice = 0, 
            DamPlus = 0, 
            DamSizeDice = 0, 
         }, 
      }, 
      [21434] = 
      {
         Credits = 1, 
         Alignment = -750, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "A female Secretary ", 
         NumberOfAttacks = 0, 
         Position = "standing", 
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
         Height = 0, 
         DefaultPosition = "standing", 
         Level = 1, 
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
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 100, 
            HitNoDice = 1, 
         }, 
         Race = "Human", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         LongDescr = "A Mon Calamrian Secretary sits here doing important things.\
\
", 
         DamRoll = 0, 
         Sex = "female", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "insurance poor money broke", 
               Code = "Say Sorry we have paying customers here. Move along!\
", 
            }, 
            [2] = 
            {
               MudProgType = "bribe_prog", 
               Arguments = "200", 
               Code = "Say Well, well you do have money! Have a good time.\
mptransfer $n 21071\
", 
            }, 
            [3] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "hi hello", 
               Code = "Say Please state your emergency, I'm busy here.\
mpecho You see the secretary return to watching\
\
mpecho her favorite soap.\
", 
            }, 
            [4] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "hurt sick injured bleeding emergency ", 
               Code = "Say Ya ya ya take a number $n.\
Say please fill out these forms and give me 200 credits for the\
say apointment.\
", 
            }, 
         }, 
         Name = "woman sec secretary female", 
         Weight = 0, 
         ArmorClass = 0, 
         HitRoll = 0, 
         Vnum = 21434, 
         Damage = 
         {
            DamNoDice = 0, 
            DamPlus = 0, 
            DamSizeDice = 0, 
         }, 
      }, 
      [21435] = 
      {
         Credits = 0, 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "&P A Mon Calamarian Nurse", 
         NumberOfAttacks = 0, 
         Position = "standing", 
         DamRoll = 10, 
         DefaultPosition = "standing", 
         Level = 51, 
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
         Description = "Dressed in a conservitive suit and always looking around suspisiously. This\
character has got to be upto something.\
", 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 510, 
            HitNoDice = 10, 
         }, 
         Race = "Human", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         LongDescr = "&P A Mon Calamarian Nurse sorts through medical supplies.\
", 
         Shop = 
         {
            KeeperShortDescr = "&P A Mon Calamarian Nurse", 
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            ProfitBuy = 120, 
            ProfitSell = 90, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
         }, 
         Sex = "female", 
         Height = 0, 
         Name = "mon nurse", 
         Weight = 0, 
         ArmorClass = -27, 
         HitRoll = 10, 
         Vnum = 21435, 
         Damage = 
         {
            DamNoDice = 5, 
            DamPlus = 2, 
            DamSizeDice = 4, 
         }, 
      }, 
      [21052] = 
      {
         Credits = 0, 
         Alignment = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         ShortDescr = "the thief", 
         Resistant = 
         {
            [11] = "charm", 
         }, 
         NumberOfAttacks = 2, 
         Position = "standing", 
         SpecFuns = 
         {
            [0] = "spec_thief", 
         }, 
         Weight = 0, 
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
         DefaultPosition = "standing", 
         Level = 8, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 40, 
            HitPlus = 50, 
            HitNoDice = 3, 
         }, 
         Race = "Human", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         DamRoll = 0, 
         AffectedBy = 
         {
            [16] = "Hide", 
            [5] = "DetectHidden", 
            [15] = "Sneak", 
         }, 
         LongDescr = "A strange figure lurks furtively.\
", 
         Sex = "male", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "greet_prog", 
               Arguments = "29", 
               Code = "mpecho From behind the shadows you can feel somone lighten your pockets.\
mpforce $n give 25 credits thief\
mpecho You turn around and see noone.\
", 
            }, 
         }, 
         Name = "thief figure", 
         Height = 0, 
         ArmorClass = 0, 
         HitRoll = 0, 
         Vnum = 21052, 
         Damage = 
         {
            DamNoDice = 3, 
            DamPlus = 5, 
            DamSizeDice = 2, 
         }, 
      }, 
      [21437] = 
      {
         Credits = 0, 
         Alignment = 40, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         ShortDescr = "&R A sleeping Mount shop keeper ", 
         NumberOfAttacks = 0, 
         Position = "incapacitated", 
         Weight = 0, 
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
         DefaultPosition = "standing", 
         Level = 49, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         Description = "This shop keeper is of a very young age, most likely hi father left him\
here to rent out the\
beasts.\
", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         Race = "Human", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         DamRoll = 0, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [3] = "DetectInvis", 
         }, 
         LongDescr = "&R A sleeping Mount shop keeper lies here.\
", 
         Sex = "undistinguished", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "35", 
               Code = "mpecho You hear the soft sounds of ZZZZZZZZZzzzzzzzz coming from the shop\
mpecho keeper!\
", 
            }, 
         }, 
         Name = "sleeping shop ", 
         Height = 0, 
         ArmorClass = 0, 
         HitRoll = 0, 
         Vnum = 21437, 
         Damage = 
         {
            DamNoDice = 0, 
            DamPlus = 0, 
            DamSizeDice = 0, 
         }, 
      }, 
      [21438] = 
      {
         Credits = 0, 
         Alignment = 1000, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "&c An Elite Security Officer , Hyko ", 
         SpecFuns = 
         {
            [1] = "spec_police_attack", 
            [0] = "spec_guardian", 
         }, 
         NumberOfAttacks = 2, 
         Position = "standing", 
         Weight = 0, 
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
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         VipFlags = 
         {
            [5] = "Mon Calamari", 
         }, 
         DefaultPosition = "standing", 
         Level = 40, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 400, 
            HitNoDice = 8, 
         }, 
         Race = "Human", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         DamRoll = 6, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
         }, 
         LongDescr = "&c An Elite Security Officer , Hyko stands here.\
", 
         Sex = "male", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "all_greet_prog", 
               Arguments = "100", 
               Code = "Say &z Hey if your not supposed to be here, leave before\
Say &z I place you in one of those.\
mpecho The guard points toward the jail cell.\
", 
            }, 
            [2] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "fuck ass suck dick ", 
               Code = "Say &z Sorry pal but your mouth just bought you a night in jail!\
mptransfer $n 21147\
", 
            }, 
         }, 
         Name = "elite officer hyko", 
         Height = 0, 
         ArmorClass = 0, 
         HitRoll = 6, 
         Vnum = 21438, 
         Damage = 
         {
            DamNoDice = 4, 
            DamPlus = 2, 
            DamSizeDice = 4, 
         }, 
      }, 
      [21055] = 
      {
         Credits = 0, 
         Alignment = 300, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [10] = "Practice", 
         }, 
         ShortDescr = "the beggar", 
         NumberOfAttacks = 0, 
         Position = "standing", 
         Height = 0, 
         DefaultPosition = "standing", 
         Level = 3, 
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
         Description = "The old man is clad in the rags of what was once a military outfit.\
He eyes you warily and holds out a tin cup in supplication...\
", 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 20, 
            HitNoDice = 1, 
         }, 
         Race = "Human", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         LongDescr = "A decrepit old beggar sits on the cobbles of the road, pleading.\
", 
         DamRoll = 0, 
         Sex = "male", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "all_greet_prog", 
               Arguments = "100", 
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
            }, 
            [2] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "5", 
               Code = ", rummages in one of many pouches, searching for gold no doubt.\
", 
            }, 
            [3] = 
            {
               MudProgType = "bribe_prog", 
               Arguments = "1000", 
               Code = "say OHHH MY!!!\
mpecho The beggar suddenly clutches his chest and doubles over.\
mpecho In the blink of an eye, he is dead. \
mpecho The surprise and shock must have been too much for him.\
mpat 21194 mpforce cleric mpat beggarprog mppurge beggarprog\
", 
            }, 
            [4] = 
            {
               MudProgType = "bribe_prog", 
               Arguments = "100", 
               Code = "say I cannot express my gratitude in words $n!\
kis $n\
say If only others were so generous.\
", 
            }, 
            [5] = 
            {
               MudProgType = "bribe_prog", 
               Arguments = "10", 
               Code = "say Thank you for such a worthy donation.\
thank $n\
", 
            }, 
         }, 
         Name = "beggar man beggarprog", 
         Weight = 0, 
         ArmorClass = 100, 
         HitRoll = 0, 
         Vnum = 21055, 
         Damage = 
         {
            DamNoDice = 2, 
            DamPlus = 3, 
            DamSizeDice = 3, 
         }, 
      }, 
      [21056] = 
      {
         Credits = 0, 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [8] = "Pet", 
         }, 
         ShortDescr = "the regal calmese", 
         NumberOfAttacks = 2, 
         Position = "standing", 
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
         AttackFlags = 
         {
            [0] = "bite", 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         DefaultPosition = "standing", 
         Level = 15, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         Description = "The Calmese returns your stare with unfeeling eyes.  Its beak and talons\
appear as though they could rend even the toughest of flesh.\
", 
         HitChance = 
         {
            HitSizeDice = 75, 
            HitPlus = 100, 
            HitNoDice = 3, 
         }, 
         Race = "_78", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         DamRoll = 0, 
         AffectedBy = 
         {
            [19] = "Flying", 
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         LongDescr = "A proud Calmese bird perches regally here, defiant to all.\
", 
         Sex = "undistinguished", 
         Weight = 0, 
         Name = "Calmese", 
         Height = 0, 
         ArmorClass = -20, 
         HitRoll = 0, 
         Vnum = 21056, 
         Damage = 
         {
            DamNoDice = 3, 
            DamPlus = 10, 
            DamSizeDice = 10, 
         }, 
      }, 
      [21057] = 
      {
         Credits = 0, 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [8] = "Pet", 
            [18] = "Mountable", 
            [0] = "Npc", 
         }, 
         ShortDescr = "the smelly bantha", 
         Resistant = 
         {
            [1] = "cold", 
         }, 
         NumberOfAttacks = 2, 
         Position = "standing", 
         Susceptible = 
         {
            [11] = "charm", 
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
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         DefaultPosition = "standing", 
         Level = 20, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         Description = "This white bantha sports a brilliant white coat and  lies at your approach.\
She appears ready to serve anyone.\
", 
         HitChance = 
         {
            HitSizeDice = 100, 
            HitPlus = 100, 
            HitNoDice = 2, 
         }, 
         Race = "_86", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         AttackFlags = 
         {
            [5] = "kick", 
         }, 
         LongDescr = "A smelly white bantha slowly trods in a circle.\
", 
         DamRoll = 0, 
         Sex = "female", 
         Height = 0, 
         Name = "bantha", 
         Weight = 0, 
         ArmorClass = 80, 
         HitRoll = 0, 
         Vnum = 21057, 
         Damage = 
         {
            DamNoDice = 3, 
            DamPlus = 10, 
            DamSizeDice = 10, 
         }, 
      }, 
      [21058] = 
      {
         Credits = 0, 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [8] = "Pet", 
            [18] = "Mountable", 
            [0] = "Npc", 
         }, 
         ShortDescr = "the dewback", 
         Resistant = 
         {
            [1] = "cold", 
         }, 
         NumberOfAttacks = 2, 
         Position = "standing", 
         Susceptible = 
         {
            [11] = "charm", 
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
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         DefaultPosition = "standing", 
         Level = 25, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         Description = "The green dewback snorts as you examine him.  His green scales shine\
brightly regardless of light and the dewback seems as though it could\
move tirelessly for days. dewbacks are scarse here...mostly for pets.\
", 
         HitChance = 
         {
            HitSizeDice = 100, 
            HitPlus = 250, 
            HitNoDice = 3, 
         }, 
         Race = "_86", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         AttackFlags = 
         {
            [5] = "kick", 
         }, 
         LongDescr = "A mighty green dewback beats angrily at the ground here.\
", 
         DamRoll = 0, 
         Sex = "male", 
         Height = 0, 
         Name = "dewback", 
         Weight = 0, 
         ArmorClass = 80, 
         HitRoll = 0, 
         Vnum = 21058, 
         Damage = 
         {
            DamNoDice = 3, 
            DamPlus = 30, 
            DamSizeDice = 10, 
         }, 
      }, 
      [21059] = 
      {
         Credits = 0, 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [8] = "Pet", 
         }, 
         ShortDescr = "teke lizard", 
         NumberOfAttacks = 2, 
         Position = "standing", 
         Susceptible = 
         {
            [11] = "charm", 
         }, 
         DefaultPosition = "standing", 
         Level = 5, 
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
         Description = "The teke lizard appears frightened out of its mind...\
", 
         HitChance = 
         {
            HitSizeDice = 75, 
            HitPlus = 50, 
            HitNoDice = 2, 
         }, 
         Race = "_74", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         LongDescr = "A teke lizard scampers away from your booted feet.\
", 
         DamRoll = 0, 
         Sex = "undistinguished", 
         Height = 0, 
         Name = "teke lizard", 
         Weight = 0, 
         ArmorClass = 20, 
         HitRoll = 0, 
         Vnum = 21059, 
         Damage = 
         {
            DamNoDice = 3, 
            DamPlus = 20, 
            DamSizeDice = 10, 
         }, 
      }, 
      [21060] = 
      {
         Credits = 0, 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [8] = "Pet", 
         }, 
         ShortDescr = "the Mon Calmarian mutt", 
         NumberOfAttacks = 2, 
         Position = "standing", 
         Susceptible = 
         {
            [11] = "charm", 
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
         DefaultPosition = "standing", 
         Level = 10, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         Description = "The Mon Calmarian mutt constantly sniffs the ground, searching for its prey.\
", 
         HitChance = 
         {
            HitSizeDice = 75, 
            HitPlus = 85, 
            HitNoDice = 3, 
         }, 
         Race = "_73", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         LongDescr = "A mon calamrian mutt paces in circles here, sniffing the ground.\
", 
         DamRoll = 0, 
         Sex = "undistinguished", 
         Height = 0, 
         Name = "dog", 
         Weight = 0, 
         ArmorClass = 30, 
         HitRoll = 0, 
         Vnum = 21060, 
         Damage = 
         {
            DamNoDice = 5, 
            DamPlus = 10, 
            DamSizeDice = 5, 
         }, 
      }, 
      [21061] = 
      {
         Credits = 0, 
         Alignment = 1000, 
         Flags = 
         {
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         ShortDescr = "the guard", 
         NumberOfAttacks = 3, 
         Position = "standing", 
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
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         DefenseFlags = 
         {
            [0] = "parry", 
         }, 
         DefaultPosition = "standing", 
         Level = 15, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 15, 
            HitPlus = 300, 
            HitNoDice = 15, 
         }, 
         Race = "Human", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         DamRoll = 2, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
         }, 
         LongDescr = "A heavy guard walks the wall of the city.\
", 
         Sex = "male", 
         Weight = 0, 
         Name = "guard man", 
         Height = 0, 
         ArmorClass = 5, 
         HitRoll = 2, 
         Vnum = 21061, 
         Damage = 
         {
            DamNoDice = 1, 
            DamPlus = 10, 
            DamSizeDice = 4, 
         }, 
      }, 
      [21062] = 
      {
         Credits = 0, 
         Alignment = 1000, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "the Docking bay guard", 
         SpecFuns = 
         {
            [1] = "spec_police_attack", 
            [0] = "spec_guardian", 
         }, 
         NumberOfAttacks = 2, 
         Position = "standing", 
         Weight = 0, 
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
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         VipFlags = 
         {
            [5] = "Mon Calamari", 
         }, 
         DefaultPosition = "standing", 
         Level = 15, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 15, 
            HitPlus = 150, 
            HitNoDice = 15, 
         }, 
         Race = "Human", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         DamRoll = 2, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
         }, 
         LongDescr = "A Docking bay guard tends the western Docking bay.\
", 
         Sex = "male", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "time_prog", 
               Arguments = "6", 
               Code = "un w\
op w\
", 
            }, 
            [2] = 
            {
               MudProgType = "time_prog", 
               Arguments = "20", 
               Code = "close w\
\
lock w\
", 
            }, 
         }, 
         Name = "guard", 
         Height = 0, 
         ArmorClass = 0, 
         HitRoll = 2, 
         Vnum = 21062, 
         Damage = 
         {
            DamNoDice = 1, 
            DamPlus = 10, 
            DamSizeDice = 4, 
         }, 
      }, 
      [21063] = 
      {
         Credits = 0, 
         Alignment = 1000, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "the guard", 
         SpecFuns = 
         {
            [1] = "spec_police_attack", 
            [0] = "spec_guardian", 
         }, 
         NumberOfAttacks = 2, 
         Position = "standing", 
         Weight = 0, 
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
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         DefaultPosition = "standing", 
         Level = 15, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 15, 
            HitPlus = 300, 
            HitNoDice = 15, 
         }, 
         Race = "Human", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         DamRoll = 2, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
         }, 
         LongDescr = "A Docking bay guard tends the outer Docking bay.\
", 
         Sex = "male", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "time_prog", 
               Arguments = "6", 
               Code = "un e\
op e\
", 
            }, 
            [2] = 
            {
               MudProgType = "time_prog", 
               Arguments = "20", 
               Code = "close e\
lock e\
", 
            }, 
         }, 
         Name = "man guard", 
         Height = 0, 
         ArmorClass = 0, 
         HitRoll = 2, 
         Vnum = 21063, 
         Damage = 
         {
            DamNoDice = 1, 
            DamPlus = 10, 
            DamSizeDice = 4, 
         }, 
      }, 
      [21064] = 
      {
         Credits = 0, 
         Alignment = 1000, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "the guard", 
         SpecFuns = 
         {
            [1] = "spec_police_attack", 
            [0] = "spec_guardian", 
         }, 
         NumberOfAttacks = 2, 
         Position = "standing", 
         Weight = 0, 
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
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         DefaultPosition = "standing", 
         Level = 15, 
         VipFlags = 
         {
            [5] = "Mon Calamari", 
         }, 
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 15, 
            HitPlus = 300, 
            HitNoDice = 15, 
         }, 
         Race = "Human", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         DamRoll = 2, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
         }, 
         LongDescr = "A Docking bay guard tends the north Docking bay.\
", 
         Sex = "male", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "time_prog", 
               Arguments = "6", 
               Code = "un n\
op n\
", 
            }, 
            [2] = 
            {
               MudProgType = "time_prog", 
               Arguments = "20", 
               Code = "close n\
lock n\
", 
            }, 
         }, 
         Name = "guard man", 
         Height = 0, 
         ArmorClass = 0, 
         HitRoll = 2, 
         Vnum = 21064, 
         Damage = 
         {
            DamNoDice = 1, 
            DamPlus = 10, 
            DamSizeDice = 4, 
         }, 
      }, 
      [21065] = 
      {
         Credits = 0, 
         Alignment = 1000, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "the guard", 
         NumberOfAttacks = 2, 
         Position = "standing", 
         Weight = 0, 
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
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         DefenseFlags = 
         {
            [0] = "parry", 
         }, 
         DefaultPosition = "standing", 
         Level = 15, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 15, 
            HitPlus = 300, 
            HitNoDice = 15, 
         }, 
         Race = "Human", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         DamRoll = 2, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
         }, 
         LongDescr = "A Docking bay guard tends the outer Docking bay.\
", 
         Sex = "male", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "time_prog", 
               Arguments = "20", 
               Code = "close s\
lock s\
", 
            }, 
            [2] = 
            {
               MudProgType = "time_prog", 
               Arguments = "6", 
               Code = "unlock s\
op s\
\
", 
            }, 
         }, 
         Name = "guard", 
         Height = 0, 
         ArmorClass = 0, 
         HitRoll = 2, 
         Vnum = 21065, 
         Damage = 
         {
            DamNoDice = 3, 
            DamPlus = 15, 
            DamSizeDice = 4, 
         }, 
      }, 
      [21066] = 
      {
         Credits = 0, 
         Alignment = 1000, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "the guard", 
         SpecFuns = 
         {
            [1] = "spec_police_attack", 
            [0] = "spec_guardian", 
         }, 
         NumberOfAttacks = 3, 
         Position = "standing", 
         Weight = 0, 
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
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         DefaultPosition = "standing", 
         Level = 15, 
         VipFlags = 
         {
            [5] = "Mon Calamari", 
         }, 
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 15, 
            HitPlus = 300, 
            HitNoDice = 15, 
         }, 
         Race = "Human", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         DamRoll = 2, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
         }, 
         LongDescr = "A guard of watches you as you move by.\
", 
         Sex = "male", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "time_prog", 
               Arguments = "6", 
               Code = "un e\
op e\
", 
            }, 
            [2] = 
            {
               MudProgType = "time_prog", 
               Arguments = "20", 
               Code = "close e\
lock e\
", 
            }, 
         }, 
         Name = "guard", 
         Height = 0, 
         ArmorClass = 0, 
         HitRoll = 2, 
         Vnum = 21066, 
         Damage = 
         {
            DamNoDice = 1, 
            DamPlus = 10, 
            DamSizeDice = 4, 
         }, 
      }, 
      [21067] = 
      {
         Credits = 0, 
         Alignment = 1000, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "the guard", 
         Resistant = 
         {
            [20] = "magic", 
            [13] = "nonmagic", 
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         NumberOfAttacks = 2, 
         Position = "standing", 
         Weight = 0, 
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
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         DefaultPosition = "standing", 
         Level = 15, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 15, 
            HitPlus = 300, 
            HitNoDice = 15, 
         }, 
         Race = "Human", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         DamRoll = 2, 
         AffectedBy = 
         {
            [13] = "Protect", 
            [5] = "DetectHidden", 
         }, 
         LongDescr = "A guard of the city stands here.\
", 
         Sex = "male", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "time_prog", 
               Arguments = "6", 
               Code = "un w\
op w\
", 
            }, 
            [2] = 
            {
               MudProgType = "time_prog", 
               Arguments = "20", 
               Code = "close w\
lock w\
", 
            }, 
         }, 
         Name = "man guard", 
         Height = 0, 
         ArmorClass = 0, 
         HitRoll = 2, 
         Vnum = 21067, 
         Damage = 
         {
            DamNoDice = 1, 
            DamPlus = 10, 
            DamSizeDice = 4, 
         }, 
      }, 
      [21068] = 
      {
         Credits = 0, 
         Alignment = 1000, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "the guard", 
         SpecFuns = 
         {
            [1] = "spec_police_attack", 
            [0] = "spec_guardian", 
         }, 
         NumberOfAttacks = 2, 
         Position = "standing", 
         Weight = 0, 
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
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         VipFlags = 
         {
            [5] = "Mon Calamari", 
         }, 
         DefaultPosition = "standing", 
         Level = 15, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 15, 
            HitPlus = 150, 
            HitNoDice = 15, 
         }, 
         Race = "Human", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         DamRoll = 2, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
         }, 
         LongDescr = "A guard of the city stands at the ready.\
", 
         Sex = "male", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "time_prog", 
               Arguments = "6", 
               Code = "un s\
op s\
", 
            }, 
            [2] = 
            {
               MudProgType = "time_prog", 
               Arguments = "20", 
               Code = "close s\
lock s\
", 
            }, 
         }, 
         Name = "guard", 
         Height = 0, 
         ArmorClass = 0, 
         HitRoll = 2, 
         Vnum = 21068, 
         Damage = 
         {
            DamNoDice = 1, 
            DamPlus = 10, 
            DamSizeDice = 4, 
         }, 
      }, 
      [21069] = 
      {
         Credits = 0, 
         Alignment = 1000, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "the guard", 
         SpecFuns = 
         {
            [1] = "spec_police_attack", 
            [0] = "spec_guardian", 
         }, 
         NumberOfAttacks = 2, 
         Position = "standing", 
         Weight = 0, 
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
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         DefaultPosition = "standing", 
         Level = 15, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 15, 
            HitPlus = 300, 
            HitNoDice = 15, 
         }, 
         Race = "Human", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         DamRoll = 2, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
         }, 
         LongDescr = "An guard keeps vigilant watch here.\
", 
         Sex = "male", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "time_prog", 
               Arguments = "6", 
               Code = "un n\
op n\
", 
            }, 
            [2] = 
            {
               MudProgType = "time_prog", 
               Arguments = "20", 
               Code = "close n\
lock n\
close manhole\
", 
            }, 
         }, 
         Name = "guard", 
         Height = 0, 
         ArmorClass = 0, 
         HitRoll = 2, 
         Vnum = 21069, 
         Damage = 
         {
            DamNoDice = 1, 
            DamPlus = 10, 
            DamSizeDice = 4, 
         }, 
      }, 
      [21070] = 
      {
         Credits = 0, 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [8] = "Pet", 
            [18] = "Mountable", 
            [0] = "Npc", 
         }, 
         ShortDescr = "the pack ratler", 
         NumberOfAttacks = 2, 
         Position = "standing", 
         DefaultPosition = "standing", 
         Level = 6, 
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
         Description = "This fat, lumbering creature is tame and unkept. You find yourself\
wondering what it carries.\
", 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 40, 
            HitNoDice = 1, 
         }, 
         Race = "_86", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         LongDescr = "A pack ratler lumbers about, carrying its master's belongings.\
", 
         DamRoll = 0, 
         Sex = "undistinguished", 
         Height = 0, 
         Name = "ratler", 
         Weight = 0, 
         ArmorClass = 150, 
         HitRoll = 0, 
         Vnum = 21070, 
         Damage = 
         {
            DamNoDice = 3, 
            DamPlus = 8, 
            DamSizeDice = 3, 
         }, 
      }, 
      [21071] = 
      {
         Credits = 0, 
         Alignment = 1000, 
         Flags = 
         {
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         ShortDescr = "the E-web", 
         NumberOfAttacks = 3, 
         Position = "standing", 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
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
         DefaultPosition = "standing", 
         Level = 15, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 15, 
            HitPlus = 300, 
            HitNoDice = 15, 
         }, 
         Race = "Human", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         DamRoll = 2, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
         }, 
         LongDescr = "A E-Web guard peers over the area.\
", 
         Sex = "male", 
         Weight = 0, 
         Name = "E-Web Guard", 
         Height = 0, 
         ArmorClass = 0, 
         HitRoll = 2, 
         Vnum = 21071, 
         Damage = 
         {
            DamNoDice = 1, 
            DamPlus = 10, 
            DamSizeDice = 4, 
         }, 
      }, 
      [21073] = 
      {
         Credits = 0, 
         Alignment = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         ShortDescr = "a newly created key", 
         NumberOfAttacks = 0, 
         Position = "standing", 
         DefaultPosition = "standing", 
         Level = 1, 
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
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         Race = "Human", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         LongDescr = "Some god abandoned a newly created key here.\
", 
         DamRoll = 0, 
         Sex = "undistinguished", 
         Height = 0, 
         Name = "Key", 
         Weight = 0, 
         ArmorClass = 0, 
         HitRoll = 0, 
         Vnum = 21073, 
         Damage = 
         {
            DamNoDice = 0, 
            DamPlus = 0, 
            DamSizeDice = 0, 
         }, 
      }, 
      [21074] = 
      {
         Credits = 0, 
         Alignment = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         ShortDescr = "a newly created key", 
         NumberOfAttacks = 0, 
         Position = "standing", 
         DefaultPosition = "standing", 
         Level = 1, 
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
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         Race = "Human", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         LongDescr = "Some god abandoned a newly created key here.\
", 
         DamRoll = 0, 
         Sex = "undistinguished", 
         Height = 0, 
         Name = "Key", 
         Weight = 0, 
         ArmorClass = 0, 
         HitRoll = 0, 
         Vnum = 21074, 
         Damage = 
         {
            DamNoDice = 0, 
            DamPlus = 0, 
            DamSizeDice = 0, 
         }, 
      }, 
      [21075] = 
      {
         Credits = 0, 
         Alignment = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         ShortDescr = "a newly created key", 
         NumberOfAttacks = 0, 
         Position = "standing", 
         DefaultPosition = "standing", 
         Level = 1, 
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
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         Race = "Human", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         LongDescr = "Some god abandoned a newly created key here.\
", 
         DamRoll = 0, 
         Sex = "undistinguished", 
         Height = 0, 
         Name = "Key", 
         Weight = 0, 
         ArmorClass = 0, 
         HitRoll = 0, 
         Vnum = 21075, 
         Damage = 
         {
            DamNoDice = 0, 
            DamPlus = 0, 
            DamSizeDice = 0, 
         }, 
      }, 
      [21076] = 
      {
         Credits = 0, 
         Alignment = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         ShortDescr = "a newly created key", 
         NumberOfAttacks = 0, 
         Position = "standing", 
         DefaultPosition = "standing", 
         Level = 1, 
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
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         Race = "Human", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         LongDescr = "Some god abandoned a newly created key here.\
", 
         DamRoll = 0, 
         Sex = "undistinguished", 
         Height = 0, 
         Name = "Key", 
         Weight = 0, 
         ArmorClass = 0, 
         HitRoll = 0, 
         Vnum = 21076, 
         Damage = 
         {
            DamNoDice = 0, 
            DamPlus = 0, 
            DamSizeDice = 0, 
         }, 
      }, 
      [21077] = 
      {
         Credits = 0, 
         Alignment = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         ShortDescr = "a newly created key", 
         NumberOfAttacks = 0, 
         Position = "standing", 
         DefaultPosition = "standing", 
         Level = 1, 
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
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         Race = "Human", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         LongDescr = "Some god abandoned a newly created key here.\
", 
         DamRoll = 0, 
         Sex = "undistinguished", 
         Height = 0, 
         Name = "Key", 
         Weight = 0, 
         ArmorClass = 0, 
         HitRoll = 0, 
         Vnum = 21077, 
         Damage = 
         {
            DamNoDice = 0, 
            DamPlus = 0, 
            DamSizeDice = 0, 
         }, 
      }, 
      [21078] = 
      {
         Credits = 0, 
         Alignment = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         ShortDescr = "a newly created key", 
         NumberOfAttacks = 0, 
         Position = "standing", 
         DefaultPosition = "standing", 
         Level = 1, 
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
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         Race = "Human", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         LongDescr = "Some god abandoned a newly created key here.\
", 
         DamRoll = 0, 
         Sex = "undistinguished", 
         Height = 0, 
         Name = "Key", 
         Weight = 0, 
         ArmorClass = 0, 
         HitRoll = 0, 
         Vnum = 21078, 
         Damage = 
         {
            DamNoDice = 0, 
            DamPlus = 0, 
            DamSizeDice = 0, 
         }, 
      }, 
      [21079] = 
      {
         Credits = 0, 
         Alignment = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         ShortDescr = "a newly created key", 
         NumberOfAttacks = 0, 
         Position = "standing", 
         DefaultPosition = "standing", 
         Level = 1, 
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
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         Race = "Human", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         LongDescr = "Some god abandoned a newly created key here.\
", 
         DamRoll = 0, 
         Sex = "undistinguished", 
         Height = 0, 
         Name = "Key", 
         Weight = 0, 
         ArmorClass = 0, 
         HitRoll = 0, 
         Vnum = 21079, 
         Damage = 
         {
            DamNoDice = 0, 
            DamPlus = 0, 
            DamSizeDice = 0, 
         }, 
      }, 
      [21080] = 
      {
         Credits = 0, 
         Alignment = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         ShortDescr = "a newly created key", 
         NumberOfAttacks = 0, 
         Position = "standing", 
         DefaultPosition = "standing", 
         Level = 1, 
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
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         Race = "Human", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         LongDescr = "Some god abandoned a newly created key here.\
", 
         DamRoll = 0, 
         Sex = "undistinguished", 
         Height = 0, 
         Name = "Key", 
         Weight = 0, 
         ArmorClass = 0, 
         HitRoll = 0, 
         Vnum = 21080, 
         Damage = 
         {
            DamNoDice = 0, 
            DamPlus = 0, 
            DamSizeDice = 0, 
         }, 
      }, 
      [21081] = 
      {
         Credits = 0, 
         Alignment = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         ShortDescr = "&p An elderly entertainment man ", 
         NumberOfAttacks = 0, 
         Position = "standing", 
         Height = 0, 
         DefaultPosition = "standing", 
         Level = 15, 
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
         Description = "This bearded human was jailed after he lost control and shot several Mon\
Calamari individuals. His clothes are ragged and it is rumored that at one\
time he was well known for his excellent Sci-Fiction writing. There is a\
small patch with writing on it. \
", 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 150, 
            HitNoDice = 3, 
         }, 
         Race = "Human", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         LongDescr = "&p An elderly entertainment man rests on the bed contimplating filming a movie.\
&x\
\
", 
         DamRoll = 0, 
         Sex = "female", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "all_greet_prog", 
               Arguments = "100", 
               Code = "say Hey tell me your here to buy my new script... Intersteller Wars?\
", 
            }, 
         }, 
         Name = "man elderly george lucas", 
         Weight = 0, 
         ArmorClass = 62, 
         HitRoll = 0, 
         Vnum = 21081, 
         Damage = 
         {
            DamNoDice = 1, 
            DamPlus = 2, 
            DamSizeDice = 4, 
         }, 
      }, 
      [21082] = 
      {
         Credits = 0, 
         Alignment = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [5] = "Aggressive", 
            [2] = "Scavenger", 
            [6] = "StayArea", 
         }, 
         ShortDescr = "&G Toisk, A rather dumb Gamorrean male", 
         NumberOfAttacks = 2, 
         Position = "standing", 
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
         DefaultPosition = "standing", 
         Level = 10, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 100, 
            HitNoDice = 2, 
         }, 
         Race = "Gamorrean", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         VipFlags = 
         {
            [7] = "Gamorr", 
         }, 
         LongDescr = "&G Toisk, A rather dumb Gamorrean male sits here counting the cracks in the\
floor.\
", 
         DamRoll = 0, 
         Sex = "male", 
         Height = 0, 
         Name = "gamorrean male Toisk", 
         Weight = 0, 
         ArmorClass = 10, 
         HitRoll = 0, 
         Vnum = 21082, 
         Damage = 
         {
            DamNoDice = 2, 
            DamPlus = 0, 
            DamSizeDice = 6, 
         }, 
      }, 
      [21083] = 
      {
         Credits = 0, 
         Alignment = 1000, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "&z A Tk-13y Security scanner", 
         Resistant = 
         {
            [20] = "magic", 
            [13] = "nonmagic", 
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         NumberOfAttacks = 2, 
         Position = "standing", 
         SpecFuns = 
         {
            [0] = "spec_customs_weapons", 
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
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         DefaultPosition = "standing", 
         Level = 15, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 15, 
            HitPlus = 300, 
            HitNoDice = 15, 
         }, 
         Race = "Human", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         DamRoll = 0, 
         AffectedBy = 
         {
            [13] = "Protect", 
            [5] = "DetectHidden", 
         }, 
         LongDescr = "&z A Tk-13y voice active security scanner frames the enterace. &z\
", 
         Sex = "male", 
         Weight = 0, 
         Name = "scanner enterance", 
         Height = 0, 
         ArmorClass = 0, 
         HitRoll = 0, 
         Vnum = 21083, 
         Damage = 
         {
            DamNoDice = 1, 
            DamPlus = 10, 
            DamSizeDice = 4, 
         }, 
      }, 
      [21084] = 
      {
         Credits = 0, 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [24] = "NoAssist", 
            [18] = "Mountable", 
            [0] = "Npc", 
            [30] = "Prototype", 
            [26] = "Droid", 
         }, 
         ShortDescr = "&z Greeting Protocol Droid stands here.", 
         NumberOfAttacks = 0, 
         Position = "standing", 
         DefaultPosition = "standing", 
         Level = 10, 
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
         Description = "The binary load lifter is a big droid used mainly for lifting and\
moving large objects. Its very simple processing unit can only handle\
very simple commands as there is very little need for an intelligent\
droid laborer.\
", 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 100, 
            HitNoDice = 2, 
         }, 
         Race = "Human", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         LongDescr = "A power droid is here.\
", 
         DamRoll = 0, 
         Sex = "undistinguished", 
         Height = 0, 
         Name = "Greeting Protocol Droid", 
         Weight = 0, 
         ArmorClass = 75, 
         HitRoll = 0, 
         Vnum = 21084, 
         Damage = 
         {
            DamNoDice = 0, 
            DamPlus = 0, 
            DamSizeDice = 0, 
         }, 
      }, 
      [21100] = 
      {
         Credits = 0, 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         ShortDescr = "Protocol Droid", 
         NumberOfAttacks = 0, 
         Position = "standing", 
         DefaultPosition = "standing", 
         Level = 1, 
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
         Description = "As busy as this guy is he still takes the time to help each and\
every customer that walks into the room.  His silver coated frame\
gleems brightly and you can see that he will remain in service \
for some time barring any accidents.\
", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         Race = "Human", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         LongDescr = "Protocol Droid Secretary Greets you\
", 
         DamRoll = 2, 
         Sex = "undistinguished", 
         Height = 0, 
         Name = "Protocol Droid Secretary", 
         Weight = 0, 
         ArmorClass = 0, 
         HitRoll = 3, 
         Vnum = 21100, 
         Damage = 
         {
            DamNoDice = 2, 
            DamPlus = 0, 
            DamSizeDice = 6, 
         }, 
      }, 
      [21101] = 
      {
         Credits = 0, 
         Alignment = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         ShortDescr = "A janitor Droid", 
         NumberOfAttacks = 0, 
         Position = "standing", 
         DefaultPosition = "standing", 
         Level = 1, 
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
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         Race = "Human", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         LongDescr = "A janitor droid scoots about picking up your trash\
", 
         DamRoll = 0, 
         Sex = "undistinguished", 
         Height = 0, 
         Name = "Janitor", 
         Weight = 0, 
         ArmorClass = 0, 
         HitRoll = 0, 
         Vnum = 21101, 
         Damage = 
         {
            DamNoDice = 0, 
            DamPlus = 0, 
            DamSizeDice = 0, 
         }, 
      }, 
      [21445] = 
      {
         Credits = 0, 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "A quarren drunk ", 
         NumberOfAttacks = 0, 
         Position = "standing", 
         Height = 0, 
         DefaultPosition = "standing", 
         Level = 11, 
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
         Description = "The Quarren are more commonly know as squidheads throughout the galaxy\
due to the shape of their heads. The come from the ocean world of Mon\
Calamari.\
", 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 110, 
            HitNoDice = 2, 
         }, 
         Race = "Human", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         LongDescr = "A quarren drunk stumbles here.\
", 
         DamRoll = 0, 
         Sex = "female", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "hi hello", 
               Code = "Say hello, You new here $n? or have I talked to you I don't know, \
say hey bartender get me another drink.\
mpecho You see the bartender poor the quarren another drink.\
say you ever been down to the quarren city $n It's awsome.\
mpecho You see the drunk reach in his pockets and \
mpecho you see he has no credits.\
Say hey $n give me 200 credits and I'll give you a map to the Quarren city\
.\
", 
            }, 
            [2] = 
            {
               MudProgType = "bribe_prog", 
               Arguments = "200 ", 
               Code = "Say well thanks $n\
mpoload 21113\
give map $n\
", 
            }, 
         }, 
         Name = "drunk quarren", 
         Weight = 0, 
         ArmorClass = 72, 
         HitRoll = 0, 
         Vnum = 21445, 
         Damage = 
         {
            DamNoDice = 1, 
            DamPlus = 2, 
            DamSizeDice = 4, 
         }, 
      }, 
      [21448] = 
      {
         Credits = 0, 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "&G A \"First Bank of Mon\" bank clerk", 
         NumberOfAttacks = 0, 
         Position = "standing", 
         Height = 0, 
         DefaultPosition = "standing", 
         Level = 50, 
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
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 500, 
            HitNoDice = 10, 
         }, 
         Race = "Human", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         LongDescr = "&G A \"First Bank of Mon\" bank clerk counts credits to be sorted.\
", 
         DamRoll = 0, 
         Sex = "female", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "all_greet_prog", 
               Arguments = "100", 
               Code = "Say  &c Hello, welcome to the first bank of Mon ,\
Say &c Here your money is safe with us.\
smile $n\
mpecho &R You are reasured of that fact as you feal a red\
mpecho &R laser beam scan you for your bio-info.\
", 
            }, 
         }, 
         Name = "clerk mon bank", 
         Weight = 0, 
         ArmorClass = -25, 
         HitRoll = 0, 
         Vnum = 21448, 
         Damage = 
         {
            DamNoDice = 5, 
            DamPlus = 2, 
            DamSizeDice = 4, 
         }, 
      }, 
      [21447] = 
      {
         Credits = 0, 
         Alignment = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [7] = "Wimpy", 
         }, 
         ShortDescr = "A Mon child", 
         NumberOfAttacks = 1, 
         Position = "standing", 
         DefaultPosition = "standing", 
         Level = 1, 
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
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30, 
            HitNoDice = 1, 
         }, 
         Race = "Human", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         LongDescr = "A Mon child digs in the ground.\
", 
         DamRoll = 0, 
         Sex = "male", 
         Height = 0, 
         Name = "child mon", 
         Weight = 0, 
         ArmorClass = 0, 
         HitRoll = 0, 
         Vnum = 21447, 
         Damage = 
         {
            DamNoDice = 1, 
            DamPlus = 3, 
            DamSizeDice = 3, 
         }, 
      }, 
      [21446] = 
      {
         Credits = 0, 
         Alignment = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [7] = "Wimpy", 
         }, 
         ShortDescr = "A Quarren child plays here.", 
         NumberOfAttacks = 1, 
         Position = "standing", 
         DefaultPosition = "standing", 
         Level = 1, 
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
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30, 
            HitNoDice = 1, 
         }, 
         Race = "Quarren", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         LongDescr = "A Quarren child plays here.\
", 
         DamRoll = 0, 
         Sex = "male", 
         Height = 0, 
         Name = "quarren child", 
         Weight = 0, 
         ArmorClass = 0, 
         HitRoll = 0, 
         Vnum = 21446, 
         Damage = 
         {
            DamNoDice = 1, 
            DamPlus = 3, 
            DamSizeDice = 3, 
         }, 
      }, 
      [21499] = 
      {
         Credits = 0, 
         Alignment = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         ShortDescr = "a newly created final mob", 
         NumberOfAttacks = 0, 
         Position = "standing", 
         DefaultPosition = "standing", 
         Level = 1, 
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
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         Race = "Human", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         LongDescr = "Some god abandoned a newly created final mob here.\
", 
         DamRoll = 0, 
         Sex = "undistinguished", 
         Height = 0, 
         Name = "final mob", 
         Weight = 0, 
         ArmorClass = 0, 
         HitRoll = 0, 
         Vnum = 21499, 
         Damage = 
         {
            DamNoDice = 0, 
            DamPlus = 0, 
            DamSizeDice = 0, 
         }, 
      }, 
      [21444] = 
      {
         Credits = 0, 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "&R A XT-4y Food Dispensor ", 
         NumberOfAttacks = 0, 
         Position = "standing", 
         DamRoll = 0, 
         DefaultPosition = "standing", 
         Level = 1, 
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
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         Race = "Human", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         LongDescr = "&R A XT-4y Food Dispensor sits here.\
", 
         Shop = 
         {
            KeeperShortDescr = "&R A XT-4y Food Dispensor ", 
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            ProfitBuy = 120, 
            ProfitSell = 90, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
         }, 
         Sex = "undistinguished", 
         Height = 0, 
         Name = "food dispensor", 
         Weight = 0, 
         ArmorClass = 0, 
         HitRoll = 0, 
         Vnum = 21444, 
         Damage = 
         {
            DamNoDice = 0, 
            DamPlus = 0, 
            DamSizeDice = 0, 
         }, 
      }, 
      [21436] = 
      {
         Credits = 0, 
         Alignment = 1000, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "A TK-71 cooking droid", 
         Resistant = 
         {
            [20] = "magic", 
            [13] = "nonmagic", 
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         NumberOfAttacks = 2, 
         Position = "standing", 
         LongDescr = "&C A TK-71 cooking droid stands behind the grill waiting.\
", 
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
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         DefaultPosition = "standing", 
         Level = 15, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 15, 
            HitPlus = 300, 
            HitNoDice = 15, 
         }, 
         Race = "Human", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         DamRoll = 0, 
         AffectedBy = 
         {
            [13] = "Protect", 
            [5] = "DetectHidden", 
         }, 
         Shop = 
         {
            KeeperShortDescr = "A TK-71 cooking droid", 
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            ProfitBuy = 120, 
            ProfitSell = 90, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
         }, 
         Sex = "male", 
         Weight = 0, 
         Name = "Cooking Droid", 
         Height = 0, 
         ArmorClass = 0, 
         HitRoll = 0, 
         Vnum = 21436, 
         Damage = 
         {
            DamNoDice = 1, 
            DamPlus = 10, 
            DamSizeDice = 4, 
         }, 
      }, 
      [21415] = 
      {
         Credits = 0, 
         Alignment = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         ShortDescr = "a newly created newbie mob", 
         NumberOfAttacks = 0, 
         Position = "standing", 
         DefaultPosition = "standing", 
         Level = 1, 
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
         Description = "", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         Race = "Human", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         LongDescr = "Some god abandoned a newly created newbie mob here.\
", 
         DamRoll = 0, 
         Sex = "undistinguished", 
         Height = 0, 
         Name = "newbie mob", 
         Weight = 0, 
         ArmorClass = 0, 
         HitRoll = 0, 
         Vnum = 21415, 
         Damage = 
         {
            DamNoDice = 0, 
            DamPlus = 0, 
            DamSizeDice = 0, 
         }, 
      }, 
      [21400] = 
      {
         Credits = 0, 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "Takiki, A Mon Calamarian police clerk", 
         SpecFuns = 
         {
            [1] = "spec_customs_weapons", 
            [0] = "spec_police", 
         }, 
         NumberOfAttacks = 0, 
         Position = "standing", 
         Height = 0, 
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
         DefaultPosition = "standing", 
         Level = 11, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         Description = "The Quarren are more commonly know as squidheads throughout the galaxy\
due to the shape of their heads. The come from the ocean world of Mon\
Calamari.\
", 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 110, 
            HitNoDice = 2, 
         }, 
         Race = "Human", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         VipFlags = 
         {
            [5] = "Mon Calamari", 
         }, 
         LongDescr = "Takiki, A Mon Calamarian police clerk\
", 
         DamRoll = 0, 
         Sex = "female", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "hi", 
               Code = "Say Hello how can I help you....well come on..\
", 
            }, 
            [2] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "crime killed prison free", 
               Code = "Say Sorry $n come back with someone who cares.\
", 
            }, 
            [3] = 
            {
               MudProgType = "all_greet_prog", 
               Arguments = "100", 
               Code = "mpecho As you enter the clerk looks up\
mpecho stares you down..\
laugh\
mpecho Then returns to work.\
", 
            }, 
         }, 
         Name = "takiki mon police clerk", 
         Weight = 0, 
         ArmorClass = 72, 
         HitRoll = 0, 
         Vnum = 21400, 
         Damage = 
         {
            DamNoDice = 1, 
            DamPlus = 2, 
            DamSizeDice = 4, 
         }, 
      }, 
   }, 
   Author = "Ackbar", 
   HighEconomy = 0, 
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
   VnumRanges = 
   {
      Object = 
      {
         First = 21000, 
         Last = 21435, 
      }, 
      Mob = 
      {
         First = 21000, 
         Last = 21499, 
      }, 
      Room = 
      {
         First = 21000, 
         Last = 21499, 
      }, 
   }, 
   LowEconomy = 187437350, 
   FileFormatVersion = 1, 
   Resets = 
   {
      [1] = 
      {
         Arg2 = 2, 
         Arg3 = 21003, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 21045, 
      }, 
      [2] = 
      {
         Arg2 = 1, 
         Arg3 = 21010, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 21055, 
      }, 
      [3] = 
      {
         Arg2 = 7, 
         Arg3 = 21012, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 21037, 
      }, 
      [4] = 
      {
         Arg2 = 1, 
         Arg3 = 8, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21061, 
      }, 
      [5] = 
      {
         Arg2 = 1, 
         Arg3 = 10, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21062, 
      }, 
      [6] = 
      {
         Arg2 = 1, 
         Arg3 = 9, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21063, 
      }, 
      [7] = 
      {
         Arg2 = 1, 
         Arg3 = 0, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21067, 
      }, 
      [8] = 
      {
         Arg2 = 1, 
         Arg3 = 16, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21069, 
      }, 
      [9] = 
      {
         Arg2 = 1, 
         Arg3 = 1, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21056, 
      }, 
      [10] = 
      {
         Arg2 = 1, 
         Arg3 = 5, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21058, 
      }, 
      [11] = 
      {
         Arg2 = 1, 
         Arg3 = 6, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21059, 
      }, 
      [12] = 
      {
         Arg2 = 1, 
         Arg3 = 7, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21060, 
      }, 
      [13] = 
      {
         Arg2 = 7, 
         Arg3 = 21018, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 21037, 
      }, 
      [14] = 
      {
         Arg2 = 1, 
         Arg3 = 1, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21056, 
      }, 
      [15] = 
      {
         Arg2 = 1, 
         Arg3 = 5, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21058, 
      }, 
      [16] = 
      {
         Arg2 = 1, 
         Arg3 = 6, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21059, 
      }, 
      [17] = 
      {
         Arg2 = 1, 
         Arg3 = 7, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21060, 
      }, 
      [18] = 
      {
         Arg2 = 1, 
         Arg3 = 8, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21061, 
      }, 
      [19] = 
      {
         Arg2 = 1, 
         Arg3 = 10, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21062, 
      }, 
      [20] = 
      {
         Arg2 = 1, 
         Arg3 = 9, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21063, 
      }, 
      [21] = 
      {
         Arg2 = 1, 
         Arg3 = 0, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21067, 
      }, 
      [22] = 
      {
         Arg2 = 1, 
         Arg3 = 16, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21069, 
      }, 
      [23] = 
      {
         Arg2 = 3, 
         Arg3 = 21026, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 21052, 
      }, 
      [24] = 
      {
         Arg2 = 7, 
         Arg3 = 21029, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 21037, 
      }, 
      [25] = 
      {
         Arg2 = 1, 
         Arg3 = 1, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21056, 
      }, 
      [26] = 
      {
         Arg2 = 1, 
         Arg3 = 5, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21058, 
      }, 
      [27] = 
      {
         Arg2 = 1, 
         Arg3 = 6, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21059, 
      }, 
      [28] = 
      {
         Arg2 = 1, 
         Arg3 = 7, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21060, 
      }, 
      [29] = 
      {
         Arg2 = 1, 
         Arg3 = 8, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21061, 
      }, 
      [30] = 
      {
         Arg2 = 1, 
         Arg3 = 10, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21062, 
      }, 
      [31] = 
      {
         Arg2 = 1, 
         Arg3 = 9, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21063, 
      }, 
      [32] = 
      {
         Arg2 = 1, 
         Arg3 = 0, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21067, 
      }, 
      [33] = 
      {
         Arg2 = 1, 
         Arg3 = 16, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21069, 
      }, 
      [34] = 
      {
         Arg2 = 2, 
         Arg3 = 21048, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 21045, 
      }, 
      [35] = 
      {
         Arg2 = 1, 
         Arg3 = 21053, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 21017, 
      }, 
      [36] = 
      {
         Arg2 = 1, 
         Arg3 = 21053, 
         Command = "O", 
         MiscData = 1, 
         Arg1 = 21048, 
      }, 
      [37] = 
      {
         Arg2 = 1, 
         Arg3 = 21053, 
         Command = "O", 
         MiscData = 1, 
         Arg1 = 38, 
      }, 
      [38] = 
      {
         Arg2 = 1, 
         Arg3 = 21055, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 21001, 
      }, 
      [39] = 
      {
         Arg1 = 21422, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [40] = 
      {
         Arg1 = 21423, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [41] = 
      {
         Arg1 = 21424, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [42] = 
      {
         Arg1 = 21425, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [43] = 
      {
         Arg2 = 1, 
         Arg3 = 21056, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 21011, 
      }, 
      [44] = 
      {
         Arg2 = 1, 
         Arg3 = 21057, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 21018, 
      }, 
      [45] = 
      {
         Arg1 = 21014, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [46] = 
      {
         Arg1 = 21015, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [47] = 
      {
         Arg1 = 21016, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [48] = 
      {
         Arg2 = 1, 
         Arg3 = 21058, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 21002, 
      }, 
      [49] = 
      {
         Arg2 = 1, 
         Arg3 = 21060, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 21019, 
      }, 
      [50] = 
      {
         Arg1 = 21020, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [51] = 
      {
         Arg1 = 21021, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [52] = 
      {
         Arg2 = 1, 
         Arg3 = 21061, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 21020, 
      }, 
      [53] = 
      {
         Arg1 = 21017, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [54] = 
      {
         Arg1 = 21018, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [55] = 
      {
         Arg1 = 21019, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [56] = 
      {
         Arg2 = 1, 
         Arg3 = 21062, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 21016, 
      }, 
      [57] = 
      {
         Arg1 = 21068, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [58] = 
      {
         Arg1 = 21069, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [59] = 
      {
         Arg1 = 21081, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [60] = 
      {
         Arg1 = 21082, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [61] = 
      {
         Arg2 = 7, 
         Arg3 = 21062, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 21037, 
      }, 
      [62] = 
      {
         Arg2 = 1, 
         Arg3 = 1, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21056, 
      }, 
      [63] = 
      {
         Arg2 = 1, 
         Arg3 = 5, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21058, 
      }, 
      [64] = 
      {
         Arg2 = 1, 
         Arg3 = 6, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21059, 
      }, 
      [65] = 
      {
         Arg2 = 1, 
         Arg3 = 7, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21060, 
      }, 
      [66] = 
      {
         Arg2 = 1, 
         Arg3 = 8, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21061, 
      }, 
      [67] = 
      {
         Arg2 = 1, 
         Arg3 = 10, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21062, 
      }, 
      [68] = 
      {
         Arg2 = 1, 
         Arg3 = 9, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21063, 
      }, 
      [69] = 
      {
         Arg2 = 1, 
         Arg3 = 0, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21067, 
      }, 
      [70] = 
      {
         Arg2 = 1, 
         Arg3 = 16, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21069, 
      }, 
      [71] = 
      {
         Arg2 = 1, 
         Arg3 = 21063, 
         Command = "O", 
         MiscData = 1, 
         Arg1 = 21055, 
      }, 
      [72] = 
      {
         Arg2 = 3, 
         Arg3 = 21064, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 21052, 
      }, 
      [73] = 
      {
         Arg2 = 3, 
         Arg3 = 21064, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 21052, 
      }, 
      [74] = 
      {
         Arg2 = 1, 
         Arg3 = 21064, 
         Command = "O", 
         MiscData = 1, 
         Arg1 = 21055, 
      }, 
      [75] = 
      {
         Arg2 = 1, 
         Arg3 = 21065, 
         Command = "O", 
         MiscData = 1, 
         Arg1 = 21055, 
      }, 
      [76] = 
      {
         Arg2 = 4, 
         Arg3 = 21080, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 21061, 
      }, 
      [77] = 
      {
         Arg2 = 1, 
         Arg3 = 1, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21056, 
      }, 
      [78] = 
      {
         Arg2 = 1, 
         Arg3 = 3, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21057, 
      }, 
      [79] = 
      {
         Arg2 = 1, 
         Arg3 = 5, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21058, 
      }, 
      [80] = 
      {
         Arg2 = 1, 
         Arg3 = 6, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21059, 
      }, 
      [81] = 
      {
         Arg2 = 1, 
         Arg3 = 7, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21060, 
      }, 
      [82] = 
      {
         Arg2 = 1, 
         Arg3 = 8, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21061, 
      }, 
      [83] = 
      {
         Arg2 = 1, 
         Arg3 = 10, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21062, 
      }, 
      [84] = 
      {
         Arg2 = 1, 
         Arg3 = 9, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21063, 
      }, 
      [85] = 
      {
         Arg2 = 1, 
         Arg3 = 15, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21064, 
      }, 
      [86] = 
      {
         Arg2 = 1, 
         Arg3 = 11, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21065, 
      }, 
      [87] = 
      {
         Arg2 = 1, 
         Arg3 = 20, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21066, 
      }, 
      [88] = 
      {
         Arg2 = 1, 
         Arg3 = 0, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21067, 
      }, 
      [89] = 
      {
         Arg2 = 1, 
         Arg3 = 14, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21064, 
      }, 
      [90] = 
      {
         Arg2 = 1, 
         Arg3 = 16, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21069, 
      }, 
      [91] = 
      {
         Arg2 = 1, 
         Arg3 = 21087, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 21063, 
      }, 
      [92] = 
      {
         Arg2 = 1, 
         Arg3 = 1, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21056, 
      }, 
      [93] = 
      {
         Arg2 = 1, 
         Arg3 = 3, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21057, 
      }, 
      [94] = 
      {
         Arg2 = 1, 
         Arg3 = 5, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21058, 
      }, 
      [95] = 
      {
         Arg2 = 1, 
         Arg3 = 6, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21059, 
      }, 
      [96] = 
      {
         Arg2 = 1, 
         Arg3 = 7, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21060, 
      }, 
      [97] = 
      {
         Arg2 = 1, 
         Arg3 = 8, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21061, 
      }, 
      [98] = 
      {
         Arg2 = 1, 
         Arg3 = 10, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21062, 
      }, 
      [99] = 
      {
         Arg2 = 1, 
         Arg3 = 9, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21063, 
      }, 
      [100] = 
      {
         Arg2 = 1, 
         Arg3 = 14, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21064, 
      }, 
      [101] = 
      {
         Arg2 = 1, 
         Arg3 = 15, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21064, 
      }, 
      [102] = 
      {
         Arg2 = 1, 
         Arg3 = 11, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21065, 
      }, 
      [103] = 
      {
         Arg2 = 1, 
         Arg3 = 20, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21066, 
      }, 
      [104] = 
      {
         Arg2 = 1, 
         Arg3 = 0, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21067, 
      }, 
      [105] = 
      {
         Arg2 = 1, 
         Arg3 = 16, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21069, 
      }, 
      [106] = 
      {
         Arg2 = 1, 
         Arg3 = 17, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21070, 
      }, 
      [107] = 
      {
         Arg2 = 1, 
         Arg3 = 0, 
         Command = "D", 
         MiscData = 0, 
         Arg1 = 21087, 
      }, 
      [108] = 
      {
         Arg2 = 1, 
         Arg3 = 21088, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 21062, 
      }, 
      [109] = 
      {
         Arg2 = 1, 
         Arg3 = 17, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21070, 
      }, 
      [110] = 
      {
         Arg2 = 1, 
         Arg3 = 1, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21056, 
      }, 
      [111] = 
      {
         Arg2 = 1, 
         Arg3 = 3, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21057, 
      }, 
      [112] = 
      {
         Arg2 = 1, 
         Arg3 = 5, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21058, 
      }, 
      [113] = 
      {
         Arg2 = 1, 
         Arg3 = 6, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21059, 
      }, 
      [114] = 
      {
         Arg2 = 1, 
         Arg3 = 7, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21060, 
      }, 
      [115] = 
      {
         Arg2 = 1, 
         Arg3 = 8, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21061, 
      }, 
      [116] = 
      {
         Arg2 = 1, 
         Arg3 = 10, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21062, 
      }, 
      [117] = 
      {
         Arg2 = 1, 
         Arg3 = 9, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21063, 
      }, 
      [118] = 
      {
         Arg2 = 1, 
         Arg3 = 14, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21064, 
      }, 
      [119] = 
      {
         Arg2 = 1, 
         Arg3 = 20, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21066, 
      }, 
      [120] = 
      {
         Arg2 = 1, 
         Arg3 = 16, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21069, 
      }, 
      [121] = 
      {
         Arg2 = 1, 
         Arg3 = 0, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21067, 
      }, 
      [122] = 
      {
         Arg2 = 3, 
         Arg3 = 0, 
         Command = "D", 
         MiscData = 0, 
         Arg1 = 21088, 
      }, 
      [123] = 
      {
         Arg2 = 1, 
         Arg3 = 21099, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 21065, 
      }, 
      [124] = 
      {
         Arg2 = 1, 
         Arg3 = 17, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21071, 
      }, 
      [125] = 
      {
         Arg2 = 1, 
         Arg3 = 1, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21056, 
      }, 
      [126] = 
      {
         Arg2 = 1, 
         Arg3 = 3, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21057, 
      }, 
      [127] = 
      {
         Arg2 = 1, 
         Arg3 = 5, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21058, 
      }, 
      [128] = 
      {
         Arg2 = 1, 
         Arg3 = 6, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21059, 
      }, 
      [129] = 
      {
         Arg2 = 1, 
         Arg3 = 7, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21060, 
      }, 
      [130] = 
      {
         Arg2 = 1, 
         Arg3 = 8, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21061, 
      }, 
      [131] = 
      {
         Arg2 = 1, 
         Arg3 = 10, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21062, 
      }, 
      [132] = 
      {
         Arg2 = 1, 
         Arg3 = 9, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21063, 
      }, 
      [133] = 
      {
         Arg2 = 1, 
         Arg3 = 14, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21064, 
      }, 
      [134] = 
      {
         Arg2 = 1, 
         Arg3 = 20, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21066, 
      }, 
      [135] = 
      {
         Arg2 = 1, 
         Arg3 = 0, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21067, 
      }, 
      [136] = 
      {
         Arg2 = 1, 
         Arg3 = 16, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21069, 
      }, 
      [137] = 
      {
         Arg2 = 1, 
         Arg3 = 11, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21065, 
      }, 
      [138] = 
      {
         Arg2 = 1, 
         Arg3 = 15, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21064, 
      }, 
      [139] = 
      {
         Arg2 = 2, 
         Arg3 = 0, 
         Command = "D", 
         MiscData = 0, 
         Arg1 = 21099, 
      }, 
      [140] = 
      {
         Arg2 = 1, 
         Arg3 = 21112, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 21067, 
      }, 
      [141] = 
      {
         Arg2 = 1, 
         Arg3 = 17, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21072, 
      }, 
      [142] = 
      {
         Arg2 = 1, 
         Arg3 = 11, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21065, 
      }, 
      [143] = 
      {
         Arg2 = 1, 
         Arg3 = 14, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21064, 
      }, 
      [144] = 
      {
         Arg2 = 1, 
         Arg3 = 1, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21056, 
      }, 
      [145] = 
      {
         Arg2 = 1, 
         Arg3 = 3, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21057, 
      }, 
      [146] = 
      {
         Arg2 = 1, 
         Arg3 = 5, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21058, 
      }, 
      [147] = 
      {
         Arg2 = 1, 
         Arg3 = 6, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21059, 
      }, 
      [148] = 
      {
         Arg2 = 1, 
         Arg3 = 7, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21060, 
      }, 
      [149] = 
      {
         Arg2 = 1, 
         Arg3 = 8, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21061, 
      }, 
      [150] = 
      {
         Arg2 = 1, 
         Arg3 = 10, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21062, 
      }, 
      [151] = 
      {
         Arg2 = 1, 
         Arg3 = 9, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21063, 
      }, 
      [152] = 
      {
         Arg2 = 1, 
         Arg3 = 15, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21064, 
      }, 
      [153] = 
      {
         Arg2 = 1, 
         Arg3 = 20, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21066, 
      }, 
      [154] = 
      {
         Arg2 = 1, 
         Arg3 = 0, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21067, 
      }, 
      [155] = 
      {
         Arg2 = 1, 
         Arg3 = 16, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21069, 
      }, 
      [156] = 
      {
         Arg2 = 3, 
         Arg3 = 0, 
         Command = "D", 
         MiscData = 0, 
         Arg1 = 21112, 
      }, 
      [157] = 
      {
         Arg2 = 1, 
         Arg3 = 21054, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 21003, 
      }, 
      [158] = 
      {
         Arg1 = 32230, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [159] = 
      {
         Arg1 = 10487, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [160] = 
      {
         Arg2 = 7, 
         Arg3 = 21054, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 21037, 
      }, 
      [161] = 
      {
         Arg2 = 1, 
         Arg3 = 1, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21056, 
      }, 
      [162] = 
      {
         Arg2 = 1, 
         Arg3 = 5, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21058, 
      }, 
      [163] = 
      {
         Arg2 = 1, 
         Arg3 = 6, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21059, 
      }, 
      [164] = 
      {
         Arg2 = 1, 
         Arg3 = 7, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21060, 
      }, 
      [165] = 
      {
         Arg2 = 1, 
         Arg3 = 8, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21061, 
      }, 
      [166] = 
      {
         Arg2 = 1, 
         Arg3 = 10, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21062, 
      }, 
      [167] = 
      {
         Arg2 = 1, 
         Arg3 = 9, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21063, 
      }, 
      [168] = 
      {
         Arg2 = 1, 
         Arg3 = 0, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21067, 
      }, 
      [169] = 
      {
         Arg2 = 1, 
         Arg3 = 16, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21069, 
      }, 
      [170] = 
      {
         Arg2 = 1, 
         Arg3 = 21075, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 21069, 
      }, 
      [171] = 
      {
         Arg2 = 1, 
         Arg3 = 1, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21056, 
      }, 
      [172] = 
      {
         Arg2 = 1, 
         Arg3 = 3, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21057, 
      }, 
      [173] = 
      {
         Arg2 = 1, 
         Arg3 = 5, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21058, 
      }, 
      [174] = 
      {
         Arg2 = 1, 
         Arg3 = 6, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21059, 
      }, 
      [175] = 
      {
         Arg2 = 1, 
         Arg3 = 7, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21060, 
      }, 
      [176] = 
      {
         Arg2 = 1, 
         Arg3 = 8, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21061, 
      }, 
      [177] = 
      {
         Arg2 = 1, 
         Arg3 = 10, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21062, 
      }, 
      [178] = 
      {
         Arg2 = 1, 
         Arg3 = 9, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21063, 
      }, 
      [179] = 
      {
         Arg2 = 1, 
         Arg3 = 14, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21064, 
      }, 
      [180] = 
      {
         Arg2 = 1, 
         Arg3 = 20, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21066, 
      }, 
      [181] = 
      {
         Arg2 = 1, 
         Arg3 = 0, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21067, 
      }, 
      [182] = 
      {
         Arg2 = 1, 
         Arg3 = 16, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21069, 
      }, 
      [183] = 
      {
         Arg2 = 1, 
         Arg3 = 17, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21073, 
      }, 
      [184] = 
      {
         Arg2 = 1, 
         Arg3 = 15, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21064, 
      }, 
      [185] = 
      {
         Arg2 = 1, 
         Arg3 = 11, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21065, 
      }, 
      [186] = 
      {
         Arg2 = 1, 
         Arg3 = 21075, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 21059, 
      }, 
      [187] = 
      {
         Arg2 = 0, 
         Arg3 = 0, 
         Command = "D", 
         MiscData = 0, 
         Arg1 = 21075, 
      }, 
      [188] = 
      {
         Arg2 = 2, 
         Arg3 = 21119, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 21059, 
      }, 
      [189] = 
      {
         Arg2 = 4, 
         Arg3 = 21114, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 21061, 
      }, 
      [190] = 
      {
         Arg2 = 1, 
         Arg3 = 0, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21067, 
      }, 
      [191] = 
      {
         Arg2 = 1, 
         Arg3 = 1, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21056, 
      }, 
      [192] = 
      {
         Arg2 = 1, 
         Arg3 = 3, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21057, 
      }, 
      [193] = 
      {
         Arg2 = 1, 
         Arg3 = 5, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21058, 
      }, 
      [194] = 
      {
         Arg2 = 1, 
         Arg3 = 6, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21059, 
      }, 
      [195] = 
      {
         Arg2 = 1, 
         Arg3 = 7, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21060, 
      }, 
      [196] = 
      {
         Arg2 = 1, 
         Arg3 = 8, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21061, 
      }, 
      [197] = 
      {
         Arg2 = 1, 
         Arg3 = 10, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21062, 
      }, 
      [198] = 
      {
         Arg2 = 1, 
         Arg3 = 9, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21063, 
      }, 
      [199] = 
      {
         Arg2 = 1, 
         Arg3 = 14, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21064, 
      }, 
      [200] = 
      {
         Arg2 = 1, 
         Arg3 = 15, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21064, 
      }, 
      [201] = 
      {
         Arg2 = 1, 
         Arg3 = 11, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21065, 
      }, 
      [202] = 
      {
         Arg2 = 1, 
         Arg3 = 20, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21066, 
      }, 
      [203] = 
      {
         Arg2 = 1, 
         Arg3 = 16, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21069, 
      }, 
      [204] = 
      {
         Arg1 = 21056, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [205] = 
      {
         Arg1 = 21058, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [206] = 
      {
         Arg1 = 21059, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [207] = 
      {
         Arg1 = 21060, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [208] = 
      {
         Arg1 = 21061, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [209] = 
      {
         Arg1 = 21062, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [210] = 
      {
         Arg1 = 21063, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [211] = 
      {
         Arg1 = 21066, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [212] = 
      {
         Arg1 = 21067, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [213] = 
      {
         Arg1 = 21068, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [214] = 
      {
         Arg1 = 21058, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [215] = 
      {
         Arg1 = 21062, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [216] = 
      {
         Arg1 = 21068, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [217] = 
      {
         Arg1 = 21057, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [218] = 
      {
         Arg1 = 21060, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [219] = 
      {
         Arg1 = 21061, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [220] = 
      {
         Arg1 = 21064, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [221] = 
      {
         Arg1 = 21068, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [222] = 
      {
         Arg1 = 21063, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [223] = 
      {
         Arg1 = 21068, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [224] = 
      {
         Arg1 = 21067, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [225] = 
      {
         Arg1 = 21068, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [226] = 
      {
         Arg1 = 21068, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [227] = 
      {
         Arg1 = 21057, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [228] = 
      {
         Arg1 = 21068, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [229] = 
      {
         Arg1 = 21064, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [230] = 
      {
         Arg1 = 21068, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [231] = 
      {
         Arg1 = 21022, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [232] = 
      {
         Arg1 = 21019, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [233] = 
      {
         Arg1 = 21020, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [234] = 
      {
         Arg1 = 10317, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [235] = 
      {
         Arg1 = 10312, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [236] = 
      {
         Arg1 = 10424, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [237] = 
      {
         Arg2 = 3, 
         Arg3 = 21114, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 21059, 
      }, 
      [238] = 
      {
         Arg2 = 4, 
         Arg3 = 21106, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 21059, 
      }, 
      [239] = 
      {
         Arg2 = 5, 
         Arg3 = 21094, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 21059, 
      }, 
      [240] = 
      {
         Arg2 = 6, 
         Arg3 = 21089, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 21059, 
      }, 
      [241] = 
      {
         Arg2 = 1, 
         Arg3 = 21129, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 21435, 
      }, 
      [242] = 
      {
         Arg1 = 32254, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [243] = 
      {
         Arg2 = 1, 
         Arg3 = 21071, 
         Command = "O", 
         MiscData = 1, 
         Arg1 = 32231, 
      }, 
      [244] = 
      {
         Arg2 = 1, 
         Arg3 = 21100, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 21064, 
      }, 
      [245] = 
      {
         Arg2 = 1, 
         Arg3 = 1, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21056, 
      }, 
      [246] = 
      {
         Arg2 = 1, 
         Arg3 = 3, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21057, 
      }, 
      [247] = 
      {
         Arg2 = 1, 
         Arg3 = 5, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21058, 
      }, 
      [248] = 
      {
         Arg2 = 1, 
         Arg3 = 6, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21059, 
      }, 
      [249] = 
      {
         Arg2 = 1, 
         Arg3 = 7, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21060, 
      }, 
      [250] = 
      {
         Arg2 = 1, 
         Arg3 = 8, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21061, 
      }, 
      [251] = 
      {
         Arg2 = 1, 
         Arg3 = 10, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21062, 
      }, 
      [252] = 
      {
         Arg2 = 1, 
         Arg3 = 9, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21063, 
      }, 
      [253] = 
      {
         Arg2 = 1, 
         Arg3 = 14, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21064, 
      }, 
      [254] = 
      {
         Arg2 = 1, 
         Arg3 = 20, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21066, 
      }, 
      [255] = 
      {
         Arg2 = 1, 
         Arg3 = 0, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21067, 
      }, 
      [256] = 
      {
         Arg2 = 1, 
         Arg3 = 16, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21069, 
      }, 
      [257] = 
      {
         Arg2 = 1, 
         Arg3 = 17, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21071, 
      }, 
      [258] = 
      {
         Arg2 = 1, 
         Arg3 = 21100, 
         Command = "O", 
         MiscData = 1, 
         Arg1 = 21421, 
      }, 
      [259] = 
      {
         Arg2 = 0, 
         Arg3 = 0, 
         Command = "D", 
         MiscData = 0, 
         Arg1 = 21100, 
      }, 
      [260] = 
      {
         Arg2 = 1, 
         Arg3 = 21074, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 21068, 
      }, 
      [261] = 
      {
         Arg2 = 1, 
         Arg3 = 17, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21073, 
      }, 
      [262] = 
      {
         Arg2 = 1, 
         Arg3 = 1, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21056, 
      }, 
      [263] = 
      {
         Arg2 = 1, 
         Arg3 = 3, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21057, 
      }, 
      [264] = 
      {
         Arg2 = 1, 
         Arg3 = 5, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21058, 
      }, 
      [265] = 
      {
         Arg2 = 1, 
         Arg3 = 6, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21059, 
      }, 
      [266] = 
      {
         Arg2 = 1, 
         Arg3 = 7, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21060, 
      }, 
      [267] = 
      {
         Arg2 = 1, 
         Arg3 = 8, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21061, 
      }, 
      [268] = 
      {
         Arg2 = 1, 
         Arg3 = 10, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21062, 
      }, 
      [269] = 
      {
         Arg2 = 1, 
         Arg3 = 9, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21063, 
      }, 
      [270] = 
      {
         Arg2 = 1, 
         Arg3 = 14, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21064, 
      }, 
      [271] = 
      {
         Arg2 = 1, 
         Arg3 = 20, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21066, 
      }, 
      [272] = 
      {
         Arg2 = 1, 
         Arg3 = 0, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21067, 
      }, 
      [273] = 
      {
         Arg2 = 1, 
         Arg3 = 16, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21069, 
      }, 
      [274] = 
      {
         Arg2 = 2, 
         Arg3 = 0, 
         Command = "D", 
         MiscData = 0, 
         Arg1 = 21074, 
      }, 
      [275] = 
      {
         Arg2 = 1, 
         Arg3 = 21052, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 21014, 
      }, 
      [276] = 
      {
         Arg1 = 21094, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [277] = 
      {
         Arg1 = 21056, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [278] = 
      {
         Arg2 = 1, 
         Arg3 = 21128, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 21444, 
      }, 
      [279] = 
      {
         Arg1 = 6824, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [280] = 
      {
         Arg1 = 32283, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [281] = 
      {
         Arg2 = 1, 
         Arg3 = 21113, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 21066, 
      }, 
      [282] = 
      {
         Arg2 = 1, 
         Arg3 = 1, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21056, 
      }, 
      [283] = 
      {
         Arg2 = 1, 
         Arg3 = 3, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21057, 
      }, 
      [284] = 
      {
         Arg2 = 1, 
         Arg3 = 5, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21058, 
      }, 
      [285] = 
      {
         Arg2 = 1, 
         Arg3 = 6, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21059, 
      }, 
      [286] = 
      {
         Arg2 = 1, 
         Arg3 = 7, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21060, 
      }, 
      [287] = 
      {
         Arg2 = 1, 
         Arg3 = 8, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21061, 
      }, 
      [288] = 
      {
         Arg2 = 1, 
         Arg3 = 10, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21062, 
      }, 
      [289] = 
      {
         Arg2 = 1, 
         Arg3 = 9, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21063, 
      }, 
      [290] = 
      {
         Arg2 = 1, 
         Arg3 = 14, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21064, 
      }, 
      [291] = 
      {
         Arg2 = 1, 
         Arg3 = 20, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21066, 
      }, 
      [292] = 
      {
         Arg2 = 1, 
         Arg3 = 0, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21067, 
      }, 
      [293] = 
      {
         Arg2 = 1, 
         Arg3 = 16, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21069, 
      }, 
      [294] = 
      {
         Arg2 = 1, 
         Arg3 = 17, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21072, 
      }, 
      [295] = 
      {
         Arg2 = 1, 
         Arg3 = 0, 
         Command = "D", 
         MiscData = 0, 
         Arg1 = 21113, 
      }, 
      [296] = 
      {
         Arg2 = 1, 
         Arg3 = 21072, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 21436, 
      }, 
      [297] = 
      {
         Arg1 = 6814, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [298] = 
      {
         Arg1 = 6824, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [299] = 
      {
         Arg1 = 6822, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [300] = 
      {
         Arg1 = 6825, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [301] = 
      {
         Arg1 = 21133, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [302] = 
      {
         Arg2 = 1, 
         Arg3 = 21072, 
         Command = "O", 
         MiscData = 1, 
         Arg1 = 32208, 
      }, 
      [303] = 
      {
         Arg2 = 7, 
         Arg3 = 21135, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 21059, 
      }, 
      [304] = 
      {
         Arg2 = 1, 
         Arg3 = 21135, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 21060, 
      }, 
      [305] = 
      {
         Arg2 = 2, 
         Arg3 = 21134, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 21447, 
      }, 
      [306] = 
      {
         Arg2 = 2, 
         Arg3 = 21134, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 21446, 
      }, 
      [307] = 
      {
         Arg2 = 2, 
         Arg3 = 21134, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 21446, 
      }, 
      [308] = 
      {
         Arg2 = 2, 
         Arg3 = 21134, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 21447, 
      }, 
      [309] = 
      {
         Arg2 = 3, 
         Arg3 = 21137, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 21446, 
      }, 
      [310] = 
      {
         Arg2 = 3, 
         Arg3 = 21137, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 21447, 
      }, 
      [311] = 
      {
         Arg2 = 4, 
         Arg3 = 21136, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 21446, 
      }, 
      [312] = 
      {
         Arg2 = 4, 
         Arg3 = 21136, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 21447, 
      }, 
      [313] = 
      {
         Arg2 = 8, 
         Arg3 = 21007, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 21037, 
      }, 
      [314] = 
      {
         Arg2 = 9, 
         Arg3 = 21011, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 21037, 
      }, 
      [315] = 
      {
         Arg2 = 10, 
         Arg3 = 21015, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 21037, 
      }, 
      [316] = 
      {
         Arg2 = 11, 
         Arg3 = 21021, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 21037, 
      }, 
      [317] = 
      {
         Arg2 = 12, 
         Arg3 = 21027, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 21037, 
      }, 
      [318] = 
      {
         Arg2 = 13, 
         Arg3 = 21032, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 21037, 
      }, 
      [319] = 
      {
         Arg2 = 14, 
         Arg3 = 21001, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 21037, 
      }, 
      [320] = 
      {
         Arg2 = 1, 
         Arg3 = 21059, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 21015, 
      }, 
      [321] = 
      {
         Arg1 = 21057, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [322] = 
      {
         Arg1 = 21058, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [323] = 
      {
         Arg1 = 21059, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [324] = 
      {
         Arg1 = 21060, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [325] = 
      {
         Arg1 = 29008, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [326] = 
      {
         Arg1 = 21062, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [327] = 
      {
         Arg1 = 21063, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [328] = 
      {
         Arg1 = 21064, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [329] = 
      {
         Arg1 = 21065, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [330] = 
      {
         Arg1 = 21066, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [331] = 
      {
         Arg1 = 29007, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [332] = 
      {
         Arg1 = 21061, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [333] = 
      {
         Arg1 = 29006, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [334] = 
      {
         Arg1 = 21426, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [335] = 
      {
         Arg1 = 10311, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [336] = 
      {
         Arg2 = 1, 
         Arg3 = 21138, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 21448, 
      }, 
      [337] = 
      {
         Arg2 = 1, 
         Arg3 = 21150, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 21433, 
      }, 
      [338] = 
      {
         Arg2 = 1, 
         Arg3 = 21150, 
         Command = "O", 
         MiscData = 1, 
         Arg1 = 21427, 
      }, 
      [339] = 
      {
         Arg2 = 12, 
         Arg3 = 21145, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 21037, 
      }, 
      [340] = 
      {
         Arg2 = 1, 
         Arg3 = 21000, 
         Command = "O", 
         MiscData = 1, 
         Arg1 = 21114, 
      }, 
      [341] = 
      {
         Arg2 = 1, 
         Arg3 = 21148, 
         Command = "O", 
         MiscData = 1, 
         Arg1 = 21115, 
      }, 
      [342] = 
      {
         Arg2 = 1, 
         Arg3 = 21148, 
         Command = "O", 
         MiscData = 1, 
         Arg1 = 21116, 
      }, 
      [343] = 
      {
         Arg2 = 3, 
         Arg3 = 2, 
         Command = "D", 
         MiscData = 0, 
         Arg1 = 21148, 
      }, 
      [344] = 
      {
         Arg2 = 1, 
         Arg3 = 2, 
         Command = "D", 
         MiscData = 0, 
         Arg1 = 21141, 
      }, 
      [345] = 
      {
         Arg2 = 8, 
         Arg3 = 2, 
         Command = "D", 
         MiscData = 0, 
         Arg1 = 21140, 
      }, 
      [346] = 
      {
         Arg2 = 1, 
         Arg3 = 21149, 
         Command = "O", 
         MiscData = 1, 
         Arg1 = 21116, 
      }, 
      [347] = 
      {
         Arg2 = 1, 
         Arg3 = 21149, 
         Command = "O", 
         MiscData = 1, 
         Arg1 = 21115, 
      }, 
      [348] = 
      {
         Arg2 = 7, 
         Arg3 = 2, 
         Command = "D", 
         MiscData = 0, 
         Arg1 = 21149, 
      }, 
      [349] = 
      {
         Arg2 = 1, 
         Arg3 = 2, 
         Command = "D", 
         MiscData = 0, 
         Arg1 = 21139, 
      }, 
      [350] = 
      {
         Arg2 = 2, 
         Arg3 = 2, 
         Command = "D", 
         MiscData = 0, 
         Arg1 = 21142, 
      }, 
      [351] = 
      {
         Arg2 = 0, 
         Arg3 = 2, 
         Command = "D", 
         MiscData = 0, 
         Arg1 = 21143, 
      }, 
      [352] = 
      {
         Arg2 = 1, 
         Arg3 = 21144, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 21438, 
      }, 
      [353] = 
      {
         Arg2 = 1, 
         Arg3 = 17, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21140, 
      }, 
      [354] = 
      {
         Arg2 = 1, 
         Arg3 = 21146, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 21081, 
      }, 
      [355] = 
      {
         Arg2 = 1, 
         Arg3 = 21146, 
         Command = "O", 
         MiscData = 1, 
         Arg1 = 21115, 
      }, 
      [356] = 
      {
         Arg2 = 1, 
         Arg3 = 21146, 
         Command = "O", 
         MiscData = 1, 
         Arg1 = 21116, 
      }, 
      [357] = 
      {
         Arg2 = 2, 
         Arg3 = 2, 
         Command = "D", 
         MiscData = 0, 
         Arg1 = 21146, 
      }, 
      [358] = 
      {
         Arg2 = 0, 
         Arg3 = 1, 
         Command = "D", 
         MiscData = 0, 
         Arg1 = 21073, 
      }, 
      [359] = 
      {
         Arg2 = 1, 
         Arg3 = 21147, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 21082, 
      }, 
      [360] = 
      {
         Arg2 = 1, 
         Arg3 = 5, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21117, 
      }, 
      [361] = 
      {
         Arg2 = 1, 
         Arg3 = 6, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 28015, 
      }, 
      [362] = 
      {
         Arg2 = 1, 
         Arg3 = 8, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 21118, 
      }, 
      [363] = 
      {
         Arg2 = 1, 
         Arg3 = 21147, 
         Command = "O", 
         MiscData = 1, 
         Arg1 = 21115, 
      }, 
      [364] = 
      {
         Arg2 = 1, 
         Arg3 = 21147, 
         Command = "O", 
         MiscData = 1, 
         Arg1 = 21116, 
      }, 
      [365] = 
      {
         Arg2 = 0, 
         Arg3 = 2, 
         Command = "D", 
         MiscData = 0, 
         Arg1 = 21147, 
      }, 
      [366] = 
      {
         Arg2 = 1, 
         Arg3 = 21132, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 21400, 
      }, 
      [367] = 
      {
         Arg1 = 21069, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [368] = 
      {
         Arg2 = 2, 
         Arg3 = 1, 
         Command = "D", 
         MiscData = 0, 
         Arg1 = 21132, 
      }, 
      [369] = 
      {
         Arg2 = 3, 
         Arg3 = 21067, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 21058, 
      }, 
      [370] = 
      {
         Arg2 = 1, 
         Arg3 = 21067, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 21057, 
      }, 
      [371] = 
      {
         Arg2 = 1, 
         Arg3 = 21067, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 21437, 
      }, 
      [372] = 
      {
         Arg2 = 1, 
         Arg3 = 16, 
         Command = "E", 
         MiscData = 1, 
         Arg1 = 60, 
      }, 
      [373] = 
      {
         Arg2 = 3, 
         Arg3 = 21067, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 21058, 
      }, 
      [374] = 
      {
         Arg2 = 3, 
         Arg3 = 21067, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 21058, 
      }, 
      [375] = 
      {
         Arg2 = 1, 
         Arg3 = 21130, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 21083, 
      }, 
      [376] = 
      {
         Arg2 = 1, 
         Arg3 = 1, 
         Command = "D", 
         MiscData = 0, 
         Arg1 = 21130, 
      }, 
      [377] = 
      {
         Arg2 = 2, 
         Arg3 = 1, 
         Command = "D", 
         MiscData = 0, 
         Arg1 = 21126, 
      }, 
      [378] = 
      {
         Arg2 = 1, 
         Arg3 = 21127, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 21434, 
      }, 
      [379] = 
      {
         Arg2 = 0, 
         Arg3 = 1, 
         Command = "D", 
         MiscData = 0, 
         Arg1 = 21127, 
      }, 
      [380] = 
      {
         Arg2 = 2, 
         Arg3 = 1, 
         Command = "D", 
         MiscData = 0, 
         Arg1 = 21040, 
      }, 
      [381] = 
      {
         Arg2 = 1, 
         Arg3 = 21069, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 21025, 
      }, 
      [382] = 
      {
         Arg2 = 0, 
         Arg3 = 1, 
         Command = "D", 
         MiscData = 0, 
         Arg1 = 21069, 
      }, 
      [383] = 
      {
         Arg2 = 1, 
         Arg3 = 21068, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 21013, 
      }, 
      [384] = 
      {
         Arg1 = 21009, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [385] = 
      {
         Arg1 = 21008, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [386] = 
      {
         Arg1 = 21010, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [387] = 
      {
         Arg2 = 1, 
         Arg3 = 21068, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 21445, 
      }, 
      [388] = 
      {
         Arg2 = 0, 
         Arg3 = 1, 
         Command = "D", 
         MiscData = 0, 
         Arg1 = 21068, 
      }, 
      [389] = 
      {
         Arg2 = 2, 
         Arg3 = 1, 
         Command = "D", 
         MiscData = 0, 
         Arg1 = 21041, 
      }, 
      [390] = 
      {
         Arg2 = 0, 
         Arg3 = 1, 
         Command = "D", 
         MiscData = 0, 
         Arg1 = 21022, 
      }, 
      [391] = 
      {
         Arg2 = 1, 
         Arg3 = 21066, 
         Command = "M", 
         MiscData = 1, 
         Arg1 = 21021, 
      }, 
      [392] = 
      {
         Arg1 = 21076, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [393] = 
      {
         Arg1 = 21077, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [394] = 
      {
         Arg1 = 21078, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [395] = 
      {
         Arg1 = 21079, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [396] = 
      {
         Arg1 = 21080, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [397] = 
      {
         Arg2 = 2, 
         Arg3 = 1, 
         Command = "D", 
         MiscData = 0, 
         Arg1 = 21066, 
      }, 
      [398] = 
      {
         Arg2 = 5, 
         Arg3 = 0, 
         Command = "D", 
         MiscData = 0, 
         Arg1 = 21066, 
      }, 
      [399] = 
      {
         Arg2 = 1, 
         Arg3 = 1, 
         Command = "D", 
         MiscData = 0, 
         Arg1 = 21180, 
      }, 
      [400] = 
      {
         Arg2 = 3, 
         Arg3 = 1, 
         Command = "D", 
         MiscData = 0, 
         Arg1 = 21184, 
      }, 
      [401] = 
      {
         Arg2 = 1, 
         Arg3 = 1, 
         Command = "D", 
         MiscData = 0, 
         Arg1 = 21183, 
      }, 
      [402] = 
      {
         Arg2 = 1, 
         Arg3 = 21187, 
         Command = "O", 
         MiscData = 1, 
         Arg1 = 21435, 
      }, 
   }, 
   ResetFrequency = 0, 
   Name = "Mon Calamri", 
   Objects = 
   {
      [21000] = 
      {
         Description = "A glowing violet potion has been carelessly left here.", 
         Flags = 
         {
            [0] = "Glow", 
            [6] = "Magic", 
            [8] = "Bless", 
         }, 
         ShortDescr = "a glowing violet potion", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "Textures of both deep red and pale purple swirl together inside the vial.\
\13", 
               Keyword = "violet", 
            }, 
         }, 
         Cost = 61000, 
         ObjectValues = 
         {
            [1] = 28, 
            [2] = -1, 
            [3] = -1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 25, 
         }, 
         Weight = 2, 
         Name = "potion violet glowing", 
         ItemType = "potion", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 21000, 
         Layers = 0, 
      }, 
      [21001] = 
      {
         Description = "A glowing purple potion has been carelessly left here.", 
         Flags = 
         {
            [0] = "Glow", 
            [6] = "Magic", 
         }, 
         ShortDescr = "a glowing purple potion", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 6500, 
         ObjectValues = 
         {
            [1] = 15, 
            [2] = -1, 
            [3] = -1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 25, 
         }, 
         Weight = 2, 
         Name = "potion purple glowing", 
         ItemType = "potion", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 21001, 
         Layers = 0, 
      }, 
      [21002] = 
      {
         Description = "A glowing puce potion has been carelessly left here.", 
         Flags = 
         {
            [0] = "Glow", 
            [6] = "Magic", 
         }, 
         ShortDescr = "a glowing puce potion", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 2400, 
         ObjectValues = 
         {
            [1] = 61, 
            [2] = -1, 
            [3] = -1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         Weight = 2, 
         Name = "puce potion glowing", 
         ItemType = "potion", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 21002, 
         Layers = 0, 
      }, 
      [21003] = 
      {
         Description = "A glowing maroon potion has been carelessly left here.", 
         Flags = 
         {
            [0] = "Glow", 
            [6] = "Magic", 
         }, 
         ShortDescr = "a glowing maroon potion", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 750, 
         ObjectValues = 
         {
            [1] = 16, 
            [2] = -1, 
            [3] = -1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 1, 
         }, 
         Weight = 2, 
         Name = "potion maroon glowing", 
         ItemType = "potion", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 21003, 
         Layers = 0, 
      }, 
      [21004] = 
      {
         Description = "A glowing blue potion has been carelessly left here.", 
         Flags = 
         {
            [0] = "Glow", 
            [6] = "Magic", 
         }, 
         ShortDescr = "glowing blue potion", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 15000, 
         ObjectValues = 
         {
            [1] = 49, 
            [2] = 49, 
            [3] = -1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 22, 
         }, 
         Weight = 2, 
         Name = "potion blue glowing", 
         ItemType = "trash", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 21004, 
         Layers = 0, 
      }, 
      [21133] = 
      {
         Description = "A freshly smoked womp rat lies here giving off a hickory scent.", 
         Cost = 200, 
         ShortDescr = "smoked womp rat", 
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
            [0] = 10, 
         }, 
         Weight = 2, 
         Name = "smoked womp rat", 
         ItemType = "food", 
         ActionDescription = "%s savour$q a piece of $p.", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 21133, 
         Layers = 0, 
      }, 
      [21134] = 
      {
         Description = "A plump roast kinewe bird has been carelessly left on the ground here.", 
         Cost = 200, 
         ShortDescr = "Roast kinewe", 
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
            [0] = 10, 
         }, 
         Weight = 2, 
         Name = "roast kinewe", 
         ItemType = "food", 
         ActionDescription = "%s delicately nibble$q on a piece of $p.", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 21134, 
         Layers = 0, 
      }, 
      [21135] = 
      {
         Description = "Some freshly picked chanterelle mushrooms have been left behind here.", 
         Cost = 200, 
         ShortDescr = "some freshly picked chanterelle mushrooms", 
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
            [0] = 10, 
         }, 
         Weight = 2, 
         Name = "chanterelle mushrooms", 
         ItemType = "food", 
         ActionDescription = "%s savor$q $p.", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 21135, 
         Layers = 0, 
      }, 
      [21136] = 
      {
         Description = "Nuts shells lie discarded around a small bag left here.", 
         Cost = 200, 
         ShortDescr = "a bag of fresh black nuts", 
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
            [0] = 10, 
         }, 
         Weight = 2, 
         Name = "bag black walnuts", 
         ItemType = "food", 
         ActionDescription = "%s quickly down$q $p.", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 21136, 
         Layers = 0, 
      }, 
      [21137] = 
      {
         Description = "A freshly cooked leg of dewback has been dropped here.", 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         ShortDescr = "a leg of dewback", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 200, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         Weight = 2, 
         Name = "leg dewback", 
         ItemType = "food", 
         ActionDescription = "%s savagely gnaw$q on $p.", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 21137, 
         Layers = 0, 
      }, 
      [21010] = 
      {
         Description = "A large mug of ale sits here.", 
         Cost = 75, 
         ShortDescr = "a mug of ale", 
         ExtraDescriptions = 
         {
         }, 
         ObjectValues = 
         {
            [1] = 12, 
            [2] = 4, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 12, 
         }, 
         Weight = 1, 
         Name = "mug ale", 
         ItemType = "drink_container", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Vnum = 21010, 
         Layers = 0, 
      }, 
      [21139] = 
      {
         Description = "A handfull of salty Grana seeds has been left hhere.", 
         Cost = 200, 
         ShortDescr = "a handful of Grana seeds", 
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
            [0] = 10, 
         }, 
         Weight = 2, 
         Name = "Grana seeds", 
         ItemType = "food", 
         ActionDescription = "%s quickly consume$q $p.", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 21139, 
         Layers = 0, 
      }, 
      [21140] = 
      {
         Description = "&z A set of silver master keys was left here.", 
         Cost = 0, 
         ShortDescr = "&z A set of silver master keys &x", 
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
         Weight = 1, 
         Name = "key master silver", 
         ItemType = "key", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Vnum = 21140, 
         Layers = 0, 
      }, 
      [21141] = 
      {
         Description = "&c A Flag of War", 
         Cost = 0, 
         ShortDescr = "A flag", 
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
         Weight = 1, 
         Name = "flag", 
         ItemType = "treasure", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Vnum = 21141, 
         Layers = 0, 
      }, 
      [21014] = 
      {
         Description = "A slice of salami sits in the man made.", 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         ShortDescr = "a slice of salami", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 4, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 1, 
         }, 
         Weight = 1, 
         Name = "salami", 
         ItemType = "food", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 21014, 
         Layers = 0, 
      }, 
      [21015] = 
      {
         Description = "A large chunk of raw beef lies here.", 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         ShortDescr = "a big chunk of beef", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 9, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         Weight = 5, 
         Name = "beef", 
         ItemType = "food", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 21015, 
         Layers = 0, 
      }, 
      [21016] = 
      {
         Description = "A  cooked Mon bird, which looks quite edible, lies on the tray.", 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         ShortDescr = "a cooked turkey", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 10, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         Weight = 2, 
         Name = "turkey", 
         ItemType = "food", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 21016, 
         Layers = 0, 
      }, 
      [21017] = 
      {
         Description = "A bottle of imported blue milk sits upright on the ground.", 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         ShortDescr = "a bottle of blue milk", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 4, 
         ObjectValues = 
         {
            [1] = 10, 
            [2] = 10, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         Weight = 3, 
         Name = "bottle blue milk", 
         ItemType = "drink_container", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Vnum = 21017, 
         Layers = 0, 
      }, 
      [21018] = 
      {
         Description = "A round wheel of cheese looks very good.", 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         ShortDescr = "a wheel of cheese", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 10, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         Weight = 3, 
         Name = "wheel cheese", 
         ItemType = "food", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Vnum = 21018, 
         Layers = 0, 
      }, 
      [21019] = 
      {
         Description = "A cup of spiked lemonade makes your thirst quench easily.", 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         ShortDescr = "a cup of lemonade", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 1, 
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 6, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         Weight = 1, 
         Name = "lemonade cup", 
         ItemType = "drink_container", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Vnum = 21019, 
         Layers = 0, 
      }, 
      [21020] = 
      {
         Description = "A large chocolate cake awaits someone to eat it.", 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         ShortDescr = "a chocolate cake", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 15, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         Weight = 1, 
         Name = "cake", 
         ItemType = "food", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Vnum = 21020, 
         Layers = 0, 
      }, 
      [21021] = 
      {
         Description = "A scrumptious loaf of bread lies here, making your taste buds swirl.", 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         ShortDescr = "a loaf of bread", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 2, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 4, 
         }, 
         Weight = 2, 
         Name = "loaf bread", 
         ItemType = "food", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 21021, 
         Layers = 0, 
      }, 
      [21022] = 
      {
         Description = "A cherry pie makes your mouth water.", 
         Cost = 100, 
         ShortDescr = "a cherry pie", 
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
            [0] = 4, 
         }, 
         Weight = 1, 
         Name = "cherry pie", 
         ItemType = "food", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Vnum = 21022, 
         Layers = 0, 
      }, 
      [21023] = 
      {
         Description = "A writing computer pen lies on the ground, unowned.", 
         Cost = 30, 
         ShortDescr = "a writing computer pen", 
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
         Weight = 1, 
         Name = "pen", 
         ItemType = "pen", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 21023, 
         Layers = 0, 
      }, 
      [21420] = 
      {
         Description = "A hologram parchment sits here.", 
         Flags = 
         {
            [1] = "Hum", 
         }, 
         ShortDescr = "A hologram", 
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
         Cost = 45000, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Weight = 1, 
         Name = "hologram", 
         ItemType = "book", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 21420, 
         Layers = 0, 
      }, 
      [21421] = 
      {
         Description = "A pluogus bus stop sign.", 
         Cost = 0, 
         ShortDescr = "a sign", 
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
         Name = "bus stop sign", 
         ItemType = "furniture", 
         Weight = 1, 
         ActionDescription = "", 
         Vnum = 21421, 
         Layers = 0, 
      }, 
      [21422] = 
      {
         Description = "A small crystal catches your eye.", 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         ShortDescr = "a small crystal", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 100, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Weight = 1, 
         Name = "small crystal", 
         ItemType = "crystal", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 21422, 
         Layers = 0, 
      }, 
      [21423] = 
      {
         Description = "A crystal was dropped here.", 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         ShortDescr = "a relacite crystal", 
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
            [0] = 2, 
         }, 
         Weight = 1, 
         Name = "relacite crystal", 
         ItemType = "crystal", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 21423, 
         Layers = 0, 
      }, 
      [21424] = 
      {
         Description = "Something shiney catches your eye.", 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         ShortDescr = "a kathracite crystal", 
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
            [0] = 1, 
         }, 
         Weight = 1, 
         Name = "Kathracite crystal", 
         ItemType = "crystal", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 21424, 
         Layers = 0, 
      }, 
      [21425] = 
      {
         Description = "Something shiney catches your eye.", 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         ShortDescr = "a mephite crystal", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 5000, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 4, 
         }, 
         Weight = 1, 
         Name = "mephite crystal", 
         ItemType = "crystal", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 21425, 
         Layers = 0, 
      }, 
      [21042] = 
      {
         Description = "The Akatamer board hangs here.", 
         Cost = 0, 
         ShortDescr = "the general board", 
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
            [1] = 
            {
               Description = "", 
               Keyword = "book", 
            }, 
         }, 
         Name = "board general", 
         ItemType = "furniture", 
         Weight = 1001, 
         ActionDescription = "", 
         Vnum = 21042, 
         Layers = 0, 
      }, 
      [21427] = 
      {
         Description = "&b A computer terminal rests aginst the wall here.", 
         Flags = 
         {
            [1] = "Hum", 
         }, 
         ShortDescr = "A computer terminal lever", 
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
         Cost = 45000, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Weight = 1, 
         Name = "lever omputer terminal", 
         ItemType = "lever", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 21427, 
         Layers = 0, 
      }, 
      [21428] = 
      {
         Description = "Key", 
         Cost = 0, 
         ShortDescr = "Key", 
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
         Weight = 1, 
         Name = "key ", 
         ItemType = "key", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Vnum = 21428, 
         Layers = 0, 
      }, 
      [21045] = 
      {
         Description = "A sparkling crystal staff has been left lying here.", 
         Flags = 
         {
            [0] = "Glow", 
            [6] = "Magic", 
         }, 
         ShortDescr = "a sparkling crystal staff", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 1000, 
         ObjectValues = 
         {
            [1] = 3, 
            [2] = 3, 
            [3] = 81, 
            [4] = 0, 
            [5] = 0, 
            [0] = 12, 
         }, 
         Weight = 1, 
         Name = "crystal staff", 
         ItemType = "_wand", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Vnum = 21045, 
         Layers = 0, 
      }, 
      [21046] = 
      {
         Description = "A strange bag, covered in dust, has been left here.", 
         Flags = 
         {
            [0] = "Glow", 
            [6] = "Magic", 
         }, 
         ShortDescr = "a rune-covered bag", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 1000, 
         ObjectValues = 
         {
            [1] = 1, 
            [2] = 0, 
            [3] = 1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 75, 
         }, 
         Weight = 1, 
         Name = "bag rune-covered", 
         ItemType = "container", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 21046, 
         Layers = 0, 
      }, 
      [21048] = 
      {
         Description = "A stack of holomail is piled high here.", 
         Cost = 0, 
         ShortDescr = "a stack of holomail", 
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
         Name = "mail board stack", 
         ItemType = "furniture", 
         Weight = 1001, 
         ActionDescription = "", 
         Vnum = 21048, 
         Layers = 0, 
      }, 
      [21049] = 
      {
         Description = "A bright ball of light shimmers in the air.", 
         Flags = 
         {
            [0] = "Glow", 
            [6] = "Magic", 
         }, 
         ShortDescr = "a bright ball of light", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 100, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = -1, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Weight = 1, 
         Name = "ball light", 
         ItemType = "light", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 21049, 
         Layers = 0, 
      }, 
      [21435] = 
      {
         Description = "Data Info Center - (Terminal)", 
         Cost = 0, 
         ShortDescr = "the board of the augurer guild", 
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
         Name = "augurer guild board", 
         ItemType = "furniture", 
         Weight = 1, 
         ActionDescription = "", 
         Vnum = 21435, 
         Layers = 0, 
      }, 
      [21055] = 
      {
         Description = "A ring which will bring good luck lies here.", 
         Flags = 
         {
            [16] = "_16", 
            [17] = "_17", 
            [19] = "LargeSize", 
            [5] = "Invis", 
            [14] = "_14", 
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
         ExtraDescriptions = 
         {
         }, 
         Cost = 500, 
         ObjectValues = 
         {
            [1] = 3, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 3, 
         }, 
         Weight = 1, 
         Name = "thief ring", 
         ItemType = "armor", 
         ActionDescription = "", 
         WearFlags = 
         {
            [1] = "Finger", 
            [0] = "Take", 
         }, 
         Vnum = 21055, 
         Layers = 0, 
      }, 
      [21056] = 
      {
         Description = "An iron ring has fallen here.", 
         Flags = 
         {
            [0] = "Glow", 
            [6] = "Magic", 
            [19] = "LargeSize", 
         }, 
         ShortDescr = "a ring of the city guard", 
         Affects = 
         {
            [1] = 
            {
               Modifier = -3, 
               Location = 17, 
            }, 
            [2] = 
            {
               Modifier = 3072, 
               Location = 27, 
            }, 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "Rumors say that these rings protect from magical enchantments...\
\13", 
               Keyword = "ring", 
            }, 
         }, 
         Cost = 100, 
         ObjectValues = 
         {
            [1] = 3, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 3, 
         }, 
         Weight = 1, 
         Name = "ring", 
         ItemType = "armor", 
         ActionDescription = "", 
         WearFlags = 
         {
            [1] = "Finger", 
            [0] = "Take", 
         }, 
         Vnum = 21056, 
         Layers = 0, 
      }, 
      [21057] = 
      {
         Description = "A large neck guard was dropped here.", 
         Flags = 
         {
            [19] = "LargeSize", 
            [13] = "Inventory", 
         }, 
         ShortDescr = "a neck guard", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 30, 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         Weight = 3, 
         Name = "a neck guard", 
         ItemType = "armor", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
         }, 
         Vnum = 21057, 
         Layers = 0, 
      }, 
      [21058] = 
      {
         Description = "A New Rebublic breastplate has fallen here.", 
         Flags = 
         {
            [19] = "LargeSize", 
            [13] = "Inventory", 
         }, 
         ShortDescr = "a New rebublic crested breastplate", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 150, 
         ObjectValues = 
         {
            [1] = 6, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 6, 
         }, 
         Weight = 8, 
         Name = "crested plate", 
         ItemType = "armor", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
            [3] = "Body", 
         }, 
         Vnum = 21058, 
         Layers = 128, 
      }, 
      [21059] = 
      {
         Description = "A helm is here.", 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         ShortDescr = "a helm", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 50, 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         Weight = 8, 
         Name = "a helm", 
         ItemType = "armor", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
            [4] = "Head", 
         }, 
         Vnum = 21059, 
         Layers = 4, 
      }, 
      [21060] = 
      {
         Description = "A set of guard leggings has fallen here.", 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         ShortDescr = "guard leggings", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 20, 
         ObjectValues = 
         {
            [1] = 4, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 4, 
         }, 
         Weight = 4, 
         Name = "guard leggings", 
         ItemType = "armor", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
            [5] = "Legs", 
         }, 
         Vnum = 21060, 
         Layers = 16, 
      }, 
      [21061] = 
      {
         Description = "A set of boots has fallen here.", 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         ShortDescr = "black boots", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 40, 
         ObjectValues = 
         {
            [1] = 4, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 4, 
         }, 
         Weight = 2, 
         Name = "boots black", 
         ItemType = "armor", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
            [6] = "Feet", 
         }, 
         Vnum = 21061, 
         Layers = 0, 
      }, 
      [21062] = 
      {
         Description = "A set of guard sleeves has fallen here.", 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         ShortDescr = "guard sleeves", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 20, 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         Weight = 3, 
         Name = "guard sleeves", 
         ItemType = "armor", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
            [8] = "Arms", 
         }, 
         Vnum = 21062, 
         Layers = 0, 
      }, 
      [21063] = 
      {
         Description = "Some guard gauntlets have fallen here.", 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         ShortDescr = "guard gauntlets", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 40, 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         Weight = 4, 
         Name = "guard gauntlets", 
         ItemType = "armor", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
            [7] = "Hands", 
         }, 
         Vnum = 21063, 
         Layers = 0, 
      }, 
      [21064] = 
      {
         Description = "A bracer was dropped here.", 
         Flags = 
         {
            [19] = "LargeSize", 
            [13] = "Inventory", 
         }, 
         ShortDescr = "a bracer", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 75, 
         ObjectValues = 
         {
            [1] = 4, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 4, 
         }, 
         Weight = 2, 
         Name = "bracer", 
         ItemType = "armor", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
            [12] = "Wrist", 
         }, 
         Vnum = 21064, 
         Layers = 128, 
      }, 
      [21065] = 
      {
         Description = "A calamarian energy shield was dropped here.", 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         ShortDescr = "a calamarian energy shield", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 600, 
         ObjectValues = 
         {
            [1] = 7, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 7, 
         }, 
         Weight = 6, 
         Name = "calamarian energy shield", 
         ItemType = "armor", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
            [9] = "Shield", 
         }, 
         Vnum = 21065, 
         Layers = 0, 
      }, 
      [21066] = 
      {
         Description = "A rubber visor was misplaced here.", 
         Flags = 
         {
            [19] = "LargeSize", 
            [13] = "Inventory", 
         }, 
         ShortDescr = "a rubber visor", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 50, 
         ObjectValues = 
         {
            [1] = 4, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 3, 
         }, 
         Weight = 1, 
         Name = "rubber visor", 
         ItemType = "armor", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
            [17] = "Eyes", 
         }, 
         Vnum = 21066, 
         Layers = 0, 
      }, 
      [21067] = 
      {
         Description = "A plain electric torch has been left lying here.", 
         Cost = 10, 
         ShortDescr = "a torch", 
         ExtraDescriptions = 
         {
         }, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 24, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Weight = 1, 
         Name = "torch", 
         ItemType = "light", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 21067, 
         Layers = 0, 
      }, 
      [21068] = 
      {
         Description = "A com-blaster has fallen here.", 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         ShortDescr = "a com-blaster", 
         Affects = 
         {
            [1] = 
            {
               Modifier = 1, 
               Location = 18, 
            }, 
            [2] = 
            {
               Modifier = 3, 
               Location = 19, 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 300, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 6, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         Weight = 3, 
         Name = "com-blaster", 
         ItemType = "weapon", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Vnum = 21068, 
         Layers = 0, 
      }, 
      [21069] = 
      {
         Description = "A hand blaster has fallen here.", 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         ShortDescr = "hand blaster", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 300, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 6, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         Weight = 6, 
         Name = "hand blaster", 
         ItemType = "weapon", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Vnum = 21069, 
         Layers = 0, 
      }, 
      [21070] = 
      {
         Description = "Key to Docking Bay", 
         Cost = 1000, 
         ShortDescr = "Key to Docking Bay", 
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
         Weight = 1, 
         Name = "Key", 
         ItemType = "armor", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Vnum = 21070, 
         Layers = 0, 
      }, 
      [21071] = 
      {
         Description = "The key to Akatamer's northern Docking bay lies here.", 
         Cost = 1000, 
         ShortDescr = "the key to the northern Docking bay of Akatamer", 
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
         Weight = 1, 
         Name = "Key", 
         ItemType = "armor", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Vnum = 21071, 
         Layers = 0, 
      }, 
      [21072] = 
      {
         Description = "The key to Akatamer's eastern Docking bay lies here.", 
         Cost = 1000, 
         ShortDescr = "the key to the eastern Docking bay of Akatamer", 
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
         Weight = 1, 
         Name = "Key", 
         ItemType = "armor", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Vnum = 21072, 
         Layers = 0, 
      }, 
      [21073] = 
      {
         Description = "The Key to the southern Docking Bay", 
         Cost = 0, 
         ShortDescr = "Key to Southern Docking Bay.", 
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
         Weight = 1, 
         Name = "Key", 
         ItemType = "armor", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Vnum = 21073, 
         Layers = 0, 
      }, 
      [21076] = 
      {
         Description = "Someone has left a bantha leather shirt lying here.", 
         Cost = 200, 
         ShortDescr = "a leather shirt", 
         ExtraDescriptions = 
         {
         }, 
         ObjectValues = 
         {
            [1] = 3, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 3, 
         }, 
         Weight = 4, 
         Name = "leather shirt", 
         ItemType = "armor", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
            [3] = "Body", 
         }, 
         Vnum = 21076, 
         Layers = 0, 
      }, 
      [21077] = 
      {
         Description = "Some bantha leather pants are lying here.", 
         Cost = 150, 
         ShortDescr = "some leather pants", 
         ExtraDescriptions = 
         {
         }, 
         ObjectValues = 
         {
            [1] = 3, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         Weight = 2, 
         Name = "pants leather", 
         ItemType = "armor", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
            [5] = "Legs", 
         }, 
         Vnum = 21077, 
         Layers = 0, 
      }, 
      [21078] = 
      {
         Description = "Some bantha leather sleeves have been abandoned here.", 
         Cost = 75, 
         ShortDescr = "some leather sleeves", 
         ExtraDescriptions = 
         {
         }, 
         ObjectValues = 
         {
            [1] = 3, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 1, 
         }, 
         Weight = 1, 
         Name = "leather sleeves", 
         ItemType = "armor", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
            [8] = "Arms", 
         }, 
         Vnum = 21078, 
         Layers = 0, 
      }, 
      [21079] = 
      {
         Description = "A pair of bantha leather boots are lying here.", 
         Cost = 125, 
         ShortDescr = "some leather boots", 
         ExtraDescriptions = 
         {
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
         Weight = 2, 
         Name = "leather boots", 
         ItemType = "armor", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
            [6] = "Feet", 
         }, 
         Vnum = 21079, 
         Layers = 0, 
      }, 
      [21080] = 
      {
         Description = "Two bantha leather gloves are lying on the ground.", 
         Cost = 100, 
         ShortDescr = "a pair of leather gloves", 
         ExtraDescriptions = 
         {
         }, 
         ObjectValues = 
         {
            [1] = 3, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 1, 
         }, 
         Weight = 1, 
         Name = "leather gloves pair", 
         ItemType = "armor", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
            [7] = "Hands", 
         }, 
         Vnum = 21080, 
         Layers = 0, 
      }, 
      [21081] = 
      {
         Description = "A gleaming knife shines brightly here.", 
         Flags = 
         {
            [19] = "LargeSize", 
            [13] = "Inventory", 
         }, 
         ShortDescr = "a steel knife", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 100, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Weight = 1, 
         Name = "steel knife", 
         ItemType = "weapon", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Vnum = 21081, 
         Layers = 0, 
      }, 
      [21082] = 
      {
         Description = "An Mon Blaster has been carelessly left here.", 
         Flags = 
         {
            [19] = "LargeSize", 
            [13] = "Inventory", 
         }, 
         ShortDescr = "Mon blaster", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 200, 
         ObjectValues = 
         {
            [1] = 4, 
            [2] = 0, 
            [3] = 6, 
            [4] = 0, 
            [5] = 0, 
            [0] = 7, 
         }, 
         Weight = 4, 
         Name = "Mon-blaster", 
         ItemType = "weapon", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Vnum = 21082, 
         Layers = 0, 
      }, 
      [21083] = 
      {
         Description = "This item doesn't need a long :P", 
         Cost = 0, 
         ShortDescr = "hotel  key", 
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
         Weight = 1, 
         Name = "Key", 
         ItemType = "key", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 21083, 
         Layers = 0, 
      }, 
      [21094] = 
      {
         Description = "A strange golden band has been left lying here.", 
         Flags = 
         {
            [0] = "Glow", 
            [6] = "Magic", 
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
         ExtraDescriptions = 
         {
         }, 
         Cost = 10000, 
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         Weight = 1, 
         Name = "ring golden band", 
         ItemType = "armor", 
         ActionDescription = "", 
         WearFlags = 
         {
            [1] = "Finger", 
            [0] = "Take", 
         }, 
         Vnum = 21094, 
         Layers = 0, 
      }, 
      [21426] = 
      {
         Description = "&O A Mon Gill was left here on the ground.", 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         ShortDescr = "&O A Mon Gill", 
         Weight = 1, 
         Affects = 
         {
            [1] = 
            {
               Modifier = -2147483648, 
               Location = 26, 
            }, 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "&O The mon gill while very effective has a very short life span.\
\13", 
               Keyword = "gill mask", 
            }, 
         }, 
         Cost = 200, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "1", 
               Code = "mpecho &R^R Warning, Gill Mask Failure &x ^x\
", 
            }, 
         }, 
         Name = "gill mask", 
         ItemType = "armor", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
            [4] = "Head", 
         }, 
         Vnum = 21426, 
         Layers = 0, 
      }, 
      [21138] = 
      {
         Description = "Some freshly gathered wild seaweed have been forgotten here.", 
         Cost = 200, 
         ShortDescr = "some wild seaweed greens", 
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
            [0] = 10, 
         }, 
         Weight = 2, 
         Name = "wild mustard greens", 
         ItemType = "food", 
         ActionDescription = "%s quickly eat$q $p.", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 21138, 
         Layers = 0, 
      }, 
      [21008] = 
      {
         Description = "A small bottle, tipped on its side, drips on the ground.", 
         Cost = 100, 
         ShortDescr = "a bottle of beer", 
         ExtraDescriptions = 
         {
         }, 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 1, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         Weight = 1, 
         Name = "beer bottle", 
         ItemType = "drink_container", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Vnum = 21008, 
         Layers = 0, 
      }, 
      [21111] = 
      {
         Description = "A painting of a glorious security post hangs on the wall, catching your eye.", 
         Flags = 
         {
            [8] = "Bless", 
         }, 
         ShortDescr = "an oil painting", 
         Cost = 0, 
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
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "exa_prog", 
               Arguments = "100", 
               Code = "mpechoat $n A magical force suddenly takes hold of you, pulling you in!\
mpechoat $n When you right yourself, you look around to collect your bearings,\
mpechoat $n and find yourself standing before the manor...\
mptrans $n 2400\
mpecho $n fades before your eyes while examining the painting of the manor.\
", 
            }, 
         }, 
         Name = "manor painting", 
         ItemType = "furniture", 
         Weight = 1, 
         ActionDescription = "", 
         Vnum = 21111, 
         Layers = 0, 
      }, 
      [21112] = 
      {
         Description = "A dark, solemn painting hangs here in the shadows, collecting dust.", 
         Flags = 
         {
            [2] = "_02", 
         }, 
         ShortDescr = "a dark, solemn painting", 
         Cost = 0, 
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
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "exa_prog", 
               Arguments = "100", 
               Code = "mpechoat $n Your feel your body as it dissolves into elements of color,\
mpechoat $n sphotel ing slowly into the oils of the dark painting...\
mpechoaround $n Stepping forward to examine the painting, $n's body begins to\
mpechoaround $n liquesce, dissolving into a kaleidoscope of colors, sphotel ing\
mpechoaround $n funnel-like into the oiled textures of the solemn image.\
mptransfer $n 2171\
", 
            }, 
         }, 
         Name = "solemn painting unholy", 
         ItemType = "furniture", 
         Weight = 50, 
         ActionDescription = "", 
         Vnum = 21112, 
         Layers = 0, 
      }, 
      [21113] = 
      {
         Description = "A ratted up map was left here.", 
         Flags = 
         {
            [8] = "Bless", 
         }, 
         ShortDescr = "A ratted up map", 
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
            [2] = 
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
         }, 
         Cost = 2, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Weight = 1, 
         Name = "map", 
         ItemType = "furniture", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 21113, 
         Layers = 0, 
      }, 
      [21114] = 
      {
         Description = "&c A large bronze statue stands tall here.", 
         Flags = 
         {
            [8] = "Bless", 
         }, 
         ShortDescr = "&c A large bronze statue ", 
         Cost = 0, 
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
            [2] = 
            {
               Description = "&c This large bronze statue is of a great Mon Calamarian individual, who\
\13helped end the first Imperial force and the second Death Star. There is  a\
\13small frame on the sign with a gold inprint on it.\
\13", 
               Keyword = "statue", 
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
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "act_prog", 
               Arguments = "bow pray", 
               Code = "mpecho You feel all your prayers are being answered from above.\
", 
            }, 
         }, 
         Name = "statue", 
         ItemType = "furniture", 
         Weight = 1, 
         ActionDescription = "", 
         Vnum = 21114, 
         Layers = 0, 
      }, 
      [21115] = 
      {
         Description = "&z A metal prison bed lies aginst the wall. &x", 
         Cost = 0, 
         ShortDescr = "&z A metal prison bed ", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "What you've never seen a chair before??\
\13", 
               Keyword = "Chair", 
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
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "act_prog", 
               Arguments = "100 p sits down.", 
               Code = "mpecho You plop flat in the large metal bed relaxing..\
mpecho thinking this is not to bad when...\
mpecho  BOING!\
mpecho  A spring pokes you in the back.\
mpforce $n stand\
", 
            }, 
         }, 
         Name = "bed prison", 
         ItemType = "furniture", 
         Weight = 1, 
         ActionDescription = "", 
         Vnum = 21115, 
         Layers = 0, 
      }, 
      [21116] = 
      {
         Description = "&c A TI-0 suction waste machine is placed in the corner.", 
         Cost = 0, 
         ShortDescr = "&c A TI-0 suction waste machine", 
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
            [1] = 
            {
               Description = "What you've never seen a chair before??\
\13", 
               Keyword = "Chair", 
            }, 
         }, 
         Name = "suction john toilet waste", 
         ItemType = "trash", 
         Weight = 1, 
         ActionDescription = "", 
         Vnum = 21116, 
         Layers = 0, 
      }, 
      [21117] = 
      {
         Description = "&G A gamorrean double strap vest was left here. &x", 
         Flags = 
         {
            [19] = "LargeSize", 
            [13] = "Inventory", 
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
         ExtraDescriptions = 
         {
         }, 
         Cost = 100, 
         ObjectValues = 
         {
            [1] = 7, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Weight = 1, 
         Name = "vest gamorean double strap", 
         ItemType = "armor", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
            [10] = "About", 
            [3] = "Body", 
         }, 
         Vnum = 21117, 
         Layers = 8, 
      }, 
      [21118] = 
      {
         Description = "&b Lizard skin feet covers were left here &x.", 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         ShortDescr = "&b Lizard skin feet covers.", 
         Affects = 
         {
            [1] = 
            {
               Modifier = -20, 
               Location = 14, 
            }, 
            [2] = 
            {
               Modifier = 100, 
               Location = 47, 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 125, 
         ObjectValues = 
         {
            [1] = 8, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Weight = 1, 
         Name = "boots lizard feet cover", 
         ItemType = "armor", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
            [6] = "Feet", 
         }, 
         Vnum = 21118, 
         Layers = 4, 
      }, 
      [21009] = 
      {
         Description = "A bottle of whiskey spills drops on the ground.", 
         Cost = 50, 
         ShortDescr = "a bottle of whiskey", 
         ExtraDescriptions = 
         {
         }, 
         ObjectValues = 
         {
            [1] = 10, 
            [2] = 5, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         Weight = 1, 
         Name = "whiskey bottle", 
         ItemType = "drink_container", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Vnum = 21009, 
         Layers = 0, 
      }, 
   }, 
   Filename = "mon_cal.lua", 
   ResetMessage = "Imperial TIE fighters scream past above, patrolling this occupied city.", 
   Flags = 
   {
      [0] = "NoPkill", 
   }, 
   Rooms = 
   {
      [21000] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "Anna Avenue lies to the north.\
", 
               Direction = "north", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21001, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "To the east lies Barster Road.\
", 
               Direction = "east", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21036, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "Anna Avenue lies to the south.\
", 
               Direction = "south", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21042, 
               Distance = 0, 
            }, 
            [4] = 
            {
               Description = "To the west lies Barster Road.\
", 
               Direction = "west", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21039, 
               Distance = 0, 
            }, 
         }, 
         Description = "&P You are standing within the expanse of the famous Mon Calamrian City of\
Coral City .  A metallic statue of Admiral Ackbar occupies the square's\
center, surrounded by gardens of shrubbery which enhance the air of\
serenity and peace here in the center of the city.  The main roads lead\
away in the cardinal directions, while to the east and west are smooth\
carved rock roads. The roof tops of a buildings can be seen rising to the\
south east.\
", 
         Flags = 
         {
            [15] = "NoDropAll", 
         }, 
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
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Coral City Center", 
         Vnum = 21000, 
         Sector = "city", 
      }, 
      [21001] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "Anna Avenue lies in this direction.\
", 
               Direction = "north", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21002, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "The road to the south leads to the main  Square.\
", 
               Direction = "south", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21000, 
               Distance = 0, 
            }, 
         }, 
         Description = "&P You continue down Anna Avenue. This rather attractive road is the main\
heartline of the city. If you wish to travel anywhere this is the quickest\
\
and safest route. To the south east you can see the tops of newly created\
shops waiting for customers to  sell thier wares to. Directly south you\
can see the circular center of Coral City.\
", 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [18] = "NoDrop", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Anna Avenue", 
         Vnum = 21001, 
         Sector = "city", 
      }, 
      [21002] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "The worn metallic roads of Anna Avenue lie in this direction.\
", 
               Direction = "north", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21003, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "A peculiar section of Anna Avenue lies to the south.\
", 
               Direction = "south", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21001, 
               Distance = 0, 
            }, 
         }, 
         Description = "&P You continue down Anna Avenue. This rather attractive road is the main\
heartline of the city. If you wish to travel anywhere this is the quickest\
and safest route. To the south east you can see the tops of newly created\
shops waiting for customers to  sell thier wares to. \
", 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "Anna Avenue", 
         Tunnel = 0, 
         Vnum = 21002, 
         Sector = "city", 
      }, 
      [21003] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "Anna Avenue and Security Road cross just north of here.\
", 
               Direction = "north", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21004, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "A rather bland portion of Anna Avenue lies to the south.\
", 
               Direction = "south", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21002, 
               Distance = 0, 
            }, 
         }, 
         Description = "&P You continue down Anna Avenue. This rather attractive road is the main\
heartline of the city. If you wish to travel anywhere this is the quickest\
and safest route. to the north you can see an intersection. \
", 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "Anna Avenue", 
         Tunnel = 0, 
         Vnum = 21003, 
         Sector = "city", 
      }, 
      [21004] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "The northern Docking bay can be seen in this direction.\
", 
               Direction = "north", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21100, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "Security Road extends to the east.\
", 
               Direction = "east", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21005, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "Going south will bring you near the heart of the city.\
", 
               Direction = "south", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21003, 
               Distance = 0, 
            }, 
            [4] = 
            {
               Description = "Security Road extends to the west.\
", 
               Direction = "west", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21035, 
               Distance = 0, 
            }, 
         }, 
         Description = "&RYou stand at the intersection of &PAnna Avenue&R and Security Road.  This\
main road is home to the Mon Calamari Police. It is highly recommended\
that you do not walk down this street with rifle a blaze. Soft greenery\
have been added to the street sides to help make it look more attractive.\
To the north you can see the north docking bay where the transport ships\
continualy stop. Security Road lies to the east and west, while &P Anna\
Avenue &R can be seen to the north and south.\
", 
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
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "Intersection of Anna Avenue and Security Road", 
         Tunnel = 0, 
         Vnum = 21004, 
         Sector = "city", 
      }, 
      [21005] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Flags = 
               {
                  [0] = "IsDoor", 
                  [5] = "PickProof", 
               }, 
               Direction = "north", 
               Key = -1, 
               Keyword = "door", 
               DestinationVnum = 21132, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "Security Road lies to the east.\
", 
               Direction = "east", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21006, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "The intersection of Anna Avenue and Security Road is to the west.\
", 
               Direction = "west", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21004, 
               Distance = 0, 
            }, 
         }, 
         Description = "&R This portion of Security Road seems extremly well taken care of.  A\
whistling northern wind can be heard passing the large Security building\
to the north.  The extremly large building was made out of grinded lava\
rock from the planet ocean floor. This extremly hard surface is known for\
it's ability to keep criminals inside. Security Road stretches  to the\
east and west.\
", 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "Main Security Office", 
         Tunnel = 0, 
         Vnum = 21005, 
         Sector = "city", 
      }, 
      [21006] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "Security Road is to the east.\
", 
               Direction = "east", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21007, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "Security Road extends westward.\
", 
               Direction = "west", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21005, 
               Distance = 0, 
            }, 
         }, 
         Description = "&RYou are on a straight section of Security Road.  A statue depicting a\
party of adventurers fighting off a Imperial Stortrooper sits in the\
center of the road.  Blinking back a tear, you remember hearing this tale\
in a local Factory , and realize that the statue is a memorial.  Security\
Road extends to the east and west. \
", 
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
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "Security Road", 
         Tunnel = 0, 
         Vnum = 21006, 
         Sector = "city", 
      }, 
      [21007] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "Security Road meets Luke Street to the east.\
", 
               Direction = "east", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21008, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "Security Road continues to the west.\
", 
               Direction = "west", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21006, 
               Distance = 0, 
            }, 
         }, 
         Description = "&R You are walking down Security Road.  The long road, which lines the\
northern wall of Coral City, meets up with Oceanview Street to the east to\
form one of the four corners of Coral City. Beyond these four corners is a\
small walkway guarded by a Mon built breakwater that turns back the\
largest ocean on a habital planet. The street continues westward.\
", 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "Security Road", 
         Tunnel = 0, 
         Vnum = 21007, 
         Sector = "city", 
      }, 
      [21008] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "Luke Street lies to the south.\
", 
               Direction = "south", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21009, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "Security Road lies to the west.\
", 
               Direction = "west", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21007, 
               Distance = 0, 
            }, 
         }, 
         Description = "&B Oceanview Street and Security Road come together here to form one of the\
four corners of Coral City. Oceanview Street lies to the south, while\
Security Road stretches westward.To the south you can see Mon Calamrian\
New Rebublic troops practicing military drills incase and invasion ever\
occurs again. \
", 
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
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "Meeting of Oceanview Street and Security Road ", 
         Tunnel = 0, 
         Vnum = 21008, 
         Sector = "city", 
      }, 
      [21009] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "Luke Street meets up with Security Road to the north.\
", 
               Direction = "north", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21008, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "Luke Street continues to the south.\
", 
               Direction = "south", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21010, 
               Distance = 0, 
            }, 
         }, 
         Description = "&B This section of Oceanview Street is reserved for the Mon Calamrian\
defense team.  E- Web Blaster's and Com - blasters are stacked high into\
the air, almost within reach of the  New Rebublic guards on the outpost.\
to the west. Oceanview Street stretches to the north and south.  You also\
\
see in the enterance a body scanner that will make sure you have no\
weapons on you.\
", 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "Oceanview Street", 
         Tunnel = 0, 
         Vnum = 21009, 
         Sector = "city", 
      }, 
      [21010] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "Luke Street continues to the north.\
", 
               Direction = "north", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21009, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "The road ranges to the south.\
", 
               Direction = "south", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21011, 
               Distance = 0, 
            }, 
         }, 
         Description = "&B This portion of Oceanview Street is rather poor and unkempt.  Rags\
\
litter the street, and several of the city's unfortunate have set up\
residence here.;A holohome has been set up on the eastern side of the\
road, a beggar's home no doubt.  They prefer this road thanks to the\
constant tourists that travelk it. Oceanview Street continues to the north\
and south.\
", 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "Oceanview Street", 
         Tunnel = 0, 
         Vnum = 21010, 
         Sector = "city", 
      }, 
      [21011] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "Luke Street extends northward.\
", 
               Direction = "north", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21010, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "Barster Road and Luke Street cross to the south.\
", 
               Direction = "south", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21012, 
               Distance = 0, 
            }, 
         }, 
         Description = "&BYou are walking down the northern half of Oceanview Street at a brisk\
pace. To the east is the towering  security wall of Coral City ,blocking\
your view of the awsome ocean.   Oceanview Street ranges to the north and\
south.  The road is extremly polished and looks as if not to many Mon\
Calamrian's travel down it.\
", 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "Oceanview Street", 
         Tunnel = 0, 
         Vnum = 21011, 
         Sector = "city", 
      }, 
      [21012] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "Luke Street is to the north.\
", 
               Direction = "north", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21011, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "To the east is the eastern Docking bay.\
", 
               Direction = "east", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21113, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "You can see Luke Street stretch far to the south.\
", 
               Direction = "south", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21013, 
               Distance = 0, 
            }, 
            [4] = 
            {
               Description = "Barster Road lies to the east.\
", 
               Direction = "west", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21038, 
               Distance = 0, 
            }, 
         }, 
         Description = "&B You stand at the intersection of Barster Road and Oceanview Street.  To\
the east you can see the massive east Docking bay of Coral City. This is\
one of the main smuggling bay's of the city.While Oceanview Street lies to\
the north and south, and Barster Road runs west.\
", 
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
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "Intersection of Barster Road and Oceanview Street", 
         Tunnel = 0, 
         Vnum = 21012, 
         Sector = "city", 
      }, 
      [21013] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "Barster Road and Luke Street cross just north of here.\
", 
               Direction = "north", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21012, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "The Trading Post  and Luke Street intersection is south of here.\
", 
               Direction = "south", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21014, 
               Distance = 0, 
            }, 
         }, 
         Description = "&B You take a brief pause on your way down Oceanview Street, and you can\
hear the chirping of some strange bird like creature  coming from the\
other side of the extending breakwall.  Upon catching your breath from the\
salty air, you gather  your belongings and continue on your way.\
", 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "Oceanview Street", 
         Tunnel = 0, 
         Vnum = 21013, 
         Sector = "city", 
      }, 
      [21014] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "Luke Street lies in this direction.\
", 
               Direction = "north", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21013, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "Luke Street stretches southward as far as the eye can see.\
", 
               Direction = "south", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21015, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "The Trading posts of Akatamer await your arrival and Credits.\
", 
               Direction = "west", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21050, 
               Distance = 0, 
            }, 
         }, 
         Description = "&B You stand at the intersection of Trading Post Street and Luke Street.\
You look out and can see the waves crash upon the breakwall To the west\
are the glorious pavilions and shops of Coral City, while Oceanview Street\
continues to the north and south.\
", 
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
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "Intersection of Trading post Street and Oceanview Street ", 
         Tunnel = 0, 
         Vnum = 21014, 
         Sector = "city", 
      }, 
      [21015] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "Trading post Street and Luke Street meet to the north.\
", 
               Direction = "north", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21014, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "Gazing southward, you see the southeastern corner of Akatamer.\
", 
               Direction = "south", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21016, 
               Distance = 0, 
            }, 
         }, 
         Description = "&B This portion of Oceanview street allows you see rest and watch one of\
the two suns set. Two crome like  benches sit on opposite sides of the\
polished rock road, enticing you to rest.  You can see Law Avenue meeting\
up with Oceanview Street to the south, while to the north is the Trading\
Post Street  and Oceanview Street intersection.\
", 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "Oceanview Street.", 
         Tunnel = 0, 
         Vnum = 21015, 
         Sector = "city", 
      }, 
      [21016] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "Luke Street lies to the north.\
", 
               Direction = "north", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21015, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 6905, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "Law Avenue lies to the west.\
", 
               Direction = "west", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21017, 
               Distance = 0, 
            }, 
         }, 
         Description = "&WOceanview  Street and Law Avenue come together here to form one of the\
four corners of Coral City. This attractive street recived it's name\
\
becasue the creators of the city's layout placed it on a hill allowing you\
to look at the ocean.Oceanview Street lies to the north, while Law Avenue\
stretches westward.\
", 
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
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "Meeting of Oceanview Street and Law Avenue ", 
         Tunnel = 0, 
         Vnum = 21016, 
         Sector = "city", 
      }, 
      [21017] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "Law Avenue joins Luke Street to the east.\
", 
               Direction = "east", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21016, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "Law Avenue stretches westward.\
", 
               Direction = "west", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21018, 
               Distance = 0, 
            }, 
         }, 
         Description = "&WYou are walking down the newly paved Law Avenue, the road which lines the\
southern wall of Coral City recives constant traffic and is ofen the\
center of attraction.  The dust  here seems wet and muddy. you must be\
getting closer to the ocean  To the east is one of the four corners  of\
Coral City, while Law Avenue continues westward. \
", 
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
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "Law Avenue", 
         Tunnel = 0, 
         Vnum = 21017, 
         Sector = "city", 
      }, 
      [21018] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21138, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "The road extends eastward.\
", 
               Direction = "east", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21017, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "Law Avenue stretches westward as far as the eye can see.\
", 
               Direction = "west", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21019, 
               Distance = 0, 
            }, 
         }, 
         Description = "&W A tall statue attracts your attention on this portion of Law Avenue. \
The platiki metallic  sculpture is of a Calamrian in his late years\
wielding a E-web Blaster against an unseen attacker, although from the\
man's posture it is obvious that his opponent was enormous.  A small\
golden plaque sits near the statue, explaining its importance.  The newly\
paved road stretches both east and west. \
", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "The plaque reads: 'May you rest in peace, Ghett of S.P.I.N..'\
\13", 
               Keyword = "plaque", 
            }, 
            [2] = 
            {
               Description = "In honor of the late GHETT, founder of the special forces team S.P.I.N.\
\13True friend, and hero to all of us. \
\13", 
               Keyword = "statue ", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "Law Avenue", 
         Tunnel = 0, 
         Vnum = 21018, 
         Sector = "city", 
      }, 
      [21019] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Direction = "north", 
               Key = -1, 
               Keyword = "door", 
               DestinationVnum = 21051, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "Law Avenue continues to the east.\
", 
               Direction = "east", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21018, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "Anna Avenue and Law Avenue cross to the west.\
", 
               Direction = "west", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21020, 
               Distance = 0, 
            }, 
         }, 
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
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "Law Avenue", 
         Tunnel = 0, 
         Vnum = 21019, 
         Sector = "city", 
      }, 
      [21020] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "To the north is Anna Avenue.\
", 
               Direction = "north", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21044, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "You see the legendary Law Avenue.\
", 
               Direction = "east", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21019, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "To the south is Akatamer's southern Docking bay.\
", 
               Direction = "south", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21074, 
               Distance = 0, 
            }, 
            [4] = 
            {
               Description = "Law Avenue extends to the west.\
", 
               Direction = "west", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21021, 
               Distance = 0, 
            }, 
         }, 
         Description = "&W You stand at the intersection of Anna Avenue and Law Avenue.  Gazing to\
the south, you see the massive south Docking bay of Coral City. It is\
there most new traders enter the city. It also there that new bounty\
hunters enter. The newly covered roads of Anna Avenue and Law Avenue lie\
in the four cardinal directions.\
", 
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
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "Intersection of Anna Avenue and Law Avenue", 
         Tunnel = 0, 
         Vnum = 21020, 
         Sector = "city", 
      }, 
      [21021] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21073, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "Law Avenue and Anna Road cross to the east.\
", 
               Direction = "east", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21020, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "Law Avenue ranges to the west.\
", 
               Direction = "west", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21022, 
               Distance = 0, 
            }, 
         }, 
         Description = "&W You are traveling down one of the newly covered section of Law Avenue at\
a brisk pace. To the north is the Mon Calamrian Factory , a building known\
throughout the the world for its rare metal melting.  You feel almost like\
paying the building a visit.  Law Avenue extends to the east and west.\
", 
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
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "Law Avenue", 
         Tunnel = 0, 
         Vnum = 21021, 
         Sector = "city", 
      }, 
      [21022] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "A fashion shop is situated to the north.\
", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Direction = "north", 
               Key = -1, 
               Keyword = "door", 
               DestinationVnum = 21066, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "Law Avenue extends to the east.\
", 
               Direction = "east", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21021, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "Law Avenue stretches westward.\
", 
               Direction = "west", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21023, 
               Distance = 0, 
            }, 
         }, 
         Description = "&W You are walking down a rather commercial part of Law Avenue. Merchants\
and droids hassle you to spend your credits as you attempt to continue on\
your way. Glancing to the north, you see  the only shop worth visiting,\
owned by the respectable Lokist the Tailor.  Law Avenue stretches to the\
east and west. \
", 
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
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "Law Avenue", 
         Tunnel = 0, 
         Vnum = 21022, 
         Sector = "city", 
      }, 
      [21023] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Direction = "north", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21186, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "Law Avenue continues in this direction.\
", 
               Direction = "east", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21022, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "Law Avenue clashes with Monock Road to the west.\
", 
               Direction = "west", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21024, 
               Distance = 0, 
            }, 
         }, 
         Description = "&W This stretch of Law Avenue is well trimed and well kept, like most of\
the streets now in Coral City.  Looking northward, you see a small defense\
building that looks like it saw some where and tear twenty years  ago.\
Most of the remains are unenterable.  The lengthy polished rock road\
extends to the east and west. \
", 
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
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "Law Avenue", 
         Tunnel = 0, 
         Vnum = 21023, 
         Sector = "city", 
      }, 
      [21024] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "Monock Road lies to the north.\
", 
               Direction = "north", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21025, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "Law Avenue lies to the east.\
", 
               Direction = "east", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21023, 
               Distance = 0, 
            }, 
         }, 
         Description = "&W Monock Road and Law Avenue come together here to form one of the four\
corners of Coral City.  A metal staircase leads up onto the main city's\
Security Post, from where even the strongest Imperial Stormtrooper  can be\
repelled. Monock Road lies to the north, while Law Avenue stretches\
eastward.\
", 
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
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "Meeting of Monock Road and Law Avenue", 
         Tunnel = 0, 
         Vnum = 21024, 
         Sector = "city", 
      }, 
      [21025] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "Thieves Alley is east of here.\
", 
               Direction = "north", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21026, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "The Thieves Alley is east of here.\
", 
               Direction = "east", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21063, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "One of the four corners of Akatamer is located to the south.\
", 
               Direction = "south", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21024, 
               Distance = 0, 
            }, 
         }, 
         Description = "&p You pick up your pace as you travel down this portion of Monock Road.\
\
Gazing eastward, you see what is easily the darkest alley in the city,\
though a glimmer of light can be seen flickering in the shadows of the\
slim street.  To the north is an intersection, while Monock Road continues\
to the south. \
", 
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
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "Monock Road", 
         Tunnel = 0, 
         Vnum = 21025, 
         Sector = "city", 
      }, 
      [21026] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "Monock Road lies in this direction.\
", 
               Direction = "north", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21027, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "You gaze at the pavillions and shops of Trading Post  Street.\
", 
               Direction = "east", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21045, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "To the south is Monock Road.\
", 
               Direction = "south", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21025, 
               Distance = 0, 
            }, 
         }, 
         Description = "&Y You stand at the intersection of Trading Post  Street and Monock Road. \
A wall towers over you to the west, keeping intruders (mostly Quarren) out\
of Coral City unannounced.  To the east are the newly built shops of Coral\
City, while Monock Road continues to the north and south.\
", 
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
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "Intersection of Trading Post  Street and Monock Road", 
         Tunnel = 0, 
         Vnum = 21026, 
         Sector = "city", 
      }, 
      [21027] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "Barster Road and Monock Road cross to the north.\
", 
               Direction = "north", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21028, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "Trading Post  Street and Monock Road cross just south of here.\
", 
               Direction = "south", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21026, 
               Distance = 0, 
            }, 
         }, 
         Description = "&p You are walking down a poorer section of Monock Road.  The carved rock\
roads  seem unkept and poorly made, definitely unusual in this city which\
represents hope and order.  The street ranges to the north and south.\
", 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "Monock Road", 
         Tunnel = 0, 
         Vnum = 21027, 
         Sector = "city", 
      }, 
      [21028] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "The metallic streets of Monock Road lie to the north.\
", 
               Direction = "north", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21029, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "Walking in this direction will lead you into the very heart of the city.\
", 
               Direction = "east", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21041, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "Monock Road lies to the south.\
", 
               Direction = "south", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21027, 
               Distance = 0, 
            }, 
            [4] = 
            {
               Description = "To the west is the west Docking bay of Akatamer.\
", 
               Direction = "west", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21088, 
               Distance = 0, 
            }, 
         }, 
         Description = "&p You stand at the intersection of Barster Road and Monock Road.  Gazing\
to the west, you see the huge west Docking bay of Coral City.  The carved\
rock roads of Barster  and Monock  lie in the four cardinal directions.\
", 
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
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "Intersection of Barster Road and Monock Road", 
         Tunnel = 0, 
         Vnum = 21028, 
         Sector = "city", 
      }, 
      [21029] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "Monock Road stretches northward.\
", 
               Direction = "north", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21030, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "The intersection of Barster Road and Monock Road is south of here.\
", 
               Direction = "south", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21028, 
               Distance = 0, 
            }, 
         }, 
         Description = "&p You stand at the intersection of Barster Road and Monock Road.  Gazing\
to the west, you see the huge west Docking bay of Coral City.  The carved\
rock roads of Barster  and Monock  lie in two directions north and south.\
", 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "Monock Road", 
         Tunnel = 0, 
         Vnum = 21029, 
         Sector = "city", 
      }, 
      [21030] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "Monock Road extends northward.\
", 
               Direction = "north", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21031, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21067, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "Monock Road stretches southward.\
", 
               Direction = "south", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21029, 
               Distance = 0, 
            }, 
         }, 
         Description = "&pYou walk through a poor, almost abandoned section of Coaral City. \
Indeed, this portion of Monock Road is neither traveled nor clean. The\
worn carved surface road continues to the north and south.This area is one\
the mayor is not palnning to tackle for awile. \
", 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "Monock Road", 
         Tunnel = 0, 
         Vnum = 21030, 
         Sector = "city", 
      }, 
      [21031] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "Monock Road meets with Security Road to the north.\
", 
               Direction = "north", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21032, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "Monock Road lies to the south.\
", 
               Direction = "south", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21030, 
               Distance = 0, 
            }, 
         }, 
         Description = "&pYou walk through a poor, almost abandoned section of Coaral City. \
Indeed, this portion of Monock Road is neither traveled nor clean. The\
worn carved surface road continues to the north and south.This area is one\
the mayor is not planning to tackle for awile.\
", 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "Monock Road", 
         Tunnel = 0, 
         Vnum = 21031, 
         Sector = "city", 
      }, 
      [21032] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "Security Road lies to the east.\
", 
               Direction = "east", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21033, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "Monock Road lies to the south.\
", 
               Direction = "south", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21031, 
               Distance = 0, 
            }, 
         }, 
         Description = "&R Monock Road and Security Road come together here to form one of the four\
corners of Coral City.  From here you can smell the ocean sea salt form\
the nearby breakwall to the west. It reminds you of the fun you have\
swimming in the huge ocean that surrounds this city. Monock Road lies to\
the south, while Security Road stretches \
", 
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
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "Meeting of Monock Road and Security Road", 
         Tunnel = 0, 
         Vnum = 21032, 
         Sector = "city", 
      }, 
      [21033] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "Security Road stretches eastward.\
", 
               Direction = "east", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21034, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "Security Road and Monock Road meet to the west.\
", 
               Direction = "west", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21032, 
               Distance = 0, 
            }, 
         }, 
         Description = "&RYou stand on  Security Road staring at the two suns or the stars above\
your head, depending on time.  This newly paved street is made of polished\
rock that glimers when the first sun comes up. In the distence you can see\
Mon Calamrian children playing in the nearby park. \
", 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "Security Road", 
         Tunnel = 0, 
         Vnum = 21033, 
         Sector = "city", 
      }, 
      [21034] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "Security Road lies to the east.\
", 
               Direction = "east", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21035, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21131, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "Security Road continues to the west.\
", 
               Direction = "west", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21033, 
               Distance = 0, 
            }, 
         }, 
         Description = "&RYou travel down a newly lanscaped area of Security Road.  In the new park\
created to the south you can hear strange animal noises that remind you of\
the days back when you used to go to the galactic zoo.  The mysterious\
melody relaxes you as you start to whistle with the birds in a city of\
peace and goodness.  Security Road stretches east and west.\
", 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "Security Road", 
         Tunnel = 0, 
         Vnum = 21034, 
         Sector = "city", 
      }, 
      [21035] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "The intersection of Anna Avenue and Security Road is east of here.\
", 
               Direction = "east", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21004, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "Security Road stretches westward.\
", 
               Direction = "west", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21034, 
               Distance = 0, 
            }, 
         }, 
         Description = "&R You are walking cautiously through this part of Security Road.  Lately\
you have heard rumors of thieves prowling these parts, mocking the very\
name of the road.  But that is mostly not likely. The newly paved street\
\
ranges to the east and west.\
", 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "Security Road", 
         Tunnel = 0, 
         Vnum = 21035, 
         Sector = "city", 
      }, 
      [21036] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "Barster Road stretches onward in this direction.\
", 
               Direction = "east", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21037, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "The road to the west leads to Akatamer Square.\
", 
               Direction = "west", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21000, 
               Distance = 0, 
            }, 
         }, 
         Description = "&c You quicken your pace as you walk down the newly carved road of Barster\
. With very little to see this just becomes another leg on your journey\
through town. Gazing to the north, you see the the two suns in the sky in\
all its beauty.  To the east and west is the  Barster Road  \
", 
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
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "Barster Road", 
         Tunnel = 0, 
         Vnum = 21036, 
         Sector = "city", 
      }, 
      [21037] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "Barster Road continues in this direction.\
", 
               Direction = "east", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21038, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "The enterence to Akatamer's Tower of Jedi's are to the south.\
", 
               Direction = "south", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21126, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "Barster Road continues in this direction.\
", 
               Direction = "west", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21036, 
               Distance = 0, 
            }, 
         }, 
         Description = "&c While walking Barster Road, you gaze up at the Akatamer medical\
facility, whose entrance lies to the south. New plantlife grows along side\
the road,&G adding a buitiful haze of green. &c The lengthy rock carved\
out road stretches to the east and west.&x\
", 
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
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "Barster Road", 
         Tunnel = 0, 
         Vnum = 21037, 
         Sector = "city", 
      }, 
      [21038] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "The intersection of Barster Road and Luke Street lies to the east.\
", 
               Direction = "east", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21012, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Flags = 
               {
                  [0] = "IsDoor", 
                  [5] = "PickProof", 
               }, 
               Direction = "south", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21133, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "Barster Road stretches to the west as far as the eye can see.\
", 
               Direction = "west", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21037, 
               Distance = 0, 
            }, 
         }, 
         Description = "&c Young and giddy Mon Calmarians pass you as you travel this portion of\
Barster Road.  Gazing southward, you see the illustrious Coral City\
Academy, which has the responsibility of educateting new Mon Calamarian's.\
 The newly carved rock road of Barster  continue to the east and west.\
", 
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
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "Barster Road", 
         Tunnel = 0, 
         Vnum = 21038, 
         Sector = "city", 
      }, 
      [21039] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "The road to the east leads to Akatamer Square.\
", 
               Direction = "east", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21000, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "Barster Road stretches onward as far as the eye can see.\
", 
               Direction = "west", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21040, 
               Distance = 0, 
            }, 
         }, 
         Description = "&c You quicken your pace as you walk down the newly carved road of Barster\
. With very little to see this just becomes another leg on your journey\
through town. Gazing to the north, you see the the two suns in the sky in\
all its beauty.  To the east is Coral City Square, while Barster Road\
leads on to the west.   \
", 
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
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "Barster Road", 
         Tunnel = 0, 
         Vnum = 21039, 
         Sector = "city", 
      }, 
      [21040] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "Barster Road stretches further eastward.\
", 
               Direction = "east", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21039, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "The town hotel  awaits.\
", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Direction = "south", 
               Key = -1, 
               Keyword = "door", 
               DestinationVnum = 21069, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "Barster Road stretches further westward.\
", 
               Direction = "west", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21041, 
               Distance = 0, 
            }, 
         }, 
         Description = "&cHere the city's only and extremly large  Hotel stands to the south It was\
constructed fromt he remains of crashed space vessel. It is considered\
sheek to stay in this coverted junk heap (Who figures?)You make note to\
remember  this location for later.  Gazing to the east and west, you can\
see nothing but Barster Road. \
", 
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
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "Barster Road", 
         Tunnel = 0, 
         Vnum = 21040, 
         Sector = "city", 
      }, 
      [21041] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "Barster Road continues in this direction.\
", 
               Direction = "east", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21040, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "The tavern lies to the south.\
", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Direction = "south", 
               Key = -1, 
               Keyword = "door", 
               DestinationVnum = 21068, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "Barster Road and Monock Road cross to the west.\
", 
               Direction = "west", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21028, 
               Distance = 0, 
            }, 
         }, 
         Description = "&c Cheery laughter can be heard in this section of Barster Road.  Listening\
closely, you are not surprised to find the laughter coming from the\
Cantinia to the south.  People from differnt planets passing by also seem\
interested in those who can find joy in these dark times. This tavern is\
best place to find new friends, bith good and evil. Barster Road ranges to\
the east and west.\
", 
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
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "Barster Road", 
         Tunnel = 0, 
         Vnum = 21041, 
         Sector = "city", 
      }, 
      [21042] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "The road to the north leads to Akatamer Square.\
", 
               Direction = "north", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21000, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "A bustling intersection lies to the south.\
", 
               Direction = "south", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21043, 
               Distance = 0, 
            }, 
         }, 
         Description = "&PYou are travelling upon the southern portion of Anna Avenue.  The newly\
constructed buildings of the Coral City Trading Post street rise high into\
the air to the east and west.  The metallic road stretches to the north\
and south, where you can see a bustling intersection of Mon Calamrian\
shopers.\
", 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "Anna Avenue", 
         Tunnel = 0, 
         Vnum = 21042, 
         Sector = "city", 
      }, 
      [21043] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "Anna Avenue lies to the north.\
", 
               Direction = "north", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21042, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "You can see the exotic Trading Post s of Akatamer.\
", 
               Direction = "east", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21048, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "Anna Avenue stretches to the south as far as the eye can see.\
", 
               Direction = "south", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21044, 
               Distance = 0, 
            }, 
            [4] = 
            {
               Description = "You can see the exotic Trading Post s of Akatamer.\
", 
               Direction = "west", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21047, 
               Distance = 0, 
            }, 
         }, 
         Description = "&YYou stand at the intersection of Anna Avenue and Trading Post  Street. \
The intersection bustles with activity as citizens go about their\
business. To the east and west runs Trading Post  Street, lined with the\
exotic and local shops of Coral City, while Anna Avenue lies to the north\
and south. \
", 
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
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "Intersection of Anna Avenue and Trading Post  Street", 
         Tunnel = 0, 
         Vnum = 21043, 
         Sector = "city", 
      }, 
      [21044] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "Intersection of Anna Avenue and Trading Post  Street\
", 
               Direction = "north", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21043, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "The intersection of Anna Avenue and Law Avenue lies to the south.\
", 
               Direction = "south", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21020, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "You can't make out any details about the dark alley.\
", 
               Direction = "west", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21065, 
               Distance = 0, 
            }, 
         }, 
         Description = "&PWhile traversing the busy, smooth carved road of Coral City, you notice a\
\
particularly dark alley to the west which citizens commonly avoid. As  you\
 imagine running into a cloaked thief lurking in the shadows. Anna Avenue\
extends to the north and south.\
", 
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
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "Anna Avenue", 
         Tunnel = 0, 
         Vnum = 21044, 
         Sector = "city", 
      }, 
      [21045] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "More shops attract your attention to the east.\
", 
               Direction = "east", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21046, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "A jewelry shop has been set up in the tent to the south.\
", 
               Direction = "south", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21052, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "Trading Post  Street meets up with Monock Road to the west.\
", 
               Direction = "west", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21026, 
               Distance = 0, 
            }, 
         }, 
         Description = "To the north is where a rock seller used to hold shop, on the door is a\
small sign. it does keep your wife happy. Trading Post  Street extends to\
the east and west. \
", 
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
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "Trading Post  Street", 
         Tunnel = 0, 
         Vnum = 21045, 
         Sector = "city", 
      }, 
      [21046] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "The Spice Trader's is to the north.\
", 
               Direction = "north", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21054, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "More shops attract your attention to the east.\
", 
               Direction = "east", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21047, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "The Akatamer mail service is situated in a building to the south.\
\
", 
               Direction = "south", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21053, 
               Distance = 0, 
            }, 
            [4] = 
            {
               Description = "More shops attract your attention to the west.\
", 
               Direction = "west", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21045, 
               Distance = 0, 
            }, 
         }, 
         Description = "&YCitizens of Coral City waddle  around you, anxious to finish their\
shopping. Gazing northward, you can see a female Rodian drying a multitude\
of spices, while to the south you see Coral City's courier service. \
Trading Post  Street ranges to the east and west. \
", 
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
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "Trading Post  Street", 
         Tunnel = 0, 
         Vnum = 21046, 
         Sector = "city", 
      }, 
      [21047] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "You see the intersection of Anna Avenue and Trading Post  Street.\
", 
               Direction = "east", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21043, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "A mapmaker store lies to the south.\
", 
               Direction = "south", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21056, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "More shops attract your attention to the west.\
", 
               Direction = "west", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21046, 
               Distance = 0, 
            }, 
         }, 
         Description = "&YThe newly carved polished stone rock road is buzzing with activity. \
Eager shouts from numerous new buildings encourage potential customers to\
come inspect a shopkeeper's;wares.  To the north is Anikem's new shop,\
while a Map Builder  just moved in to the south.  Trading Post  Street\
stretches to the east and west. \
There is a small note tacked up on the north door.\
", 
         ExtraDescriptions = 
         {
            [1] = 
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
            [2] = 
            {
               Description = "Sorry due to costs of shipping I have moved my shop below closer to the\
\13mine.\
\13", 
               Keyword = "note", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "Trading Post  Street", 
         Tunnel = 0, 
         Vnum = 21047, 
         Sector = "city", 
      }, 
      [21048] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "The barbecue stand lies in this direction.\
", 
               Direction = "north", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21057, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "More shops attract your attention in this direction.\
\
", 
               Direction = "east", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21049, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "You can see a stocky Mon Calamrian repairing equipment.\
", 
               Direction = "south", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21058, 
               Distance = 0, 
            }, 
            [4] = 
            {
               Description = "The intersection of Anna Avenue and Trading Post  Street lies to the west.\
", 
               Direction = "west", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21043, 
               Distance = 0, 
            }, 
         }, 
         Description = "&YThe newly carved rock road is buzzing with activity.  Eager shouts from\
the newly built buildings encourage potential customers to come inspect a\
shopkeeper's wares.  To the north you can smaell the sweet aroma that is\
the Bantha barbecue Shop , while the building to the south is dedicated to\
repairing broken items.  Trading Post  Street stretches to the east and\
west.\
", 
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
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "Trading Post  Street", 
         Tunnel = 0, 
         Vnum = 21048, 
         Sector = "city", 
      }, 
      [21049] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "You can see a bakery to the north.\
", 
               Direction = "north", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21060, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "More shops attract your attention in this direction.\
", 
               Direction = "east", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21050, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "The Bobba waresis to the south.\
", 
               Direction = "south", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21059, 
               Distance = 0, 
            }, 
            [4] = 
            {
               Description = "More shops attract your attention in this direction.\
", 
               Direction = "west", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21048, 
               Distance = 0, 
            }, 
         }, 
         Description = "&YCitizens of Coral City scamper about you, eager to finish their shopping.\
The aroma of fresh bread assails your nose, coming from a bakery from the\
north, and you can see Armory clanging from the wind on the shop to the\
south.ity's armoury to the south.  Trading Post  Street ranges to the east\
and west. \
", 
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
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "Trading Post  Street", 
         Tunnel = 0, 
         Vnum = 21049, 
         Sector = "city", 
      }, 
      [21050] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "The dairy to the north deals in all blue milk dairy products.\
", 
               Direction = "north", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21061, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "Trading Post  Street joins up with Luke Street to the east.\
", 
               Direction = "east", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21014, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "Weapons can be bought or sold in the store to the south.\
", 
               Direction = "south", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21062, 
               Distance = 0, 
            }, 
            [4] = 
            {
               Description = "More shops attract you in this direction.\
\
", 
               Direction = "west", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21049, 
               Distance = 0, 
            }, 
         }, 
         Description = "&YYou smile at the familiar sight of Trading Post  Street and its glorious\
newly built buildings. The buzz of vibro-blades can be heard from the\
south, while the blue milk dairy is situated to the north.  Trading Post \
Street extends east and west. \
", 
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
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "Trading Post  Street", 
         Tunnel = 0, 
         Vnum = 21050, 
         Sector = "city", 
      }, 
      [21051] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21019, 
               Distance = 0, 
            }, 
         }, 
         Description = "", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Interior of City Hall", 
         Vnum = 21051, 
         Sector = "inside", 
      }, 
      [21052] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "An opening in the tent leads back out onto Trading Post  Street.\
", 
               Direction = "north", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21045, 
               Distance = 0, 
            }, 
         }, 
         Description = "&O A locked display box dominates this particular shop.  Under the glass of\
the box are two of the only three known ulti-ma pearls in existence., each\
lying gently upon a miniscule cushion. Various other items are displayed\
in differnt boxes. Hanging from the walls are various paintings, while\
sculptures take up the rest of the floor space. A north door leads back\
out onto Trading Post Street.\
", 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
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
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "The Shining Emerald", 
         Vnum = 21052, 
         Sector = "inside", 
      }, 
      [21053] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "An opening in the building leads back out onto Trading Post  Street.\
", 
               Direction = "north", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21046, 
               Distance = 0, 
            }, 
         }, 
         Description = "&O An immense computer set against the southern wall of the Building has\
been organized into small consoles, each containing letters to and from\
the citizens of Coral City through Star mail.  Errand boys are constantly\
coming in and collecting disks for delivery.  In the center of the room is\
a large glatic_net mail terminal where people from around the world can\
send mail. A door to the north leads back out onto Trading Post  Street .\
", 
         Flags = 
         {
            [18] = "NoDrop", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "Cost - Mail Service is Governemnt Own sorry!\
\13", 
               Keyword = "cost", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Coral City Courier Office", 
         Vnum = 21053, 
         Sector = "inside", 
      }, 
      [21054] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "The opening in the tent leads back out onto Trading Post  Street.\
", 
               Direction = "south", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21046, 
               Distance = 0, 
            }, 
         }, 
         Description = "&OThis newly contructed building is filled with the scent of dried spices.\
Wooden shelves are lined with spices, each of varying colors. A counter\
sits in the center of the room. Walking nearer, you notice a small plaque\
on the counter which reads 'Success lies in Spices'. Dispite numerous\
attempts to outlaw spices , they are still legal in this city. A door\
south leads back out onto Trading Post  Street.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "Cost - 50,000 Must be a smuggler of 40\
\13", 
               Keyword = "cost", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "The Spice dealer", 
         Vnum = 21054, 
         Sector = "inside", 
      }, 
      [21055] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 6882, 
               Distance = 0, 
            }, 
         }, 
         Description = "&O A musty odor fills your nostrils as you inhale.  Shelves hug the walls\
of this newly created building, each shelf filled with  items from the\
mines or ocean floor.  As you begin to inspect several of the shelves, you\
notice they are all covered in dust and dirt.  A square wooden counter\
sits in the center of the room, and to to the south a door leads back out\
onto Trading Post  Street. \
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "Cost - Not for Sale\
\13", 
               Keyword = "cost ", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Anakiem's Rocks", 
         Vnum = 21055, 
         Sector = "inside", 
      }, 
      [21056] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "An opening in the tent leads back out onto Trading Post  Street.\
", 
               Direction = "north", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21047, 
               Distance = 0, 
            }, 
         }, 
         Description = "&OYou find yourself in a rather small and empty shop.  Parchments tied into\
neat packs lie about in an unorganized manner in the back corner.  A\
counter in the center of the room houses numerous state of the art\
Holo-Maps, as well as a couple more computer writing tools. This thin\
printer is havinga hard time converting to new technology, and is even\
contemplating retiring. A door to the  north leads back out onto Trading\
Post  Street. \
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
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
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Maps", 
         Vnum = 21056, 
         Sector = "inside", 
      }, 
      [21057] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "An opening in the tent allows you to return to Trading Post  Street.\
", 
               Direction = "south", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21048, 
               Distance = 0, 
            }, 
         }, 
         Description = "&OThe smell of fresh meat grilled to a perfection as only chef Wannie knows\
how is present in the air of this shop.  Kept cool in frosted vaults, the\
city chef sells his meats here, imported from planets far distant or\
harvested form the ocean. There are a few tables scattered around for you\
to sit at, and share stories with your friends.Through the door to the\
south is Trading Post  Street.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "The Bantha Barbecue Shop", 
         Vnum = 21057, 
         Sector = "inside", 
      }, 
      [21058] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "The opening in the tent leads back out onto Trading Post  Street.\
", 
               Direction = "north", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21048, 
               Distance = 0, 
            }, 
         }, 
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
         Flags = 
         {
            [3] = "Indoors", 
         }, 
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
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "The Unlit saber", 
         Vnum = 21058, 
         Sector = "inside", 
      }, 
      [21059] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "The opening in the tent leads back out onto Trading Post  Street.\
", 
               Direction = "north", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21049, 
               Distance = 0, 
            }, 
         }, 
         Description = "&O This Mon Calamarian is a dedicated creator of armor and shields.  Having\
lost her son to shabby equipment, she took up the job of putting\
protective suits of armor together. She is also  extremly infatuated with\
the legendary Bobba Fett, and collects any holographics  or drawings of\
this great Bounty Hunter. The enterance leads back out north onto Trading\
Post  Street.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "Cost 80,000 plus a Dinner with Bobba Fett\
\13", 
               Keyword = "cost", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Bobba's wares", 
         Vnum = 21059, 
         Sector = "inside", 
      }, 
      [21060] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "An opening in the tent leads back out onto Trading Post  Street.\
", 
               Direction = "south", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21049, 
               Distance = 0, 
            }, 
         }, 
         Description = "&OUpon entering the Akatamer Bakery, you find yourself surrounded by\
citizens of the marvelous city, each waiting in line for their daily\
bread. This Mon Calamrian is famous for his fine baked bread made from\
refined seaweed. This green food is terrific with every meal. The door to\
the south leads back out onto Trading Post  Street. \
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "Cost - 28,000 And a Love for Bread\
\13", 
               Keyword = "cost", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "The Akatamer Bakery", 
         Vnum = 21060, 
         Sector = "inside", 
      }, 
      [21061] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "An opening in the tent leads back out onto Trading Post  Street.\
", 
               Direction = "south", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21050, 
               Distance = 0, 
            }, 
         }, 
         Description = "&OThis small shop smells strongly of blue cheese, as dozens of types of\
cheeses have been laid out and labeled properly on several long shelves. \
You notice many bottles of blue milk, considered to be more important than\
even water, carefully stacked in the northeast corner.  This Mon girl is\
staioned here by here father to sell this rare drink froma seacow. Through\
the door Trading Post  Street lies to the south.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "Cost 28,000 credits a you must marry off His daughter.\
\13", 
               Keyword = "cost", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "The Blue Sea-Cow", 
         Vnum = 21061, 
         Sector = "inside", 
      }, 
      [21062] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "The opening in the tent leads back out onto Trading Post  Street.\
", 
               Direction = "north", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21050, 
               Distance = 0, 
            }, 
         }, 
         Description = "&ORacks line the walls of this store, each filled to the brim with weapons.\
You grin evilly at the items of destruction, and try out a couple on the\
practice dummies hung from the ceiling.  A counter in the center of the\
room is where the keeper of this shop does business.  He is an extremly\
large calamarian who knows his stuff. The door to the north leads back out\
onto Trading Post  Street.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "Cost - 89,000 credits and Engineering\
\13", 
               Keyword = "cost", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Vibro-Fizz", 
         Vnum = 21062, 
         Sector = "inside", 
      }, 
      [21063] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "The Thieves Alley continues in this direction.\
", 
               Direction = "east", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21064, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "Monock Road lies to the west.\
", 
               Direction = "west", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21025, 
               Distance = 0, 
            }, 
         }, 
         Description = "You are walking through a particularly dark and unkempt alley of Coral\
City. Whomp rats scurry across the metallic ground, squeaking at you. \
Empty crates and tattered rags are lying about.  The alley stretches to\
the east and west. \
", 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "Thieves Alley", 
         Tunnel = 0, 
         Vnum = 21063, 
         Sector = "city", 
      }, 
      [21064] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "The Thieves Alley continues in this direction.\
", 
               Direction = "east", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21065, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "The Thieves Alley continues in this direction.\
", 
               Direction = "west", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21063, 
               Distance = 0, 
            }, 
         }, 
         Description = "You are walking through a particularly dark and unkempt alley of Coral\
City. Whomp rats scurry across the metallic ground, squeaking at you. \
Empty crates and tattered rags are lying about.  The alley stretches to\
the east and west. \
", 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "Thieves Alley", 
         Tunnel = 0, 
         Vnum = 21064, 
         Sector = "city", 
      }, 
      [21065] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "Anna Avenue lies to the east.\
", 
               Direction = "east", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21044, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "The Thieves Alley continues in this direction.\
", 
               Direction = "west", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21064, 
               Distance = 0, 
            }, 
         }, 
         Description = "You are walking through a particularly dark and unkempt alley of Akatamer.\
Whomp rats scurry across the metallicground, squeaking at you.  Empty crates and\
tattered rags are lying about.  The alley opens up to Anna Avenue to the\
\
east, while to the west the darkness deepens.\
", 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "Thieves Alley", 
         Tunnel = 0, 
         Vnum = 21065, 
         Sector = "city", 
      }, 
      [21066] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "The door leads back out onto Law Avenue\
", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
                  [21] = "Searchable", 
                  [3] = "Secret", 
               }, 
               Direction = "south", 
               Key = -1, 
               Keyword = "door", 
               DestinationVnum = 21022, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Flags = 
               {
                  [0] = "IsDoor", 
                  [21] = "Searchable", 
                  [11] = "Hidden", 
               }, 
               Direction = "down", 
               Key = -1, 
               Keyword = "hatch", 
               DestinationVnum = 21180, 
               Distance = 0, 
            }, 
         }, 
         Description = "&O The shop you have entered smells heavily of dried bantha leather. \
Gazing about, you see all manners of clothing, from leather to silk.  A\
coral counter lines the northern wall of the shop, and several stalls line\
the eastern wall, where you can try on your clothes (after you pay for\
them.).  A door to the south leads back out onto Law Avenue. \
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Annir's Clothing", 
         Vnum = 21066, 
         Sector = "inside", 
      }, 
      [21067] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21030, 
               Distance = 0, 
            }, 
         }, 
         Description = "&O You walk into a large shop which smells of Banthas.  Behind the long\
wooden counter are dozens of cages containing varying types of animals. \
You can hear the sounds of creatures coming from a store room in the back\
of the shop.  A path to the west leads back out onto the busy Monnock St.\
", 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Companions and Mounts", 
         Vnum = 21067, 
         Sector = "inside", 
      }, 
      [21068] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "A door leads out onto Barster Road.\
", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Direction = "north", 
               Key = -1, 
               Keyword = "door", 
               DestinationVnum = 21041, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "The hotel  lies to the east.\
", 
               Direction = "east", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21069, 
               Distance = 0, 
            }, 
         }, 
         Description = "&OYou enter the city's lavish cantinia, in fact the only bar inside the\
city;itself, appropriately connected to the city's hotel  to the east\
through a hallway. That way visitors can just get drunk then head over to\
bed. Smoke and the smell of alcohol mix with laughter, quickly gives you a\
dull headache. To the east is the town hotel , while the fresh air of the\
\
outdoors stands at bay to the north.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "Cost 160,000 credits  (includes both stores)\
\13", 
               Keyword = "cost", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "The Tavern", 
         Vnum = 21068, 
         Sector = "inside", 
      }, 
      [21069] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "Barster Road lies to the north.\
", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Direction = "north", 
               Key = -1, 
               Keyword = "door", 
               DestinationVnum = 21040, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "The tavern lies to the west.\
", 
               Direction = "west", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21068, 
               Distance = 0, 
            }, 
         }, 
         Description = "&OHere a weary traveller can seek a good rest in comfort without fear of\
theft or, worse yet, murder.  A long counter stretches across much of the\
room, and for a few credits the hotel keeper will gladly rent you one of\
his rooms.  Drunken laughter emerges from a hall to the west.  To the\
south beyond a door barred by the hotel keeper are the rooms.\
 \
You may safely quit here.\
", 
         Flags = 
         {
            [23] = "Hotel", 
            [10] = "Safe", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "Cost 160,000 credits  (includes both stores)\
\13", 
               Keyword = "cost", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "The Akatamer hotel ", 
         Vnum = 21069, 
         Sector = "inside", 
      }, 
      [21071] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21127, 
               Distance = 0, 
            }, 
         }, 
         Description = "This room is for the severly wounded. Please donot take advantage of this\
great Facility or the Mon Calamarian Officals will have to remove the\
bacta tank. \
", 
         Flags = 
         {
            [16] = "Silence", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "100", 
               Code = "mpechoat $n The healing warmth of the bacta spreads over your\
body.\
feel heal $n\
", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "&C Inside Bacta Tank", 
         Vnum = 21071, 
         Sector = "inside", 
      }, 
      [21072] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21100, 
               Distance = 0, 
            }, 
         }, 
         Description = "&z This lavish room comes complete with plush bantha leather seat benches.\
A brand new drinking fountain that diperses fresh salt water for drinking.\
And a new cooking droid here to serve some of the great Mon Calamari food.\
The floor is a soft grey colored marble like rock sanded to a smooth\
surface. \
", 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Restarea", 
         Vnum = 21072, 
         Sector = "inside", 
      }, 
      [21073] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Direction = "north", 
               Key = -1, 
               Keyword = "door", 
               DestinationVnum = 21151, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21021, 
               Distance = 0, 
            }, 
         }, 
         Description = "&c &C You stand before huge doors of the Krantz mining ore factory complex.\
 the doors are kept closed, yet the bared windows are cracked open to give\
all the heat and noise inside a means of escaping.  The doors are made of\
some sort of black metal, most likely found on the ocean floor  seemingly\
impenatrable, and has the Krontz symbol K carved into them  You are not\
sure if the doors are meant to keep intruders out, or workers in...\
", 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Factory Enterence", 
         Vnum = 21073, 
         Sector = "inside", 
      }, 
      [21074] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "Two roads cross to the north.\
", 
               Direction = "north", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21020, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "The Docking bay leads outside of Akatamer.\
", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Direction = "south", 
               Key = 21073, 
               Keyword = "Docking bay", 
               DestinationVnum = 21075, 
               Distance = 0, 
            }, 
         }, 
         Description = "&z You stand inside the southern Docking bay of Coral City. Ships of all\
sizes line the many enterences.There is only four docking bays on Mon\
Calamari that is known to the public and all four exsist on the outskirts\
of the city. They were originally created as Imperial Slave ports but were\
later converted to Docking bays.To the north is the intersection of Anna\
Avenue and Law Avenue.\
", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Inside the Southern Docking bay", 
         Vnum = 21074, 
         Sector = "city", 
      }, 
      [21075] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "The Docking bay leads into the city of Akatamer.\
", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Direction = "north", 
               Key = 21073, 
               Keyword = "Docking bay", 
               DestinationVnum = 21074, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "A path begins to the east.\
", 
               Direction = "east", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21123, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "A path begins to the west.\
", 
               Direction = "west", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21076, 
               Distance = 0, 
            }, 
         }, 
         Description = "&c You continue to travel on  a carved out rock road rounding the southern\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the eastand west. While to the north you\
can hear the sounds of ships landing and taking off.\
", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
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
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Outside the Southern Docking bay", 
         Vnum = 21075, 
         Sector = "city", 
      }, 
      [21076] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "To the east the southern Docking bay of Akatamer.\
", 
               Direction = "east", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21075, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "The road continues to the west.\
", 
               Direction = "west", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21077, 
               Distance = 0, 
            }, 
         }, 
         Description = "&c You continue to travel on  a carved out rock road rounding the southern\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
\
the city.  The road stretches to the east and west. \
", 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "On a Road west of the Southern Docking Bay", 
         Tunnel = 0, 
         Vnum = 21076, 
         Sector = "city", 
      }, 
      [21077] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "The road continues to the east.\
", 
               Direction = "east", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21076, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "The road continues to the west.\
", 
               Direction = "west", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21078, 
               Distance = 0, 
            }, 
         }, 
         Description = "&c You are on carved out rock road rounding the southern wall of Akatamer.\
The familiar sound of running water emanates from the Mon Calamarian ocean\
to the south. The large breakwater was created to keep the nasty wind\
storms that come up from spalshing 50 ft. waves upon the city.  The road\
stretches to the east and west. \
", 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "On a Road Rounding Coral City.", 
         Tunnel = 0, 
         Vnum = 21077, 
         Sector = "city", 
      }, 
      [21078] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "The path continues to the east.\
", 
               Direction = "east", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21077, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "The trail continues to the west.\
", 
               Direction = "west", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21079, 
               Distance = 0, 
            }, 
         }, 
         Description = "&c You continue to travel on  a carved out rock road rounding the southern\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the east and west. \
", 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "On a Road Rounding Coral City.", 
         Tunnel = 0, 
         Vnum = 21078, 
         Sector = "city", 
      }, 
      [21079] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "The path continues to the east.\
", 
               Direction = "east", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21078, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "The road continues to the west.\
", 
               Direction = "west", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21080, 
               Distance = 0, 
            }, 
         }, 
         Description = "&c You continue to travel on  a carved out rock road rounding the southern\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the east and west.  You can hear the\
ocean getting nearer to the west.  \
", 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "On a Road Rounding Coral City.", 
         Tunnel = 0, 
         Vnum = 21079, 
         Sector = "city", 
      }, 
      [21080] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "The road continues to the east.\
", 
               Direction = "east", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21079, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "The path continues to the west.\
", 
               Direction = "west", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21081, 
               Distance = 0, 
            }, 
         }, 
         Description = "&c You continue to travel on  a carved out rock road rounding the southern\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the east and west. You can see the ocean\
front just off a dock to the west. \
", 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "On a Road Rounding Coral City.", 
         Tunnel = 0, 
         Vnum = 21080, 
         Sector = "city", 
      }, 
      [21081] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "A path begins to the north.\
", 
               Direction = "north", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21082, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "A road begins to the east.\
", 
               Direction = "east", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21080, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 6908, 
               Distance = 0, 
            }, 
         }, 
         Description = "&c  You have come to the western most spot of the city. before you is a\
large dock leading out to the ocean..  Its supports are cracked,and the\
entire structure seems liable to fall into the ocean at any moment. To the\
north and east are two plain man made roads. \
", 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "Before the Dock", 
         Tunnel = 0, 
         Vnum = 21081, 
         Sector = "city", 
      }, 
      [21082] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "The path continues to the north.\
", 
               Direction = "north", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21083, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "The trail continues to the south.\
", 
               Direction = "south", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21081, 
               Distance = 0, 
            }, 
         }, 
         Description = "&c You continue to travel on  a carved out rock road rounding the western\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the north and south.\
", 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "On a Road Rounding Coral City.", 
         Tunnel = 0, 
         Vnum = 21082, 
         Sector = "city", 
      }, 
      [21083] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "The trail continues to the north.\
", 
               Direction = "north", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21084, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "The path continues to the south.\
", 
               Direction = "south", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21082, 
               Distance = 0, 
            }, 
         }, 
         Description = "&c You continue to travel on  a carved out rock road rounding the western\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the north and south.You look into the sky\
and see a common Mon Calamarian bird above.\
", 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "On a Road Rounding Coral City.", 
         Tunnel = 0, 
         Vnum = 21083, 
         Sector = "city", 
      }, 
      [21084] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "The road continues to the north.\
", 
               Direction = "north", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21085, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "The path continues to the south.\
", 
               Direction = "south", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21083, 
               Distance = 0, 
            }, 
         }, 
         Description = "&c You continue to travel on  a carved out rock road rounding the western\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the north and south. A cool ocean breeze\
crosses your skin. \
", 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "On a Road Rounding Coral City.", 
         Tunnel = 0, 
         Vnum = 21084, 
         Sector = "city", 
      }, 
      [21085] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "The path continues to the north.\
", 
               Direction = "north", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21086, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "The road continues to the south.\
", 
               Direction = "south", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21084, 
               Distance = 0, 
            }, 
         }, 
         Description = "&c You continue to travel on  a carved out rock road rounding the western\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the north and south. A cool ocean breeze\
crosses your skin. \
", 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "On a Road Rounding Coral City.", 
         Tunnel = 0, 
         Vnum = 21085, 
         Sector = "city", 
      }, 
      [21086] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "The western entrance to Akatamer lies to the north.\
", 
               Direction = "north", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21087, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "The Water Shuttle continues rounding the city wall of Akatamer.\
", 
               Direction = "south", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21085, 
               Distance = 0, 
            }, 
         }, 
         Description = "&c You continue to travel on  a carved out rock road rounding the western\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the north and south. \
", 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "On a Road south of the Western Docking Bay", 
         Tunnel = 0, 
         Vnum = 21086, 
         Sector = "city", 
      }, 
      [21087] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "A path begins to the north.\
", 
               Direction = "north", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21089, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "The Docking bay leads into the city of Akatamer.\
", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Direction = "east", 
               Key = 21070, 
               Keyword = "Docking bay", 
               DestinationVnum = 21088, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "A road begins to the south.\
", 
               Direction = "south", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21086, 
               Distance = 0, 
            }, 
         }, 
         Description = "&c You continue to travel on  a carved out rock road rounding the western\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the north and south. To the east you can\
hear alot of starship activity coming from the nearby docking bay.\
", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Outside the Western Docking bay", 
         Vnum = 21087, 
         Sector = "city", 
      }, 
      [21088] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "Two roads cross to the east.\
", 
               Direction = "east", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21028, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "The road continues deep into the metallic waste land s of Haon Dor.\
", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Direction = "west", 
               Key = 21070, 
               Keyword = "Docking bay", 
               DestinationVnum = 21087, 
               Distance = 0, 
            }, 
         }, 
         Description = "&z You stand in the western dockingbay, do to the massive damage this place\
took by the empire , only small shuttles can enter this docking bay. This\
platform was designed as a slave port for Mon Calamrian workers by the\
Empire years ago, but were later easily converted in to Docking Bay's for\
the Rebellion's greatest ship builder. You can hear the soft wind of the\
ocean to the west.\
", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Inside the Western Docking bay", 
         Vnum = 21088, 
         Sector = "city", 
      }, 
      [21089] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "The path continues to the north.\
", 
               Direction = "north", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21090, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "The western Docking bay is to the south.\
", 
               Direction = "south", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21087, 
               Distance = 0, 
            }, 
         }, 
         Description = "&c You continue to travel on  a carved out rock road rounding the western\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the north and south. To the south you can\
hear alot of starship activity coming from the nearby docking bay.\
", 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "On a Road north of the Western Docking Bay", 
         Tunnel = 0, 
         Vnum = 21089, 
         Sector = "city", 
      }, 
      [21090] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "The path continues to the north.\
", 
               Direction = "north", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21091, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "The road continues to the south.\
", 
               Direction = "south", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21089, 
               Distance = 0, 
            }, 
         }, 
         Description = "&c You continue to travel on  a carved out rock road rounding the western\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the north and south. \
", 
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
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "On a Road Rounding Coral City.", 
         Tunnel = 0, 
         Vnum = 21090, 
         Sector = "city", 
      }, 
      [21091] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "The path continues to the north.\
", 
               Direction = "north", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21092, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "The road continues to the south.\
", 
               Direction = "south", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21090, 
               Distance = 0, 
            }, 
         }, 
         Description = "&c You continue to travel on  a carved out rock road rounding the western\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the north and south. \
", 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "On a Road Rounding Coral City.", 
         Tunnel = 0, 
         Vnum = 21091, 
         Sector = "city", 
      }, 
      [21092] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "The path continues to the north.\
", 
               Direction = "north", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21093, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "The trail continues to the south.\
", 
               Direction = "south", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21091, 
               Distance = 0, 
            }, 
         }, 
         Description = "&c You continue to travel on  a carved out rock road rounding the western\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the north and south. \
", 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "On a Road Rounding Coral City.", 
         Tunnel = 0, 
         Vnum = 21092, 
         Sector = "city", 
      }, 
      [21093] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "A gentle sea breeze is coming in from the north.\
", 
               Direction = "north", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21094, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "The path continues to the south.\
", 
               Direction = "south", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21092, 
               Distance = 0, 
            }, 
         }, 
         Description = "&c You continue to travel on  a carved out rock road rounding the western\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the north and south. \
", 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "On a Road Rounding Coral City.", 
         Tunnel = 0, 
         Vnum = 21093, 
         Sector = "city", 
      }, 
      [21094] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "The path continues to the east.\
", 
               Direction = "east", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21095, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "The road continues to the south.\
", 
               Direction = "south", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21093, 
               Distance = 0, 
            }, 
         }, 
         Description = "&c You continue to travel on  a carved out rock road rounding the western\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the east and south. \
\
", 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "On a Road Rounding Coral City.", 
         Tunnel = 0, 
         Vnum = 21094, 
         Sector = "city", 
      }, 
      [21095] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "The path continues to the east.\
", 
               Direction = "east", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21096, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "The road continues to the west.\
", 
               Direction = "west", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21094, 
               Distance = 0, 
            }, 
         }, 
         Description = "&c You continue to travel on  a carved out rock road rounding the northern\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the east and west. \
", 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "On a Road Rounding Coral City.", 
         Tunnel = 0, 
         Vnum = 21095, 
         Sector = "city", 
      }, 
      [21096] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "The trail continues to the east.\
", 
               Direction = "east", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21097, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "The path continues to the west.\
", 
               Direction = "west", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21095, 
               Distance = 0, 
            }, 
         }, 
         Description = "&c You continue to travel on  a carved out rock road rounding the northern\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the east and west. \
", 
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
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "On a Road Rounding Coral City.", 
         Tunnel = 0, 
         Vnum = 21096, 
         Sector = "city", 
      }, 
      [21097] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "The road continues to the east.\
", 
               Direction = "east", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21098, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "The path continues to the west.\
", 
               Direction = "west", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21096, 
               Distance = 0, 
            }, 
         }, 
         Description = "&c You continue to travel on  a carved out rock road rounding the northern\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the east and west. You can feel a soft\
breeze from the ocean beyond.\
", 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "On a Road Rounding Coral City.", 
         Tunnel = 0, 
         Vnum = 21097, 
         Sector = "city", 
      }, 
      [21098] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "Akatamer's northern Docking bay is to the east.\
", 
               Direction = "east", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21099, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "The road continues to the west.\
", 
               Direction = "west", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21097, 
               Distance = 0, 
            }, 
         }, 
         Description = "&c You continue to travel on  a carved out rock road rounding the northern\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the east and west. You can feel a soft\
drop of water from the ocean beyond.\
", 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "On the Road West of the Northern Docking Bay", 
         Tunnel = 0, 
         Vnum = 21098, 
         Sector = "city", 
      }, 
      [21099] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "The path begins to the east.\
", 
               Direction = "east", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21101, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "The Docking bay leads into Akatamer.\
", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Direction = "south", 
               Key = 21071, 
               Keyword = "Docking bay", 
               DestinationVnum = 21100, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "The road begins to the west.\
", 
               Direction = "west", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21098, 
               Distance = 0, 
            }, 
         }, 
         Description = "&c You continue to travel on  a carved out rock road rounding the northern\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the east and west. To the south you can\
hear alot of hustle and bustle of ships taking off.\
\
", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Outside the Northern Docking bay", 
         Vnum = 21099, 
         Sector = "field", 
      }, 
      [21100] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "The Docking bay leads out of Akatamer.\
", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Direction = "north", 
               Key = 21071, 
               Keyword = "Docking bay", 
               DestinationVnum = 21099, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21072, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "Two roads meet to the south.\
", 
               Direction = "south", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21004, 
               Distance = 0, 
            }, 
         }, 
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
         Flags = 
         {
            [2] = "NoMob", 
            [4] = "CanLand", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Inside the Northern Docking bay", 
         Vnum = 21100, 
         Sector = "city", 
      }, 
      [21101] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "The trail continues to the east.\
", 
               Direction = "east", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21102, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "Akatamer's northern Docking bay is to the west.\
", 
               Direction = "west", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21099, 
               Distance = 0, 
            }, 
         }, 
         Description = "&c You continue to travel on  a carved out rock road rounding the northern\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the east and west. To the west you can\
hear alot of hustle and bustle of ships taking off.\
", 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "On the Road East of the Northern Docking Bay", 
         Tunnel = 0, 
         Vnum = 21101, 
         Sector = "city", 
      }, 
      [21102] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "The road continues to the east.\
", 
               Direction = "east", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21103, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "The path continues to the west.\
", 
               Direction = "west", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21101, 
               Distance = 0, 
            }, 
         }, 
         Description = "&c You continue to travel on  a carved out rock road rounding the northern\
wall of Coral City.  The familiar sound of running water emanates from the\
\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the east and west. \
", 
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
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "On a Road Rounding Coral City.", 
         Tunnel = 0, 
         Vnum = 21102, 
         Sector = "city", 
      }, 
      [21103] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "The road continues to the east.\
", 
               Direction = "east", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21105, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "The trail continues to the west.\
", 
               Direction = "west", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21102, 
               Distance = 0, 
            }, 
         }, 
         Description = "&c You continue to travel on  a carved out rock road rounding the northern\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the east and west. \
", 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "On a Road Rounding Coral City.", 
         Tunnel = 0, 
         Vnum = 21103, 
         Sector = "city", 
      }, 
      [21105] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "The path continues to the east.\
", 
               Direction = "east", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21106, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "The road continues to the west.\
", 
               Direction = "west", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21103, 
               Distance = 0, 
            }, 
         }, 
         Description = "&c You continue to travel on  a carved out rock road rounding the northern\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the east and west. You see a Mon Clamrian\
bird soaring in the sky.\
", 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "On a Road Rounding Coral City.", 
         Tunnel = 0, 
         Vnum = 21105, 
         Sector = "city", 
      }, 
      [21106] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "The path continues to the south.\
", 
               Direction = "south", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21107, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "The path stretches westward.\
\
", 
               Direction = "west", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21105, 
               Distance = 0, 
            }, 
         }, 
         Description = "&c You continue to travel on  a carved out rock road rounding the northern\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the South and west. \
", 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "On a Road Rounding Coral City.", 
         Tunnel = 0, 
         Vnum = 21106, 
         Sector = "city", 
      }, 
      [21107] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "The path curves around the northeastern corner.\
", 
               Direction = "north", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21106, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "The road continues to the south.\
", 
               Direction = "south", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21108, 
               Distance = 0, 
            }, 
         }, 
         Description = "&c You continue to travel on  a carved out rock road rounding the eastern\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from splashing 50 ft. waves upon\
the city.  The road stretches to the South and North. \
", 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "On a Road Rounding Coral City.", 
         Tunnel = 0, 
         Vnum = 21107, 
         Sector = "city", 
      }, 
      [21108] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "The trail stretches northward.\
", 
               Direction = "north", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21107, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "The path continues to the south.\
", 
               Direction = "south", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21109, 
               Distance = 0, 
            }, 
         }, 
         Description = "&c You walk on  a carved out rock road rounding the eastern wall of Coral\
City.  The familiar sound of running water emanates from the Mon\
Calamarian ocean to the north. The large breakwater was created to keep\
\
the nasty wind storms that come up from splashing 50 ft. waves upon the\
city.  The road stretches to the South and North.  \
", 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "On a Road Rounding Coral City.", 
         Tunnel = 0, 
         Vnum = 21108, 
         Sector = "city", 
      }, 
      [21109] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "The road heads northward.\
", 
               Direction = "north", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21108, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "The road extends to the south.\
", 
               Direction = "south", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21110, 
               Distance = 0, 
            }, 
         }, 
         Description = "&c You walk on  a carved out rock road rounding the eastern wall of Coral\
City.  The familiar sound of running water emanates from the Mon\
Calamarian ocean to the north. The large breakwater was created to keep\
the nasty wind storms that come up from splashing 50 ft. waves upon the\
city.  The road stretches to the South and North.  \
\
", 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "On a Road Rounding Coral City.", 
         Tunnel = 0, 
         Vnum = 21109, 
         Sector = "city", 
      }, 
      [21110] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "The path continues to the north.\
", 
               Direction = "north", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21109, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "The road continues to the south.\
", 
               Direction = "south", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21111, 
               Distance = 0, 
            }, 
         }, 
         Description = "&c You walk on  a carved out rock road rounding the eastern wall of Coral\
City.  The familiar sound of running water emanates from the Mon\
Calamarian ocean to the north. The large breakwater was created to keep\
the nasty wind storms that come up from splashing 50 ft. waves upon the\
city.  The road stretches to the South and North. \
", 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "On a Road Rounding Coral City.", 
         Tunnel = 0, 
         Vnum = 21110, 
         Sector = "city", 
      }, 
      [21111] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "The path continues to the north.\
", 
               Direction = "north", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21110, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "Akatamer's eastern Docking bay is to the south.\
", 
               Direction = "south", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21112, 
               Distance = 0, 
            }, 
         }, 
         Description = "&c You walk on  a carved out rock road rounding the eastern wall of Coral\
City.  The familiar sound of running water emanates from the Mon\
Calamarian ocean to the north. The large breakwater was created to keep\
the nasty wind storms that come up from splashing 50 ft. waves upon the\
city.  The road stretches to the South and North. To the south you can\
\
hear starships taking off.\
", 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "On the Road North of The Eastern Docking Bay", 
         Tunnel = 0, 
         Vnum = 21111, 
         Sector = "city", 
      }, 
      [21112] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "A path begins to the north.\
", 
               Direction = "north", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21111, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "A road begins to the south.\
", 
               Direction = "south", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21114, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "The Docking bay leads into Akatamer.\
", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Direction = "west", 
               Key = 21072, 
               Keyword = "Docking bay", 
               DestinationVnum = 21113, 
               Distance = 0, 
            }, 
         }, 
         Description = "&c You walk on  a carved out rock road rounding the eastern wall of Coral\
City.  The familiar sound of running water emanates from the Mon\
Calamarian ocean to the north. The large breakwater was created to keep\
the nasty wind storms that come up from splashing 50 ft. waves upon the\
city.  The road stretches to the South and North. To the east you can hear\
starships taking off.\
", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Outside the Eastern Docking bay", 
         Vnum = 21112, 
         Sector = "city", 
      }, 
      [21113] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "The Docking bay leads out of Akatamer.\
", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Direction = "east", 
               Key = 21072, 
               Keyword = "Docking bay", 
               DestinationVnum = 21112, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "Two roads cross to the west.\
", 
               Direction = "west", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21012, 
               Distance = 0, 
            }, 
         }, 
         Description = "&z You stand inside the eastern Docking bay of Coral City.  This docking\
\
bay gets very little use, very little survalanice..and consequently is\
known for it's secretive cargo. To the west is the intersection of Barster\
Road and Luke Street. \
", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Inside the Eastern Docking bay", 
         Vnum = 21113, 
         Sector = "city", 
      }, 
      [21114] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "The eastern Docking bay is to the north.\
", 
               Direction = "north", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21112, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "The road continues to the south.\
", 
               Direction = "south", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21115, 
               Distance = 0, 
            }, 
         }, 
         Description = "&c You walk on  a carved out rock road rounding the eastern wall of Coral\
City.  The familiar sound of running water emanates from the Mon\
Calamarian ocean to the north. The large breakwater was created to keep\
the nasty wind storms that come up from splashing 50 ft. waves upon the\
city.  The road stretches to the South and North. To the north you can\
hear starships taking off.\
", 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "On the Road South of The Eastern Docking Bay", 
         Tunnel = 0, 
         Vnum = 21114, 
         Sector = "city", 
      }, 
      [21115] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "The trail continues to the north.\
", 
               Direction = "north", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21114, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "The path continues to the south.\
", 
               Direction = "south", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21116, 
               Distance = 0, 
            }, 
         }, 
         Description = "&c You walk on  a carved out rock road rounding the eastern wall of Coral\
City.  The familiar sound of running water emanates from the Mon\
Calamarian ocean to the north. The large breakwater was created to keep\
the nasty wind storms that come up from splashing 50 ft. waves upon the\
city.  The road stretches to the South and North. .\
", 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "On a Road Rounding Coral City.", 
         Tunnel = 0, 
         Vnum = 21115, 
         Sector = "city", 
      }, 
      [21116] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "The road continues to the north.\
", 
               Direction = "north", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21115, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "The path continues to the south.\
", 
               Direction = "south", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21117, 
               Distance = 0, 
            }, 
         }, 
         Description = "&c You walk on  a carved out rock road rounding the eastern wall of Coral\
City.  The familiar sound of running water emanates from the Mon\
Calamarian ocean to the north. The large breakwater was created to keep\
the nasty wind storms that come up from splashing 50 ft. waves upon the\
city.  The road stretches to the South and North. .\
", 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "On a Road Rounding Coral City.", 
         Tunnel = 0, 
         Vnum = 21116, 
         Sector = "city", 
      }, 
      [21117] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "The path continues to the north.\
", 
               Direction = "north", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21116, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "The road continues to the south.\
", 
               Direction = "south", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21118, 
               Distance = 0, 
            }, 
         }, 
         Description = "&c You walk on  a carved out rock road rounding the eastern wall of Coral\
City.  The familiar sound of running water emanates from the Mon\
Calamarian ocean to the north. The large breakwater was created to keep\
the nasty wind storms that come up from splashing 50 ft. waves upon the\
city.  The road stretches to the South and North. .\
", 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "On a Road Rounding Coral City.", 
         Tunnel = 0, 
         Vnum = 21117, 
         Sector = "city", 
      }, 
      [21118] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "The path continues to the north.\
", 
               Direction = "north", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21117, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "The road continues to the south.\
", 
               Direction = "south", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21119, 
               Distance = 0, 
            }, 
         }, 
         Description = "&c You walk on  a carved out rock road rounding the eastern wall of Coral\
City.  The familiar sound of running water emanates from the Mon\
Calamarian ocean to the north. The large breakwater was created to keep\
the nasty wind storms that come up from splashing 50 ft. waves upon the\
city.  The road stretches to the South and North. You can feel a soft mist\
coming from the ocean.\
\
", 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "On a Road Rounding Coral City.", 
         Tunnel = 0, 
         Vnum = 21118, 
         Sector = "city", 
      }, 
      [21119] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "The path continues to the north.\
", 
               Direction = "north", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21118, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "The road continues to the west.\
", 
               Direction = "west", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21120, 
               Distance = 0, 
            }, 
         }, 
         Description = "&c You begin to get tired of walking on  a carved out rock road rounding\
the eastern wall of Coral City.  The familiar sound of running water\
emanates from the Mon Calamarian ocean to the north. The large breakwater\
was created to keep the nasty wind storms that come up from splashing 50\
ft. waves upon the city.  The road stretches to the West and North. You\
can feel a soft mist coming from the ocean.\
", 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "On a Road Rounding Coral City.", 
         Tunnel = 0, 
         Vnum = 21119, 
         Sector = "city", 
      }, 
      [21120] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "The path continues to the east.\
", 
               Direction = "east", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21119, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "The road continues to the west.\
", 
               Direction = "west", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21121, 
               Distance = 0, 
            }, 
         }, 
         Description = "&c You begin to get tired of walking on  a carved out rock road rounding\
the southern wall of Coral City.  The familiar sound of running water\
emanates from the Mon Calamarian ocean to the south. The large breakwater\
was created to keep the nasty wind storms that come up from splashing 50\
ft. waves upon the city.  The road stretches to the West and East. You can\
feel a soft mist coming from the ocean.\
", 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "On a Road Rounding Coral City.", 
         Tunnel = 0, 
         Vnum = 21120, 
         Sector = "city", 
      }, 
      [21121] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "The road continues to the east.\
", 
               Direction = "east", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21120, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "The path continues to the west.\
", 
               Direction = "west", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21122, 
               Distance = 0, 
            }, 
         }, 
         Description = "&c You begin to get tired of walking on  a carved out rock road rounding\
the southern wall of Coral City.  The familiar sound of running water\
emanates from the Mon Calamarian ocean to the south. The large breakwater\
was created to keep the nasty wind storms that come up from splashing 50\
ft. waves upon the city.  The road stretches to the West and East. You can\
feel a soft mist coming from the ocean.\
", 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "On a Road Rounding Coral City.", 
         Tunnel = 0, 
         Vnum = 21121, 
         Sector = "city", 
      }, 
      [21122] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "The road continues to the east.\
", 
               Direction = "east", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21121, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "The path continues to the west.\
", 
               Direction = "west", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21123, 
               Distance = 0, 
            }, 
         }, 
         Description = "&c You walk briskly on carved out rock road rounding the southern wall of\
Akatamer.  The familiar sound of running water emanates from the Mon\
Calamarian ocean to the south. The large breakwater was created to keep\
the nasty wind storms that come up from spalshing 50 ft. waves upon the\
city.  The road stretches to the east and west. \
", 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "On a Road Rounding Coral City.", 
         Tunnel = 0, 
         Vnum = 21122, 
         Sector = "city", 
      }, 
      [21123] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "The path continues to the east.\
", 
               Direction = "east", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21122, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "The road continues to the west.\
", 
               Direction = "west", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21075, 
               Distance = 0, 
            }, 
         }, 
         Description = "&c You continue to travel on  a carved out rock road rounding the southern\
wall of Coral City.  The familiar sound of running water emanates from the\
Mon Calamarian ocean to the north. The large breakwater was created to\
keep the nasty wind storms that come up from spalshing 50 ft. waves upon\
the city.  The road stretches to the east and west.  You can feel brief\
splashes of water as the ocean spills over the breakwall.\
", 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "On a Road Rounding Coral City.", 
         Tunnel = 0, 
         Vnum = 21123, 
         Sector = "city", 
      }, 
      [21124] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "The road continues to the east.\
", 
               Direction = "east", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21123, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "To the west is the southern Docking bay of Akatamer.\
", 
               Direction = "west", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21075, 
               Distance = 0, 
            }, 
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "An Empty Home", 
         Vnum = 21124, 
         Sector = "inside", 
      }, 
      [21126] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "Barster Road is to the north.\
", 
               Direction = "north", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21037, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "The Tower of Mon Calamri lies to the south.\
", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Direction = "south", 
               Key = -1, 
               Keyword = "door", 
               DestinationVnum = 21127, 
               Distance = 0, 
            }, 
         }, 
         Description = "&c Before you is a large plain rock building used for healing the sick. The\
rock surface was once a coral underwater creature but is now a memorial to\
what once was. Here you can enter and recive top of the line treatment,\
from some of the greatest medical minds in the galexy. &R The pathway was\
properly framed with imported red plantlife. &c This is another one of\
those steps the new city officols are doing to clean up this city.\
", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "&p Mon Calamri Medical Facility", 
         Vnum = 21126, 
         Sector = "city", 
      }, 
      [21127] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Direction = "north", 
               Key = -1, 
               Keyword = "door", 
               DestinationVnum = 21126, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21129, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "An immense library is at the end of the corridor to the west.\
", 
               Direction = "west", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21128, 
               Distance = 0, 
            }, 
         }, 
         Description = "&C You walk beneath the impossibly high arches which support the Mon\
Calamari Medical facility.  Walls crafted of smooth coral rock are covered\
with extravegant Calamrian art which create a dazzling array of shimmering\
colors.  A inpatient desk lies in the center of the room, so one can check\
in. To the west is the waiting room. To the east is the medical supply\
store While the south leads to the main Bacta tanks. There is a sign at\
\
the enterance to the south. \
", 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
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
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "&pWithin the Mon Calamri Medical Facility", 
         Vnum = 21127, 
         Sector = "inside", 
      }, 
      [21128] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "The corridor leads back to the main hall.\
", 
               Direction = "east", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21127, 
               Distance = 0, 
            }, 
         }, 
         Description = "&c This room while not highly decorated is a perfect place for adventurers\
who are grouping with a injured partener. The floor is a well polished and\
clean coral rock. While the walls are decorated with hand drawn pictures\
from Mon Calamarian children. \
", 
         Flags = 
         {
            [10] = "Safe", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Waiting Room", 
         Vnum = 21128, 
         Sector = "inside", 
      }, 
      [21129] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21127, 
               Distance = 0, 
            }, 
         }, 
         Description = "&C This small area of the building was sectioned off to allow travelers to\
Mon Calamari the option to purchase medical equipment. The walls are a\
polished coral rock which give off a pinkish reflection. The floor has a\
\
medical track on it to allow easy transport of victims to and from areas\
of the Medical facility. To the West is the Main hallway\
", 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Medical Supply Store", 
         Vnum = 21129, 
         Sector = "inside", 
      }, 
      [21130] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Direction = "east", 
               Key = -1, 
               Keyword = "door", 
               DestinationVnum = 21009, 
               Distance = 0, 
            }, 
         }, 
         Description = "&z This high tech space appears to have no exits except for the main door.\
The walls are a smooth pink coral surface decorated with pictures and\
space charts. There appears to be dirt on the checkered pattern floor and\
a small lighting unit is suspeneded from the ceiling.\
", 
         Flags = 
         {
            [10] = "Safe", 
            [30] = "Prototype", 
         }, 
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
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "New Rebublic Mon Headquaters", 
         Vnum = 21130, 
         Sector = "city", 
      }, 
      [21131] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21034, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21135, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "southeast", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21134, 
               Distance = 0, 
            }, 
            [4] = 
            {
               Description = "", 
               Direction = "southwest", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21137, 
               Distance = 0, 
            }, 
         }, 
         Description = "&G A attractive black metal gate frames the enterence to Coral City's\
newest relaxation area. The Security Park, is home to a few rare \
creatures flown in and captured by customs. Due to the lack of space for\
storage , city officals created this new park for them to roam around in.\
It also allows for Mon Calamarian youth to have a safe and fun place to\
play in. There is a large sign above the metal frame that welcome's all to\
the park.\
", 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
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
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Coral City Park", 
         Vnum = 21131, 
         Sector = "city", 
      }, 
      [21132] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21139, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Direction = "south", 
               Key = -1, 
               Keyword = "door", 
               DestinationVnum = 21005, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21145, 
               Distance = 0, 
            }, 
         }, 
         Description = "&z You enter the main office of the Mon Calamari Security. This room is\
slightly, less extravegant then the rest, and has more of a rough ocean\
bottom feel. The walls  are decorated with pictures of wanted men, and the\
floors are polished rock that imitates a marble look. This rock was\
inported from the depths of the ocean floor. In front of you is a large\
counter to which you see alot of people working behind. At the counter is\
a sign that says step up for assistance.\
", 
         Flags = 
         {
            [10] = "Safe", 
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Security Lobby", 
         Vnum = 21132, 
         Sector = "city", 
      }, 
      [21133] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21038, 
               Distance = 0, 
            }, 
         }, 
         Description = "", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Coral City Academy", 
         Vnum = 21133, 
         Sector = "city", 
      }, 
      [21134] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21135, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "northwest", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21131, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "southwest", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21136, 
               Distance = 0, 
            }, 
         }, 
         Description = "&G This area was once a apartment complex, but due to the recent renovation\
project, the city mayor decided this would be a better idea. The ground is\
covered by a imported weed from a nearby planet. It is well known for it's\
durablity and groth rate. Both of which will be need to maintain the\
trampling and activity it will see. This grass like surface is new to Mon\
Calamarians and they find it extremely interesting, while the Quarren's\
find it just frivlous. \
", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Coral City Park", 
         Vnum = 21134, 
         Sector = "city", 
      }, 
      [21135] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21131, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21134, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21136, 
               Distance = 0, 
            }, 
            [4] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21137, 
               Distance = 0, 
            }, 
         }, 
         Description = "&G This area was once a apartment complex, but due to the recent renovation\
project, the city mayor decided this would be a better idea. The ground is\
covered by a imported weed from a nearby planet. It is well known for\
it's;durablity and groth rate. Both of which will be need to maintain\
the;trampling and activity it will see. This grass like surface is new to\
Mon Calamarians and they find it extremely interesting, while the\
Quarren's find it just frivlous.  You can see a large white leafed tree\
sitting in the middle of the park.\
", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Coral City Park", 
         Vnum = 21135, 
         Sector = "city", 
      }, 
      [21136] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21135, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "northeast", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21134, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "northwest", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21137, 
               Distance = 0, 
            }, 
         }, 
         Description = "&G This area was once a apartment complex, but due to the recent renovation\
project, the city mayor decided this would be a better idea. The ground is\
covered by a imported weed from a nearby planet. It is well known for\
it's;durablity and groth rate. Both of which will be need to maintain\
the;trampling and activity it will see. This grass like surface is new to\
Mon Calamarians and they find it extremely interesting, while the\
Quarren's find it just frivlous.  There is a large brown fence keeping the\
animals and people in surrounding  the edge of the park\
", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Coral City Park", 
         Vnum = 21136, 
         Sector = "city", 
      }, 
      [21137] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21135, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "northeast", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21131, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "southeast", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21136, 
               Distance = 0, 
            }, 
         }, 
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
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Coral City Park", 
         Vnum = 21137, 
         Sector = "city", 
      }, 
      [21138] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21018, 
               Distance = 0, 
            }, 
         }, 
         Description = "&z This marble like surfaced bank allows for easy transactions between you\
and your currencey. There is a large table in the center of the room to\
sign your life away along with, a counter towards the back where a very\
attractive clerk stands and counts the daily inflow of credits. On the top\
of the ceiling you can see a rather expensive security system tracking\
your everymove. The First bank of Mon's motto isn't \"your money is safe\
with us for no reason.\" To make a bank transaction please type bank.\
", 
         Flags = 
         {
            [8] = "Bank", 
            [30] = "Prototype", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "First Bank of Mon (Main Branch)", 
         Vnum = 21138, 
         Sector = "city", 
      }, 
      [21139] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [17] = "CanEnter", 
                  [18] = "CanLeave", 
               }, 
               Direction = "east", 
               Key = 21428, 
               Keyword = "Door", 
               DestinationVnum = 21140, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21150, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21132, 
               Distance = 0, 
            }, 
         }, 
         Description = "&z The Security Corridor is well guarded with cameras and wall lasers for\
automated firing. The damp hallway is a dark grey with light grey flashes\
as you pass the cells. Very little activity occurs here as most criminals\
can't escape with over 20' of rock between them and the corridor. You  are\
safe and sure not to hear any of them. There is a large bashproof door to\
the east with an electronic doorslides for safty.\
", 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Security Corridor", 
         Vnum = 21139, 
         Sector = "city", 
      }, 
      [21140] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21141, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21139, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [23] = "BashProof", 
               }, 
               Direction = "southeast", 
               Key = 21140, 
               Keyword = "door", 
               DestinationVnum = 21149, 
               Distance = 0, 
            }, 
         }, 
         Description = "&z The Security Corridor is well guarded with cameras and wall lasers for\
automated firing. The dmap hallway is a dark grey with light grey flashes\
as you pass the cells Very little activity occurs here as most criminals\
can't escape and with over 20' of rock between them and the corridor you\
are sure not to hear any of them.\
", 
         Flags = 
         {
            [30] = "Prototype", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Security Corridor", 
         Vnum = 21140, 
         Sector = "city", 
      }, 
      [21141] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [23] = "BashProof", 
               }, 
               Direction = "east", 
               Key = 21140, 
               Keyword = "door", 
               DestinationVnum = 21148, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21140, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21142, 
               Distance = 0, 
            }, 
         }, 
         Description = "&z The Security Corridor is well guarded with cameras and wall lasers for\
automated firing. The dmap hallway is a dark grey with light grey flashes\
as you pass the cells Very little activity occurs here as most criminals\
can't escape and with over 20' of rock between them and the corridor you\
are sure not to hear any of them.\
", 
         Flags = 
         {
            [30] = "Prototype", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Security Corridor", 
         Vnum = 21141, 
         Sector = "city", 
      }, 
      [21142] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21141, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [23] = "BashProof", 
               }, 
               Direction = "south", 
               Key = 21140, 
               Keyword = "door", 
               DestinationVnum = 21147, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21143, 
               Distance = 0, 
            }, 
         }, 
         Description = "&z The Security Corridor is well guarded with cameras and wall lasers for\
automated firing. The dmap hallway is a dark grey with light grey flashes\
as you pass the cells Very little activity occurs here as most criminals\
can't escape and with over 20' of rock between them and the corridor you\
are sure not to hear any of them. \
", 
         Flags = 
         {
            [30] = "Prototype", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Security Corridor", 
         Vnum = 21142, 
         Sector = "city", 
      }, 
      [21143] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [23] = "BashProof", 
               }, 
               Direction = "north", 
               Key = 21140, 
               Keyword = "door", 
               DestinationVnum = 21146, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21142, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21144, 
               Distance = 0, 
            }, 
         }, 
         Description = "&z The Security Corridor is well guarded with cameras and wall lasers for\
automated firing. The dmap hallway is a dark grey with light grey flashes\
as you pass the cells Very little activity occurs here as most criminals\
can't escape and with over 20' of rock between them and the corridor you\
are sure not to hear any of them.\
", 
         Flags = 
         {
            [30] = "Prototype", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Security Corridor", 
         Vnum = 21143, 
         Sector = "city", 
      }, 
      [21144] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21143, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [11] = "Hidden", 
               }, 
               Direction = "south", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21145, 
               Distance = 0, 
            }, 
         }, 
         Description = "&z The Security Corridor is well guarded with cameras and wall lasers for\
automated firing. The dmap hallway is a dark grey with light grey flashes\
as you pass the cells Very little activity occurs here as most criminals\
can't escape and with over 20' of rock between them and the corridor you\
are sure not to hear any of them.\
", 
         Flags = 
         {
            [30] = "Prototype", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Security Corridor", 
         Vnum = 21144, 
         Sector = "city", 
      }, 
      [21145] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [3] = "Secret", 
                  [23] = "BashProof", 
                  [11] = "Hidden", 
               }, 
               Direction = "north", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21144, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21132, 
               Distance = 0, 
            }, 
         }, 
         Description = "The chief of security's office is now vacant. As the last chief was ordered\
to leave by the Crime Syndacate Mon Calamari is currently looking for a\
BRAVE security officer to replace him. If interested please contact\
Ackbar. Sorry you must be Mon Calamari to fulfill duties\
", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Chief Security Officer's Office", 
         Vnum = 21145, 
         Sector = "city", 
      }, 
      [21146] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
               }, 
               Direction = "south", 
               Key = 21140, 
               Keyword = "door", 
               DestinationVnum = 21143, 
               Distance = 0, 
            }, 
         }, 
         Description = "&z The Mon Calamrian cells are small 8' by 8' cubes. The walls consist of\
solid rock imported form the ocean floor carved roughly to leave jagged\
edges. It is rumored that the guards like to throw prisoners up against\
the walls if they get out of hand There is no window except for the small\
tray  hole the guards use to feed the prisoner. There is a humid and musty\
smell, and hot temperature will make a non-mon quite uncomfortable. There\
is no use screaming as the walls are over 20 ft thick.\
", 
         Flags = 
         {
            [16] = "Silence", 
            [30] = "Prototype", 
            [3] = "Indoors", 
         }, 
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
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Cell Block 1138", 
         Vnum = 21146, 
         Sector = "city", 
      }, 
      [21147] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [23] = "BashProof", 
               }, 
               Direction = "north", 
               Key = 21140, 
               Keyword = "door", 
               DestinationVnum = 21142, 
               Distance = 0, 
            }, 
         }, 
         Description = "&z The Mon Calamrian cells are small 8' by 8' cubes. The walls consist of\
solid rock imported form the ocean floor carved roughly to leave jagged\
edges. It is rumored that the guards like to throw prisoners up against\
the walls if they get out of hand There is no window except for the small\
tray  hole the guards use to feed the prisoner. There is a humid and musty\
smell, and hot temperature will make a non-mon quite uncomfortable. There\
is no use screaming as the walls are over 20 ft thick.\
", 
         Flags = 
         {
            [16] = "Silence", 
            [30] = "Prototype", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Cell Block 1139", 
         Vnum = 21147, 
         Sector = "city", 
      }, 
      [21148] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [23] = "BashProof", 
               }, 
               Direction = "west", 
               Key = 21140, 
               Keyword = "door", 
               DestinationVnum = 21141, 
               Distance = 0, 
            }, 
         }, 
         Description = "&z The Mon Calamrian cells are small 8' by 8' cubes. The walls consist of\
solid rock imported form the ocean floor carved roughly to leave jagged\
edges. It is rumored that the guards like to throw prisoners up against\
the walls if they get out of hand There is no window except for the small\
tray  hole the guards use to feed the prisoner. There is a humid and musty\
smell, and hot temperature will make a non-mon quite uncomfortable. There\
is no use screaming as the walls are over 20 ft thick.\
", 
         Flags = 
         {
            [16] = "Silence", 
            [30] = "Prototype", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Cell Block 1140", 
         Vnum = 21148, 
         Sector = "city", 
      }, 
      [21149] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [23] = "BashProof", 
               }, 
               Direction = "northwest", 
               Key = 21140, 
               Keyword = "door", 
               DestinationVnum = 21140, 
               Distance = 0, 
            }, 
         }, 
         Description = "&z The Mon Calamrian cells are small 8' by 8' cubes. The walls consist of\
solid rock imported form the ocean floor carved roughly to leave jagged\
edges. It is rumored that the guards like to throw prisoners up against\
the walls if they get out of hand There is no window except for the small\
tray  hole the guards use to feed the prisoner. There is a humid and musty\
smell, and hot temperature will make a non-mon quite uncomfortable. There\
is no use screaming as the walls are over 20 ft thick.\
", 
         Flags = 
         {
            [30] = "Prototype", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Cell Block 1141", 
         Vnum = 21149, 
         Sector = "city", 
      }, 
      [21150] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21139, 
               Distance = 0, 
            }, 
         }, 
         Description = "&z This small cubicle is where a very alert and strong guard stays at\
attention. For it is here that the main door opens from and allows access\
to the jail cells. There is a small computer panel on the wall surrounded\
by laser proof glass panels. There is also a large swival chair with a\
recline feature.  The walls and floors are smooth surface unlike the\
surrounding area. It is most likely that this station was recently\
installed.\
", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "There is a state of the art computer panel with a televison screen for each\
\13cell\
\13block.\
\13In the center of the computer panel is a large lever.\
\13", 
               Keyword = "computer", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "lever", 
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Security Station", 
         Vnum = 21150, 
         Sector = "city", 
      }, 
      [21151] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21152, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21073, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21155, 
               Distance = 0, 
            }, 
         }, 
         Description = "&c There is a big round desk in the middle of the room here, with all sorts\
of security equipment secured around it.  It looks like some sort of\
high-tech, punch in area for workers to check in. There is a room to the\
east, where most of the Quarren and Mon Calamarian workers seem to be\
going. There is a excellent grained wooden door to the west with an\
extravegant golden sign on it.  This room is tastefully done in a coral\
pink and dark purple decor which makes it feel somewhat exciting. You can\
smell in the distence the heavy smoke of iron ore mealting. \
", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Security Desk", 
         Vnum = 21151, 
         Sector = "city", 
      }, 
      [21152] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21160, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21151, 
               Distance = 0, 
            }, 
         }, 
         Description = "&c This is a nice, sunlit area, strewn about with cushions and benches and\
other pieces of Calamrian comforts.  Along one wall is a array of service\
machines that sell food and drinks.  There is a mini kitchen near the\
windows, for the employee's lunches.  The walls are covered with pitures\
of home and of some of the workers children. On the table you even see a\
Mon Calamarian Fish Scout cookiee order form.\
", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Worker's Lobby", 
         Vnum = 21152, 
         Sector = "city", 
      }, 
      [21153] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21152, 
               Distance = 0, 
            }, 
         }, 
         Description = "", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Floating in a void", 
         Vnum = 21153, 
         Sector = "city", 
      }, 
      [21155] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "North-Halway", 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [17] = "CanEnter", 
               }, 
               Direction = "north", 
               Key = 0, 
               Keyword = "", 
               DestinationVnum = 21156, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21151, 
               Distance = 0, 
            }, 
         }, 
         Description = "This part of the factory is set up for customer relations with clients.\
There is a protocol droid sitting here to set up meetings, answer\
telecommunica ions and take orders for materials to be sent all over the\
galaxy. The carpet here \
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Customer Check-In", 
         Vnum = 21155, 
         Sector = "inside", 
      }, 
      [21156] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "North-End of Hall", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Direction = "north", 
               Key = 0, 
               Keyword = "", 
               DestinationVnum = 21158, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "East-Equipment Sales", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Direction = "east", 
               Key = 0, 
               Keyword = "", 
               DestinationVnum = 21157, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "South-Customer Checkin", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Direction = "south", 
               Key = 0, 
               Keyword = "", 
               DestinationVnum = 21155, 
               Distance = 0, 
            }, 
         }, 
         Description = "You are walking along a plush hallway.  Large windows line the western wall\
and a door is set to the east.  The markings on the door indicate a\
salesroom \
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Hallway", 
         Vnum = 21156, 
         Sector = "inside", 
      }, 
      [21157] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "West-Hallway", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Direction = "west", 
               Key = 0, 
               Keyword = "", 
               DestinationVnum = 21156, 
               Distance = 0, 
            }, 
         }, 
         Description = "You barely step into the room and are stopped by a large counter.  A short \
squat Protocol Droid stands here taking orders and feeding the information \
into its counterpart, a large assembly droid.  Bins of parts and pieces line the\
walls behind the counter waiting for thier turn to be used in som useful pieces\
of equipment for you.", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Equipment Sales", 
         Vnum = 21157, 
         Sector = "inside", 
      }, 
      [21158] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "East-Workshop", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Direction = "east", 
               Key = 0, 
               Keyword = "", 
               DestinationVnum = 21159, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "South-Hallway", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Direction = "south", 
               Key = 0, 
               Keyword = "", 
               DestinationVnum = 21156, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "Up-Ship Repair", 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [17] = "CanEnter", 
                  [18] = "CanLeave", 
               }, 
               Direction = "up", 
               Key = 0, 
               Keyword = "", 
               DestinationVnum = 21170, 
               Distance = 0, 
            }, 
         }, 
         Description = "Here a magnetic lift sits waiting to take customers up to the ship repair\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "End of Hall", 
         Vnum = 21158, 
         Sector = "inside", 
      }, 
      [21159] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "West-End of Hall", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Direction = "west", 
               Key = 0, 
               Keyword = "", 
               DestinationVnum = 21158, 
               Distance = 0, 
            }, 
         }, 
         Description = "This is the largest and most elaborate workshop you have everseen. A\
magnetic balanced laser guided lathe sits along the north wall and further\
in is several plasma cutters and a bench of specialty tools of all shapes\
and sizes.  Along the south wall lies a circuit building station complete\
with touch screen  \
", 
         Flags = 
         {
            [26] = "Factory", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Workshop", 
         Vnum = 21159, 
         Sector = "inside", 
      }, 
      [21160] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "North- Observation Room", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Direction = "north", 
               Key = 0, 
               Keyword = "", 
               DestinationVnum = 21161, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21152, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "Down-Workers Entrance", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Direction = "down", 
               Key = 0, 
               Keyword = "", 
               DestinationVnum = 21162, 
               Distance = 0, 
            }, 
         }, 
         Description = "Several Infra Scanners sweep over you for an ID check.  You can rest\
assured that if you are wanted on Mon Calamar you won't make it past this\
point.  Sever l Large swiveling blasters guard the room so that no one\
will enter the factory t at isn't meant to be here.  The workers take\
stairs to the plant floor below and managers continue north to the observe\
the proceedings.  To the south is the \
To the north is the observation booth, while down is the worker's\
entrance.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Security Check-Point", 
         Vnum = 21160, 
         Sector = "inside", 
      }, 
      [21161] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "South-Security Checkpoint", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Direction = "south", 
               Key = 0, 
               Keyword = "", 
               DestinationVnum = 21160, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "Up-Ship Yard", 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [17] = "CanEnter", 
                  [18] = "CanLeave", 
               }, 
               Direction = "up", 
               Key = 0, 
               Keyword = "", 
               DestinationVnum = 21172, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "Down-Mainframe Computer", 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [17] = "CanEnter", 
                  [18] = "CanLeave", 
               }, 
               Direction = "down", 
               Key = 0, 
               Keyword = "", 
               DestinationVnum = 21165, 
               Distance = 0, 
            }, 
         }, 
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
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Observation Room", 
         Vnum = 21161, 
         Sector = "inside", 
      }, 
      [21162] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "West-Lift Station", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Direction = "west", 
               Key = 0, 
               Keyword = "", 
               DestinationVnum = 21163, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "Up-Security Checkpoint", 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [17] = "CanEnter", 
                  [18] = "CanLeave", 
               }, 
               Direction = "up", 
               Key = 0, 
               Keyword = "", 
               DestinationVnum = 21160, 
               Distance = 0, 
            }, 
         }, 
         Description = "Rows upon Rows of Equipment lockers stand here holding workers personal\
items and tools for work.  This is presumably where those who work at the\
factory  suit up for the day.  There are two exits from here up to the\
security checkpoi t  In the Direction up you can goto the lift station\
while west is the security post. \
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Workers Entrance", 
         Vnum = 21162, 
         Sector = "inside", 
      }, 
      [21163] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "North-Cooling Section", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Direction = "north", 
               Key = 0, 
               Keyword = "", 
               DestinationVnum = 21164, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "East-Workers Entrance", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Direction = "east", 
               Key = 0, 
               Keyword = "", 
               DestinationVnum = 21162, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "Up-Warehouse", 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [17] = "CanEnter", 
                  [18] = "CanLeave", 
               }, 
               Direction = "up", 
               Key = 0, 
               Keyword = "", 
               DestinationVnum = 21171, 
               Distance = 0, 
            }, 
            [4] = 
            {
               Description = "Northeast-Mainframe Computer", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Direction = "northeast", 
               Key = 0, 
               Keyword = "", 
               DestinationVnum = 21165, 
               Distance = 0, 
            }, 
         }, 
         Description = "The cooled parts arrive here on a conveyor from the north where they are\
loaded into large boxes and the boxes are loaded on to a repulsor lift and\
taken up to  the uppermost floor for storage and transfer onto shipping\
barges.  From here y u can go east to the workers entrance, you can go\
north further up the line, or up to the warehouse..or ne to the mainframe.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Lift Station", 
         Vnum = 21163, 
         Sector = "inside", 
      }, 
      [21164] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "North-Molding and Forming", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Direction = "north", 
               Key = 0, 
               Keyword = "", 
               DestinationVnum = 21166, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "East-Mainframe Computer", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Direction = "east", 
               Key = 0, 
               Keyword = "", 
               DestinationVnum = 21165, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "South-Lift Station", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Direction = "south", 
               Key = 0, 
               Keyword = "", 
               DestinationVnum = 21163, 
               Distance = 0, 
            }, 
         }, 
         Description = "Here the converyor makes a series of sharp turns to S its way from the\
north as dozens of droids turn cooling air hoses on the parts to cool them\
before they  make it to the lift station to the south.  Looking east you\
can see the system that controls the entire facility and from the north\
loud clanging and hissing \
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Cooling Station", 
         Vnum = 21164, 
         Sector = "inside", 
      }, 
      [21165] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "North-Smelting", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Direction = "north", 
               Key = 0, 
               Keyword = "", 
               DestinationVnum = 21167, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "West-Cooling Section", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Direction = "west", 
               Key = 0, 
               Keyword = "", 
               DestinationVnum = 21164, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "Up-Observation Room", 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [17] = "CanEnter", 
                  [18] = "CanLeave", 
               }, 
               Direction = "up", 
               Key = 0, 
               Keyword = "", 
               DestinationVnum = 21161, 
               Distance = 0, 
            }, 
            [4] = 
            {
               Description = "Northeast-Sorting and Seperating", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Direction = "northeast", 
               Key = 0, 
               Keyword = "", 
               DestinationVnum = 21168, 
               Distance = 0, 
            }, 
            [5] = 
            {
               Description = "Northwest-Molding and Forming", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Direction = "northwest", 
               Key = 0, 
               Keyword = "", 
               DestinationVnum = 21166, 
               Distance = 0, 
            }, 
            [6] = 
            {
               Description = "Southwest-Lift Station", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Direction = "southwest", 
               Key = 0, 
               Keyword = "", 
               DestinationVnum = 21163, 
               Distance = 0, 
            }, 
         }, 
         Description = "Here before you is a huge cylinderical object that stretchs from floor to\
ceili g lights run the entire circumfrence of the object and wires string\
about running  away from the massive computer in all directions.  Several\
operator stations ci cle the factory's heart and soul as to monitor and\
solve any problems that occur at a moments notice.  It is possible to\
reach almost any station along the line fr m\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Mainframe Computer", 
         Vnum = 21165, 
         Sector = "inside", 
      }, 
      [21166] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21167, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "South- Cooling Section", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Direction = "south", 
               Key = 0, 
               Keyword = "", 
               DestinationVnum = 21164, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "Southeast-Mainframe Computer", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Direction = "southeast", 
               Key = 0, 
               Keyword = "", 
               DestinationVnum = 21165, 
               Distance = 0, 
            }, 
         }, 
         Description = "Here is where the super heated pipes carring the melted down ore end.  They pore\
their precious cargo into shape shifting molds that set the steel into whatever\
shape the clients of this factory require.  They are then lifted on to the conveyor\
by special droids designed to withstand the heat.  After that they are sent south \
to the cooling section.  You could go east to find out where the pipes are filled.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Molding and Forming", 
         Vnum = 21166, 
         Sector = "inside", 
      }, 
      [21167] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "East-Sorting and Seperating", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Direction = "east", 
               Key = 0, 
               Keyword = "", 
               DestinationVnum = 21168, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "South-Mainframe Computer", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Direction = "south", 
               Key = 0, 
               Keyword = "", 
               DestinationVnum = 21165, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "West- Molding and Forming", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Direction = "west", 
               Key = 0, 
               Keyword = "", 
               DestinationVnum = 21166, 
               Distance = 0, 
            }, 
         }, 
         Description = "After the ore is seperated further east, it comes here to be dropped in a\
huge vat that melts it down.  Huge specially heated pipes connect to the\
vat here an \
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Smelting", 
         Vnum = 21167, 
         Sector = "inside", 
      }, 
      [21168] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "North-Recieving", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Direction = "north", 
               Key = 0, 
               Keyword = "", 
               DestinationVnum = 21169, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "West-Smelting", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Direction = "west", 
               Key = 0, 
               Keyword = "", 
               DestinationVnum = 21167, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "Southwest-Mainframe Computer", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Direction = "southwest", 
               Key = 0, 
               Keyword = "", 
               DestinationVnum = 21165, 
               Distance = 0, 
            }, 
         }, 
         Description = "After the raw ore and other materials are recieved to the north it comes\
here. The materials that are used for maintence and electronic\
construction are seper ted from the ore here. As well unexecatable pieces\
of ore are returned to the molin \
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Sorting and Seperating", 
         Vnum = 21168, 
         Sector = "inside", 
      }, 
      [21169] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "South-Sorting and Seperating", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Direction = "south", 
               Key = 0, 
               Keyword = "", 
               DestinationVnum = 21168, 
               Distance = 0, 
            }, 
         }, 
         Description = "Here is where the moling miner machines return to drop off the ore after stripping\
it from the floor of the ocean below.  Other things are also recieved here as well,\
Parts for maintence of crucial machines and critical components that can not be\
created on site.  The sorting area to the south is responsible for deciphering where \
materials need to go,  here though the main concern is unloading the constant \
stream of machines as quickly as possible.", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Recieving", 
         Vnum = 21169, 
         Sector = "inside", 
      }, 
      [21170] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "East-Warehouse", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Direction = "east", 
               Key = 0, 
               Keyword = "", 
               DestinationVnum = 21171, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "Down-End of Hall", 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [17] = "CanEnter", 
                  [18] = "CanLeave", 
               }, 
               Direction = "down", 
               Key = 0, 
               Keyword = "", 
               DestinationVnum = 21158, 
               Distance = 0, 
            }, 
         }, 
         Description = "A huge hangar surrounds you and large cranes susspended from the ceiling\
work  continuosly peeling old armor off of ships and pulling worn engine\
casings.  Maintence droids of all shapes and sizes swarm over the ships\
here beeping and whiring at an almost frantic pace.  You get the feeling\
that although this is an iron ore factory they recieve a substancial\
income from the repair of ships\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Ship Repair", 
         Vnum = 21170, 
         Sector = "inside", 
      }, 
      [21171] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "East-Ship Yard", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Direction = "east", 
               Key = 0, 
               Keyword = "", 
               DestinationVnum = 21172, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "West-Ship Repair", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Direction = "west", 
               Key = 0, 
               Keyword = "", 
               DestinationVnum = 21170, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "Down- Lift Station", 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [17] = "CanEnter", 
                  [18] = "CanLeave", 
               }, 
               Direction = "down", 
               Key = 0, 
               Keyword = "", 
               DestinationVnum = 21163, 
               Distance = 0, 
            }, 
         }, 
         Description = "As the repulsor lifts the huge packages of parts bound for other worlds.\
Binary load lifters sweep them up and move them into neat stacks to await \
transport.  Many of the boxes marked armor are sent west to the ship\
repair area and still many other boxes are being sent through huge doors\
to the east \
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Warehouse", 
         Vnum = 21171, 
         Sector = "inside", 
      }, 
      [21172] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "West-Warehouse", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [17] = "CanEnter", 
               }, 
               Direction = "west", 
               Key = 0, 
               Keyword = "", 
               DestinationVnum = 21171, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "Down-Observation Room", 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [17] = "CanEnter", 
                  [18] = "CanLeave", 
               }, 
               Direction = "down", 
               Key = 0, 
               Keyword = "", 
               DestinationVnum = 21161, 
               Distance = 0, 
            }, 
         }, 
         Description = "Here a platform that holds at least five cargo ships at any given time is a\
bee hive of activity.  Binary load lifters beep at you to get out of the\
way as the   charge back and forth between waiting barges and the\
warehouse to the west. A  small lev tube sits out of the way at one corner\
of the platform. It seems to  \
West is the warehouse and Down is the observation booth.\
", 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Name = "Shipping Platform", 
         Tunnel = 0, 
         Vnum = 21172, 
         Sector = "inside", 
      }, 
      [21180] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Direction = "east", 
               Key = -1, 
               Keyword = "hatch", 
               DestinationVnum = 21181, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "up", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21066, 
               Distance = 0, 
            }, 
         }, 
         Description = "&z As you look up you can see a few light rays slipping down from the\
cracks in the hard wood floor above. There is a small light positioned in\
the corner of the room. The floor is carved out stone and rather ruffand\
dark. The walls lead around to a small steal circular hatch. If you become\
quiet you can hear small business transactions occuring above.\
", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Secret Room", 
         Vnum = 21180, 
         Sector = "city", 
      }, 
      [21181] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Direction = "west", 
               Key = -1, 
               Keyword = "hatch", 
               DestinationVnum = 21180, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "down", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21182, 
               Distance = 0, 
            }, 
         }, 
         Description = "You stand in a dark tunnel system made out of a mined ore obviously the\
work of the Quarren. The walls are ribbed and appear to be fastened by\
metal pins along the seam. Above you can see the hatch, while below you\
look down and see nothing but complete darkness.\
", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Tunnel", 
         Vnum = 21181, 
         Sector = "city", 
      }, 
      [21182] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "up", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21181, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "down", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21183, 
               Distance = 0, 
            }, 
         }, 
         Description = "You stand in a dark tunnel system made out of a mined ore obviously the\
work of the Quarren. The walls are ribbed and appear to be fastened by\
metal pins along the seam. Above you can see only darkness, while below\
you look down and see a glimmer of light coming from the darkness.\
", 
         Flags = 
         {
            [0] = "Dark", 
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Tunnel", 
         Vnum = 21182, 
         Sector = "city", 
      }, 
      [21183] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Direction = "east", 
               Key = -1, 
               Keyword = "door", 
               DestinationVnum = 21184, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "up", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21182, 
               Distance = 0, 
            }, 
         }, 
         Description = "&c  Looking around you know this place is one of danger and definitely\
doesn't belong here in Coral City. The Walls are carved out magma with\
extremly state of the art security cameras scanning your every bio-stat.\
Attached to the sides of the doors are small laser pods used to make sure\
someone doesn't pass who is not allowed.  \
", 
         Flags = 
         {
            [30] = "Prototype", 
            [23] = "Hotel", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Security Clearance Room", 
         Vnum = 21183, 
         Sector = "city", 
      }, 
      [21184] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21185, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Direction = "west", 
               Key = -1, 
               Keyword = "door", 
               DestinationVnum = 21183, 
               Distance = 0, 
            }, 
         }, 
         Description = "&z You stand in a rather large room full of computer and survailence\
equipment. There are strange markings on the displays .You are familiar\
with the markings, Imperial code language . Apparently the rumors about\
the Quarren are true. \
&x\
", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Imperial Spy Base", 
         Vnum = 21184, 
         Sector = "city", 
      }, 
      [21185] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21184, 
               Distance = 0, 
            }, 
         }, 
         Description = "", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Floating in a void", 
         Vnum = 21185, 
         Sector = "city", 
      }, 
      [21186] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21187, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Direction = "south", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21023, 
               Distance = 0, 
            }, 
         }, 
         Description = "Welcome to the Universe Construction Co. , We are always looking for new\
builders. In this room is the Construction Board. On it will be\
assignments and a way to check in. This is not a place to ask for a zone\
you have to email me or contact me on the game! Failure to follow this\
simple rule will result in you getting smacked with my back fin!!!!\
To the east you see a large Library!\
Contact Ackbar for more info!\
", 
         Flags = 
         {
            [30] = "Prototype", 
            [2] = "NoMob", 
            [10] = "Safe", 
            [23] = "Hotel", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "&G Universe Construction Co.", 
         Vnum = 21186, 
         Sector = "city", 
      }, 
      [21187] = 
      {
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               Keyword = "", 
               DestinationVnum = 21186, 
               Distance = 0, 
            }, 
         }, 
         Description = "Here you will find some background info available for your reading.\
Understand this is not all you can use but a basic idea to start with. Got\
any more info on projects were doing ..Well email me them at\
MonCal@netscape.net \
", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Construction Blueprints", 
         Vnum = 21187, 
         Sector = "city", 
      }, 
      [21445] = 
      {
         Exits = 
         {
         }, 
         Description = "", 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Floating in a void", 
         Vnum = 21445, 
         Sector = "city", 
      }, 
      [21499] = 
      {
         Exits = 
         {
         }, 
         Description = "", 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Floating in a void", 
         Vnum = 21499, 
         Sector = "city", 
      }, 
      [21436] = 
      {
         Exits = 
         {
         }, 
         Description = "", 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         Tunnel = 0, 
         Name = "Floating in a void", 
         Vnum = 21436, 
         Sector = "city", 
      }, 
   }, 
}
