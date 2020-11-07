-- Tatooine
-- Last saved Friday 06-Nov-2020 11:29:12

AreaEntry
{
   LevelRanges = 
   {
      Hard = 
      {
         High = 105, 
         Low = 0, 
      }, 
      Soft = 
      {
         High = 105, 
         Low = 0, 
      }, 
   }, 
   ResetFrequency = 3, 
   Mobiles = 
   {
      [31500] = 
      {
         DefaultPosition = "standing", 
         Race = "Human", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         Credits = 0, 
         ArmorClass = 0, 
         LongDescr = "A monk wanders around the palace.\
", 
         Position = "standing", 
         Sex = "male", 
         Vnum = 31500, 
         DamRoll = 0, 
         HitRoll = 0, 
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
         Alignment = 100, 
         Level = 22, 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Charisma = 10, 
            Strength = 10, 
            Constitution = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Intelligence = 10, 
         }, 
         ShortDescr = "a short monk", 
         NumberOfAttacks = 0, 
         Name = "monk", 
         Description = "This is a aged monk. He has lived here for many years and has small scars on\
his body.\
", 
         Height = 0, 
         Weight = 0, 
         SaveVs = 
         {
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
            [2] = "Scavenger", 
            [6] = "StayArea", 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
      }, 
      [31501] = 
      {
         DefaultPosition = "standing", 
         Race = "Jawa", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         Credits = 30000, 
         ArmorClass = 0, 
         LongDescr = "A large, mean looking Jawa sits in his chair comfortably here selling liquids for journeys out into the great dune sea.\
", 
         Position = "standing", 
         Sex = "male", 
         Vnum = 31501, 
         Shop = 
         {
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
            ProfitBuy = 110, 
            KeeperShortDescr = "a large Jawa", 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            ProfitSell = 0, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "all_greet_prog", 
               ScriptType = "MProg", 
               Arguments = "100", 
               Code = "say If you're looking for some goods...\
say ... you've come to the right place.\
", 
            }, 
         }, 
         DamRoll = 0, 
         HitRoll = 0, 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
               [17] = "jawaese", 
            }, 
            Speaking = 
            {
               [17] = "jawaese", 
            }, 
         }, 
         ShortDescr = "a large Jawa", 
         Alignment = 111, 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Charisma = 10, 
            Strength = 10, 
            Constitution = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Intelligence = 10, 
         }, 
         NumberOfAttacks = 0, 
         Level = 35, 
         Weight = 0, 
         Name = "water jawa", 
         Description = "This jawa seems fierce and old. He has a small pouch where he keeps his money\
and change for customers willing to purchase something.\
", 
         Height = 0, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         SaveVs = 
         {
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [6] = "StayArea", 
            [7] = "Wimpy", 
         }, 
         AffectedBy = 
         {
            [7] = "Sanctuary", 
         }, 
      }, 
      [31502] = 
      {
         DefaultPosition = "standing", 
         Race = "Reptile", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         Credits = 0, 
         ArmorClass = -170, 
         LongDescr = "A large krayt stands here towering over you, staring you in the eye.\
", 
         Position = "standing", 
         Sex = "female", 
         Vnum = 31502, 
         DamRoll = 0, 
         HitRoll = 0, 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
            }, 
            Speaking = 
            {
               [17] = "jawaese", 
            }, 
         }, 
         ShortDescr = "a large krayt dragon", 
         Alignment = 0, 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Charisma = 10, 
            Strength = 10, 
            Constitution = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Intelligence = 10, 
         }, 
         NumberOfAttacks = 0, 
         Level = 100, 
         Weight = 0, 
         Name = "Krayt dragon", 
         Description = "This ferocious creature is rare but very valuble to many people throughout\
this galaxy. As it eyes you, you wonder what to do.\
", 
         Height = 0, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         SaveVs = 
         {
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [2] = "Scavenger", 
            [0] = "Npc", 
            [5] = "Aggressive", 
            [6] = "StayArea", 
         }, 
         AffectedBy = 
         {
            [7] = "Sanctuary", 
         }, 
      }, 
      [31503] = 
      {
         DefaultPosition = "standing", 
         Race = "Rodent", 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitNoDice = 0, 
            HitPlus = 10, 
         }, 
         Credits = 0, 
         ArmorClass = 97, 
         LongDescr = "A womp rat hops by.\
", 
         Position = "standing", 
         Sex = "male", 
         Vnum = 31503, 
         DamRoll = 0, 
         HitRoll = 0, 
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
         Alignment = 0, 
         Level = 1, 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Charisma = 10, 
            Strength = 10, 
            Constitution = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Intelligence = 10, 
         }, 
         ShortDescr = "a small womp Rat", 
         NumberOfAttacks = 0, 
         Name = "womp rat", 
         Description = "This creature does not look to be of one of the more appreciated kind.\
", 
         Height = 0, 
         Weight = 0, 
         SaveVs = 
         {
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
            [2] = "Scavenger", 
            [6] = "StayArea", 
         }, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamPlus = 2, 
            DamNoDice = 0, 
         }, 
      }, 
      [31504] = 
      {
         DefaultPosition = "standing", 
         Race = "Jawa", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         Credits = 0, 
         ArmorClass = 0, 
         LongDescr = "A young Jawa walks around here.\
", 
         Position = "standing", 
         Sex = "male", 
         Vnum = 31504, 
         DamRoll = 0, 
         HitRoll = 0, 
         Languages = 
         {
            Speaks = 
            {
               [17] = "jawaese", 
            }, 
            Speaking = 
            {
               [17] = "jawaese", 
            }, 
         }, 
         Alignment = 115, 
         Level = 3, 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Charisma = 10, 
            Strength = 10, 
            Constitution = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Intelligence = 10, 
         }, 
         ShortDescr = "a young Jawa", 
         NumberOfAttacks = 0, 
         Name = "Young Jawa", 
         Description = "This creature is not one of the more respectable species but manages to live\
on its own. This Jawa is a very young and untrained.\
", 
         Height = 0, 
         Weight = 0, 
         SaveVs = 
         {
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
            [2] = "Scavenger", 
            [6] = "StayArea", 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
      }, 
      [31505] = 
      {
         DefaultPosition = "standing", 
         Race = "Jawa", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         Credits = 0, 
         ArmorClass = 0, 
         LongDescr = "The Jawa guard stands here guarding something.\
", 
         Position = "standing", 
         Sex = "male", 
         Vnum = 31505, 
         DamRoll = 0, 
         HitRoll = 0, 
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
         Alignment = 150, 
         Level = 25, 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Charisma = 10, 
            Strength = 10, 
            Constitution = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Intelligence = 10, 
         }, 
         ShortDescr = "a Jawa guard", 
         NumberOfAttacks = 0, 
         Name = "jawa guard", 
         Description = "This is not a regular filthy creature. This Jawa is trained and armed to the\
teeth. Consider it before you attack him.\
", 
         Height = 0, 
         Weight = 0, 
         SaveVs = 
         {
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [2] = "Scavenger", 
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
      }, 
      [31506] = 
      {
         DefaultPosition = "standing", 
         Race = "Creature", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         Credits = 0, 
         ArmorClass = 0, 
         LongDescr = "A scavenger walks around here picking up anything he can see.\
", 
         Position = "standing", 
         Sex = "male", 
         Vnum = 31506, 
         DamRoll = 0, 
         HitRoll = 0, 
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
         Alignment = 0, 
         Level = 3, 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Charisma = 10, 
            Strength = 10, 
            Constitution = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Intelligence = 10, 
         }, 
         ShortDescr = "a scavenger", 
         NumberOfAttacks = 0, 
         Name = "Scavenger", 
         Description = "This scavenger is a small animal whom which no attention is regarded.\
", 
         Height = 0, 
         Weight = 0, 
         SaveVs = 
         {
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
            [2] = "Scavenger", 
            [6] = "StayArea", 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
      }, 
      [31507] = 
      {
         DefaultPosition = "standing", 
         Race = "Human", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         Credits = 0, 
         ArmorClass = 0, 
         LongDescr = "A moisture farmer walks around here, trying to find his destination.\
", 
         Position = "standing", 
         Sex = "male", 
         Vnum = 31507, 
         DamRoll = 0, 
         HitRoll = 0, 
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
         Alignment = 140, 
         Level = 9, 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Charisma = 10, 
            Strength = 10, 
            Constitution = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Intelligence = 10, 
         }, 
         ShortDescr = "a moisture farmer", 
         NumberOfAttacks = 0, 
         Name = "Moisture Farmer", 
         Description = "You are looking at one of the ancestors of this planet. They have been here\
ever since the Dowager Queen crashed into the planet.\
", 
         Height = 0, 
         Weight = 0, 
         SaveVs = 
         {
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
            [2] = "Scavenger", 
            [6] = "StayArea", 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
      }, 
      [31508] = 
      {
         DefaultPosition = "standing", 
         Race = "Droid", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         Credits = 0, 
         ArmorClass = 0, 
         LongDescr = "A power droid moves around on the ground here, humming.\
", 
         Position = "standing", 
         Sex = "undistinguished", 
         Vnum = 31508, 
         DamRoll = 0, 
         HitRoll = 0, 
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
         Alignment = 0, 
         Level = 8, 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Charisma = 10, 
            Strength = 10, 
            Constitution = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Intelligence = 10, 
         }, 
         ShortDescr = "a square power droid", 
         NumberOfAttacks = 0, 
         Name = "Power droid", 
         Description = "This power droid is rather old and has been used for many different purposes\
over the years of its existence. Although it is still functional it is almost\
ready to be trashed. Small wires and shorted connections are sprawled out on\
different parts of the droids surface.\
", 
         Height = 0, 
         Weight = 0, 
         SaveVs = 
         {
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
      }, 
      [31509] = 
      {
         DefaultPosition = "standing", 
         Race = "Astromech", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         Credits = 0, 
         ArmorClass = 0, 
         LongDescr = "A small astromech droid stands around here chirping away.\
", 
         Position = "standing", 
         Sex = "undistinguished", 
         Vnum = 31509, 
         DamRoll = 0, 
         HitRoll = 0, 
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
         Alignment = 0, 
         Level = 15, 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Charisma = 10, 
            Strength = 10, 
            Constitution = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Intelligence = 10, 
         }, 
         ShortDescr = "an astromech droid", 
         NumberOfAttacks = 0, 
         Name = "Astromech droid.", 
         Description = "This droid, when speaking, makes no sense to you. Throught its beeps and\
sounds its trying to say something to you but you have no clue what. This\
droid seems to have been used before but is in excellent shape.\
", 
         Height = 0, 
         Weight = 0, 
         SaveVs = 
         {
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
      }, 
      [31510] = 
      {
         DefaultPosition = "standing", 
         Race = "Jawa", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         Credits = 0, 
         ArmorClass = 0, 
         LongDescr = "A wise Jawa stands here ready to teach you skills.\
", 
         Position = "standing", 
         Sex = "undistinguished", 
         Vnum = 31510, 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
               [17] = "jawaese", 
            }, 
            Speaking = 
            {
               [17] = "jawaese", 
            }, 
         }, 
         DamRoll = 0, 
         HitRoll = 0, 
         ShortDescr = "a wise Jawa", 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Charisma = 10, 
            Strength = 10, 
            Constitution = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Intelligence = 10, 
         }, 
         Alignment = 210, 
         VipFlags = 
         {
            [8] = "Tatooine", 
         }, 
         NumberOfAttacks = 0, 
         Level = 45, 
         Weight = 0, 
         Name = "Wise Jawa", 
         Description = "This Jawa has studied the ways of this world for many years, and if you pay\
attention can teach you may things of many uses. Be careful not to attack him\
for he has great powers.\
", 
         Height = 0, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         SaveVs = 
         {
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [9] = "Train", 
            [6] = "StayArea", 
         }, 
         AffectedBy = 
         {
            [7] = "Sanctuary", 
         }, 
      }, 
      [31511] = 
      {
         DefaultPosition = "standing", 
         Race = "Jawa", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         Credits = 0, 
         ArmorClass = 0, 
         LongDescr = "A guardian stands here watching over The Wise One.\
", 
         Position = "standing", 
         Sex = "male", 
         Vnum = 31511, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "speech_prog", 
               ScriptType = "MProg", 
               Arguments = "p yes", 
               Code = "mpechoat $n The guard ushers you into the chamber.\
mpechoaround $n The guard ushers $n into the chamber.\
mptransfer $n 31838\
mpat $n mpechoaround $n $n is ushered into the chamber.\
", 
            }, 
            [2] = 
            {
               MudProgType = "act_prog", 
               ScriptType = "MProg", 
               Arguments = "p arrives from the west.", 
               Code = "say Welcome! Are you ready to learn young apprentice?\
", 
            }, 
         }, 
         DamRoll = 0, 
         HitRoll = 0, 
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
         ShortDescr = "a guardian", 
         Alignment = 0, 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Charisma = 10, 
            Strength = 10, 
            Constitution = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Intelligence = 10, 
         }, 
         NumberOfAttacks = 0, 
         Level = 40, 
         Weight = 0, 
         Name = "Guardian", 
         Description = "This is no mere guard. He too has developed many skills and is powerful. You\
should consider attacking him, wisely.\
", 
         Height = 0, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         SaveVs = 
         {
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         AffectedBy = 
         {
            [7] = "Sanctuary", 
         }, 
      }, 
      [31512] = 
      {
         DefaultPosition = "standing", 
         Race = "Tusken", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         Credits = 0, 
         ArmorClass = 0, 
         LongDescr = "A Tusken Raider watches you waiting for the right moment to attack.\
", 
         Position = "standing", 
         Sex = "male", 
         Vnum = 31512, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "all_greet_prog", 
               ScriptType = "MProg", 
               Arguments = "70", 
               Code = "snarl\
swear $n\
", 
            }, 
         }, 
         DamRoll = 0, 
         HitRoll = 0, 
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
         Level = 23, 
         Alignment = 0, 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Charisma = 10, 
            Strength = 10, 
            Constitution = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Intelligence = 10, 
         }, 
         VipFlags = 
         {
            [8] = "Tatooine", 
         }, 
         ShortDescr = "a Tusken Raider", 
         NumberOfAttacks = 0, 
         Name = "Sand person tusken raider", 
         Description = "This species has adapted to the ways of living in the desert. He is strong in\
mind and is very vicious. Be careful what you do.\
", 
         Height = 0, 
         Weight = 0, 
         SaveVs = 
         {
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
            [5] = "Aggressive", 
            [2] = "Scavenger", 
            [6] = "StayArea", 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
      }, 
      [31513] = 
      {
         DefaultPosition = "standing", 
         Race = "Tusken", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         Credits = 0, 
         ArmorClass = 0, 
         LongDescr = "A Wise Tusken Raider sits here telling a story.\
", 
         Position = "standing", 
         Sex = "male", 
         Vnum = 31513, 
         DamRoll = 0, 
         HitRoll = 0, 
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
         Alignment = 0, 
         Level = 30, 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Charisma = 10, 
            Strength = 10, 
            Constitution = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Intelligence = 10, 
         }, 
         ShortDescr = "a Tusken Raider storyteller.", 
         NumberOfAttacks = 0, 
         Name = "Sand people tusken raider Storyteller.", 
         Description = "This Tusken Raider has survived years of training and memory. To become what\
he is he cannot make any mistakes or alter in any way a story told from the\
past or he will be killed, for the Sand People believe that once told a story\
can never be altered in any way.\
", 
         Height = 0, 
         Weight = 0, 
         SaveVs = 
         {
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
            [2] = "Scavenger", 
            [6] = "StayArea", 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
      }, 
      [31514] = 
      {
         DefaultPosition = "standing", 
         Race = "Tusken", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         Credits = 0, 
         ArmorClass = 0, 
         LongDescr = "A storyteller in training listens carefully here so that he may remember every story with precision and awe.      \
", 
         Position = "standing", 
         Sex = "male", 
         Vnum = 31514, 
         DamRoll = 0, 
         HitRoll = 0, 
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
         Alignment = 0, 
         Level = 25, 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Charisma = 10, 
            Strength = 10, 
            Constitution = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Intelligence = 10, 
         }, 
         ShortDescr = "a storyteller in training", 
         NumberOfAttacks = 0, 
         Name = "Storyteller training.", 
         Description = "This is one of the younger, wiser Sand People. He is being trained to become\
the next Storyteller of the Sand People. He just hopes in his mind that he\
will remember and remember well every story precisely.\
", 
         Height = 0, 
         Weight = 0, 
         SaveVs = 
         {
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
            [2] = "Scavenger", 
            [6] = "StayArea", 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
      }, 
      [31515] = 
      {
         DefaultPosition = "standing", 
         Race = "Ronto", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         Credits = 0, 
         ArmorClass = 0, 
         LongDescr = "A ronto stands here towering over you.\
", 
         Position = "standing", 
         Sex = "male", 
         Vnum = 31515, 
         DamRoll = 0, 
         HitRoll = 0, 
         Languages = 
         {
            Speaks = 
            {
               [17] = "jawaese", 
            }, 
            Speaking = 
            {
               [0] = "basic", 
            }, 
         }, 
         Alignment = 0, 
         Level = 45, 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Charisma = 10, 
            Strength = 10, 
            Constitution = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Intelligence = 10, 
         }, 
         ShortDescr = "a ronto", 
         NumberOfAttacks = 0, 
         Name = "Ronto", 
         Description = "This creature is rather tame but when provoked can be aggressive and\
dangerous. Watch your step.\
", 
         Height = 0, 
         Weight = 0, 
         SaveVs = 
         {
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
      }, 
      [31516] = 
      {
         DefaultPosition = "standing", 
         Race = "Bantha", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         Credits = 0, 
         ArmorClass = 0, 
         LongDescr = "A bantha walks around here slowly, waiting for its master.\
", 
         Position = "standing", 
         Sex = "male", 
         Vnum = 31516, 
         DamRoll = 0, 
         HitRoll = 0, 
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
         Alignment = 0, 
         Level = 35, 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Charisma = 10, 
            Strength = 10, 
            Constitution = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Intelligence = 10, 
         }, 
         ShortDescr = "a bantha", 
         NumberOfAttacks = 0, 
         Name = "Bantha", 
         Description = "This is a large furry creature which is rumored to have crushed people with\
one step. Be careful for he does not like people who are not his master.\
", 
         Height = 0, 
         Weight = 0, 
         SaveVs = 
         {
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [5] = "Aggressive", 
            [6] = "StayArea", 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
      }, 
      [31517] = 
      {
         DefaultPosition = "standing", 
         Race = "Human", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         Credits = 0, 
         ArmorClass = 0, 
         LongDescr = "A mechanic waits here to be hired.\
", 
         Position = "standing", 
         Sex = "male", 
         Vnum = 31517, 
         DamRoll = 0, 
         HitRoll = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "all_greet_prog", 
               ScriptType = "MProg", 
               Arguments = "100", 
               Code = "say So ya need something fixed, eh?\
", 
            }, 
         }, 
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
         Alignment = 0, 
         Level = 14, 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Charisma = 10, 
            Strength = 10, 
            Constitution = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Intelligence = 10, 
         }, 
         ShortDescr = "a mechanic", 
         NumberOfAttacks = 0, 
         Name = "Mechanic", 
         Description = "This mechanic is rather young, he has marks and wrinkles from work and\
possibly war. He seems to be calm and will stay away from you unless you\
need something which he may sometimes have.\
", 
         Height = 0, 
         Weight = 0, 
         SaveVs = 
         {
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [2] = "Scavenger", 
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
      }, 
      [31518] = 
      {
         DefaultPosition = "standing", 
         Race = "Jawa", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         Credits = 0, 
         ArmorClass = 0, 
         LongDescr = "A tall jawa stands here protecting his Rontos.\
", 
         Position = "standing", 
         Sex = "male", 
         Vnum = 31518, 
         DamRoll = 0, 
         HitRoll = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "all_greet_prog", 
               ScriptType = "MProg", 
               Arguments = "100", 
               Code = "say So...\
say You're interested in rontos, eh?\
nudge $n\
", 
            }, 
         }, 
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
         Alignment = 140, 
         Level = 19, 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Charisma = 10, 
            Strength = 10, 
            Constitution = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Intelligence = 10, 
         }, 
         ShortDescr = "a tall Jawa", 
         NumberOfAttacks = 0, 
         Name = "tall jawa", 
         Description = "This Jawa is probably the tallest Jawa ever. Although he is still smaller than\
you he looks tough, and with that gun I would be scared.\
", 
         Height = 0, 
         Weight = 0, 
         SaveVs = 
         {
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [2] = "Scavenger", 
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
      }, 
      [31519] = 
      {
         DefaultPosition = "standing", 
         Race = "Human", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         Credits = 0, 
         ArmorClass = 0, 
         LongDescr = "Wuher stands here serving people their drinks.\
", 
         Position = "standing", 
         Sex = "male", 
         Vnum = 31519, 
         DamRoll = 0, 
         HitRoll = 0, 
         Shop = 
         {
            BusinessHours = 
            {
               Close = 23, 
               Open = 1, 
            }, 
            ProfitBuy = 105, 
            KeeperShortDescr = "Wuher", 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            ProfitSell = 100, 
         }, 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
            }, 
            Speaking = 
            {
               [0] = "basic", 
               [17] = "jawaese", 
            }, 
         }, 
         Alignment = 0, 
         Level = 65, 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Charisma = 10, 
            Strength = 10, 
            Constitution = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Intelligence = 10, 
         }, 
         ShortDescr = "Wuher", 
         NumberOfAttacks = 0, 
         Name = "Wuher", 
         Description = "This man is rather old and has been working here for many years as bartender.\
Be careful though, he still has his same old edge.\
", 
         Height = 0, 
         Weight = 0, 
         SaveVs = 
         {
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [2] = "Scavenger", 
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
      }, 
      [31520] = 
      {
         DefaultPosition = "standing", 
         Race = "Rodent", 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitNoDice = 4, 
            HitPlus = 200, 
         }, 
         Credits = 0, 
         ArmorClass = 50, 
         LongDescr = "A small womp rat walks around here.\
", 
         Position = "standing", 
         Sex = "undistinguished", 
         Vnum = 31520, 
         DamRoll = 4, 
         HitRoll = 4, 
         SpecFuns = 
         {
            [0] = "spec_fido", 
         }, 
         Languages = 
         {
            Speaks = 
            {
               [17] = "jawaese", 
            }, 
            Speaking = 
            {
               [17] = "jawaese", 
            }, 
         }, 
         Alignment = 0, 
         Level = 20, 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Charisma = 10, 
            Strength = 10, 
            Constitution = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Intelligence = 10, 
         }, 
         ShortDescr = "a small womp rat", 
         NumberOfAttacks = 0, 
         Name = "Womp rat", 
         Description = "A small womp rat walk around here seeking shelter.\
", 
         Height = 0, 
         Weight = 0, 
         SaveVs = 
         {
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
            [24] = "NoAssist", 
         }, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamPlus = 2, 
            DamNoDice = 2, 
         }, 
      }, 
      [31521] = 
      {
         DefaultPosition = "standing", 
         Race = "Human", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         Credits = 0, 
         ArmorClass = 0, 
         LongDescr = "A small thief Walks about trying to pick your pocket.\
", 
         Position = "standing", 
         AttackFlags = 
         {
            [5] = "kick", 
         }, 
         Sex = "undistinguished", 
         Vnum = 31521, 
         DamRoll = 0, 
         HitRoll = 0, 
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
         Alignment = 0, 
         Level = 9, 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Charisma = 10, 
            Strength = 10, 
            Constitution = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Intelligence = 10, 
         }, 
         ShortDescr = "a small thief", 
         NumberOfAttacks = 0, 
         Name = "Small Thief", 
         Description = "", 
         Height = 0, 
         Weight = 0, 
         SaveVs = 
         {
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
            [24] = "NoAssist", 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
      }, 
      [31522] = 
      {
         DefaultPosition = "standing", 
         Race = "Human", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         Credits = 0, 
         ArmorClass = 0, 
         LongDescr = "A large thief walks about here.\
", 
         Position = "standing", 
         AttackFlags = 
         {
            [4] = "punch", 
         }, 
         Sex = "undistinguished", 
         Vnum = 31522, 
         DamRoll = 0, 
         HitRoll = 0, 
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
         Alignment = 0, 
         Level = 11, 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Charisma = 10, 
            Strength = 10, 
            Constitution = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Intelligence = 10, 
         }, 
         ShortDescr = "a large thief", 
         NumberOfAttacks = 0, 
         Name = "Large thief", 
         Description = "", 
         Height = 0, 
         Weight = 0, 
         SaveVs = 
         {
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
            [24] = "NoAssist", 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
      }, 
      [31523] = 
      {
         DefaultPosition = "standing", 
         Race = "Human", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         Credits = 0, 
         ArmorClass = 0, 
         LongDescr = "A skillful thief walks about here.\
", 
         Position = "standing", 
         AttackFlags = 
         {
            [4] = "punch", 
         }, 
         Sex = "undistinguished", 
         Vnum = 31523, 
         DamRoll = 0, 
         HitRoll = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               ScriptType = "MProg", 
               Arguments = "35", 
               Code = "Steal credits $n\
", 
            }, 
         }, 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
               [17] = "jawaese", 
            }, 
            Speaking = 
            {
               [17] = "jawaese", 
            }, 
         }, 
         Alignment = 0, 
         Level = 17, 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Charisma = 10, 
            Strength = 10, 
            Constitution = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Intelligence = 10, 
         }, 
         ShortDescr = "a skillful thief", 
         NumberOfAttacks = 0, 
         Name = "skillful thief", 
         Description = "", 
         Height = 0, 
         Weight = 0, 
         SaveVs = 
         {
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
            [24] = "NoAssist", 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
      }, 
      [31524] = 
      {
         DefaultPosition = "standing", 
         Race = "Human", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         Credits = 0, 
         ArmorClass = 0, 
         LongDescr = "A smuggler sits at a table watching.\
", 
         Position = "standing", 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         Sex = "undistinguished", 
         Vnum = 31524, 
         DamRoll = 0, 
         HitRoll = 0, 
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
         Alignment = 0, 
         Level = 18, 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Charisma = 10, 
            Strength = 10, 
            Constitution = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Intelligence = 10, 
         }, 
         ShortDescr = "a smuggler", 
         NumberOfAttacks = 0, 
         Name = "Smuggler", 
         Description = "", 
         Height = 0, 
         Weight = 0, 
         SaveVs = 
         {
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
            [24] = "NoAssist", 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
      }, 
      [31525] = 
      {
         DefaultPosition = "standing", 
         Race = "Human", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         Credits = 0, 
         ArmorClass = 0, 
         LongDescr = "An experienced smuggler waits for his contact here.\
", 
         Position = "standing", 
         AttackFlags = 
         {
            [5] = "kick", 
            [6] = "_06", 
            [9] = "_09", 
         }, 
         Sex = "undistinguished", 
         Vnum = 31525, 
         DamRoll = 0, 
         HitRoll = 0, 
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
         Alignment = 0, 
         Level = 26, 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Charisma = 10, 
            Strength = 10, 
            Constitution = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Intelligence = 10, 
         }, 
         ShortDescr = "an experienced smuggler", 
         NumberOfAttacks = 0, 
         Name = "Experienced Smuggler", 
         Description = "", 
         Height = 0, 
         Weight = 0, 
         SaveVs = 
         {
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
      }, 
      [31526] = 
      {
         DefaultPosition = "standing", 
         Race = "Ithorian", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         Credits = 0, 
         ArmorClass = 0, 
         LongDescr = "An Ithorian drinks his liquors here.\
", 
         Position = "standing", 
         AttackFlags = 
         {
            [6] = "_06", 
            [5] = "kick", 
         }, 
         Sex = "undistinguished", 
         Vnum = 31526, 
         DamRoll = 0, 
         HitRoll = 0, 
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
         Alignment = 0, 
         Level = 14, 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Charisma = 10, 
            Strength = 10, 
            Constitution = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Intelligence = 10, 
         }, 
         ShortDescr = "an Ithorian", 
         NumberOfAttacks = 0, 
         Name = "Ithorian", 
         Description = "", 
         Height = 0, 
         Weight = 0, 
         SaveVs = 
         {
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
            [24] = "NoAssist", 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
      }, 
      [31527] = 
      {
         DefaultPosition = "standing", 
         Race = "Human", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         Credits = 0, 
         ArmorClass = 0, 
         LongDescr = "A female citizen minds her own business here.\
", 
         Position = "standing", 
         Sex = "undistinguished", 
         Vnum = 31527, 
         DamRoll = 0, 
         HitRoll = 0, 
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
         Alignment = 0, 
         Level = 6, 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Charisma = 10, 
            Strength = 10, 
            Constitution = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Intelligence = 10, 
         }, 
         ShortDescr = "a female citizen", 
         NumberOfAttacks = 0, 
         Name = "Female citizen", 
         Description = "", 
         Height = 0, 
         Weight = 0, 
         SaveVs = 
         {
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
      }, 
      [31528] = 
      {
         DefaultPosition = "standing", 
         Race = "Human", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         Credits = 0, 
         ArmorClass = 0, 
         LongDescr = "A male citizen walks around here.\
", 
         Position = "standing", 
         Sex = "undistinguished", 
         Vnum = 31528, 
         DamRoll = 0, 
         HitRoll = 0, 
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
         Alignment = 0, 
         Level = 13, 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Charisma = 10, 
            Strength = 10, 
            Constitution = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Intelligence = 10, 
         }, 
         ShortDescr = "a male citizen", 
         NumberOfAttacks = 0, 
         Name = "Male citizen", 
         Description = "", 
         Height = 0, 
         Weight = 0, 
         SaveVs = 
         {
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
      }, 
      [31529] = 
      {
         DefaultPosition = "standing", 
         Race = "Rodian", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         Credits = 0, 
         ArmorClass = 0, 
         LongDescr = "A Rodian sits here contemplating his navel.\
", 
         Position = "standing", 
         Sex = "undistinguished", 
         Vnum = 31529, 
         DamRoll = 0, 
         HitRoll = 0, 
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
         Alignment = 0, 
         Level = 9, 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Charisma = 10, 
            Strength = 10, 
            Constitution = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Intelligence = 10, 
         }, 
         ShortDescr = "a Rodian", 
         NumberOfAttacks = 0, 
         Name = "Rodian", 
         Description = "", 
         Height = 0, 
         Weight = 0, 
         SaveVs = 
         {
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
      }, 
      [31530] = 
      {
         DefaultPosition = "standing", 
         Race = "Human", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         Credits = 0, 
         ArmorClass = 0, 
         LongDescr = "Merth walks around here.\
", 
         Position = "standing", 
         AttackFlags = 
         {
            [9] = "_09", 
            [5] = "kick", 
         }, 
         Sex = "undistinguished", 
         Vnum = 31530, 
         DamRoll = 0, 
         HitRoll = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "fight_prog", 
               ScriptType = "MProg", 
               Arguments = "100", 
               Code = "mpforce $n remove rifle\
mpforce $n give rifle merth\
mpinvis\
flee\
mpinvis\
feel heal merth\
feel heal merth\
feel heal merth\
wield blaster\
", 
            }, 
         }, 
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
         Alignment = 0, 
         Level = 103, 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Charisma = 10, 
            Strength = 10, 
            Constitution = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Intelligence = 10, 
         }, 
         ShortDescr = "Merth", 
         NumberOfAttacks = 0, 
         Name = "Merth", 
         Description = "", 
         Height = 0, 
         Weight = 0, 
         SaveVs = 
         {
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
      }, 
      [31531] = 
      {
         DefaultPosition = "standing", 
         Race = "Human", 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitNoDice = 6, 
            HitPlus = 320, 
         }, 
         Credits = 0, 
         ArmorClass = 20, 
         LongDescr = "Wioslea tends to her customers need.\
", 
         Position = "standing", 
         Sex = "undistinguished", 
         Vnum = 31531, 
         Shop = 
         {
            BusinessHours = 
            {
               Close = 23, 
               Open = 1, 
            }, 
            ProfitBuy = 120, 
            KeeperShortDescr = "Wioslea", 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            ProfitSell = 0, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "all_greet_prog", 
               ScriptType = "MProg", 
               Arguments = "100", 
               Code = "say Business is bad, get outta here!\
grin\
", 
            }, 
         }, 
         DamRoll = 6, 
         HitRoll = 6, 
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
         Level = 32, 
         Alignment = 0, 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Charisma = 10, 
            Strength = 10, 
            Constitution = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Intelligence = 10, 
         }, 
         VipFlags = 
         {
            [8] = "Tatooine", 
         }, 
         ShortDescr = "Wioslea", 
         NumberOfAttacks = 0, 
         Name = "Wioslea", 
         Description = "", 
         Height = 0, 
         Weight = 0, 
         SaveVs = 
         {
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamPlus = 2, 
            DamNoDice = 3, 
         }, 
      }, 
      [31532] = 
      {
         DefaultPosition = "standing", 
         Race = "Human", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         Credits = 0, 
         ArmorClass = 0, 
         LongDescr = "Gep Stands here selling you food for your travels.\
", 
         Position = "standing", 
         Sex = "undistinguished", 
         Vnum = 31532, 
         Shop = 
         {
            BusinessHours = 
            {
               Close = 23, 
               Open = 1, 
            }, 
            ProfitBuy = 110, 
            KeeperShortDescr = "Gep", 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            ProfitSell = 100, 
         }, 
         DamRoll = 0, 
         HitRoll = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "all_greet_prog", 
               ScriptType = "MProg", 
               Arguments = "100", 
               Code = "if ispc($n)\
    say Hello customer.\
    say I have everything you need just type \"list\".\
endif\
", 
            }, 
         }, 
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
         Alignment = 0, 
         Level = 1, 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Charisma = 10, 
            Strength = 10, 
            Constitution = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Intelligence = 10, 
         }, 
         ShortDescr = "Gep", 
         NumberOfAttacks = 0, 
         Name = "Gep", 
         Description = "", 
         Height = 0, 
         Weight = 0, 
         SaveVs = 
         {
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
      }, 
      [31533] = 
      {
         DefaultPosition = "standing", 
         Race = "Sullustan", 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitNoDice = 4, 
            HitPlus = 200, 
         }, 
         Credits = 200, 
         ArmorClass = 50, 
         LongDescr = "A Sullustan pump maintenance mechanic seems to be goofing off here.\
", 
         Position = "standing", 
         Sex = "male", 
         Vnum = 31533, 
         DamRoll = 4, 
         HitRoll = 4, 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
               [25] = "sullustese", 
            }, 
            Speaking = 
            {
               [0] = "basic", 
            }, 
         }, 
         Alignment = 0, 
         Level = 20, 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Charisma = 10, 
            Strength = 10, 
            Constitution = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Intelligence = 10, 
         }, 
         ShortDescr = "a pump mechanic", 
         NumberOfAttacks = 0, 
         Name = "Sullustan pump mechanic", 
         Description = "Taller than most Sullustans, the pump maintenance mechanic appears to be\
in decent shape. His ears is also larger than usual, and his eyes are dark\
and gleaming.\
", 
         Height = 0, 
         Weight = 0, 
         SaveVs = 
         {
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamPlus = 2, 
            DamNoDice = 2, 
         }, 
      }, 
      [31534] = 
      {
         DefaultPosition = "standing", 
         Race = "Rodent", 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitNoDice = 4, 
            HitPlus = 200, 
         }, 
         Credits = 0, 
         ArmorClass = 50, 
         LongDescr = "A tatoo-rat seems to be searching for food.\
", 
         Position = "standing", 
         Sex = "undistinguished", 
         Vnum = 31534, 
         DamRoll = 4, 
         HitRoll = 4, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "death_prog", 
               ScriptType = "MProg", 
               Arguments = "100", 
               Code = "-- Drop loot on death\
if rand(50)\
    -- Low-quality rodent skin\
    mpoload 31533\
endif\
", 
            }, 
         }, 
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
         Alignment = 0, 
         Level = 20, 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Charisma = 10, 
            Strength = 10, 
            Constitution = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Intelligence = 10, 
         }, 
         ShortDescr = "a tatoo-rat", 
         NumberOfAttacks = 0, 
         Name = "tatoo-rat", 
         Description = "A tatoo-rat is a small rodent with brown fur and a long tail.\
", 
         Height = 0, 
         Weight = 0, 
         SaveVs = 
         {
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamPlus = 2, 
            DamNoDice = 2, 
         }, 
      }, 
      [31535] = 
      {
         DefaultPosition = "standing", 
         Race = "Human", 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitNoDice = 20, 
            HitPlus = 20000, 
         }, 
         Credits = 0, 
         ArmorClass = -150, 
         LongDescr = "A retired merc is here, eager to teach the next generation.\
", 
         Position = "standing", 
         Sex = "male", 
         Vnum = 31535, 
         DamRoll = 20, 
         HitRoll = 20, 
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
               [9] = "antarian", 
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
               [26] = "falleen", 
               [27] = "binary", 
               [28] = "yevethan", 
               [29] = "gand", 
               [30] = "durese", 
               [31] = "coyn", 
               [0] = "basic", 
            }, 
            Speaking = 
            {
               [0] = "basic", 
            }, 
         }, 
         Alignment = 0, 
         Level = 100, 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Charisma = 10, 
            Strength = 25, 
            Constitution = 25, 
            Luck = 10, 
            Dexterity = 25, 
            Intelligence = 10, 
         }, 
         ShortDescr = "a retired merc", 
         NumberOfAttacks = 0, 
         Name = "retired merc", 
         Description = "", 
         Height = 0, 
         Weight = 0, 
         SaveVs = 
         {
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [10] = "Practice", 
            [30] = "Prototype", 
            [9] = "Train", 
         }, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamPlus = 2, 
            DamNoDice = 10, 
         }, 
      }, 
      [31536] = 
      {
         DefaultPosition = "standing", 
         Race = "Zabrak", 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitNoDice = 20, 
            HitPlus = 20000, 
         }, 
         Credits = 0, 
         ArmorClass = -150, 
         LongDescr = "An experienced zabrak engineer teaches basic engineering skills.\
", 
         Position = "standing", 
         Sex = "male", 
         Vnum = 31536, 
         DamRoll = 20, 
         HitRoll = 20, 
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
               [9] = "antarian", 
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
               [26] = "falleen", 
               [27] = "binary", 
               [28] = "yevethan", 
               [29] = "gand", 
               [30] = "durese", 
               [31] = "coyn", 
               [0] = "basic", 
            }, 
            Speaking = 
            {
               [0] = "basic", 
            }, 
         }, 
         Alignment = 0, 
         Level = 100, 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Charisma = 10, 
            Strength = 10, 
            Constitution = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Intelligence = 25, 
         }, 
         ShortDescr = "an experienced zabrak engineer", 
         NumberOfAttacks = 0, 
         Name = "experienced zabrak engineer", 
         Description = "", 
         Height = 0, 
         Weight = 0, 
         SaveVs = 
         {
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [10] = "Practice", 
            [30] = "Prototype", 
            [9] = "Train", 
         }, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamPlus = 2, 
            DamNoDice = 10, 
         }, 
      }, 
      [31537] = 
      {
         DefaultPosition = "standing", 
         Race = "Rodian", 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitNoDice = 20, 
            HitPlus = 20000, 
         }, 
         Credits = 0, 
         ArmorClass = -150, 
         LongDescr = "Mayor Mikdanyell Guh'rantt is here.\
", 
         Position = "standing", 
         Sex = "male", 
         Vnum = 31537, 
         DamRoll = 20, 
         HitRoll = 20, 
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
               [9] = "antarian", 
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
               [26] = "falleen", 
               [27] = "binary", 
               [28] = "yevethan", 
               [29] = "gand", 
               [30] = "durese", 
               [31] = "coyn", 
               [0] = "basic", 
            }, 
            Speaking = 
            {
               [0] = "basic", 
            }, 
         }, 
         Alignment = 0, 
         Level = 100, 
         Stats = 
         {
            Force = 0, 
            Wisdom = 25, 
            Charisma = 25, 
            Strength = 10, 
            Constitution = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Intelligence = 25, 
         }, 
         ShortDescr = "Mayor Mikdanyell Guh'rantt", 
         NumberOfAttacks = 0, 
         Name = "Mayor Mikdanyell Guh'rantt", 
         Description = "", 
         Height = 0, 
         Weight = 0, 
         SaveVs = 
         {
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [9] = "Train", 
            [10] = "Practice", 
            [20] = "Scholar", 
            [30] = "Prototype", 
            [25] = "NoKill", 
         }, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamPlus = 2, 
            DamNoDice = 10, 
         }, 
      }, 
      [31538] = 
      {
         DefaultPosition = "standing", 
         Race = "Bothan", 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitNoDice = 20, 
            HitPlus = 20000, 
         }, 
         Credits = 0, 
         ArmorClass = -150, 
         LongDescr = "A Bothan smuggler is enjoying some downtime.\
", 
         Position = "standing", 
         Sex = "male", 
         Vnum = 31538, 
         DamRoll = 20, 
         HitRoll = 20, 
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
               [9] = "antarian", 
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
               [26] = "falleen", 
               [27] = "binary", 
               [28] = "yevethan", 
               [29] = "gand", 
               [30] = "durese", 
               [31] = "coyn", 
               [0] = "basic", 
            }, 
            Speaking = 
            {
               [0] = "basic", 
            }, 
         }, 
         Alignment = 0, 
         Level = 100, 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Charisma = 10, 
            Strength = 10, 
            Constitution = 10, 
            Luck = 20, 
            Dexterity = 10, 
            Intelligence = 10, 
         }, 
         ShortDescr = "a Bothan smuggler", 
         NumberOfAttacks = 0, 
         Name = "Bothan smuggler", 
         Description = "", 
         Height = 0, 
         Weight = 0, 
         SaveVs = 
         {
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [10] = "Practice", 
            [30] = "Prototype", 
            [9] = "Train", 
         }, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamPlus = 2, 
            DamNoDice = 10, 
         }, 
      }, 
      [31539] = 
      {
         DefaultPosition = "standing", 
         Race = "Duros", 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitNoDice = 20, 
            HitPlus = 20000, 
         }, 
         Credits = 0, 
         ArmorClass = -150, 
         LongDescr = "The facility manager is doing some paperwork.\
", 
         Position = "standing", 
         Sex = "male", 
         Vnum = 31539, 
         DamRoll = 20, 
         HitRoll = 20, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "speech_prog", 
               ScriptType = "MProg", 
               Arguments = "p yes", 
               Code = "if ispc($n)\
    say Great. Just type PRACTICE and we can get down to business.\
endif\
", 
            }, 
            [2] = 
            {
               MudProgType = "all_greet_prog", 
               ScriptType = "MProg", 
               Arguments = "100", 
               Code = "if ispc($n)\
    if level($n) <= 25\
        say Welcome. I can give you some basic flight lessons if you want.\
    endif\
endif\
", 
            }, 
         }, 
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
               [9] = "antarian", 
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
               [26] = "falleen", 
               [27] = "binary", 
               [28] = "yevethan", 
               [29] = "gand", 
               [30] = "durese", 
               [31] = "coyn", 
               [0] = "basic", 
            }, 
            Speaking = 
            {
               [0] = "basic", 
            }, 
         }, 
         Alignment = 0, 
         Level = 100, 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Charisma = 10, 
            Strength = 10, 
            Constitution = 10, 
            Luck = 10, 
            Dexterity = 25, 
            Intelligence = 10, 
         }, 
         ShortDescr = "the facility manager", 
         NumberOfAttacks = 0, 
         Name = "facility manager", 
         Description = "", 
         Height = 0, 
         Weight = 0, 
         SaveVs = 
         {
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [9] = "Train", 
            [10] = "Practice", 
            [25] = "NoKill", 
         }, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamPlus = 2, 
            DamNoDice = 10, 
         }, 
      }, 
      [31540] = 
      {
         DefaultPosition = "standing", 
         Race = "Reptile", 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitNoDice = 4, 
            HitPlus = 400, 
         }, 
         Credits = 0, 
         ArmorClass = 50, 
         LongDescr = "A docile rill is wandering the dunes.\
", 
         Position = "standing", 
         Sex = "male", 
         Vnum = 31540, 
         DamRoll = 4, 
         HitRoll = 4, 
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
         Alignment = 0, 
         Level = 20, 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Charisma = 10, 
            Strength = 10, 
            Constitution = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Intelligence = 10, 
         }, 
         ShortDescr = "a rill", 
         NumberOfAttacks = 0, 
         Name = "rill", 
         Description = "The rill is a lizard native to Tatooine. It looks much like a scyk, with\
spines along its back and very sharp teeth. But it's not aggressive\
unless attacked.\
", 
         Height = 0, 
         Weight = 0, 
         SaveVs = 
         {
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Damage = 
         {
            DamSizeDice = 8, 
            DamPlus = 2, 
            DamNoDice = 4, 
         }, 
      }, 
      [31541] = 
      {
         DefaultPosition = "standing", 
         Race = "Dewback", 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitNoDice = 5, 
            HitPlus = 500, 
         }, 
         Credits = 0, 
         ArmorClass = 37, 
         LongDescr = "A large, green-skinned dewback roams the sands. \
", 
         Position = "standing", 
         Sex = "undistinguished", 
         Vnum = 31541, 
         DamRoll = 5, 
         HitRoll = 5, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               ScriptType = "MProg", 
               Arguments = "3", 
               Code = "if rand(50)\
    emote makes a strange, lowing noise.\
else\
    emote licks $s back with $s flicking tongue.\
endif\
", 
            }, 
         }, 
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
         Alignment = 0, 
         Level = 25, 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Charisma = 10, 
            Strength = 10, 
            Constitution = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Intelligence = 10, 
         }, 
         ShortDescr = "a dewback", 
         NumberOfAttacks = 0, 
         Name = "Dewback", 
         Description = "The dewback is a large reptile native to Tatooine, frequently used as a\
beast of burden. It has thick, scaly, green skin and four clawed feet.\
", 
         Height = 0, 
         Weight = 0, 
         SaveVs = 
         {
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamPlus = 2, 
            DamNoDice = 2, 
         }, 
      }, 
      [31542] = 
      {
         DefaultPosition = "standing", 
         Race = "Creature", 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitNoDice = 4, 
            HitPlus = 200, 
         }, 
         Credits = 0, 
         ArmorClass = 50, 
         LongDescr = "A worrt is sitting here perfectly still.\
", 
         Position = "standing", 
         Sex = "undistinguished", 
         Vnum = 31542, 
         SpecFuns = 
         {
            [0] = "spec_poison", 
         }, 
         DamRoll = 4, 
         HitRoll = 4, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               ScriptType = "MProg", 
               Arguments = "3", 
               Code = "emote catches an insect with $s long tongue, then swallows it followed by a loud belch.\
", 
            }, 
         }, 
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
         Alignment = 0, 
         Level = 20, 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Charisma = 10, 
            Strength = 10, 
            Constitution = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Intelligence = 10, 
         }, 
         ShortDescr = "a worrt", 
         NumberOfAttacks = 0, 
         Name = "Worrt", 
         Description = "", 
         Height = 0, 
         Weight = 0, 
         SaveVs = 
         {
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamPlus = 2, 
            DamNoDice = 2, 
         }, 
      }, 
      [31900] = 
      {
         DefaultPosition = "standing", 
         Race = "Human", 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitNoDice = 20, 
            HitPlus = 15000, 
         }, 
         Credits = 0, 
         ArmorClass = -150, 
         LongDescr = "Zim the Failed Jedi stands here before you.\
", 
         Position = "standing", 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         Sex = "male", 
         Vnum = 31900, 
         Shop = 
         {
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
            ProfitBuy = 120, 
            KeeperShortDescr = "Zim the Failed Jedi", 
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
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               ScriptType = "Imp", 
               Arguments = "3", 
               Code = "from mobs.zim import *\
def on_rand(zim):\
    zim_on_rand(zim)\
", 
            }, 
            [2] = 
            {
               MudProgType = "all_greet_prog", 
               ScriptType = "Imp", 
               Arguments = "100", 
               Code = "from mobs.zim import *\
def on_greet(zim, actor):\
    zim_on_greet(zim, actor)\
", 
            }, 
         }, 
         DamRoll = 20, 
         HitRoll = 20, 
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
               [9] = "antarian", 
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
               [26] = "falleen", 
               [27] = "binary", 
               [28] = "yevethan", 
               [29] = "gand", 
               [30] = "durese", 
               [31] = "coyn", 
               [0] = "basic", 
            }, 
            Speaking = 
            {
               [0] = "basic", 
            }, 
         }, 
         Level = 100, 
         Alignment = 0, 
         Stats = 
         {
            Force = 20, 
            Wisdom = 25, 
            Charisma = 10, 
            Strength = 10, 
            Constitution = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Intelligence = 10, 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         ShortDescr = "Zim the Failed Jedi", 
         NumberOfAttacks = 0, 
         Name = "zim failed jedi", 
         Description = "Zim is a middle-aged male human with silvery stripes in his dark brown hair.\
His stomach is bulging over a leather belt that has a lightsaber hanging from\
it. \
\
In his younger days, during the Clone Wars, he was an apprentice to a minor\
Jedi Master. Unfortunately Zim never quite had the talent to pass the Jedi\
trials, and when Order 66 was issued, he was somehow overlooked. Since then\
he's been in hiding, seeking to pass on what little he learned. \
", 
         Height = 0, 
         Weight = 0, 
         SaveVs = 
         {
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [10] = "Practice", 
            [30] = "Prototype", 
            [9] = "Train", 
         }, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamPlus = 2, 
            DamNoDice = 10, 
         }, 
      }, 
      [31902] = 
      {
         DefaultPosition = "standing", 
         Race = "Human", 
         HitChance = 
         {
            HitSizeDice = 100, 
            HitNoDice = 10, 
            HitPlus = 0, 
         }, 
         Credits = 0, 
         ArmorClass = 0, 
         LongDescr = "A disillusioned student is doing chores.\
", 
         Position = "standing", 
         Sex = "male", 
         Vnum = 31902, 
         DamRoll = 0, 
         HitRoll = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "greet_prog", 
               ScriptType = "Imp", 
               Arguments = "100", 
               Code = "def on_greet(mob, actor):\
    locs = {\"kitchen\": 31901, \"commonroom\": 31900, \"workshop\": 31906, \"sleepingquarters\": 31903}\
    location = inroom(mob)\
    wait(1.0)\
\
    if vnum(location) == locs[\"kitchen\"]:\
        echo(actor, str(mob) + \" looks at you with weary eyes.\")\
        echoaround(actor, str(mob) + \" looks at \" + str(actor) + \" with weary eyes.\")\
        say(mob, \"I really hate kitchen duty.\")\
        interpret(mob, \"sigh\")\
    elif vnum(location) == locs[\"commonroom\"]:\
        echo(actor, \"Upon seeing you, \" + str(mob) + \" grabs a broom and pretends he was doing his chores.\")\
    elif vnum(location) == locs[\"workshop\"]:\
        echo(location, str(mob) + \" seems to be on the verge of crying as he fails assembling a lightsaber.\")\
    elif vnum(location) == locs[\"sleepingquarters\"]:\
        interpret(mob, \"yawn\")\
", 
            }, 
         }, 
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
         Alignment = 0, 
         Level = 1, 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Charisma = 10, 
            Strength = 10, 
            Constitution = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Intelligence = 10, 
         }, 
         ShortDescr = "a disillusioned student", 
         NumberOfAttacks = 0, 
         Name = "disillusioned student", 
         Description = "", 
         Height = 0, 
         Weight = 0, 
         SaveVs = 
         {
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
      }, 
      [31901] = 
      {
         DefaultPosition = "standing", 
         Race = "Human", 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitNoDice = 4, 
            HitPlus = 10000, 
         }, 
         Credits = 0, 
         ArmorClass = 50, 
         LongDescr = "A Jedi sparring partner looks eager for action.\
", 
         Position = "standing", 
         Sex = "male", 
         Vnum = 31901, 
         DamRoll = 4, 
         HitRoll = 4, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               ScriptType = "Imp", 
               Arguments = "10", 
               Code = "from mobs.jedisparringpartner import *\
def on_rand(mob):\
    jsp_on_rand(mob)\
", 
            }, 
            [2] = 
            {
               MudProgType = "speech_prog", 
               ScriptType = "Imp", 
               Arguments = "p disarm me", 
               Code = "from mobs.jedisparringpartner import *\
def on_speech(mob, actor, txt):\
    jsp_on_speech(mob, actor, txt)\
", 
            }, 
            [3] = 
            {
               MudProgType = "all_greet_prog", 
               ScriptType = "Imp", 
               Arguments = "100", 
               Code = "from mobs.jedisparringpartner import *\
def on_greet(mob, actor):\
    jsp_on_greet(mob, actor)\
", 
            }, 
         }, 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
            }, 
            Speaking = 
            {
               [1] = "shyriiwook", 
               [0] = "basic", 
               [17] = "jawaese", 
            }, 
         }, 
         Alignment = 0, 
         Level = 20, 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Charisma = 10, 
            Strength = 10, 
            Constitution = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Intelligence = 10, 
         }, 
         ShortDescr = "a Jedi sparring partner", 
         NumberOfAttacks = 0, 
         Name = "jedi sparring partner", 
         Description = "This young Jedi apprentice has long, brown hair in a low ponytail. His bland\
facial features are covered by a cropped beard. He's wearing plain clothes to\
blend in with the Mos Eisley population. Wearing Jedi robes would be very\
risky these days.\
", 
         Height = 0, 
         Weight = 0, 
         SaveVs = 
         {
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
         }, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamPlus = 2, 
            DamNoDice = 2, 
         }, 
      }, 
      [31999] = 
      {
         DefaultPosition = "standing", 
         Race = "Human", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         Credits = 0, 
         ArmorClass = 0, 
         LongDescr = "Some god abandoned a newly created lastmob here.\
", 
         Position = "standing", 
         Sex = "undistinguished", 
         Vnum = 31999, 
         DamRoll = 0, 
         HitRoll = 0, 
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
         Alignment = 0, 
         Level = 1, 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Charisma = 10, 
            Strength = 10, 
            Constitution = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Intelligence = 10, 
         }, 
         ShortDescr = "a newly created lastmob", 
         NumberOfAttacks = 0, 
         Name = "lastmob", 
         Description = "", 
         Height = 0, 
         Weight = 0, 
         SaveVs = 
         {
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
      }, 
   }, 
   Objects = 
   {
      [31500] = 
      {
         Affects = 
         {
            [1] = 
            {
               Modifier = 1, 
               Location = 18, 
            }, 
         }, 
         ObjectValues = 
         {
            [1] = 1, 
            [2] = 30, 
            [3] = 1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a small white candle", 
         Cost = 0, 
         Name = "candle", 
         Description = "A candle rests here.", 
         Weight = 1, 
         ItemType = "light", 
         Vnum = 31500, 
         Flags = 
         {
            [0] = "Glow", 
            [10] = "AntiEvil", 
         }, 
         ActionDescription = "", 
      }, 
      [31501] = 
      {
         ObjectValues = 
         {
            [1] = 1, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Layers = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         ShortDescr = "a large brain jar with flashing lights", 
         Cost = 0, 
         Name = "brain jar", 
         Description = "A large jar containing a sacred brain lies here. ", 
         Weight = 3, 
         ItemType = "container", 
         Vnum = 31501, 
         Flags = 
         {
            [0] = "Glow", 
         }, 
         ActionDescription = "", 
      }, 
      [31502] = 
      {
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Layers = 0, 
         ShortDescr = "a dead Jawa", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "This jawa has been laying here for quite a while as it seems. His skin has\
\13begun decaying and you can see his bones in certain spots.", 
               Keyword = "look jawa", 
            }, 
         }, 
         Name = "corpse dead Jawa", 
         Description = "A dead Jawa lies motionless on the ground here.", 
         Cost = 0, 
         ItemType = "corpse", 
         ActionDescription = "", 
         Weight = 100, 
         Vnum = 31502, 
      }, 
      [31503] = 
      {
         Affects = 
         {
            [1] = 
            {
               Modifier = 0, 
               Location = 9, 
            }, 
         }, 
         ObjectValues = 
         {
            [1] = 97000, 
            [2] = 10000, 
            [3] = 11000, 
            [4] = 0, 
            [5] = 0, 
            [0] = 100000, 
         }, 
         Layers = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "A large egg with different colors on it lays here. It would probably not be\
\13wise to take it or the mother might get mad.", 
               Keyword = "look egg", 
            }, 
         }, 
         Cost = 0, 
         ShortDescr = "a large egg", 
         Weight = 2, 
         Name = "Egg", 
         Description = "A large egg lays here, falling over every once in a while.", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ItemType = "trash", 
         Vnum = 31503, 
         Flags = 
         {
            [12] = "NoRemove", 
         }, 
         ActionDescription = "", 
      }, 
      [31504] = 
      {
         Affects = 
         {
            [1] = 
            {
               Modifier = 5, 
               Location = 17, 
            }, 
         }, 
         ObjectValues = 
         {
            [1] = 9000, 
            [2] = 110, 
            [3] = 1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 100000, 
         }, 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a shiny krayt crystal", 
         Cost = 0, 
         Name = "Shiny krayt crystal", 
         Description = "A shiny krayt crystal lays here.", 
         Weight = 1, 
         ItemType = "light", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 31504, 
      }, 
      [31505] = 
      {
         ObjectValues = 
         {
            [1] = 2000, 
            [2] = 6000, 
            [3] = 1100, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10000, 
         }, 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ShortDescr = "a krayt pearl", 
         Weight = 1, 
         Name = "Pearl", 
         Description = "A glowing pearl lays here.", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ItemType = "armor", 
         Vnum = 31505, 
         Flags = 
         {
            [0] = "Glow", 
         }, 
         ActionDescription = "", 
      }, 
      [31506] = 
      {
         ObjectValues = 
         {
            [1] = 10, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a canteen", 
         Cost = 0, 
         Name = "Canteen", 
         Description = "A canteen rests here, waiting to be picked up.", 
         Weight = 2, 
         ItemType = "drink_container", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 31506, 
      }, 
      [31507] = 
      {
         ObjectValues = 
         {
            [1] = 15, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 15, 
         }, 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a jug of water", 
         Cost = 0, 
         Name = "jug", 
         Description = "A jug of water rests here.", 
         Weight = 5, 
         ItemType = "drink_container", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 31507, 
      }, 
      [31508] = 
      {
         ObjectValues = 
         {
            [1] = 1, 
            [2] = 5, 
            [3] = 3, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a torn up circuit", 
         Cost = 0, 
         Name = "Circuit", 
         Description = "A torn up circuit lies here, waiting to be picked up.", 
         Weight = 1, 
         ItemType = "circuit", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 31508, 
      }, 
      [31509] = 
      {
         Affects = 
         {
            [1] = 
            {
               Modifier = 0, 
               Location = 5, 
            }, 
         }, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 1345, 
            [4] = 0, 
            [5] = 0, 
            [0] = 1, 
         }, 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a dirty Jawa robe", 
         Cost = 0, 
         Name = "Jawa Robe", 
         Description = "A Jawa robe is here, waiting to be taken.", 
         Weight = 3, 
         ItemType = "armor", 
         Vnum = 31509, 
         Flags = 
         {
            [0] = "Glow", 
            [18] = "SmallSize", 
         }, 
         ActionDescription = "", 
      }, 
      [31510] = 
      {
         ObjectValues = 
         {
            [1] = 15, 
            [2] = 6, 
            [3] = 11, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "some wire", 
         Cost = 0, 
         Name = "Wire", 
         Description = "Some wire is here, waiting to be taken", 
         Weight = 2, 
         ItemType = "trash", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 31510, 
      }, 
      [31511] = 
      {
         Affects = 
         {
            [1] = 
            {
               Modifier = 0, 
               Location = 18, 
            }, 
         }, 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 6, 
            [3] = 6, 
            [4] = 0, 
            [5] = 0, 
            [0] = 7200, 
         }, 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a Jawa Blaster", 
         Cost = 0, 
         Name = "Jawa Blaster", 
         Description = "A elegant little blaster lays here on the ground.", 
         Weight = 6, 
         ItemType = "weapon", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Vnum = 31511, 
      }, 
      [31512] = 
      {
         Affects = 
         {
            [1] = 
            {
               Modifier = 0, 
               Location = 1, 
            }, 
            [2] = 
            {
               Modifier = 10, 
               Location = 2, 
            }, 
            [3] = 
            {
               Modifier = 10, 
               Location = 3, 
            }, 
            [4] = 
            {
               Modifier = 10, 
               Location = 4, 
            }, 
            [5] = 
            {
               Modifier = 10, 
               Location = 5, 
            }, 
            [6] = 
            {
               Modifier = 20, 
               Location = 9, 
            }, 
            [7] = 
            {
               Modifier = 500, 
               Location = 18, 
            }, 
            [8] = 
            {
               Modifier = 500, 
               Location = 19, 
            }, 
            [9] = 
            {
               Modifier = 0, 
               Location = 19, 
            }, 
         }, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = -259084288, 
            [4] = 0, 
            [5] = 0, 
            [0] = 200, 
         }, 
         Layers = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "This belt glows and hums with extreme power comming from it. This object cannot be handled by a mortal mind for its powers are to great.", 
               Keyword = "look belt", 
            }, 
         }, 
         Cost = 0, 
         ShortDescr = "Satin's Glimmering Belt.", 
         Weight = 1, 
         Name = "Glimmering Belt", 
         Description = "A powerful godly belt lays on the ground here.", 
         WearFlags = 
         {
            [11] = "Waist", 
         }, 
         ItemType = "armor", 
         Vnum = 31512, 
         Flags = 
         {
            [0] = "Glow", 
         }, 
         ActionDescription = "", 
      }, 
      [31513] = 
      {
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 17000, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a large stick", 
         Cost = 0, 
         Name = "Stick", 
         Description = "A large stick of the Wise Storyteller lays here.", 
         Weight = 1, 
         ItemType = "treasure", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 31513, 
      }, 
      [31514] = 
      {
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Layers = 0, 
         ShortDescr = "a large oak desk", 
         ExtraDescriptions = 
         {
         }, 
         Name = "large oak desk", 
         Description = "A large oak desk collects dust on the ground here.", 
         Cost = 0, 
         ItemType = "furniture", 
         ActionDescription = "", 
         Weight = 150, 
         Vnum = 31514, 
      }, 
      [31515] = 
      {
         Affects = 
         {
            [1] = 
            {
               Modifier = 0, 
               Location = 4, 
            }, 
         }, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 1300, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ShortDescr = "a mechanics belt", 
         Weight = 4, 
         Name = "Belt", 
         Description = "A mechanics belt lays here waiting to be used.", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ItemType = "armor", 
         Vnum = 31515, 
         Flags = 
         {
            [31] = "HumanSize", 
         }, 
         ActionDescription = "", 
      }, 
      [31516] = 
      {
         Affects = 
         {
            [1] = 
            {
               Modifier = 0, 
               Location = 2, 
            }, 
         }, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 600, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ShortDescr = "a mechanics hat", 
         Weight = 2, 
         Name = "Hat", 
         Description = "A mechanics hat collects dust on the ground.", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ItemType = "armor", 
         Vnum = 31516, 
         Flags = 
         {
            [31] = "HumanSize", 
         }, 
         ActionDescription = "", 
      }, 
      [31517] = 
      {
         ObjectValues = 
         {
            [1] = 6, 
            [2] = 6, 
            [3] = 6, 
            [4] = 1000, 
            [5] = 1000, 
            [0] = 7200, 
         }, 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a Jawa ionization gun", 
         Cost = 0, 
         Name = "Ionization Gun", 
         Description = "A Jawa ionization gun has been foolishly left behind.", 
         Weight = 8, 
         ItemType = "weapon", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Vnum = 31517, 
      }, 
      [31518] = 
      {
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a small hide Key", 
         Cost = 0, 
         Name = "key", 
         Description = "A small key crafted from hide", 
         Weight = 5, 
         ItemType = "key", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 31518, 
      }, 
      [31519] = 
      {
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Layers = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "greet_prog", 
               ScriptType = "MProg", 
               Arguments = "100", 
               Code = "if isdroid($n)\
    mpechoat $n The droid detector flashes and beeps as you enter.\
    mpechoaround $n The droid detector flashes and beeps as $n enters.\
    mpecho From within the cantina someone shouts, 'Hey! We don't serve your kind here!'\
endif\
", 
            }, 
         }, 
         ShortDescr = "a droid detector", 
         ExtraDescriptions = 
         {
         }, 
         Name = "Detector", 
         Description = "A droid detector is mounted on the wall here.", 
         Cost = 0, 
         ItemType = "furniture", 
         ActionDescription = "", 
         Weight = 900, 
         Vnum = 31519, 
      }, 
      [31520] = 
      {
         ObjectValues = 
         {
            [1] = 1, 
            [2] = 6, 
            [3] = 11, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a large drink machine", 
         Cost = 0, 
         Name = "Drink Machine", 
         Description = "A large and complex drink machine sits here. It is used by Wuher\
\13to dispense drinks.", 
         Weight = 5, 
         ItemType = "furniture", 
         Vnum = 31520, 
         Flags = 
         {
            [0] = "Glow", 
         }, 
         ActionDescription = "", 
      }, 
      [31521] = 
      {
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a bed", 
         Cost = 0, 
         Name = "Bed", 
         Description = "A comfortable bed lays here. Maybe laying down would not hurt you.", 
         Weight = 1, 
         ItemType = "trash", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 31521, 
      }, 
      [31522] = 
      {
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 3, 
         }, 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a bantha rib", 
         Cost = 10, 
         Name = "Bantha rib", 
         Description = "A bantha rib is here for your enjoyment.", 
         Weight = 1, 
         ItemType = "food", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 31522, 
      }, 
      [31523] = 
      {
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a banthaburger", 
         Cost = 15, 
         Name = "Banthaburger", 
         Description = "A banthaburger site here ready to eat.", 
         Weight = 1, 
         ItemType = "food", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 31523, 
      }, 
      [31524] = 
      {
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 4, 
         }, 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "some grilled womp rat", 
         Cost = 16, 
         Name = "Grilled Womp Rat", 
         Description = "Some grilled womp rat is here ready to be snatched up.", 
         Weight = 1, 
         ItemType = "food", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 31524, 
      }, 
      [31525] = 
      {
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Layers = 0, 
         ShortDescr = "a hologram projector", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "This projector creates an illusory wall to the north to keep\
\13this passage hidden.\
\13", 
               Keyword = "hologram projector", 
            }, 
         }, 
         Name = "hologram projector", 
         Description = "A hologram projector is here.", 
         Cost = 0, 
         ItemType = "trash", 
         ActionDescription = "", 
         Weight = 1, 
         Vnum = 31525, 
      }, 
      [31526] = 
      {
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 3, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 3, 
         }, 
         Layers = 0, 
         ShortDescr = "a worn couch", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "This couch looks very worn out. The seats look like they're made\
\13out of bantha hide, but you can't be sure.\
\13", 
               Keyword = "worn couch", 
            }, 
         }, 
         Name = "worn couch", 
         Description = "A worn couch is here.", 
         Cost = 0, 
         ItemType = "furniture", 
         ActionDescription = "", 
         Weight = 1, 
         Vnum = 31526, 
      }, 
      [31527] = 
      {
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 2, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         Layers = 0, 
         ShortDescr = "spacious seats", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "The seats are very comfortable, allowing even large species like Wookiees to\
stretch their legs.\
", 
               Keyword = "spacious seats", 
            }, 
         }, 
         Name = "spacious seats", 
         Description = "Rows of spacious seats fill this section.", 
         Cost = 0, 
         ItemType = "furniture", 
         ActionDescription = "", 
         Weight = 1, 
         Vnum = 31527, 
      }, 
      [31528] = 
      {
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 2, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         Layers = 0, 
         ShortDescr = "cramped seats", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "The seats are very dirty, as you might expect on Tatooine. There's no room\
to stretch your legs, even if you're a Jawa.\
", 
               Keyword = "cramped seats", 
            }, 
         }, 
         Name = "cramped seats", 
         Description = "Cramped seats fill the economy section.", 
         Cost = 0, 
         ItemType = "furniture", 
         ActionDescription = "", 
         Weight = 1, 
         Vnum = 31528, 
      }, 
      [31529] = 
      {
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 20, 
         }, 
         Layers = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               ScriptType = "Imp", 
               Arguments = "100", 
               Code = "from objs.fridge31529 import *\
\
def on_rand(obj):\
    fridge_on_rand(obj)\
", 
            }, 
         }, 
         ShortDescr = "a refridgerator", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "The refridgerator is an older model, and gives off a fairly loud humming\
noise. It seems quite dirty on the outside. One can only hope it's better\
on the inside.\
", 
               Keyword = "refridgerator fridge", 
            }, 
         }, 
         Name = "refridgerator fridge", 
         Description = "A small refridgerator stands in a corner.", 
         Cost = 0, 
         ItemType = "container", 
         ActionDescription = "", 
         Weight = 1, 
         Vnum = 31529, 
      }, 
      [31530] = 
      {
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Layers = 0, 
         ShortDescr = "a fake flower", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "The flower is deep purple. The stalk is about one meter long and has green\
leaves. The pot is white, with specks of dirt on it. The flower looks kind\
of real, but smells very fake.\
", 
               Keyword = "fake flower", 
            }, 
         }, 
         Name = "fake flower", 
         Description = "A large fake flower in a large pot.", 
         Cost = 0, 
         ItemType = "trash", 
         ActionDescription = "", 
         Weight = 1, 
         Vnum = 31530, 
      }, 
      [31531] = 
      {
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Layers = 0, 
         ShortDescr = "the machinery", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "This large machine towers above you for several meters. It have many large\
tubes, valves and gauges. It seems likely that the purpose of this machinery\
is to pump the sewer somewhere, but one can't be sure.\
", 
               Keyword = "mysterious machinery", 
            }, 
         }, 
         Name = "mysterious machinery", 
         Description = "Some mysterious-looking machinery is here, making a lot of noise.", 
         Cost = 0, 
         ItemType = "trash", 
         ActionDescription = "", 
         Weight = 1, 
         Vnum = 31531, 
      }, 
      [31532] = 
      {
         ObjectValues = 
         {
            [1] = 4, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 4, 
         }, 
         Layers = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "The jumpsuit is blue, and has multiple pockets. It full of oil and dirt, and smells\
pretty bad.\
", 
               Keyword = "jumpsuit", 
            }, 
         }, 
         ShortDescr = "a jumpsuit", 
         Cost = 10, 
         Name = "jumpsuit", 
         Description = "A jumpsuit lies neatly folded on the ground.", 
         Weight = 1, 
         ItemType = "armor", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
            [3] = "Body", 
         }, 
         Vnum = 31532, 
      }, 
      [31533] = 
      {
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a low-quality rodent skin", 
         Cost = 25, 
         Name = "low-quality rodent skin", 
         Description = "Some low-quality rodent skin is lying on the ground.", 
         Weight = 1, 
         ItemType = "fabric", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 31533, 
      }, 
      [31534] = 
      {
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 1, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 6, 
         }, 
         Layers = 0, 
         ShortDescr = "a plastic table", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "The table looks cheap and simple. The table legs are gray and the tabletop is\
white. At least it used to be white. Now it's slightly yellowed and dirty.\
", 
               Keyword = "platic table chairs", 
            }, 
         }, 
         Name = "platic table chairs", 
         Description = "A plastic table with some chairs is here.", 
         Cost = 0, 
         ItemType = "furniture", 
         ActionDescription = "", 
         Weight = 1, 
         Vnum = 31534, 
      }, 
      [31535] = 
      {
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Layers = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               ScriptType = "MProg", 
               Arguments = "25", 
               Code = "mpecho The rusty pipes spew out more sewage into the river.\
", 
            }, 
         }, 
         ShortDescr = "a few rusty pipes", 
         ExtraDescriptions = 
         {
         }, 
         Name = "rusty pipes", 
         Description = "A few rusty pipes comes down from the ceiling.", 
         Cost = 0, 
         ItemType = "trash", 
         ActionDescription = "", 
         Weight = 1, 
         Vnum = 31535, 
      }, 
      [31536] = 
      {
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 2, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "an uncomfortable bed", 
         Cost = 0, 
         Name = "uncomfortable bed", 
         Description = "An uncomfortable bed is here.", 
         Weight = 1, 
         ItemType = "furniture", 
         Vnum = 31536, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         ActionDescription = "", 
      }, 
      [31537] = 
      {
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 20, 
         }, 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a workbench", 
         Cost = 0, 
         Name = "workbench drawers", 
         Description = "A workbench with drawers.", 
         Weight = 1, 
         ItemType = "container", 
         Vnum = 31537, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         ActionDescription = "", 
      }, 
      [31538] = 
      {
         ObjectValues = 
         {
            [1] = 115, 
            [2] = -1, 
            [3] = -1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Layers = 0, 
         ShortDescr = "a mysterious book", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "This is an old fashioned book with leather binding and actual paper pages.\
As you page through the volume, you can't believe what you're reading.\
It is a detailed account of how to construct a lightsaber! Maybe you\
should try to STUDY it.\
", 
               Keyword = "mysterious book", 
            }, 
         }, 
         Name = "mysterious book", 
         Description = "A mysterious book is here.", 
         Cost = 0, 
         ItemType = "book", 
         ActionDescription = "", 
         Weight = 1, 
         Vnum = 31538, 
      }, 
      [31999] = 
      {
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Layers = 0, 
         ShortDescr = "a newly created lastobject", 
         ExtraDescriptions = 
         {
         }, 
         Name = "lastobject", 
         Description = "Some god dropped a newly created lastobject here.", 
         Cost = 0, 
         ItemType = "trash", 
         ActionDescription = "", 
         Weight = 1, 
         Vnum = 31999, 
      }, 
   }, 
   Filename = "tatooine.lua", 
   LowEconomy = 27700539, 
   Rooms = 
   {
      [31744] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Jundland Wastes", 
         Description = "You can smell an odour developing around you.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31745, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31743, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31744, 
         Sector = "mountain", 
         Tag = "", 
      }, 
      [31745] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Jundland Wastes", 
         Description = "You stand on a hard rocky surface. The air around you is very unpleasant.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31744, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31745, 
         Sector = "mountain", 
         Tag = "", 
      }, 
      [31746] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Long Hallway", 
         Description = "You are walking down a long, narrow hallway which turns at the end.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31747, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31735, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31746, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31747] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Hallway Through Jabba's Palace", 
         Description = "You are walking down a hallway. It is old and there is a rather digusting\
smell all around you.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31748, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31746, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31747, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31748] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Long Hallway in Jabba's Palace", 
         Description = "You are standing in a hallway. To each side all along the hall there are\
small individual rooms.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31749, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31747, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31748, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31749] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Long Hallway End", 
         Description = "You are coming to the end of the hallway which curves both to the east and\
to the west.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31750, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31748, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31749, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31750] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Narrow Hallway", 
         Description = "You are in a small narrow hallway which has a very disgusting odour, not\
surprising considering what creatures and animals have lived here in the past\
and even now. The ground is cool and hard full of ripples as if never crafted\
or taken care of.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31751, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31749, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31770, 
               Distance = 0, 
            }, 
            [4] = 
            {
               Direction = "up", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31788, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31750, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31751] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Hallway Facing A Dark Room", 
         Description = "You are standing in a hallway facing east. As you look down the hallway at\
the end you can see different colored lights flashing in the dimness and the\
darkness. The ground is rough and the air is hot and heavy. Above a burnt out\
glowpanel lays motionless but you can still see pretty well.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31768, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31752, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31769, 
               Distance = 0, 
            }, 
            [4] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31750, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31751, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31752] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Narrow Hallway ", 
         Description = "You are walking down a narrow hallway. To each side there are very small rooms\
which are vacant.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31766, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31753, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31767, 
               Distance = 0, 
            }, 
            [4] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31751, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31752, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31753] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "A Long Hallway ", 
         Description = "You are walking down a hallway towards a very large opening. It appears not\
to be guarded or have a door in place. The ground beneath you is hard and full\
of cracks and uneven places. The air is heavy and hot but nothing that cannot\
be lived with.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31764, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31754, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31765, 
               Distance = 0, 
            }, 
            [4] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31752, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31753, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31754] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "End Of Hallway Before A Large Room", 
         Description = "You approach the dark room at the end of the hallway with every step you\
take. To you sides you continually see small occupied rooms. The ground\
beneath your feet is rough and uneven making you feet ache all over. The\
lighting here is minimal but you can still see down the hall.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31762, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31755, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31763, 
               Distance = 0, 
            }, 
            [4] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31753, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31754, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31755] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "In Front Of A Large Room", 
         Description = "You are standing in front of a very large room with different sections in it.\
The entrance used to have doors but as you can see they have been removed for\
all that remains is the hinges.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31760, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31756, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31761, 
               Distance = 0, 
            }, 
            [4] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31754, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31755, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31756] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Brain Jar Room", 
         Description = "You stand in a dark room filled with brain jars. Each brain is used to put\
inside of a spiderwalker. You can go down the rows in front of you. The ground\
is softer in here as if taken care of, there is not one ripple in the whole\
surface showing grace and care from the person or people that finished this\
room.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31759, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31757, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31755, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31756, 
         Flags = 
         {
            [0] = "Dark", 
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31757] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Brain Room", 
         Description = "All around you there are brains in jars. As you walk by they start screaming.\
As they scream the lights on the jars change color indicating that they are\
not calm at all. In front of you there is a row of containing shelves with\
jars gently placed on them.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31758, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31756, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31757, 
         Flags = 
         {
            [0] = "Dark", 
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31758] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Brain Compartment", 
         Description = "You are walking down a row. To your sides shelves are filled with brains from\
all species of the galaxy. These jars seem to be a bit calmer for their lights\
are not flaring off when you pass by them. this shows they are mature and\
prepared to be put into a body of some sort, most likely a spiderwalker.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31757, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31758, 
         Flags = 
         {
            [0] = "Dark", 
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31759] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Row Of Jars", 
         Description = "You are standing in a row with shelves in it. On each shelf jars have been\
placed carefully to ensure that they are safe and will not fall to the ground\
and break. The air is crisp and provides stability as you stare longly at the\
large amounts of jars.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31756, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31759, 
         Flags = 
         {
            [0] = "Dark", 
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31760] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Old Room", 
         Description = "You are standing in small room which was initially designed to home a person.\
It has a window facing the sun.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31755, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31760, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31761] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Dusty Old Room", 
         Description = "You are standing in room. It has dust all over it for it has not been used\
for many, many years.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31755, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31761, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31762] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Large Guest Room", 
         Description = "This is a larger room. It was probably designed to hold a larger species.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31754, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31762, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31763] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Old Small Calibered Room", 
         Description = "The room you are standing in is very small room. It has a window in the\
corner and an old bedframe in the corner which seems to have been destroyed by\
small rodents.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31754, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31763, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31764] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Storage Compartment For Droids", 
         Description = "You are standing in an extremely small room that was designed to hold a\
cleaning droid or two.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31753, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31764, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31765] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Large Specimen Room", 
         Description = "You are in a large room. It was made for a larger type species. It is used to\
house and for sleeping. This room has a very disgusting odour.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31753, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31765, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31766] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Small Unused Room", 
         Description = "You are standing in a small room with a window facing the great sand dune\
sea.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31752, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31766, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31767] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Habitated Room", 
         Description = "You are standing in a room which seems to be habitated. There is a small bed\
in the corner with a window mounted on the wall which looks outside.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31752, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31767, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31768] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Small Enclosed Room", 
         Description = "You are in a room of small caliber. You feel enclosed as you look around the\
room.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31751, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31768, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31769] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Unhabitated Room", 
         Description = "You are standing in a bedroom. It is not habitated but could be.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31751, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31769, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31770] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Long Hallway", 
         Description = "You walk down a long narrow hallway which floor is covered with stone and\
provides discomfort for your feet. To each side you can see some small and\
large rooms all with different uses. There is a glowpanel above your head\
barely functioning providing the dimmest of light all over.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31750, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31771, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31770, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31771] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "A Hallway Passage", 
         Description = "The hallway you walk down is on an uneven\
surface, it has ripples all along it and provides not much for heat or for\
comfort. There is no lighting here but you can still see down the gloomy\
hallway but not always with ease.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31770, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31772, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31771, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31772] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Dense Hallway", 
         Description = "As you walk down the hallway on a cool stone floor you smell an odour, a\
rather unpleasant one, but having been in this palace it is no surprise that\
this smell is located here. The hallway is gloomy and the floor has a rough\
texture as if never smoothed out.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31782, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31771, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31784, 
               Distance = 0, 
            }, 
            [4] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31773, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31772, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31773] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Long Narrowed Hallway", 
         Description = "The ground beneath your feet is made of pure stone, rather cold at night and\
still cool in the day the stone is what covers all the palace floors. You can\
see the end of the hallway just ahead of yourself. Large and without any\
features. Just a simple stone wall.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31780, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31772, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31781, 
               Distance = 0, 
            }, 
            [4] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31774, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31773, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31774] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Hallway Leading To Individual Rooms", 
         Description = "The hallway you walk down is covered in stone, cold on your feet as you walk\
over it for it does not preserve heat well. A glowpanel above is burnt out\
and every once in a while a small burst of electricity comes rippling through\
the end of the cables. The air here is dense but not filled with a stench, a\
rather unusual thing for this palace. To both sides there are rooms of\
different caliber. There is a great stone wall stopping the end of the hall\
just ahead.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31778, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31773, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31779, 
               Distance = 0, 
            }, 
            [4] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31775, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31774, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31775] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "End Of A Long Hallway", 
         Description = "You are standing at the end of the hallway. There is a very large stone wall\
before you covering your way further down the hallway. The stone wall is\
thick and rough with different textures all over its surface.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31776, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31774, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31777, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31775, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31776] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Extra Small Compartment Room", 
         Description = "You are standing in room of very small caliber. It was probably constructed to\
hold extra blankets. There are closets all along the walls.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31775, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31776, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31777] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Large Old Room", 
         Description = "You are in a large room. It was probably used as a sleeping quarter. There is\
a small bed in the corner which has been chewed away at by a small rodent.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31775, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31777, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31778] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Well Sized Room", 
         Description = "You are in a well sized room. It was used as a living quarters in the past.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31774, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31778, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31779] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Habitated Living Quarters", 
         Description = "You are standing in a living quarters. It is currently habitated. You can\
tell because of food on the floor.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31774, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31779, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31780] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Supply Storage", 
         Description = "You are standing in a small room used to store extra supplies.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31773, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31780, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31781] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Large Living Quarters", 
         Description = "You are in a very large room. It was made as a living quaters. There is a\
large window in front of you.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31773, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31781, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31782] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Small Room", 
         Description = "You are in a smaller room. It can be used for any purpose.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31772, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31782, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31784] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Large Room", 
         Description = "You are standing in a large room. There is a bed that can hold any species\
and a large window on the back wall.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31772, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31784, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31788] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Top Of Staircase", 
         Description = "You are standing at the top of a staircase. In front of you there is a long\
hallway. Along the hallway many prison cells are there because Jabba use them\
for keeping people of unimportance.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31789, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "down", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31750, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31788, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31789] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Prison Hallway", 
         Description = "You are walking down the hallway. As you walk along you notice that all of\
the doors have been removed.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31788, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31790, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31789, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31790] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Prison Hallway", 
         Description = "You are in the hallway. It ends just up ahead making it a rather short\
corridor.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31789, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31794, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31791, 
               Distance = 0, 
            }, 
            [4] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31795, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31790, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31791] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Prison Hallway End", 
         Description = "You have come to the end of the hall. A stone wall lays in front of you,\
preventing you from advancing.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31790, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31792, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31793, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31791, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31792] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Small Prison Cell", 
         Description = "You are standing in a prison cell. If you turn back there are metal bars\
across the wall. All around you the only furniture in this cell is a prison\
bed.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31791, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31792, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31793] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Large Prison Cell", 
         Description = "You are standing in a large prison cell. This cell was used for larger\
specimens. It has a toilet and a small bunk in the corner.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31791, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31793, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31794] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Extremely Small Cell", 
         Description = "You are standing in the smallest cell. This cell was used to hold very small\
specimens of life.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31790, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31794, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31795] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Very Large Prison Cell", 
         Description = "You are standing in a very large prison cell. It scares you to think what was\
kept in here. There is an awful smell.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31790, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31795, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31796] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Rancor's Pit", 
         Description = "You just fell down the trapdoor into the rancor's pit. Here there is a very\
disgusting smell. This room is immense. To the north is the smaller\
compartment the rancor was kept in while his cage was cleaned.\
", 
         Exits = 
         {
         }, 
         Sector = "inside", 
         Vnum = 31796, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Tag = "", 
      }, 
      [31797] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "DT", 
         Description = "You get crushed by gate and die(d.t)\
", 
         Exits = 
         {
         }, 
         Sector = "inside", 
         Vnum = 31797, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Tag = "", 
      }, 
      [31798] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Rancor's Cage", 
         Description = "You just slid down the chute into the rancor's cage. The room is an immense\
room and has a very foul odour to it. To the north the smaller room lays which\
the rancor was put when the cage was cleaned.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31799, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "up", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31733, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31798, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31799] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "DT", 
         Description = "EDIT\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31798, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31799, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31800] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Hallway to Rancor Pit", 
         Description = "You are standing in front of hallway which leads down into the rancor pit. To\
the south is the kitchen. To continue down the hall go east.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31733, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31802, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31801, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31800, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31801] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Jabba's Palace's Kitchen", 
         Description = "You are standing inside the kitchen that is used to make Jabba the Hutt's\
disgusting foods. There is a table in the center of the room with a cutting\
board and extra utensils. On the wall there are many shelves and utensils\
layed everywhere.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31800, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31801, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31802] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Hallway Past Docking Bay", 
         Description = "You are walking down a hall which passes the docking bay and many living\
quarters.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31803, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31800, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31802, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31803] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Hallway Past A Room", 
         Description = "You are standing in front of one of many rooms located on the bottom level.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31802, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31803, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31804] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Landing Pad 6", 
         Description = "You are standing on a rather small sized landing pad. It can be used to keep\
smaller sized vehicles of any origin.\
", 
         Exits = 
         {
         }, 
         Sector = "city", 
         Vnum = 31804, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Tag = "", 
      }, 
      [31805] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Rocky Cliff", 
         Description = "You are standing at the top of a high cliff. As you look downwards it is not a\
far drop but what scares you is that you would land on sharp jagged stones of\
all shapes and sizes. As you look the other way there is a steep cliff. If you\
can climb it go ahead.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31589, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "up", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31806, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31805, 
         Sector = "mountain", 
         Tag = "", 
      }, 
      [31806] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Krayt Nest", 
         Description = "You are standing in the middle of a Krayt Dragon's nest. It does not smell\
particularly good. A large female krayt towers over you here wondering what\
you are doing.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "down", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31805, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31806, 
         Sector = "mountain", 
         Tag = "", 
      }, 
      [31807] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "All around you is sand and shiny dunes piling as high as you can see. As far\
as you can guess anything could be behind there. The towering sand dunes make\
you feel scared as you are so small and enclosed by the towering heaps of\
sand.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31501, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31808, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31807, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31808] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Deserty Path", 
         Description = "You are walking along the hot sand heated by the twin suns of Tatooine. The\
ground beneath you is hardening gradually as you walk over it or is it just\
your imagination?\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31809, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31807, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31812, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31808, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31809] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Hard Sandy Area", 
         Description = "You walk along a large area covered with sand. This sand seems to have\
hardened gradually over the years and is now almost of the consistency of\
sandstone. To the west the sand slopes downward in many directions. \
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31814, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31808, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31810, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31809, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31810] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Sandy Surface", 
         Description = "You are standing on top of very hard sand, yet maybe even rock covered with\
sand. As you look westwards you see the dune sea stop abruptly and plummet\
downwards. I wonder why.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31809, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31811, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31810, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31811] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Overseeing A Small Colony.", 
         Description = "You are standing on the edge of a very steep drop that falls directly into the\
heart of what looks to be a colony of some sorts. You would not want to fall\
down this cliff for it is a ways down.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31810, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31811, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31812] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Flat Area", 
         Description = "You are walking on one of the only things on this planet. Sand. It is nice and\
soft but some patches of hardened sand can bee seen all around.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31808, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31813, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31812, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31813] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You look about, look from the direction you came, nothing, nothing at all but\
sand. You wonder how much of this stuff could there possibly be?\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31812, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31813, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31814] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Unstable Ground", 
         Description = "As the ground beaneath your feet is in a transition from sand to rock\
it seems to be versatile and flakes away in some areas with every\
step that you take on it. Northward you see all the sand is no longer\
there but it is totally a rock surface.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31815, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31809, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31814, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31815] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Rocky Area", 
         Description = "The texture beneath your feet is no longer primarily sand but totally\
rock. The rock continues for twenty or thirty feet ahead of you but\
then stops abruptly and becomes sand once again. Downwards a cliff\
slopes downwards. This side is still very steep but you can perceive\
that it is very possible to go up and down of it.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31814, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "down", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31816, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31815, 
         Sector = "mountain", 
         Tag = "", 
      }, 
      [31816] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Side Of Steep Path", 
         Description = "You are on a pathway facing a severe angle which makes it so that\
there is not much room to move around without falling downwards\
towards flat ground. To the east there is a small cave in the side of\
a cliff. If you continue downwards you will be entering the city.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31817, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "up", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31815, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Direction = "down", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31818, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31816, 
         Sector = "mountain", 
         Tag = "", 
      }, 
      [31817] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Water Shack", 
         Description = "You are standing in a dimly lit room. There is an aged Jawa shopkeeper\
sitting in the corner behind a table selling items you may need to\
explore this vast land filled with opportunities and predators. In\
this small cave it is darker which makes the temperature drop\
drastically and therefore makes this place a good one to stay in for\
long periods of time especially when both suns are up, sending rays of\
heat onto you. \
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31816, 
               Distance = 0, 
            }, 
         }, 
         Sector = "mountain", 
         Vnum = 31817, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31818] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Entering The City", 
         Description = "You are standing on the same level most of this city is based on. All\
around tere are small shops and tents set up quickly used for\
merchandising goods to any passers.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31819, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31870, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Direction = "up", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31816, 
               Distance = 0, 
            }, 
         }, 
         Sector = "mountain", 
         Vnum = 31818, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Tag = "", 
      }, 
      [31819] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Path In The City", 
         Description = "You are walking down a wide path in the middle of this small city\
seemingly belonging to the Jawas. It has been used frequently and\
you can tell this for the rock is shaved away by weight and the path\
is full of marks. Straight ahead also there is a huge fortress of\
some sorts. It is simply constructed and seems old, but that is\
probably because of the wind and the scorching suns of Tatooine. \
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31818, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31849, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31820, 
               Distance = 0, 
            }, 
            [4] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31851, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31819, 
         Sector = "mountain", 
         Tag = "", 
      }, 
      [31820] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Dusty Path", 
         Description = "You walk along a wide dusty path between two of the most popular\
places in this small veritable city. All around Jawas and small\
creatures of likes you do not want to be aquainted with. As you\
continue down this path you recognize many things and see the\
fortress growing with every step you take, seemingly growing to an \
endless extent. Although it is rather large it seems to be of simple\
construction and not very complicated.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31819, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31821, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31820, 
         Sector = "mountain", 
         Tag = "", 
      }, 
      [31821] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Path", 
         Description = "You walk along a wide path seemingly wider than you think because of\
the reflection and glare of the two twin suns of Tatooine. In front\
of you the Jawa fortress stands immensely with not much architectural\
design to it. You can continue down this road towards the fortress or\
turn off into one of the side streets leading to who knows where.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31820, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31822, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31821, 
         Sector = "mountain", 
         Tag = "", 
      }, 
      [31822] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Directly In Front Of The Jawa Fortress", 
         Description = "You are standing directly in front of the Jawa Fortress. It seems rather\
large from this viewpoint but is limited to levels and interior space\
due to its design. there are some small designs on the fortress but\
they seem to not have been part of the original plans of the fortress\
but added in by certain individuals. \
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31821, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Key = -1, 
               DestinationVnum = 31823, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31822, 
         Sector = "mountain", 
         Tag = "", 
      }, 
      [31823] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Entrance To Jawa Fortress", 
         Description = "You are standing in a very large room. It was built plainly and simply\
and there are no signs of art even from their own culture in this\
room. There are some narrow corridors in many directions leading to\
different parts of the fortress.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Key = -1, 
               DestinationVnum = 31822, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31827, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31824, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31823, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31824] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "A Narrow Hallway", 
         Description = "You are walking down a small narrow hallway that is not very well\
lit. The few glowpanels that are left on the ceiling are either\
inoperative or malfunctioning. Further down the hallway, the hallway\
come to an abrupt stop and turn off. The ground you walk on is rough\
but the lack of sunlight keeps its moisture and color well. \
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31823, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31825, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31824, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31825] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Hallway", 
         Description = "You are standing on a colder harder surface than in the hot desert. It\
is like this because of the lack of sunlight in this enormous\
fortress. The glow panels above flicker as if running out of energy.\
Directly in front of you the hallway splits off with a sharp turn\
towards the south. \
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31824, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31829, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31825, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31827] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "A Large Room", 
         Description = "You walk along in a large room. The ground beneath your feet is rocky\
and yet sandy at the same time making your feet feel better for the\
ground is not as rough as straight rock. There is no lighting in this\
room but you can still make your way around. The air is cool and crisp\
making it a little easier to breathe. \
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31828, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31823, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31827, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31828] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "A room", 
         Description = "You are standing in room #31828.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31827, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31828, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31829] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Large Room", 
         Description = "You are standing in an enormous room. There are small bags, matresses\
and all sorts of small things all over the room layed about. There\
are a few Jawas young and old roaming these hallways. This here room\
is used for more of a storage place and not for eating.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31825, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31832, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31830, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31829, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31830] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Quarters", 
         Description = "Here, at night Jawas go to sleep. There are millions of tiny things\
from wires and circuits to translator droid in here. Considering the\
fact that Jawas sleep in this room it has a quite awful stench.\
Downwards there is a small opening leading to lower levels or\
something of an interesting nature. This room is very comfortable and\
safe with guard in pretty much all directions.\
 \
You may safely quit from here.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31829, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "down", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31831, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Direction = "somewhere", 
               Description = "", 
               Keyword = "bed", 
               Flags = 
               {
                  [17] = "CanEnter", 
                  [11] = "Hidden", 
               }, 
               Key = -1, 
               DestinationVnum = 31876, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31830, 
         Flags = 
         {
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31831] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Small Room", 
         Description = "You are standing in what seems to be an area where extra things and stolen\
goods are kept. In the corners there are baskets full of wires and old\
goods that are probably useless to the everyday person. There is a jawa\
guard half asleep here watching over the items. This room does not seem to\
have been dug out yet was put here by nature.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "up", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31830, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31831, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31832] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Entrance", 
         Description = "You are standing in a simple room. Designed and built with ease this room\
posed no problem to the people that built it. It is extremely dark in here and\
not much is visible to the plain eye. The ground is cold and stiff and makes\
your feet feel cold as you walk over it.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31833, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31829, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31832, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31833] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Intersection", 
         Description = "You are at an intersection. You may go either east or west and explore this\
vast place. In both directions the small corridors lighten up further down.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31832, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31839, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31834, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31833, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31834] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Hallway", 
         Description = "You are standing in a think gloomy hallway. Towards the south you can hear\
the sounds of discussion and occasional laughter. The ground is cool and soft\
for it is not dried by the everydays suns of Tatooine. The hallway is a gloomy\
place and makes you think twice before you do anything.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31833, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31835, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31834, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31835] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "End Of Hallway", 
         Description = "You reach the end of the small and tight gloomy hallway and see a few\
guardians discussing near a heavily guarded door leading into a large room\
with someone, or something, important inside of it.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31834, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31836, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31835, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31836] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Opening", 
         Description = "You are standing in the beginning of the large room filled with\
guardians. Just ahead they talk to each other silently trying not to\
disturb anyone. The ground is more of a sand color and is quite soft\
and hot. Upwards there is an oppening in the roof letting sunlight in\
and momentarily blinding you.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31837, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31835, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31836, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31837] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Entrance", 
         Description = "You stand before the heavily guarded entrance into the Wise Mans\
chambers. the two guardians stand up watching you closely so that you\
cause no harm to their master. The room has a large crack in the\
ceiling and it is rather hot in here. The way you see it staying in this\
fortress is not a bad idea. \
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [5] = "PickProof", 
                  [23] = "BashProof", 
               }, 
               Key = -1, 
               DestinationVnum = 31838, 
               Distance = 1, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31836, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31837, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31838] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Chambers", 
         Description = "You are standing in the chambers of the Wise Jawa of these parts. The\
walls are poorly decorated and any signs of extra materials does not\
exist. Maybe you should try to understand him before coming to any\
conclusions for he may able to help you, or to teach you something of\
use. \
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Key = -1, 
               DestinationVnum = 31837, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31838, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31839] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Hallway", 
         Description = "You are standing in a hallway leading to a stone wall. At the end of the hall\
the hallway itself curves toward the south leaving only two way to go, south\
and back from where you came.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31833, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31839, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31840] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Neighberhood Junk Pile", 
         Description = "You are standing on a large pile of junk. People throw things they dont need\
here just to get rid of it. But for some people this place is where they can\
get everything they need to start out. Everything from scrap metal to blasters\
are here waiting for anyone to pick them up.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31653, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31840, 
         Sector = "city", 
         Tag = "", 
      }, 
      [31841] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Entrance To Docking Bay 94", 
         Description = "You are standing in front of the infamous Dockingbay 94. From here Han Solo\
and the Millenium Falcon escaped with their newly acquired passengers for a\
trip to Alderaan. There is a large entrance into the docking bay. All the\
ground beneath you is made of stone and sand. The air is warm yet lighter\
here for it is sheltered by the docking bay.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31872, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31842, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31605, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31841, 
         Sector = "city", 
         Tag = "", 
      }, 
      [31842] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Inside The Entrance To Docking Bay 92", 
         Description = "You are standing in front of a large sliding door. When opened you can enter\
the docking bay with ease and embark on a ship to go to other places in the\
galaxy. The door is made of metal and has blaster scorching all over it from\
when the imperials chased Han Solo and Chewbacca in a race to capture the\
droid R2-D2 and return him to Darth Vader. The ground is hard and covered with\
sand as most of this planet is and the air is rather refreshing.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31841, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Key = -1, 
               DestinationVnum = 31843, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31842, 
         Sector = "city", 
         Tag = "", 
      }, 
      [31843] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Inside Docking Bay 92", 
         Description = "You are standing inside a large room that can contain a few smaller sized\
ships or one large ship like the Millenium Falcon. The ground here is covered\
with sand, but there are patches where you can see the stone floor beneath.\
The air in here is cool and refreshing and gives you a warm sensation. There\
are ships comming and leaving here continually and make it so that the air\
smells of fumes and exhaust.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Key = -1, 
               DestinationVnum = 31842, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31847, 
               Distance = 0, 
            }, 
         }, 
         Sector = "city", 
         Vnum = 31843, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31846] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Floating in a void", 
         Description = "", 
         Exits = 
         {
         }, 
         Sector = "city", 
         Vnum = 31846, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Tag = "", 
      }, 
      [31847] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Docking Bay 92", 
         Description = "All around you there is only one thing. A large room stands here waiting to\
be filled with crafts and vessels. The air is crisp and cool unlike\
outside in the sun, but smells of ships. On the walls there are blaster\
bolts. Extra tools lay on the ground for a mechanic that walks around\
here.   \
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31843, 
               Distance = 0, 
            }, 
         }, 
         Sector = "city", 
         Vnum = 31847, 
         Flags = 
         {
            [4] = "CanLand", 
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31849] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Hundo's Shop", 
         Description = "You are standing inside a small store. Here Hundo the owner will\
gladly sell you clothing or possibly custom make some for you if the\
price is right. There is a small workstation in the corner and a\
entry to a room near the back of the store. The store is pretty run\
down but serves it's purpose.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Key = -1, 
               DestinationVnum = 31850, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31819, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31849, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31850] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Back Of The Shop", 
         Description = "There are some small crates scattered along the floor. Most of them are empty\
but some seem to be filled with cloth and useless items. This room is very\
dirty and has a rather disturbing smell to it. The ground is smooth and cold\
being made of stone. The air is fresher in here than most parts of this city\
and it makes you want to stay here.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Key = -1, 
               DestinationVnum = 31849, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31850, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31851] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "In Front Of A Large Keeping Area", 
         Description = "You are standing in front of some large fences. Inside these fences are kept\
many rontos, the animal that Jawas ride to go to different areas. There is a\
rather tall Jawa at the gate entry with an ionization gun ready to shoot any\
thieves or trespassers.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31819, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Key = -1, 
               DestinationVnum = 31852, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31851, 
         Sector = "mountain", 
         Tag = "", 
      }, 
      [31852] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Ronto Keeping Area", 
         Description = "You are standing inside a large pen sourrounded by gates that are filled with\
rontos. These rontos have been trained to a certain degree so it is not\
likely that they will try to escape. The ground is rough and is filled with\
cracks for the weight of these beasts is quite surprising. The sun shines down\
all day long and makes it warm here but the rontos have adjusted to the\
temperature.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Key = -1, 
               DestinationVnum = 31851, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31852, 
         Sector = "mountain", 
         Tag = "", 
      }, 
      [31853] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Entrance To The Cantina", 
         Description = "You are standing in the entrance to the well known cantina. Here some of the\
filthiest and richest scum hang around. Watch your step. Mounted on the wall is\
a droid detector. For here in this cantina they do not serve their kind.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31655, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31854, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31853, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31854] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Interior Of The Cantina", 
         Description = "You are facing the bar slowly. With small booths all around filled with\
people talking. Wuher slowly pours drinks for his customers being careful not\
to get hurt. The floor is poorly covered and the walls filled with blaster\
marks and other such things from fights and encounters.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31853, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31855, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31856, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31854, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31855] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Large Open Way", 
         Description = "Most of this section is rather empty for it leads the entrance into the\
cantina. For the other part there is a few tables with some stools and chairs\
but for the most part they are empty as for people seem to have adopted a\
liking towards the booths.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31858, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31859, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31854, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31855, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31856] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "A Large Section Of The Cantina", 
         Description = "You stand in awe as many horrible characters walk around. Some you\
recognize and some you do not. There are small tables filled with\
people all along this large area of the Cantina. The air is full of\
smoke from hookas being used all along. There is some broke glass on\
the floor. As you walk over it it cracks and makes you shiver.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31854, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31861, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31857, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31856, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31857] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "A Small Booth", 
         Description = "You are standing inside a small booth. Here a table is mounted in the middle\
with all sorts of seats and chairs aligned around. The table is beat up with\
holes all over it, vandalized over and over. This booth has less lighting in\
it for the glow panel has shorted out and makes it relaxing with the change in\
temperature from the outdoors.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31856, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31857, 
         Flags = 
         {
            [10] = "Safe", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31858] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "A Large Double Booth", 
         Description = "There are two small booths attached together here making one large booth.\
This booth is a very well known booth for here Han Solo fried Greedo the\
bounty hunter. There is a large table in the middle of the booth. The seats\
are dirty and the table even more so. There is a hookah on the table but it\
seems to be stuck to it.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31855, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31858, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31859] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "A Section Of The Cantina", 
         Description = "This room is located on the far side of the cantina, beside one of the\
small corner booths towards the west. The floor is dirty, filled with blood in\
some places from a recent fight. The air is full of smoke as people walk\
around you, some smoking hookahs.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31855, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31860, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31859, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31860] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "A Very Small Booth", 
         Description = "This booth is one of very small size. There is a small table in the\
middle with 2 stools set down around it. The stools are in rather\
good shape but the table is in horrible condition. The ground is\
cracked and makes you feel you will fall through the floor. The air\
is dirty and heavy here and makes you want to leave.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31859, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31860, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31861] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Section Of The Cantina", 
         Description = "You are standing in an open area filled with tables. To the east the bar\
stands. Chairs all around filled with different people and different species.\
The chairs themselves are rather dirty and so most people stand. The smell\
here is not too bad but not a beautiful one neither.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31856, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "Counter", 
               Flags = 
               {
                  [0] = "IsDoor", 
                  [17] = "CanEnter", 
                  [18] = "CanLeave", 
                  [26] = "CanLook", 
                  [23] = "BashProof", 
               }, 
               Key = -1, 
               DestinationVnum = 31863, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31862, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31861, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31862] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "A Corner Booth", 
         Description = "You are standing in a rather large both in the furthest corner of the\
cantina. The table here is very used yet in good shape compared to the others.\
The chairs on the other hand are worn down to the nub. The air here is less\
filthy for many people whom do not want to be bothered by the smoke sit\
here.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31861, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31862, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31863] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Inside The Bar", 
         Description = "You are standing in front of Wuher, the man who serves drinks to people here.\
The beverage machine is very large and complex but seems to be efficient in\
the way it works. AS he sees you he gets angry. Maybe you should run.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "counter", 
               Flags = 
               {
                  [0] = "IsDoor", 
                  [5] = "PickProof", 
               }, 
               Key = -1, 
               DestinationVnum = 31861, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "up", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31618, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31863, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31870] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Inside A Large Cave", 
         Description = "You are inside a large cave. It has two parts to it. It is rather dark\
making the air cool. The cave protects you from the sand being\
blown by the winds. Inside this cave many womp rats seek shelter for\
the only other places are inside the city of Mos Eisley where they\
will most likely be prosecuted. The ground is hard and has little to\
no sand on it. This place is sure a break to the outdoors.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31818, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31871, 
               Distance = 0, 
            }, 
         }, 
         Sector = "city", 
         Vnum = 31870, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31871] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "In The Back Of A Cave", 
         Description = "You are in the back portion of a large cave planted into the side of\
the cliff. The air here is very cool and relaxing giving you the\
sensation of being relaxed. The ground is hard and made entirely of\
rock, without a trace of sand this cave is rather clean besides the\
womp rat mess. There is a particular smell in here from the mess but\
nothing to be concerned about if you do not stay in this cave for an\
extended period of time.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31870, 
               Distance = 0, 
            }, 
         }, 
         Sector = "city", 
         Vnum = 31871, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31872] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "The Bus Stop", 
         Description = "You are standing on a platform where the public busses land every so\
often. You can access different planets using these busses. Although\
the busses are slow they are a means of transportation. The only\
reason they are slow is because they are provided to the public for\
free. Thinking about this it makes it hard to maintain the busses\
without enough resources.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31841, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31872, 
         Sector = "city", 
         Tag = "", 
      }, 
      [31873] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Walking Through The City", 
         Description = "You walk along a path inside the well known city of Mos Eisley. The\
ground here is hard yet made fully of sand. As you walk over it, it is\
hot and sharp. The wind blows in your face, sometimes bringing\
particles of sand into your face stinging you and sometimes getting\
into your eyes. The air is very warm, heated by the twin suns of the\
planet. The heat makes the air heavier and harder to breath yet you\
move on. Ahead you can see a corner that curves into a store of some\
kind. On the front it says \"Spaceport Speeders\".\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31875, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31881, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31882, 
               Distance = 0, 
            }, 
            [4] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31655, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31873, 
         Sector = "city", 
         Tag = "", 
      }, 
      [31874] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Walking Down A Side Street", 
         Description = "You are walking down an unused side street. The street is mostly shady\
because the buildings to the sides cover the sunlight from the\
street. The ground is softer and less dense and compact, but when the\
wind blows it hurts more for the grains of sand hit you in larger\
numbers making you ache all over. The air is hot, not as hot as the\
rest of the city because the street is covered in shade, but it is\
still hot. The air is also lighter and makes you relax as you walk.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31655, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31874, 
         Sector = "city", 
         Tag = "", 
      }, 
      [31875] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Inside The Spaceport Speeders", 
         Description = "You are standing just inside the entrance to the spaceport speeders.\
Here you can help yourself by buying or getting a droid fixed. The\
people that work here are experienced and can offer you what is\
considered to be good prices for this planet. The atmosphere inside\
here is a bit rough with some edgy people hanging around but its not\
the end of the world. The store itself is pretty dirty with only the\
front room for helping out the customers. The intensity of the heat\
is not covered here as the air recycling system is not working to\
well.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31873, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31875, 
         Sector = "city", 
         Tag = "", 
      }, 
      [31876] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "On A Bed", 
         Description = "Here in this bed hot steam rises from the cushions making your tense\
muscles relax. As they heat your body you start to feel better. The\
atmosphere is very moisturized with a lot of heat surrounding you\
also. The bed is made of a comfortable looking material but has been\
chewed at by small rodents making the bed kind of ugly looking. \
", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               ScriptType = "MProg", 
               Arguments = "100", 
               Code = "feel cure $n\
emote Vapors slowly seep into your body helping you relax.\
", 
            }, 
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "somewhere", 
               Description = "", 
               Keyword = "", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [11] = "Hidden", 
               }, 
               Key = -1, 
               DestinationVnum = 31830, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31876, 
         Sector = "city", 
         Tag = "", 
      }, 
      [31878] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Along The Bottom Of The Cliff", 
         Description = "You are walking along the bottom of the cliff. High above you see the edge\
of the cliff and you think about how much it would hurt to fall from\
there. The sand here is much harder than normal as for the wind does not\
get at it very well because the cliff covers the sand from being swept\
away by the gusting winds. The sun is also not so intense here but it is\
still very warm and just as dry as the rest of the planet.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31601, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31879, 
               Distance = 0, 
            }, 
         }, 
         Sector = "desert", 
         Vnum = 31878, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Tag = "", 
      }, 
      [31879] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Nearing The Curve In The Cliff", 
         Description = "You are walking along the bottom of the cliff. High above you see the edge\
of the cliff and you think about how much it would hurt to fall from\
there. The sand here is much harder than normal as for the wind does not\
get at it very well because the cliff covers the sand from being swept\
away by the gusting winds. The sun is also not so intense here but it is\
still very warm and just as dry as the rest of the planet.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31878, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31880, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31879, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31880] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "On The Curve Of The Cliff", 
         Description = "You are walking along the bottom of the cliff. High above you see the edge\
of the cliff and you think about how much it would hurt to fall from\
there. As you think of that you notice some blood splatter on the sand.\
Then you look up to see a large chunk of the cliff missing as if someone\
had fell from there taking a large portion of the side of the cliff with\
them. \
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31879, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31880, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31881] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "On A Path In The City", 
         Description = "You walk along a path inside the well known city of Mos Eisley. The ground\
here is hard yet made fully of sand. As you walk over it, it is hot and\
sharp. The wind blows in your face, sometimes bringing particles of sand\
into your face stinging you and sometimes getting into your eyes. The air\
is very warm, heated by the twin suns of the planet. The heat makes the\
air heavier and harder to breath yet you move on. To the north you can see\
a scattering of buildings.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 6600, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31873, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31881, 
         Sector = "city", 
         Tag = "", 
      }, 
      [31882] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "In The Depths Of The City", 
         Description = "You walk along a path inside the well known city of Mos Eisley. The ground\
here is hard yet made fully of sand. As you walk over it it is hot and sharp.\
The wind blows in your face, sometimes bringing particles of sand into your\
face stinging you and sometimes getting into your eyes. The air is very warm,\
heated by the twin suns of the planet. The heat makes the air heavier and\
harder to breath yet you move on. To the west you see smoke coming from\
freshly cooked meat and food. \
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31873, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31883, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31624, 
               Distance = 1, 
            }, 
         }, 
         Vnum = 31882, 
         Sector = "city", 
         Tag = "", 
      }, 
      [31883] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Gep's Grill", 
         Description = "You are standing in front of an old man. Here he makes his own food to sell\
to people passing by. He has a large selection, everything from\
banthaburgers to dewback ribs depending on how carnivorous your appetite\
is. His booth is made of old junk probably scavenged or bought from the\
Jawas. His cooking supplies are rather disgusting to look at and when you\
think of what you are eating from it makes your stomach churn.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31882, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31883, 
         Sector = "city", 
         Tag = "", 
      }, 
      [31898] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "northeast", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 106, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31898, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31899] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "A Hidden Passage In The Sewers", 
         Description = "This passage looks somewhat cleaner than the reset of the sewer, suggesting\
that someone maintains it. There's no sewage flowing here, rather the ground\
is quite dry.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31904, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31900, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31899, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31900] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Common Room", 
         Description = "This circular area seems to be a simple common room, complete with cheap\
furniture and some faded posters on the walls.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31899, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31901, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31902, 
               Distance = 0, 
            }, 
            [4] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31909, 
               Distance = 1, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31900, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31901] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Kitchen", 
         Description = "The kitchen bench is full of unwashed plates, glasses and cutlery. Above the\
bench are a few cupboards. Despite the mess on the bench, the place smells\
clean.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31900, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31901, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31902] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Hallway", 
         Description = "The hallway has light gray walls with some lamps hanging on them. Doors\
lead to other rooms in the small complex.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31900, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31903, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31905, 
               Distance = 0, 
            }, 
            [4] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31906, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31902, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31903] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Sleeping Quarters", 
         Description = "There are a few cheap beds scattered around this dimly lit room. Otherwise\
it's quite empty.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31902, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31903, 
         Flags = 
         {
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31904] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "A Tunnel In The Sewers", 
         Description = "There is a river of sewage flowing at a slow, steady pace. There's a rusty\
catwalk about a meter above it, running along one wall. Old grime is covering\
the walls. There's a nasty smell in the air, making it uncomfortable to\
breath, even for a Gamorrean.\
", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "entry_prog", 
               ScriptType = "Imp", 
               Arguments = "100", 
               Code = "def on_enter(room, actor):\
    if isjedi(actor) and level(actor) < 25:\
        echo(actor, \"You sense that the south wall is a hologram.\")\
", 
            }, 
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31907, 
               Distance = 1, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Flags = 
               {
                  [11] = "Hidden", 
               }, 
               Key = -1, 
               DestinationVnum = 31899, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Direction = "southwest", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31505, 
               Distance = 1, 
            }, 
         }, 
         Vnum = 31904, 
         Sector = "underground", 
         Tag = "", 
      }, 
      [31905] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Zim's Meditation Chamber", 
         Description = "In theory this is where Zim would meditate and attune himself to the Force.\
But in reality it's where he drinks all day, feeling sorry for himself.\
There's a smell of alcohol in the air.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31902, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31905, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31906] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Workshop", 
         Description = "This rooms contains all facilities you need to craft just about anything.\
It's very cluttered. A few broken items that someone failed to assemble\
correctly have been tossed into a corner.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31902, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31906, 
         Flags = 
         {
            [16] = "Silence", 
            [26] = "Factory", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31907] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Mos Eisley Sewers", 
         Description = "This is the main entrance to the sewers. There is a river of sewage flowing\
through the tunnel, giving off a strong smell. Along one wall is a catwalk\
allowing one to walk through the sewers.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31908, 
               Distance = 1, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31904, 
               Distance = 1, 
            }, 
            [3] = 
            {
               Direction = "up", 
               Description = "", 
               Keyword = "", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Key = -1, 
               DestinationVnum = 31654, 
               Distance = 1, 
            }, 
         }, 
         Vnum = 31907, 
         Sector = "underground", 
         Tag = "", 
      }, 
      [31908] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "A Tunnel In The Sewers", 
         Description = "#31904\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31502, 
               Distance = 1, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31907, 
               Distance = 1, 
            }, 
         }, 
         Vnum = 31908, 
         Sector = "underground", 
         Tag = "", 
      }, 
      [31909] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Sparring Area", 
         Description = "The sparring area is a square room about 10x10 meters. Most of the floor is\
covered by a gray mat so that people won't land too hard when they fall.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31900, 
               Distance = 1, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31909, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31997] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Economy Class Section", 
         Description = "This section is smelly and dirty. It's probably not cleaned very often.\
The noise from the engines at the back of the shuttle contributes to making\
it an uncomfortable trip.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31999, 
               Distance = 1, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31997, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31998] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Business Class Section", 
         Description = "This section of the shuttle is clean, quiet and comfortable. In other words\
it's the opposite of what you usually meet on this planet.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Flags = 
               {
                  [1] = "Closed", 
               }, 
               Key = -1, 
               DestinationVnum = 31999, 
               Distance = 1, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31998, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31999] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Tatooine Planetary Shuttle Entrance", 
         Description = "The Tatooine Planetary Shuttle travels between major settlements on this\
backwater planet. The entrance area leads to the business class section in one\
direction, and the economy class section in the other. The business class\
section is behind a curtain so that the wealthier passengers won't have to\
look at the seedier elements in the back.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "curtain", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Key = -1, 
               DestinationVnum = 31998, 
               Distance = 1, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31997, 
               Distance = 1, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31999, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31500] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "The dunes around you are normal as you walk over the endless amount of sand.\
The sea of rippling sand still surrounds you with overwhelming greatness. The\
sand has a reflective shine to it assisted by the sunrays of the heating suns.\
You feel enclosed because the dunes tower over you greatly.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31501, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31557, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31500, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31501] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You are walking along the soft sand in the desert of Tatooine. Just ahead of\
you you can see the dune sea developping. Behind you the small city diminishes\
into only a spot. With every step you take the city becomes smaller and\
smaller.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31507, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31500, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31807, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31501, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31502] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Tunnel Junction", 
         Description = "A junction breaks up the monotony of these tunnels. The river of sewage runs\
south, but to the north there seems to be a dry area.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31503, 
               Distance = 1, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31504, 
               Distance = 1, 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31908, 
               Distance = 1, 
            }, 
         }, 
         Vnum = 31502, 
         Sector = "underground", 
         Tag = "", 
      }, 
      [31503] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Pumping Station", 
         Description = "This room is about 20x20 meters, and several meters high. It smells as bad\
as the rest of the sewers. In the middle of the room is a large piece of\
machinery enclosed in an old-fashioned wire fence.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
               }, 
               Key = -1, 
               DestinationVnum = 31623, 
               Distance = 1, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31502, 
               Distance = 1, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31503, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31504] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Endless Tunnels In The Sewers", 
         Description = "#31904\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31502, 
               Distance = 1, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31621, 
               Distance = 1, 
            }, 
         }, 
         Vnum = 31504, 
         Sector = "underground", 
         Tag = "", 
      }, 
      [31505] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "A Deep Pool Of Sewage", 
         Description = "The tunnel widens into a room filled with sewage that gathers into a large\
pool. Just like the rest of the sewers, there's a rusty catwalk running along\
one wall where it's possible to walk through the area.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31506, 
               Distance = 1, 
            }, 
            [2] = 
            {
               Direction = "northeast", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31904, 
               Distance = 1, 
            }, 
         }, 
         Vnum = 31505, 
         Sector = "underground", 
         Tag = "", 
      }, 
      [31506] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "A Tunnel In The Sewers", 
         Description = "#31904\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31505, 
               Distance = 1, 
            }, 
            [2] = 
            {
               Direction = "southeast", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31591, 
               Distance = 1, 
            }, 
         }, 
         Vnum = 31506, 
         Sector = "underground", 
         Tag = "", 
      }, 
      [31507] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You are standing on a hard sandy surface, there is nothing around you unless\
you turn back. In all directions you can see but sand. The dunes in the sea\
are enourmous and grow with every step that you take.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31509, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31508, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31501, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31507, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31508] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "All around you is sand and shiny dunes piling as high as you can see. As far\
as you can guess anything could be behind there. The towering sand dunes make\
you feel scared as you are so small and enclosed by the towering heaps of sand.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31555, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31507, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31508, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31509] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You are surrounded by sand from all possible directions. You can still see a\
glimpse of the city behind you but once you leave the city the land is yours\
to explore.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31510, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31507, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31509, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31510] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "Around you there is only sand as far as you can see. The direction is not\
noticable and civilization is far away. If you wander too far be careful\
of where you end up.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31511, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31513, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31509, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31510, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31511] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "The sand is soft and is still all around you. It is high and shinning in your\
face as you repeatidly walk over endless amounts of sand. You feel enclosed\
because of their great mass. As you walk forward, with every step you take the\
sand dunes grow in size and proportion.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31512, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31510, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31511, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31512] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "The sand is soft and is still all around you. It is high and shinning in your\
face as you repeatidly walk over endless amounts of sand. You feel enclosed\
because of their great mass. As you walk forward, with every step you take\
the sand dunes grow in size and proportion.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31511, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31512, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31513] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "The sand is soft and is still all around you. The sun is high and shining in\
your face as you repeatedly walk over endless amounts of sand. You feel\
enclosed because of their great mass. As you walk forward, with every step you\
take the sand dunes grow in size and proportion.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31514, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31510, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31513, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31514] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "The sand is soft and is still all around you. It is high and shining in your\
face as you repeatidly walk over endless amounts of sand. You feel enclosed\
because of their great mass. As you walk forward, with every step you take\
the sand dunes grow in size and proportion.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31513, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31515, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31514, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31515] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "All around you is sand and shiny dunes piling as high as you can see. As far\
as you can guess anything could be behind there. The towering sand dunes make\
you feel scared as you are so small and enclosed by the towering heaps of sand.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31514, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31516, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31515, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31516] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You are on the top of a sand dune and you can see across the whole dune sea.\
It is just a great sight to see. The sand dunes dip in and out of the ground.\
The immense amount of sand frightens you as you look across the great sand\
dune sea of Tatooine.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31515, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31517, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31516, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31517] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You are heading down the side of a sand a dune entering another valley of\
dunes. With every step you take the sand seems to be increasing.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31516, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31518, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31517, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31518] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You are on the top of a sand dune and you can see across the whole dune sea.\
It is just a great sight to see. The sand dunes dip in and out of the ground.\
The immense amount of sand frightens you as you look across the great sand\
dune sea of Tatooine.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31519, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31517, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31522, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31518, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31519] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "The sand is soft and is still all around you. It is high and shining in your\
face as you repeatedly walk over endless amounts of sand. You feel enclosed\
because of their great mass. As you walk forward, with every step you take the\
sand dunes grow in size and proportion.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31520, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31518, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31519, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31520] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You are on the top of a sand dune and you can see across the whole dune sea.\
It is just a great sight to see. The sand dunes dip in and out of the ground.\
The immense amount of sand frightens you as you look across the great sand dune\
sea of Tatooine.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31521, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31519, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31520, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31521] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You are on the top of a sand dune and you can see across the whole dune sea.\
It is just a great sight to see. The sand dunes dip in and out of the ground.\
The immense amount of sand frightens you as you look across the great sand\
dune sea of Tatooine.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31520, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31521, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31522] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "The sand is soft and is still all around you. It is high and shining in your\
face as you repeatedly walk over endless amounts of sand. You feel enclosed\
because of their great mass. As you walk forward, with every step you take the\
sand dunes grow in size and proportion.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31518, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31523, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31524, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31522, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31523] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "The dunes around you are normal as you walk over the endless amount of dunes.\
The sea of dunes still surrounds you with overwhelming greatness. The sand has\
a reflective shine to it assisted by the sunrays of the heating suns.  You feel\
enclosed because the dunes tower over you greatly.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31522, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31646, 
               Distance = 1, 
            }, 
         }, 
         Vnum = 31523, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31524] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "All around you is sand and you are The dunes around you are normal as you walk\
over the endless amount of dunes. The sea of dunes still surrounds you with\
overwhelming greatness. The sand has a reflective shine to it assisted by the\
sunrays of the heating suns. You feel enclosed because the dunes tower over\
you greatly.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31525, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31522, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31524, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31525] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "The dunes around you are normal as you walk over the endless amount of dunes.\
The sea of dunes still surrounds you with overwhelming greatness. The sand has\
a reflective shine to it assisted by the sunrays of the heating suns. You feel\
enclosed because the dunes tower over you greatly.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31526, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31524, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31525, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31526] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "All around you is sand and shiny dunes piling as high as you can see. As far\
as you can guess anything could be behind there. The towering sand dunes make\
you feel scared as you are so small and enclosed by the towering heaps of sand.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31527, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31525, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31526, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31527] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "All around you is sand and shiny dunes piling as high as you can see. As far\
as you can guess anything could be behind there. The towering sand dunes make\
you feel scared as you are so small and enclosed by the towering heaps of sand.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31528, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31536, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31526, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31527, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31528] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You start walking over the tip of a dune an can see something in the far sea\
of dunes. All around you is sand and shiny dunes piling as high as you can\
see. As far as you can guess anything could be behind there. The towering sand\
dunes make you feel scared as you are so small and enclosed by the towering\
heaps of sand.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31529, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31527, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31530, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31528, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31529] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "The dunes around you are normal as you walk over the endless amount of dunes.\
The sea of dunes still surrounds you with overwhelming greatness. The sand has\
a reflective shine to it assisted by the sunrays of the heating suns. You feel\
enclosed because the dunes tower over you greatly.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31528, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31531, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31529, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31530] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "All around you is sand and shiny dunes piling as high as you can see. As far\
as you can guess anything could be behind there. The towering sand dunes make\
you feel scared as you are so small and enclosed by the towering heaps of sand.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31528, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31537, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31530, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31531] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "All around you is sand and shiny dunes piling as high as you can see. As far\
as you can guess anything could be behind there. The towering sand dunes make\
you feel scared as you are so small and enclosed by the towering heaps of sand.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31529, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31532, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31531, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31532] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Opening", 
         Description = "The sand is soft and is still all around you. It is high and shinning in your\
face as you repeatidly walk over endless amounts of sand. You feel enclosed\
because of their great mass. As you walk forward, with every step you take the\
sand dunes grow in size and proportion.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31531, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31533, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31532, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31533] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Opening", 
         Description = "You are traveling along the side of the large opening and can see something in\
the center of the opening.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31534, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31532, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31533, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31534] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Opening", 
         Description = "You are standing infront of a very large opening in the ground that seems to\
have endless turns inside itself. To explore this hold continue to the west.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31533, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31535, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31534, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31535] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Sarlacc", 
         Description = "This is a D.T(To be edited)\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31534, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31535, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31536] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You are in the middle of the sea of dunes and are hopelessly lost.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31527, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31536, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31537] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You can now perceive that the object that you are walking towars is a metallic\
form of some sort.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31530, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31538, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31537, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31538] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You are very close to the object and you can now identify it in the sand. It\
is a very old shipwreck plowed into the top of a dune.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31539, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31537, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31538, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31539] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You are infront of the shipwreck and it seems to be habitible. To explore it\
continue north up the hatch.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31540, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31538, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31552, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31539, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31540] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Hatch Of Derelict Ship", 
         Description = "You are inside the hatch of a ship which seems very new and cared for.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31547, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31542, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31539, 
               Distance = 0, 
            }, 
            [4] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Key = -1, 
               DestinationVnum = 31541, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31540, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Tag = "TatooineDerelictShip", 
      }, 
      [31541] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Cargo Hold", 
         Description = "You are standing infront of an immense cargo room containing many\
crates of items.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Key = -1, 
               DestinationVnum = 31540, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31541, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31542] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Tunnel", 
         Description = "You are in a small room with lots of wiring and you can see the maintenance\
tunnel in front of you.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Key = -1, 
               DestinationVnum = 31543, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31540, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31542, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31543] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Mainentance Tunnel", 
         Description = "You are inside the maintenance tunnel. It is a very small space so you must\
crawl inside the tunnel to move.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31544, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Key = -1, 
               DestinationVnum = 31542, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31543, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31544] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Tunnel", 
         Description = "You are crawling through the tunnel and can see an opening to the west.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31543, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31545, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31544, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31545] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Secret Compartment", 
         Description = "You enter a small compartment room filled with electronic equipment. It seems\
to be an interrogation room of some sort. You can see computers mounted the\
wall.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31546, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31544, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31545, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31546] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Death", 
         Description = "You are in a room containing nothing but an assault droid in the corner.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31545, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31546, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31547] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Corridor", 
         Description = "You are walking down a corridor and can see a ladder at the end of the hall.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31540, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "up", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31548, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31547, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31548] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Ladder", 
         Description = "You are heading up a ladder headed towards the top portion of the ship.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31550, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31551, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31549, 
               Distance = 0, 
            }, 
            [4] = 
            {
               Direction = "down", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31547, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31548, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31549] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Passenger Compartment", 
         Description = "You enter a passenger compartment that seems to have been inhabitated.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31548, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31549, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31550] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Pilot Compartment", 
         Description = "You are in the pilot compartment and you look out the viewer console to see\
sand covering it. The computer equipment seems to be usable and undamaged.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31548, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31550, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31551] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Room", 
         Description = "This room contains nothing in it besides a viewer console and\
seems very strange.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31548, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31551, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31552] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You walk around the immense shuttle to the top of a dune and continue exploring\
the dune sea of Tatooine. It tower around you fromm all directions.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31539, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31553, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31552, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31553] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "The shuttle starts to get smaller and you can see only sand in front of you.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31554, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31552, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31553, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31554] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert ", 
         Description = "You walk slowly and exhausted to find nothing here.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31553, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31554, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31555] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "All around you is sand and shiny dunes piling as high as you can see. As far\
as you can guess anything could be behind there. The towering sand dunes make\
you feel scared as you are so small and enclosed by the towering heaps of sand.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31508, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31556, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31555, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31556] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "All around you is sand and shiny dunes piling as high as you can see. As far\
as you can guess anything could be behind there. The towering sand dunes make\
you feel scared as you are so small and enclosed by the towering heaps of sand.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31555, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31556, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31557] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "All around you is sand and shiny dunes piling as high as you can see.\
As far as you can guess anything could be behind there. The towering\
sand dunes make you  eel scared as you are so small and enclosed by\
the towering heaps of sand.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31500, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31558, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31592, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31557, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31558] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You are on the top of a sand dune and you can see across the whole dune sea.\
It is just a great sight to see. The sand dunes dip in and out of the ground.\
The immense amount of sand frightens you as you look across the great sand\
dune sea of Tatooine.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31559, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31557, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31558, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31559] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "The sand is soft and is still all around you. It is high and shinning in your\
face as you repeatedly walk over endless amounts of sand. You feel enclosed\
because of their great mass. As you walk forward, with every step you take the\
sand dunes grow in size and proportion.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31560, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31565, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31558, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31559, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31560] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "The dunes you are walking on are reaching a few feet high now and you are\
approaching the greater dunes at a rather fast pace.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31561, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31559, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31560, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31561] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You are on a large dune right now and you can see dunes for a long way.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31560, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31562, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31564, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31561, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31562] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You are heading into the sea of dunes. Be careful where you go or you might not come back.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31563, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31561, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31562, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31563] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "The dunes under you appear to be growing with every step that you take.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31569, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31562, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31563, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31564] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You are on a large dune heading further and further away from the grasp of\
civilization.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31561, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31571, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31564, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31565] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You are walking on the rippling surface of the sand which has been\
exposed to extreme heat over the many years. The sand is very warm and\
stings your face as the wind blows it up onto your soft skin. The air\
is thick and very heavy to breathe, but living with it is something you\
accepted when you entered the desert.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31559, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31566, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31565, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31566] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "The hard sand beneath your feet is hot and you can only see the same things\
for miles to come. You are walking on the rippling surface of the sand\
which has been exposed to extreme heat over the many years. The sand is\
very warm and stings your face as the wind blows it up onto your soft\
skin. The air is thick and very heavy to breathe, but living with it\
something you accepted when you entered the desert. \
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31565, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31567, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31566, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31567] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "The sand is hard and hot but you continue to explore this vast area.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31566, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31568, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31567, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31568] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "The hard sand is getting softer as you walk endlessly.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31567, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31568, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31569] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You are walking up and down endless amounts of sound shaped into great dunes\
trying to find something in this vast sea.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31563, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31570, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31569, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31570] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "The sand dunes seem to get bigger and higher but it only seems this way from\
exhaustion.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31569, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 3301, 
               Distance = 1, 
            }, 
         }, 
         Sector = "desert", 
         Vnum = 31570, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Tag = "", 
      }, 
      [31571] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "The pummeling dunes are passing under your feet at an alarming rate. Yet there\
is nothing else in sight but sand.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31564, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31572, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31571, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31572] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You walk down to the base of one of the largest dunes you have climbed in your\
trip through the great sea of Tatooine.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31571, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31573, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31572, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31573] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You turn at the bottom of a dune and start climbing a rather small one.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31574, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31572, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31573, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31574] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "The dune you just climbed was a rather small one but when you look down off of\
the dune you realize you are heading down into a valley.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31575, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31577, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31573, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31574, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31575] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You walk through the valley of sand dunes slowly. The harsh conditions are\
slowing you down gradually over the course of many minutes, hours or even days\
depending on how long you last before you find civilization.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31576, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31574, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31575, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31576] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "The sand dunes around you are making you nautious on what is still left\
to climb over.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31575, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31576, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31577] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You are walking and walking through the treacherous sea of never ending sand.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31574, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31578, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31577, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31578] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You look on but can only see endless amounts of sand but nothing else.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31577, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31582, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31579, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31578, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31579] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "The great sea starts becoming a blur after looking at the bare sands\
for many long hours now.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31578, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31580, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31579, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31580] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "The sea of dunes is making a great impression on what you think of Tatooine.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31579, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31581, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31580, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31581] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You are coming up to a rise of harder sand than all around. The flat\
continues to the west.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31580, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31590, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31581, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31582] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "The sand is plunging downwards and all of the sea seems to be heading to\
a point of falling.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31583, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31578, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31582, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31583] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You are standing on the last dune before the entry point and can see what\
is developed inside.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31584, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31582, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31583, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31584] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Edge Of The Jundland Wastes", 
         Description = "You are heading down a slope towards a rocky assortment of caves once lived\
in by the native race of this planet. The Jundland Wastes are very large and\
you can see many things from here.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31585, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31583, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31584, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31585] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Jundland Wastes", 
         Description = "You can see immense caves all around you and feel enclosed by the high walls\
of the caves.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31584, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31586, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31585, 
         Sector = "mountain", 
         Tag = "", 
      }, 
      [31586] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Jundland Wastes", 
         Description = "You are walking down a rocky path that passes many old caves. To the south you\
see a cave that is still in pretty good condition. All around there is a\
distinct odour.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31738, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31589, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31587, 
               Distance = 0, 
            }, 
            [4] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31585, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31586, 
         Sector = "mountain", 
         Tag = "", 
      }, 
      [31587] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Cave", 
         Description = "You are inside a dark cave which has a strong odour of some sort. The cave\
continues to the south.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31586, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31588, 
               Distance = 0, 
            }, 
         }, 
         Sector = "mountain", 
         Vnum = 31587, 
         Flags = 
         {
            [0] = "Dark", 
         }, 
         Tag = "", 
      }, 
      [31588] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Cave", 
         Description = "You are in the back of a cave which seems to have been used as a living\
habitat. On the floor in the corner you are appaled when seing three dead\
Jawas. There are some blaster scars on the walls and big gashes everywhere.\
Only one thing could have done this... Sand people.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31587, 
               Distance = 0, 
            }, 
         }, 
         Sector = "mountain", 
         Vnum = 31588, 
         Flags = 
         {
            [0] = "Dark", 
         }, 
         Tag = "", 
      }, 
      [31589] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Dry Area", 
         Description = "You see many things in the rocks around you but the camp seems lifless in many\
ways. The ground is hard and dry for with the twin suns no moisture can be\
kept in the ground.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31805, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31742, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31586, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31589, 
         Sector = "mountain", 
         Tag = "", 
      }, 
      [31590] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Teeth", 
         Description = "D.T(to be edited)\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31581, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31590, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31591] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "A Junction In The Sewer Tunnels", 
         Description = "The river of sewage flows into the area from the east and and northwest, and\
disappears off south.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31620, 
               Distance = 1, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31619, 
               Distance = 1, 
            }, 
            [3] = 
            {
               Direction = "northwest", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31506, 
               Distance = 1, 
            }, 
         }, 
         Vnum = 31591, 
         Sector = "underground", 
         Tag = "", 
      }, 
      [31592] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You are walking along a hardened sand path which seems to be headed to a\
cliff. The towering sand dunes make you feel scared as you are so small\
and enclosed by the towering heaps of sand. The sun is too warm and is\
getting to you as you tread towards what is to be seen.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31557, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31593, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31592, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31593] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You are coming to the end of the path as far as you can see. The cliff is\
right ahead of you. The sand blows slowly into your face stinging your\
eyes and the rest of your face. The sun pounds down onto your back making\
you feel twice as heavy as usual. At some points down this way it gets\
steep and you slip a little landing right on your behind.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31592, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31594, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31593, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31594] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "The Cliff", 
         Description = "You are standing on the edge of a cliff. It overlooks the great city of Mos\
Eisley. It is a great sight. To the east you see the path curve down the\
side of the cliff. The sand blows slowly into your face stinging your eyes\
and the rest of your face. The sun pounds down onto your back making you\
feel twice as heavy as usual. As you walk slowly down the side of the\
cliff the sand gets sharper and if you are not wearing foot gear it could\
get painful.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31593, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31595, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31597, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31594, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31595] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "Still walking along the cliff you start curving down the side of a\
mountain. You are walking down a hard sand path filled with sharp\
minerals that hurt your feet as you walk over the sand. The heat is\
driving against your back as the twin suns start burning your skin, the\
air is hot and heavy lacking moisture. As the sand blows slowly against\
your face you wish you had something to protect it as shards or sand start\
stinging against your face.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31596, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31594, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31595, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31596] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert End", 
         Description = "You Curve down the bottom of the path and approach the entry to the city. \
You are walking down a hard sand path filled with sharp minerals that hurt\
your feet as you walk over the sand. The heat is driving against your back\
as the twin suns start burning your skin, the air is hot and heavy lacking\
moisture. As the sand blows slowly against your face you wish you had\
something to protect it as shards or sand start stinging against your\
face.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31601, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31595, 
               Distance = 0, 
            }, 
         }, 
         Sector = "desert", 
         Vnum = 31596, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Tag = "", 
      }, 
      [31597] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Cliff", 
         Description = "You are walking along the edge of the cliff. Be careful where you go. The\
sand blows slowly into your face, stinging your eyes and the rest of your\
face. The sand flies into your eyes like annoying bugs stinging your eyes\
until the point where you are going to cry. The sun pounds down onto your\
back making you feel twice as heavy as usual.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31600, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31594, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31598, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31597, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31598] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Cliff", 
         Description = "You are very near the edge and should return. Be careful. As you walk down\
the edge of the cliff you see chunks of sand falling down the side of the\
cliff. Seconds later you hear the thumping of the sand hitting the ground\
far below. The sand blows slowly into your face stinging your eyes and the\
rest of your face. To the south the sand looks very unstable. It would be\
advisable not to go there.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31667, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31597, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31599, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31598, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31599] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Cliffside", 
         Description = "Aaah, you are loosing your grip! Looking down would not be a good idea as for\
you're about to fall!\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31598, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "down", 
               Description = "", 
               Keyword = "", 
               Flags = 
               {
                  [11] = "Hidden", 
               }, 
               Key = -1, 
               DestinationVnum = 31880, 
               Distance = 0, 
            }, 
         }, 
         Sector = "desert", 
         Vnum = 31599, 
         Flags = 
         {
            [24] = "NoFloor", 
         }, 
         Tag = "", 
      }, 
      [31600] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You are walking along the flat sands of Tatooine.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31658, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31597, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31600, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31601] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Edge Of Mos Eisley", 
         Description = "You walk into the city, it is a large places with many uses. The thugs of\
the galaxy hang around this town. You are walking down a hard sand path\
filled with sharp minerals that hurt your feet as you walk over the sand.\
The heat is driving against your back as the twin suns start burning your\
skin, the air is hot and heavy lacking moisture. As the sand blows slowly\
against your face you wish you had something to protect it as shards or\
sand start stinging against your face.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31596, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31602, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31878, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31601, 
         Sector = "city", 
         Tag = "", 
      }, 
      [31602] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "City", 
         Description = "You are walking towards the inner town of Mos Eisley and towards the\
spaceport. The market is also in the vicinity of the inner city. You are\
walking down a hard sand path filled with sharp minerals that hurt your\
feet as you walk over the sand. The heat is driving against your back as\
the twin suns start burning your skin, the air is hot and heavy lacking\
moisture. As the sand blows slowly against your face you wish you had\
something to protect it as shards or sand start stinging against your\
face.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31601, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31628, 
               Distance = 1, 
            }, 
            [3] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31603, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31602, 
         Sector = "city", 
         Tag = "", 
      }, 
      [31603] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "City", 
         Description = "You are approaching an intersection which will bring you to different parts\
of the city. You are walking down a hard sand path filled with sharp\
minerals that hurt your feet as you walk over the sand. The heat is\
driving against your back as the twin suns start burning your skin, the\
air is hot and heavy lacking moisture. As the sand blows slowly against\
your face you wish you had something to protect it as shards or sand start\
stinging against your face.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31602, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31604, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31603, 
         Sector = "city", 
         Tag = "", 
      }, 
      [31604] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "In Front Of Mos Eisley Spaceport", 
         Description = "You are walking down the path heading directly to the Spaceport. You are\
walking through the large, scum filled city of Mos Eisley. You are\
walking down a hard sand path filled with sharp minerals that hurt your\
feet as you walk over the sand. The heat is driving against your back as\
the twin suns start burning your skin, the air is hot and heavy lacking\
moisture. As the sand blows slowly against your face you wish you had\
something to protect it as shards or sand start stinging against your\
face.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31603, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31653, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31605, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31604, 
         Sector = "city", 
         Tag = "PlayerStart", 
      }, 
      [31605] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Pathway To Control Center", 
         Description = "You are walking down a path to the control center. There they watch the\
activities of vessels from all parts of the galaxy. It is not a very large\
building but is suitable for its purpose. The ground beneath your feet is\
hardening as you approach the centre and the air is continuasly heavy and\
warm.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31604, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31841, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31606, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31605, 
         Sector = "city", 
         Tag = "", 
      }, 
      [31606] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Pathway To Control Center", 
         Description = "You are in front of the control center for the spaceport. Inside this building\
many descisions are made to decide who should be allowed to land on this\
planet and not to cause air havoc.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31605, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31607, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31606, 
         Sector = "city", 
         Tag = "", 
      }, 
      [31607] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "In Front Of The Control Center", 
         Description = "You are in front of the doors to the spaceport control center. To enter it go\
to the west. At many times of the year this building is just chained up and\
locked. Left here abandoned for the law here is not really kept up tight. The\
door is of solid wood and looks very strong.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31606, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Key = -1, 
               DestinationVnum = 31608, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31607, 
         Sector = "city", 
         Tag = "", 
      }, 
      [31608] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Inside The Control Center", 
         Description = "You are in the entrance to the control center. There are turbolifts moving\
all around you. The control tower is on the higher levels but the offices are\
here on the main level of the building. The ground is hard and seems to be\
made of stone. The air is crisp and relaxing in here for it is shielded from\
the twin suns of Tatooine.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31609, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Key = -1, 
               DestinationVnum = 31607, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31613, 
               Distance = 0, 
            }, 
            [4] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31615, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31608, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31609] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Hallway", 
         Description = "You are in a hallway with doors to executive offices all the way down the\
hall. There are doors placed on both sides of the hall leading into individual\
offices.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31608, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31610, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31609, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31610] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "In The Hallway", 
         Description = "You walk down a narrow hallway which has not much space to each side. To your\
sides there are two offices which hold different things. The ground here is\
made of stone and the illumination is poor as for only one glowpanel remains\
to light up this entire hallway. The air is relaxing and constantly flooding\
your lungs for it is a change towards the hot and heavy air outdoors.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Key = -1, 
               DestinationVnum = 31611, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31609, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Key = -1, 
               DestinationVnum = 31612, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31610, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31611] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Large Conference Room", 
         Description = "You are in one of the first offices ever built. It is well furnished and\
decorated. It is used for conferences because of its size but there are not\
many conferences because of the slackness of law on this planet.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Key = -1, 
               DestinationVnum = 31610, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31611, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31612] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Manager's Office", 
         Description = "This office is a private office for the manager of this facility. It is a\
rather large office with many vents in it to allow the entrance of crisp air\
to enter the room. There is a large desk made from oak in the middle of the\
room stacked up with 3 pieces of paper.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Key = -1, 
               DestinationVnum = 31610, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31612, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31613] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Hallway", 
         Description = "This hallway heads towards the rooms with the generating and computer\
equipment of the control center.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31608, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Key = -1, 
               DestinationVnum = 31614, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31613, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31614] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Generator Room", 
         Description = "This room contains all of the power generating equipment for the spaceport.\
The generators and computer systems are all mounted on the walls.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Key = -1, 
               DestinationVnum = 31613, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31614, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31615] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Lobby", 
         Description = "This is the lobby of the control center. In the corner a secretary takes\
messages and allows passage to the tower.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31608, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "up", 
               Description = "", 
               Keyword = "", 
               Flags = 
               {
                  [0] = "IsDoor", 
                  [5] = "PickProof", 
               }, 
               Key = -1, 
               DestinationVnum = 31616, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31615, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31616] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Tower", 
         Description = "You are standing in the control tower. Most of the tower is run by droids and\
computers. The only living creatures are humans.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31617, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "down", 
               Description = "", 
               Keyword = "", 
               Flags = 
               {
                  [0] = "IsDoor", 
                  [5] = "PickProof", 
               }, 
               Key = -1, 
               DestinationVnum = 31615, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31616, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31617] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Viewscreen", 
         Description = "Here you can see the whole spaceport from this large viewing screen. As you\
peer through it you can see many different species of life from all across the\
galaxy.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31616, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31617, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31618] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Upstairs In The Cantina", 
         Description = "The upstairs of the cantina contains a few rooms that Wuher rents out for a\
small fee. They are barren and comfortable but the locks all work so at\
least they should be a safe.\
 \
This would be a good place to rest for a while. You may quit and reenter\
the game from here.\
 \
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "down", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31863, 
               Distance = 0, 
            }, 
         }, 
         Sector = "city", 
         Vnum = 31618, 
         Flags = 
         {
            [2] = "NoMob", 
            [10] = "Safe", 
            [23] = "Hotel", 
         }, 
         Tag = "", 
      }, 
      [31619] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Tunnel Blocked By A Large Grate", 
         Description = "Beyond a large grate blocking the way ahead, you see a light far ahead, at the\
end of the tunnel. This is probably where the sewege goes. You probably don't\
even want to know what happens to it next.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31591, 
               Distance = 1, 
            }, 
         }, 
         Vnum = 31619, 
         Sector = "underground", 
         Tag = "", 
      }, 
      [31620] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "A Large Chamber", 
         Description = "The tunnels widen into a large chamber. The river of sewage runs through it,\
but most of the floor is dry ground. The purpose of this chamber is not\
obvious, as it's otherwise empty.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31622, 
               Distance = 1, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31591, 
               Distance = 1, 
            }, 
         }, 
         Vnum = 31620, 
         Sector = "underground", 
         Tag = "", 
      }, 
      [31621] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "A Bend In The Tunnels", 
         Description = "The tunnel bends as the river flows from the east to the southwest. There are\
some large fans embedded into the wall, probably to provide breathable air\
into the tunnels.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31504, 
               Distance = 1, 
            }, 
            [2] = 
            {
               Direction = "southwest", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31622, 
               Distance = 1, 
            }, 
         }, 
         Vnum = 31621, 
         Sector = "underground", 
         Tag = "", 
      }, 
      [31622] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "A Tunnel In The Sewers", 
         Description = "#31904\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31620, 
               Distance = 1, 
            }, 
            [2] = 
            {
               Direction = "northeast", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31621, 
               Distance = 1, 
            }, 
         }, 
         Vnum = 31622, 
         Sector = "underground", 
         Tag = "", 
      }, 
      [31623] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Maintenance Personnel's Area", 
         Description = "Even the people working down here deserve a break, and this is where they\
take it. There are some posters on the walls that otherwise has an industrial\
look to them.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
               }, 
               Key = -1, 
               DestinationVnum = 31503, 
               Distance = 1, 
            }, 
         }, 
         Sector = "underground", 
         Vnum = 31623, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31624] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Mercs For Hire", 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31882, 
               Distance = 1, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31625, 
               Distance = 1, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31624, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31625] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Foyer Of Facility", 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31626, 
               Distance = 1, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31624, 
               Distance = 1, 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31627, 
               Distance = 1, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31625, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31626] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Combat Trainer", 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31625, 
               Distance = 1, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31626, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31627] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Equipment Shop", 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31625, 
               Distance = 1, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31627, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31628] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Another Street In Mos Eisley", 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31629, 
               Distance = 1, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31602, 
               Distance = 1, 
            }, 
         }, 
         Vnum = 31628, 
         Sector = "city", 
         Tag = "", 
      }, 
      [31629] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Straight Street", 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31630, 
               Distance = 1, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31634, 
               Distance = 1, 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31628, 
               Distance = 1, 
            }, 
         }, 
         Vnum = 31629, 
         Sector = "city", 
         Tag = "", 
      }, 
      [31630] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Artisan Guild", 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31631, 
               Distance = 1, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31629, 
               Distance = 1, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31630, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31631] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Guild Foyer", 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31633, 
               Distance = 1, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31630, 
               Distance = 1, 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31632, 
               Distance = 1, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31631, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31632] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Engineering Classes", 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31631, 
               Distance = 1, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31632, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31633] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "A Large Workshop", 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31631, 
               Distance = 1, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31633, 
         Flags = 
         {
            [26] = "Factory", 
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31634] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Straight Street", 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31635, 
               Distance = 1, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31629, 
               Distance = 1, 
            }, 
         }, 
         Vnum = 31634, 
         Sector = "city", 
         Tag = "", 
      }, 
      [31635] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "The Mayor's Building", 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31634, 
               Distance = 1, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31636, 
               Distance = 1, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31635, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31636] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "A Spacious Office", 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31635, 
               Distance = 1, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31636, 
         Flags = 
         {
            [10] = "Safe", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31637] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Floating in a void", 
         Description = "", 
         Exits = 
         {
         }, 
         Sector = "inside", 
         Vnum = 31637, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Tag = "", 
      }, 
      [31638] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Outside Old Ben's Hut", 
         Description = "You're standing in front of a small hut made out of synstone. Because of\
the occasional sand storms in the area tearing at the building, it's hard\
to predict how old this structure is.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Key = -1, 
               DestinationVnum = 31639, 
               Distance = 1, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31681, 
               Distance = 1, 
            }, 
         }, 
         Vnum = 31638, 
         Sector = "desert", 
         Tag = "BensHut", 
      }, 
      [31639] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "The Living Area", 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31641, 
               Distance = 1, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Key = -1, 
               DestinationVnum = 31638, 
               Distance = 1, 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31640, 
               Distance = 1, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31639, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31640] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "A Semi-circular Sleeping Alcove", 
         Description = "The alcove is small and semicircular. The walls are simple without anything\
interesting on them. There's just enough room for a bed, but nothing else.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31639, 
               Distance = 1, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31640, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31641] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "A Simple Kitchen", 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31642, 
               Distance = 1, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31639, 
               Distance = 1, 
            }, 
            [3] = 
            {
               Direction = "down", 
               Description = "", 
               Keyword = "trapdoor", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Key = -1, 
               DestinationVnum = 31644, 
               Distance = 1, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31641, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31642] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Pantry", 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31643, 
               Distance = 1, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31641, 
               Distance = 1, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31642, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31643] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Bathroom", 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31642, 
               Distance = 1, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31643, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31644] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "The Cellar", 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31645, 
               Distance = 1, 
            }, 
            [2] = 
            {
               Direction = "up", 
               Description = "", 
               Keyword = "trapdoor", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Key = -1, 
               DestinationVnum = 31641, 
               Distance = 1, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31644, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31645] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "A Small Workshop", 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31644, 
               Distance = 1, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31645, 
         Flags = 
         {
            [16] = "Silence", 
            [26] = "Factory", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31646] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Northern Edge Of The Jundland Wastes", 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31523, 
               Distance = 1, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31647, 
               Distance = 1, 
            }, 
         }, 
         Vnum = 31646, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31647] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Fort Tusken", 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31646, 
               Distance = 1, 
            }, 
         }, 
         Vnum = 31647, 
         Sector = "desert", 
         Tag = "FortTusken", 
      }, 
      [31648] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "TATOOINE BUILDER'S CONTROL CENTER", 
         Description = "This is a room where the builders can work in peace. Very useful to create\
mobs without them starting to wander about.\
", 
         Exits = 
         {
         }, 
         Sector = "inside", 
         Vnum = 31648, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Tag = "TATOOINE_CONTROL_CENTER", 
      }, 
      [31653] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Large Pathway Through The City", 
         Description = "You are walking down one of the main roads in Mos Eisley. As you walk by you\
notice a huge pile of junk where people deposit their goods. The ground you\
walk on is hard and sharp and the air continues to remain the same, heavy and\
warm. The air seems to be getting to you with every step you take but you can\
manage it, after all it's only air.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31840, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31654, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31604, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31653, 
         Sector = "city", 
         Tag = "", 
      }, 
      [31654] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "entry_prog", 
               ScriptType = "MProg", 
               Arguments = "100", 
               Code = "if isjedi($n)\
    if level($n) < 25\
        mpechoat $n You sense that there's something of interest below.\
    endif\
endif\
", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "City Road", 
         Description = "You are walking through the city. To explore other parts of the city\
turn down any one of the number of roads and paths. The ground here is\
hot and sandy as most of this planet is. But as it is a city it is\
placed over a flat area. The air here is hot and heavy and makes you\
slow down, but you stride on. You can feel the warmth pounding down\
on your back as you walk, but for now that is not your concern. The\
sand is blowing up into your face and when it hits you it feels as if\
someone is there slapping you. Just keep your head down and hope your\
goggles can withstand the many sand storms this planet has to deal\
with.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31655, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31653, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Direction = "down", 
               Description = "", 
               Keyword = "manhole", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Key = -1, 
               DestinationVnum = 31907, 
               Distance = 1, 
            }, 
         }, 
         Sector = "city", 
         Vnum = 31654, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Tag = "", 
      }, 
      [31655] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "City", 
         Description = "You are still continuing down the path through Mos Eisley. Just ahead\
you can see the famous cantina. If you would like to enter it veer to\
the south. But beware this place is dangerous. The ground is hot and\
sandy, the air hot and heavy and of course the heat continuously\
pelts down on you as the twin suns heat the planet. The many business\
places that are around you look interesting and some may be of use. \
There is some active life all around you and it scares you at how\
many dirty people can be in one place. \
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31874, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31873, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31853, 
               Distance = 0, 
            }, 
            [4] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31654, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31655, 
         Sector = "city", 
         Tag = "", 
      }, 
      [31658] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You are standing on the harsh sand of Tatooine. You are walking on the\
rippling surface of the sand which has been exposed to extreme heat over\
the many years. The sand is very warm and stings your face as the wind\
blows it up onto your soft skin. The air is thick and very heavy to\
breathe, but living with it something you accepted when you entered the\
desert.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31659, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31600, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31658, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31659] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You are on the hard sand of Tatooine. All around you you can see sand for\
miles unless you look back.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31660, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31658, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31659, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31660] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You are standing on the thickening sand of Tatooine.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31661, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31659, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31660, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31661] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "The sand under you is still hard and glowing. As you look around all you can\
see is shiny sand.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31660, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31662, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31661, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31662] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You walk on the sand of Tatooine. As you walk over it your feet sink into the\
ground leaving an everlasting mark.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31661, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31663, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31662, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31663] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You are walking on the sand of Tatooine. The sand gradually hardens with\
every minute exposed to the sun.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31662, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31664, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31663, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31664] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "The sand under you is feeling hotter with rays of the sun beaming down on it.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31663, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31665, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31664, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31665] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You are standing on the great sands of Tatooine. Far away in the distance you\
can see the developing sea of sand dunes.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31664, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31666, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31665, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31666] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You are heading towards the great sand dunes, yet it is still a long journey\
to reach the sand dune sea.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31683, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31665, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31666, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31667] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You are headed towards the great dune sea, leaving civilization behind.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31668, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31598, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31667, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31668] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You are standing on the hard sand of the planet which has been exposed to\
harsh sun rays.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31669, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31667, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31668, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31669] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "The sand under you is continually getting softer every step you take towards\
the great sea of sand dunes.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31670, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31668, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31669, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31670] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You can now clearly make out the sand dunes ahead of you, but they are still\
very far away.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31671, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31669, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31670, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31671] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You are nearing the great sea of sand dunes with every step you take.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31672, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31670, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31671, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31672] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You are approaching the sand dunes quickly now and will be there soon. With\
every step you take the sand seems to be getting softer and thicker.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31673, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31671, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31672, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31673] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You are only but feet of in reach of the great sea.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31674, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31672, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31673, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31674] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You are nearing the bottom of the first sand dune in sight. All of a sudden\
they seem much bigger than before. They also seem to be growing with every\
step you take.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31675, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31673, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31674, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31675] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "The great dune sea now seems so vast and enormous with every step you take.\
In all directions there are sand dunes towering around and over you.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31676, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31674, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31675, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31676] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You are surrounded by sand, the dunes extend as far as you can see.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31675, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31677, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31676, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31677] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You walk endlessly on the sand beneath you. It towers all around and\
makes you feel enclosed.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31676, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31678, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31677, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31678] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You are walking on a dune. It is shaped by the everlasting winds of Tatooine.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31677, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31679, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31678, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31679] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "The sand around you is thick and hot. In the daytime the sunrays make the\
sand extremely hot.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31678, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31680, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31679, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31680] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You are walking on the sand dunes of the great sea. They tower around you in\
all directions.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31679, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31681, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31680, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31681] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You are walking though the thick sand. It covers your feet and makes you feel\
enclosed.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31638, 
               Distance = 1, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31680, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31681, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31682] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You walk on the sand dunes of the great sea of Tatooine. They shimmer around\
you in the daylight.\
", 
         Exits = 
         {
         }, 
         Sector = "desert", 
         Vnum = 31682, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Tag = "", 
      }, 
      [31683] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You are standing on the thickening sand of the desert.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31684, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31666, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31683, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31684] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You are nearing the first of many sand dunes. All around you can now\
see the sand dunes of the great sea. You can already feel the wind\
blowing the sharp sand into your face. The sand is very sharp so\
wearing something on your face would be a good idea. The twin suns of\
the planet are pounding heat onto your back as you walk slowly\
through the drifts of sand. Your lungs are hurting because this heavy\
air is making their job two times harder. \
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31685, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31683, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31684, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31685] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You are at the step of the first sand dune. You can enter the sand dune sea\
of Tatooine to the north, the west and the east.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31686, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31698, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31684, 
               Distance = 0, 
            }, 
            [4] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31694, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31685, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31686] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You are on one of many large sand dunes in this vast sea.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31687, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31685, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31686, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31687] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "All around you are large sand dunes. If you would like to stay out of the sea\
turn back now.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31688, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31686, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31687, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31688] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You are inside a small valley of sand dunes. All around you shimmering sand\
dunes tower over you.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31689, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31687, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31688, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31689] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You are now in the great sea. The only thing you will find is this great sea\
is probably death.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31688, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31690, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31689, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31690] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You are standing on a vast sand dune which is high enough for you to see\
clearly across the sea.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31689, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31691, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31690, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31691] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You are among many sand dunes. All around you the great sand dunes tower over\
you and you now wonder what you're doing here.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31690, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31692, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31691, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31692] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "The vast sand dunes around you make you feel enclosed. For as far as you can\
see there is only sand.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31691, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31693, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31692, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31693] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You are going endlessly over sand dunes wondering why you are here.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31692, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31693, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31694] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You are standing in front of a largely spaced sea of sand dunes which seems\
never ending.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31685, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31695, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31694, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31695] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You are leaving any hopes of finding civilization behind. The only thing you\
shall find out here is certain death.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31694, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31696, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31695, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31696] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You are looking endlessly at the sand around you. You are but only a small\
figure compared to the sand surrounding you.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31702, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31695, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31697, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31696, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31697] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You are on a sand dune. You can glare far out into the dune sea, but all you\
can see is sand, sand and more sand.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31706, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31696, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31711, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31697, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31698] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You are standing in front of a sand dune. In all directions but the one you\
came are sand dunes.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31699, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31685, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31698, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31699] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "The sand is thicker now that you are on the sand dunes. The great sea is\
greater than you thought and it might be wise to turn back now.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31700, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31698, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31699, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31700] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You are on a sand dune. As you look the sand dunes never end in this vast sea.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31701, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31699, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31700, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31701] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You are in the endless sea of sand dunes. All around you all you can see is\
sand.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31700, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31701, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31702] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You are still in the endless sea of sand dunes. As you peer around yourself\
it feels hopeless in regards to where you are.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31703, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31696, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31702, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31703] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You are in between many sand dunes. They are around you from every angle and\
you feel enclosed because of their height.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31704, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31702, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31703, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31704] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You are on the side of a sand dune. You look around you and there are still\
no traces of life.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31705, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31703, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31704, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31705] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "All around you all you can see is sand. The towering sand dunes are all\
around you and you cannot figure out where you are.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31704, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31705, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31706] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You are standing on soft sand. With sand dunes surrounding you, you just\
keep on walking.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31707, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31697, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31714, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31706, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31707] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You are walking on a sand dune. All around you there are sand dunes. They\
tower high over you until you reach the top of one and start heading back\
down.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31708, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31706, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31707, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31708] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You are standing on the top of a sand dune. And as you hope for something all\
you can see is the voyage down the side of yet another sand dune.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31709, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31707, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31718, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31708, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31709] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You are heading down the side of a dune. Its size makes you feel tired for it\
only makes the journey longer.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31710, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31708, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31709, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31710] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You are surrounded by sand dunes and as they tower over you, you feel\
enclosed.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31709, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31710, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31711] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You are enlosed by many sand dunes which lay around you.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31697, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31712, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31711, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31712] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You are on a sand dune. You can only see sand and formations of dunes in your range of vision.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31711, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31713, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31712, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31713] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You are standing on the top of a sand dune. You feel bigger when you reach the\
top of a sand dune but there is always the way down to think about.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31712, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31713, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31714] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You are walking down the side of a sand dune. All around you is sand as far\
as you can see.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31706, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31715, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31714, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31715] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "The dunes around you are normal as you walk over the endless amount of sand.\
The sea of rippling sand still surrounds you with overwhelming greatness. The\
sand has a reflective shine to it assisted by the sunrays of the heating suns.\
You feel enclosed because the dunes tower over you greatly.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31714, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31716, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31715, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31716] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You are on the side of a dune. It is a large dune so walking down it only to\
walk up another is starting to bother you. The dunes around you are normal as\
you walk over the endless amount of sand. The sea of rippling sand still\
surrounds you with overwhelming greatness. The sand has a reflective shine to\
it assisted by the sunrays of the heating suns. You feel enclosed because the\
dunes tower over you greatly.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31715, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31717, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31716, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31717] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You are standing in between various sand dunes of all sizes and shapes.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31716, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31717, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31718] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You are walking on soft sand. The sand dunes tower around you from all\
directions.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31708, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31719, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31718, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31719] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You are on the side of a sand dune approaching the top.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31718, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31720, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31719, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31720] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You are on the top edge of a sand dune. As you peer around you there is only\
sand.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31719, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31721, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31720, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31721] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You are standing on the side of the sharply shaped sand dune. You are\
approaching the bottom once again so that you can continue with your\
journey.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31722, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31720, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31721, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31722] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You are on a large sand dune. All around you can see sand.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31723, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31721, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31722, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31723] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You are walking on the side of a sand dune. All around you sand dunes tower\
over you.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31722, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31724, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31723, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31724] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You are standing on the top of a sand dune. All around you there is sand.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31725, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31723, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31724, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31725] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You are surrounded by sand from all sides and feel enclosed.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31724, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31726, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31725, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31726] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Description = "You are standing on the top of a sand dune. You can see what seems to be a\
palace of some sort in the side of a sand dune just ahead.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31725, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31727, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31726, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31727] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "The Dune Sea", 
         Description = "You are standing in front of what you now recognize as Jabba the Hutt's former\
home.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31728, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31726, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31727, 
         Sector = "desert", 
         Tag = "", 
      }, 
      [31728] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "In Front Of Jabba's Palace", 
         Description = "You are in front of a large door. It seems to not have been opened in years.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Key = -1, 
               DestinationVnum = 31729, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31727, 
               Distance = 0, 
            }, 
         }, 
         Sector = "desert", 
         Vnum = 31728, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Tag = "JabbasPalace", 
      }, 
      [31729] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Entrance To Jabba's Palace", 
         Description = "You are standing in a large opening surrounded by large walls which tower\
around you. It is very dark in here and you can only continue to the north.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31730, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Key = -1, 
               DestinationVnum = 31728, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31729, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31730] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Hallway In Jabba's Palace", 
         Description = "You are walking down a corridor towards the what seems to be a large room.\
The air around you is thick and has a foul odor.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31731, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31729, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31730, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31731] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "In Front Of Audience Chamber", 
         Description = "You are standing in front of the large audience chamber. It was designed to\
hold many people including dancing girls, bands and tables full of people.\
But, since the Monks took over the palace it has not been used.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31732, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31733, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31730, 
               Distance = 0, 
            }, 
            [4] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31734, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31731, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31732] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Jabba's Dais", 
         Description = "You are standing on Jabba the Hutt's former Dais. It is a very large area\
which has an exellent view of the audience chamber.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31731, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31732, 
         Sector = "inside", 
         Tag = "", 
      }, 
      [31733] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Trapdoor", 
         Description = "You are standing directly on the trapdoor that was used to feed traitors to\
the Rancor which was killed by Luke Skywalker.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31800, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31731, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Direction = "down", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31798, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31733, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31734] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Audience Chambers", 
         Description = "You are in the audience chambers of the palace. You can go up the stairs\
towards some of the living quarters of the monks.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31736, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31731, 
               Distance = 0, 
            }, 
            [3] = 
            {
               Direction = "up", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31735, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31734, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31735] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Upper Level Entrance", 
         Description = "You are on the upper level of the palace that is now inhabited by mainly\
boormir monks and spiderwalkers.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31746, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "down", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31734, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31735, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31736] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Beside The Dais", 
         Description = "You are standing beside the Dais of the former Jabba the Hutt. From here you\
cannot see very well but you are very near the Dais.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31734, 
               Distance = 0, 
            }, 
         }, 
         Sector = "inside", 
         Vnum = 31736, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tag = "", 
      }, 
      [31737] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Beside The Dais", 
         Description = "You are standing beside the Dais. From here you have a good view of the chambers.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31733, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31737, 
         Sector = "inside", 
         Tag = "", 
      }, 
      [31738] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Jundland Wastes", 
         Description = "You are standing on a flat rocky surface. As you peer around you see that the\
Jundland Wastes are very large.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31739, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31586, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31738, 
         Sector = "mountain", 
         Tag = "", 
      }, 
      [31739] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Jundland Wastes", 
         Description = "You walk around the Jundland Wastes. All around you there is a very\
strong odour.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31740, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31738, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31739, 
         Sector = "mountain", 
         Tag = "", 
      }, 
      [31740] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Jundland Wastes", 
         Description = "You stand on rock. It is a very large area you are about to explore. The odour\
is still strong around you.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31741, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31739, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31740, 
         Sector = "mountain", 
         Tag = "", 
      }, 
      [31741] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "The Lars Homestead", 
         Description = "You can see lots of rocks and cliffs of many different shapes and sizes all\
around you. The odour is still all around you.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31740, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31741, 
         Sector = "mountain", 
         Tag = "LarsHomestead", 
      }, 
      [31742] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Vague Area", 
         Description = "You are walking through the Jundland Wastes. All around you there is a\
distinct odour. Things and small creatures many dead lay here but cannot be\
taken without effort, they must not be worth anything.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31743, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31589, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31742, 
         Sector = "mountain", 
         Tag = "", 
      }, 
      [31743] = 
      {
         Tunnel = 0, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Jundland Wastes", 
         Description = "You walk down a path through the wastes. All around you the odour thickens.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31744, 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               Description = "", 
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 31742, 
               Distance = 0, 
            }, 
         }, 
         Vnum = 31743, 
         Sector = "mountain", 
         Tag = "", 
      }, 
   }, 
   Name = "Tatooine", 
   ResetMessage = "", 
   VnumRanges = 
   {
      Room = 
      {
         Last = 31999, 
         First = 31500, 
      }, 
      Mob = 
      {
         Last = 31999, 
         First = 31500, 
      }, 
      Object = 
      {
         Last = 31999, 
         First = 31500, 
      }, 
   }, 
   Resets = 
   {
      [1] = 
      {
         Command = "M", 
         Arg3 = 31767, 
         Arg1 = 31500, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [2] = 
      {
         Command = "E", 
         Arg3 = 0, 
         Arg1 = 31500, 
         MiscData = 1, 
         Arg2 = 100, 
      }, 
      [3] = 
      {
         Command = "O", 
         Arg3 = 31756, 
         Arg1 = 31501, 
         MiscData = 1, 
         Arg2 = 100, 
      }, 
      [4] = 
      {
         Command = "O", 
         Arg3 = 31756, 
         Arg1 = 31501, 
         MiscData = 1, 
         Arg2 = 100, 
      }, 
      [5] = 
      {
         Command = "M", 
         Arg3 = 31756, 
         Arg1 = 31500, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [6] = 
      {
         Command = "E", 
         Arg3 = 0, 
         Arg1 = 31500, 
         MiscData = 1, 
         Arg2 = 100, 
      }, 
      [7] = 
      {
         Command = "O", 
         Arg3 = 31759, 
         Arg1 = 31501, 
         MiscData = 1, 
         Arg2 = 100, 
      }, 
      [8] = 
      {
         Command = "O", 
         Arg3 = 31758, 
         Arg1 = 31501, 
         MiscData = 1, 
         Arg2 = 100, 
      }, 
      [9] = 
      {
         Command = "O", 
         Arg3 = 31758, 
         Arg1 = 31501, 
         MiscData = 1, 
         Arg2 = 100, 
      }, 
      [10] = 
      {
         Command = "O", 
         Arg3 = 31758, 
         Arg1 = 31501, 
         MiscData = 1, 
         Arg2 = 100, 
      }, 
      [11] = 
      {
         Command = "O", 
         Arg3 = 31588, 
         Arg1 = 31502, 
         MiscData = 1, 
         Arg2 = 100, 
      }, 
      [12] = 
      {
         Command = "O", 
         Arg3 = 31588, 
         Arg1 = 31502, 
         MiscData = 1, 
         Arg2 = 100, 
      }, 
      [13] = 
      {
         Command = "O", 
         Arg3 = 31588, 
         Arg1 = 31502, 
         MiscData = 1, 
         Arg2 = 100, 
      }, 
      [14] = 
      {
         Command = "O", 
         Arg3 = 31806, 
         Arg1 = 31503, 
         MiscData = 1, 
         Arg2 = 100, 
      }, 
      [15] = 
      {
         Command = "O", 
         Arg3 = 31806, 
         Arg1 = 31503, 
         MiscData = 1, 
         Arg2 = 100, 
      }, 
      [16] = 
      {
         Command = "M", 
         Arg3 = 31806, 
         Arg1 = 31502, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [17] = 
      {
         Command = "E", 
         Arg3 = 0, 
         Arg1 = 31504, 
         MiscData = 1, 
         Arg2 = 100, 
      }, 
      [18] = 
      {
         Command = "E", 
         Arg3 = 6, 
         Arg1 = 31505, 
         MiscData = 1, 
         Arg2 = 100, 
      }, 
      [19] = 
      {
         Command = "M", 
         Arg3 = 31831, 
         Arg1 = 31505, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [20] = 
      {
         Command = "O", 
         Arg3 = 31833, 
         Arg1 = 31508, 
         MiscData = 1, 
         Arg2 = 100, 
      }, 
      [21] = 
      {
         Command = "M", 
         Arg3 = 31837, 
         Arg1 = 31511, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [22] = 
      {
         Command = "M", 
         Arg3 = 31837, 
         Arg1 = 31511, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [23] = 
      {
         Command = "M", 
         Arg3 = 31837, 
         Arg1 = 31511, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [24] = 
      {
         Command = "E", 
         Arg3 = 16, 
         Arg1 = 31511, 
         MiscData = 1, 
         Arg2 = 100, 
      }, 
      [25] = 
      {
         Command = "M", 
         Arg3 = 31838, 
         Arg1 = 31510, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [26] = 
      {
         Command = "O", 
         Arg3 = 31831, 
         Arg1 = 31508, 
         MiscData = 1, 
         Arg2 = 100, 
      }, 
      [27] = 
      {
         Command = "O", 
         Arg3 = 31612, 
         Arg1 = 31514, 
         MiscData = 1, 
         Arg2 = 100, 
      }, 
      [28] = 
      {
         Command = "M", 
         Arg3 = 31847, 
         Arg1 = 31517, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [29] = 
      {
         Command = "E", 
         Arg3 = 6, 
         Arg1 = 31516, 
         MiscData = 1, 
         Arg2 = 100, 
      }, 
      [30] = 
      {
         Command = "E", 
         Arg3 = 13, 
         Arg1 = 31515, 
         MiscData = 1, 
         Arg2 = 100, 
      }, 
      [31] = 
      {
         Command = "D", 
         Arg3 = 2, 
         Arg1 = 31850, 
         MiscData = 1, 
         Arg2 = 5, 
      }, 
      [32] = 
      {
         Command = "M", 
         Arg3 = 31851, 
         Arg1 = 31518, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [33] = 
      {
         Command = "E", 
         Arg3 = 16, 
         Arg1 = 31517, 
         MiscData = 1, 
         Arg2 = 100, 
      }, 
      [34] = 
      {
         Command = "M", 
         Arg3 = 31852, 
         Arg1 = 31515, 
         MiscData = 1, 
         Arg2 = 4, 
      }, 
      [35] = 
      {
         Command = "M", 
         Arg3 = 31852, 
         Arg1 = 31515, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [36] = 
      {
         Command = "M", 
         Arg3 = 31852, 
         Arg1 = 31515, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [37] = 
      {
         Command = "M", 
         Arg3 = 31852, 
         Arg1 = 31515, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [38] = 
      {
         Command = "M", 
         Arg3 = 31852, 
         Arg1 = 31515, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [39] = 
      {
         Command = "M", 
         Arg3 = 31852, 
         Arg1 = 31515, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [40] = 
      {
         Command = "M", 
         Arg3 = 31715, 
         Arg1 = 31512, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [41] = 
      {
         Command = "M", 
         Arg3 = 31715, 
         Arg1 = 31512, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [42] = 
      {
         Command = "M", 
         Arg3 = 31715, 
         Arg1 = 31513, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [43] = 
      {
         Command = "M", 
         Arg3 = 31715, 
         Arg1 = 31514, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [44] = 
      {
         Command = "M", 
         Arg3 = 31715, 
         Arg1 = 31513, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [45] = 
      {
         Command = "M", 
         Arg3 = 31715, 
         Arg1 = 31516, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [46] = 
      {
         Command = "M", 
         Arg3 = 31715, 
         Arg1 = 31516, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [47] = 
      {
         Command = "O", 
         Arg3 = 31853, 
         Arg1 = 31519, 
         MiscData = 1, 
         Arg2 = 100, 
      }, 
      [48] = 
      {
         Command = "M", 
         Arg3 = 31863, 
         Arg1 = 31519, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [49] = 
      {
         Command = "O", 
         Arg3 = 31863, 
         Arg1 = 31520, 
         MiscData = 1, 
         Arg2 = 100, 
      }, 
      [50] = 
      {
         Command = "M", 
         Arg3 = 31871, 
         Arg1 = 31520, 
         MiscData = 1, 
         Arg2 = 12, 
      }, 
      [51] = 
      {
         Command = "M", 
         Arg3 = 31871, 
         Arg1 = 31520, 
         MiscData = 1, 
         Arg2 = 12, 
      }, 
      [52] = 
      {
         Command = "M", 
         Arg3 = 31871, 
         Arg1 = 31520, 
         MiscData = 1, 
         Arg2 = 12, 
      }, 
      [53] = 
      {
         Command = "M", 
         Arg3 = 31871, 
         Arg1 = 31520, 
         MiscData = 1, 
         Arg2 = 12, 
      }, 
      [54] = 
      {
         Command = "M", 
         Arg3 = 31871, 
         Arg1 = 31520, 
         MiscData = 1, 
         Arg2 = 12, 
      }, 
      [55] = 
      {
         Command = "M", 
         Arg3 = 31871, 
         Arg1 = 31520, 
         MiscData = 1, 
         Arg2 = 12, 
      }, 
      [56] = 
      {
         Command = "M", 
         Arg3 = 31817, 
         Arg1 = 31501, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [57] = 
      {
         Command = "E", 
         Arg3 = 12, 
         Arg1 = 31509, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [58] = 
      {
         Arg1 = 10314, 
         MiscData = 1, 
         Arg2 = 1, 
         Command = "G", 
      }, 
      [59] = 
      {
         Command = "M", 
         Arg3 = 31861, 
         Arg1 = 31504, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [60] = 
      {
         Command = "M", 
         Arg3 = 31861, 
         Arg1 = 31527, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [61] = 
      {
         Command = "M", 
         Arg3 = 31861, 
         Arg1 = 31507, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [62] = 
      {
         Command = "M", 
         Arg3 = 31862, 
         Arg1 = 31526, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [63] = 
      {
         Command = "M", 
         Arg3 = 31862, 
         Arg1 = 31521, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [64] = 
      {
         Command = "M", 
         Arg3 = 31862, 
         Arg1 = 31524, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [65] = 
      {
         Command = "M", 
         Arg3 = 31857, 
         Arg1 = 31525, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [66] = 
      {
         Command = "M", 
         Arg3 = 31857, 
         Arg1 = 31506, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [67] = 
      {
         Command = "M", 
         Arg3 = 31854, 
         Arg1 = 31527, 
         MiscData = 1, 
         Arg2 = 2, 
      }, 
      [68] = 
      {
         Command = "M", 
         Arg3 = 31854, 
         Arg1 = 31523, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [69] = 
      {
         Command = "M", 
         Arg3 = 31854, 
         Arg1 = 31525, 
         MiscData = 1, 
         Arg2 = 2, 
      }, 
      [70] = 
      {
         Command = "M", 
         Arg3 = 31854, 
         Arg1 = 31528, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [71] = 
      {
         Command = "M", 
         Arg3 = 31856, 
         Arg1 = 31526, 
         MiscData = 1, 
         Arg2 = 2, 
      }, 
      [72] = 
      {
         Command = "M", 
         Arg3 = 31856, 
         Arg1 = 31528, 
         MiscData = 1, 
         Arg2 = 2, 
      }, 
      [73] = 
      {
         Command = "M", 
         Arg3 = 31858, 
         Arg1 = 31529, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [74] = 
      {
         Command = "M", 
         Arg3 = 31855, 
         Arg1 = 31520, 
         MiscData = 1, 
         Arg2 = 13, 
      }, 
      [75] = 
      {
         Command = "M", 
         Arg3 = 31855, 
         Arg1 = 31524, 
         MiscData = 1, 
         Arg2 = 2, 
      }, 
      [76] = 
      {
         Command = "M", 
         Arg3 = 31653, 
         Arg1 = 31503, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [77] = 
      {
         Command = "O", 
         Arg3 = 31840, 
         Arg1 = 31514, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [78] = 
      {
         Command = "M", 
         Arg3 = 31870, 
         Arg1 = 31520, 
         MiscData = 1, 
         Arg2 = 19, 
      }, 
      [79] = 
      {
         Command = "M", 
         Arg3 = 31870, 
         Arg1 = 31520, 
         MiscData = 1, 
         Arg2 = 19, 
      }, 
      [80] = 
      {
         Command = "M", 
         Arg3 = 31870, 
         Arg1 = 31520, 
         MiscData = 1, 
         Arg2 = 19, 
      }, 
      [81] = 
      {
         Command = "M", 
         Arg3 = 31870, 
         Arg1 = 31520, 
         MiscData = 1, 
         Arg2 = 19, 
      }, 
      [82] = 
      {
         Command = "M", 
         Arg3 = 31870, 
         Arg1 = 31520, 
         MiscData = 1, 
         Arg2 = 19, 
      }, 
      [83] = 
      {
         Command = "M", 
         Arg3 = 31870, 
         Arg1 = 31520, 
         MiscData = 1, 
         Arg2 = 19, 
      }, 
      [84] = 
      {
         Command = "O", 
         Arg3 = 31830, 
         Arg1 = 31521, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [85] = 
      {
         Command = "M", 
         Arg3 = 31875, 
         Arg1 = 31531, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [86] = 
      {
         Command = "M", 
         Arg3 = 31601, 
         Arg1 = 31504, 
         MiscData = 0, 
         Arg2 = 100, 
      }, 
      [87] = 
      {
         Command = "M", 
         Arg3 = 31602, 
         Arg1 = 31504, 
         MiscData = 0, 
         Arg2 = 100, 
      }, 
      [88] = 
      {
         Command = "M", 
         Arg3 = 31603, 
         Arg1 = 31504, 
         MiscData = 0, 
         Arg2 = 100, 
      }, 
      [89] = 
      {
         Command = "M", 
         Arg3 = 31604, 
         Arg1 = 31504, 
         MiscData = 0, 
         Arg2 = 100, 
      }, 
      [90] = 
      {
         Command = "M", 
         Arg3 = 31819, 
         Arg1 = 31504, 
         MiscData = 0, 
         Arg2 = 100, 
      }, 
      [91] = 
      {
         Command = "M", 
         Arg3 = 31821, 
         Arg1 = 31504, 
         MiscData = 0, 
         Arg2 = 100, 
      }, 
      [92] = 
      {
         Command = "M", 
         Arg3 = 31822, 
         Arg1 = 31504, 
         MiscData = 0, 
         Arg2 = 100, 
      }, 
      [93] = 
      {
         Command = "M", 
         Arg3 = 31824, 
         Arg1 = 31504, 
         MiscData = 0, 
         Arg2 = 100, 
      }, 
      [94] = 
      {
         Command = "M", 
         Arg3 = 31828, 
         Arg1 = 31504, 
         MiscData = 0, 
         Arg2 = 100, 
      }, 
      [95] = 
      {
         Command = "M", 
         Arg3 = 31829, 
         Arg1 = 31504, 
         MiscData = 0, 
         Arg2 = 100, 
      }, 
      [96] = 
      {
         Command = "M", 
         Arg3 = 31830, 
         Arg1 = 31504, 
         MiscData = 0, 
         Arg2 = 100, 
      }, 
      [97] = 
      {
         Command = "M", 
         Arg3 = 31832, 
         Arg1 = 31504, 
         MiscData = 0, 
         Arg2 = 100, 
      }, 
      [98] = 
      {
         Command = "M", 
         Arg3 = 31834, 
         Arg1 = 31504, 
         MiscData = 0, 
         Arg2 = 100, 
      }, 
      [99] = 
      {
         Command = "M", 
         Arg3 = 31835, 
         Arg1 = 31504, 
         MiscData = 0, 
         Arg2 = 100, 
      }, 
      [100] = 
      {
         Command = "M", 
         Arg3 = 31837, 
         Arg1 = 31504, 
         MiscData = 0, 
         Arg2 = 100, 
      }, 
      [101] = 
      {
         Command = "M", 
         Arg3 = 31601, 
         Arg1 = 31503, 
         MiscData = 0, 
         Arg2 = 20, 
      }, 
      [102] = 
      {
         Command = "M", 
         Arg3 = 31602, 
         Arg1 = 31503, 
         MiscData = 0, 
         Arg2 = 20, 
      }, 
      [103] = 
      {
         Command = "M", 
         Arg3 = 31603, 
         Arg1 = 31503, 
         MiscData = 0, 
         Arg2 = 20, 
      }, 
      [104] = 
      {
         Command = "M", 
         Arg3 = 31604, 
         Arg1 = 31503, 
         MiscData = 0, 
         Arg2 = 20, 
      }, 
      [105] = 
      {
         Command = "M", 
         Arg3 = 31653, 
         Arg1 = 31503, 
         MiscData = 0, 
         Arg2 = 20, 
      }, 
      [106] = 
      {
         Command = "M", 
         Arg3 = 31840, 
         Arg1 = 31503, 
         MiscData = 0, 
         Arg2 = 20, 
      }, 
      [107] = 
      {
         Command = "M", 
         Arg3 = 31883, 
         Arg1 = 31532, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [108] = 
      {
         Command = "M", 
         Arg3 = 31863, 
         Arg1 = 328, 
         MiscData = 0, 
         Arg2 = 1, 
      }, 
      [109] = 
      {
         Command = "E", 
         Arg3 = 16, 
         Arg1 = 55, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [110] = 
      {
         Command = "M", 
         Arg3 = 31905, 
         Arg1 = 31900, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [111] = 
      {
         Arg1 = 10323, 
         MiscData = 1, 
         Arg2 = 1, 
         Command = "G", 
      }, 
      [112] = 
      {
         Arg1 = 10324, 
         MiscData = 1, 
         Arg2 = 1, 
         Command = "G", 
      }, 
      [113] = 
      {
         Command = "O", 
         Arg3 = 31899, 
         Arg1 = 31525, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [114] = 
      {
         Command = "O", 
         Arg3 = 31900, 
         Arg1 = 31526, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [115] = 
      {
         Command = "O", 
         Arg3 = 31998, 
         Arg1 = 31527, 
         MiscData = 0, 
         Arg2 = 1, 
      }, 
      [116] = 
      {
         Command = "O", 
         Arg3 = 31997, 
         Arg1 = 31528, 
         MiscData = 0, 
         Arg2 = 1, 
      }, 
      [117] = 
      {
         Command = "M", 
         Arg3 = 31909, 
         Arg1 = 31901, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [118] = 
      {
         Command = "E", 
         Arg3 = 16, 
         Arg1 = 10323, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [119] = 
      {
         Command = "M", 
         Arg3 = 31901, 
         Arg1 = 31902, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [120] = 
      {
         Command = "O", 
         Arg3 = 31901, 
         Arg1 = 31529, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [121] = 
      {
         Command = "P", 
         Arg3 = 0, 
         Arg1 = 31522, 
         MiscData = 0, 
         Arg2 = 1, 
      }, 
      [122] = 
      {
         Command = "P", 
         Arg3 = 0, 
         Arg1 = 31524, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [123] = 
      {
         Command = "O", 
         Arg3 = 31902, 
         Arg1 = 31530, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [124] = 
      {
         Command = "M", 
         Arg3 = 31503, 
         Arg1 = 31533, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [125] = 
      {
         Arg1 = 32210, 
         MiscData = 1, 
         Arg2 = 1, 
         Command = "G", 
      }, 
      [126] = 
      {
         Command = "E", 
         Arg3 = 5, 
         Arg1 = 31532, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [127] = 
      {
         Command = "O", 
         Arg3 = 31503, 
         Arg1 = 31531, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [128] = 
      {
         Command = "M", 
         Arg3 = 31502, 
         Arg1 = 31534, 
         MiscData = 1, 
         Arg2 = 2, 
      }, 
      [129] = 
      {
         Command = "M", 
         Arg3 = 31502, 
         Arg1 = 31534, 
         MiscData = 1, 
         Arg2 = 2, 
      }, 
      [130] = 
      {
         Command = "O", 
         Arg3 = 31623, 
         Arg1 = 31534, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [131] = 
      {
         Command = "D", 
         Arg3 = 2, 
         Arg1 = 31623, 
         MiscData = 0, 
         Arg2 = 2, 
      }, 
      [132] = 
      {
         Command = "M", 
         Arg3 = 31908, 
         Arg1 = 31534, 
         MiscData = 1, 
         Arg2 = 3, 
      }, 
      [133] = 
      {
         Command = "O", 
         Arg3 = 31908, 
         Arg1 = 31535, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [134] = 
      {
         Command = "M", 
         Arg3 = 31626, 
         Arg1 = 31535, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [135] = 
      {
         Command = "M", 
         Arg3 = 31632, 
         Arg1 = 31536, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [136] = 
      {
         Command = "M", 
         Arg3 = 31636, 
         Arg1 = 31537, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [137] = 
      {
         Command = "M", 
         Arg3 = 31857, 
         Arg1 = 31538, 
         MiscData = 0, 
         Arg2 = 1, 
      }, 
      [138] = 
      {
         Command = "M", 
         Arg3 = 31612, 
         Arg1 = 31539, 
         MiscData = 0, 
         Arg2 = 31612, 
      }, 
      [139] = 
      {
         Command = "D", 
         Arg3 = 1, 
         Arg1 = 31638, 
         MiscData = 0, 
         Arg2 = 0, 
      }, 
      [140] = 
      {
         Command = "D", 
         Arg3 = 1, 
         Arg1 = 31639, 
         MiscData = 0, 
         Arg2 = 2, 
      }, 
      [141] = 
      {
         Command = "D", 
         Arg3 = 1, 
         Arg1 = 31641, 
         MiscData = 0, 
         Arg2 = 5, 
      }, 
      [142] = 
      {
         Command = "D", 
         Arg3 = 1, 
         Arg1 = 31644, 
         MiscData = 0, 
         Arg2 = 4, 
      }, 
      [143] = 
      {
         Command = "O", 
         Arg3 = 31640, 
         Arg1 = 31536, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [144] = 
      {
         Command = "O", 
         Arg3 = 31645, 
         Arg1 = 31537, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [145] = 
      {
         Command = "P", 
         Arg3 = 0, 
         Arg1 = 31538, 
         MiscData = 0, 
         Arg2 = 1, 
      }, 
      [146] = 
      {
         Command = "M", 
         Arg3 = 31676, 
         Arg1 = 31541, 
         MiscData = 1, 
         Arg2 = 2, 
      }, 
      [147] = 
      {
         Command = "M", 
         Arg3 = 31676, 
         Arg1 = 31520, 
         MiscData = 1, 
         Arg2 = 15, 
      }, 
      [148] = 
      {
         Command = "M", 
         Arg3 = 31676, 
         Arg1 = 31540, 
         MiscData = 1, 
         Arg2 = 2, 
      }, 
      [149] = 
      {
         Command = "M", 
         Arg3 = 31676, 
         Arg1 = 31542, 
         MiscData = 1, 
         Arg2 = 2, 
      }, 
      [150] = 
      {
         Command = "M", 
         Arg3 = 31567, 
         Arg1 = 31541, 
         MiscData = 1, 
         Arg2 = 3, 
      }, 
      [151] = 
      {
         Command = "M", 
         Arg3 = 31567, 
         Arg1 = 31520, 
         MiscData = 1, 
         Arg2 = 16, 
      }, 
      [152] = 
      {
         Command = "M", 
         Arg3 = 31567, 
         Arg1 = 31540, 
         MiscData = 1, 
         Arg2 = 3, 
      }, 
      [153] = 
      {
         Command = "M", 
         Arg3 = 31567, 
         Arg1 = 31542, 
         MiscData = 1, 
         Arg2 = 3, 
      }, 
      [154] = 
      {
         Command = "M", 
         Arg3 = 31812, 
         Arg1 = 31541, 
         MiscData = 1, 
         Arg2 = 4, 
      }, 
      [155] = 
      {
         Command = "M", 
         Arg3 = 31812, 
         Arg1 = 31520, 
         MiscData = 1, 
         Arg2 = 17, 
      }, 
      [156] = 
      {
         Command = "M", 
         Arg3 = 31812, 
         Arg1 = 31540, 
         MiscData = 1, 
         Arg2 = 4, 
      }, 
      [157] = 
      {
         Command = "M", 
         Arg3 = 31812, 
         Arg1 = 31542, 
         MiscData = 1, 
         Arg2 = 4, 
      }, 
      [158] = 
      {
         Command = "M", 
         Arg3 = 31511, 
         Arg1 = 31541, 
         MiscData = 1, 
         Arg2 = 5, 
      }, 
      [159] = 
      {
         Command = "M", 
         Arg3 = 31511, 
         Arg1 = 31520, 
         MiscData = 1, 
         Arg2 = 18, 
      }, 
      [160] = 
      {
         Command = "M", 
         Arg3 = 31511, 
         Arg1 = 31540, 
         MiscData = 1, 
         Arg2 = 5, 
      }, 
      [161] = 
      {
         Command = "M", 
         Arg3 = 31511, 
         Arg1 = 31542, 
         MiscData = 1, 
         Arg2 = 5, 
      }, 
      [162] = 
      {
         Command = "M", 
         Arg3 = 31555, 
         Arg1 = 31541, 
         MiscData = 1, 
         Arg2 = 6, 
      }, 
      [163] = 
      {
         Command = "M", 
         Arg3 = 31555, 
         Arg1 = 31520, 
         MiscData = 1, 
         Arg2 = 19, 
      }, 
      [164] = 
      {
         Command = "M", 
         Arg3 = 31555, 
         Arg1 = 31540, 
         MiscData = 1, 
         Arg2 = 6, 
      }, 
      [165] = 
      {
         Command = "M", 
         Arg3 = 31555, 
         Arg1 = 31542, 
         MiscData = 1, 
         Arg2 = 6, 
      }, 
      [166] = 
      {
         Command = "M", 
         Arg3 = 31553, 
         Arg1 = 31541, 
         MiscData = 1, 
         Arg2 = 7, 
      }, 
      [167] = 
      {
         Command = "M", 
         Arg3 = 31553, 
         Arg1 = 31520, 
         MiscData = 1, 
         Arg2 = 20, 
      }, 
      [168] = 
      {
         Command = "M", 
         Arg3 = 31553, 
         Arg1 = 31540, 
         MiscData = 1, 
         Arg2 = 7, 
      }, 
      [169] = 
      {
         Command = "M", 
         Arg3 = 31553, 
         Arg1 = 31542, 
         MiscData = 1, 
         Arg2 = 7, 
      }, 
      [170] = 
      {
         Command = "M", 
         Arg3 = 31520, 
         Arg1 = 31541, 
         MiscData = 1, 
         Arg2 = 8, 
      }, 
      [171] = 
      {
         Command = "M", 
         Arg3 = 31520, 
         Arg1 = 31520, 
         MiscData = 1, 
         Arg2 = 21, 
      }, 
      [172] = 
      {
         Command = "M", 
         Arg3 = 31520, 
         Arg1 = 31540, 
         MiscData = 1, 
         Arg2 = 8, 
      }, 
      [173] = 
      {
         Command = "M", 
         Arg3 = 31520, 
         Arg1 = 31542, 
         MiscData = 1, 
         Arg2 = 8, 
      }, 
      [174] = 
      {
         Command = "M", 
         Arg3 = 31575, 
         Arg1 = 31541, 
         MiscData = 1, 
         Arg2 = 9, 
      }, 
      [175] = 
      {
         Command = "M", 
         Arg3 = 31575, 
         Arg1 = 31520, 
         MiscData = 1, 
         Arg2 = 22, 
      }, 
      [176] = 
      {
         Command = "M", 
         Arg3 = 31575, 
         Arg1 = 31540, 
         MiscData = 1, 
         Arg2 = 9, 
      }, 
      [177] = 
      {
         Command = "M", 
         Arg3 = 31575, 
         Arg1 = 31542, 
         MiscData = 1, 
         Arg2 = 9, 
      }, 
      [178] = 
      {
         Command = "M", 
         Arg3 = 31584, 
         Arg1 = 31541, 
         MiscData = 1, 
         Arg2 = 10, 
      }, 
      [179] = 
      {
         Command = "M", 
         Arg3 = 31584, 
         Arg1 = 31520, 
         MiscData = 1, 
         Arg2 = 23, 
      }, 
      [180] = 
      {
         Command = "M", 
         Arg3 = 31584, 
         Arg1 = 31540, 
         MiscData = 1, 
         Arg2 = 10, 
      }, 
      [181] = 
      {
         Command = "M", 
         Arg3 = 31584, 
         Arg1 = 31542, 
         MiscData = 1, 
         Arg2 = 10, 
      }, 
      [182] = 
      {
         Command = "M", 
         Arg3 = 31666, 
         Arg1 = 31541, 
         MiscData = 1, 
         Arg2 = 11, 
      }, 
      [183] = 
      {
         Command = "M", 
         Arg3 = 31666, 
         Arg1 = 31520, 
         MiscData = 1, 
         Arg2 = 24, 
      }, 
      [184] = 
      {
         Command = "M", 
         Arg3 = 31666, 
         Arg1 = 31540, 
         MiscData = 1, 
         Arg2 = 11, 
      }, 
      [185] = 
      {
         Command = "M", 
         Arg3 = 31666, 
         Arg1 = 31542, 
         MiscData = 1, 
         Arg2 = 11, 
      }, 
      [186] = 
      {
         Command = "M", 
         Arg3 = 31700, 
         Arg1 = 31541, 
         MiscData = 1, 
         Arg2 = 12, 
      }, 
      [187] = 
      {
         Command = "M", 
         Arg3 = 31700, 
         Arg1 = 31520, 
         MiscData = 1, 
         Arg2 = 25, 
      }, 
      [188] = 
      {
         Command = "M", 
         Arg3 = 31700, 
         Arg1 = 31540, 
         MiscData = 1, 
         Arg2 = 12, 
      }, 
      [189] = 
      {
         Command = "M", 
         Arg3 = 31700, 
         Arg1 = 31542, 
         MiscData = 1, 
         Arg2 = 12, 
      }, 
      [190] = 
      {
         Command = "M", 
         Arg3 = 31692, 
         Arg1 = 31541, 
         MiscData = 1, 
         Arg2 = 13, 
      }, 
      [191] = 
      {
         Command = "M", 
         Arg3 = 31692, 
         Arg1 = 31520, 
         MiscData = 1, 
         Arg2 = 26, 
      }, 
      [192] = 
      {
         Command = "M", 
         Arg3 = 31692, 
         Arg1 = 31540, 
         MiscData = 1, 
         Arg2 = 13, 
      }, 
      [193] = 
      {
         Command = "M", 
         Arg3 = 31692, 
         Arg1 = 31542, 
         MiscData = 1, 
         Arg2 = 13, 
      }, 
      [194] = 
      {
         Command = "M", 
         Arg3 = 31689, 
         Arg1 = 31541, 
         MiscData = 1, 
         Arg2 = 14, 
      }, 
      [195] = 
      {
         Command = "M", 
         Arg3 = 31689, 
         Arg1 = 31520, 
         MiscData = 1, 
         Arg2 = 27, 
      }, 
      [196] = 
      {
         Command = "M", 
         Arg3 = 31689, 
         Arg1 = 31540, 
         MiscData = 1, 
         Arg2 = 14, 
      }, 
      [197] = 
      {
         Command = "M", 
         Arg3 = 31689, 
         Arg1 = 31542, 
         MiscData = 1, 
         Arg2 = 14, 
      }, 
      [198] = 
      {
         Command = "M", 
         Arg3 = 31685, 
         Arg1 = 31541, 
         MiscData = 1, 
         Arg2 = 14, 
      }, 
      [199] = 
      {
         Command = "M", 
         Arg3 = 31685, 
         Arg1 = 31520, 
         MiscData = 1, 
         Arg2 = 27, 
      }, 
      [200] = 
      {
         Command = "M", 
         Arg3 = 31685, 
         Arg1 = 31540, 
         MiscData = 1, 
         Arg2 = 14, 
      }, 
      [201] = 
      {
         Command = "M", 
         Arg3 = 31685, 
         Arg1 = 31542, 
         MiscData = 1, 
         Arg2 = 14, 
      }, 
      [202] = 
      {
         Command = "M", 
         Arg3 = 31708, 
         Arg1 = 31541, 
         MiscData = 1, 
         Arg2 = 15, 
      }, 
      [203] = 
      {
         Command = "M", 
         Arg3 = 31708, 
         Arg1 = 31520, 
         MiscData = 1, 
         Arg2 = 28, 
      }, 
      [204] = 
      {
         Command = "M", 
         Arg3 = 31708, 
         Arg1 = 31540, 
         MiscData = 1, 
         Arg2 = 15, 
      }, 
      [205] = 
      {
         Command = "M", 
         Arg3 = 31708, 
         Arg1 = 31542, 
         MiscData = 1, 
         Arg2 = 15, 
      }, 
      [206] = 
      {
         Command = "M", 
         Arg3 = 31704, 
         Arg1 = 31541, 
         MiscData = 1, 
         Arg2 = 16, 
      }, 
      [207] = 
      {
         Command = "M", 
         Arg3 = 31704, 
         Arg1 = 31520, 
         MiscData = 1, 
         Arg2 = 29, 
      }, 
      [208] = 
      {
         Command = "M", 
         Arg3 = 31704, 
         Arg1 = 31540, 
         MiscData = 1, 
         Arg2 = 16, 
      }, 
      [209] = 
      {
         Command = "M", 
         Arg3 = 31704, 
         Arg1 = 31542, 
         MiscData = 1, 
         Arg2 = 16, 
      }, 
      [210] = 
      {
         Command = "M", 
         Arg3 = 31727, 
         Arg1 = 31541, 
         MiscData = 1, 
         Arg2 = 17, 
      }, 
      [211] = 
      {
         Command = "M", 
         Arg3 = 31727, 
         Arg1 = 31520, 
         MiscData = 1, 
         Arg2 = 30, 
      }, 
      [212] = 
      {
         Command = "M", 
         Arg3 = 31727, 
         Arg1 = 31540, 
         MiscData = 1, 
         Arg2 = 17, 
      }, 
      [213] = 
      {
         Command = "M", 
         Arg3 = 31727, 
         Arg1 = 31542, 
         MiscData = 1, 
         Arg2 = 17, 
      }, 
   }, 
   FileFormatVersion = 1, 
   HighEconomy = 0, 
   Author = "Satin", 
}
