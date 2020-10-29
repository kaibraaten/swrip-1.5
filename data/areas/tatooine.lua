-- Tatooine
-- Last saved Thursday 29-Oct-2020 20:08:08

AreaEntry
{
   Mobiles = 
   {
      [31500] = 
      {
         Sex = "male", 
         NumberOfAttacks = 0, 
         Level = 22, 
         Flags = 
         {
            [0] = "Npc", 
            [2] = "Scavenger", 
            [6] = "StayArea", 
         }, 
         DefaultPosition = "standing", 
         ArmorClass = 0, 
         Description = "This is a aged monk. He has lived here for many years and has small scars on\
his body.\
", 
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
         Stats = 
         {
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Force = 0, 
            Luck = 10, 
         }, 
         Race = "Human", 
         Weight = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         ShortDescr = "a short monk", 
         LongDescr = "A monk wanders around the palace.\
", 
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
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         Name = "monk", 
         HitRoll = 0, 
         Height = 0, 
         Position = "standing", 
         Vnum = 31500, 
         Credits = 0, 
         DamRoll = 0, 
      }, 
      [31501] = 
      {
         Sex = "male", 
         NumberOfAttacks = 0, 
         Level = 35, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [6] = "StayArea", 
            [7] = "Wimpy", 
         }, 
         DefaultPosition = "standing", 
         ArmorClass = 0, 
         Description = "This jawa seems fierce and old. He has a small pouch where he keeps his money\
and change for customers willing to purchase something.\
", 
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
         Alignment = 111, 
         Stats = 
         {
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Force = 0, 
            Luck = 10, 
         }, 
         Race = "Jawa", 
         Weight = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "all_greet_prog", 
               Code = "say If you're looking for some goods...\
say ... you've come to the right place.\
", 
               ScriptType = "MProg", 
               Arguments = "100", 
            }, 
         }, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         ShortDescr = "a large Jawa", 
         LongDescr = "A large, mean looking Jawa sits in his chair comfortably here selling liquids for journeys out into the great dune sea.\
", 
         AffectedBy = 
         {
            [7] = "Sanctuary", 
         }, 
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
            KeeperShortDescr = "a large Jawa", 
            ProfitSell = 0, 
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
            ProfitBuy = 110, 
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
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         Name = "water jawa", 
         HitRoll = 0, 
         Height = 0, 
         Position = "standing", 
         Vnum = 31501, 
         Credits = 30000, 
         DamRoll = 0, 
      }, 
      [31502] = 
      {
         Sex = "female", 
         NumberOfAttacks = 0, 
         Level = 100, 
         Flags = 
         {
            [1] = "Sentinel", 
            [2] = "Scavenger", 
            [0] = "Npc", 
            [5] = "Aggressive", 
            [6] = "StayArea", 
         }, 
         DefaultPosition = "standing", 
         ArmorClass = -170, 
         Description = "This ferocious creature is rare but very valuble to many people throughout\
this galaxy. As it eyes you, you wonder what to do.\
", 
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
         Alignment = 0, 
         Stats = 
         {
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Force = 0, 
            Luck = 10, 
         }, 
         Race = "Reptile", 
         Weight = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         ShortDescr = "a large krayt dragon", 
         LongDescr = "A large krayt stands here towering over you, staring you in the eye.\
", 
         AffectedBy = 
         {
            [7] = "Sanctuary", 
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
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         Name = "Krayt dragon", 
         HitRoll = 0, 
         Height = 0, 
         Position = "standing", 
         Vnum = 31502, 
         Credits = 0, 
         DamRoll = 0, 
      }, 
      [31503] = 
      {
         Sex = "male", 
         NumberOfAttacks = 0, 
         Level = 1, 
         Flags = 
         {
            [0] = "Npc", 
            [2] = "Scavenger", 
            [6] = "StayArea", 
         }, 
         DefaultPosition = "standing", 
         ArmorClass = 97, 
         Description = "This creature does not look to be of one of the more appreciated kind.\
", 
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
         Stats = 
         {
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Force = 0, 
            Luck = 10, 
         }, 
         Race = "Rodent", 
         Weight = 0, 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 0, 
         }, 
         ShortDescr = "a small womp Rat", 
         LongDescr = "A womp rat hops by.\
", 
         HitChance = 
         {
            HitPlus = 10, 
            HitNoDice = 0, 
            HitSizeDice = 10, 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         Name = "womp rat", 
         HitRoll = 0, 
         Height = 0, 
         Position = "standing", 
         Vnum = 31503, 
         Credits = 0, 
         DamRoll = 0, 
      }, 
      [31504] = 
      {
         Sex = "male", 
         NumberOfAttacks = 0, 
         Level = 3, 
         Flags = 
         {
            [0] = "Npc", 
            [2] = "Scavenger", 
            [6] = "StayArea", 
         }, 
         DefaultPosition = "standing", 
         ArmorClass = 0, 
         Description = "This creature is not one of the more respectable species but manages to live\
on its own. This Jawa is a very young and untrained.\
", 
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
         Stats = 
         {
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Force = 0, 
            Luck = 10, 
         }, 
         Race = "Jawa", 
         Weight = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         ShortDescr = "a young Jawa", 
         LongDescr = "A young Jawa walks around here.\
", 
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
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         Name = "Young Jawa", 
         HitRoll = 0, 
         Height = 0, 
         Position = "standing", 
         Vnum = 31504, 
         Credits = 0, 
         DamRoll = 0, 
      }, 
      [31505] = 
      {
         Sex = "male", 
         NumberOfAttacks = 0, 
         Level = 25, 
         Flags = 
         {
            [1] = "Sentinel", 
            [2] = "Scavenger", 
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         DefaultPosition = "standing", 
         ArmorClass = 0, 
         Description = "This is not a regular filthy creature. This Jawa is trained and armed to the\
teeth. Consider it before you attack him.\
", 
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
         Stats = 
         {
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Force = 0, 
            Luck = 10, 
         }, 
         Race = "Jawa", 
         Weight = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         ShortDescr = "a Jawa guard", 
         LongDescr = "The Jawa guard stands here guarding something.\
", 
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
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         Name = "jawa guard", 
         HitRoll = 0, 
         Height = 0, 
         Position = "standing", 
         Vnum = 31505, 
         Credits = 0, 
         DamRoll = 0, 
      }, 
      [31506] = 
      {
         Sex = "male", 
         NumberOfAttacks = 0, 
         Level = 3, 
         Flags = 
         {
            [0] = "Npc", 
            [2] = "Scavenger", 
            [6] = "StayArea", 
         }, 
         DefaultPosition = "standing", 
         ArmorClass = 0, 
         Description = "This scavenger is a small animal whom which no attention is regarded.\
", 
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
         Stats = 
         {
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Force = 0, 
            Luck = 10, 
         }, 
         Race = "Creature", 
         Weight = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         ShortDescr = "a scavenger", 
         LongDescr = "A scavenger walks around here picking up anything he can see.\
", 
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
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         Name = "Scavenger", 
         HitRoll = 0, 
         Height = 0, 
         Position = "standing", 
         Vnum = 31506, 
         Credits = 0, 
         DamRoll = 0, 
      }, 
      [31507] = 
      {
         Sex = "male", 
         NumberOfAttacks = 0, 
         Level = 9, 
         Flags = 
         {
            [0] = "Npc", 
            [2] = "Scavenger", 
            [6] = "StayArea", 
         }, 
         DefaultPosition = "standing", 
         ArmorClass = 0, 
         Description = "You are looking at one of the ancestors of this planet. They have been here\
ever since the Dowager Queen crashed into the planet.\
", 
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
         Stats = 
         {
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Force = 0, 
            Luck = 10, 
         }, 
         Race = "Human", 
         Weight = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         ShortDescr = "a moisture farmer", 
         LongDescr = "A moisture farmer walks around here, trying to find his destination.\
", 
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
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         Name = "Moisture Farmer", 
         HitRoll = 0, 
         Height = 0, 
         Position = "standing", 
         Vnum = 31507, 
         Credits = 0, 
         DamRoll = 0, 
      }, 
      [31508] = 
      {
         Sex = "undistinguished", 
         NumberOfAttacks = 0, 
         Level = 8, 
         Flags = 
         {
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         DefaultPosition = "standing", 
         ArmorClass = 0, 
         Description = "This power droid is rather old and has been used for many different purposes\
over the years of its existence. Although it is still functional it is almost\
ready to be trashed. Small wires and shorted connections are sprawled out on\
different parts of the droids surface.\
", 
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
         Stats = 
         {
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Force = 0, 
            Luck = 10, 
         }, 
         Race = "Droid", 
         Weight = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         ShortDescr = "a square power droid", 
         LongDescr = "A power droid moves around on the ground here, humming.\
", 
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
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         Name = "Power droid", 
         HitRoll = 0, 
         Height = 0, 
         Position = "standing", 
         Vnum = 31508, 
         Credits = 0, 
         DamRoll = 0, 
      }, 
      [31509] = 
      {
         Sex = "undistinguished", 
         NumberOfAttacks = 0, 
         Level = 15, 
         Flags = 
         {
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         DefaultPosition = "standing", 
         ArmorClass = 0, 
         Description = "This droid, when speaking, makes no sense to you. Throught its beeps and\
sounds its trying to say something to you but you have no clue what. This\
droid seems to have been used before but is in excellent shape.\
", 
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
         Stats = 
         {
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Force = 0, 
            Luck = 10, 
         }, 
         Race = "Astromech Droid", 
         Weight = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         ShortDescr = "an astromech droid", 
         LongDescr = "A small astromech droid stands around here chirping away.\
", 
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
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         Name = "Astromech droid.", 
         HitRoll = 0, 
         Height = 0, 
         Position = "standing", 
         Vnum = 31509, 
         Credits = 0, 
         DamRoll = 0, 
      }, 
      [31510] = 
      {
         Sex = "undistinguished", 
         NumberOfAttacks = 0, 
         Level = 45, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [9] = "Train", 
            [6] = "StayArea", 
         }, 
         DefaultPosition = "standing", 
         ArmorClass = 0, 
         Description = "This Jawa has studied the ways of this world for many years, and if you pay\
attention can teach you may things of many uses. Be careful not to attack him\
for he has great powers.\
", 
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
         Alignment = 210, 
         Stats = 
         {
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Force = 0, 
            Luck = 10, 
         }, 
         Race = "Jawa", 
         Weight = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         ShortDescr = "a wise Jawa", 
         LongDescr = "A wise Jawa stands here ready to teach you skills.\
", 
         AffectedBy = 
         {
            [7] = "Sanctuary", 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         HitChance = 
         {
            HitPlus = 0, 
            HitNoDice = 0, 
            HitSizeDice = 0, 
         }, 
         Name = "Wise Jawa", 
         VipFlags = 
         {
            [8] = "Tatooine", 
         }, 
         HitRoll = 0, 
         Height = 0, 
         Position = "standing", 
         Vnum = 31510, 
         Credits = 0, 
         DamRoll = 0, 
      }, 
      [31511] = 
      {
         Sex = "male", 
         NumberOfAttacks = 0, 
         Level = 40, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         DefaultPosition = "standing", 
         ArmorClass = 0, 
         Description = "This is no mere guard. He too has developed many skills and is powerful. You\
should consider attacking him, wisely.\
", 
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
         Stats = 
         {
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Force = 0, 
            Luck = 10, 
         }, 
         Race = "Jawa", 
         Weight = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         ShortDescr = "a guardian", 
         LongDescr = "A guardian stands here watching over The Wise One.\
", 
         AffectedBy = 
         {
            [7] = "Sanctuary", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "act_prog", 
               Code = "say Welcome! Are you ready to learn young apprentice?\
", 
               ScriptType = "MProg", 
               Arguments = "p arrives from the west.", 
            }, 
            [2] = 
            {
               MudProgType = "speech_prog", 
               Code = "mpechoat $n The guard ushers you into the chamber.\
mpechoaround $n The guard ushers $n into the chamber.\
mptransfer $n 31838\
mpat $n mpechoaround $n $n is ushered into the chamber.\
", 
               ScriptType = "MProg", 
               Arguments = "p yes", 
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
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         Name = "Guardian", 
         HitRoll = 0, 
         Height = 0, 
         Position = "standing", 
         Vnum = 31511, 
         Credits = 0, 
         DamRoll = 0, 
      }, 
      [31512] = 
      {
         Sex = "male", 
         NumberOfAttacks = 0, 
         Level = 23, 
         Flags = 
         {
            [0] = "Npc", 
            [5] = "Aggressive", 
            [2] = "Scavenger", 
            [6] = "StayArea", 
         }, 
         DefaultPosition = "standing", 
         ArmorClass = 0, 
         Description = "This species has adapted to the ways of living in the desert. He is strong in\
mind and is very vicious. Be careful what you do.\
", 
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
         Stats = 
         {
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Force = 0, 
            Luck = 10, 
         }, 
         Race = "Tusken", 
         Weight = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         ShortDescr = "a Tusken Raider", 
         LongDescr = "A Tusken Raider watches you waiting for the right moment to attack.\
", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "all_greet_prog", 
               Code = "snarl\
swear $n\
", 
               ScriptType = "MProg", 
               Arguments = "70", 
            }, 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         HitChance = 
         {
            HitPlus = 0, 
            HitNoDice = 0, 
            HitSizeDice = 0, 
         }, 
         Name = "Sand person tusken raider", 
         VipFlags = 
         {
            [8] = "Tatooine", 
         }, 
         HitRoll = 0, 
         Height = 0, 
         Position = "standing", 
         Vnum = 31512, 
         Credits = 0, 
         DamRoll = 0, 
      }, 
      [31513] = 
      {
         Sex = "male", 
         NumberOfAttacks = 0, 
         Level = 30, 
         Flags = 
         {
            [0] = "Npc", 
            [2] = "Scavenger", 
            [6] = "StayArea", 
         }, 
         DefaultPosition = "standing", 
         ArmorClass = 0, 
         Description = "This Tusken Raider has survived years of training and memory. To become what\
he is he cannot make any mistakes or alter in any way a story told from the\
past or he will be killed, for the Sand People believe that once told a story\
can never be altered in any way.\
", 
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
         Stats = 
         {
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Force = 0, 
            Luck = 10, 
         }, 
         Race = "Tusken", 
         Weight = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         ShortDescr = "a Tusken Raider storyteller.", 
         LongDescr = "A Wise Tusken Raider sits here telling a story.\
", 
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
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         Name = "Sand people tusken raider Storyteller.", 
         HitRoll = 0, 
         Height = 0, 
         Position = "standing", 
         Vnum = 31513, 
         Credits = 0, 
         DamRoll = 0, 
      }, 
      [31514] = 
      {
         Sex = "male", 
         NumberOfAttacks = 0, 
         Level = 25, 
         Flags = 
         {
            [0] = "Npc", 
            [2] = "Scavenger", 
            [6] = "StayArea", 
         }, 
         DefaultPosition = "standing", 
         ArmorClass = 0, 
         Description = "This is one of the younger, wiser Sand People. He is being trained to become\
the next Storyteller of the Sand People. He just hopes in his mind that he\
will remember and remember well every story precisely.\
", 
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
         Stats = 
         {
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Force = 0, 
            Luck = 10, 
         }, 
         Race = "Tusken", 
         Weight = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         ShortDescr = "a storyteller in training", 
         LongDescr = "A storyteller in training listens carefully here so that he may remember every story with precision and awe.      \
", 
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
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         Name = "Storyteller training.", 
         HitRoll = 0, 
         Height = 0, 
         Position = "standing", 
         Vnum = 31514, 
         Credits = 0, 
         DamRoll = 0, 
      }, 
      [31515] = 
      {
         Sex = "male", 
         NumberOfAttacks = 0, 
         Level = 45, 
         Flags = 
         {
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         DefaultPosition = "standing", 
         ArmorClass = 0, 
         Description = "This creature is rather tame but when provoked can be aggressive and\
dangerous. Watch your step.\
", 
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
         Stats = 
         {
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Force = 0, 
            Luck = 10, 
         }, 
         Race = "Ronto", 
         Weight = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         ShortDescr = "a ronto", 
         LongDescr = "A ronto stands here towering over you.\
", 
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
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         Name = "Ronto", 
         HitRoll = 0, 
         Height = 0, 
         Position = "standing", 
         Vnum = 31515, 
         Credits = 0, 
         DamRoll = 0, 
      }, 
      [31516] = 
      {
         Sex = "male", 
         NumberOfAttacks = 0, 
         Level = 35, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [5] = "Aggressive", 
            [6] = "StayArea", 
         }, 
         DefaultPosition = "standing", 
         ArmorClass = 0, 
         Description = "This is a large furry creature which is rumored to have crushed people with\
one step. Be careful for he does not like people who are not his master.\
", 
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
         Stats = 
         {
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Force = 0, 
            Luck = 10, 
         }, 
         Race = "Bantha", 
         Weight = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         ShortDescr = "a bantha", 
         LongDescr = "A bantha walks around here slowly, waiting for its master.\
", 
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
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         Name = "Bantha", 
         HitRoll = 0, 
         Height = 0, 
         Position = "standing", 
         Vnum = 31516, 
         Credits = 0, 
         DamRoll = 0, 
      }, 
      [31517] = 
      {
         Sex = "male", 
         NumberOfAttacks = 0, 
         Level = 14, 
         Flags = 
         {
            [1] = "Sentinel", 
            [2] = "Scavenger", 
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         DefaultPosition = "standing", 
         ArmorClass = 0, 
         Description = "This mechanic is rather young, he has marks and wrinkles from work and\
possibly war. He seems to be calm and will stay away from you unless you\
need something which he may sometimes have.\
", 
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
         Stats = 
         {
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Force = 0, 
            Luck = 10, 
         }, 
         Race = "Human", 
         Weight = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         ShortDescr = "a mechanic", 
         LongDescr = "A mechanic waits here to be hired.\
", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "all_greet_prog", 
               Code = "say So ya need something fixed, eh?\
", 
               ScriptType = "MProg", 
               Arguments = "100", 
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
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         Name = "Mechanic", 
         HitRoll = 0, 
         Height = 0, 
         Position = "standing", 
         Vnum = 31517, 
         Credits = 0, 
         DamRoll = 0, 
      }, 
      [31518] = 
      {
         Sex = "male", 
         NumberOfAttacks = 0, 
         Level = 19, 
         Flags = 
         {
            [1] = "Sentinel", 
            [2] = "Scavenger", 
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         DefaultPosition = "standing", 
         ArmorClass = 0, 
         Description = "This Jawa is probably the tallest Jawa ever. Although he is still smaller than\
you he looks tough, and with that gun I would be scared.\
", 
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
         Stats = 
         {
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Force = 0, 
            Luck = 10, 
         }, 
         Race = "Jawa", 
         Weight = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         ShortDescr = "a tall Jawa", 
         LongDescr = "A tall jawa stands here protecting his Rontos.\
", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "all_greet_prog", 
               Code = "say So...\
say You're interested in rontos, eh?\
nudge $n\
", 
               ScriptType = "MProg", 
               Arguments = "100", 
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
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         Name = "tall jawa", 
         HitRoll = 0, 
         Height = 0, 
         Position = "standing", 
         Vnum = 31518, 
         Credits = 0, 
         DamRoll = 0, 
      }, 
      [31519] = 
      {
         Sex = "male", 
         NumberOfAttacks = 0, 
         Level = 65, 
         Flags = 
         {
            [1] = "Sentinel", 
            [2] = "Scavenger", 
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         DefaultPosition = "standing", 
         ArmorClass = 0, 
         Description = "This man is rather old and has been working here for many years as bartender.\
Be careful though, he still has his same old edge.\
", 
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
         Stats = 
         {
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Force = 0, 
            Luck = 10, 
         }, 
         Race = "Human", 
         Weight = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         ShortDescr = "Wuher", 
         LongDescr = "Wuher stands here serving people their drinks.\
", 
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
            KeeperShortDescr = "Wuher", 
            ProfitSell = 100, 
            BusinessHours = 
            {
               Close = 23, 
               Open = 1, 
            }, 
            ProfitBuy = 105, 
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
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         Name = "Wuher", 
         HitRoll = 0, 
         Height = 0, 
         Position = "standing", 
         Vnum = 31519, 
         Credits = 0, 
         DamRoll = 0, 
      }, 
      [31520] = 
      {
         Sex = "undistinguished", 
         NumberOfAttacks = 0, 
         Level = 20, 
         Flags = 
         {
            [0] = "Npc", 
            [24] = "NoAssist", 
         }, 
         DefaultPosition = "standing", 
         ArmorClass = 50, 
         Description = "A small womp rat walk around here seeking shelter.\
", 
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
         Stats = 
         {
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Force = 0, 
            Luck = 10, 
         }, 
         Race = "Rodent", 
         Weight = 0, 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 2, 
         }, 
         ShortDescr = "a small womp rat", 
         LongDescr = "A small womp rat walks around here.\
", 
         SpecFuns = 
         {
            [0] = "spec_fido", 
         }, 
         HitChance = 
         {
            HitPlus = 200, 
            HitNoDice = 4, 
            HitSizeDice = 10, 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         Name = "Womp rat", 
         HitRoll = 4, 
         Height = 0, 
         Position = "standing", 
         Vnum = 31520, 
         Credits = 0, 
         DamRoll = 4, 
      }, 
      [31521] = 
      {
         Sex = "undistinguished", 
         NumberOfAttacks = 0, 
         Level = 9, 
         Flags = 
         {
            [0] = "Npc", 
            [24] = "NoAssist", 
         }, 
         DefaultPosition = "standing", 
         ArmorClass = 0, 
         Description = "", 
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
         Stats = 
         {
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Force = 0, 
            Luck = 10, 
         }, 
         Race = "Human", 
         Weight = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         ShortDescr = "a small thief", 
         LongDescr = "A small thief Walks about trying to pick your pocket.\
", 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         HitChance = 
         {
            HitPlus = 0, 
            HitNoDice = 0, 
            HitSizeDice = 0, 
         }, 
         AttackFlags = 
         {
            [5] = "kick", 
         }, 
         Name = "Small Thief", 
         HitRoll = 0, 
         Height = 0, 
         Position = "standing", 
         Vnum = 31521, 
         Credits = 0, 
         DamRoll = 0, 
      }, 
      [31522] = 
      {
         Sex = "undistinguished", 
         NumberOfAttacks = 0, 
         Level = 11, 
         Flags = 
         {
            [0] = "Npc", 
            [24] = "NoAssist", 
         }, 
         DefaultPosition = "standing", 
         ArmorClass = 0, 
         Description = "", 
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
         Stats = 
         {
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Force = 0, 
            Luck = 10, 
         }, 
         Race = "Human", 
         Weight = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         ShortDescr = "a large thief", 
         LongDescr = "A large thief walks about here.\
", 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         HitChance = 
         {
            HitPlus = 0, 
            HitNoDice = 0, 
            HitSizeDice = 0, 
         }, 
         AttackFlags = 
         {
            [4] = "punch", 
         }, 
         Name = "Large thief", 
         HitRoll = 0, 
         Height = 0, 
         Position = "standing", 
         Vnum = 31522, 
         Credits = 0, 
         DamRoll = 0, 
      }, 
      [31523] = 
      {
         Sex = "undistinguished", 
         NumberOfAttacks = 0, 
         Level = 17, 
         Flags = 
         {
            [0] = "Npc", 
            [24] = "NoAssist", 
         }, 
         DefaultPosition = "standing", 
         ArmorClass = 0, 
         Description = "", 
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
         Stats = 
         {
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Force = 0, 
            Luck = 10, 
         }, 
         Race = "Human", 
         Weight = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         ShortDescr = "a skillful thief", 
         LongDescr = "A skillful thief walks about here.\
", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Code = "Steal credits $n\
", 
               ScriptType = "MProg", 
               Arguments = "35", 
            }, 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         HitChance = 
         {
            HitPlus = 0, 
            HitNoDice = 0, 
            HitSizeDice = 0, 
         }, 
         AttackFlags = 
         {
            [4] = "punch", 
         }, 
         Name = "skillful thief", 
         HitRoll = 0, 
         Height = 0, 
         Position = "standing", 
         Vnum = 31523, 
         Credits = 0, 
         DamRoll = 0, 
      }, 
      [31524] = 
      {
         Sex = "undistinguished", 
         NumberOfAttacks = 0, 
         Level = 18, 
         Flags = 
         {
            [0] = "Npc", 
            [24] = "NoAssist", 
         }, 
         DefaultPosition = "standing", 
         ArmorClass = 0, 
         Description = "", 
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
         Stats = 
         {
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Force = 0, 
            Luck = 10, 
         }, 
         Race = "Human", 
         Weight = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         ShortDescr = "a smuggler", 
         LongDescr = "A smuggler sits at a table watching.\
", 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         HitChance = 
         {
            HitPlus = 0, 
            HitNoDice = 0, 
            HitSizeDice = 0, 
         }, 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         Name = "Smuggler", 
         HitRoll = 0, 
         Height = 0, 
         Position = "standing", 
         Vnum = 31524, 
         Credits = 0, 
         DamRoll = 0, 
      }, 
      [31525] = 
      {
         Sex = "undistinguished", 
         NumberOfAttacks = 0, 
         Level = 26, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         DefaultPosition = "standing", 
         ArmorClass = 0, 
         Description = "", 
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
         Stats = 
         {
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Force = 0, 
            Luck = 10, 
         }, 
         Race = "Human", 
         Weight = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         ShortDescr = "an experienced smuggler", 
         LongDescr = "An experienced smuggler waits for his contact here.\
", 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         HitChance = 
         {
            HitPlus = 0, 
            HitNoDice = 0, 
            HitSizeDice = 0, 
         }, 
         AttackFlags = 
         {
            [5] = "kick", 
            [6] = "_06", 
            [9] = "_09", 
         }, 
         Name = "Experienced Smuggler", 
         HitRoll = 0, 
         Height = 0, 
         Position = "standing", 
         Vnum = 31525, 
         Credits = 0, 
         DamRoll = 0, 
      }, 
      [31526] = 
      {
         Sex = "undistinguished", 
         NumberOfAttacks = 0, 
         Level = 14, 
         Flags = 
         {
            [0] = "Npc", 
            [24] = "NoAssist", 
         }, 
         DefaultPosition = "standing", 
         ArmorClass = 0, 
         Description = "", 
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
         Stats = 
         {
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Force = 0, 
            Luck = 10, 
         }, 
         Race = "Ithorian", 
         Weight = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         ShortDescr = "an Ithorian", 
         LongDescr = "An Ithorian drinks his liquors here.\
", 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         HitChance = 
         {
            HitPlus = 0, 
            HitNoDice = 0, 
            HitSizeDice = 0, 
         }, 
         AttackFlags = 
         {
            [6] = "_06", 
            [5] = "kick", 
         }, 
         Name = "Ithorian", 
         HitRoll = 0, 
         Height = 0, 
         Position = "standing", 
         Vnum = 31526, 
         Credits = 0, 
         DamRoll = 0, 
      }, 
      [31527] = 
      {
         Sex = "undistinguished", 
         NumberOfAttacks = 0, 
         Level = 6, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         DefaultPosition = "standing", 
         ArmorClass = 0, 
         Description = "", 
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
         Stats = 
         {
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Force = 0, 
            Luck = 10, 
         }, 
         Race = "Human", 
         Weight = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         ShortDescr = "a female citizen", 
         LongDescr = "A female citizen minds her own business here.\
", 
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
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         Name = "Female citizen", 
         HitRoll = 0, 
         Height = 0, 
         Position = "standing", 
         Vnum = 31527, 
         Credits = 0, 
         DamRoll = 0, 
      }, 
      [31528] = 
      {
         Sex = "undistinguished", 
         NumberOfAttacks = 0, 
         Level = 13, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         DefaultPosition = "standing", 
         ArmorClass = 0, 
         Description = "", 
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
         Stats = 
         {
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Force = 0, 
            Luck = 10, 
         }, 
         Race = "Human", 
         Weight = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         ShortDescr = "a male citizen", 
         LongDescr = "A male citizen walks around here.\
", 
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
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         Name = "Male citizen", 
         HitRoll = 0, 
         Height = 0, 
         Position = "standing", 
         Vnum = 31528, 
         Credits = 0, 
         DamRoll = 0, 
      }, 
      [31529] = 
      {
         Sex = "undistinguished", 
         NumberOfAttacks = 0, 
         Level = 9, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         DefaultPosition = "standing", 
         ArmorClass = 0, 
         Description = "", 
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
         Stats = 
         {
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Force = 0, 
            Luck = 10, 
         }, 
         Race = "Rodian", 
         Weight = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         ShortDescr = "a Rodian", 
         LongDescr = "A Rodian sits here contemplating his navel.\
", 
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
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         Name = "Rodian", 
         HitRoll = 0, 
         Height = 0, 
         Position = "standing", 
         Vnum = 31529, 
         Credits = 0, 
         DamRoll = 0, 
      }, 
      [31530] = 
      {
         Sex = "undistinguished", 
         NumberOfAttacks = 0, 
         Level = 103, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         DefaultPosition = "standing", 
         ArmorClass = 0, 
         Description = "", 
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
         Stats = 
         {
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Force = 0, 
            Luck = 10, 
         }, 
         Race = "Human", 
         Weight = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         ShortDescr = "Merth", 
         LongDescr = "Merth walks around here.\
", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "fight_prog", 
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
               ScriptType = "MProg", 
               Arguments = "100", 
            }, 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         HitChance = 
         {
            HitPlus = 0, 
            HitNoDice = 0, 
            HitSizeDice = 0, 
         }, 
         AttackFlags = 
         {
            [9] = "_09", 
            [5] = "kick", 
         }, 
         Name = "Merth", 
         HitRoll = 0, 
         Height = 0, 
         Position = "standing", 
         Vnum = 31530, 
         Credits = 0, 
         DamRoll = 0, 
      }, 
      [31531] = 
      {
         Sex = "undistinguished", 
         NumberOfAttacks = 0, 
         Level = 32, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         DefaultPosition = "standing", 
         ArmorClass = 20, 
         Description = "", 
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
         Stats = 
         {
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Force = 0, 
            Luck = 10, 
         }, 
         Race = "Human", 
         Weight = 0, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 3, 
         }, 
         ShortDescr = "Wioslea", 
         LongDescr = "Wioslea tends to her customers need.\
", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "all_greet_prog", 
               Code = "say Business is bad, get outta here!\
grin\
", 
               ScriptType = "MProg", 
               Arguments = "100", 
            }, 
         }, 
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
            KeeperShortDescr = "Wioslea", 
            ProfitSell = 0, 
            BusinessHours = 
            {
               Close = 23, 
               Open = 1, 
            }, 
            ProfitBuy = 120, 
         }, 
         HitChance = 
         {
            HitPlus = 320, 
            HitNoDice = 6, 
            HitSizeDice = 10, 
         }, 
         Name = "Wioslea", 
         VipFlags = 
         {
            [8] = "Tatooine", 
         }, 
         HitRoll = 6, 
         Height = 0, 
         Position = "standing", 
         Vnum = 31531, 
         Credits = 0, 
         DamRoll = 6, 
      }, 
      [31532] = 
      {
         Sex = "undistinguished", 
         NumberOfAttacks = 0, 
         Level = 1, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         DefaultPosition = "standing", 
         ArmorClass = 0, 
         Description = "", 
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
         Stats = 
         {
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Force = 0, 
            Luck = 10, 
         }, 
         Race = "Human", 
         Weight = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         ShortDescr = "Gep", 
         LongDescr = "Gep Stands here selling you food for your travels.\
", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "all_greet_prog", 
               Code = "if ispc($n)\
    say Hello customer.\
    say I have everything you need just type \"list\".\
endif\
", 
               ScriptType = "MProg", 
               Arguments = "100", 
            }, 
         }, 
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
            KeeperShortDescr = "Gep", 
            ProfitSell = 100, 
            BusinessHours = 
            {
               Close = 23, 
               Open = 1, 
            }, 
            ProfitBuy = 110, 
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
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         Name = "Gep", 
         HitRoll = 0, 
         Height = 0, 
         Position = "standing", 
         Vnum = 31532, 
         Credits = 0, 
         DamRoll = 0, 
      }, 
      [31533] = 
      {
         Sex = "male", 
         NumberOfAttacks = 0, 
         Level = 20, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         DefaultPosition = "standing", 
         ArmorClass = 50, 
         Description = "Taller than most Sullustans, the pump maintenance mechanic appears to be\
in decent shape. His ears is also larger than usual, and his eyes are dark\
and gleaming.\
", 
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
         Stats = 
         {
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Force = 0, 
            Luck = 10, 
         }, 
         Race = "Sullustan", 
         Weight = 0, 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 2, 
         }, 
         ShortDescr = "a pump mechanic", 
         LongDescr = "A Sullustan pump maintenance mechanic seems to be goofing off here.\
", 
         HitChance = 
         {
            HitPlus = 200, 
            HitNoDice = 4, 
            HitSizeDice = 10, 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         Name = "Sullustan pump mechanic", 
         HitRoll = 4, 
         Height = 0, 
         Position = "standing", 
         Vnum = 31533, 
         Credits = 200, 
         DamRoll = 4, 
      }, 
      [31534] = 
      {
         Sex = "undistinguished", 
         NumberOfAttacks = 0, 
         Level = 20, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         DefaultPosition = "standing", 
         ArmorClass = 50, 
         Description = "A tatoo-rat is a small rodent with brown fur and a long tail.\
", 
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
         Stats = 
         {
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Force = 0, 
            Luck = 10, 
         }, 
         Race = "Rodent", 
         Weight = 0, 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 2, 
         }, 
         ShortDescr = "a tatoo-rat", 
         LongDescr = "A tatoo-rat seems to be searching for food.\
", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "death_prog", 
               Code = "-- Drop loot on death\
if rand(50)\
    -- Low-quality rodent skin\
    mpoload 31533\
endif\
", 
               ScriptType = "MProg", 
               Arguments = "100", 
            }, 
         }, 
         HitChance = 
         {
            HitPlus = 200, 
            HitNoDice = 4, 
            HitSizeDice = 10, 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         Name = "tatoo-rat", 
         HitRoll = 4, 
         Height = 0, 
         Position = "standing", 
         Vnum = 31534, 
         Credits = 0, 
         DamRoll = 4, 
      }, 
      [31535] = 
      {
         Sex = "male", 
         NumberOfAttacks = 0, 
         Level = 100, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [10] = "Practice", 
            [30] = "Prototype", 
            [9] = "Train", 
         }, 
         DefaultPosition = "standing", 
         ArmorClass = -150, 
         Description = "", 
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
         Stats = 
         {
            Intelligence = 10, 
            Dexterity = 25, 
            Strength = 25, 
            Wisdom = 10, 
            Charisma = 10, 
            Constitution = 25, 
            Force = 0, 
            Luck = 10, 
         }, 
         Race = "Human", 
         Weight = 0, 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 10, 
         }, 
         ShortDescr = "a retired merc", 
         LongDescr = "A retired merc is here, eager to teach the next generation.\
", 
         HitChance = 
         {
            HitPlus = 20000, 
            HitNoDice = 20, 
            HitSizeDice = 10, 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         Name = "retired merc", 
         HitRoll = 20, 
         Height = 0, 
         Position = "standing", 
         Vnum = 31535, 
         Credits = 0, 
         DamRoll = 20, 
      }, 
      [31536] = 
      {
         Sex = "male", 
         NumberOfAttacks = 0, 
         Level = 100, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [10] = "Practice", 
            [30] = "Prototype", 
            [9] = "Train", 
         }, 
         DefaultPosition = "standing", 
         ArmorClass = -150, 
         Description = "", 
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
         Stats = 
         {
            Intelligence = 25, 
            Dexterity = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Force = 0, 
            Luck = 10, 
         }, 
         Race = "Zabrak", 
         Weight = 0, 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 10, 
         }, 
         ShortDescr = "an experienced zabrak engineer", 
         LongDescr = "An experienced zabrak engineer teaches basic engineering skills.\
", 
         HitChance = 
         {
            HitPlus = 20000, 
            HitNoDice = 20, 
            HitSizeDice = 10, 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         Name = "experienced zabrak engineer", 
         HitRoll = 20, 
         Height = 0, 
         Position = "standing", 
         Vnum = 31536, 
         Credits = 0, 
         DamRoll = 20, 
      }, 
      [31537] = 
      {
         Sex = "male", 
         NumberOfAttacks = 0, 
         Level = 100, 
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
         DefaultPosition = "standing", 
         ArmorClass = -150, 
         Description = "", 
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
         Stats = 
         {
            Intelligence = 25, 
            Dexterity = 10, 
            Strength = 10, 
            Wisdom = 25, 
            Charisma = 25, 
            Constitution = 10, 
            Force = 0, 
            Luck = 10, 
         }, 
         Race = "Rodian", 
         Weight = 0, 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 10, 
         }, 
         ShortDescr = "Mayor Mikdanyell Guh'rantt", 
         LongDescr = "Mayor Mikdanyell Guh'rantt is here.\
", 
         HitChance = 
         {
            HitPlus = 20000, 
            HitNoDice = 20, 
            HitSizeDice = 10, 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         Name = "Mayor Mikdanyell Guh'rantt", 
         HitRoll = 20, 
         Height = 0, 
         Position = "standing", 
         Vnum = 31537, 
         Credits = 0, 
         DamRoll = 20, 
      }, 
      [31538] = 
      {
         Sex = "male", 
         NumberOfAttacks = 0, 
         Level = 100, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [10] = "Practice", 
            [30] = "Prototype", 
            [9] = "Train", 
         }, 
         DefaultPosition = "standing", 
         ArmorClass = -150, 
         Description = "", 
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
         Stats = 
         {
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Force = 0, 
            Luck = 20, 
         }, 
         Race = "Bothan", 
         Weight = 0, 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 10, 
         }, 
         ShortDescr = "a Bothan smuggler", 
         LongDescr = "A Bothan smuggler is enjoying some downtime.\
", 
         HitChance = 
         {
            HitPlus = 20000, 
            HitNoDice = 20, 
            HitSizeDice = 10, 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         Name = "Bothan smuggler", 
         HitRoll = 20, 
         Height = 0, 
         Position = "standing", 
         Vnum = 31538, 
         Credits = 0, 
         DamRoll = 20, 
      }, 
      [31539] = 
      {
         Sex = "male", 
         NumberOfAttacks = 0, 
         Level = 100, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [9] = "Train", 
            [10] = "Practice", 
            [25] = "NoKill", 
         }, 
         DefaultPosition = "standing", 
         ArmorClass = -150, 
         Description = "", 
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
         Stats = 
         {
            Intelligence = 10, 
            Dexterity = 25, 
            Strength = 10, 
            Wisdom = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Force = 0, 
            Luck = 10, 
         }, 
         Race = "Duros", 
         Weight = 0, 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 10, 
         }, 
         ShortDescr = "the facility manager", 
         LongDescr = "The facility manager is doing some paperwork.\
", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "all_greet_prog", 
               Code = "if ispc($n)\
    if level($n) <= 25\
        say Welcome. I can give you some basic flight lessons if you want.\
    endif\
endif\
", 
               ScriptType = "MProg", 
               Arguments = "100", 
            }, 
            [2] = 
            {
               MudProgType = "speech_prog", 
               Code = "if ispc($n)\
    say Great. Just type PRACTICE and we can get down to business.\
endif\
", 
               ScriptType = "MProg", 
               Arguments = "p yes", 
            }, 
         }, 
         HitChance = 
         {
            HitPlus = 20000, 
            HitNoDice = 20, 
            HitSizeDice = 10, 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         Name = "facility manager", 
         HitRoll = 20, 
         Height = 0, 
         Position = "standing", 
         Vnum = 31539, 
         Credits = 0, 
         DamRoll = 20, 
      }, 
      [31540] = 
      {
         Sex = "male", 
         NumberOfAttacks = 0, 
         Level = 20, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         DefaultPosition = "standing", 
         ArmorClass = 50, 
         Description = "The rill is a lizard native to Tatooine. It looks much like a scyk, with\
spines along its back and very sharp teeth. But it's not aggressive\
unless attacked.\
", 
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
         Stats = 
         {
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Force = 0, 
            Luck = 10, 
         }, 
         Race = "Reptile", 
         Weight = 0, 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 8, 
            DamNoDice = 4, 
         }, 
         ShortDescr = "a rill", 
         LongDescr = "A docile rill is wandering the dunes.\
", 
         HitChance = 
         {
            HitPlus = 400, 
            HitNoDice = 4, 
            HitSizeDice = 10, 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         Name = "rill", 
         HitRoll = 4, 
         Height = 0, 
         Position = "standing", 
         Vnum = 31540, 
         Credits = 0, 
         DamRoll = 4, 
      }, 
      [31541] = 
      {
         Sex = "undistinguished", 
         NumberOfAttacks = 0, 
         Level = 25, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         DefaultPosition = "standing", 
         ArmorClass = 37, 
         Description = "The dewback is a large reptile native to Tatooine, frequently used as a\
beast of burden. It has thick, scaly, green skin and four clawed feet.\
", 
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
         Stats = 
         {
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Force = 0, 
            Luck = 10, 
         }, 
         Race = "Dewback", 
         Weight = 0, 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 2, 
         }, 
         ShortDescr = "a dewback", 
         LongDescr = "A large, green-skinned dewback roams the sands. \
", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Code = "if rand(50)\
    emote makes a strange, lowing noise.\
else\
    emote licks $s back with $s flicking tongue.\
endif\
", 
               ScriptType = "MProg", 
               Arguments = "3", 
            }, 
         }, 
         HitChance = 
         {
            HitPlus = 500, 
            HitNoDice = 5, 
            HitSizeDice = 10, 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         Name = "Dewback", 
         HitRoll = 5, 
         Height = 0, 
         Position = "standing", 
         Vnum = 31541, 
         Credits = 0, 
         DamRoll = 5, 
      }, 
      [31542] = 
      {
         Sex = "undistinguished", 
         NumberOfAttacks = 0, 
         Level = 20, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         DefaultPosition = "standing", 
         ArmorClass = 50, 
         Description = "", 
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
         Stats = 
         {
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Force = 0, 
            Luck = 10, 
         }, 
         Race = "Creature", 
         Weight = 0, 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 2, 
         }, 
         ShortDescr = "a worrt", 
         LongDescr = "A worrt is sitting here perfectly still.\
", 
         SpecFuns = 
         {
            [0] = "spec_poison", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Code = "emote catches an insect with $s long tongue, then swallows it followed by a loud belch.\
", 
               ScriptType = "MProg", 
               Arguments = "3", 
            }, 
         }, 
         HitChance = 
         {
            HitPlus = 200, 
            HitNoDice = 4, 
            HitSizeDice = 10, 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         Name = "Worrt", 
         HitRoll = 4, 
         Height = 0, 
         Position = "standing", 
         Vnum = 31542, 
         Credits = 0, 
         DamRoll = 4, 
      }, 
      [31900] = 
      {
         Sex = "male", 
         NumberOfAttacks = 0, 
         Level = 100, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [10] = "Practice", 
            [30] = "Prototype", 
            [9] = "Train", 
         }, 
         DefaultPosition = "standing", 
         ArmorClass = -150, 
         Description = "Zim is a middle-aged male human with silvery stripes in his dark brown hair.\
His stomach is bulging over a leather belt that has a lightsaber hanging from\
it. \
\
In his younger days, during the Clone Wars, he was an apprentice to a minor\
Jedi Master. Unfortunately Zim never quite had the talent to pass the Jedi\
trials, and when Order 66 was issued, he was somehow overlooked. Since then\
he's been in hiding, seeking to pass on what little he learned. \
", 
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
         Stats = 
         {
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Wisdom = 25, 
            Charisma = 10, 
            Constitution = 10, 
            Force = 20, 
            Luck = 10, 
         }, 
         Race = "Human", 
         Weight = 0, 
         Name = "zim failed jedi", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "all_greet_prog", 
               Code = "from mobs.zim import *\
def on_greet(zim, actor):\
    zim_on_greet(zim, actor)\
", 
               ScriptType = "Imp", 
               Arguments = "100", 
            }, 
            [2] = 
            {
               MudProgType = "rand_prog", 
               Code = "from mobs.zim import *\
def on_rand(zim):\
    zim_on_rand(zim)\
", 
               ScriptType = "Imp", 
               Arguments = "3", 
            }, 
         }, 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 10, 
         }, 
         ShortDescr = "Zim the Failed Jedi", 
         LongDescr = "Zim the Failed Jedi stands here before you.\
", 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
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
            KeeperShortDescr = "Zim the Failed Jedi", 
            ProfitSell = 90, 
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
            ProfitBuy = 120, 
         }, 
         HitChance = 
         {
            HitPlus = 15000, 
            HitNoDice = 20, 
            HitSizeDice = 10, 
         }, 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         HitRoll = 20, 
         Height = 0, 
         Position = "standing", 
         Vnum = 31900, 
         Credits = 0, 
         DamRoll = 20, 
      }, 
      [31902] = 
      {
         Sex = "male", 
         NumberOfAttacks = 0, 
         Level = 1, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         DefaultPosition = "standing", 
         ArmorClass = 0, 
         Description = "", 
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
         Stats = 
         {
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Force = 0, 
            Luck = 10, 
         }, 
         Race = "Human", 
         Weight = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         ShortDescr = "a disillusioned student", 
         LongDescr = "A disillusioned student is doing chores.\
", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "greet_prog", 
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
               ScriptType = "Imp", 
               Arguments = "100", 
            }, 
         }, 
         HitChance = 
         {
            HitPlus = 0, 
            HitNoDice = 10, 
            HitSizeDice = 100, 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         Name = "disillusioned student", 
         HitRoll = 0, 
         Height = 0, 
         Position = "standing", 
         Vnum = 31902, 
         Credits = 0, 
         DamRoll = 0, 
      }, 
      [31901] = 
      {
         Sex = "male", 
         NumberOfAttacks = 0, 
         Level = 20, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
         }, 
         DefaultPosition = "standing", 
         ArmorClass = 50, 
         Description = "This young Jedi apprentice has long, brown hair in a low ponytail. His bland\
facial features are covered by a cropped beard. He's wearing plain clothes to\
blend in with the Mos Eisley population. Wearing Jedi robes would be very\
risky these days.\
", 
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
         Stats = 
         {
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Force = 0, 
            Luck = 10, 
         }, 
         Race = "Human", 
         Weight = 0, 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 2, 
         }, 
         ShortDescr = "a Jedi sparring partner", 
         LongDescr = "A Jedi sparring partner looks eager for action.\
", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Code = "from mobs.jedisparringpartner import *\
def on_rand(mob):\
    jsp_on_rand(mob)\
", 
               ScriptType = "Imp", 
               Arguments = "10", 
            }, 
            [2] = 
            {
               MudProgType = "speech_prog", 
               Code = "from mobs.jedisparringpartner import *\
def on_speech(mob, actor, txt):\
    jsp_on_speech(mob, actor, txt)\
", 
               ScriptType = "Imp", 
               Arguments = "p disarm me", 
            }, 
            [3] = 
            {
               MudProgType = "all_greet_prog", 
               Code = "from mobs.jedisparringpartner import *\
def on_greet(mob, actor):\
    jsp_on_greet(mob, actor)\
", 
               ScriptType = "Imp", 
               Arguments = "100", 
            }, 
         }, 
         HitChance = 
         {
            HitPlus = 10000, 
            HitNoDice = 4, 
            HitSizeDice = 10, 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         Name = "jedi sparring partner", 
         HitRoll = 4, 
         Height = 0, 
         Position = "standing", 
         Vnum = 31901, 
         Credits = 0, 
         DamRoll = 4, 
      }, 
      [31999] = 
      {
         Sex = "undistinguished", 
         NumberOfAttacks = 0, 
         Level = 1, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         DefaultPosition = "standing", 
         ArmorClass = 0, 
         Description = "", 
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
         Stats = 
         {
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Charisma = 10, 
            Constitution = 10, 
            Force = 0, 
            Luck = 10, 
         }, 
         Race = "Human", 
         Weight = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         ShortDescr = "a newly created lastmob", 
         LongDescr = "Some god abandoned a newly created lastmob here.\
", 
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
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         Name = "lastmob", 
         HitRoll = 0, 
         Height = 0, 
         Position = "standing", 
         Vnum = 31999, 
         Credits = 0, 
         DamRoll = 0, 
      }, 
   }, 
   HighEconomy = 0, 
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
         High = 105, 
      }, 
   }, 
   Resets = 
   {
      [1] = 
      {
         Arg1 = 31500, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31767, 
         MiscData = 1, 
      }, 
      [2] = 
      {
         Arg1 = 31500, 
         Command = "E", 
         Arg2 = 100, 
         Arg3 = 0, 
         MiscData = 1, 
      }, 
      [3] = 
      {
         Arg1 = 31501, 
         Command = "O", 
         Arg2 = 100, 
         Arg3 = 31756, 
         MiscData = 1, 
      }, 
      [4] = 
      {
         Arg1 = 31501, 
         Command = "O", 
         Arg2 = 100, 
         Arg3 = 31756, 
         MiscData = 1, 
      }, 
      [5] = 
      {
         Arg1 = 31500, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31756, 
         MiscData = 1, 
      }, 
      [6] = 
      {
         Arg1 = 31500, 
         Command = "E", 
         Arg2 = 100, 
         Arg3 = 0, 
         MiscData = 1, 
      }, 
      [7] = 
      {
         Arg1 = 31501, 
         Command = "O", 
         Arg2 = 100, 
         Arg3 = 31759, 
         MiscData = 1, 
      }, 
      [8] = 
      {
         Arg1 = 31501, 
         Command = "O", 
         Arg2 = 100, 
         Arg3 = 31758, 
         MiscData = 1, 
      }, 
      [9] = 
      {
         Arg1 = 31501, 
         Command = "O", 
         Arg2 = 100, 
         Arg3 = 31758, 
         MiscData = 1, 
      }, 
      [10] = 
      {
         Arg1 = 31501, 
         Command = "O", 
         Arg2 = 100, 
         Arg3 = 31758, 
         MiscData = 1, 
      }, 
      [11] = 
      {
         Arg1 = 31502, 
         Command = "O", 
         Arg2 = 100, 
         Arg3 = 31588, 
         MiscData = 1, 
      }, 
      [12] = 
      {
         Arg1 = 31502, 
         Command = "O", 
         Arg2 = 100, 
         Arg3 = 31588, 
         MiscData = 1, 
      }, 
      [13] = 
      {
         Arg1 = 31502, 
         Command = "O", 
         Arg2 = 100, 
         Arg3 = 31588, 
         MiscData = 1, 
      }, 
      [14] = 
      {
         Arg1 = 31503, 
         Command = "O", 
         Arg2 = 100, 
         Arg3 = 31806, 
         MiscData = 1, 
      }, 
      [15] = 
      {
         Arg1 = 31503, 
         Command = "O", 
         Arg2 = 100, 
         Arg3 = 31806, 
         MiscData = 1, 
      }, 
      [16] = 
      {
         Arg1 = 31502, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31806, 
         MiscData = 1, 
      }, 
      [17] = 
      {
         Arg1 = 31504, 
         Command = "E", 
         Arg2 = 100, 
         Arg3 = 0, 
         MiscData = 1, 
      }, 
      [18] = 
      {
         Arg1 = 31505, 
         Command = "E", 
         Arg2 = 100, 
         Arg3 = 6, 
         MiscData = 1, 
      }, 
      [19] = 
      {
         Arg1 = 31505, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31831, 
         MiscData = 1, 
      }, 
      [20] = 
      {
         Arg1 = 31508, 
         Command = "O", 
         Arg2 = 100, 
         Arg3 = 31833, 
         MiscData = 1, 
      }, 
      [21] = 
      {
         Arg1 = 31511, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31837, 
         MiscData = 1, 
      }, 
      [22] = 
      {
         Arg1 = 31511, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31837, 
         MiscData = 1, 
      }, 
      [23] = 
      {
         Arg1 = 31511, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31837, 
         MiscData = 1, 
      }, 
      [24] = 
      {
         Arg1 = 31511, 
         Command = "E", 
         Arg2 = 100, 
         Arg3 = 16, 
         MiscData = 1, 
      }, 
      [25] = 
      {
         Arg1 = 31510, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31838, 
         MiscData = 1, 
      }, 
      [26] = 
      {
         Arg1 = 31508, 
         Command = "O", 
         Arg2 = 100, 
         Arg3 = 31831, 
         MiscData = 1, 
      }, 
      [27] = 
      {
         Arg1 = 31514, 
         Command = "O", 
         Arg2 = 100, 
         Arg3 = 31612, 
         MiscData = 1, 
      }, 
      [28] = 
      {
         Arg1 = 31517, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31847, 
         MiscData = 1, 
      }, 
      [29] = 
      {
         Arg1 = 31516, 
         Command = "E", 
         Arg2 = 100, 
         Arg3 = 6, 
         MiscData = 1, 
      }, 
      [30] = 
      {
         Arg1 = 31515, 
         Command = "E", 
         Arg2 = 100, 
         Arg3 = 13, 
         MiscData = 1, 
      }, 
      [31] = 
      {
         Arg1 = 31850, 
         Command = "D", 
         Arg2 = 5, 
         Arg3 = 2, 
         MiscData = 1, 
      }, 
      [32] = 
      {
         Arg1 = 31518, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31851, 
         MiscData = 1, 
      }, 
      [33] = 
      {
         Arg1 = 31517, 
         Command = "E", 
         Arg2 = 100, 
         Arg3 = 16, 
         MiscData = 1, 
      }, 
      [34] = 
      {
         Arg1 = 31515, 
         Command = "M", 
         Arg2 = 4, 
         Arg3 = 31852, 
         MiscData = 1, 
      }, 
      [35] = 
      {
         Arg1 = 31515, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31852, 
         MiscData = 1, 
      }, 
      [36] = 
      {
         Arg1 = 31515, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31852, 
         MiscData = 1, 
      }, 
      [37] = 
      {
         Arg1 = 31515, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31852, 
         MiscData = 1, 
      }, 
      [38] = 
      {
         Arg1 = 31515, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31852, 
         MiscData = 1, 
      }, 
      [39] = 
      {
         Arg1 = 31515, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31852, 
         MiscData = 1, 
      }, 
      [40] = 
      {
         Arg1 = 31512, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31715, 
         MiscData = 1, 
      }, 
      [41] = 
      {
         Arg1 = 31512, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31715, 
         MiscData = 1, 
      }, 
      [42] = 
      {
         Arg1 = 31513, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31715, 
         MiscData = 1, 
      }, 
      [43] = 
      {
         Arg1 = 31514, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31715, 
         MiscData = 1, 
      }, 
      [44] = 
      {
         Arg1 = 31513, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31715, 
         MiscData = 1, 
      }, 
      [45] = 
      {
         Arg1 = 31516, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31715, 
         MiscData = 1, 
      }, 
      [46] = 
      {
         Arg1 = 31516, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31715, 
         MiscData = 1, 
      }, 
      [47] = 
      {
         Arg1 = 31519, 
         Command = "O", 
         Arg2 = 100, 
         Arg3 = 31853, 
         MiscData = 1, 
      }, 
      [48] = 
      {
         Arg1 = 31519, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31863, 
         MiscData = 1, 
      }, 
      [49] = 
      {
         Arg1 = 31520, 
         Command = "O", 
         Arg2 = 100, 
         Arg3 = 31863, 
         MiscData = 1, 
      }, 
      [50] = 
      {
         Arg1 = 31520, 
         Command = "M", 
         Arg2 = 12, 
         Arg3 = 31871, 
         MiscData = 1, 
      }, 
      [51] = 
      {
         Arg1 = 31520, 
         Command = "M", 
         Arg2 = 12, 
         Arg3 = 31871, 
         MiscData = 1, 
      }, 
      [52] = 
      {
         Arg1 = 31520, 
         Command = "M", 
         Arg2 = 12, 
         Arg3 = 31871, 
         MiscData = 1, 
      }, 
      [53] = 
      {
         Arg1 = 31520, 
         Command = "M", 
         Arg2 = 12, 
         Arg3 = 31871, 
         MiscData = 1, 
      }, 
      [54] = 
      {
         Arg1 = 31520, 
         Command = "M", 
         Arg2 = 12, 
         Arg3 = 31871, 
         MiscData = 1, 
      }, 
      [55] = 
      {
         Arg1 = 31520, 
         Command = "M", 
         Arg2 = 12, 
         Arg3 = 31871, 
         MiscData = 1, 
      }, 
      [56] = 
      {
         Arg1 = 31501, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31817, 
         MiscData = 1, 
      }, 
      [57] = 
      {
         Arg1 = 31509, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 12, 
         MiscData = 1, 
      }, 
      [58] = 
      {
         Arg1 = 10314, 
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
      }, 
      [59] = 
      {
         Arg1 = 31504, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31861, 
         MiscData = 1, 
      }, 
      [60] = 
      {
         Arg1 = 31527, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31861, 
         MiscData = 1, 
      }, 
      [61] = 
      {
         Arg1 = 31507, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31861, 
         MiscData = 1, 
      }, 
      [62] = 
      {
         Arg1 = 31526, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31862, 
         MiscData = 1, 
      }, 
      [63] = 
      {
         Arg1 = 31521, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31862, 
         MiscData = 1, 
      }, 
      [64] = 
      {
         Arg1 = 31524, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31862, 
         MiscData = 1, 
      }, 
      [65] = 
      {
         Arg1 = 31525, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31857, 
         MiscData = 1, 
      }, 
      [66] = 
      {
         Arg1 = 31506, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31857, 
         MiscData = 1, 
      }, 
      [67] = 
      {
         Arg1 = 31527, 
         Command = "M", 
         Arg2 = 2, 
         Arg3 = 31854, 
         MiscData = 1, 
      }, 
      [68] = 
      {
         Arg1 = 31523, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31854, 
         MiscData = 1, 
      }, 
      [69] = 
      {
         Arg1 = 31525, 
         Command = "M", 
         Arg2 = 2, 
         Arg3 = 31854, 
         MiscData = 1, 
      }, 
      [70] = 
      {
         Arg1 = 31528, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31854, 
         MiscData = 1, 
      }, 
      [71] = 
      {
         Arg1 = 31526, 
         Command = "M", 
         Arg2 = 2, 
         Arg3 = 31856, 
         MiscData = 1, 
      }, 
      [72] = 
      {
         Arg1 = 31528, 
         Command = "M", 
         Arg2 = 2, 
         Arg3 = 31856, 
         MiscData = 1, 
      }, 
      [73] = 
      {
         Arg1 = 31529, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31858, 
         MiscData = 1, 
      }, 
      [74] = 
      {
         Arg1 = 31520, 
         Command = "M", 
         Arg2 = 13, 
         Arg3 = 31855, 
         MiscData = 1, 
      }, 
      [75] = 
      {
         Arg1 = 31524, 
         Command = "M", 
         Arg2 = 2, 
         Arg3 = 31855, 
         MiscData = 1, 
      }, 
      [76] = 
      {
         Arg1 = 31503, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31653, 
         MiscData = 1, 
      }, 
      [77] = 
      {
         Arg1 = 31514, 
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 31840, 
         MiscData = 1, 
      }, 
      [78] = 
      {
         Arg1 = 31520, 
         Command = "M", 
         Arg2 = 19, 
         Arg3 = 31870, 
         MiscData = 1, 
      }, 
      [79] = 
      {
         Arg1 = 31520, 
         Command = "M", 
         Arg2 = 19, 
         Arg3 = 31870, 
         MiscData = 1, 
      }, 
      [80] = 
      {
         Arg1 = 31520, 
         Command = "M", 
         Arg2 = 19, 
         Arg3 = 31870, 
         MiscData = 1, 
      }, 
      [81] = 
      {
         Arg1 = 31520, 
         Command = "M", 
         Arg2 = 19, 
         Arg3 = 31870, 
         MiscData = 1, 
      }, 
      [82] = 
      {
         Arg1 = 31520, 
         Command = "M", 
         Arg2 = 19, 
         Arg3 = 31870, 
         MiscData = 1, 
      }, 
      [83] = 
      {
         Arg1 = 31520, 
         Command = "M", 
         Arg2 = 19, 
         Arg3 = 31870, 
         MiscData = 1, 
      }, 
      [84] = 
      {
         Arg1 = 31521, 
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 31830, 
         MiscData = 1, 
      }, 
      [85] = 
      {
         Arg1 = 31531, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31875, 
         MiscData = 1, 
      }, 
      [86] = 
      {
         Arg1 = 31504, 
         Command = "M", 
         Arg2 = 100, 
         Arg3 = 31601, 
         MiscData = 0, 
      }, 
      [87] = 
      {
         Arg1 = 31504, 
         Command = "M", 
         Arg2 = 100, 
         Arg3 = 31602, 
         MiscData = 0, 
      }, 
      [88] = 
      {
         Arg1 = 31504, 
         Command = "M", 
         Arg2 = 100, 
         Arg3 = 31603, 
         MiscData = 0, 
      }, 
      [89] = 
      {
         Arg1 = 31504, 
         Command = "M", 
         Arg2 = 100, 
         Arg3 = 31604, 
         MiscData = 0, 
      }, 
      [90] = 
      {
         Arg1 = 31504, 
         Command = "M", 
         Arg2 = 100, 
         Arg3 = 31819, 
         MiscData = 0, 
      }, 
      [91] = 
      {
         Arg1 = 31504, 
         Command = "M", 
         Arg2 = 100, 
         Arg3 = 31821, 
         MiscData = 0, 
      }, 
      [92] = 
      {
         Arg1 = 31504, 
         Command = "M", 
         Arg2 = 100, 
         Arg3 = 31822, 
         MiscData = 0, 
      }, 
      [93] = 
      {
         Arg1 = 31504, 
         Command = "M", 
         Arg2 = 100, 
         Arg3 = 31824, 
         MiscData = 0, 
      }, 
      [94] = 
      {
         Arg1 = 31504, 
         Command = "M", 
         Arg2 = 100, 
         Arg3 = 31828, 
         MiscData = 0, 
      }, 
      [95] = 
      {
         Arg1 = 31504, 
         Command = "M", 
         Arg2 = 100, 
         Arg3 = 31829, 
         MiscData = 0, 
      }, 
      [96] = 
      {
         Arg1 = 31504, 
         Command = "M", 
         Arg2 = 100, 
         Arg3 = 31830, 
         MiscData = 0, 
      }, 
      [97] = 
      {
         Arg1 = 31504, 
         Command = "M", 
         Arg2 = 100, 
         Arg3 = 31832, 
         MiscData = 0, 
      }, 
      [98] = 
      {
         Arg1 = 31504, 
         Command = "M", 
         Arg2 = 100, 
         Arg3 = 31834, 
         MiscData = 0, 
      }, 
      [99] = 
      {
         Arg1 = 31504, 
         Command = "M", 
         Arg2 = 100, 
         Arg3 = 31835, 
         MiscData = 0, 
      }, 
      [100] = 
      {
         Arg1 = 31504, 
         Command = "M", 
         Arg2 = 100, 
         Arg3 = 31837, 
         MiscData = 0, 
      }, 
      [101] = 
      {
         Arg1 = 31503, 
         Command = "M", 
         Arg2 = 20, 
         Arg3 = 31601, 
         MiscData = 0, 
      }, 
      [102] = 
      {
         Arg1 = 31503, 
         Command = "M", 
         Arg2 = 20, 
         Arg3 = 31602, 
         MiscData = 0, 
      }, 
      [103] = 
      {
         Arg1 = 31503, 
         Command = "M", 
         Arg2 = 20, 
         Arg3 = 31603, 
         MiscData = 0, 
      }, 
      [104] = 
      {
         Arg1 = 31503, 
         Command = "M", 
         Arg2 = 20, 
         Arg3 = 31604, 
         MiscData = 0, 
      }, 
      [105] = 
      {
         Arg1 = 31503, 
         Command = "M", 
         Arg2 = 20, 
         Arg3 = 31653, 
         MiscData = 0, 
      }, 
      [106] = 
      {
         Arg1 = 31503, 
         Command = "M", 
         Arg2 = 20, 
         Arg3 = 31840, 
         MiscData = 0, 
      }, 
      [107] = 
      {
         Arg1 = 31532, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31883, 
         MiscData = 1, 
      }, 
      [108] = 
      {
         Arg1 = 328, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31863, 
         MiscData = 0, 
      }, 
      [109] = 
      {
         Arg1 = 55, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 16, 
         MiscData = 1, 
      }, 
      [110] = 
      {
         Arg1 = 31900, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31905, 
         MiscData = 1, 
      }, 
      [111] = 
      {
         Arg1 = 10323, 
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
      }, 
      [112] = 
      {
         Arg1 = 10324, 
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
      }, 
      [113] = 
      {
         Arg1 = 31525, 
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 31899, 
         MiscData = 1, 
      }, 
      [114] = 
      {
         Arg1 = 31526, 
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 31900, 
         MiscData = 1, 
      }, 
      [115] = 
      {
         Arg1 = 31527, 
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 31998, 
         MiscData = 0, 
      }, 
      [116] = 
      {
         Arg1 = 31528, 
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 31997, 
         MiscData = 0, 
      }, 
      [117] = 
      {
         Arg1 = 31901, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31909, 
         MiscData = 1, 
      }, 
      [118] = 
      {
         Arg1 = 10323, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 16, 
         MiscData = 1, 
      }, 
      [119] = 
      {
         Arg1 = 31902, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31901, 
         MiscData = 1, 
      }, 
      [120] = 
      {
         Arg1 = 31529, 
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 31901, 
         MiscData = 1, 
      }, 
      [121] = 
      {
         Arg1 = 31522, 
         Command = "P", 
         Arg2 = 1, 
         Arg3 = 0, 
         MiscData = 0, 
      }, 
      [122] = 
      {
         Arg1 = 31524, 
         Command = "P", 
         Arg2 = 1, 
         Arg3 = 0, 
         MiscData = 1, 
      }, 
      [123] = 
      {
         Arg1 = 31530, 
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 31902, 
         MiscData = 1, 
      }, 
      [124] = 
      {
         Arg1 = 31533, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31503, 
         MiscData = 1, 
      }, 
      [125] = 
      {
         Arg1 = 32210, 
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
      }, 
      [126] = 
      {
         Arg1 = 31532, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 5, 
         MiscData = 1, 
      }, 
      [127] = 
      {
         Arg1 = 31531, 
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 31503, 
         MiscData = 1, 
      }, 
      [128] = 
      {
         Arg1 = 31534, 
         Command = "M", 
         Arg2 = 2, 
         Arg3 = 31502, 
         MiscData = 1, 
      }, 
      [129] = 
      {
         Arg1 = 31534, 
         Command = "M", 
         Arg2 = 2, 
         Arg3 = 31502, 
         MiscData = 1, 
      }, 
      [130] = 
      {
         Arg1 = 31534, 
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 31623, 
         MiscData = 1, 
      }, 
      [131] = 
      {
         Arg1 = 31623, 
         Command = "D", 
         Arg2 = 2, 
         Arg3 = 2, 
         MiscData = 0, 
      }, 
      [132] = 
      {
         Arg1 = 31534, 
         Command = "M", 
         Arg2 = 3, 
         Arg3 = 31908, 
         MiscData = 1, 
      }, 
      [133] = 
      {
         Arg1 = 31535, 
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 31908, 
         MiscData = 1, 
      }, 
      [134] = 
      {
         Arg1 = 31535, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31626, 
         MiscData = 1, 
      }, 
      [135] = 
      {
         Arg1 = 31536, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31632, 
         MiscData = 1, 
      }, 
      [136] = 
      {
         Arg1 = 31537, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31636, 
         MiscData = 1, 
      }, 
      [137] = 
      {
         Arg1 = 31538, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31857, 
         MiscData = 0, 
      }, 
      [138] = 
      {
         Arg1 = 31539, 
         Command = "M", 
         Arg2 = 31612, 
         Arg3 = 31612, 
         MiscData = 0, 
      }, 
      [139] = 
      {
         Arg1 = 31638, 
         Command = "D", 
         Arg2 = 0, 
         Arg3 = 1, 
         MiscData = 0, 
      }, 
      [140] = 
      {
         Arg1 = 31639, 
         Command = "D", 
         Arg2 = 2, 
         Arg3 = 1, 
         MiscData = 0, 
      }, 
      [141] = 
      {
         Arg1 = 31641, 
         Command = "D", 
         Arg2 = 5, 
         Arg3 = 1, 
         MiscData = 0, 
      }, 
      [142] = 
      {
         Arg1 = 31644, 
         Command = "D", 
         Arg2 = 4, 
         Arg3 = 1, 
         MiscData = 0, 
      }, 
      [143] = 
      {
         Arg1 = 31536, 
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 31640, 
         MiscData = 1, 
      }, 
      [144] = 
      {
         Arg1 = 31537, 
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 31645, 
         MiscData = 1, 
      }, 
      [145] = 
      {
         Arg1 = 31538, 
         Command = "P", 
         Arg2 = 1, 
         Arg3 = 0, 
         MiscData = 0, 
      }, 
      [146] = 
      {
         Arg1 = 31541, 
         Command = "M", 
         Arg2 = 2, 
         Arg3 = 31676, 
         MiscData = 1, 
      }, 
      [147] = 
      {
         Arg1 = 31520, 
         Command = "M", 
         Arg2 = 15, 
         Arg3 = 31676, 
         MiscData = 1, 
      }, 
      [148] = 
      {
         Arg1 = 31540, 
         Command = "M", 
         Arg2 = 2, 
         Arg3 = 31676, 
         MiscData = 1, 
      }, 
      [149] = 
      {
         Arg1 = 31542, 
         Command = "M", 
         Arg2 = 2, 
         Arg3 = 31676, 
         MiscData = 1, 
      }, 
      [150] = 
      {
         Arg1 = 31541, 
         Command = "M", 
         Arg2 = 3, 
         Arg3 = 31567, 
         MiscData = 1, 
      }, 
      [151] = 
      {
         Arg1 = 31520, 
         Command = "M", 
         Arg2 = 16, 
         Arg3 = 31567, 
         MiscData = 1, 
      }, 
      [152] = 
      {
         Arg1 = 31540, 
         Command = "M", 
         Arg2 = 3, 
         Arg3 = 31567, 
         MiscData = 1, 
      }, 
      [153] = 
      {
         Arg1 = 31542, 
         Command = "M", 
         Arg2 = 3, 
         Arg3 = 31567, 
         MiscData = 1, 
      }, 
      [154] = 
      {
         Arg1 = 31541, 
         Command = "M", 
         Arg2 = 4, 
         Arg3 = 31812, 
         MiscData = 1, 
      }, 
      [155] = 
      {
         Arg1 = 31520, 
         Command = "M", 
         Arg2 = 17, 
         Arg3 = 31812, 
         MiscData = 1, 
      }, 
      [156] = 
      {
         Arg1 = 31540, 
         Command = "M", 
         Arg2 = 4, 
         Arg3 = 31812, 
         MiscData = 1, 
      }, 
      [157] = 
      {
         Arg1 = 31542, 
         Command = "M", 
         Arg2 = 4, 
         Arg3 = 31812, 
         MiscData = 1, 
      }, 
      [158] = 
      {
         Arg1 = 31541, 
         Command = "M", 
         Arg2 = 5, 
         Arg3 = 31511, 
         MiscData = 1, 
      }, 
      [159] = 
      {
         Arg1 = 31520, 
         Command = "M", 
         Arg2 = 18, 
         Arg3 = 31511, 
         MiscData = 1, 
      }, 
      [160] = 
      {
         Arg1 = 31540, 
         Command = "M", 
         Arg2 = 5, 
         Arg3 = 31511, 
         MiscData = 1, 
      }, 
      [161] = 
      {
         Arg1 = 31542, 
         Command = "M", 
         Arg2 = 5, 
         Arg3 = 31511, 
         MiscData = 1, 
      }, 
      [162] = 
      {
         Arg1 = 31541, 
         Command = "M", 
         Arg2 = 6, 
         Arg3 = 31555, 
         MiscData = 1, 
      }, 
      [163] = 
      {
         Arg1 = 31520, 
         Command = "M", 
         Arg2 = 19, 
         Arg3 = 31555, 
         MiscData = 1, 
      }, 
      [164] = 
      {
         Arg1 = 31540, 
         Command = "M", 
         Arg2 = 6, 
         Arg3 = 31555, 
         MiscData = 1, 
      }, 
      [165] = 
      {
         Arg1 = 31542, 
         Command = "M", 
         Arg2 = 6, 
         Arg3 = 31555, 
         MiscData = 1, 
      }, 
      [166] = 
      {
         Arg1 = 31541, 
         Command = "M", 
         Arg2 = 7, 
         Arg3 = 31553, 
         MiscData = 1, 
      }, 
      [167] = 
      {
         Arg1 = 31520, 
         Command = "M", 
         Arg2 = 20, 
         Arg3 = 31553, 
         MiscData = 1, 
      }, 
      [168] = 
      {
         Arg1 = 31540, 
         Command = "M", 
         Arg2 = 7, 
         Arg3 = 31553, 
         MiscData = 1, 
      }, 
      [169] = 
      {
         Arg1 = 31542, 
         Command = "M", 
         Arg2 = 7, 
         Arg3 = 31553, 
         MiscData = 1, 
      }, 
      [170] = 
      {
         Arg1 = 31541, 
         Command = "M", 
         Arg2 = 8, 
         Arg3 = 31520, 
         MiscData = 1, 
      }, 
      [171] = 
      {
         Arg1 = 31520, 
         Command = "M", 
         Arg2 = 21, 
         Arg3 = 31520, 
         MiscData = 1, 
      }, 
      [172] = 
      {
         Arg1 = 31540, 
         Command = "M", 
         Arg2 = 8, 
         Arg3 = 31520, 
         MiscData = 1, 
      }, 
      [173] = 
      {
         Arg1 = 31542, 
         Command = "M", 
         Arg2 = 8, 
         Arg3 = 31520, 
         MiscData = 1, 
      }, 
      [174] = 
      {
         Arg1 = 31541, 
         Command = "M", 
         Arg2 = 9, 
         Arg3 = 31575, 
         MiscData = 1, 
      }, 
      [175] = 
      {
         Arg1 = 31520, 
         Command = "M", 
         Arg2 = 22, 
         Arg3 = 31575, 
         MiscData = 1, 
      }, 
      [176] = 
      {
         Arg1 = 31540, 
         Command = "M", 
         Arg2 = 9, 
         Arg3 = 31575, 
         MiscData = 1, 
      }, 
      [177] = 
      {
         Arg1 = 31542, 
         Command = "M", 
         Arg2 = 9, 
         Arg3 = 31575, 
         MiscData = 1, 
      }, 
      [178] = 
      {
         Arg1 = 31541, 
         Command = "M", 
         Arg2 = 10, 
         Arg3 = 31584, 
         MiscData = 1, 
      }, 
      [179] = 
      {
         Arg1 = 31520, 
         Command = "M", 
         Arg2 = 23, 
         Arg3 = 31584, 
         MiscData = 1, 
      }, 
      [180] = 
      {
         Arg1 = 31540, 
         Command = "M", 
         Arg2 = 10, 
         Arg3 = 31584, 
         MiscData = 1, 
      }, 
      [181] = 
      {
         Arg1 = 31542, 
         Command = "M", 
         Arg2 = 10, 
         Arg3 = 31584, 
         MiscData = 1, 
      }, 
      [182] = 
      {
         Arg1 = 31541, 
         Command = "M", 
         Arg2 = 11, 
         Arg3 = 31666, 
         MiscData = 1, 
      }, 
      [183] = 
      {
         Arg1 = 31520, 
         Command = "M", 
         Arg2 = 24, 
         Arg3 = 31666, 
         MiscData = 1, 
      }, 
      [184] = 
      {
         Arg1 = 31540, 
         Command = "M", 
         Arg2 = 11, 
         Arg3 = 31666, 
         MiscData = 1, 
      }, 
      [185] = 
      {
         Arg1 = 31542, 
         Command = "M", 
         Arg2 = 11, 
         Arg3 = 31666, 
         MiscData = 1, 
      }, 
      [186] = 
      {
         Arg1 = 31541, 
         Command = "M", 
         Arg2 = 12, 
         Arg3 = 31700, 
         MiscData = 1, 
      }, 
      [187] = 
      {
         Arg1 = 31520, 
         Command = "M", 
         Arg2 = 25, 
         Arg3 = 31700, 
         MiscData = 1, 
      }, 
      [188] = 
      {
         Arg1 = 31540, 
         Command = "M", 
         Arg2 = 12, 
         Arg3 = 31700, 
         MiscData = 1, 
      }, 
      [189] = 
      {
         Arg1 = 31542, 
         Command = "M", 
         Arg2 = 12, 
         Arg3 = 31700, 
         MiscData = 1, 
      }, 
      [190] = 
      {
         Arg1 = 31541, 
         Command = "M", 
         Arg2 = 13, 
         Arg3 = 31692, 
         MiscData = 1, 
      }, 
      [191] = 
      {
         Arg1 = 31520, 
         Command = "M", 
         Arg2 = 26, 
         Arg3 = 31692, 
         MiscData = 1, 
      }, 
      [192] = 
      {
         Arg1 = 31540, 
         Command = "M", 
         Arg2 = 13, 
         Arg3 = 31692, 
         MiscData = 1, 
      }, 
      [193] = 
      {
         Arg1 = 31542, 
         Command = "M", 
         Arg2 = 13, 
         Arg3 = 31692, 
         MiscData = 1, 
      }, 
      [194] = 
      {
         Arg1 = 31541, 
         Command = "M", 
         Arg2 = 14, 
         Arg3 = 31689, 
         MiscData = 1, 
      }, 
      [195] = 
      {
         Arg1 = 31520, 
         Command = "M", 
         Arg2 = 27, 
         Arg3 = 31689, 
         MiscData = 1, 
      }, 
      [196] = 
      {
         Arg1 = 31540, 
         Command = "M", 
         Arg2 = 14, 
         Arg3 = 31689, 
         MiscData = 1, 
      }, 
      [197] = 
      {
         Arg1 = 31542, 
         Command = "M", 
         Arg2 = 14, 
         Arg3 = 31689, 
         MiscData = 1, 
      }, 
      [198] = 
      {
         Arg1 = 31541, 
         Command = "M", 
         Arg2 = 14, 
         Arg3 = 31685, 
         MiscData = 1, 
      }, 
      [199] = 
      {
         Arg1 = 31520, 
         Command = "M", 
         Arg2 = 27, 
         Arg3 = 31685, 
         MiscData = 1, 
      }, 
      [200] = 
      {
         Arg1 = 31540, 
         Command = "M", 
         Arg2 = 14, 
         Arg3 = 31685, 
         MiscData = 1, 
      }, 
      [201] = 
      {
         Arg1 = 31542, 
         Command = "M", 
         Arg2 = 14, 
         Arg3 = 31685, 
         MiscData = 1, 
      }, 
      [202] = 
      {
         Arg1 = 31541, 
         Command = "M", 
         Arg2 = 15, 
         Arg3 = 31708, 
         MiscData = 1, 
      }, 
      [203] = 
      {
         Arg1 = 31520, 
         Command = "M", 
         Arg2 = 28, 
         Arg3 = 31708, 
         MiscData = 1, 
      }, 
      [204] = 
      {
         Arg1 = 31540, 
         Command = "M", 
         Arg2 = 15, 
         Arg3 = 31708, 
         MiscData = 1, 
      }, 
      [205] = 
      {
         Arg1 = 31542, 
         Command = "M", 
         Arg2 = 15, 
         Arg3 = 31708, 
         MiscData = 1, 
      }, 
      [206] = 
      {
         Arg1 = 31541, 
         Command = "M", 
         Arg2 = 16, 
         Arg3 = 31704, 
         MiscData = 1, 
      }, 
      [207] = 
      {
         Arg1 = 31520, 
         Command = "M", 
         Arg2 = 29, 
         Arg3 = 31704, 
         MiscData = 1, 
      }, 
      [208] = 
      {
         Arg1 = 31540, 
         Command = "M", 
         Arg2 = 16, 
         Arg3 = 31704, 
         MiscData = 1, 
      }, 
      [209] = 
      {
         Arg1 = 31542, 
         Command = "M", 
         Arg2 = 16, 
         Arg3 = 31704, 
         MiscData = 1, 
      }, 
      [210] = 
      {
         Arg1 = 31541, 
         Command = "M", 
         Arg2 = 17, 
         Arg3 = 31727, 
         MiscData = 1, 
      }, 
      [211] = 
      {
         Arg1 = 31520, 
         Command = "M", 
         Arg2 = 30, 
         Arg3 = 31727, 
         MiscData = 1, 
      }, 
      [212] = 
      {
         Arg1 = 31540, 
         Command = "M", 
         Arg2 = 17, 
         Arg3 = 31727, 
         MiscData = 1, 
      }, 
      [213] = 
      {
         Arg1 = 31542, 
         Command = "M", 
         Arg2 = 17, 
         Arg3 = 31727, 
         MiscData = 1, 
      }, 
   }, 
   FileFormatVersion = 1, 
   Rooms = 
   {
      [31744] = 
      {
         TeleVnum = 0, 
         Sector = "mountain", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You can smell an odour developing around you.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31745, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31743, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Jundland Wastes", 
         Vnum = 31744, 
      }, 
      [31745] = 
      {
         TeleVnum = 0, 
         Sector = "mountain", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You stand on a hard rocky surface. The air around you is very unpleasant.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31744, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Jundland Wastes", 
         Vnum = 31745, 
      }, 
      [31746] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "You are walking down a long, narrow hallway which turns at the end.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31747, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31735, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Long Hallway", 
         Vnum = 31746, 
         Tag = "", 
      }, 
      [31747] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "You are walking down a hallway. It is old and there is a rather digusting\
smell all around you.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31748, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31746, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Hallway Through Jabba's Palace", 
         Vnum = 31747, 
         Tag = "", 
      }, 
      [31748] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "You are standing in a hallway. To each side all along the hall there are\
small individual rooms.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31749, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31747, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Long Hallway in Jabba's Palace", 
         Vnum = 31748, 
         Tag = "", 
      }, 
      [31749] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "You are coming to the end of the hallway which curves both to the east and\
to the west.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31750, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31748, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Long Hallway End", 
         Vnum = 31749, 
         Tag = "", 
      }, 
      [31750] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "You are in a small narrow hallway which has a very disgusting odour, not\
surprising considering what creatures and animals have lived here in the past\
and even now. The ground is cool and hard full of ripples as if never crafted\
or taken care of.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31751, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31749, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31770, 
               Distance = 0, 
               Description = "", 
            }, 
            [4] = 
            {
               Key = -1, 
               Direction = "up", 
               Keyword = "", 
               DestinationVnum = 31788, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Narrow Hallway", 
         Vnum = 31750, 
         Tag = "", 
      }, 
      [31751] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "You are standing in a hallway facing east. As you look down the hallway at\
the end you can see different colored lights flashing in the dimness and the\
darkness. The ground is rough and the air is hot and heavy. Above a burnt out\
glowpanel lays motionless but you can still see pretty well.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31768, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31752, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31769, 
               Distance = 0, 
               Description = "", 
            }, 
            [4] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31750, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Hallway Facing A Dark Room", 
         Vnum = 31751, 
         Tag = "", 
      }, 
      [31752] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "You are walking down a narrow hallway. To each side there are very small rooms\
which are vacant.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31766, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31753, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31767, 
               Distance = 0, 
               Description = "", 
            }, 
            [4] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31751, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Narrow Hallway ", 
         Vnum = 31752, 
         Tag = "", 
      }, 
      [31753] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "You are walking down a hallway towards a very large opening. It appears not\
to be guarded or have a door in place. The ground beneath you is hard and full\
of cracks and uneven places. The air is heavy and hot but nothing that cannot\
be lived with.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31764, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31754, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31765, 
               Distance = 0, 
               Description = "", 
            }, 
            [4] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31752, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "A Long Hallway ", 
         Vnum = 31753, 
         Tag = "", 
      }, 
      [31754] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "You approach the dark room at the end of the hallway with every step you\
take. To you sides you continually see small occupied rooms. The ground\
beneath your feet is rough and uneven making you feet ache all over. The\
lighting here is minimal but you can still see down the hall.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31762, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31755, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31763, 
               Distance = 0, 
               Description = "", 
            }, 
            [4] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31753, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "End Of Hallway Before A Large Room", 
         Vnum = 31754, 
         Tag = "", 
      }, 
      [31755] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "You are standing in front of a very large room with different sections in it.\
The entrance used to have doors but as you can see they have been removed for\
all that remains is the hinges.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31760, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31756, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31761, 
               Distance = 0, 
               Description = "", 
            }, 
            [4] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31754, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "In Front Of A Large Room", 
         Vnum = 31755, 
         Tag = "", 
      }, 
      [31756] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [0] = "Dark", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
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
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31759, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31757, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31755, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Brain Jar Room", 
         Vnum = 31756, 
         Tag = "", 
      }, 
      [31757] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [0] = "Dark", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "All around you there are brains in jars. As you walk by they start screaming.\
As they scream the lights on the jars change color indicating that they are\
not calm at all. In front of you there is a row of containing shelves with\
jars gently placed on them.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31758, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31756, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Brain Room", 
         Vnum = 31757, 
         Tag = "", 
      }, 
      [31758] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [0] = "Dark", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "You are walking down a row. To your sides shelves are filled with brains from\
all species of the galaxy. These jars seem to be a bit calmer for their lights\
are not flaring off when you pass by them. this shows they are mature and\
prepared to be put into a body of some sort, most likely a spiderwalker.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31757, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Brain Compartment", 
         Vnum = 31758, 
         Tag = "", 
      }, 
      [31759] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [0] = "Dark", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "You are standing in a row with shelves in it. On each shelf jars have been\
placed carefully to ensure that they are safe and will not fall to the ground\
and break. The air is crisp and provides stability as you stare longly at the\
large amounts of jars.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31756, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Row Of Jars", 
         Vnum = 31759, 
         Tag = "", 
      }, 
      [31760] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "You are standing in small room which was initially designed to home a person.\
It has a window facing the sun.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31755, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Old Room", 
         Vnum = 31760, 
         Tag = "", 
      }, 
      [31761] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "You are standing in room. It has dust all over it for it has not been used\
for many, many years.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31755, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Dusty Old Room", 
         Vnum = 31761, 
         Tag = "", 
      }, 
      [31762] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "This is a larger room. It was probably designed to hold a larger species.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31754, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Large Guest Room", 
         Vnum = 31762, 
         Tag = "", 
      }, 
      [31763] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "The room you are standing in is very small room. It has a window in the\
corner and an old bedframe in the corner which seems to have been destroyed by\
small rodents.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31754, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Old Small Calibered Room", 
         Vnum = 31763, 
         Tag = "", 
      }, 
      [31764] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "You are standing in an extremely small room that was designed to hold a\
cleaning droid or two.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31753, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Storage Compartment For Droids", 
         Vnum = 31764, 
         Tag = "", 
      }, 
      [31765] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "You are in a large room. It was made for a larger type species. It is used to\
house and for sleeping. This room has a very disgusting odour.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31753, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Large Specimen Room", 
         Vnum = 31765, 
         Tag = "", 
      }, 
      [31766] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "You are standing in a small room with a window facing the great sand dune\
sea.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31752, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Small Unused Room", 
         Vnum = 31766, 
         Tag = "", 
      }, 
      [31767] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "You are standing in a room which seems to be habitated. There is a small bed\
in the corner with a window mounted on the wall which looks outside.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31752, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Habitated Room", 
         Vnum = 31767, 
         Tag = "", 
      }, 
      [31768] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "You are in a room of small caliber. You feel enclosed as you look around the\
room.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31751, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Small Enclosed Room", 
         Vnum = 31768, 
         Tag = "", 
      }, 
      [31769] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "You are standing in a bedroom. It is not habitated but could be.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31751, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Unhabitated Room", 
         Vnum = 31769, 
         Tag = "", 
      }, 
      [31770] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "You walk down a long narrow hallway which floor is covered with stone and\
provides discomfort for your feet. To each side you can see some small and\
large rooms all with different uses. There is a glowpanel above your head\
barely functioning providing the dimmest of light all over.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31750, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31771, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Long Hallway", 
         Vnum = 31770, 
         Tag = "", 
      }, 
      [31771] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "The hallway you walk down is on an uneven\
surface, it has ripples all along it and provides not much for heat or for\
comfort. There is no lighting here but you can still see down the gloomy\
hallway but not always with ease.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31770, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31772, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "A Hallway Passage", 
         Vnum = 31771, 
         Tag = "", 
      }, 
      [31772] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "As you walk down the hallway on a cool stone floor you smell an odour, a\
rather unpleasant one, but having been in this palace it is no surprise that\
this smell is located here. The hallway is gloomy and the floor has a rough\
texture as if never smoothed out.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31782, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31771, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31784, 
               Distance = 0, 
               Description = "", 
            }, 
            [4] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31773, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Dense Hallway", 
         Vnum = 31772, 
         Tag = "", 
      }, 
      [31773] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "The ground beneath your feet is made of pure stone, rather cold at night and\
still cool in the day the stone is what covers all the palace floors. You can\
see the end of the hallway just ahead of yourself. Large and without any\
features. Just a simple stone wall.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31780, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31772, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31781, 
               Distance = 0, 
               Description = "", 
            }, 
            [4] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31774, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Long Narrowed Hallway", 
         Vnum = 31773, 
         Tag = "", 
      }, 
      [31774] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
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
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31778, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31773, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31779, 
               Distance = 0, 
               Description = "", 
            }, 
            [4] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31775, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Hallway Leading To Individual Rooms", 
         Vnum = 31774, 
         Tag = "", 
      }, 
      [31775] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "You are standing at the end of the hallway. There is a very large stone wall\
before you covering your way further down the hallway. The stone wall is\
thick and rough with different textures all over its surface.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31776, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31774, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31777, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "End Of A Long Hallway", 
         Vnum = 31775, 
         Tag = "", 
      }, 
      [31776] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "You are standing in room of very small caliber. It was probably constructed to\
hold extra blankets. There are closets all along the walls.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31775, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Extra Small Compartment Room", 
         Vnum = 31776, 
         Tag = "", 
      }, 
      [31777] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "You are in a large room. It was probably used as a sleeping quarter. There is\
a small bed in the corner which has been chewed away at by a small rodent.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31775, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Large Old Room", 
         Vnum = 31777, 
         Tag = "", 
      }, 
      [31778] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "You are in a well sized room. It was used as a living quarters in the past.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31774, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Well Sized Room", 
         Vnum = 31778, 
         Tag = "", 
      }, 
      [31779] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "You are standing in a living quarters. It is currently habitated. You can\
tell because of food on the floor.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31774, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Habitated Living Quarters", 
         Vnum = 31779, 
         Tag = "", 
      }, 
      [31780] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "You are standing in a small room used to store extra supplies.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31773, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Supply Storage", 
         Vnum = 31780, 
         Tag = "", 
      }, 
      [31781] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "You are in a very large room. It was made as a living quaters. There is a\
large window in front of you.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31773, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Large Living Quarters", 
         Vnum = 31781, 
         Tag = "", 
      }, 
      [31782] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "You are in a smaller room. It can be used for any purpose.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31772, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Small Room", 
         Vnum = 31782, 
         Tag = "", 
      }, 
      [31784] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "You are standing in a large room. There is a bed that can hold any species\
and a large window on the back wall.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31772, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Large Room", 
         Vnum = 31784, 
         Tag = "", 
      }, 
      [31788] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "You are standing at the top of a staircase. In front of you there is a long\
hallway. Along the hallway many prison cells are there because Jabba use them\
for keeping people of unimportance.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31789, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "down", 
               Keyword = "", 
               DestinationVnum = 31750, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Top Of Staircase", 
         Vnum = 31788, 
         Tag = "", 
      }, 
      [31789] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "You are walking down the hallway. As you walk along you notice that all of\
the doors have been removed.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31788, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31790, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Prison Hallway", 
         Vnum = 31789, 
         Tag = "", 
      }, 
      [31790] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "You are in the hallway. It ends just up ahead making it a rather short\
corridor.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31789, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31794, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31791, 
               Distance = 0, 
               Description = "", 
            }, 
            [4] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31795, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Prison Hallway", 
         Vnum = 31790, 
         Tag = "", 
      }, 
      [31791] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "You have come to the end of the hall. A stone wall lays in front of you,\
preventing you from advancing.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31790, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31792, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31793, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Prison Hallway End", 
         Vnum = 31791, 
         Tag = "", 
      }, 
      [31792] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "You are standing in a prison cell. If you turn back there are metal bars\
across the wall. All around you the only furniture in this cell is a prison\
bed.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31791, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Small Prison Cell", 
         Vnum = 31792, 
         Tag = "", 
      }, 
      [31793] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "You are standing in a large prison cell. This cell was used for larger\
specimens. It has a toilet and a small bunk in the corner.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31791, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Large Prison Cell", 
         Vnum = 31793, 
         Tag = "", 
      }, 
      [31794] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "You are standing in the smallest cell. This cell was used to hold very small\
specimens of life.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31790, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Extremely Small Cell", 
         Vnum = 31794, 
         Tag = "", 
      }, 
      [31795] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "You are standing in a very large prison cell. It scares you to think what was\
kept in here. There is an awful smell.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31790, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Very Large Prison Cell", 
         Vnum = 31795, 
         Tag = "", 
      }, 
      [31796] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Tunnel = 0, 
         Description = "You just fell down the trapdoor into the rancor's pit. Here there is a very\
disgusting smell. This room is immense. To the north is the smaller\
compartment the rancor was kept in while his cage was cleaned.\
", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Rancor's Pit", 
         Vnum = 31796, 
         Tag = "", 
      }, 
      [31797] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Tunnel = 0, 
         Description = "You get crushed by gate and die(d.t)\
", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Name = "DT", 
         Vnum = 31797, 
         Tag = "", 
      }, 
      [31798] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "You just slid down the chute into the rancor's cage. The room is an immense\
room and has a very foul odour to it. To the north the smaller room lays which\
the rancor was put when the cage was cleaned.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31799, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "up", 
               Keyword = "", 
               DestinationVnum = 31733, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Rancor's Cage", 
         Vnum = 31798, 
         Tag = "", 
      }, 
      [31799] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "EDIT\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31798, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "DT", 
         Vnum = 31799, 
         Tag = "", 
      }, 
      [31800] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "You are standing in front of hallway which leads down into the rancor pit. To\
the south is the kitchen. To continue down the hall go east.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31733, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31802, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31801, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Hallway to Rancor Pit", 
         Vnum = 31800, 
         Tag = "", 
      }, 
      [31801] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "You are standing inside the kitchen that is used to make Jabba the Hutt's\
disgusting foods. There is a table in the center of the room with a cutting\
board and extra utensils. On the wall there are many shelves and utensils\
layed everywhere.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31800, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Jabba's Palace's Kitchen", 
         Vnum = 31801, 
         Tag = "", 
      }, 
      [31802] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "You are walking down a hall which passes the docking bay and many living\
quarters.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31803, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31800, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Hallway Past Docking Bay", 
         Vnum = 31802, 
         Tag = "", 
      }, 
      [31803] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "You are standing in front of one of many rooms located on the bottom level.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31802, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Hallway Past A Room", 
         Vnum = 31803, 
         Tag = "", 
      }, 
      [31804] = 
      {
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Tunnel = 0, 
         Description = "You are standing on a rather small sized landing pad. It can be used to keep\
smaller sized vehicles of any origin.\
", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Landing Pad 6", 
         Vnum = 31804, 
         Tag = "", 
      }, 
      [31805] = 
      {
         TeleVnum = 0, 
         Sector = "mountain", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are standing at the top of a high cliff. As you look downwards it is not a\
far drop but what scares you is that you would land on sharp jagged stones of\
all shapes and sizes. As you look the other way there is a steep cliff. If you\
can climb it go ahead.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31589, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "up", 
               Keyword = "", 
               DestinationVnum = 31806, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Rocky Cliff", 
         Vnum = 31805, 
      }, 
      [31806] = 
      {
         TeleVnum = 0, 
         Sector = "mountain", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are standing in the middle of a Krayt Dragon's nest. It does not smell\
particularly good. A large female krayt towers over you here wondering what\
you are doing.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "down", 
               Keyword = "", 
               DestinationVnum = 31805, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Krayt Nest", 
         Vnum = 31806, 
      }, 
      [31807] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "All around you is sand and shiny dunes piling as high as you can see. As far\
as you can guess anything could be behind there. The towering sand dunes make\
you feel scared as you are so small and enclosed by the towering heaps of\
sand.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31501, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31808, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31807, 
      }, 
      [31808] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are walking along the hot sand heated by the twin suns of Tatooine. The\
ground beneath you is hardening gradually as you walk over it or is it just\
your imagination?\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31809, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31807, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31812, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Deserty Path", 
         Vnum = 31808, 
      }, 
      [31809] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You walk along a large area covered with sand. This sand seems to have\
hardened gradually over the years and is now almost of the consistency of\
sandstone. To the west the sand slopes downward in many directions. \
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31814, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31808, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31810, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Hard Sandy Area", 
         Vnum = 31809, 
      }, 
      [31810] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are standing on top of very hard sand, yet maybe even rock covered with\
sand. As you look westwards you see the dune sea stop abruptly and plummet\
downwards. I wonder why.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31809, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31811, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Sandy Surface", 
         Vnum = 31810, 
      }, 
      [31811] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are standing on the edge of a very steep drop that falls directly into the\
heart of what looks to be a colony of some sorts. You would not want to fall\
down this cliff for it is a ways down.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31810, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Overseeing A Small Colony.", 
         Vnum = 31811, 
      }, 
      [31812] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are walking on one of the only things on this planet. Sand. It is nice and\
soft but some patches of hardened sand can bee seen all around.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31808, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31813, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Flat Area", 
         Vnum = 31812, 
      }, 
      [31813] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You look about, look from the direction you came, nothing, nothing at all but\
sand. You wonder how much of this stuff could there possibly be?\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31812, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31813, 
      }, 
      [31814] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "As the ground beaneath your feet is in a transition from sand to rock\
it seems to be versatile and flakes away in some areas with every\
step that you take on it. Northward you see all the sand is no longer\
there but it is totally a rock surface.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31815, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31809, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Unstable Ground", 
         Vnum = 31814, 
      }, 
      [31815] = 
      {
         TeleVnum = 0, 
         Sector = "mountain", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
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
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31814, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "down", 
               Keyword = "", 
               DestinationVnum = 31816, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Rocky Area", 
         Vnum = 31815, 
      }, 
      [31816] = 
      {
         TeleVnum = 0, 
         Sector = "mountain", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are on a pathway facing a severe angle which makes it so that\
there is not much room to move around without falling downwards\
towards flat ground. To the east there is a small cave in the side of\
a cliff. If you continue downwards you will be entering the city.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31817, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "up", 
               Keyword = "", 
               DestinationVnum = 31815, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "down", 
               Keyword = "", 
               DestinationVnum = 31818, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Side Of Steep Path", 
         Vnum = 31816, 
      }, 
      [31817] = 
      {
         TeleVnum = 0, 
         Sector = "mountain", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
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
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31816, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Water Shack", 
         Vnum = 31817, 
         Tag = "", 
      }, 
      [31818] = 
      {
         TeleVnum = 0, 
         Sector = "mountain", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Tunnel = 0, 
         Description = "You are standing on the same level most of this city is based on. All\
around tere are small shops and tents set up quickly used for\
merchandising goods to any passers.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31819, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31870, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "up", 
               Keyword = "", 
               DestinationVnum = 31816, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Entering The City", 
         Vnum = 31818, 
         Tag = "", 
      }, 
      [31819] = 
      {
         TeleVnum = 0, 
         Sector = "mountain", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
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
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31818, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31849, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31820, 
               Distance = 0, 
               Description = "", 
            }, 
            [4] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31851, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Path In The City", 
         Vnum = 31819, 
      }, 
      [31820] = 
      {
         TeleVnum = 0, 
         Sector = "mountain", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
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
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31819, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31821, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Dusty Path", 
         Vnum = 31820, 
      }, 
      [31821] = 
      {
         TeleVnum = 0, 
         Sector = "mountain", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
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
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31820, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31822, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Path", 
         Vnum = 31821, 
      }, 
      [31822] = 
      {
         TeleVnum = 0, 
         Sector = "mountain", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
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
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31821, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Keyword = "", 
               DestinationVnum = 31823, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Directly In Front Of The Jawa Fortress", 
         Vnum = 31822, 
      }, 
      [31823] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "You are standing in a very large room. It was built plainly and simply\
and there are no signs of art even from their own culture in this\
room. There are some narrow corridors in many directions leading to\
different parts of the fortress.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Keyword = "", 
               DestinationVnum = 31822, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31827, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31824, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Entrance To Jawa Fortress", 
         Vnum = 31823, 
         Tag = "", 
      }, 
      [31824] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
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
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31823, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31825, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "A Narrow Hallway", 
         Vnum = 31824, 
         Tag = "", 
      }, 
      [31825] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
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
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31824, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31829, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Hallway", 
         Vnum = 31825, 
         Tag = "", 
      }, 
      [31827] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
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
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31828, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31823, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "A Large Room", 
         Vnum = 31827, 
         Tag = "", 
      }, 
      [31828] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "You are standing in room #31828.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31827, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "A room", 
         Vnum = 31828, 
         Tag = "", 
      }, 
      [31829] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "You are standing in an enormous room. There are small bags, matresses\
and all sorts of small things all over the room layed about. There\
are a few Jawas young and old roaming these hallways. This here room\
is used for more of a storage place and not for eating.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31825, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31832, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31830, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Large Room", 
         Vnum = 31829, 
         Tag = "", 
      }, 
      [31830] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
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
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31829, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "down", 
               Keyword = "", 
               DestinationVnum = 31831, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "somewhere", 
               Flags = 
               {
                  [17] = "CanEnter", 
                  [11] = "Hidden", 
               }, 
               Keyword = "bed", 
               DestinationVnum = 31876, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Quarters", 
         Vnum = 31830, 
         Tag = "", 
      }, 
      [31831] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
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
               Key = -1, 
               Direction = "up", 
               Keyword = "", 
               DestinationVnum = 31830, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Small Room", 
         Vnum = 31831, 
         Tag = "", 
      }, 
      [31832] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "You are standing in a simple room. Designed and built with ease this room\
posed no problem to the people that built it. It is extremely dark in here and\
not much is visible to the plain eye. The ground is cold and stiff and makes\
your feet feel cold as you walk over it.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31833, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31829, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Entrance", 
         Vnum = 31832, 
         Tag = "", 
      }, 
      [31833] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "You are at an intersection. You may go either east or west and explore this\
vast place. In both directions the small corridors lighten up further down.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31832, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31839, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31834, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Intersection", 
         Vnum = 31833, 
         Tag = "", 
      }, 
      [31834] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "You are standing in a think gloomy hallway. Towards the south you can hear\
the sounds of discussion and occasional laughter. The ground is cool and soft\
for it is not dried by the everydays suns of Tatooine. The hallway is a gloomy\
place and makes you think twice before you do anything.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31833, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31835, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Hallway", 
         Vnum = 31834, 
         Tag = "", 
      }, 
      [31835] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "You reach the end of the small and tight gloomy hallway and see a few\
guardians discussing near a heavily guarded door leading into a large room\
with someone, or something, important inside of it.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31834, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31836, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "End Of Hallway", 
         Vnum = 31835, 
         Tag = "", 
      }, 
      [31836] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
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
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31837, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31835, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Opening", 
         Vnum = 31836, 
         Tag = "", 
      }, 
      [31837] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
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
               Key = -1, 
               Direction = "east", 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [5] = "PickProof", 
                  [23] = "BashProof", 
               }, 
               Keyword = "", 
               DestinationVnum = 31838, 
               Distance = 1, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31836, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Entrance", 
         Vnum = 31837, 
         Tag = "", 
      }, 
      [31838] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
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
               Key = -1, 
               Direction = "west", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Keyword = "", 
               DestinationVnum = 31837, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Chambers", 
         Vnum = 31838, 
         Tag = "", 
      }, 
      [31839] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "You are standing in a hallway leading to a stone wall. At the end of the hall\
the hallway itself curves toward the south leaving only two way to go, south\
and back from where you came.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31833, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Hallway", 
         Vnum = 31839, 
         Tag = "", 
      }, 
      [31840] = 
      {
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are standing on a large pile of junk. People throw things they dont need\
here just to get rid of it. But for some people this place is where they can\
get everything they need to start out. Everything from scrap metal to blasters\
are here waiting for anyone to pick them up.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31653, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Neighberhood Junk Pile", 
         Vnum = 31840, 
      }, 
      [31841] = 
      {
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
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
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31872, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31842, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31605, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Entrance To Docking Bay 94", 
         Vnum = 31841, 
      }, 
      [31842] = 
      {
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
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
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31841, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Keyword = "", 
               DestinationVnum = 31843, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Inside The Entrance To Docking Bay 92", 
         Vnum = 31842, 
      }, 
      [31843] = 
      {
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
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
               Key = -1, 
               Direction = "north", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Keyword = "", 
               DestinationVnum = 31842, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31847, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Inside Docking Bay 92", 
         Vnum = 31843, 
         Tag = "", 
      }, 
      [31846] = 
      {
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Tunnel = 0, 
         Description = "", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Floating in a void", 
         Vnum = 31846, 
         Tag = "", 
      }, 
      [31847] = 
      {
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [4] = "CanLand", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
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
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31843, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Docking Bay 92", 
         Vnum = 31847, 
         Tag = "", 
      }, 
      [31849] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
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
               Key = -1, 
               Direction = "east", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Keyword = "", 
               DestinationVnum = 31850, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31819, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Hundo's Shop", 
         Vnum = 31849, 
         Tag = "", 
      }, 
      [31850] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
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
               Key = -1, 
               Direction = "west", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Keyword = "", 
               DestinationVnum = 31849, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Back Of The Shop", 
         Vnum = 31850, 
         Tag = "", 
      }, 
      [31851] = 
      {
         TeleVnum = 0, 
         Sector = "mountain", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are standing in front of some large fences. Inside these fences are kept\
many rontos, the animal that Jawas ride to go to different areas. There is a\
rather tall Jawa at the gate entry with an ionization gun ready to shoot any\
thieves or trespassers.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31819, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Keyword = "", 
               DestinationVnum = 31852, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "In Front Of A Large Keeping Area", 
         Vnum = 31851, 
      }, 
      [31852] = 
      {
         TeleVnum = 0, 
         Sector = "mountain", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
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
               Key = -1, 
               Direction = "east", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Keyword = "", 
               DestinationVnum = 31851, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Ronto Keeping Area", 
         Vnum = 31852, 
      }, 
      [31853] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "You are standing in the entrance to the well known cantina. Here some of the\
filthiest and richest scum hang around. Watch your step. Mounted on the wall is\
a droid detector. For here in this cantina they do not serve their kind.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31655, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31854, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Entrance To The Cantina", 
         Vnum = 31853, 
         Tag = "", 
      }, 
      [31854] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "You are facing the bar slowly. With small booths all around filled with\
people talking. Wuher slowly pours drinks for his customers being careful not\
to get hurt. The floor is poorly covered and the walls filled with blaster\
marks and other such things from fights and encounters.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31853, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31855, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31856, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Interior Of The Cantina", 
         Vnum = 31854, 
         Tag = "", 
      }, 
      [31855] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "Most of this section is rather empty for it leads the entrance into the\
cantina. For the other part there is a few tables with some stools and chairs\
but for the most part they are empty as for people seem to have adopted a\
liking towards the booths.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31858, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31859, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31854, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Large Open Way", 
         Vnum = 31855, 
         Tag = "", 
      }, 
      [31856] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
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
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31854, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31861, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31857, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "A Large Section Of The Cantina", 
         Vnum = 31856, 
         Tag = "", 
      }, 
      [31857] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [10] = "Safe", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
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
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31856, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "A Small Booth", 
         Vnum = 31857, 
         Tag = "", 
      }, 
      [31858] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
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
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31855, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "A Large Double Booth", 
         Vnum = 31858, 
         Tag = "", 
      }, 
      [31859] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "This room is located on the far side of the cantina, beside one of the\
small corner booths towards the west. The floor is dirty, filled with blood in\
some places from a recent fight. The air is full of smoke as people walk\
around you, some smoking hookahs.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31855, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31860, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "A Section Of The Cantina", 
         Vnum = 31859, 
         Tag = "", 
      }, 
      [31860] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
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
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31859, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "A Very Small Booth", 
         Vnum = 31860, 
         Tag = "", 
      }, 
      [31861] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "You are standing in an open area filled with tables. To the east the bar\
stands. Chairs all around filled with different people and different species.\
The chairs themselves are rather dirty and so most people stand. The smell\
here is not too bad but not a beautiful one neither.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31856, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "east", 
               Flags = 
               {
                  [0] = "IsDoor", 
                  [17] = "CanEnter", 
                  [18] = "CanLeave", 
                  [26] = "CanLook", 
                  [23] = "BashProof", 
               }, 
               Keyword = "Counter", 
               DestinationVnum = 31863, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31862, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Section Of The Cantina", 
         Vnum = 31861, 
         Tag = "", 
      }, 
      [31862] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
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
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31861, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "A Corner Booth", 
         Vnum = 31862, 
         Tag = "", 
      }, 
      [31863] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "You are standing in front of Wuher, the man who serves drinks to people here.\
The beverage machine is very large and complex but seems to be efficient in\
the way it works. AS he sees you he gets angry. Maybe you should run.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "west", 
               Flags = 
               {
                  [0] = "IsDoor", 
                  [5] = "PickProof", 
               }, 
               Keyword = "counter", 
               DestinationVnum = 31861, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "up", 
               Keyword = "", 
               DestinationVnum = 31618, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Inside The Bar", 
         Vnum = 31863, 
         Tag = "", 
      }, 
      [31870] = 
      {
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
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
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31818, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31871, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Inside A Large Cave", 
         Vnum = 31870, 
         Tag = "", 
      }, 
      [31871] = 
      {
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
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
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31870, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "In The Back Of A Cave", 
         Vnum = 31871, 
         Tag = "", 
      }, 
      [31872] = 
      {
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
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
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31841, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "The Bus Stop", 
         Vnum = 31872, 
      }, 
      [31873] = 
      {
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
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
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31875, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31881, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31882, 
               Distance = 0, 
               Description = "", 
            }, 
            [4] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31655, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Walking Through The City", 
         Vnum = 31873, 
      }, 
      [31874] = 
      {
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
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
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31655, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Walking Down A Side Street", 
         Vnum = 31874, 
      }, 
      [31875] = 
      {
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
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
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31873, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Inside The Spaceport Speeders", 
         Vnum = 31875, 
      }, 
      [31876] = 
      {
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "Here in this bed hot steam rises from the cushions making your tense\
muscles relax. As they heat your body you start to feel better. The\
atmosphere is very moisturized with a lot of heat surrounding you\
also. The bed is made of a comfortable looking material but has been\
chewed at by small rodents making the bed kind of ugly looking. \
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "somewhere", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [11] = "Hidden", 
               }, 
               Keyword = "", 
               DestinationVnum = 31830, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "On A Bed", 
         Vnum = 31876, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Code = "feel cure $n\
emote Vapors slowly seep into your body helping you relax.\
", 
               ScriptType = "MProg", 
               Arguments = "100", 
            }, 
         }, 
      }, 
      [31878] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Tunnel = 0, 
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
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31601, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31879, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Along The Bottom Of The Cliff", 
         Vnum = 31878, 
         Tag = "", 
      }, 
      [31879] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
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
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31878, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31880, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Nearing The Curve In The Cliff", 
         Vnum = 31879, 
      }, 
      [31880] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
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
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31879, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "On The Curve Of The Cliff", 
         Vnum = 31880, 
      }, 
      [31881] = 
      {
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
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
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 6600, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31873, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "On A Path In The City", 
         Vnum = 31881, 
      }, 
      [31882] = 
      {
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
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
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31873, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31883, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31624, 
               Distance = 1, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "In The Depths Of The City", 
         Vnum = 31882, 
      }, 
      [31883] = 
      {
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
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
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31882, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Gep's Grill", 
         Vnum = 31883, 
      }, 
      [31898] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "northeast", 
               Keyword = "", 
               DestinationVnum = 106, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Vnum = 31898, 
         Tag = "", 
      }, 
      [31899] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "This passage looks somewhat cleaner than the reset of the sewer, suggesting\
that someone maintains it. There's no sewage flowing here, rather the ground\
is quite dry.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31904, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31900, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "A Hidden Passage In The Sewers", 
         Vnum = 31899, 
         Tag = "", 
      }, 
      [31900] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "This circular area seems to be a simple common room, complete with cheap\
furniture and some faded posters on the walls.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31899, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31901, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31902, 
               Distance = 0, 
               Description = "", 
            }, 
            [4] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31909, 
               Distance = 1, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Common Room", 
         Vnum = 31900, 
         Tag = "", 
      }, 
      [31901] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "The kitchen bench is full of unwashed plates, glasses and cutlery. Above the\
bench are a few cupboards. Despite the mess on the bench, the place smells\
clean.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31900, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Kitchen", 
         Vnum = 31901, 
         Tag = "", 
      }, 
      [31902] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "The hallway has light gray walls with some lamps hanging on them. Doors\
lead to other rooms in the small complex.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31900, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31903, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31905, 
               Distance = 0, 
               Description = "", 
            }, 
            [4] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31906, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Hallway", 
         Vnum = 31902, 
         Tag = "", 
      }, 
      [31903] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "There are a few cheap beds scattered around this dimly lit room. Otherwise\
it's quite empty.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31902, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Sleeping Quarters", 
         Vnum = 31903, 
         Tag = "", 
      }, 
      [31904] = 
      {
         TeleVnum = 0, 
         Sector = "underground", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "There is a river of sewage flowing at a slow, steady pace. There's a rusty\
catwalk about a meter above it, running along one wall. Old grime is covering\
the walls. There's a nasty smell in the air, making it uncomfortable to\
breath, even for a Gamorrean.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31907, 
               Distance = 1, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Flags = 
               {
                  [11] = "Hidden", 
               }, 
               Keyword = "", 
               DestinationVnum = 31899, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "southwest", 
               Keyword = "", 
               DestinationVnum = 31505, 
               Distance = 1, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "A Tunnel In The Sewers", 
         Vnum = 31904, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "entry_prog", 
               Code = "def on_enter(room, actor):\
    if isjedi(actor) and level(actor) < 25:\
        echo(actor, \"You sense that the south wall is a hologram.\")\
", 
               ScriptType = "Imp", 
               Arguments = "100", 
            }, 
         }, 
      }, 
      [31905] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "In theory this is where Zim would meditate and attune himself to the Force.\
But in reality it's where he drinks all day, feeling sorry for himself.\
There's a smell of alcohol in the air.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31902, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Zim's Meditation Chamber", 
         Vnum = 31905, 
         Tag = "", 
      }, 
      [31906] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [26] = "Factory", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "This rooms contains all facilities you need to craft just about anything.\
It's very cluttered. A few broken items that someone failed to assemble\
correctly have been tossed into a corner.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31902, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Workshop", 
         Vnum = 31906, 
         Tag = "", 
      }, 
      [31907] = 
      {
         TeleVnum = 0, 
         Sector = "underground", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "This is the main entrance to the sewers. There is a river of sewage flowing\
through the tunnel, giving off a strong smell. Along one wall is a catwalk\
allowing one to walk through the sewers.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31908, 
               Distance = 1, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31904, 
               Distance = 1, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "up", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Keyword = "", 
               DestinationVnum = 31654, 
               Distance = 1, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Mos Eisley Sewers", 
         Vnum = 31907, 
      }, 
      [31908] = 
      {
         TeleVnum = 0, 
         Sector = "underground", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "#31904\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31502, 
               Distance = 1, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31907, 
               Distance = 1, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "A Tunnel In The Sewers", 
         Vnum = 31908, 
      }, 
      [31909] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "The sparring area is a square room about 10x10 meters. Most of the floor is\
covered by a gray mat so that people won't land too hard when they fall.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31900, 
               Distance = 1, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Sparring Area", 
         Vnum = 31909, 
         Tag = "", 
      }, 
      [31997] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "This section is smelly and dirty. It's probably not cleaned very often.\
The noise from the engines at the back of the shuttle contributes to making\
it an uncomfortable trip.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31999, 
               Distance = 1, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Economy Class Section", 
         Vnum = 31997, 
         Tag = "", 
      }, 
      [31998] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "This section of the shuttle is clean, quiet and comfortable. In other words\
it's the opposite of what you usually meet on this planet.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "south", 
               Flags = 
               {
                  [1] = "Closed", 
               }, 
               Keyword = "", 
               DestinationVnum = 31999, 
               Distance = 1, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Business Class Section", 
         Vnum = 31998, 
         Tag = "", 
      }, 
      [31999] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
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
               Key = -1, 
               Direction = "north", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Keyword = "curtain", 
               DestinationVnum = 31998, 
               Distance = 1, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31997, 
               Distance = 1, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Tatooine Planetary Shuttle Entrance", 
         Vnum = 31999, 
         Tag = "", 
      }, 
      [31500] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "The dunes around you are normal as you walk over the endless amount of sand.\
The sea of rippling sand still surrounds you with overwhelming greatness. The\
sand has a reflective shine to it assisted by the sunrays of the heating suns.\
You feel enclosed because the dunes tower over you greatly.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31501, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31557, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31500, 
      }, 
      [31501] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are walking along the soft sand in the desert of Tatooine. Just ahead of\
you you can see the dune sea developping. Behind you the small city diminishes\
into only a spot. With every step you take the city becomes smaller and\
smaller.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31507, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31500, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31807, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31501, 
      }, 
      [31502] = 
      {
         TeleVnum = 0, 
         Sector = "underground", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "A junction breaks up the monotony of these tunnels. The river of sewage runs\
south, but to the north there seems to be a dry area.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31503, 
               Distance = 1, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31504, 
               Distance = 1, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31908, 
               Distance = 1, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Tunnel Junction", 
         Vnum = 31502, 
      }, 
      [31503] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "This room is about 20x20 meters, and several meters high. It smells as bad\
as the rest of the sewers. In the middle of the room is a large piece of\
machinery enclosed in an old-fashioned wire fence.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
               }, 
               Keyword = "", 
               DestinationVnum = 31623, 
               Distance = 1, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31502, 
               Distance = 1, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Pumping Station", 
         Vnum = 31503, 
         Tag = "", 
      }, 
      [31504] = 
      {
         TeleVnum = 0, 
         Sector = "underground", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "#31904\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31502, 
               Distance = 1, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31621, 
               Distance = 1, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Endless Tunnels In The Sewers", 
         Vnum = 31504, 
      }, 
      [31505] = 
      {
         TeleVnum = 0, 
         Sector = "underground", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "The tunnel widens into a room filled with sewage that gathers into a large\
pool. Just like the rest of the sewers, there's a rusty catwalk running along\
one wall where it's possible to walk through the area.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31506, 
               Distance = 1, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "northeast", 
               Keyword = "", 
               DestinationVnum = 31904, 
               Distance = 1, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "A Deep Pool Of Sewage", 
         Vnum = 31505, 
      }, 
      [31506] = 
      {
         TeleVnum = 0, 
         Sector = "underground", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "#31904\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31505, 
               Distance = 1, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "southeast", 
               Keyword = "", 
               DestinationVnum = 31591, 
               Distance = 1, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "A Tunnel In The Sewers", 
         Vnum = 31506, 
      }, 
      [31507] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are standing on a hard sandy surface, there is nothing around you unless\
you turn back. In all directions you can see but sand. The dunes in the sea\
are enourmous and grow with every step that you take.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31509, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31508, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31501, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31507, 
      }, 
      [31508] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "All around you is sand and shiny dunes piling as high as you can see. As far\
as you can guess anything could be behind there. The towering sand dunes make\
you feel scared as you are so small and enclosed by the towering heaps of sand.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31555, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31507, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31508, 
      }, 
      [31509] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are surrounded by sand from all possible directions. You can still see a\
glimpse of the city behind you but once you leave the city the land is yours\
to explore.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31510, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31507, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31509, 
      }, 
      [31510] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "Around you there is only sand as far as you can see. The direction is not\
noticable and civilization is far away. If you wander too far be careful\
of where you end up.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31511, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31513, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31509, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31510, 
      }, 
      [31511] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "The sand is soft and is still all around you. It is high and shinning in your\
face as you repeatidly walk over endless amounts of sand. You feel enclosed\
because of their great mass. As you walk forward, with every step you take the\
sand dunes grow in size and proportion.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31512, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31510, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31511, 
      }, 
      [31512] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "The sand is soft and is still all around you. It is high and shinning in your\
face as you repeatidly walk over endless amounts of sand. You feel enclosed\
because of their great mass. As you walk forward, with every step you take\
the sand dunes grow in size and proportion.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31511, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31512, 
      }, 
      [31513] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "The sand is soft and is still all around you. The sun is high and shining in\
your face as you repeatedly walk over endless amounts of sand. You feel\
enclosed because of their great mass. As you walk forward, with every step you\
take the sand dunes grow in size and proportion.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31514, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31510, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31513, 
      }, 
      [31514] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "The sand is soft and is still all around you. It is high and shining in your\
face as you repeatidly walk over endless amounts of sand. You feel enclosed\
because of their great mass. As you walk forward, with every step you take\
the sand dunes grow in size and proportion.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31513, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31515, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31514, 
      }, 
      [31515] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "All around you is sand and shiny dunes piling as high as you can see. As far\
as you can guess anything could be behind there. The towering sand dunes make\
you feel scared as you are so small and enclosed by the towering heaps of sand.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31514, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31516, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31515, 
      }, 
      [31516] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are on the top of a sand dune and you can see across the whole dune sea.\
It is just a great sight to see. The sand dunes dip in and out of the ground.\
The immense amount of sand frightens you as you look across the great sand\
dune sea of Tatooine.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31515, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31517, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31516, 
      }, 
      [31517] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are heading down the side of a sand a dune entering another valley of\
dunes. With every step you take the sand seems to be increasing.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31516, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31518, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31517, 
      }, 
      [31518] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are on the top of a sand dune and you can see across the whole dune sea.\
It is just a great sight to see. The sand dunes dip in and out of the ground.\
The immense amount of sand frightens you as you look across the great sand\
dune sea of Tatooine.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31519, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31517, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31522, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31518, 
      }, 
      [31519] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "The sand is soft and is still all around you. It is high and shining in your\
face as you repeatedly walk over endless amounts of sand. You feel enclosed\
because of their great mass. As you walk forward, with every step you take the\
sand dunes grow in size and proportion.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31520, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31518, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31519, 
      }, 
      [31520] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are on the top of a sand dune and you can see across the whole dune sea.\
It is just a great sight to see. The sand dunes dip in and out of the ground.\
The immense amount of sand frightens you as you look across the great sand dune\
sea of Tatooine.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31521, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31519, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31520, 
      }, 
      [31521] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are on the top of a sand dune and you can see across the whole dune sea.\
It is just a great sight to see. The sand dunes dip in and out of the ground.\
The immense amount of sand frightens you as you look across the great sand\
dune sea of Tatooine.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31520, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31521, 
      }, 
      [31522] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "The sand is soft and is still all around you. It is high and shining in your\
face as you repeatedly walk over endless amounts of sand. You feel enclosed\
because of their great mass. As you walk forward, with every step you take the\
sand dunes grow in size and proportion.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31518, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31523, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31524, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31522, 
      }, 
      [31523] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "The dunes around you are normal as you walk over the endless amount of dunes.\
The sea of dunes still surrounds you with overwhelming greatness. The sand has\
a reflective shine to it assisted by the sunrays of the heating suns.  You feel\
enclosed because the dunes tower over you greatly.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31522, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31646, 
               Distance = 1, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31523, 
      }, 
      [31524] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
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
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31525, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31522, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31524, 
      }, 
      [31525] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "The dunes around you are normal as you walk over the endless amount of dunes.\
The sea of dunes still surrounds you with overwhelming greatness. The sand has\
a reflective shine to it assisted by the sunrays of the heating suns. You feel\
enclosed because the dunes tower over you greatly.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31526, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31524, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31525, 
      }, 
      [31526] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "All around you is sand and shiny dunes piling as high as you can see. As far\
as you can guess anything could be behind there. The towering sand dunes make\
you feel scared as you are so small and enclosed by the towering heaps of sand.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31527, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31525, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31526, 
      }, 
      [31527] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "All around you is sand and shiny dunes piling as high as you can see. As far\
as you can guess anything could be behind there. The towering sand dunes make\
you feel scared as you are so small and enclosed by the towering heaps of sand.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31528, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31536, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31526, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31527, 
      }, 
      [31528] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
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
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31529, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31527, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31530, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31528, 
      }, 
      [31529] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "The dunes around you are normal as you walk over the endless amount of dunes.\
The sea of dunes still surrounds you with overwhelming greatness. The sand has\
a reflective shine to it assisted by the sunrays of the heating suns. You feel\
enclosed because the dunes tower over you greatly.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31528, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31531, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31529, 
      }, 
      [31530] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "All around you is sand and shiny dunes piling as high as you can see. As far\
as you can guess anything could be behind there. The towering sand dunes make\
you feel scared as you are so small and enclosed by the towering heaps of sand.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31528, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31537, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31530, 
      }, 
      [31531] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "All around you is sand and shiny dunes piling as high as you can see. As far\
as you can guess anything could be behind there. The towering sand dunes make\
you feel scared as you are so small and enclosed by the towering heaps of sand.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31529, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31532, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31531, 
      }, 
      [31532] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "The sand is soft and is still all around you. It is high and shinning in your\
face as you repeatidly walk over endless amounts of sand. You feel enclosed\
because of their great mass. As you walk forward, with every step you take the\
sand dunes grow in size and proportion.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31531, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31533, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Opening", 
         Vnum = 31532, 
      }, 
      [31533] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are traveling along the side of the large opening and can see something in\
the center of the opening.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31534, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31532, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Opening", 
         Vnum = 31533, 
      }, 
      [31534] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are standing infront of a very large opening in the ground that seems to\
have endless turns inside itself. To explore this hold continue to the west.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31533, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31535, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Opening", 
         Vnum = 31534, 
      }, 
      [31535] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "This is a D.T(To be edited)\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31534, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Sarlacc", 
         Vnum = 31535, 
      }, 
      [31536] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are in the middle of the sea of dunes and are hopelessly lost.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31527, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31536, 
      }, 
      [31537] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You can now perceive that the object that you are walking towars is a metallic\
form of some sort.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31530, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31538, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31537, 
      }, 
      [31538] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are very close to the object and you can now identify it in the sand. It\
is a very old shipwreck plowed into the top of a dune.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31539, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31537, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31538, 
      }, 
      [31539] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are infront of the shipwreck and it seems to be habitible. To explore it\
continue north up the hatch.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31540, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31538, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31552, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31539, 
      }, 
      [31540] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "You are inside the hatch of a ship which seems very new and cared for.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31547, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31542, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31539, 
               Distance = 0, 
               Description = "", 
            }, 
            [4] = 
            {
               Key = -1, 
               Direction = "west", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Keyword = "", 
               DestinationVnum = 31541, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Hatch Of Derelict Ship", 
         Vnum = 31540, 
         Tag = "TatooineDerelictShip", 
      }, 
      [31541] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "You are standing infront of an immense cargo room containing many\
crates of items.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Keyword = "", 
               DestinationVnum = 31540, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Cargo Hold", 
         Vnum = 31541, 
         Tag = "", 
      }, 
      [31542] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "You are in a small room with lots of wiring and you can see the maintenance\
tunnel in front of you.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Keyword = "", 
               DestinationVnum = 31543, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31540, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Tunnel", 
         Vnum = 31542, 
         Tag = "", 
      }, 
      [31543] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "You are inside the maintenance tunnel. It is a very small space so you must\
crawl inside the tunnel to move.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31544, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Keyword = "", 
               DestinationVnum = 31542, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Mainentance Tunnel", 
         Vnum = 31543, 
         Tag = "", 
      }, 
      [31544] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "You are crawling through the tunnel and can see an opening to the west.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31543, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31545, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Tunnel", 
         Vnum = 31544, 
         Tag = "", 
      }, 
      [31545] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "You enter a small compartment room filled with electronic equipment. It seems\
to be an interrogation room of some sort. You can see computers mounted the\
wall.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31546, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31544, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Secret Compartment", 
         Vnum = 31545, 
         Tag = "", 
      }, 
      [31546] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "You are in a room containing nothing but an assault droid in the corner.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31545, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Death", 
         Vnum = 31546, 
         Tag = "", 
      }, 
      [31547] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "You are walking down a corridor and can see a ladder at the end of the hall.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31540, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "up", 
               Keyword = "", 
               DestinationVnum = 31548, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Corridor", 
         Vnum = 31547, 
         Tag = "", 
      }, 
      [31548] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "You are heading up a ladder headed towards the top portion of the ship.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31550, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31551, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31549, 
               Distance = 0, 
               Description = "", 
            }, 
            [4] = 
            {
               Key = -1, 
               Direction = "down", 
               Keyword = "", 
               DestinationVnum = 31547, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Ladder", 
         Vnum = 31548, 
         Tag = "", 
      }, 
      [31549] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "You enter a passenger compartment that seems to have been inhabitated.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31548, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Passenger Compartment", 
         Vnum = 31549, 
         Tag = "", 
      }, 
      [31550] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "You are in the pilot compartment and you look out the viewer console to see\
sand covering it. The computer equipment seems to be usable and undamaged.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31548, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Pilot Compartment", 
         Vnum = 31550, 
         Tag = "", 
      }, 
      [31551] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "This room contains nothing in it besides a viewer console and\
seems very strange.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31548, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Room", 
         Vnum = 31551, 
         Tag = "", 
      }, 
      [31552] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You walk around the immense shuttle to the top of a dune and continue exploring\
the dune sea of Tatooine. It tower around you fromm all directions.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31539, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31553, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31552, 
      }, 
      [31553] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "The shuttle starts to get smaller and you can see only sand in front of you.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31554, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31552, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31553, 
      }, 
      [31554] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You walk slowly and exhausted to find nothing here.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31553, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert ", 
         Vnum = 31554, 
      }, 
      [31555] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "All around you is sand and shiny dunes piling as high as you can see. As far\
as you can guess anything could be behind there. The towering sand dunes make\
you feel scared as you are so small and enclosed by the towering heaps of sand.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31508, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31556, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31555, 
      }, 
      [31556] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "All around you is sand and shiny dunes piling as high as you can see. As far\
as you can guess anything could be behind there. The towering sand dunes make\
you feel scared as you are so small and enclosed by the towering heaps of sand.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31555, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31556, 
      }, 
      [31557] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "All around you is sand and shiny dunes piling as high as you can see.\
As far as you can guess anything could be behind there. The towering\
sand dunes make you  eel scared as you are so small and enclosed by\
the towering heaps of sand.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31500, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31558, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31592, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31557, 
      }, 
      [31558] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are on the top of a sand dune and you can see across the whole dune sea.\
It is just a great sight to see. The sand dunes dip in and out of the ground.\
The immense amount of sand frightens you as you look across the great sand\
dune sea of Tatooine.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31559, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31557, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31558, 
      }, 
      [31559] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "The sand is soft and is still all around you. It is high and shinning in your\
face as you repeatedly walk over endless amounts of sand. You feel enclosed\
because of their great mass. As you walk forward, with every step you take the\
sand dunes grow in size and proportion.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31560, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31565, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31558, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31559, 
      }, 
      [31560] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "The dunes you are walking on are reaching a few feet high now and you are\
approaching the greater dunes at a rather fast pace.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31561, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31559, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31560, 
      }, 
      [31561] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are on a large dune right now and you can see dunes for a long way.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31560, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31562, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31564, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31561, 
      }, 
      [31562] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are heading into the sea of dunes. Be careful where you go or you might not come back.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31563, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31561, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31562, 
      }, 
      [31563] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "The dunes under you appear to be growing with every step that you take.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31569, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31562, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31563, 
      }, 
      [31564] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are on a large dune heading further and further away from the grasp of\
civilization.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31561, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31571, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31564, 
      }, 
      [31565] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
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
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31559, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31566, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31565, 
      }, 
      [31566] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
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
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31565, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31567, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31566, 
      }, 
      [31567] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "The sand is hard and hot but you continue to explore this vast area.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31566, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31568, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31567, 
      }, 
      [31568] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "The hard sand is getting softer as you walk endlessly.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31567, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31568, 
      }, 
      [31569] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are walking up and down endless amounts of sound shaped into great dunes\
trying to find something in this vast sea.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31563, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31570, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31569, 
      }, 
      [31570] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Tunnel = 0, 
         Description = "The sand dunes seem to get bigger and higher but it only seems this way from\
exhaustion.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31569, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 3301, 
               Distance = 1, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31570, 
         Tag = "", 
      }, 
      [31571] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "The pummeling dunes are passing under your feet at an alarming rate. Yet there\
is nothing else in sight but sand.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31564, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31572, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31571, 
      }, 
      [31572] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You walk down to the base of one of the largest dunes you have climbed in your\
trip through the great sea of Tatooine.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31571, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31573, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31572, 
      }, 
      [31573] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You turn at the bottom of a dune and start climbing a rather small one.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31574, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31572, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31573, 
      }, 
      [31574] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "The dune you just climbed was a rather small one but when you look down off of\
the dune you realize you are heading down into a valley.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31575, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31577, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31573, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31574, 
      }, 
      [31575] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You walk through the valley of sand dunes slowly. The harsh conditions are\
slowing you down gradually over the course of many minutes, hours or even days\
depending on how long you last before you find civilization.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31576, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31574, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31575, 
      }, 
      [31576] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "The sand dunes around you are making you nautious on what is still left\
to climb over.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31575, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31576, 
      }, 
      [31577] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are walking and walking through the treacherous sea of never ending sand.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31574, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31578, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31577, 
      }, 
      [31578] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You look on but can only see endless amounts of sand but nothing else.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31577, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31582, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31579, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31578, 
      }, 
      [31579] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "The great sea starts becoming a blur after looking at the bare sands\
for many long hours now.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31578, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31580, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31579, 
      }, 
      [31580] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "The sea of dunes is making a great impression on what you think of Tatooine.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31579, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31581, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31580, 
      }, 
      [31581] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are coming up to a rise of harder sand than all around. The flat\
continues to the west.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31580, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31590, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31581, 
      }, 
      [31582] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "The sand is plunging downwards and all of the sea seems to be heading to\
a point of falling.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31583, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31578, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31582, 
      }, 
      [31583] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are standing on the last dune before the entry point and can see what\
is developed inside.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31584, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31582, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31583, 
      }, 
      [31584] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are heading down a slope towards a rocky assortment of caves once lived\
in by the native race of this planet. The Jundland Wastes are very large and\
you can see many things from here.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31585, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31583, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Edge Of The Jundland Wastes", 
         Vnum = 31584, 
      }, 
      [31585] = 
      {
         TeleVnum = 0, 
         Sector = "mountain", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You can see immense caves all around you and feel enclosed by the high walls\
of the caves.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31584, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31586, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Jundland Wastes", 
         Vnum = 31585, 
      }, 
      [31586] = 
      {
         TeleVnum = 0, 
         Sector = "mountain", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are walking down a rocky path that passes many old caves. To the south you\
see a cave that is still in pretty good condition. All around there is a\
distinct odour.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31738, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31589, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31587, 
               Distance = 0, 
               Description = "", 
            }, 
            [4] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31585, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Jundland Wastes", 
         Vnum = 31586, 
      }, 
      [31587] = 
      {
         TeleVnum = 0, 
         Sector = "mountain", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [0] = "Dark", 
         }, 
         Tunnel = 0, 
         Description = "You are inside a dark cave which has a strong odour of some sort. The cave\
continues to the south.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31586, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31588, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Cave", 
         Vnum = 31587, 
         Tag = "", 
      }, 
      [31588] = 
      {
         TeleVnum = 0, 
         Sector = "mountain", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [0] = "Dark", 
         }, 
         Tunnel = 0, 
         Description = "You are in the back of a cave which seems to have been used as a living\
habitat. On the floor in the corner you are appaled when seing three dead\
Jawas. There are some blaster scars on the walls and big gashes everywhere.\
Only one thing could have done this... Sand people.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31587, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Cave", 
         Vnum = 31588, 
         Tag = "", 
      }, 
      [31589] = 
      {
         TeleVnum = 0, 
         Sector = "mountain", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You see many things in the rocks around you but the camp seems lifless in many\
ways. The ground is hard and dry for with the twin suns no moisture can be\
kept in the ground.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31805, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31742, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31586, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Dry Area", 
         Vnum = 31589, 
      }, 
      [31590] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "D.T(to be edited)\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31581, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Teeth", 
         Vnum = 31590, 
      }, 
      [31591] = 
      {
         TeleVnum = 0, 
         Sector = "underground", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "The river of sewage flows into the area from the east and and northwest, and\
disappears off south.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31620, 
               Distance = 1, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31619, 
               Distance = 1, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "northwest", 
               Keyword = "", 
               DestinationVnum = 31506, 
               Distance = 1, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "A Junction In The Sewer Tunnels", 
         Vnum = 31591, 
      }, 
      [31592] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are walking along a hardened sand path which seems to be headed to a\
cliff. The towering sand dunes make you feel scared as you are so small\
and enclosed by the towering heaps of sand. The sun is too warm and is\
getting to you as you tread towards what is to be seen.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31557, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31593, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31592, 
      }, 
      [31593] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
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
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31592, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31594, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31593, 
      }, 
      [31594] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
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
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31593, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31595, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31597, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "The Cliff", 
         Vnum = 31594, 
      }, 
      [31595] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
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
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31596, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31594, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31595, 
      }, 
      [31596] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Tunnel = 0, 
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
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31601, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31595, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert End", 
         Vnum = 31596, 
         Tag = "", 
      }, 
      [31597] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
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
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31600, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31594, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31598, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Cliff", 
         Vnum = 31597, 
      }, 
      [31598] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
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
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31667, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31597, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31599, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Cliff", 
         Vnum = 31598, 
      }, 
      [31599] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [24] = "NoFloor", 
         }, 
         Tunnel = 0, 
         Description = "Aaah, you are loosing your grip! Looking down would not be a good idea as for\
you're about to fall!\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31598, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "down", 
               Flags = 
               {
                  [11] = "Hidden", 
               }, 
               Keyword = "", 
               DestinationVnum = 31880, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Cliffside", 
         Vnum = 31599, 
         Tag = "", 
      }, 
      [31600] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are walking along the flat sands of Tatooine.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31658, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31597, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31600, 
      }, 
      [31601] = 
      {
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
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
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31596, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31602, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31878, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Edge Of Mos Eisley", 
         Vnum = 31601, 
      }, 
      [31602] = 
      {
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
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
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31601, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31628, 
               Distance = 1, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31603, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "City", 
         Vnum = 31602, 
      }, 
      [31603] = 
      {
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
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
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31602, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31604, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "City", 
         Vnum = 31603, 
      }, 
      [31604] = 
      {
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "PlayerStart", 
         Tunnel = 0, 
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
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31603, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31653, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31605, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "In Front Of Mos Eisley Spaceport", 
         Vnum = 31604, 
      }, 
      [31605] = 
      {
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
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
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31604, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31841, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31606, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Pathway To Control Center", 
         Vnum = 31605, 
      }, 
      [31606] = 
      {
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are in front of the control center for the spaceport. Inside this building\
many descisions are made to decide who should be allowed to land on this\
planet and not to cause air havoc.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31605, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31607, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Pathway To Control Center", 
         Vnum = 31606, 
      }, 
      [31607] = 
      {
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are in front of the doors to the spaceport control center. To enter it go\
to the west. At many times of the year this building is just chained up and\
locked. Left here abandoned for the law here is not really kept up tight. The\
door is of solid wood and looks very strong.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31606, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Keyword = "", 
               DestinationVnum = 31608, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "In Front Of The Control Center", 
         Vnum = 31607, 
      }, 
      [31608] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
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
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31609, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "east", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Keyword = "", 
               DestinationVnum = 31607, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31613, 
               Distance = 0, 
               Description = "", 
            }, 
            [4] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31615, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Inside The Control Center", 
         Vnum = 31608, 
         Tag = "", 
      }, 
      [31609] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "You are in a hallway with doors to executive offices all the way down the\
hall. There are doors placed on both sides of the hall leading into individual\
offices.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31608, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31610, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Hallway", 
         Vnum = 31609, 
         Tag = "", 
      }, 
      [31610] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
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
               Key = -1, 
               Direction = "north", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Keyword = "", 
               DestinationVnum = 31611, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31609, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "south", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Keyword = "", 
               DestinationVnum = 31612, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "In The Hallway", 
         Vnum = 31610, 
         Tag = "", 
      }, 
      [31611] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "You are in one of the first offices ever built. It is well furnished and\
decorated. It is used for conferences because of its size but there are not\
many conferences because of the slackness of law on this planet.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "south", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Keyword = "", 
               DestinationVnum = 31610, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Large Conference Room", 
         Vnum = 31611, 
         Tag = "", 
      }, 
      [31612] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "This office is a private office for the manager of this facility. It is a\
rather large office with many vents in it to allow the entrance of crisp air\
to enter the room. There is a large desk made from oak in the middle of the\
room stacked up with 3 pieces of paper.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Keyword = "", 
               DestinationVnum = 31610, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Manager's Office", 
         Vnum = 31612, 
         Tag = "", 
      }, 
      [31613] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "This hallway heads towards the rooms with the generating and computer\
equipment of the control center.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31608, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Keyword = "", 
               DestinationVnum = 31614, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Hallway", 
         Vnum = 31613, 
         Tag = "", 
      }, 
      [31614] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "This room contains all of the power generating equipment for the spaceport.\
The generators and computer systems are all mounted on the walls.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Keyword = "", 
               DestinationVnum = 31613, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Generator Room", 
         Vnum = 31614, 
         Tag = "", 
      }, 
      [31615] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "This is the lobby of the control center. In the corner a secretary takes\
messages and allows passage to the tower.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31608, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "up", 
               Flags = 
               {
                  [0] = "IsDoor", 
                  [5] = "PickProof", 
               }, 
               Keyword = "", 
               DestinationVnum = 31616, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Lobby", 
         Vnum = 31615, 
         Tag = "", 
      }, 
      [31616] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "You are standing in the control tower. Most of the tower is run by droids and\
computers. The only living creatures are humans.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31617, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "down", 
               Flags = 
               {
                  [0] = "IsDoor", 
                  [5] = "PickProof", 
               }, 
               Keyword = "", 
               DestinationVnum = 31615, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Tower", 
         Vnum = 31616, 
         Tag = "", 
      }, 
      [31617] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "Here you can see the whole spaceport from this large viewing screen. As you\
peer through it you can see many different species of life from all across the\
galaxy.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31616, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Viewscreen", 
         Vnum = 31617, 
         Tag = "", 
      }, 
      [31618] = 
      {
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [10] = "Safe", 
            [23] = "Hotel", 
         }, 
         Tunnel = 0, 
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
               Key = -1, 
               Direction = "down", 
               Keyword = "", 
               DestinationVnum = 31863, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Upstairs In The Cantina", 
         Vnum = 31618, 
         Tag = "", 
      }, 
      [31619] = 
      {
         TeleVnum = 0, 
         Sector = "underground", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "Beyond a large grate blocking the way ahead, you see a light far ahead, at the\
end of the tunnel. This is probably where the sewege goes. You probably don't\
even want to know what happens to it next.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31591, 
               Distance = 1, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Tunnel Blocked By A Large Grate", 
         Vnum = 31619, 
      }, 
      [31620] = 
      {
         TeleVnum = 0, 
         Sector = "underground", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "The tunnels widen into a large chamber. The river of sewage runs through it,\
but most of the floor is dry ground. The purpose of this chamber is not\
obvious, as it's otherwise empty.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31622, 
               Distance = 1, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31591, 
               Distance = 1, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "A Large Chamber", 
         Vnum = 31620, 
      }, 
      [31621] = 
      {
         TeleVnum = 0, 
         Sector = "underground", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "The tunnel bends as the river flows from the east to the southwest. There are\
some large fans embedded into the wall, probably to provide breathable air\
into the tunnels.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31504, 
               Distance = 1, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "southwest", 
               Keyword = "", 
               DestinationVnum = 31622, 
               Distance = 1, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "A Bend In The Tunnels", 
         Vnum = 31621, 
      }, 
      [31622] = 
      {
         TeleVnum = 0, 
         Sector = "underground", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "#31904\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31620, 
               Distance = 1, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "northeast", 
               Keyword = "", 
               DestinationVnum = 31621, 
               Distance = 1, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "A Tunnel In The Sewers", 
         Vnum = 31622, 
      }, 
      [31623] = 
      {
         TeleVnum = 0, 
         Sector = "underground", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "Even the people working down here deserve a break, and this is where they\
take it. There are some posters on the walls that otherwise has an industrial\
look to them.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "south", 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
               }, 
               Keyword = "", 
               DestinationVnum = 31503, 
               Distance = 1, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Maintenance Personnel's Area", 
         Vnum = 31623, 
         Tag = "", 
      }, 
      [31624] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31882, 
               Distance = 1, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31625, 
               Distance = 1, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Mercs For Hire", 
         Vnum = 31624, 
         Tag = "", 
      }, 
      [31625] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31626, 
               Distance = 1, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31624, 
               Distance = 1, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31627, 
               Distance = 1, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Foyer Of Facility", 
         Vnum = 31625, 
         Tag = "", 
      }, 
      [31626] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31625, 
               Distance = 1, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Combat Trainer", 
         Vnum = 31626, 
         Tag = "", 
      }, 
      [31627] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31625, 
               Distance = 1, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Equipment Shop", 
         Vnum = 31627, 
         Tag = "", 
      }, 
      [31628] = 
      {
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31629, 
               Distance = 1, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31602, 
               Distance = 1, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Another Street In Mos Eisley", 
         Vnum = 31628, 
      }, 
      [31629] = 
      {
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31630, 
               Distance = 1, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31634, 
               Distance = 1, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31628, 
               Distance = 1, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Straight Street", 
         Vnum = 31629, 
      }, 
      [31630] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31631, 
               Distance = 1, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31629, 
               Distance = 1, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Artisan Guild", 
         Vnum = 31630, 
         Tag = "", 
      }, 
      [31631] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31633, 
               Distance = 1, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31630, 
               Distance = 1, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31632, 
               Distance = 1, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Guild Foyer", 
         Vnum = 31631, 
         Tag = "", 
      }, 
      [31632] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31631, 
               Distance = 1, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Engineering Classes", 
         Vnum = 31632, 
         Tag = "", 
      }, 
      [31633] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [26] = "Factory", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31631, 
               Distance = 1, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "A Large Workshop", 
         Vnum = 31633, 
         Tag = "", 
      }, 
      [31634] = 
      {
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31635, 
               Distance = 1, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31629, 
               Distance = 1, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Straight Street", 
         Vnum = 31634, 
      }, 
      [31635] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31634, 
               Distance = 1, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31636, 
               Distance = 1, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "The Mayor's Building", 
         Vnum = 31635, 
         Tag = "", 
      }, 
      [31636] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [10] = "Safe", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31635, 
               Distance = 1, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "A Spacious Office", 
         Vnum = 31636, 
         Tag = "", 
      }, 
      [31637] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Tunnel = 0, 
         Description = "", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Floating in a void", 
         Vnum = 31637, 
         Tag = "", 
      }, 
      [31638] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "BensHut", 
         Tunnel = 0, 
         Description = "You're standing in front of a small hut made out of synstone. Because of\
the occasional sand storms in the area tearing at the building, it's hard\
to predict how old this structure is.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Keyword = "", 
               DestinationVnum = 31639, 
               Distance = 1, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31681, 
               Distance = 1, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Outside Old Ben's Hut", 
         Vnum = 31638, 
      }, 
      [31639] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31641, 
               Distance = 1, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Keyword = "", 
               DestinationVnum = 31638, 
               Distance = 1, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31640, 
               Distance = 1, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "The Living Area", 
         Vnum = 31639, 
         Tag = "", 
      }, 
      [31640] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "The alcove is small and semicircular. The walls are simple without anything\
interesting on them. There's just enough room for a bed, but nothing else.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31639, 
               Distance = 1, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "A Semi-circular Sleeping Alcove", 
         Vnum = 31640, 
         Tag = "", 
      }, 
      [31641] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31642, 
               Distance = 1, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31639, 
               Distance = 1, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "down", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Keyword = "trapdoor", 
               DestinationVnum = 31644, 
               Distance = 1, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "A Simple Kitchen", 
         Vnum = 31641, 
         Tag = "", 
      }, 
      [31642] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31643, 
               Distance = 1, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31641, 
               Distance = 1, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Pantry", 
         Vnum = 31642, 
         Tag = "", 
      }, 
      [31643] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31642, 
               Distance = 1, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Bathroom", 
         Vnum = 31643, 
         Tag = "", 
      }, 
      [31644] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31645, 
               Distance = 1, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "up", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Keyword = "trapdoor", 
               DestinationVnum = 31641, 
               Distance = 1, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "The Cellar", 
         Vnum = 31644, 
         Tag = "", 
      }, 
      [31645] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [26] = "Factory", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31644, 
               Distance = 1, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "A Small Workshop", 
         Vnum = 31645, 
         Tag = "", 
      }, 
      [31646] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31523, 
               Distance = 1, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31647, 
               Distance = 1, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Northern Edge Of The Jundland Wastes", 
         Vnum = 31646, 
      }, 
      [31647] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "FortTusken", 
         Tunnel = 0, 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31646, 
               Distance = 1, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Fort Tusken", 
         Vnum = 31647, 
      }, 
      [31648] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "This is a room where the builders can work in peace. Very useful to create\
mobs without them starting to wander about.\
", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Name = "TATOOINE BUILDER'S CONTROL CENTER", 
         Vnum = 31648, 
         Tag = "TATOOINE_CONTROL_CENTER", 
      }, 
      [31653] = 
      {
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
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
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31840, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31654, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31604, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Large Pathway Through The City", 
         Vnum = 31653, 
      }, 
      [31654] = 
      {
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
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
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31655, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31653, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "down", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Keyword = "manhole", 
               DestinationVnum = 31907, 
               Distance = 1, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "City Road", 
         Vnum = 31654, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "entry_prog", 
               Code = "if isjedi($n)\
    if level($n) < 25\
        mpechoat $n You sense that there's something of interest below.\
    endif\
endif\
", 
               ScriptType = "MProg", 
               Arguments = "100", 
            }, 
         }, 
      }, 
      [31655] = 
      {
         TeleVnum = 0, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
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
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31874, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31873, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31853, 
               Distance = 0, 
               Description = "", 
            }, 
            [4] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31654, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "City", 
         Vnum = 31655, 
      }, 
      [31658] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
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
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31659, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31600, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31658, 
      }, 
      [31659] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are on the hard sand of Tatooine. All around you you can see sand for\
miles unless you look back.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31660, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31658, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31659, 
      }, 
      [31660] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are standing on the thickening sand of Tatooine.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31661, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31659, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31660, 
      }, 
      [31661] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "The sand under you is still hard and glowing. As you look around all you can\
see is shiny sand.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31660, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31662, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31661, 
      }, 
      [31662] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You walk on the sand of Tatooine. As you walk over it your feet sink into the\
ground leaving an everlasting mark.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31661, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31663, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31662, 
      }, 
      [31663] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are walking on the sand of Tatooine. The sand gradually hardens with\
every minute exposed to the sun.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31662, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31664, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31663, 
      }, 
      [31664] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "The sand under you is feeling hotter with rays of the sun beaming down on it.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31663, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31665, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31664, 
      }, 
      [31665] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are standing on the great sands of Tatooine. Far away in the distance you\
can see the developing sea of sand dunes.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31664, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31666, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31665, 
      }, 
      [31666] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are heading towards the great sand dunes, yet it is still a long journey\
to reach the sand dune sea.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31683, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31665, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31666, 
      }, 
      [31667] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are headed towards the great dune sea, leaving civilization behind.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31668, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31598, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31667, 
      }, 
      [31668] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are standing on the hard sand of the planet which has been exposed to\
harsh sun rays.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31669, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31667, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31668, 
      }, 
      [31669] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "The sand under you is continually getting softer every step you take towards\
the great sea of sand dunes.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31670, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31668, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31669, 
      }, 
      [31670] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You can now clearly make out the sand dunes ahead of you, but they are still\
very far away.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31671, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31669, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31670, 
      }, 
      [31671] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are nearing the great sea of sand dunes with every step you take.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31672, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31670, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31671, 
      }, 
      [31672] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are approaching the sand dunes quickly now and will be there soon. With\
every step you take the sand seems to be getting softer and thicker.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31673, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31671, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31672, 
      }, 
      [31673] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are only but feet of in reach of the great sea.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31674, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31672, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31673, 
      }, 
      [31674] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are nearing the bottom of the first sand dune in sight. All of a sudden\
they seem much bigger than before. They also seem to be growing with every\
step you take.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31675, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31673, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31674, 
      }, 
      [31675] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "The great dune sea now seems so vast and enormous with every step you take.\
In all directions there are sand dunes towering around and over you.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31676, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31674, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31675, 
      }, 
      [31676] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are surrounded by sand, the dunes extend as far as you can see.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31675, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31677, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31676, 
      }, 
      [31677] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You walk endlessly on the sand beneath you. It towers all around and\
makes you feel enclosed.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31676, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31678, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31677, 
      }, 
      [31678] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are walking on a dune. It is shaped by the everlasting winds of Tatooine.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31677, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31679, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31678, 
      }, 
      [31679] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "The sand around you is thick and hot. In the daytime the sunrays make the\
sand extremely hot.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31678, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31680, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31679, 
      }, 
      [31680] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are walking on the sand dunes of the great sea. They tower around you in\
all directions.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31679, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31681, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31680, 
      }, 
      [31681] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are walking though the thick sand. It covers your feet and makes you feel\
enclosed.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31638, 
               Distance = 1, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31680, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31681, 
      }, 
      [31682] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Tunnel = 0, 
         Description = "You walk on the sand dunes of the great sea of Tatooine. They shimmer around\
you in the daylight.\
", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31682, 
         Tag = "", 
      }, 
      [31683] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are standing on the thickening sand of the desert.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31684, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31666, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31683, 
      }, 
      [31684] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
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
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31685, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31683, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31684, 
      }, 
      [31685] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are at the step of the first sand dune. You can enter the sand dune sea\
of Tatooine to the north, the west and the east.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31686, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31698, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31684, 
               Distance = 0, 
               Description = "", 
            }, 
            [4] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31694, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31685, 
      }, 
      [31686] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are on one of many large sand dunes in this vast sea.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31687, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31685, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31686, 
      }, 
      [31687] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "All around you are large sand dunes. If you would like to stay out of the sea\
turn back now.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31688, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31686, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31687, 
      }, 
      [31688] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are inside a small valley of sand dunes. All around you shimmering sand\
dunes tower over you.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31689, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31687, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31688, 
      }, 
      [31689] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are now in the great sea. The only thing you will find is this great sea\
is probably death.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31688, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31690, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31689, 
      }, 
      [31690] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are standing on a vast sand dune which is high enough for you to see\
clearly across the sea.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31689, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31691, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31690, 
      }, 
      [31691] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are among many sand dunes. All around you the great sand dunes tower over\
you and you now wonder what you're doing here.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31690, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31692, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31691, 
      }, 
      [31692] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "The vast sand dunes around you make you feel enclosed. For as far as you can\
see there is only sand.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31691, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31693, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31692, 
      }, 
      [31693] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are going endlessly over sand dunes wondering why you are here.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31692, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31693, 
      }, 
      [31694] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are standing in front of a largely spaced sea of sand dunes which seems\
never ending.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31685, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31695, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31694, 
      }, 
      [31695] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are leaving any hopes of finding civilization behind. The only thing you\
shall find out here is certain death.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31694, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31696, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31695, 
      }, 
      [31696] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are looking endlessly at the sand around you. You are but only a small\
figure compared to the sand surrounding you.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31702, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31695, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31697, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31696, 
      }, 
      [31697] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are on a sand dune. You can glare far out into the dune sea, but all you\
can see is sand, sand and more sand.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31706, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31696, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31711, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31697, 
      }, 
      [31698] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are standing in front of a sand dune. In all directions but the one you\
came are sand dunes.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31699, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31685, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31698, 
      }, 
      [31699] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "The sand is thicker now that you are on the sand dunes. The great sea is\
greater than you thought and it might be wise to turn back now.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31700, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31698, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31699, 
      }, 
      [31700] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are on a sand dune. As you look the sand dunes never end in this vast sea.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31701, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31699, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31700, 
      }, 
      [31701] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are in the endless sea of sand dunes. All around you all you can see is\
sand.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31700, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31701, 
      }, 
      [31702] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are still in the endless sea of sand dunes. As you peer around yourself\
it feels hopeless in regards to where you are.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31703, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31696, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31702, 
      }, 
      [31703] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are in between many sand dunes. They are around you from every angle and\
you feel enclosed because of their height.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31704, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31702, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31703, 
      }, 
      [31704] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are on the side of a sand dune. You look around you and there are still\
no traces of life.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31705, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31703, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31704, 
      }, 
      [31705] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "All around you all you can see is sand. The towering sand dunes are all\
around you and you cannot figure out where you are.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31704, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31705, 
      }, 
      [31706] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are standing on soft sand. With sand dunes surrounding you, you just\
keep on walking.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31707, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31697, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31714, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31706, 
      }, 
      [31707] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are walking on a sand dune. All around you there are sand dunes. They\
tower high over you until you reach the top of one and start heading back\
down.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31708, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31706, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31707, 
      }, 
      [31708] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are standing on the top of a sand dune. And as you hope for something all\
you can see is the voyage down the side of yet another sand dune.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31709, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31707, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31718, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31708, 
      }, 
      [31709] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are heading down the side of a dune. Its size makes you feel tired for it\
only makes the journey longer.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31710, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31708, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31709, 
      }, 
      [31710] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are surrounded by sand dunes and as they tower over you, you feel\
enclosed.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31709, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31710, 
      }, 
      [31711] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are enlosed by many sand dunes which lay around you.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31697, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31712, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31711, 
      }, 
      [31712] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are on a sand dune. You can only see sand and formations of dunes in your range of vision.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31711, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31713, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31712, 
      }, 
      [31713] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are standing on the top of a sand dune. You feel bigger when you reach the\
top of a sand dune but there is always the way down to think about.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31712, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31713, 
      }, 
      [31714] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are walking down the side of a sand dune. All around you is sand as far\
as you can see.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31706, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31715, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31714, 
      }, 
      [31715] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "The dunes around you are normal as you walk over the endless amount of sand.\
The sea of rippling sand still surrounds you with overwhelming greatness. The\
sand has a reflective shine to it assisted by the sunrays of the heating suns.\
You feel enclosed because the dunes tower over you greatly.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31714, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31716, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31715, 
      }, 
      [31716] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
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
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31715, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31717, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31716, 
      }, 
      [31717] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are standing in between various sand dunes of all sizes and shapes.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31716, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31717, 
      }, 
      [31718] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are walking on soft sand. The sand dunes tower around you from all\
directions.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31708, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31719, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31718, 
      }, 
      [31719] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are on the side of a sand dune approaching the top.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31718, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31720, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31719, 
      }, 
      [31720] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are on the top edge of a sand dune. As you peer around you there is only\
sand.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31719, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31721, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31720, 
      }, 
      [31721] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are standing on the side of the sharply shaped sand dune. You are\
approaching the bottom once again so that you can continue with your\
journey.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31722, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31720, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31721, 
      }, 
      [31722] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are on a large sand dune. All around you can see sand.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31723, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31721, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31722, 
      }, 
      [31723] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are walking on the side of a sand dune. All around you sand dunes tower\
over you.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31722, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31724, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31723, 
      }, 
      [31724] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are standing on the top of a sand dune. All around you there is sand.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31725, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31723, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31724, 
      }, 
      [31725] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are surrounded by sand from all sides and feel enclosed.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31724, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31726, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31725, 
      }, 
      [31726] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are standing on the top of a sand dune. You can see what seems to be a\
palace of some sort in the side of a sand dune just ahead.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31725, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31727, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Desert", 
         Vnum = 31726, 
      }, 
      [31727] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are standing in front of what you now recognize as Jabba the Hutt's former\
home.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31728, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31726, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "The Dune Sea", 
         Vnum = 31727, 
      }, 
      [31728] = 
      {
         TeleVnum = 0, 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Tunnel = 0, 
         Description = "You are in front of a large door. It seems to not have been opened in years.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Keyword = "", 
               DestinationVnum = 31729, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31727, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "In Front Of Jabba's Palace", 
         Vnum = 31728, 
         Tag = "JabbasPalace", 
      }, 
      [31729] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "You are standing in a large opening surrounded by large walls which tower\
around you. It is very dark in here and you can only continue to the north.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31730, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Keyword = "", 
               DestinationVnum = 31728, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Entrance To Jabba's Palace", 
         Vnum = 31729, 
         Tag = "", 
      }, 
      [31730] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "You are walking down a corridor towards the what seems to be a large room.\
The air around you is thick and has a foul odor.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31731, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31729, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Hallway In Jabba's Palace", 
         Vnum = 31730, 
         Tag = "", 
      }, 
      [31731] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "You are standing in front of the large audience chamber. It was designed to\
hold many people including dancing girls, bands and tables full of people.\
But, since the Monks took over the palace it has not been used.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31732, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31733, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31730, 
               Distance = 0, 
               Description = "", 
            }, 
            [4] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31734, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "In Front Of Audience Chamber", 
         Vnum = 31731, 
         Tag = "", 
      }, 
      [31732] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are standing on Jabba the Hutt's former Dais. It is a very large area\
which has an exellent view of the audience chamber.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31731, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Jabba's Dais", 
         Vnum = 31732, 
      }, 
      [31733] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "You are standing directly on the trapdoor that was used to feed traitors to\
the Rancor which was killed by Luke Skywalker.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31800, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31731, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "down", 
               Keyword = "", 
               DestinationVnum = 31798, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Trapdoor", 
         Vnum = 31733, 
         Tag = "", 
      }, 
      [31734] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "You are in the audience chambers of the palace. You can go up the stairs\
towards some of the living quarters of the monks.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31736, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31731, 
               Distance = 0, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "up", 
               Keyword = "", 
               DestinationVnum = 31735, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Audience Chambers", 
         Vnum = 31734, 
         Tag = "", 
      }, 
      [31735] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "You are on the upper level of the palace that is now inhabited by mainly\
boormir monks and spiderwalkers.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31746, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "down", 
               Keyword = "", 
               DestinationVnum = 31734, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Upper Level Entrance", 
         Vnum = 31735, 
         Tag = "", 
      }, 
      [31736] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         Description = "You are standing beside the Dais of the former Jabba the Hutt. From here you\
cannot see very well but you are very near the Dais.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31734, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Beside The Dais", 
         Vnum = 31736, 
         Tag = "", 
      }, 
      [31737] = 
      {
         TeleVnum = 0, 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are standing beside the Dais. From here you have a good view of the chambers.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31733, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Beside The Dais", 
         Vnum = 31737, 
      }, 
      [31738] = 
      {
         TeleVnum = 0, 
         Sector = "mountain", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are standing on a flat rocky surface. As you peer around you see that the\
Jundland Wastes are very large.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31739, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31586, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Jundland Wastes", 
         Vnum = 31738, 
      }, 
      [31739] = 
      {
         TeleVnum = 0, 
         Sector = "mountain", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You walk around the Jundland Wastes. All around you there is a very\
strong odour.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31740, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31738, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Jundland Wastes", 
         Vnum = 31739, 
      }, 
      [31740] = 
      {
         TeleVnum = 0, 
         Sector = "mountain", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You stand on rock. It is a very large area you are about to explore. The odour\
is still strong around you.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 31741, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31739, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Jundland Wastes", 
         Vnum = 31740, 
      }, 
      [31741] = 
      {
         TeleVnum = 0, 
         Sector = "mountain", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "LarsHomestead", 
         Tunnel = 0, 
         Description = "You can see lots of rocks and cliffs of many different shapes and sizes all\
around you. The odour is still all around you.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 31740, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "The Lars Homestead", 
         Vnum = 31741, 
      }, 
      [31742] = 
      {
         TeleVnum = 0, 
         Sector = "mountain", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You are walking through the Jundland Wastes. All around you there is a\
distinct odour. Things and small creatures many dead lay here but cannot be\
taken without effort, they must not be worth anything.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31743, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31589, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Vague Area", 
         Vnum = 31742, 
      }, 
      [31743] = 
      {
         TeleVnum = 0, 
         Sector = "mountain", 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
         Tunnel = 0, 
         Description = "You walk down a path through the wastes. All around you the odour thickens.\
", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 31744, 
               Distance = 0, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 31742, 
               Distance = 0, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Jundland Wastes", 
         Vnum = 31743, 
      }, 
   }, 
   Objects = 
   {
      [31500] = 
      {
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a small white candle", 
         ItemType = "light", 
         Layers = 0, 
         Description = "A candle rests here.", 
         Affects = 
         {
            [1] = 
            {
               Location = 18, 
               Modifier = 1, 
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
         Name = "candle", 
         ActionDescription = "", 
         Flags = 
         {
            [0] = "Glow", 
            [10] = "AntiEvil", 
         }, 
         Vnum = 31500, 
         Cost = 0, 
         Weight = 1, 
      }, 
      [31501] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ShortDescr = "a large brain jar with flashing lights", 
         ItemType = "container", 
         Layers = 0, 
         Description = "A large jar containing a sacred brain lies here. ", 
         ObjectValues = 
         {
            [1] = 1, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Name = "brain jar", 
         ActionDescription = "", 
         Flags = 
         {
            [0] = "Glow", 
         }, 
         Vnum = 31501, 
         Cost = 0, 
         Weight = 3, 
      }, 
      [31502] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "look jawa", 
               Description = "This jawa has been laying here for quite a while as it seems. His skin has\
\13begun decaying and you can see his bones in certain spots.", 
            }, 
         }, 
         ShortDescr = "a dead Jawa", 
         ItemType = "corpse", 
         Layers = 0, 
         Description = "A dead Jawa lies motionless on the ground here.", 
         Name = "corpse dead Jawa", 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Vnum = 31502, 
         Cost = 0, 
         Weight = 100, 
      }, 
      [31503] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "look egg", 
               Description = "A large egg with different colors on it lays here. It would probably not be\
\13wise to take it or the mother might get mad.", 
            }, 
         }, 
         ShortDescr = "a large egg", 
         ItemType = "trash", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Layers = 0, 
         Description = "A large egg lays here, falling over every once in a while.", 
         Affects = 
         {
            [1] = 
            {
               Location = 9, 
               Modifier = 0, 
            }, 
         }, 
         Flags = 
         {
            [12] = "NoRemove", 
         }, 
         Name = "Egg", 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 97000, 
            [2] = 10000, 
            [3] = 11000, 
            [4] = 0, 
            [5] = 0, 
            [0] = 100000, 
         }, 
         Vnum = 31503, 
         Cost = 0, 
         Weight = 2, 
      }, 
      [31504] = 
      {
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a shiny krayt crystal", 
         ItemType = "light", 
         Layers = 0, 
         Description = "A shiny krayt crystal lays here.", 
         Affects = 
         {
            [1] = 
            {
               Location = 17, 
               Modifier = 5, 
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
         Name = "Shiny krayt crystal", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 31504, 
         Cost = 0, 
         Weight = 1, 
      }, 
      [31505] = 
      {
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a krayt pearl", 
         ItemType = "armor", 
         Layers = 0, 
         Description = "A glowing pearl lays here.", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Flags = 
         {
            [0] = "Glow", 
         }, 
         Name = "Pearl", 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 2000, 
            [2] = 6000, 
            [3] = 1100, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10000, 
         }, 
         Vnum = 31505, 
         Cost = 0, 
         Weight = 1, 
      }, 
      [31506] = 
      {
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a canteen", 
         ItemType = "drink_container", 
         Layers = 0, 
         Description = "A canteen rests here, waiting to be picked up.", 
         ObjectValues = 
         {
            [1] = 10, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         Name = "Canteen", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 31506, 
         Cost = 0, 
         Weight = 2, 
      }, 
      [31507] = 
      {
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a jug of water", 
         ItemType = "drink_container", 
         Layers = 0, 
         Description = "A jug of water rests here.", 
         ObjectValues = 
         {
            [1] = 15, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 15, 
         }, 
         Name = "jug", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 31507, 
         Cost = 0, 
         Weight = 5, 
      }, 
      [31508] = 
      {
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a torn up circuit", 
         ItemType = "circuit", 
         Layers = 0, 
         Description = "A torn up circuit lies here, waiting to be picked up.", 
         ObjectValues = 
         {
            [1] = 1, 
            [2] = 5, 
            [3] = 3, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         Name = "Circuit", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 31508, 
         Cost = 0, 
         Weight = 1, 
      }, 
      [31509] = 
      {
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a dirty Jawa robe", 
         ItemType = "armor", 
         Layers = 0, 
         Description = "A Jawa robe is here, waiting to be taken.", 
         Affects = 
         {
            [1] = 
            {
               Location = 5, 
               Modifier = 0, 
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
         Name = "Jawa Robe", 
         ActionDescription = "", 
         Flags = 
         {
            [0] = "Glow", 
            [18] = "SmallSize", 
         }, 
         Vnum = 31509, 
         Cost = 0, 
         Weight = 3, 
      }, 
      [31510] = 
      {
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "some wire", 
         ItemType = "trash", 
         Layers = 0, 
         Description = "Some wire is here, waiting to be taken", 
         ObjectValues = 
         {
            [1] = 15, 
            [2] = 6, 
            [3] = 11, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         Name = "Wire", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 31510, 
         Cost = 0, 
         Weight = 2, 
      }, 
      [31511] = 
      {
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a Jawa Blaster", 
         ItemType = "weapon", 
         Layers = 0, 
         Description = "A elegant little blaster lays here on the ground.", 
         Affects = 
         {
            [1] = 
            {
               Location = 18, 
               Modifier = 0, 
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
         Name = "Jawa Blaster", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Vnum = 31511, 
         Cost = 0, 
         Weight = 6, 
      }, 
      [31512] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "look belt", 
               Description = "This belt glows and hums with extreme power comming from it. This object cannot be handled by a mortal mind for its powers are to great.", 
            }, 
         }, 
         ShortDescr = "Satin's Glimmering Belt.", 
         ItemType = "armor", 
         WearFlags = 
         {
            [11] = "Waist", 
         }, 
         Layers = 0, 
         Description = "A powerful godly belt lays on the ground here.", 
         Affects = 
         {
            [1] = 
            {
               Location = 1, 
               Modifier = 0, 
            }, 
            [2] = 
            {
               Location = 2, 
               Modifier = 10, 
            }, 
            [3] = 
            {
               Location = 3, 
               Modifier = 10, 
            }, 
            [4] = 
            {
               Location = 4, 
               Modifier = 10, 
            }, 
            [5] = 
            {
               Location = 5, 
               Modifier = 10, 
            }, 
            [6] = 
            {
               Location = 9, 
               Modifier = 20, 
            }, 
            [7] = 
            {
               Location = 18, 
               Modifier = 500, 
            }, 
            [8] = 
            {
               Location = 19, 
               Modifier = 500, 
            }, 
            [9] = 
            {
               Location = 19, 
               Modifier = 0, 
            }, 
         }, 
         Flags = 
         {
            [0] = "Glow", 
         }, 
         Name = "Glimmering Belt", 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = -259084288, 
            [4] = 0, 
            [5] = 0, 
            [0] = 200, 
         }, 
         Vnum = 31512, 
         Cost = 0, 
         Weight = 1, 
      }, 
      [31513] = 
      {
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a large stick", 
         ItemType = "treasure", 
         Layers = 0, 
         Description = "A large stick of the Wise Storyteller lays here.", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 17000, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Name = "Stick", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 31513, 
         Cost = 0, 
         Weight = 1, 
      }, 
      [31514] = 
      {
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a large oak desk", 
         ItemType = "furniture", 
         Layers = 0, 
         Description = "A large oak desk collects dust on the ground here.", 
         Name = "large oak desk", 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Vnum = 31514, 
         Cost = 0, 
         Weight = 150, 
      }, 
      [31515] = 
      {
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a mechanics belt", 
         ItemType = "armor", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Layers = 0, 
         Description = "A mechanics belt lays here waiting to be used.", 
         Affects = 
         {
            [1] = 
            {
               Location = 4, 
               Modifier = 0, 
            }, 
         }, 
         Flags = 
         {
            [31] = "HumanSize", 
         }, 
         Name = "Belt", 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 1300, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         Vnum = 31515, 
         Cost = 0, 
         Weight = 4, 
      }, 
      [31516] = 
      {
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a mechanics hat", 
         ItemType = "armor", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Layers = 0, 
         Description = "A mechanics hat collects dust on the ground.", 
         Affects = 
         {
            [1] = 
            {
               Location = 2, 
               Modifier = 0, 
            }, 
         }, 
         Flags = 
         {
            [31] = "HumanSize", 
         }, 
         Name = "Hat", 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 600, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         Vnum = 31516, 
         Cost = 0, 
         Weight = 2, 
      }, 
      [31517] = 
      {
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a Jawa ionization gun", 
         ItemType = "weapon", 
         Layers = 0, 
         Description = "A Jawa ionization gun has been foolishly left behind.", 
         ObjectValues = 
         {
            [1] = 6, 
            [2] = 6, 
            [3] = 6, 
            [4] = 1000, 
            [5] = 1000, 
            [0] = 7200, 
         }, 
         Name = "Ionization Gun", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Vnum = 31517, 
         Cost = 0, 
         Weight = 8, 
      }, 
      [31518] = 
      {
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a small hide Key", 
         ItemType = "key", 
         Layers = 0, 
         Description = "A small key crafted from hide", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Name = "key", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 31518, 
         Cost = 0, 
         Weight = 5, 
      }, 
      [31519] = 
      {
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a droid detector", 
         ItemType = "furniture", 
         Layers = 0, 
         Description = "A droid detector is mounted on the wall here.", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "greet_prog", 
               Code = "if isdroid($n)\
    mpechoat $n The droid detector flashes and beeps as you enter.\
    mpechoaround $n The droid detector flashes and beeps as $n enters.\
    mpecho From within the cantina someone shouts, 'Hey! We don't serve your kind here!'\
endif\
", 
               ScriptType = "MProg", 
               Arguments = "100", 
            }, 
         }, 
         Name = "Detector", 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Vnum = 31519, 
         Cost = 0, 
         Weight = 900, 
      }, 
      [31520] = 
      {
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a large drink machine", 
         ItemType = "furniture", 
         Layers = 0, 
         Description = "A large and complex drink machine sits here. It is used by Wuher\
\13to dispense drinks.", 
         ObjectValues = 
         {
            [1] = 1, 
            [2] = 6, 
            [3] = 11, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Name = "Drink Machine", 
         ActionDescription = "", 
         Flags = 
         {
            [0] = "Glow", 
         }, 
         Vnum = 31520, 
         Cost = 0, 
         Weight = 5, 
      }, 
      [31521] = 
      {
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a bed", 
         ItemType = "trash", 
         Layers = 0, 
         Description = "A comfortable bed lays here. Maybe laying down would not hurt you.", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Name = "Bed", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 31521, 
         Cost = 0, 
         Weight = 1, 
      }, 
      [31522] = 
      {
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a bantha rib", 
         ItemType = "food", 
         Layers = 0, 
         Description = "A bantha rib is here for your enjoyment.", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 3, 
         }, 
         Name = "Bantha rib", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 31522, 
         Cost = 10, 
         Weight = 1, 
      }, 
      [31523] = 
      {
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a banthaburger", 
         ItemType = "food", 
         Layers = 0, 
         Description = "A banthaburger site here ready to eat.", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         Name = "Banthaburger", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 31523, 
         Cost = 15, 
         Weight = 1, 
      }, 
      [31524] = 
      {
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "some grilled womp rat", 
         ItemType = "food", 
         Layers = 0, 
         Description = "Some grilled womp rat is here ready to be snatched up.", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 4, 
         }, 
         Name = "Grilled Womp Rat", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 31524, 
         Cost = 16, 
         Weight = 1, 
      }, 
      [31525] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "hologram projector", 
               Description = "This projector creates an illusory wall to the north to keep\
\13this passage hidden.\
\13", 
            }, 
         }, 
         ShortDescr = "a hologram projector", 
         ItemType = "trash", 
         Layers = 0, 
         Description = "A hologram projector is here.", 
         Name = "hologram projector", 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Vnum = 31525, 
         Cost = 0, 
         Weight = 1, 
      }, 
      [31526] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "worn couch", 
               Description = "This couch looks very worn out. The seats look like they're made\
\13out of bantha hide, but you can't be sure.\
\13", 
            }, 
         }, 
         ShortDescr = "a worn couch", 
         ItemType = "furniture", 
         Layers = 0, 
         Description = "A worn couch is here.", 
         Name = "worn couch", 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 3, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 3, 
         }, 
         Vnum = 31526, 
         Cost = 0, 
         Weight = 1, 
      }, 
      [31527] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "spacious seats", 
               Description = "The seats are very comfortable, allowing even large species like Wookiees to\
stretch their legs.\
", 
            }, 
         }, 
         ShortDescr = "spacious seats", 
         ItemType = "furniture", 
         Layers = 0, 
         Description = "Rows of spacious seats fill this section.", 
         Name = "spacious seats", 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 2, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         Vnum = 31527, 
         Cost = 0, 
         Weight = 1, 
      }, 
      [31528] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "cramped seats", 
               Description = "The seats are very dirty, as you might expect on Tatooine. There's no room\
to stretch your legs, even if you're a Jawa.\
", 
            }, 
         }, 
         ShortDescr = "cramped seats", 
         ItemType = "furniture", 
         Layers = 0, 
         Description = "Cramped seats fill the economy section.", 
         Name = "cramped seats", 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 2, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         Vnum = 31528, 
         Cost = 0, 
         Weight = 1, 
      }, 
      [31529] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "refridgerator fridge", 
               Description = "The refridgerator is an older model, and gives off a fairly loud humming\
noise. It seems quite dirty on the outside. One can only hope it's better\
on the inside.\
", 
            }, 
         }, 
         ShortDescr = "a refridgerator", 
         ItemType = "container", 
         Layers = 0, 
         Description = "A small refridgerator stands in a corner.", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Code = "-- This script restocks the fridge with a randomly picked item of food\
if otypeinobj(food) < 3\
    macro opoload_one_of 31522 31523 31524\
    mpecho The refridgerator makes a loud humming noise.\
endif\
", 
               ScriptType = "MProg", 
               Arguments = "100", 
            }, 
         }, 
         Name = "refridgerator fridge", 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 20, 
         }, 
         Vnum = 31529, 
         Cost = 0, 
         Weight = 1, 
      }, 
      [31530] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "fake flower", 
               Description = "The flower is deep purple. The stalk is about one meter long and has green\
leaves. The pot is white, with specks of dirt on it. The flower looks kind\
of real, but smells very fake.\
", 
            }, 
         }, 
         ShortDescr = "a fake flower", 
         ItemType = "trash", 
         Layers = 0, 
         Description = "A large fake flower in a large pot.", 
         Name = "fake flower", 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Vnum = 31530, 
         Cost = 0, 
         Weight = 1, 
      }, 
      [31531] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "mysterious machinery", 
               Description = "This large machine towers above you for several meters. It have many large\
tubes, valves and gauges. It seems likely that the purpose of this machinery\
is to pump the sewer somewhere, but one can't be sure.\
", 
            }, 
         }, 
         ShortDescr = "the machinery", 
         ItemType = "trash", 
         Layers = 0, 
         Description = "Some mysterious-looking machinery is here, making a lot of noise.", 
         Name = "mysterious machinery", 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Vnum = 31531, 
         Cost = 0, 
         Weight = 1, 
      }, 
      [31532] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "jumpsuit", 
               Description = "The jumpsuit is blue, and has multiple pockets. It full of oil and dirt, and smells\
pretty bad.\
", 
            }, 
         }, 
         ShortDescr = "a jumpsuit", 
         ItemType = "armor", 
         Layers = 0, 
         Description = "A jumpsuit lies neatly folded on the ground.", 
         ObjectValues = 
         {
            [1] = 4, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 4, 
         }, 
         Name = "jumpsuit", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
            [3] = "Body", 
         }, 
         Vnum = 31532, 
         Cost = 10, 
         Weight = 1, 
      }, 
      [31533] = 
      {
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a low-quality rodent skin", 
         ItemType = "fabric", 
         Layers = 0, 
         Description = "Some low-quality rodent skin is lying on the ground.", 
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Name = "low-quality rodent skin", 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 31533, 
         Cost = 25, 
         Weight = 1, 
      }, 
      [31534] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "platic table chairs", 
               Description = "The table looks cheap and simple. The table legs are gray and the tabletop is\
white. At least it used to be white. Now it's slightly yellowed and dirty.\
", 
            }, 
         }, 
         ShortDescr = "a plastic table", 
         ItemType = "furniture", 
         Layers = 0, 
         Description = "A plastic table with some chairs is here.", 
         Name = "platic table chairs", 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 1, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 6, 
         }, 
         Vnum = 31534, 
         Cost = 0, 
         Weight = 1, 
      }, 
      [31535] = 
      {
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a few rusty pipes", 
         ItemType = "trash", 
         Layers = 0, 
         Description = "A few rusty pipes comes down from the ceiling.", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Code = "mpecho The rusty pipes spew out more sewage into the river.\
", 
               ScriptType = "MProg", 
               Arguments = "25", 
            }, 
         }, 
         Name = "rusty pipes", 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Vnum = 31535, 
         Cost = 0, 
         Weight = 1, 
      }, 
      [31536] = 
      {
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "an uncomfortable bed", 
         ItemType = "furniture", 
         Layers = 0, 
         Description = "An uncomfortable bed is here.", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 2, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         Name = "uncomfortable bed", 
         ActionDescription = "", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Vnum = 31536, 
         Cost = 0, 
         Weight = 1, 
      }, 
      [31537] = 
      {
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a workbench", 
         ItemType = "container", 
         Layers = 0, 
         Description = "A workbench with drawers.", 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 20, 
         }, 
         Name = "workbench drawers", 
         ActionDescription = "", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Vnum = 31537, 
         Cost = 0, 
         Weight = 1, 
      }, 
      [31538] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "mysterious book", 
               Description = "This is an old fashioned book with leather binding and actual paper pages.\
As you page through the volume, you can't believe what you're reading.\
It is a detailed account of how to construct a lightsaber! Maybe you\
should try to STUDY it.\
", 
            }, 
         }, 
         ShortDescr = "a mysterious book", 
         ItemType = "book", 
         Layers = 0, 
         Description = "A mysterious book is here.", 
         Name = "mysterious book", 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 115, 
            [2] = -1, 
            [3] = -1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Vnum = 31538, 
         Cost = 0, 
         Weight = 1, 
      }, 
      [31999] = 
      {
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a newly created lastobject", 
         ItemType = "trash", 
         Layers = 0, 
         Description = "Some god dropped a newly created lastobject here.", 
         Name = "lastobject", 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Vnum = 31999, 
         Cost = 0, 
         Weight = 1, 
      }, 
   }, 
   ResetFrequency = 3, 
   Filename = "tatooine.lua", 
   ResetMessage = "", 
   LowEconomy = 27791139, 
   VnumRanges = 
   {
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
      Room = 
      {
         Last = 31999, 
         First = 31500, 
      }, 
   }, 
   Author = "Satin", 
   Name = "Tatooine", 
}
