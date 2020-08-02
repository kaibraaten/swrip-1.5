-- Tatooine
-- Last saved Sunday 02-Aug-2020 16:01:04

AreaEntry
{
   ResetFrequency = 3, 
   LowEconomy = 28123339, 
   Author = "Satin", 
   Mobiles = 
   {
      [31500] = 
      {
         ShortDescr = "a short monk", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Position = "standing", 
         Height = 0, 
         ArmorClass = 0, 
         HitRoll = 0, 
         Level = 22, 
         LongDescr = "A monk wanders around the palace.\
", 
         Weight = 0, 
         Race = "Human", 
         HitChance = 
         {
            HitPlus = 0, 
            HitNoDice = 0, 
            HitSizeDice = 0, 
         }, 
         Credits = 0, 
         Description = "This is a aged monk. He has lived here for many years and has small scars on\
his body.\
", 
         Flags = 
         {
            [0] = "Npc", 
            [2] = "Scavenger", 
            [6] = "StayArea", 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         DamRoll = 0, 
         Name = "monk", 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Intelligence = 10, 
            Strength = 10, 
            Luck = 10, 
            Constitution = 10, 
            Charisma = 10, 
            Dexterity = 10, 
         }, 
         Alignment = 100, 
         NumberOfAttacks = 0, 
         DefaultPosition = "standing", 
         Sex = "male", 
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
         Vnum = 31500, 
      }, 
      [31501] = 
      {
         ShortDescr = "a large Jawa", 
         AffectedBy = 
         {
            [7] = "Sanctuary", 
         }, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Position = "standing", 
         Height = 0, 
         ArmorClass = 0, 
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
            ProfitSell = 0, 
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
            ProfitBuy = 110, 
            KeeperShortDescr = "a large Jawa", 
         }, 
         HitRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Level = 35, 
         LongDescr = "A large, mean looking Jawa sits in his chair comfortably here selling liquids for journeys out into the great dune sea.\
", 
         Weight = 0, 
         Race = "Human", 
         HitChance = 
         {
            HitPlus = 0, 
            HitNoDice = 0, 
            HitSizeDice = 0, 
         }, 
         Credits = 30000, 
         Vnum = 31501, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [6] = "StayArea", 
            [7] = "Wimpy", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "all_greet_prog", 
               Arguments = "100", 
               Code = "say If you're looking for some goods...\
say ... you've come to the right place.\
", 
            }, 
         }, 
         DamRoll = 0, 
         Name = "water jawa", 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Intelligence = 10, 
            Strength = 10, 
            Luck = 10, 
            Constitution = 10, 
            Charisma = 10, 
            Dexterity = 10, 
         }, 
         Sex = "male", 
         NumberOfAttacks = 0, 
         DefaultPosition = "standing", 
         Alignment = 111, 
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
         Description = "This jawa seems fierce and old. He has a small pouch where he keeps his money\
and change for customers willing to purchase something.\
", 
      }, 
      [31502] = 
      {
         ShortDescr = "a large krayt dragon", 
         AffectedBy = 
         {
            [7] = "Sanctuary", 
         }, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Position = "standing", 
         Height = 0, 
         ArmorClass = -170, 
         HitRoll = 0, 
         Level = 100, 
         LongDescr = "A large krayt stands here towering over you, staring you in the eye.\
", 
         Weight = 0, 
         Race = "Human", 
         HitChance = 
         {
            HitPlus = 0, 
            HitNoDice = 0, 
            HitSizeDice = 0, 
         }, 
         Credits = 0, 
         Vnum = 31502, 
         Flags = 
         {
            [1] = "Sentinel", 
            [2] = "Scavenger", 
            [0] = "Npc", 
            [5] = "Aggressive", 
            [6] = "StayArea", 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         DamRoll = 0, 
         Name = "Krayt dragon", 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Intelligence = 10, 
            Strength = 10, 
            Luck = 10, 
            Constitution = 10, 
            Charisma = 10, 
            Dexterity = 10, 
         }, 
         Sex = "female", 
         NumberOfAttacks = 0, 
         DefaultPosition = "standing", 
         Alignment = 0, 
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
         Description = "This ferocious creature is rare but very valuble to many people throughout\
this galaxy. As it eyes you, you wonder what to do.\
", 
      }, 
      [31503] = 
      {
         ShortDescr = "a small womp Rat", 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 0, 
         }, 
         Position = "standing", 
         Height = 0, 
         ArmorClass = 97, 
         HitRoll = 0, 
         Level = 1, 
         LongDescr = "A womp rat hops by.\
", 
         Weight = 0, 
         Race = "Human", 
         HitChance = 
         {
            HitPlus = 10, 
            HitNoDice = 0, 
            HitSizeDice = 10, 
         }, 
         Credits = 0, 
         Description = "This creature does not look to be of one of the more appreciated kind.\
", 
         Flags = 
         {
            [0] = "Npc", 
            [2] = "Scavenger", 
            [6] = "StayArea", 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         DamRoll = 0, 
         Name = "womp rat", 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Intelligence = 10, 
            Strength = 10, 
            Luck = 10, 
            Constitution = 10, 
            Charisma = 10, 
            Dexterity = 10, 
         }, 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         DefaultPosition = "standing", 
         Sex = "male", 
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
         Vnum = 31503, 
      }, 
      [31504] = 
      {
         ShortDescr = "a young Jawa", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Position = "standing", 
         Height = 0, 
         ArmorClass = 0, 
         HitRoll = 0, 
         Level = 3, 
         LongDescr = "A young Jawa walks around here.\
", 
         Weight = 0, 
         Race = "Human", 
         HitChance = 
         {
            HitPlus = 0, 
            HitNoDice = 0, 
            HitSizeDice = 0, 
         }, 
         Credits = 0, 
         Description = "This creature is not one of the more respectable species but manages to live\
on its own. This Jawa is a very young and untrained.\
", 
         Flags = 
         {
            [0] = "Npc", 
            [2] = "Scavenger", 
            [6] = "StayArea", 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         DamRoll = 0, 
         Name = "Young Jawa", 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Intelligence = 10, 
            Strength = 10, 
            Luck = 10, 
            Constitution = 10, 
            Charisma = 10, 
            Dexterity = 10, 
         }, 
         Alignment = 115, 
         NumberOfAttacks = 0, 
         DefaultPosition = "standing", 
         Sex = "male", 
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
         Vnum = 31504, 
      }, 
      [31505] = 
      {
         ShortDescr = "a Jawa guard", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Position = "standing", 
         Height = 0, 
         ArmorClass = 0, 
         HitRoll = 0, 
         Level = 25, 
         LongDescr = "The Jawa guard stands here guarding something.\
", 
         Weight = 0, 
         Race = "Human", 
         HitChance = 
         {
            HitPlus = 0, 
            HitNoDice = 0, 
            HitSizeDice = 0, 
         }, 
         Credits = 0, 
         Description = "This is not a regular filthy creature. This Jawa is trained and armed to the\
teeth. Consider it before you attack him.\
", 
         Flags = 
         {
            [1] = "Sentinel", 
            [2] = "Scavenger", 
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         DamRoll = 0, 
         Name = "jawa guard", 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Intelligence = 10, 
            Strength = 10, 
            Luck = 10, 
            Constitution = 10, 
            Charisma = 10, 
            Dexterity = 10, 
         }, 
         Alignment = 150, 
         NumberOfAttacks = 0, 
         DefaultPosition = "standing", 
         Sex = "male", 
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
         Vnum = 31505, 
      }, 
      [31506] = 
      {
         ShortDescr = "a scavenger", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Position = "standing", 
         Height = 0, 
         ArmorClass = 0, 
         HitRoll = 0, 
         Level = 3, 
         LongDescr = "A scavenger walks around here picking up anything he can see.\
", 
         Weight = 0, 
         Race = "Human", 
         HitChance = 
         {
            HitPlus = 0, 
            HitNoDice = 0, 
            HitSizeDice = 0, 
         }, 
         Credits = 0, 
         Description = "This scavenger is a small animal whom which no attention is regarded.\
", 
         Flags = 
         {
            [0] = "Npc", 
            [2] = "Scavenger", 
            [6] = "StayArea", 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         DamRoll = 0, 
         Name = "Scavenger", 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Intelligence = 10, 
            Strength = 10, 
            Luck = 10, 
            Constitution = 10, 
            Charisma = 10, 
            Dexterity = 10, 
         }, 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         DefaultPosition = "standing", 
         Sex = "male", 
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
         Vnum = 31506, 
      }, 
      [31507] = 
      {
         ShortDescr = "a moisture farmer", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Position = "standing", 
         Height = 0, 
         ArmorClass = 0, 
         HitRoll = 0, 
         Level = 9, 
         LongDescr = "A moisture farmer walks around here, trying to find his destination.\
", 
         Weight = 0, 
         Race = "Human", 
         HitChance = 
         {
            HitPlus = 0, 
            HitNoDice = 0, 
            HitSizeDice = 0, 
         }, 
         Credits = 0, 
         Description = "You are looking at one of the ancestors of this planet. They have been here\
ever since the Dowager Queen crashed into the planet.\
", 
         Flags = 
         {
            [0] = "Npc", 
            [2] = "Scavenger", 
            [6] = "StayArea", 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         DamRoll = 0, 
         Name = "Moisture Farmer", 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Intelligence = 10, 
            Strength = 10, 
            Luck = 10, 
            Constitution = 10, 
            Charisma = 10, 
            Dexterity = 10, 
         }, 
         Alignment = 140, 
         NumberOfAttacks = 0, 
         DefaultPosition = "standing", 
         Sex = "male", 
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
         Vnum = 31507, 
      }, 
      [31508] = 
      {
         ShortDescr = "a square power droid", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Position = "standing", 
         Height = 0, 
         ArmorClass = 0, 
         HitRoll = 0, 
         Level = 8, 
         LongDescr = "A power droid moves around on the ground here, humming.\
", 
         Weight = 0, 
         Race = "Human", 
         HitChance = 
         {
            HitPlus = 0, 
            HitNoDice = 0, 
            HitSizeDice = 0, 
         }, 
         Credits = 0, 
         Description = "This power droid is rather old and has been used for many different purposes\
over the years of its existence. Although it is still functional it is almost\
ready to be trashed. Small wires and shorted connections are sprawled out on\
different parts of the droids surface.\
", 
         Flags = 
         {
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         DamRoll = 0, 
         Name = "Power droid", 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Intelligence = 10, 
            Strength = 10, 
            Luck = 10, 
            Constitution = 10, 
            Charisma = 10, 
            Dexterity = 10, 
         }, 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         DefaultPosition = "standing", 
         Sex = "undistinguished", 
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
         Vnum = 31508, 
      }, 
      [31509] = 
      {
         ShortDescr = "an astromech droid", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Position = "standing", 
         Height = 0, 
         ArmorClass = 0, 
         HitRoll = 0, 
         Level = 15, 
         LongDescr = "A small astromech droid stands around here chirping away.\
", 
         Weight = 0, 
         Race = "Human", 
         HitChance = 
         {
            HitPlus = 0, 
            HitNoDice = 0, 
            HitSizeDice = 0, 
         }, 
         Credits = 0, 
         Description = "This droid, when speaking, makes no sense to you. Throught its beeps and\
sounds its trying to say something to you but you have no clue what. This\
droid seems to have been used before but is in excellent shape.\
", 
         Flags = 
         {
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         DamRoll = 0, 
         Name = "Astromech droid.", 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Intelligence = 10, 
            Strength = 10, 
            Luck = 10, 
            Constitution = 10, 
            Charisma = 10, 
            Dexterity = 10, 
         }, 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         DefaultPosition = "standing", 
         Sex = "undistinguished", 
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
         Vnum = 31509, 
      }, 
      [31510] = 
      {
         ShortDescr = "a wise Jawa", 
         AffectedBy = 
         {
            [7] = "Sanctuary", 
         }, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Position = "standing", 
         Height = 0, 
         ArmorClass = 0, 
         HitRoll = 0, 
         HitChance = 
         {
            HitPlus = 0, 
            HitNoDice = 0, 
            HitSizeDice = 0, 
         }, 
         Level = 45, 
         LongDescr = "A wise Jawa stands here ready to teach you skills.\
", 
         Weight = 0, 
         Race = "Human", 
         SaveVs = 
         {
            Breath = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Credits = 0, 
         Vnum = 31510, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [9] = "Train", 
            [6] = "StayArea", 
         }, 
         DamRoll = 0, 
         VipFlags = 
         {
            [8] = "Tatooine", 
         }, 
         Name = "Wise Jawa", 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Intelligence = 10, 
            Strength = 10, 
            Luck = 10, 
            Constitution = 10, 
            Charisma = 10, 
            Dexterity = 10, 
         }, 
         Sex = "undistinguished", 
         NumberOfAttacks = 0, 
         DefaultPosition = "standing", 
         Alignment = 210, 
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
         Description = "This Jawa has studied the ways of this world for many years, and if you pay\
attention can teach you may things of many uses. Be careful not to attack him\
for he has great powers.\
", 
      }, 
      [31511] = 
      {
         ShortDescr = "a guardian", 
         AffectedBy = 
         {
            [7] = "Sanctuary", 
         }, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Position = "standing", 
         Height = 0, 
         ArmorClass = 0, 
         HitRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Level = 40, 
         LongDescr = "A guardian stands here watching over The Wise One.\
", 
         Weight = 0, 
         Race = "Human", 
         HitChance = 
         {
            HitPlus = 0, 
            HitNoDice = 0, 
            HitSizeDice = 0, 
         }, 
         Credits = 0, 
         Vnum = 31511, 
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
               MudProgType = "speech_prog", 
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
               Arguments = "p arrives from the west.", 
               Code = "say Welcome! Are you ready to learn young apprentice?\
", 
            }, 
         }, 
         DamRoll = 0, 
         Name = "Guardian", 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Intelligence = 10, 
            Strength = 10, 
            Luck = 10, 
            Constitution = 10, 
            Charisma = 10, 
            Dexterity = 10, 
         }, 
         Sex = "male", 
         NumberOfAttacks = 0, 
         DefaultPosition = "standing", 
         Alignment = 0, 
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
         Description = "This is no mere guard. He too has developed many skills and is powerful. You\
should consider attacking him, wisely.\
", 
      }, 
      [31512] = 
      {
         ShortDescr = "a Tusken Raider", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Position = "standing", 
         Height = 0, 
         ArmorClass = 0, 
         DamRoll = 0, 
         HitRoll = 0, 
         HitChance = 
         {
            HitPlus = 0, 
            HitNoDice = 0, 
            HitSizeDice = 0, 
         }, 
         Level = 23, 
         LongDescr = "A Tusken Rauder watches you waiting for the right moment to attack.\
", 
         Weight = 0, 
         Race = "Human", 
         SaveVs = 
         {
            Breath = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Credits = 0, 
         Description = "This species has adapted to the ways of living in the desert. He is strong in\
mind and is very vicious. Be careful what you do.\
", 
         Flags = 
         {
            [0] = "Npc", 
            [5] = "Aggressive", 
            [2] = "Scavenger", 
            [6] = "StayArea", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "all_greet_prog", 
               Arguments = "70", 
               Code = "snarl\
swear $n\
", 
            }, 
         }, 
         VipFlags = 
         {
            [8] = "Tatooine", 
         }, 
         Name = "Sand person tusken raider", 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Intelligence = 10, 
            Strength = 10, 
            Luck = 10, 
            Constitution = 10, 
            Charisma = 10, 
            Dexterity = 10, 
         }, 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         DefaultPosition = "standing", 
         Sex = "male", 
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
         Vnum = 31512, 
      }, 
      [31513] = 
      {
         ShortDescr = "a Tusken Raider storyteller.", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Position = "standing", 
         Height = 0, 
         ArmorClass = 0, 
         HitRoll = 0, 
         Level = 30, 
         LongDescr = "A Wise Tusken Raider sits here telling a story.\
", 
         Weight = 0, 
         Race = "Human", 
         HitChance = 
         {
            HitPlus = 0, 
            HitNoDice = 0, 
            HitSizeDice = 0, 
         }, 
         Credits = 0, 
         Description = "This Tusken Raider has survived years of training and memory. To become what\
he is he cannot make any mistakes or alter in any way a story told from the\
past or he will be killed, for the Sand People believe that once told a story\
can never be altered in any way.\
", 
         Flags = 
         {
            [0] = "Npc", 
            [2] = "Scavenger", 
            [6] = "StayArea", 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         DamRoll = 0, 
         Name = "Sand people tusken raider Storyteller.", 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Intelligence = 10, 
            Strength = 10, 
            Luck = 10, 
            Constitution = 10, 
            Charisma = 10, 
            Dexterity = 10, 
         }, 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         DefaultPosition = "standing", 
         Sex = "male", 
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
         Vnum = 31513, 
      }, 
      [31514] = 
      {
         ShortDescr = "a storyteller in training", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Position = "standing", 
         Height = 0, 
         ArmorClass = 0, 
         HitRoll = 0, 
         Level = 25, 
         LongDescr = "A storyteller in training listens carefully here so that he may remember every story with precision and awe.      \
", 
         Weight = 0, 
         Race = "Human", 
         HitChance = 
         {
            HitPlus = 0, 
            HitNoDice = 0, 
            HitSizeDice = 0, 
         }, 
         Credits = 0, 
         Description = "This is one of the younger, wiser Sand People. He is being trained to become\
the next Storyteller of the Sand People. He just hopes in his mind that he\
will remember and remember well every story precisely.\
", 
         Flags = 
         {
            [0] = "Npc", 
            [2] = "Scavenger", 
            [6] = "StayArea", 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         DamRoll = 0, 
         Name = "Storyteller training.", 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Intelligence = 10, 
            Strength = 10, 
            Luck = 10, 
            Constitution = 10, 
            Charisma = 10, 
            Dexterity = 10, 
         }, 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         DefaultPosition = "standing", 
         Sex = "male", 
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
         Vnum = 31514, 
      }, 
      [31515] = 
      {
         ShortDescr = "a ronto", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Position = "standing", 
         Height = 0, 
         ArmorClass = 0, 
         HitRoll = 0, 
         Level = 45, 
         LongDescr = "A ronto stands here towering over you.\
", 
         Weight = 0, 
         Race = "Human", 
         HitChance = 
         {
            HitPlus = 0, 
            HitNoDice = 0, 
            HitSizeDice = 0, 
         }, 
         Credits = 0, 
         Description = "This creature is rather tame but when provoked can be aggressive and\
dangerous. Watch your step.\
", 
         Flags = 
         {
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         DamRoll = 0, 
         Name = "Ronto", 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Intelligence = 10, 
            Strength = 10, 
            Luck = 10, 
            Constitution = 10, 
            Charisma = 10, 
            Dexterity = 10, 
         }, 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         DefaultPosition = "standing", 
         Sex = "male", 
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
         Vnum = 31515, 
      }, 
      [31516] = 
      {
         ShortDescr = "a bantha", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Position = "standing", 
         Height = 0, 
         ArmorClass = 0, 
         HitRoll = 0, 
         Level = 35, 
         LongDescr = "A bantha walks around here slowly, waiting for its master.\
", 
         Weight = 0, 
         Race = "Human", 
         HitChance = 
         {
            HitPlus = 0, 
            HitNoDice = 0, 
            HitSizeDice = 0, 
         }, 
         Credits = 0, 
         Description = "This is a large furry creature which is rumored to have crushed people with\
one step. Be careful for he does not like people who are not his master.\
", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [5] = "Aggressive", 
            [6] = "StayArea", 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         DamRoll = 0, 
         Name = "Bantha", 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Intelligence = 10, 
            Strength = 10, 
            Luck = 10, 
            Constitution = 10, 
            Charisma = 10, 
            Dexterity = 10, 
         }, 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         DefaultPosition = "standing", 
         Sex = "male", 
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
         Vnum = 31516, 
      }, 
      [31517] = 
      {
         ShortDescr = "a mechanic", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Position = "standing", 
         Height = 0, 
         ArmorClass = 0, 
         HitRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Level = 14, 
         LongDescr = "A mechanic waits here to be hired.\
", 
         Weight = 0, 
         Race = "Human", 
         HitChance = 
         {
            HitPlus = 0, 
            HitNoDice = 0, 
            HitSizeDice = 0, 
         }, 
         Credits = 0, 
         Description = "This mechanic is rather young, he has marks and wrinkles from work and\
possibly war. He seems to be calm and will stay away from you unless you\
need something which he may sometimes have.\
", 
         Flags = 
         {
            [1] = "Sentinel", 
            [2] = "Scavenger", 
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "all_greet_prog", 
               Arguments = "100", 
               Code = "say So ya need something fixed, eh?\
", 
            }, 
         }, 
         DamRoll = 0, 
         Name = "Mechanic", 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Intelligence = 10, 
            Strength = 10, 
            Luck = 10, 
            Constitution = 10, 
            Charisma = 10, 
            Dexterity = 10, 
         }, 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         DefaultPosition = "standing", 
         Sex = "male", 
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
         Vnum = 31517, 
      }, 
      [31518] = 
      {
         ShortDescr = "a tall Jawa", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Position = "standing", 
         Height = 0, 
         ArmorClass = 0, 
         HitRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Level = 19, 
         LongDescr = "A tall jawa stands here protecting his Rontos.\
", 
         Weight = 0, 
         Race = "Human", 
         HitChance = 
         {
            HitPlus = 0, 
            HitNoDice = 0, 
            HitSizeDice = 0, 
         }, 
         Credits = 0, 
         Description = "This Jawa is probably the tallest Jawa ever. Although he is still smaller than\
you he looks tough, and with that gun I would be scared.\
", 
         Flags = 
         {
            [1] = "Sentinel", 
            [2] = "Scavenger", 
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "all_greet_prog", 
               Arguments = "100", 
               Code = "say So...\
say You're interested in rontos, eh?\
nudge $n\
", 
            }, 
         }, 
         DamRoll = 0, 
         Name = "tall jawa", 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Intelligence = 10, 
            Strength = 10, 
            Luck = 10, 
            Constitution = 10, 
            Charisma = 10, 
            Dexterity = 10, 
         }, 
         Alignment = 140, 
         NumberOfAttacks = 0, 
         DefaultPosition = "standing", 
         Sex = "male", 
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
         Vnum = 31518, 
      }, 
      [31519] = 
      {
         ShortDescr = "Wuher", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Position = "standing", 
         Height = 0, 
         ArmorClass = 0, 
         HitRoll = 0, 
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
            ProfitSell = 100, 
            BusinessHours = 
            {
               Close = 23, 
               Open = 1, 
            }, 
            ProfitBuy = 105, 
            KeeperShortDescr = "Wuher", 
         }, 
         Level = 65, 
         LongDescr = "Wuher stands here serving people their drinks.\
", 
         Weight = 0, 
         Race = "Human", 
         HitChance = 
         {
            HitPlus = 0, 
            HitNoDice = 0, 
            HitSizeDice = 0, 
         }, 
         Credits = 0, 
         Description = "This man is rather old and has been working here for many years as bartender.\
Be careful though, he still has his same old edge.\
", 
         Flags = 
         {
            [1] = "Sentinel", 
            [2] = "Scavenger", 
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         DamRoll = 0, 
         Name = "Wuher", 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Intelligence = 10, 
            Strength = 10, 
            Luck = 10, 
            Constitution = 10, 
            Charisma = 10, 
            Dexterity = 10, 
         }, 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         DefaultPosition = "standing", 
         Sex = "male", 
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
         Vnum = 31519, 
      }, 
      [31520] = 
      {
         ShortDescr = "a small womp rat", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Position = "standing", 
         Height = 0, 
         ArmorClass = 0, 
         HitRoll = 0, 
         Level = 0, 
         LongDescr = "A small womp rat walks around here.\
", 
         Weight = 0, 
         Race = "Jawa", 
         HitChance = 
         {
            HitPlus = 0, 
            HitNoDice = 0, 
            HitSizeDice = 0, 
         }, 
         Credits = 0, 
         Description = "A small womp rat walk around here seeking shelter.\
", 
         Flags = 
         {
            [0] = "Npc", 
            [24] = "NoAssist", 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         DamRoll = 0, 
         Name = "small Womp Rat", 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Intelligence = 10, 
            Strength = 10, 
            Luck = 10, 
            Constitution = 10, 
            Charisma = 10, 
            Dexterity = 10, 
         }, 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         DefaultPosition = "standing", 
         Sex = "undistinguished", 
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
         Vnum = 31520, 
      }, 
      [31521] = 
      {
         ShortDescr = "a small thief", 
         AttackFlags = 
         {
            [5] = "kick", 
         }, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Position = "standing", 
         Height = 0, 
         ArmorClass = 0, 
         HitRoll = 0, 
         Level = 9, 
         LongDescr = "A small thief Walks about trying to pick your pocket.\
", 
         Weight = 0, 
         Race = "Human", 
         HitChance = 
         {
            HitPlus = 0, 
            HitNoDice = 0, 
            HitSizeDice = 0, 
         }, 
         Credits = 0, 
         Description = "", 
         Flags = 
         {
            [0] = "Npc", 
            [24] = "NoAssist", 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         DamRoll = 0, 
         Name = "Small Thief", 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Intelligence = 10, 
            Strength = 10, 
            Luck = 10, 
            Constitution = 10, 
            Charisma = 10, 
            Dexterity = 10, 
         }, 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         DefaultPosition = "standing", 
         Sex = "undistinguished", 
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
         Vnum = 31521, 
      }, 
      [31522] = 
      {
         ShortDescr = "a large thief", 
         AttackFlags = 
         {
            [4] = "punch", 
         }, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Position = "standing", 
         Height = 0, 
         ArmorClass = 0, 
         HitRoll = 0, 
         Level = 11, 
         LongDescr = "A large thief walks about here.\
", 
         Weight = 0, 
         Race = "Human", 
         HitChance = 
         {
            HitPlus = 0, 
            HitNoDice = 0, 
            HitSizeDice = 0, 
         }, 
         Credits = 0, 
         Description = "", 
         Flags = 
         {
            [0] = "Npc", 
            [24] = "NoAssist", 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         DamRoll = 0, 
         Name = "Large thief", 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Intelligence = 10, 
            Strength = 10, 
            Luck = 10, 
            Constitution = 10, 
            Charisma = 10, 
            Dexterity = 10, 
         }, 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         DefaultPosition = "standing", 
         Sex = "undistinguished", 
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
         Vnum = 31522, 
      }, 
      [31523] = 
      {
         ShortDescr = "a skillful thief", 
         AttackFlags = 
         {
            [4] = "punch", 
         }, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Position = "standing", 
         Height = 0, 
         ArmorClass = 0, 
         HitRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Level = 17, 
         LongDescr = "A skillful thief walks about here.\
", 
         Weight = 0, 
         Race = "Human", 
         HitChance = 
         {
            HitPlus = 0, 
            HitNoDice = 0, 
            HitSizeDice = 0, 
         }, 
         Credits = 0, 
         Description = "", 
         Flags = 
         {
            [0] = "Npc", 
            [24] = "NoAssist", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "35", 
               Code = "Steal credits $n\
", 
            }, 
         }, 
         DamRoll = 0, 
         Name = "skillful thief", 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Intelligence = 10, 
            Strength = 10, 
            Luck = 10, 
            Constitution = 10, 
            Charisma = 10, 
            Dexterity = 10, 
         }, 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         DefaultPosition = "standing", 
         Sex = "undistinguished", 
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
         Vnum = 31523, 
      }, 
      [31524] = 
      {
         ShortDescr = "a smuggler", 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Position = "standing", 
         Height = 0, 
         ArmorClass = 0, 
         HitRoll = 0, 
         Level = 18, 
         LongDescr = "A smuggler sits at a table watching.\
", 
         Weight = 0, 
         Race = "Human", 
         HitChance = 
         {
            HitPlus = 0, 
            HitNoDice = 0, 
            HitSizeDice = 0, 
         }, 
         Credits = 0, 
         Description = "", 
         Flags = 
         {
            [0] = "Npc", 
            [24] = "NoAssist", 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         DamRoll = 0, 
         Name = "Smuggler", 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Intelligence = 10, 
            Strength = 10, 
            Luck = 10, 
            Constitution = 10, 
            Charisma = 10, 
            Dexterity = 10, 
         }, 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         DefaultPosition = "standing", 
         Sex = "undistinguished", 
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
         Vnum = 31524, 
      }, 
      [31525] = 
      {
         ShortDescr = "an experienced smuggler", 
         AttackFlags = 
         {
            [5] = "kick", 
            [6] = "_06", 
            [9] = "_09", 
         }, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Position = "standing", 
         Height = 0, 
         ArmorClass = 0, 
         HitRoll = 0, 
         Level = 26, 
         LongDescr = "An experienced smuggler waits for his contact here.\
", 
         Weight = 0, 
         Race = "Human", 
         HitChance = 
         {
            HitPlus = 0, 
            HitNoDice = 0, 
            HitSizeDice = 0, 
         }, 
         Credits = 0, 
         Description = "", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         DamRoll = 0, 
         Name = "Experienced Smuggler", 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Intelligence = 10, 
            Strength = 10, 
            Luck = 10, 
            Constitution = 10, 
            Charisma = 10, 
            Dexterity = 10, 
         }, 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         DefaultPosition = "standing", 
         Sex = "undistinguished", 
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
         Vnum = 31525, 
      }, 
      [31526] = 
      {
         ShortDescr = "an Ithorian", 
         AttackFlags = 
         {
            [6] = "_06", 
            [5] = "kick", 
         }, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Position = "standing", 
         Height = 0, 
         ArmorClass = 0, 
         HitRoll = 0, 
         Level = 14, 
         LongDescr = "An Ithorian drinks his liquors here.\
", 
         Weight = 0, 
         Race = "Human", 
         HitChance = 
         {
            HitPlus = 0, 
            HitNoDice = 0, 
            HitSizeDice = 0, 
         }, 
         Credits = 0, 
         Description = "", 
         Flags = 
         {
            [0] = "Npc", 
            [24] = "NoAssist", 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         DamRoll = 0, 
         Name = "Ithorian", 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Intelligence = 10, 
            Strength = 10, 
            Luck = 10, 
            Constitution = 10, 
            Charisma = 10, 
            Dexterity = 10, 
         }, 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         DefaultPosition = "standing", 
         Sex = "undistinguished", 
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
         Vnum = 31526, 
      }, 
      [31527] = 
      {
         ShortDescr = "a female citizen", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Position = "standing", 
         Height = 0, 
         ArmorClass = 0, 
         HitRoll = 0, 
         Level = 6, 
         LongDescr = "A female citizen minds her own buisness here.\
", 
         Weight = 0, 
         Race = "Human", 
         HitChance = 
         {
            HitPlus = 0, 
            HitNoDice = 0, 
            HitSizeDice = 0, 
         }, 
         Credits = 0, 
         Description = "", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         DamRoll = 0, 
         Name = "Female citizen", 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Intelligence = 10, 
            Strength = 10, 
            Luck = 10, 
            Constitution = 10, 
            Charisma = 10, 
            Dexterity = 10, 
         }, 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         DefaultPosition = "standing", 
         Sex = "undistinguished", 
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
         Vnum = 31527, 
      }, 
      [31528] = 
      {
         ShortDescr = "a male citizen", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Position = "standing", 
         Height = 0, 
         ArmorClass = 0, 
         HitRoll = 0, 
         Level = 13, 
         LongDescr = "A male citizen walks around here.\
", 
         Weight = 0, 
         Race = "Human", 
         HitChance = 
         {
            HitPlus = 0, 
            HitNoDice = 0, 
            HitSizeDice = 0, 
         }, 
         Credits = 0, 
         Description = "", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         DamRoll = 0, 
         Name = "Male citizen", 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Intelligence = 10, 
            Strength = 10, 
            Luck = 10, 
            Constitution = 10, 
            Charisma = 10, 
            Dexterity = 10, 
         }, 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         DefaultPosition = "standing", 
         Sex = "undistinguished", 
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
         Vnum = 31528, 
      }, 
      [31529] = 
      {
         ShortDescr = "a Rodian", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Position = "standing", 
         Height = 0, 
         ArmorClass = 0, 
         HitRoll = 0, 
         Level = 9, 
         LongDescr = "A Rodian sits here contemplating his navel.\
", 
         Weight = 0, 
         Race = "Human", 
         HitChance = 
         {
            HitPlus = 0, 
            HitNoDice = 0, 
            HitSizeDice = 0, 
         }, 
         Credits = 0, 
         Description = "", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         DamRoll = 0, 
         Name = "Rodian", 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Intelligence = 10, 
            Strength = 10, 
            Luck = 10, 
            Constitution = 10, 
            Charisma = 10, 
            Dexterity = 10, 
         }, 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         DefaultPosition = "standing", 
         Sex = "undistinguished", 
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
         Vnum = 31529, 
      }, 
      [31530] = 
      {
         ShortDescr = "Merth", 
         AttackFlags = 
         {
            [9] = "_09", 
            [5] = "kick", 
         }, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Position = "standing", 
         Height = 0, 
         ArmorClass = 0, 
         HitRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Level = 103, 
         LongDescr = "Merth walks around here.\
", 
         Weight = 0, 
         Race = "Human", 
         HitChance = 
         {
            HitPlus = 0, 
            HitNoDice = 0, 
            HitSizeDice = 0, 
         }, 
         Credits = 0, 
         Description = "", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "fight_prog", 
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
         DamRoll = 0, 
         Name = "Merth", 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Intelligence = 10, 
            Strength = 10, 
            Luck = 10, 
            Constitution = 10, 
            Charisma = 10, 
            Dexterity = 10, 
         }, 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         DefaultPosition = "standing", 
         Sex = "undistinguished", 
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
         Vnum = 31530, 
      }, 
      [31531] = 
      {
         ShortDescr = "Wioslea", 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 3, 
         }, 
         Position = "standing", 
         Height = 0, 
         ArmorClass = 20, 
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
            ProfitSell = 0, 
            BusinessHours = 
            {
               Close = 23, 
               Open = 1, 
            }, 
            ProfitBuy = 120, 
            KeeperShortDescr = "Wioslea", 
         }, 
         DamRoll = 6, 
         HitRoll = 6, 
         HitChance = 
         {
            HitPlus = 320, 
            HitNoDice = 6, 
            HitSizeDice = 10, 
         }, 
         Level = 32, 
         LongDescr = "Wioslea tends to her customers need.\
", 
         Weight = 0, 
         Race = "Human", 
         SaveVs = 
         {
            Breath = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Credits = 0, 
         Description = "", 
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
               MudProgType = "all_greet_prog", 
               Arguments = "100", 
               Code = "say Business is bad, get outta here!\
grin\
", 
            }, 
         }, 
         VipFlags = 
         {
            [8] = "Tatooine", 
         }, 
         Name = "Wioslea", 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Intelligence = 10, 
            Strength = 10, 
            Luck = 10, 
            Constitution = 10, 
            Charisma = 10, 
            Dexterity = 10, 
         }, 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         DefaultPosition = "standing", 
         Sex = "undistinguished", 
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
         Vnum = 31531, 
      }, 
      [31532] = 
      {
         ShortDescr = "Gep", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Position = "standing", 
         Height = 0, 
         ArmorClass = 0, 
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
            ProfitSell = 100, 
            BusinessHours = 
            {
               Close = 23, 
               Open = 1, 
            }, 
            ProfitBuy = 110, 
            KeeperShortDescr = "Gep", 
         }, 
         HitRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Level = 1, 
         LongDescr = "Gep Stands here selling you food for your travels.\
", 
         Weight = 0, 
         Race = "Human", 
         HitChance = 
         {
            HitPlus = 0, 
            HitNoDice = 0, 
            HitSizeDice = 0, 
         }, 
         Credits = 0, 
         Description = "", 
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
               MudProgType = "all_greet_prog", 
               Arguments = "100", 
               Code = "if ispc($n)\
    say Hello customer.\
    say I have everything you need just type \"list\".\
endif\
", 
            }, 
         }, 
         DamRoll = 0, 
         Name = "Gep", 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Intelligence = 10, 
            Strength = 10, 
            Luck = 10, 
            Constitution = 10, 
            Charisma = 10, 
            Dexterity = 10, 
         }, 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         DefaultPosition = "standing", 
         Sex = "undistinguished", 
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
         Vnum = 31532, 
      }, 
      [31533] = 
      {
         ShortDescr = "a pump mechanic", 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 2, 
         }, 
         Position = "standing", 
         Height = 0, 
         ArmorClass = 50, 
         HitRoll = 4, 
         Level = 20, 
         LongDescr = "A Sullustan pump maintenance mechanic seems to be goofing off here.\
", 
         Weight = 0, 
         Race = "Sullustan", 
         HitChance = 
         {
            HitPlus = 200, 
            HitNoDice = 4, 
            HitSizeDice = 10, 
         }, 
         Credits = 200, 
         Description = "Taller than most Sullustans, the pump maintenance mechanic appears to be\
in decent shape. His ears is also larger than usual, and his eyes are dark\
and gleaming.\
", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         DamRoll = 4, 
         Name = "Sullustan pump mechanic", 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Intelligence = 10, 
            Strength = 10, 
            Luck = 10, 
            Constitution = 10, 
            Charisma = 10, 
            Dexterity = 10, 
         }, 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         DefaultPosition = "standing", 
         Sex = "male", 
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
         Vnum = 31533, 
      }, 
      [31534] = 
      {
         ShortDescr = "a tatoo-rat", 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 2, 
         }, 
         Position = "standing", 
         Height = 0, 
         ArmorClass = 50, 
         HitRoll = 4, 
         SaveVs = 
         {
            Breath = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Level = 20, 
         LongDescr = "A tatoo-rat seems to be searching for food.\
", 
         Weight = 0, 
         Race = "Rodent", 
         HitChance = 
         {
            HitPlus = 200, 
            HitNoDice = 4, 
            HitSizeDice = 10, 
         }, 
         Credits = 0, 
         Description = "A tatoo-rat is a small rodent with brown fur and a long tail.\
", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "death_prog", 
               Arguments = "100", 
               Code = "-- Drop loot on death\
if rand(50)\
    -- Low-quality rodent skin\
    mpoload 31533\
endif\
", 
            }, 
         }, 
         DamRoll = 4, 
         Name = "tatoo-rat", 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Intelligence = 10, 
            Strength = 10, 
            Luck = 10, 
            Constitution = 10, 
            Charisma = 10, 
            Dexterity = 10, 
         }, 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         DefaultPosition = "standing", 
         Sex = "undistinguished", 
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
         Vnum = 31534, 
      }, 
      [31535] = 
      {
         ShortDescr = "a retired merc", 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 10, 
         }, 
         Position = "standing", 
         Height = 0, 
         ArmorClass = -150, 
         HitRoll = 20, 
         Level = 100, 
         LongDescr = "A retired merc is here, eager to teach the next generation.\
", 
         Weight = 0, 
         Race = "Human", 
         HitChance = 
         {
            HitPlus = 20000, 
            HitNoDice = 20, 
            HitSizeDice = 10, 
         }, 
         Credits = 0, 
         Description = "", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [10] = "Practice", 
            [30] = "Prototype", 
            [9] = "Train", 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         DamRoll = 20, 
         Name = "retired merc", 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Intelligence = 10, 
            Strength = 25, 
            Luck = 10, 
            Constitution = 25, 
            Charisma = 10, 
            Dexterity = 25, 
         }, 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         DefaultPosition = "standing", 
         Sex = "male", 
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
         Vnum = 31535, 
      }, 
      [31536] = 
      {
         ShortDescr = "an experienced zabrak engineer", 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 10, 
         }, 
         Position = "standing", 
         Height = 0, 
         ArmorClass = -150, 
         HitRoll = 20, 
         Level = 100, 
         LongDescr = "An experienced zabrak engineer teaches basic engineering skills.\
", 
         Weight = 0, 
         Race = "Zabrak", 
         HitChance = 
         {
            HitPlus = 20000, 
            HitNoDice = 20, 
            HitSizeDice = 10, 
         }, 
         Credits = 0, 
         Description = "", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [10] = "Practice", 
            [30] = "Prototype", 
            [9] = "Train", 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         DamRoll = 20, 
         Name = "experienced zabrak engineer", 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Intelligence = 25, 
            Strength = 10, 
            Luck = 10, 
            Constitution = 10, 
            Charisma = 10, 
            Dexterity = 10, 
         }, 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         DefaultPosition = "standing", 
         Sex = "male", 
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
         Vnum = 31536, 
      }, 
      [31537] = 
      {
         ShortDescr = "Mayor Mikdanyell Guh'rantt", 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 10, 
         }, 
         Position = "standing", 
         Height = 0, 
         ArmorClass = -150, 
         HitRoll = 20, 
         Level = 100, 
         LongDescr = "Mayor Mikdanyell Guh'rantt is here.\
", 
         Weight = 0, 
         Race = "Rodian", 
         HitChance = 
         {
            HitPlus = 20000, 
            HitNoDice = 20, 
            HitSizeDice = 10, 
         }, 
         Credits = 0, 
         Description = "", 
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
         SaveVs = 
         {
            Breath = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         DamRoll = 20, 
         Name = "Mayor Mikdanyell Guh'rantt", 
         Stats = 
         {
            Force = 0, 
            Wisdom = 25, 
            Intelligence = 25, 
            Strength = 10, 
            Luck = 10, 
            Constitution = 10, 
            Charisma = 25, 
            Dexterity = 10, 
         }, 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         DefaultPosition = "standing", 
         Sex = "male", 
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
         Vnum = 31537, 
      }, 
      [31538] = 
      {
         ShortDescr = "a Bothan smuggler", 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 10, 
         }, 
         Position = "standing", 
         Height = 0, 
         ArmorClass = -150, 
         HitRoll = 20, 
         Level = 100, 
         LongDescr = "A Bothan smuggler is enjoying some downtime.\
", 
         Weight = 0, 
         Race = "Bothan", 
         HitChance = 
         {
            HitPlus = 20000, 
            HitNoDice = 20, 
            HitSizeDice = 10, 
         }, 
         Credits = 0, 
         Description = "", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [10] = "Practice", 
            [30] = "Prototype", 
            [9] = "Train", 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         DamRoll = 20, 
         Name = "Bothan smuggler", 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Intelligence = 10, 
            Strength = 10, 
            Luck = 20, 
            Constitution = 10, 
            Charisma = 10, 
            Dexterity = 10, 
         }, 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         DefaultPosition = "standing", 
         Sex = "male", 
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
         Vnum = 31538, 
      }, 
      [31539] = 
      {
         ShortDescr = "the facility manager", 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 10, 
         }, 
         Position = "standing", 
         Height = 0, 
         ArmorClass = -150, 
         HitRoll = 20, 
         SaveVs = 
         {
            Breath = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Level = 100, 
         LongDescr = "The facility manager is doing some paperwork.\
", 
         Weight = 0, 
         Race = "Duros", 
         HitChance = 
         {
            HitPlus = 20000, 
            HitNoDice = 20, 
            HitSizeDice = 10, 
         }, 
         Credits = 0, 
         Description = "", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [9] = "Train", 
            [10] = "Practice", 
            [25] = "NoKill", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "p yes", 
               Code = "if ispc($n)\
    say Great. Just type PRACTICE and we can get down to business.\
endif\
", 
            }, 
            [2] = 
            {
               MudProgType = "all_greet_prog", 
               Arguments = "100", 
               Code = "if ispc($n)\
    if level($n) <= 25\
        say Welcome. I can give you some basic flight lessons if you want.\
    endif\
endif\
", 
            }, 
         }, 
         DamRoll = 20, 
         Name = "facility manager", 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Intelligence = 10, 
            Strength = 10, 
            Luck = 10, 
            Constitution = 10, 
            Charisma = 10, 
            Dexterity = 25, 
         }, 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         DefaultPosition = "standing", 
         Sex = "male", 
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
         Vnum = 31539, 
      }, 
      [31900] = 
      {
         ShortDescr = "Zim the Failed Jedi", 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 10, 
         }, 
         Position = "standing", 
         Height = 0, 
         ArmorClass = -150, 
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
            ProfitSell = 90, 
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
            ProfitBuy = 120, 
            KeeperShortDescr = "Zim the Failed Jedi", 
         }, 
         DamRoll = 20, 
         HitRoll = 20, 
         HitChance = 
         {
            HitPlus = 15000, 
            HitNoDice = 20, 
            HitSizeDice = 10, 
         }, 
         Level = 100, 
         LongDescr = "Zim the Failed Jedi stands here before you.\
", 
         Weight = 0, 
         Race = "Human", 
         SaveVs = 
         {
            Breath = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Credits = 0, 
         Description = "Zim is a middle-aged male human with silvery stripes in his dark brown hair.\
His stomach is bulging over a leather belt that has a lightsaber hanging from\
it. \
\
In his younger days, during the Clone Wars, he was an apprentice to a minor\
Jedi Master. Unfortunately Zim never quite had the talent to pass the Jedi\
trials, and when Order 66 was issued, he was somehow overlooked. Since then\
he's been in hiding, seeking to pass on what little he learned. \
", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [10] = "Practice", 
            [30] = "Prototype", 
            [9] = "Train", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "3", 
               Code = "if rand(33)\
    hiccup\
elif rand(50)\
    say Where did I put that bottle?\
else\
    mutter\
endif\
", 
            }, 
            [2] = 
            {
               MudProgType = "all_greet_prog", 
               Arguments = "100", 
               Code = "if ispc($n)\
if isjedi($n)\
  if level($n) >= 25\
    say There isn't much more I can teach you, $n. Find Obi-Wan Kenobi.\
    say I hear he's hiding somewhere out in the desert. I never managed to find him myself, though.\
  else\
    if rand(25)\
      say Did you know I sell practice lightsabers? I make them myself, you know.\
      emote beams proudly\
    else\
      say Why did you come here? To learn?\
      say Maybe I can teach you some basics, even if I never completed my own training.\
    endif\
  endif\
else\
  mpechoat $n $I looks you over disapprovingly.\
endif\
endif\
", 
            }, 
         }, 
         Alignment = 0, 
         Name = "zim failed jedi", 
         Stats = 
         {
            Force = 20, 
            Wisdom = 25, 
            Intelligence = 10, 
            Strength = 10, 
            Luck = 10, 
            Constitution = 10, 
            Charisma = 10, 
            Dexterity = 10, 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         NumberOfAttacks = 0, 
         DefaultPosition = "standing", 
         Sex = "male", 
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
         Vnum = 31900, 
      }, 
      [31902] = 
      {
         ShortDescr = "a disillusioned student", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Position = "standing", 
         Height = 0, 
         ArmorClass = 0, 
         HitRoll = 0, 
         SaveVs = 
         {
            Breath = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Level = 1, 
         LongDescr = "A disillusioned student is doing chores.\
", 
         Weight = 0, 
         Race = "Human", 
         HitChance = 
         {
            HitPlus = 0, 
            HitNoDice = 10, 
            HitSizeDice = 100, 
         }, 
         Credits = 0, 
         Description = "", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "greet_prog", 
               Arguments = "100", 
               Code = "-- Kitchen duty\
if inroom($i) == 31901\
    mpechoat $n $I looks at you with weary eyes.\
    mpechoaround $n $I looks at $n with weary eyes.\
    say I really hate kitchen duty.\
    sigh\
endif\
\
-- In common room, pretending to do his chores\
if inroom($i) == 31900\
    mpechoat $n Upon seeing you, $I grabs a broom and pretends $j was doing $l chores.\
endif\
\
-- Trying to assemble a lightsaber, and failing miserably\
if inroom($i) == 31906\
    mpecho $I seems to be on the verge of crying as $j fails assembling a lightsaber.\
endif\
\
-- In sleeping quarters\
if inroom($i) == 31903\
    yawn\
endif\
", 
            }, 
         }, 
         DamRoll = 0, 
         Name = "disillusioned student", 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Intelligence = 10, 
            Strength = 10, 
            Luck = 10, 
            Constitution = 10, 
            Charisma = 10, 
            Dexterity = 10, 
         }, 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         DefaultPosition = "standing", 
         Sex = "male", 
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
         Vnum = 31902, 
      }, 
      [31901] = 
      {
         ShortDescr = "a Jedi sparring partner", 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 2, 
         }, 
         Position = "standing", 
         Height = 0, 
         ArmorClass = 50, 
         HitRoll = 4, 
         SaveVs = 
         {
            Breath = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Level = 20, 
         LongDescr = "A Jedi sparring partner looks eager for action.\
", 
         Weight = 0, 
         Race = "Human", 
         HitChance = 
         {
            HitPlus = 10000, 
            HitNoDice = 4, 
            HitSizeDice = 10, 
         }, 
         Credits = 0, 
         Description = "This young Jedi apprentice has long, brown hair in a low ponytail. His bland\
facial features are covered by a cropped beard. He's wearing plain clothes to\
blend in with the Mos Eisley population. Wearing Jedi robes would be very\
risky these days.\
", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "p disarm me", 
               Code = "if knowsskill($n) == grip\
    if isfight($i)\
        say En guarde!\
        disarm\
    else\
        say We need to be fighting first.\
    endif\
else\
    say You'd better learn the GRIP skill first.\
endif\
", 
            }, 
            [2] = 
            {
               MudProgType = "all_greet_prog", 
               Arguments = "100", 
               Code = "if ispc($n)\
say Welcome, I'm your sparring partner today.\
\
if knowsskill($n) == disarm\
    say You can practice your disarm skill on me. I'll fetch a new 'saber when needed.\
endif\
\
if knowsskill($n) == grip\
    say If your want to practice your grip skill, I can try disarming you when you say DISARM ME.\
endif\
endif\
", 
            }, 
            [3] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "1", 
               Code = "-- Load up and replace lightsaber battery every now and then.\
\
if not isfight($i)\
    if ovnuminv(10324) < 1\
        mpoload 10324\
    endif\
\
    battery\
endif\
", 
            }, 
            [4] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "10", 
               Code = "-- This script will make sure the mob always has a working lightsaber.\
-- This way the mob can be used to grind the disarm skill.\
\
if ovnumcarry(10323) < 1\
    mpoload 10323\
endif\
\
wield lightsaber\
", 
            }, 
         }, 
         DamRoll = 4, 
         Name = "jedi sparring partner", 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Intelligence = 10, 
            Strength = 10, 
            Luck = 10, 
            Constitution = 10, 
            Charisma = 10, 
            Dexterity = 10, 
         }, 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         DefaultPosition = "standing", 
         Sex = "male", 
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
         Vnum = 31901, 
      }, 
      [31999] = 
      {
         ShortDescr = "a newly created lastmob", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Position = "standing", 
         Height = 0, 
         ArmorClass = 0, 
         HitRoll = 0, 
         Level = 1, 
         LongDescr = "Some god abandoned a newly created lastmob here.\
", 
         Weight = 0, 
         Race = "Human", 
         HitChance = 
         {
            HitPlus = 0, 
            HitNoDice = 0, 
            HitSizeDice = 0, 
         }, 
         Credits = 0, 
         Description = "", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         DamRoll = 0, 
         Name = "lastmob", 
         Stats = 
         {
            Force = 0, 
            Wisdom = 10, 
            Intelligence = 10, 
            Strength = 10, 
            Luck = 10, 
            Constitution = 10, 
            Charisma = 10, 
            Dexterity = 10, 
         }, 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         DefaultPosition = "standing", 
         Sex = "undistinguished", 
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
         Vnum = 31999, 
      }, 
   }, 
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
   HighEconomy = 0, 
   Name = "Tatooine", 
   Resets = 
   {
      [1] = 
      {
         Arg3 = 31767, 
         Arg1 = 31500, 
         Arg2 = 1, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [2] = 
      {
         Arg3 = 0, 
         Arg1 = 31500, 
         Arg2 = 100, 
         Command = "E", 
         MiscData = 1, 
      }, 
      [3] = 
      {
         Arg3 = 31756, 
         Arg1 = 31501, 
         Arg2 = 100, 
         Command = "O", 
         MiscData = 1, 
      }, 
      [4] = 
      {
         Arg3 = 31756, 
         Arg1 = 31501, 
         Arg2 = 100, 
         Command = "O", 
         MiscData = 1, 
      }, 
      [5] = 
      {
         Arg3 = 31756, 
         Arg1 = 31500, 
         Arg2 = 1, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [6] = 
      {
         Arg3 = 0, 
         Arg1 = 31500, 
         Arg2 = 100, 
         Command = "E", 
         MiscData = 1, 
      }, 
      [7] = 
      {
         Arg3 = 31759, 
         Arg1 = 31501, 
         Arg2 = 100, 
         Command = "O", 
         MiscData = 1, 
      }, 
      [8] = 
      {
         Arg3 = 31758, 
         Arg1 = 31501, 
         Arg2 = 100, 
         Command = "O", 
         MiscData = 1, 
      }, 
      [9] = 
      {
         Arg3 = 31758, 
         Arg1 = 31501, 
         Arg2 = 100, 
         Command = "O", 
         MiscData = 1, 
      }, 
      [10] = 
      {
         Arg3 = 31758, 
         Arg1 = 31501, 
         Arg2 = 100, 
         Command = "O", 
         MiscData = 1, 
      }, 
      [11] = 
      {
         Arg3 = 31588, 
         Arg1 = 31502, 
         Arg2 = 100, 
         Command = "O", 
         MiscData = 1, 
      }, 
      [12] = 
      {
         Arg3 = 31588, 
         Arg1 = 31502, 
         Arg2 = 100, 
         Command = "O", 
         MiscData = 1, 
      }, 
      [13] = 
      {
         Arg3 = 31588, 
         Arg1 = 31502, 
         Arg2 = 100, 
         Command = "O", 
         MiscData = 1, 
      }, 
      [14] = 
      {
         Arg3 = 31806, 
         Arg1 = 31503, 
         Arg2 = 100, 
         Command = "O", 
         MiscData = 1, 
      }, 
      [15] = 
      {
         Arg3 = 31806, 
         Arg1 = 31503, 
         Arg2 = 100, 
         Command = "O", 
         MiscData = 1, 
      }, 
      [16] = 
      {
         Arg3 = 31806, 
         Arg1 = 31502, 
         Arg2 = 1, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [17] = 
      {
         Arg3 = 0, 
         Arg1 = 31504, 
         Arg2 = 100, 
         Command = "E", 
         MiscData = 1, 
      }, 
      [18] = 
      {
         Arg3 = 6, 
         Arg1 = 31505, 
         Arg2 = 100, 
         Command = "E", 
         MiscData = 1, 
      }, 
      [19] = 
      {
         Arg3 = 31831, 
         Arg1 = 31505, 
         Arg2 = 1, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [20] = 
      {
         Arg3 = 31833, 
         Arg1 = 31508, 
         Arg2 = 100, 
         Command = "O", 
         MiscData = 1, 
      }, 
      [21] = 
      {
         Arg3 = 31837, 
         Arg1 = 31511, 
         Arg2 = 1, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [22] = 
      {
         Arg3 = 31837, 
         Arg1 = 31511, 
         Arg2 = 1, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [23] = 
      {
         Arg3 = 31837, 
         Arg1 = 31511, 
         Arg2 = 1, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [24] = 
      {
         Arg3 = 16, 
         Arg1 = 31511, 
         Arg2 = 100, 
         Command = "E", 
         MiscData = 1, 
      }, 
      [25] = 
      {
         Arg3 = 31838, 
         Arg1 = 31510, 
         Arg2 = 1, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [26] = 
      {
         Arg3 = 31831, 
         Arg1 = 31508, 
         Arg2 = 100, 
         Command = "O", 
         MiscData = 1, 
      }, 
      [27] = 
      {
         Arg3 = 31612, 
         Arg1 = 31514, 
         Arg2 = 100, 
         Command = "O", 
         MiscData = 1, 
      }, 
      [28] = 
      {
         Arg3 = 31847, 
         Arg1 = 31517, 
         Arg2 = 1, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [29] = 
      {
         Arg3 = 6, 
         Arg1 = 31516, 
         Arg2 = 100, 
         Command = "E", 
         MiscData = 1, 
      }, 
      [30] = 
      {
         Arg3 = 13, 
         Arg1 = 31515, 
         Arg2 = 100, 
         Command = "E", 
         MiscData = 1, 
      }, 
      [31] = 
      {
         Arg3 = 2, 
         Arg1 = 31850, 
         Arg2 = 5, 
         Command = "D", 
         MiscData = 1, 
      }, 
      [32] = 
      {
         Arg3 = 31851, 
         Arg1 = 31518, 
         Arg2 = 1, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [33] = 
      {
         Arg3 = 16, 
         Arg1 = 31517, 
         Arg2 = 100, 
         Command = "E", 
         MiscData = 1, 
      }, 
      [34] = 
      {
         Arg3 = 31852, 
         Arg1 = 31515, 
         Arg2 = 4, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [35] = 
      {
         Arg3 = 31852, 
         Arg1 = 31515, 
         Arg2 = 1, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [36] = 
      {
         Arg3 = 31852, 
         Arg1 = 31515, 
         Arg2 = 1, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [37] = 
      {
         Arg3 = 31852, 
         Arg1 = 31515, 
         Arg2 = 1, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [38] = 
      {
         Arg3 = 31852, 
         Arg1 = 31515, 
         Arg2 = 1, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [39] = 
      {
         Arg3 = 31852, 
         Arg1 = 31515, 
         Arg2 = 1, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [40] = 
      {
         Arg3 = 31715, 
         Arg1 = 31512, 
         Arg2 = 1, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [41] = 
      {
         Arg3 = 31715, 
         Arg1 = 31512, 
         Arg2 = 1, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [42] = 
      {
         Arg3 = 31715, 
         Arg1 = 31513, 
         Arg2 = 1, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [43] = 
      {
         Arg3 = 31715, 
         Arg1 = 31514, 
         Arg2 = 1, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [44] = 
      {
         Arg3 = 31715, 
         Arg1 = 31513, 
         Arg2 = 1, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [45] = 
      {
         Arg3 = 31715, 
         Arg1 = 31516, 
         Arg2 = 1, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [46] = 
      {
         Arg3 = 31715, 
         Arg1 = 31516, 
         Arg2 = 1, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [47] = 
      {
         Arg3 = 31853, 
         Arg1 = 31519, 
         Arg2 = 100, 
         Command = "O", 
         MiscData = 1, 
      }, 
      [48] = 
      {
         Arg3 = 31863, 
         Arg1 = 31519, 
         Arg2 = 1, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [49] = 
      {
         Arg3 = 31863, 
         Arg1 = 31520, 
         Arg2 = 100, 
         Command = "O", 
         MiscData = 1, 
      }, 
      [50] = 
      {
         Arg3 = 31871, 
         Arg1 = 31520, 
         Arg2 = 12, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [51] = 
      {
         Arg3 = 31871, 
         Arg1 = 31520, 
         Arg2 = 12, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [52] = 
      {
         Arg3 = 31871, 
         Arg1 = 31520, 
         Arg2 = 12, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [53] = 
      {
         Arg3 = 31871, 
         Arg1 = 31520, 
         Arg2 = 12, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [54] = 
      {
         Arg3 = 31871, 
         Arg1 = 31520, 
         Arg2 = 12, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [55] = 
      {
         Arg3 = 31871, 
         Arg1 = 31520, 
         Arg2 = 12, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [56] = 
      {
         Arg3 = 31817, 
         Arg1 = 31501, 
         Arg2 = 1, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [57] = 
      {
         Arg3 = 12, 
         Arg1 = 31509, 
         Arg2 = 1, 
         Command = "E", 
         MiscData = 1, 
      }, 
      [58] = 
      {
         Arg2 = 1, 
         Command = "G", 
         MiscData = 1, 
         Arg1 = 10314, 
      }, 
      [59] = 
      {
         Arg3 = 31861, 
         Arg1 = 31504, 
         Arg2 = 1, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [60] = 
      {
         Arg3 = 31861, 
         Arg1 = 31527, 
         Arg2 = 1, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [61] = 
      {
         Arg3 = 31861, 
         Arg1 = 31507, 
         Arg2 = 1, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [62] = 
      {
         Arg3 = 31862, 
         Arg1 = 31526, 
         Arg2 = 1, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [63] = 
      {
         Arg3 = 31862, 
         Arg1 = 31521, 
         Arg2 = 1, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [64] = 
      {
         Arg3 = 31862, 
         Arg1 = 31524, 
         Arg2 = 1, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [65] = 
      {
         Arg3 = 31857, 
         Arg1 = 31525, 
         Arg2 = 1, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [66] = 
      {
         Arg3 = 31857, 
         Arg1 = 31506, 
         Arg2 = 1, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [67] = 
      {
         Arg3 = 31854, 
         Arg1 = 31527, 
         Arg2 = 2, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [68] = 
      {
         Arg3 = 31854, 
         Arg1 = 31523, 
         Arg2 = 1, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [69] = 
      {
         Arg3 = 31854, 
         Arg1 = 31525, 
         Arg2 = 2, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [70] = 
      {
         Arg3 = 31854, 
         Arg1 = 31528, 
         Arg2 = 1, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [71] = 
      {
         Arg3 = 31856, 
         Arg1 = 31526, 
         Arg2 = 2, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [72] = 
      {
         Arg3 = 31856, 
         Arg1 = 31528, 
         Arg2 = 2, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [73] = 
      {
         Arg3 = 31858, 
         Arg1 = 31529, 
         Arg2 = 1, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [74] = 
      {
         Arg3 = 31855, 
         Arg1 = 31520, 
         Arg2 = 13, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [75] = 
      {
         Arg3 = 31855, 
         Arg1 = 31524, 
         Arg2 = 2, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [76] = 
      {
         Arg3 = 31653, 
         Arg1 = 31503, 
         Arg2 = 1, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [77] = 
      {
         Arg3 = 31840, 
         Arg1 = 31514, 
         Arg2 = 1, 
         Command = "O", 
         MiscData = 1, 
      }, 
      [78] = 
      {
         Arg3 = 31870, 
         Arg1 = 31520, 
         Arg2 = 19, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [79] = 
      {
         Arg3 = 31870, 
         Arg1 = 31520, 
         Arg2 = 19, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [80] = 
      {
         Arg3 = 31870, 
         Arg1 = 31520, 
         Arg2 = 19, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [81] = 
      {
         Arg3 = 31870, 
         Arg1 = 31520, 
         Arg2 = 19, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [82] = 
      {
         Arg3 = 31870, 
         Arg1 = 31520, 
         Arg2 = 19, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [83] = 
      {
         Arg3 = 31870, 
         Arg1 = 31520, 
         Arg2 = 19, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [84] = 
      {
         Arg3 = 31830, 
         Arg1 = 31521, 
         Arg2 = 1, 
         Command = "O", 
         MiscData = 1, 
      }, 
      [85] = 
      {
         Arg3 = 31875, 
         Arg1 = 31531, 
         Arg2 = 1, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [86] = 
      {
         Arg3 = 31601, 
         Arg1 = 31504, 
         Arg2 = 100, 
         Command = "M", 
         MiscData = 0, 
      }, 
      [87] = 
      {
         Arg3 = 31602, 
         Arg1 = 31504, 
         Arg2 = 100, 
         Command = "M", 
         MiscData = 0, 
      }, 
      [88] = 
      {
         Arg3 = 31603, 
         Arg1 = 31504, 
         Arg2 = 100, 
         Command = "M", 
         MiscData = 0, 
      }, 
      [89] = 
      {
         Arg3 = 31604, 
         Arg1 = 31504, 
         Arg2 = 100, 
         Command = "M", 
         MiscData = 0, 
      }, 
      [90] = 
      {
         Arg3 = 31819, 
         Arg1 = 31504, 
         Arg2 = 100, 
         Command = "M", 
         MiscData = 0, 
      }, 
      [91] = 
      {
         Arg3 = 31821, 
         Arg1 = 31504, 
         Arg2 = 100, 
         Command = "M", 
         MiscData = 0, 
      }, 
      [92] = 
      {
         Arg3 = 31822, 
         Arg1 = 31504, 
         Arg2 = 100, 
         Command = "M", 
         MiscData = 0, 
      }, 
      [93] = 
      {
         Arg3 = 31824, 
         Arg1 = 31504, 
         Arg2 = 100, 
         Command = "M", 
         MiscData = 0, 
      }, 
      [94] = 
      {
         Arg3 = 31828, 
         Arg1 = 31504, 
         Arg2 = 100, 
         Command = "M", 
         MiscData = 0, 
      }, 
      [95] = 
      {
         Arg3 = 31829, 
         Arg1 = 31504, 
         Arg2 = 100, 
         Command = "M", 
         MiscData = 0, 
      }, 
      [96] = 
      {
         Arg3 = 31830, 
         Arg1 = 31504, 
         Arg2 = 100, 
         Command = "M", 
         MiscData = 0, 
      }, 
      [97] = 
      {
         Arg3 = 31832, 
         Arg1 = 31504, 
         Arg2 = 100, 
         Command = "M", 
         MiscData = 0, 
      }, 
      [98] = 
      {
         Arg3 = 31834, 
         Arg1 = 31504, 
         Arg2 = 100, 
         Command = "M", 
         MiscData = 0, 
      }, 
      [99] = 
      {
         Arg3 = 31835, 
         Arg1 = 31504, 
         Arg2 = 100, 
         Command = "M", 
         MiscData = 0, 
      }, 
      [100] = 
      {
         Arg3 = 31837, 
         Arg1 = 31504, 
         Arg2 = 100, 
         Command = "M", 
         MiscData = 0, 
      }, 
      [101] = 
      {
         Arg3 = 31601, 
         Arg1 = 31503, 
         Arg2 = 20, 
         Command = "M", 
         MiscData = 0, 
      }, 
      [102] = 
      {
         Arg3 = 31602, 
         Arg1 = 31503, 
         Arg2 = 20, 
         Command = "M", 
         MiscData = 0, 
      }, 
      [103] = 
      {
         Arg3 = 31603, 
         Arg1 = 31503, 
         Arg2 = 20, 
         Command = "M", 
         MiscData = 0, 
      }, 
      [104] = 
      {
         Arg3 = 31604, 
         Arg1 = 31503, 
         Arg2 = 20, 
         Command = "M", 
         MiscData = 0, 
      }, 
      [105] = 
      {
         Arg3 = 31653, 
         Arg1 = 31503, 
         Arg2 = 20, 
         Command = "M", 
         MiscData = 0, 
      }, 
      [106] = 
      {
         Arg3 = 31840, 
         Arg1 = 31503, 
         Arg2 = 20, 
         Command = "M", 
         MiscData = 0, 
      }, 
      [107] = 
      {
         Arg3 = 31883, 
         Arg1 = 31532, 
         Arg2 = 1, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [108] = 
      {
         Arg3 = 31863, 
         Arg1 = 328, 
         Arg2 = 1, 
         Command = "M", 
         MiscData = 0, 
      }, 
      [109] = 
      {
         Arg3 = 16, 
         Arg1 = 55, 
         Arg2 = 1, 
         Command = "E", 
         MiscData = 1, 
      }, 
      [110] = 
      {
         Arg3 = 31905, 
         Arg1 = 31900, 
         Arg2 = 1, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [111] = 
      {
         Arg2 = 1, 
         Command = "G", 
         MiscData = 1, 
         Arg1 = 10323, 
      }, 
      [112] = 
      {
         Arg2 = 1, 
         Command = "G", 
         MiscData = 1, 
         Arg1 = 10324, 
      }, 
      [113] = 
      {
         Arg3 = 31899, 
         Arg1 = 31525, 
         Arg2 = 1, 
         Command = "O", 
         MiscData = 1, 
      }, 
      [114] = 
      {
         Arg3 = 31900, 
         Arg1 = 31526, 
         Arg2 = 1, 
         Command = "O", 
         MiscData = 1, 
      }, 
      [115] = 
      {
         Arg3 = 31998, 
         Arg1 = 31527, 
         Arg2 = 1, 
         Command = "O", 
         MiscData = 0, 
      }, 
      [116] = 
      {
         Arg3 = 31997, 
         Arg1 = 31528, 
         Arg2 = 1, 
         Command = "O", 
         MiscData = 0, 
      }, 
      [117] = 
      {
         Arg3 = 31909, 
         Arg1 = 31901, 
         Arg2 = 1, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [118] = 
      {
         Arg3 = 16, 
         Arg1 = 10323, 
         Arg2 = 1, 
         Command = "E", 
         MiscData = 1, 
      }, 
      [119] = 
      {
         Arg3 = 31901, 
         Arg1 = 31902, 
         Arg2 = 1, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [120] = 
      {
         Arg3 = 31901, 
         Arg1 = 31529, 
         Arg2 = 1, 
         Command = "O", 
         MiscData = 1, 
      }, 
      [121] = 
      {
         Arg3 = 0, 
         Arg1 = 31522, 
         Arg2 = 1, 
         Command = "P", 
         MiscData = 0, 
      }, 
      [122] = 
      {
         Arg3 = 0, 
         Arg1 = 31524, 
         Arg2 = 1, 
         Command = "P", 
         MiscData = 1, 
      }, 
      [123] = 
      {
         Arg3 = 31902, 
         Arg1 = 31530, 
         Arg2 = 1, 
         Command = "O", 
         MiscData = 1, 
      }, 
      [124] = 
      {
         Arg3 = 31503, 
         Arg1 = 31533, 
         Arg2 = 1, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [125] = 
      {
         Arg2 = 1, 
         Command = "G", 
         MiscData = 1, 
         Arg1 = 32210, 
      }, 
      [126] = 
      {
         Arg3 = 5, 
         Arg1 = 31532, 
         Arg2 = 1, 
         Command = "E", 
         MiscData = 1, 
      }, 
      [127] = 
      {
         Arg3 = 31503, 
         Arg1 = 31531, 
         Arg2 = 1, 
         Command = "O", 
         MiscData = 1, 
      }, 
      [128] = 
      {
         Arg3 = 31502, 
         Arg1 = 31534, 
         Arg2 = 2, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [129] = 
      {
         Arg3 = 31502, 
         Arg1 = 31534, 
         Arg2 = 2, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [130] = 
      {
         Arg3 = 31623, 
         Arg1 = 31534, 
         Arg2 = 1, 
         Command = "O", 
         MiscData = 1, 
      }, 
      [131] = 
      {
         Arg3 = 2, 
         Arg1 = 31623, 
         Arg2 = 2, 
         Command = "D", 
         MiscData = 0, 
      }, 
      [132] = 
      {
         Arg3 = 31908, 
         Arg1 = 31534, 
         Arg2 = 3, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [133] = 
      {
         Arg3 = 31908, 
         Arg1 = 31535, 
         Arg2 = 1, 
         Command = "O", 
         MiscData = 1, 
      }, 
      [134] = 
      {
         Arg3 = 31626, 
         Arg1 = 31535, 
         Arg2 = 1, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [135] = 
      {
         Arg3 = 31632, 
         Arg1 = 31536, 
         Arg2 = 1, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [136] = 
      {
         Arg3 = 31636, 
         Arg1 = 31537, 
         Arg2 = 1, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [137] = 
      {
         Arg3 = 31857, 
         Arg1 = 31538, 
         Arg2 = 1, 
         Command = "M", 
         MiscData = 0, 
      }, 
      [138] = 
      {
         Arg3 = 31612, 
         Arg1 = 31539, 
         Arg2 = 31612, 
         Command = "M", 
         MiscData = 0, 
      }, 
      [139] = 
      {
         Arg3 = 1, 
         Arg1 = 31638, 
         Arg2 = 0, 
         Command = "D", 
         MiscData = 0, 
      }, 
      [140] = 
      {
         Arg3 = 1, 
         Arg1 = 31639, 
         Arg2 = 2, 
         Command = "D", 
         MiscData = 0, 
      }, 
      [141] = 
      {
         Arg3 = 1, 
         Arg1 = 31641, 
         Arg2 = 5, 
         Command = "D", 
         MiscData = 0, 
      }, 
      [142] = 
      {
         Arg3 = 1, 
         Arg1 = 31644, 
         Arg2 = 4, 
         Command = "D", 
         MiscData = 0, 
      }, 
      [143] = 
      {
         Arg3 = 31640, 
         Arg1 = 31536, 
         Arg2 = 1, 
         Command = "O", 
         MiscData = 1, 
      }, 
      [144] = 
      {
         Arg3 = 31645, 
         Arg1 = 31537, 
         Arg2 = 1, 
         Command = "O", 
         MiscData = 1, 
      }, 
      [145] = 
      {
         Arg3 = 0, 
         Arg1 = 31538, 
         Arg2 = 1, 
         Command = "P", 
         MiscData = 0, 
      }, 
   }, 
   VnumRanges = 
   {
      Room = 
      {
         First = 31500, 
         Last = 31999, 
      }, 
      Mob = 
      {
         First = 31500, 
         Last = 31999, 
      }, 
      Object = 
      {
         First = 31500, 
         Last = 31999, 
      }, 
   }, 
   Rooms = 
   {
      [31744] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You can smell an odour developing around you.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Jundland Wastes", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31745, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31743, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "mountain", 
         Vnum = 31744, 
      }, 
      [31745] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You stand on a hard rocky surface. The air around you is very unpleasant.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Jundland Wastes", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31744, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "mountain", 
         Vnum = 31745, 
      }, 
      [31746] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are walking down a long, narrow hallway which turns at the end.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Long Hallway", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31747, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31735, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31746, 
      }, 
      [31747] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are walking down a hallway. It is old and there is a rather digusting\
smell all around you.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Hallway Through Jabba's Palace", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31748, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31746, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31747, 
      }, 
      [31748] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are standing in a hallway. To each side all along the hall there are\
small individual rooms.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Long Hallway in Jabba's Palace", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31749, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31747, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31748, 
      }, 
      [31749] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are coming to the end of the hallway which curves both to the east and\
to the west.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Long Hallway End", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31750, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31748, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31749, 
      }, 
      [31750] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are in a small narrow hallway which has a very disgusting odour, not\
surprising considering what creatures and animals have lived here in the past\
and even now. The ground is cool and hard full of ripples as if never crafted\
or taken care of.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Narrow Hallway", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31751, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31749, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 31770, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [4] = 
            {
               Key = -1, 
               DestinationVnum = 31788, 
               Direction = "up", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31750, 
      }, 
      [31751] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are standing in a hallway facing east. As you look down the hallway at\
the end you can see different colored lights flashing in the dimness and the\
darkness. The ground is rough and the air is hot and heavy. Above a burnt out\
glowpanel lays motionless but you can still see pretty well.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Hallway Facing A Dark Room", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31768, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31752, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 31769, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [4] = 
            {
               Key = -1, 
               DestinationVnum = 31750, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31751, 
      }, 
      [31752] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are walking down a narrow hallway. To each side there are very small rooms\
which are vacant.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Narrow Hallway ", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31766, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31753, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 31767, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [4] = 
            {
               Key = -1, 
               DestinationVnum = 31751, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31752, 
      }, 
      [31753] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are walking down a hallway towards a very large opening. It appears not\
to be guarded or have a door in place. The ground beneath you is hard and full\
of cracks and uneven places. The air is heavy and hot but nothing that cannot\
be lived with.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "A Long Hallway ", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31764, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31754, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 31765, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [4] = 
            {
               Key = -1, 
               DestinationVnum = 31752, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31753, 
      }, 
      [31754] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You approach the dark room at the end of the hallway with every step you\
take. To you sides you continually see small occupied rooms. The ground\
beneath your feet is rough and uneven making you feet ache all over. The\
lighting here is minimal but you can still see down the hall.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "End Of Hallway Before A Large Room", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31762, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31755, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 31763, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [4] = 
            {
               Key = -1, 
               DestinationVnum = 31753, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31754, 
      }, 
      [31755] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are standing in front of a very large room with different sections in it.\
The entrance used to have doors but as you can see they have been removed for\
all that remains is the hinges.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "In Front Of A Large Room", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31760, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31756, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 31761, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [4] = 
            {
               Key = -1, 
               DestinationVnum = 31754, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31755, 
      }, 
      [31756] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You stand in a dark room filled with brain jars. Each brain is used to put\
inside of a spiderwalker. You can go down the rows in front of you. The ground\
is softer in here as if taken care of, there is not one ripple in the whole\
surface showing grace and care from the person or people that finished this\
room.\
", 
         Flags = 
         {
            [0] = "Dark", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Brain Jar Room", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31759, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31757, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 31755, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31756, 
      }, 
      [31757] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "All around you there are brains in jars. As you walk by they start screaming.\
As they scream the lights on the jars change color indicating that they are\
not calm at all. In front of you there is a row of containing shelves with\
jars gently placed on them.\
", 
         Flags = 
         {
            [0] = "Dark", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Brain Room", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31758, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31756, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31757, 
      }, 
      [31758] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are walking down a row. To your sides shelves are filled with brains from\
all species of the galaxy. These jars seem to be a bit calmer for their lights\
are not flaring off when you pass by them. this shows they are mature and\
prepared to be put into a body of some sort, most likely a spiderwalker.\
", 
         Flags = 
         {
            [0] = "Dark", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Brain Compartment", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31757, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31758, 
      }, 
      [31759] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are standing in a row with shelves in it. On each shelf jars have been\
placed carefully to ensure that they are safe and will not fall to the ground\
and break. The air is crisp and provides stability as you stare longly at the\
large amounts of jars.\
", 
         Flags = 
         {
            [0] = "Dark", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Row Of Jars", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31756, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31759, 
      }, 
      [31760] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are standing in small room which was initially designed to home a person.\
It has a window facing the sun.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Old Room", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31755, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31760, 
      }, 
      [31761] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are standing in room. It has dust all over it for it has not been used\
for many, many years.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Dusty Old Room", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31755, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31761, 
      }, 
      [31762] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "This is a larger room. It was probably designed to hold a larger species.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Large Guest Room", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31754, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31762, 
      }, 
      [31763] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "The room you are standing in is very small room. It has a window in the\
corner and an old bedframe in the corner which seems to have been destroyed by\
small rodents.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Old Small Calibered Room", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31754, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31763, 
      }, 
      [31764] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are standing in an extremely small room that was designed to hold a\
cleaning droid or two.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Storage Compartment For Droids", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31753, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31764, 
      }, 
      [31765] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are in a large room. It was made for a larger type species. It is used to\
house and for sleeping. This room has a very disgusting odour.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Large Specimen Room", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31753, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31765, 
      }, 
      [31766] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are standing in a small room with a window facing the great sand dune\
sea.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Small Unused Room", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31752, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31766, 
      }, 
      [31767] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are standing in a room which seems to be habitated. There is a small bed\
in the corner with a window mounted on the wall which looks outside.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Habitated Room", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31752, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31767, 
      }, 
      [31768] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are in a room of small caliber. You feel enclosed as you look around the\
room.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Small Enclosed Room", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31751, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31768, 
      }, 
      [31769] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are standing in a bedroom. It is not habitated but could be.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Unhabitated Room", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31751, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31769, 
      }, 
      [31770] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You walk down a long narrow hallway which floor is covered with stone and\
provides discomfort for your feet. To each side you can see some small and\
large rooms all with different uses. There is a glowpanel above your head\
barely functioning providing the dimmest of light all over.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Long Hallway", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31750, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31771, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31770, 
      }, 
      [31771] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "The hallway you walk down is on an uneven\
surface, it has ripples all along it and provides not much for heat or for\
comfort. There is no lighting here but you can still see down the gloomy\
hallway but not always with ease.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "A Hallway Passage", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31770, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31772, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31771, 
      }, 
      [31772] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "As you walk down the hallway on a cool stone floor you smell an odour, a\
rather unpleasant one, but having been in this palace it is no surprise that\
this smell is located here. The hallway is gloomy and the floor has a rough\
texture as if never smoothed out.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Dense Hallway", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31782, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31771, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 31784, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [4] = 
            {
               Key = -1, 
               DestinationVnum = 31773, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31772, 
      }, 
      [31773] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "The ground beneath your feet is made of pure stone, rather cold at night and\
still cool in the day the stone is what covers all the palace floors. You can\
see the end of the hallway just ahead of yourself. Large and without any\
features. Just a simple stone wall.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Long Narrowed Hallway", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31780, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31772, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 31781, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [4] = 
            {
               Key = -1, 
               DestinationVnum = 31774, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31773, 
      }, 
      [31774] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "The hallway you walk down is covered in stone, cold on your feet as you walk\
over it for it does not preserve heat well. A glowpanel above is burnt out\
and every once in a while a small burst of electricity comes rippling through\
the end of the cables. The air here is dense but not filled with a stench, a\
rather unusual thing for this palace. To both sides there are rooms of\
different caliber. There is a great stone wall stopping the end of the hall\
just ahead.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Hallway Leading To Individual Rooms", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31778, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31773, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 31779, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [4] = 
            {
               Key = -1, 
               DestinationVnum = 31775, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31774, 
      }, 
      [31775] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are standing at the end of the hallway. There is a very large stone wall\
before you covering your way further down the hallway. The stone wall is\
thick and rough with different textures all over its surface.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "End Of A Long Hallway", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31776, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31774, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 31777, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31775, 
      }, 
      [31776] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are standing in room of very small caliber. It was probably constructed to\
hold extra blankets. There are closets all along the walls.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Extra Small Compartment Room", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31775, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31776, 
      }, 
      [31777] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are in a large room. It was probably used as a sleeping quarter. There is\
a small bed in the corner which has been chewed away at by a small rodent.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Large Old Room", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31775, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31777, 
      }, 
      [31778] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are in a well sized room. It was used as a living quarters in the past.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Well Sized Room", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31774, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31778, 
      }, 
      [31779] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are standing in a living quarters. It is currently habitated. You can\
tell because of food on the floor.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Habitated Living Quarters", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31774, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31779, 
      }, 
      [31780] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are standing in a small room used to store extra supplies.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Supply Storage", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31773, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31780, 
      }, 
      [31781] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are in a very large room. It was made as a living quaters. There is a\
large window in front of you.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Large Living Quarters", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31773, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31781, 
      }, 
      [31782] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are in a smaller room. It can be used for any purpose.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Small Room", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31772, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31782, 
      }, 
      [31784] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are standing in a large room. There is a bed that can hold any species\
and a large window on the back wall.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Large Room", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31772, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31784, 
      }, 
      [31788] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are standing at the top of a staircase. In front of you there is a long\
hallway. Along the hallway many prison cells are there because Jabba use them\
for keeping people of unimportance.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Top Of Staircase", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31789, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31750, 
               Direction = "down", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31788, 
      }, 
      [31789] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are walking down the hallway. As you walk along you notice that all of\
the doors have been removed.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Prison Hallway", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31788, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31790, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31789, 
      }, 
      [31790] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are in the hallway. It ends just up ahead making it a rather short\
corridor.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Prison Hallway", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31789, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31794, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 31791, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [4] = 
            {
               Key = -1, 
               DestinationVnum = 31795, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31790, 
      }, 
      [31791] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You have come to the end of the hall. A stone wall lays in front of you,\
preventing you from advancing.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Prison Hallway End", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31790, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31792, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 31793, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31791, 
      }, 
      [31792] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are standing in a prison cell. If you turn back there are metal bars\
across the wall. All around you the only furniture in this cell is a prison\
bed.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Small Prison Cell", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31791, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31792, 
      }, 
      [31793] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are standing in a large prison cell. This cell was used for larger\
specimens. It has a toilet and a small bunk in the corner.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Large Prison Cell", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31791, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31793, 
      }, 
      [31794] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are standing in the smallest cell. This cell was used to hold very small\
specimens of life.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Extremely Small Cell", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31790, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31794, 
      }, 
      [31795] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are standing in a very large prison cell. It scares you to think what was\
kept in here. There is an awful smell.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Very Large Prison Cell", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31790, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31795, 
      }, 
      [31796] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You just fell down the trapdoor into the rancor's pit. Here there is a very\
disgusting smell. This room is immense. To the north is the smaller\
compartment the rancor was kept in while his cage was cleaned.\
", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Rancor's Pit", 
         Exits = 
         {
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31796, 
      }, 
      [31797] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You get crushed by gate and die(d.t)\
", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "DT", 
         Exits = 
         {
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31797, 
      }, 
      [31798] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You just slid down the chute into the rancor's cage. The room is an immense\
room and has a very foul odour to it. To the north the smaller room lays which\
the rancor was put when the cage was cleaned.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Rancor's Cage", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31799, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31733, 
               Direction = "up", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31798, 
      }, 
      [31799] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "EDIT\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "DT", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31798, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31799, 
      }, 
      [31800] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are standing in front of hallway which leads down into the rancor pit. To\
the south is the kitchen. To continue down the hall go east.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Hallway to Rancor Pit", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31733, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31802, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 31801, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31800, 
      }, 
      [31801] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are standing inside the kitchen that is used to make Jabba the Hutt's\
disgusting foods. There is a table in the center of the room with a cutting\
board and extra utensils. On the wall there are many shelves and utensils\
layed everywhere.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Jabba's Palace's Kitchen", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31800, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31801, 
      }, 
      [31802] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are walking down a hall which passes the docking bay and many living\
quarters.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Hallway Past Docking Bay", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31803, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31800, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31802, 
      }, 
      [31803] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are standing in front of one of many rooms located on the bottom level.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Hallway Past A Room", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31802, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31803, 
      }, 
      [31804] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are standing on a rather small sized landing pad. It can be used to keep\
smaller sized vehicles of any origin.\
", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Landing Pad 6", 
         Exits = 
         {
         }, 
         Tag = "", 
         Sector = "city", 
         Vnum = 31804, 
      }, 
      [31805] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are standing at the top of a high cliff. As you look downwards it is not a\
far drop but what scares you is that you would land on sharp jagged stones of\
all shapes and sizes. As you look the other way there is a steep cliff. If you\
can climb it go ahead.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Rocky Cliff", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31589, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31806, 
               Direction = "up", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "mountain", 
         Vnum = 31805, 
      }, 
      [31806] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are standing in the middle of a Krayt Dragon's nest. It does not smell\
particularly good. A large female krayt towers over you here wondering what\
you are doing.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Krayt Nest", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31805, 
               Direction = "down", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "mountain", 
         Vnum = 31806, 
      }, 
      [31807] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "All around you is sand and shiny dunes piling as high as you can see. As far\
as you can guess anything could be behind there. The towering sand dunes make\
you feel scared as you are so small and enclosed by the towering heaps of\
sand.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31501, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31808, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31807, 
      }, 
      [31808] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are walking along the hot sand heated by the twin suns of Tatooine. The\
ground beneath you is hardening gradually as you walk over it or is it just\
your imagination?\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Deserty Path", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31809, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31807, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 31812, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31808, 
      }, 
      [31809] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You walk along a large area covered with sand. This sand seems to have\
hardened gradually over the years and is now almost of the consistency of\
sandstone. To the west the sand slopes downward in many directions. \
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Hard Sandy Area", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31814, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31808, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 31810, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31809, 
      }, 
      [31810] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are standing on top of very hard sand, yet maybe even rock covered with\
sand. As you look westwards you see the dune sea stop abruptly and plummet\
downwards. I wonder why.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Sandy Surface", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31809, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31811, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31810, 
      }, 
      [31811] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are standing on the edge of a very steep drop that falls directly into the\
heart of what looks to be a colony of some sorts. You would not want to fall\
down this cliff for it is a ways down.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Overseeing A Small Colony.", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31810, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31811, 
      }, 
      [31812] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are walking on one of the only things on this planet. Sand. It is nice and\
soft but some patches of hardened sand can bee seen all around.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Flat Area", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31808, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31813, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31812, 
      }, 
      [31813] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You look about, look from the direction you came, nothing, nothing at all but\
sand. You wonder how much of this stuff could there possibly be?\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31812, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31813, 
      }, 
      [31814] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "As the ground beaneath your feet is in a transition from sand to rock\
it seems to be versatile and flakes away in some areas with every\
step that you take on it. Northward you see all the sand is no longer\
there but it is totally a rock surface.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Unstable Ground", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31815, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31809, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31814, 
      }, 
      [31815] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "The texture beneath your feet is no longer primarily sand but totally\
rock. The rock continues for twenty or thirty feet ahead of you but\
then stops abruptly and becomes sand once again. Downwards a cliff\
slopes downwards. This side is still very steep but you can perceive\
that it is very possible to go up and down of it.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Rocky Area", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31814, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31816, 
               Direction = "down", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "mountain", 
         Vnum = 31815, 
      }, 
      [31816] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are on a pathway facing a severe angle which makes it so that\
there is not much room to move around without falling downwards\
towards flat ground. To the east there is a small cave in the side of\
a cliff. If you continue downwards you will be entering the city.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Side Of Steep Path", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31817, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31815, 
               Direction = "up", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 31818, 
               Direction = "down", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "mountain", 
         Vnum = 31816, 
      }, 
      [31817] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are standing in a dimly lit room. There is an aged Jawa shopkeeper\
sitting in the corner behind a table selling items you may need to\
explore this vast land filled with opportunities and predators. In\
this small cave it is darker which makes the temperature drop\
drastically and therefore makes this place a good one to stay in for\
long periods of time especially when both suns are up, sending rays of\
heat onto you. \
", 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Water Shack", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31816, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "mountain", 
         Vnum = 31817, 
      }, 
      [31818] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are standing on the same level most of this city is based on. All\
around tere are small shops and tents set up quickly used for\
merchandising goods to any passers.\
", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Entering The City", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31819, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31870, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 31816, 
               Direction = "up", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "mountain", 
         Vnum = 31818, 
      }, 
      [31819] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are walking down a wide path in the middle of this small city\
seemingly belonging to the Jawas. It has been used frequently and\
you can tell this for the rock is shaved away by weight and the path\
is full of marks. Straight ahead also there is a huge fortress of\
some sorts. It is simply constructed and seems old, but that is\
probably because of the wind and the scorching suns of Tatooine. \
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Path In The City", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31818, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31849, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 31820, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [4] = 
            {
               Key = -1, 
               DestinationVnum = 31851, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "mountain", 
         Vnum = 31819, 
      }, 
      [31820] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You walk along a wide dusty path between two of the most popular\
places in this small veritable city. All around Jawas and small\
creatures of likes you do not want to be aquainted with. As you\
continue down this path you recognize many things and see the\
fortress growing with every step you take, seemingly growing to an \
endless extent. Although it is rather large it seems to be of simple\
construction and not very complicated.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Dusty Path", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31819, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31821, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "mountain", 
         Vnum = 31820, 
      }, 
      [31821] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You walk along a wide path seemingly wider than you think because of\
the reflection and glare of the two twin suns of Tatooine. In front\
of you the Jawa fortress stands immensely with not much architectural\
design to it. You can continue down this road towards the fortress or\
turn off into one of the side streets leading to who knows where.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Path", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31820, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31822, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "mountain", 
         Vnum = 31821, 
      }, 
      [31822] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are standing directly in front of the Jawa Fortress. It seems rather\
large from this viewpoint but is limited to levels and interior space\
due to its design. there are some small designs on the fortress but\
they seem to not have been part of the original plans of the fortress\
but added in by certain individuals. \
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Directly In Front Of The Jawa Fortress", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31821, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               DestinationVnum = 31823, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "mountain", 
         Vnum = 31822, 
      }, 
      [31823] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are standing in a very large room. It was built plainly and simply\
and there are no signs of art even from their own culture in this\
room. There are some narrow corridors in many directions leading to\
different parts of the fortress.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Entrance To Jawa Fortress", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               DestinationVnum = 31822, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31827, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 31824, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31823, 
      }, 
      [31824] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are walking down a small narrow hallway that is not very well\
lit. The few glowpanels that are left on the ceiling are either\
inoperative or malfunctioning. Further down the hallway, the hallway\
come to an abrupt stop and turn off. The ground you walk on is rough\
but the lack of sunlight keeps its moisture and color well. \
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "A Narrow Hallway", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31823, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31825, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31824, 
      }, 
      [31825] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are standing on a colder harder surface than in the hot desert. It\
is like this because of the lack of sunlight in this enormous\
fortress. The glow panels above flicker as if running out of energy.\
Directly in front of you the hallway splits off with a sharp turn\
towards the south. \
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Hallway", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31824, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31829, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31825, 
      }, 
      [31827] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You walk along in a large room. The ground beneath your feet is rocky\
and yet sandy at the same time making your feet feel better for the\
ground is not as rough as straight rock. There is no lighting in this\
room but you can still make your way around. The air is cool and crisp\
making it a little easier to breathe. \
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "A Large Room", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31828, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31823, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31827, 
      }, 
      [31828] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are standing in room #31828.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "A room", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31827, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31828, 
      }, 
      [31829] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are standing in an enormous room. There are small bags, matresses\
and all sorts of small things all over the room layed about. There\
are a few Jawas young and old roaming these hallways. This here room\
is used for more of a storage place and not for eating.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Large Room", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31825, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31832, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 31830, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31829, 
      }, 
      [31830] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "Here, at night Jawas go to sleep. There are millions of tiny things\
from wires and circuits to translator droid in here. Considering the\
fact that Jawas sleep in this room it has a quite awful stench.\
Downwards there is a small opening leading to lower levels or\
something of an interesting nature. This room is very comfortable and\
safe with guard in pretty much all directions.\
 \
You may safely quit from here.\
", 
         Flags = 
         {
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Quarters", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31829, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31831, 
               Direction = "down", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Flags = 
               {
                  [17] = "CanEnter", 
                  [11] = "Hidden", 
               }, 
               DestinationVnum = 31876, 
               Direction = "somewhere", 
               Distance = 0, 
               Description = "", 
               Keyword = "bed", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31830, 
      }, 
      [31831] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are standing in what seems to be an area where extra things and stolen\
goods are kept. In the corners there are baskets full of wires and old\
goods that are probably useless to the everyday person. There is a jawa\
guard half asleep here watching over the items. This room does not seem to\
have been dug out yet was put here by nature.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Small Room", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31830, 
               Direction = "up", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31831, 
      }, 
      [31832] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are standing in a simple room. Designed and built with ease this room\
posed no problem to the people that built it. It is extremely dark in here and\
not much is visible to the plain eye. The ground is cold and stiff and makes\
your feet feel cold as you walk over it.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Entrance", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31833, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31829, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31832, 
      }, 
      [31833] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are at an intersection. You may go either east or west and explore this\
vast place. In both directions the small corridors lighten up further down.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Intersection", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31832, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31839, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 31834, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31833, 
      }, 
      [31834] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are standing in a think gloomy hallway. Towards the south you can hear\
the sounds of discussion and occasional laughter. The ground is cool and soft\
for it is not dried by the everydays suns of Tatooine. The hallway is a gloomy\
place and makes you think twice before you do anything.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Hallway", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31833, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31835, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31834, 
      }, 
      [31835] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You reach the end of the small and tight gloomy hallway and see a few\
guardians discussing near a heavily guarded door leading into a large room\
with someone, or something, important inside of it.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "End Of Hallway", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31834, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31836, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31835, 
      }, 
      [31836] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are standing in the beginning of the large room filled with\
guardians. Just ahead they talk to each other silently trying not to\
disturb anyone. The ground is more of a sand color and is quite soft\
and hot. Upwards there is an oppening in the roof letting sunlight in\
and momentarily blinding you.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Opening", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31837, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31835, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31836, 
      }, 
      [31837] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You stand before the heavily guarded entrance into the Wise Mans\
chambers. the two guardians stand up watching you closely so that you\
cause no harm to their master. The room has a large crack in the\
ceiling and it is rather hot in here. The way you see it staying in this\
fortress is not a bad idea. \
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Entrance", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [5] = "PickProof", 
                  [23] = "BashProof", 
               }, 
               DestinationVnum = 31838, 
               Direction = "east", 
               Distance = 1, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31836, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31837, 
      }, 
      [31838] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are standing in the chambers of the Wise Jawa of these parts. The\
walls are poorly decorated and any signs of extra materials does not\
exist. Maybe you should try to understand him before coming to any\
conclusions for he may able to help you, or to teach you something of\
use. \
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Chambers", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               DestinationVnum = 31837, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31838, 
      }, 
      [31839] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are standing in a hallway leading to a stone wall. At the end of the hall\
the hallway itself curves toward the south leaving only two way to go, south\
and back from where you came.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Hallway", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31833, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31839, 
      }, 
      [31840] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are standing on a large pile of junk. People throw things they dont need\
here just to get rid of it. But for some people this place is where they can\
get everything they need to start out. Everything from scrap metal to blasters\
are here waiting for anyone to pick them up.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Neighberhood Junk Pile", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31653, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "city", 
         Vnum = 31840, 
      }, 
      [31841] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are standing in front of the infamous Dockingbay 94. From here Han Solo\
and the Millenium Falcon escaped with their newly acquired passengers for a\
trip to Alderaan. There is a large entrance into the docking bay. All the\
ground beneath you is made of stone and sand. The air is warm yet lighter\
here for it is sheltered by the docking bay.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Entrance To Docking Bay 94", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31872, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31842, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 31605, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "city", 
         Vnum = 31841, 
      }, 
      [31842] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are standing in front of a large sliding door. When opened you can enter\
the docking bay with ease and embark on a ship to go to other places in the\
galaxy. The door is made of metal and has blaster scorching all over it from\
when the imperials chased Han Solo and Chewbacca in a race to capture the\
droid R2-D2 and return him to Darth Vader. The ground is hard and covered with\
sand as most of this planet is and the air is rather refreshing.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Inside The Entrance To Docking Bay 92", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31841, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               DestinationVnum = 31843, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "city", 
         Vnum = 31842, 
      }, 
      [31843] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are standing inside a large room that can contain a few smaller sized\
ships or one large ship like the Millenium Falcon. The ground here is covered\
with sand, but there are patches where you can see the stone floor beneath.\
The air in here is cool and refreshing and gives you a warm sensation. There\
are ships comming and leaving here continually and make it so that the air\
smells of fumes and exhaust.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Inside Docking Bay 92", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               DestinationVnum = 31842, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31847, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "city", 
         Vnum = 31843, 
      }, 
      [31846] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Floating in a void", 
         Exits = 
         {
         }, 
         Tag = "", 
         Sector = "city", 
         Vnum = 31846, 
      }, 
      [31847] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "All around you there is only one thing. A large room stands here waiting to\
be filled with crafts and vessels. The air is crisp and cool unlike\
outside in the sun, but smells of ships. On the walls there are blaster\
bolts. Extra tools lay on the ground for a mechanic that walks around\
here.   \
", 
         Flags = 
         {
            [4] = "CanLand", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Docking Bay 92", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31843, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "city", 
         Vnum = 31847, 
      }, 
      [31849] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are standing inside a small store. Here Hundo the owner will\
gladly sell you clothing or possibly custom make some for you if the\
price is right. There is a small workstation in the corner and a\
entry to a room near the back of the store. The store is pretty run\
down but serves it's purpose.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Hundo's Shop", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               DestinationVnum = 31850, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31819, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31849, 
      }, 
      [31850] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "There are some small crates scattered along the floor. Most of them are empty\
but some seem to be filled with cloth and useless items. This room is very\
dirty and has a rather disturbing smell to it. The ground is smooth and cold\
being made of stone. The air is fresher in here than most parts of this city\
and it makes you want to stay here.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Back Of The Shop", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               DestinationVnum = 31849, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31850, 
      }, 
      [31851] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are standing in front of some large fences. Inside these fences are kept\
many rontos, the animal that Jawas ride to go to different areas. There is a\
rather tall Jawa at the gate entry with an ionization gun ready to shoot any\
thieves or trespassers.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "In Front Of A Large Keeping Area", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31819, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               DestinationVnum = 31852, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "mountain", 
         Vnum = 31851, 
      }, 
      [31852] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are standing inside a large pen sourrounded by gates that are filled with\
rontos. These rontos have been trained to a certain degree so it is not\
likely that they will try to escape. The ground is rough and is filled with\
cracks for the weight of these beasts is quite surprising. The sun shines down\
all day long and makes it warm here but the rontos have adjusted to the\
temperature.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Ronto Keeping Area", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               DestinationVnum = 31851, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "mountain", 
         Vnum = 31852, 
      }, 
      [31853] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are standing in the entrance to the well known cantina. Here some of the\
filthiest and richest scum hang around. Watch your step. Mounted on the wall is\
a droid detector. For here in this cantina they do not serve their kind.\
", 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Entrance To The Cantina", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31655, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31854, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31853, 
      }, 
      [31854] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are facing the bar slowly. With small booths all around filled with\
people talking. Wuher slowly pours drinks for his customers being careful not\
to get hurt. The floor is poorly covered and the walls filled with blaster\
marks and other such things from fights and encounters.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Interior Of The Cantina", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31853, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31855, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 31856, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31854, 
      }, 
      [31855] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "Most of this section is rather empty for it leads the entrance into the\
cantina. For the other part there is a few tables with some stools and chairs\
but for the most part they are empty as for people seem to have adopted a\
liking towards the booths.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Large Open Way", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31858, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31859, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 31854, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31855, 
      }, 
      [31856] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You stand in awe as many horrible characters walk around. Some you\
recognize and some you do not. There are small tables filled with\
people all along this large area of the Cantina. The air is full of\
smoke from hookas being used all along. There is some broke glass on\
the floor. As you walk over it it cracks and makes you shiver.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "A Large Section Of The Cantina", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31854, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31861, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 31857, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31856, 
      }, 
      [31857] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are standing inside a small booth. Here a table is mounted in the middle\
with all sorts of seats and chairs aligned around. The table is beat up with\
holes all over it, vandalized over and over. This booth has less lighting in\
it for the glow panel has shorted out and makes it relaxing with the change in\
temperature from the outdoors.\
", 
         Flags = 
         {
            [10] = "Safe", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "A Small Booth", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31856, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31857, 
      }, 
      [31858] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "There are two small booths attached together here making one large booth.\
This booth is a very well known booth for here Han Solo fried Greedo the\
bounty hunter. There is a large table in the middle of the booth. The seats\
are dirty and the table even more so. There is a hookah on the table but it\
seems to be stuck to it.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "A Large Double Booth", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31855, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31858, 
      }, 
      [31859] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "This room is located on the far side of the cantina, beside one of the\
small corner booths towards the west. The floor is dirty, filled with blood in\
some places from a recent fight. The air is full of smoke as people walk\
around you, some smoking hookahs.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "A Section Of The Cantina", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31855, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31860, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31859, 
      }, 
      [31860] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "This booth is one of very small size. There is a small table in the\
middle with 2 stools set down around it. The stools are in rather\
good shape but the table is in horrible condition. The ground is\
cracked and makes you feel you will fall through the floor. The air\
is dirty and heavy here and makes you want to leave.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "A Very Small Booth", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31859, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31860, 
      }, 
      [31861] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are standing in an open area filled with tables. To the east the bar\
stands. Chairs all around filled with different people and different species.\
The chairs themselves are rather dirty and so most people stand. The smell\
here is not too bad but not a beautiful one neither.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Section Of The Cantina", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31856, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Flags = 
               {
                  [0] = "IsDoor", 
                  [17] = "CanEnter", 
                  [18] = "CanLeave", 
                  [26] = "CanLook", 
                  [23] = "BashProof", 
               }, 
               DestinationVnum = 31863, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "Counter", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 31862, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31861, 
      }, 
      [31862] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are standing in a rather large both in the furthest corner of the\
cantina. The table here is very used yet in good shape compared to the others.\
The chairs on the other hand are worn down to the nub. The air here is less\
filthy for many people whom do not want to be bothered by the smoke sit\
here.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "A Corner Booth", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31861, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31862, 
      }, 
      [31863] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are standing in front of Wuher, the man who serves drinks to people here.\
The beverage machine is very large and complex but seems to be efficient in\
the way it works. AS he sees you he gets angry. Maybe you should run.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Inside The Bar", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Flags = 
               {
                  [0] = "IsDoor", 
                  [5] = "PickProof", 
               }, 
               DestinationVnum = 31861, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "counter", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31618, 
               Direction = "up", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31863, 
      }, 
      [31870] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are inside a large cave. It has two parts to it. It is rather dark\
making the air cool. The cave protects you from the sand being\
blown by the winds. Inside this cave many womp rats seek shelter for\
the only other places are inside the city of Mos Eisley where they\
will most likely be prosecuted. The ground is hard and has little to\
no sand on it. This place is sure a break to the outdoors.\
", 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Inside A Large Cave", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31818, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31871, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "city", 
         Vnum = 31870, 
      }, 
      [31871] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are in the back portion of a large cave planted into the side of\
the cliff. The air here is very cool and relaxing giving you the\
sensation of being relaxed. The ground is hard and made entirely of\
rock, without a trace of sand this cave is rather clean besides the\
womp rat mess. There is a particular smell in here from the mess but\
nothing to be concerned about if you do not stay in this cave for an\
extended period of time.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "In The Back Of A Cave", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31870, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "city", 
         Vnum = 31871, 
      }, 
      [31872] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are standing on a platform where the public busses land every so\
often. You can access different planets using these busses. Although\
the busses are slow they are a means of transportation. The only\
reason they are slow is because they are provided to the public for\
free. Thinking about this it makes it hard to maintain the busses\
without enough resources.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "The Bus Stop", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31841, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "city", 
         Vnum = 31872, 
      }, 
      [31873] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You walk along a path inside the well known city of Mos Eisley. The\
ground here is hard yet made fully of sand. As you walk over it, it is\
hot and sharp. The wind blows in your face, sometimes bringing\
particles of sand into your face stinging you and sometimes getting\
into your eyes. The air is very warm, heated by the twin suns of the\
planet. The heat makes the air heavier and harder to breath yet you\
move on. Ahead you can see a corner that curves into a store of some\
kind. On the front it says \"Spaceport Speeders\".\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Walking Through The City", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31875, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31881, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 31882, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [4] = 
            {
               Key = -1, 
               DestinationVnum = 31655, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "city", 
         Vnum = 31873, 
      }, 
      [31874] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are walking down an unused side street. The street is mostly shady\
because the buildings to the sides cover the sunlight from the\
street. The ground is softer and less dense and compact, but when the\
wind blows it hurts more for the grains of sand hit you in larger\
numbers making you ache all over. The air is hot, not as hot as the\
rest of the city because the street is covered in shade, but it is\
still hot. The air is also lighter and makes you relax as you walk.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Walking Down A Side Street", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31655, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "city", 
         Vnum = 31874, 
      }, 
      [31875] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
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
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Inside The Spaceport Speeders", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31873, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "city", 
         Vnum = 31875, 
      }, 
      [31876] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "Here in this bed hot steam rises from the cushions making your tense\
muscles relax. As they heat your body you start to feel better. The\
atmosphere is very moisturized with a lot of heat surrounding you\
also. The bed is made of a comfortable looking material but has been\
chewed at by small rodents making the bed kind of ugly looking. \
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "On A Bed", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [11] = "Hidden", 
               }, 
               DestinationVnum = 31830, 
               Direction = "somewhere", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "100", 
               Code = "feel cure $n\
emote Vapors slowly seep into your body helping you relax.\
", 
            }, 
         }, 
         Tag = "", 
         Sector = "city", 
         Vnum = 31876, 
      }, 
      [31878] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are walking along the bottom of the cliff. High above you see the edge\
of the cliff and you think about how much it would hurt to fall from\
there. The sand here is much harder than normal as for the wind does not\
get at it very well because the cliff covers the sand from being swept\
away by the gusting winds. The sun is also not so intense here but it is\
still very warm and just as dry as the rest of the planet.\
", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Along The Bottom Of The Cliff", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31601, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31879, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31878, 
      }, 
      [31879] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are walking along the bottom of the cliff. High above you see the edge\
of the cliff and you think about how much it would hurt to fall from\
there. The sand here is much harder than normal as for the wind does not\
get at it very well because the cliff covers the sand from being swept\
away by the gusting winds. The sun is also not so intense here but it is\
still very warm and just as dry as the rest of the planet.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Nearing The Curve In The Cliff", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31878, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31880, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31879, 
      }, 
      [31880] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are walking along the bottom of the cliff. High above you see the edge\
of the cliff and you think about how much it would hurt to fall from\
there. As you think of that you notice some blood splatter on the sand.\
Then you look up to see a large chunk of the cliff missing as if someone\
had fell from there taking a large portion of the side of the cliff with\
them. \
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "On The Curve Of The Cliff", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31879, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31880, 
      }, 
      [31881] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You walk along a path inside the well known city of Mos Eisley. The ground\
here is hard yet made fully of sand. As you walk over it, it is hot and\
sharp. The wind blows in your face, sometimes bringing particles of sand\
into your face stinging you and sometimes getting into your eyes. The air\
is very warm, heated by the twin suns of the planet. The heat makes the\
air heavier and harder to breath yet you move on. To the north you can see\
a scattering of buildings.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "On A Path In The City", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 6600, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31873, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "city", 
         Vnum = 31881, 
      }, 
      [31882] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You walk along a path inside the well known city of Mos Eisley. The ground\
here is hard yet made fully of sand. As you walk over it it is hot and sharp.\
The wind blows in your face, sometimes bringing particles of sand into your\
face stinging you and sometimes getting into your eyes. The air is very warm,\
heated by the twin suns of the planet. The heat makes the air heavier and\
harder to breath yet you move on. To the west you see smoke coming from\
freshly cooked meat and food. \
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "In The Depths Of The City", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31873, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31883, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 31624, 
               Direction = "west", 
               Distance = 1, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "city", 
         Vnum = 31882, 
      }, 
      [31883] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are standing in front of an old man. Here he makes his own food to sell\
to people passing by. He has a large selection, everything from\
banthaburgers to dewbak ribs depending on how carnivorous your appetite\
is. His booth is made of old junk probably scavenged or bought from the\
Jawas. His cooking supplies are rather disgusting to look at and when you\
think of what you are eating from it makes your stomach churn.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Gep's Grill", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31882, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "city", 
         Vnum = 31883, 
      }, 
      [31898] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 106, 
               Direction = "northeast", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31898, 
      }, 
      [31899] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "This passage looks somewhat cleaner than the reset of the sewer, suggesting\
that someone maintains it. There's no sewage flowing here, rather the ground\
is quite dry.\
", 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "A Hidden Passage In The Sewers", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31904, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31900, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31899, 
      }, 
      [31900] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "This circular area seems to be a simple common room, complete with cheap\
furniture and some faded posters on the walls.\
", 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Common Room", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31899, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31901, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 31902, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [4] = 
            {
               Key = -1, 
               DestinationVnum = 31909, 
               Direction = "west", 
               Distance = 1, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31900, 
      }, 
      [31901] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "The kitchen bench is full of unwashed plates, glasses and cutlery. Above the\
bench are a few cupboards. Despite the mess on the bench, the place smells\
clean.\
", 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Kitchen", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31900, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31901, 
      }, 
      [31902] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "The hallway has light gray walls with some lamps hanging on them. Doors\
lead to other rooms in the small complex.\
", 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Hallway", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31900, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31903, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 31905, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [4] = 
            {
               Key = -1, 
               DestinationVnum = 31906, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31902, 
      }, 
      [31903] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "There are a few cheap beds scattered around this dimly lit room. Otherwise\
it's quite empty.\
", 
         Flags = 
         {
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Sleeping Quarters", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31902, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31903, 
      }, 
      [31904] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "There is a river of sewage flowing at a slow, steady pace. There's a rusty\
catwalk about a meter above it, running along one wall. Old grime is covering\
the walls. There's a nasty smell in the air, making it uncomfortable to\
breath, even for a Gamorrean.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "A Tunnel In The Sewers", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31907, 
               Direction = "east", 
               Distance = 1, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Flags = 
               {
                  [11] = "Hidden", 
               }, 
               DestinationVnum = 31899, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 31505, 
               Direction = "southwest", 
               Distance = 1, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "entry_prog", 
               Arguments = "100", 
               Code = "if isjedi($n)\
    if level($n) < 25\
        mpechoat $n You sense that the south wall is a hologram.\
    endif\
endif\
", 
            }, 
         }, 
         Tag = "", 
         Sector = "underground", 
         Vnum = 31904, 
      }, 
      [31905] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "In theory this is where Zim would meditate and attune himself to the Force.\
But in reality it's where he drinks all day, feeling sorry for himself.\
There's a smell of alcohol in the air.\
", 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Zim's Meditation Chamber", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31902, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31905, 
      }, 
      [31906] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "This rooms contains all facilities you need to craft just about anything.\
It's very cluttered. A few broken items that someone failed to assemble\
correctly have been tossed into a corner.\
", 
         Flags = 
         {
            [16] = "Silence", 
            [26] = "Factory", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Workshop", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31902, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31906, 
      }, 
      [31907] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "This is the main entrance to the sewers. There is a river of sewage flowing\
through the tunnel, giving off a strong smell. Along one wall is a catwalk\
allowing one to walk through the sewers.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Mos Eisley Sewers", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31908, 
               Direction = "east", 
               Distance = 1, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31904, 
               Direction = "west", 
               Distance = 1, 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               DestinationVnum = 31654, 
               Direction = "up", 
               Distance = 1, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "underground", 
         Vnum = 31907, 
      }, 
      [31908] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "#31904\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "A Tunnel In The Sewers", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31502, 
               Direction = "east", 
               Distance = 1, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31907, 
               Direction = "west", 
               Distance = 1, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "underground", 
         Vnum = 31908, 
      }, 
      [31909] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "The sparring area is a square room about 10x10 meters. Most of the floor is\
covered by a gray mat so that people won't land too hard when they fall.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Sparring Area", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31900, 
               Direction = "east", 
               Distance = 1, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31909, 
      }, 
      [31997] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "This section is smelly and dirty. It's probably not cleaned very often.\
The noise from the engines at the back of the shuttle contributes to making\
it an uncomfortable trip.\
", 
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Economy Class Section", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31999, 
               Direction = "north", 
               Distance = 1, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31997, 
      }, 
      [31998] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "This section of the shuttle is clean, quiet and comfortable. In other words\
it's the opposite of what you usually meet on this planet.\
", 
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Business Class Section", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Flags = 
               {
                  [1] = "Closed", 
               }, 
               DestinationVnum = 31999, 
               Direction = "south", 
               Distance = 1, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31998, 
      }, 
      [31999] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "The Tatooine Planetary Shuttle travels between major settlements on this\
backwater planet. The entrance area leads to the business class section in one\
direction, and the economy class section in the other. The business class\
section is behind a curtain so that the wealthier passengers won't have to\
look at the seedier elements in the back.\
", 
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Tatooine Planetary Shuttle Entrance", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               DestinationVnum = 31998, 
               Direction = "north", 
               Distance = 1, 
               Description = "", 
               Keyword = "curtain", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31997, 
               Direction = "south", 
               Distance = 1, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31999, 
      }, 
      [31500] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "The dunes around you are normal as you walk over the endless amount of sand.\
The sea of rippling sand still surrounds you with overwhelming greatness. The\
sand has a reflective shine to it assisted by the sunrays of the heating suns.\
You feel enclosed because the dunes tower over you greatly.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31501, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31557, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31500, 
      }, 
      [31501] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are walking along the soft sand in the desert of Tatooine. Just ahead of\
you you can see the dune sea developping. Behind you the small city diminishes\
into only a spot. With every step you take the city becomes smaller and\
smaller.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31507, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31500, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 31807, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31501, 
      }, 
      [31502] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "A junction breaks up the monotony of these tunnels. The river of sewage runs\
south, but to the north there seems to be a dry area.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Tunnel Junction", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31503, 
               Direction = "north", 
               Distance = 1, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31504, 
               Direction = "south", 
               Distance = 1, 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 31908, 
               Direction = "west", 
               Distance = 1, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "underground", 
         Vnum = 31502, 
      }, 
      [31503] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "This room is about 20x20 meters, and several meters high. It smells as bad\
as the rest of the sewers. In the middle of the room is a large piece of\
machinery enclosed in an old-fashioned wire fence.\
", 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Pumping Station", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
               }, 
               DestinationVnum = 31623, 
               Direction = "north", 
               Distance = 1, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31502, 
               Direction = "south", 
               Distance = 1, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31503, 
      }, 
      [31504] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "#31904\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Endless Tunnels In The Sewers", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31502, 
               Direction = "north", 
               Distance = 1, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31621, 
               Direction = "west", 
               Distance = 1, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "underground", 
         Vnum = 31504, 
      }, 
      [31505] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "The tunnel widens into a room filled with sewage that gathers into a large\
pool. Just like the rest of the sewers, there's a rusty catwalk running along\
one wall where it's possible to walk through the area.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "A Deep Pool Of Sewage", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31506, 
               Direction = "south", 
               Distance = 1, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31904, 
               Direction = "northeast", 
               Distance = 1, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "underground", 
         Vnum = 31505, 
      }, 
      [31506] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "#31904\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "A Tunnel In The Sewers", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31505, 
               Direction = "north", 
               Distance = 1, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31591, 
               Direction = "southeast", 
               Distance = 1, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "underground", 
         Vnum = 31506, 
      }, 
      [31507] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are standing on a hard sandy surface, there is nothing around you unless\
you turn back. In all directions you can see but sand. The dunes in the sea\
are enourmous and grow with every step that you take.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31509, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31508, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 31501, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31507, 
      }, 
      [31508] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "All around you is sand and shiny dunes piling as high as you can see. As far\
as you can guess anything could be behind there. The towering sand dunes make\
you feel scared as you are so small and enclosed by the towering heaps of sand.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31555, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31507, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31508, 
      }, 
      [31509] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are surrounded by sand from all possible directions. You can still see a\
glimpse of the city behind you but once you leave the city the land is yours\
to explore.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31510, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31507, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31509, 
      }, 
      [31510] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "Around you there is only sand as far as you can see. The direction is not\
noticable and civilization is far away. If you wander too far be careful\
of where you end up.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31511, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31513, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 31509, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31510, 
      }, 
      [31511] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "The sand is soft and is still all around you. It is high and shinning in your\
face as you repeatidly walk over endless amounts of sand. You feel enclosed\
because of their great mass. As you walk forward, with every step you take the\
sand dunes grow in size and proportion.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31512, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31510, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31511, 
      }, 
      [31512] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "The sand is soft and is still all around you. It is high and shinning in your\
face as you repeatidly walk over endless amounts of sand. You feel enclosed\
because of their great mass. As you walk forward, with every step you take\
the sand dunes grow in size and proportion.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31511, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31512, 
      }, 
      [31513] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "The sand is soft and is still all around you. The sun is high and shining in\
your face as you repeatedly walk over endless amounts of sand. You feel\
enclosed because of their great mass. As you walk forward, with every step you\
take the sand dunes grow in size and proportion.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31514, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31510, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31513, 
      }, 
      [31514] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "The sand is soft and is still all around you. It is high and shining in your\
face as you repeatidly walk over endless amounts of sand. You feel enclosed\
because of their great mass. As you walk forward, with every step you take\
the sand dunes grow in size and proportion.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31513, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31515, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31514, 
      }, 
      [31515] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "All around you is sand and shiny dunes piling as high as you can see. As far\
as you can guess anything could be behind there. The towering sand dunes make\
you feel scared as you are so small and enclosed by the towering heaps of sand.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31514, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31516, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31515, 
      }, 
      [31516] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are on the top of a sand dune and you can see across the whole dune sea.\
It is just a great sight to see. The sand dunes dip in and out of the ground.\
The immense amount of sand frightens you as you look across the great sand\
dune sea of Tatooine.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31515, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31517, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31516, 
      }, 
      [31517] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are heading down the side of a sand a dune entering another valley of\
dunes. With every step you take the sand seems to be increasing.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31516, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31518, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31517, 
      }, 
      [31518] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are on the top of a sand dune and you can see across the whole dune sea.\
It is just a great sight to see. The sand dunes dip in and out of the ground.\
The immense amount of sand frightens you as you look across the great sand\
dune sea of Tatooine.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31519, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31517, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 31522, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31518, 
      }, 
      [31519] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "The sand is soft and is still all around you. It is high and shining in your\
face as you repeatedly walk over endless amounts of sand. You feel enclosed\
because of their great mass. As you walk forward, with every step you take the\
sand dunes grow in size and proportion.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31520, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31518, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31519, 
      }, 
      [31520] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are on the top of a sand dune and you can see across the whole dune sea.\
It is just a great sight to see. The sand dunes dip in and out of the ground.\
The immense amount of sand frightens you as you look across the great sand dune\
sea of Tatooine.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31521, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31519, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31520, 
      }, 
      [31521] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are on the top of a sand dune and you can see across the whole dune sea.\
It is just a great sight to see. The sand dunes dip in and out of the ground.\
The immense amount of sand frightens you as you look across the great sand\
dune sea of Tatooine.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31520, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31521, 
      }, 
      [31522] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "The sand is soft and is still all around you. It is high and shining in your\
face as you repeatedly walk over endless amounts of sand. You feel enclosed\
because of their great mass. As you walk forward, with every step you take the\
sand dunes grow in size and proportion.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31518, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31523, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 31524, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31522, 
      }, 
      [31523] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "The dunes around you are normal as you walk over the endless amount of dunes.\
The sea of dunes still surrounds you with overwhelming greatness. The sand has\
a reflective shine to it assisted by the sunrays of the heating suns.  You feel\
enclosed because the dunes tower over you greatly.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31522, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31646, 
               Direction = "south", 
               Distance = 1, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31523, 
      }, 
      [31524] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "All around you is sand and you are The dunes around you are normal as you walk\
over the endless amount of dunes. The sea of dunes still surrounds you with\
overwhelming greatness. The sand has a reflective shine to it assisted by the\
sunrays of the heating suns. You feel enclosed because the dunes tower over\
you greatly.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31525, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31522, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31524, 
      }, 
      [31525] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "The dunes around you are normal as you walk over the endless amount of dunes.\
The sea of dunes still surrounds you with overwhelming greatness. The sand has\
a reflective shine to it assisted by the sunrays of the heating suns. You feel\
enclosed because the dunes tower over you greatly.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31526, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31524, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31525, 
      }, 
      [31526] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "All around you is sand and shiny dunes piling as high as you can see. As far\
as you can guess anything could be behind there. The towering sand dunes make\
you feel scared as you are so small and enclosed by the towering heaps of sand.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31527, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31525, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31526, 
      }, 
      [31527] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "All around you is sand and shiny dunes piling as high as you can see. As far\
as you can guess anything could be behind there. The towering sand dunes make\
you feel scared as you are so small and enclosed by the towering heaps of sand.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31528, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31536, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 31526, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31527, 
      }, 
      [31528] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You start walking over the tip of a dune an can see something in the far sea\
of dunes. All around you is sand and shiny dunes piling as high as you can\
see. As far as you can guess anything could be behind there. The towering sand\
dunes make you feel scared as you are so small and enclosed by the towering\
heaps of sand.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31529, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31527, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 31530, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31528, 
      }, 
      [31529] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "The dunes around you are normal as you walk over the endless amount of dunes.\
The sea of dunes still surrounds you with overwhelming greatness. The sand has\
a reflective shine to it assisted by the sunrays of the heating suns. You feel\
enclosed because the dunes tower over you greatly.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31528, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31531, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31529, 
      }, 
      [31530] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "All around you is sand and shiny dunes piling as high as you can see. As far\
as you can guess anything could be behind there. The towering sand dunes make\
you feel scared as you are so small and enclosed by the towering heaps of sand.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31528, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31537, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31530, 
      }, 
      [31531] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "All around you is sand and shiny dunes piling as high as you can see. As far\
as you can guess anything could be behind there. The towering sand dunes make\
you feel scared as you are so small and enclosed by the towering heaps of sand.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31529, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31532, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31531, 
      }, 
      [31532] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "The sand is soft and is still all around you. It is high and shinning in your\
face as you repeatidly walk over endless amounts of sand. You feel enclosed\
because of their great mass. As you walk forward, with every step you take the\
sand dunes grow in size and proportion.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Opening", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31531, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31533, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31532, 
      }, 
      [31533] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are traveling along the side of the large opening and can see something in\
the center of the opening.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Opening", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31534, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31532, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31533, 
      }, 
      [31534] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are standing infront of a very large opening in the ground that seems to\
have endless turns inside itself. To explore this hold continue to the west.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Opening", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31533, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31535, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31534, 
      }, 
      [31535] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "This is a D.T(To be edited)\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Sarlacc", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31534, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31535, 
      }, 
      [31536] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are in the middle of the sea of dunes and are hopelessly lost.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31527, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31536, 
      }, 
      [31537] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You can now perceive that the object that you are walking towars is a metallic\
form of some sort.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31530, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31538, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31537, 
      }, 
      [31538] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are very close to the object and you can now identify it in the sand. It\
is a very old shipwreck plowed into the top of a dune.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31539, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31537, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31538, 
      }, 
      [31539] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are infront of the shipwreck and it seems to be habitible. To explore it\
continue north up the hatch.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31540, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31538, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 31552, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31539, 
      }, 
      [31540] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are inside the hatch of a ship which seems very new and cared for.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Hatch Of Derelict Ship", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31547, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31542, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 31539, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [4] = 
            {
               Key = -1, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               DestinationVnum = 31541, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "TatooineDerelictShip", 
         Sector = "inside", 
         Vnum = 31540, 
      }, 
      [31541] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are standing infront of an immense cargo room containing many\
crates of items.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Cargo Hold", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               DestinationVnum = 31540, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31541, 
      }, 
      [31542] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are in a small room with lots of wiring and you can see the maintenance\
tunnel in front of you.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Tunnel", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               DestinationVnum = 31543, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31540, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31542, 
      }, 
      [31543] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are inside the maintenance tunnel. It is a very small space so you must\
crawl inside the tunnel to move.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Mainentance Tunnel", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31544, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               DestinationVnum = 31542, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31543, 
      }, 
      [31544] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are crawling through the tunnel and can see an opening to the west.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Tunnel", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31543, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31545, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31544, 
      }, 
      [31545] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You enter a small compartment room filled with electronic equipment. It seems\
to be an interrogation room of some sort. You can see computers mounted the\
wall.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Secret Compartment", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31546, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31544, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31545, 
      }, 
      [31546] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are in a room containing nothing but an assault droid in the corner.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Death", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31545, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31546, 
      }, 
      [31547] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are walking down a corridor and can see a ladder at the end of the hall.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Corridor", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31540, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31548, 
               Direction = "up", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31547, 
      }, 
      [31548] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are heading up a ladder headed towards the top portion of the ship.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Ladder", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31550, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31551, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 31549, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [4] = 
            {
               Key = -1, 
               DestinationVnum = 31547, 
               Direction = "down", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31548, 
      }, 
      [31549] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You enter a passenger compartment that seems to have been inhabitated.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Passenger Compartment", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31548, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31549, 
      }, 
      [31550] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are in the pilot compartment and you look out the viewer console to see\
sand covering it. The computer equipment seems to be usable and undamaged.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Pilot Compartment", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31548, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31550, 
      }, 
      [31551] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "This room contains nothing in it besides a viewer console and\
seems very strange.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Room", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31548, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31551, 
      }, 
      [31552] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You walk around the immense shuttle to the top of a dune and continue exploring\
the dune sea of Tatooine. It tower around you fromm all directions.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31539, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31553, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31552, 
      }, 
      [31553] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "The shuttle starts to get smaller and you can see only sand in front of you.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31554, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31552, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31553, 
      }, 
      [31554] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You walk slowly and exhausted to find nothing here.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert ", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31553, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31554, 
      }, 
      [31555] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "All around you is sand and shiny dunes piling as high as you can see. As far\
as you can guess anything could be behind there. The towering sand dunes make\
you feel scared as you are so small and enclosed by the towering heaps of sand.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31508, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31556, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31555, 
      }, 
      [31556] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "All around you is sand and shiny dunes piling as high as you can see. As far\
as you can guess anything could be behind there. The towering sand dunes make\
you feel scared as you are so small and enclosed by the towering heaps of sand.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31555, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31556, 
      }, 
      [31557] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "All around you is sand and shiny dunes piling as high as you can see.\
As far as you can guess anything could be behind there. The towering\
sand dunes make you  eel scared as you are so small and enclosed by\
the towering heaps of sand.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31500, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31558, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 31592, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31557, 
      }, 
      [31558] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are on the top of a sand dune and you can see across the whole dune sea.\
It is just a great sight to see. The sand dunes dip in and out of the ground.\
The immense amount of sand frightens you as you look across the great sand\
dune sea of Tatooine.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31559, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31557, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31558, 
      }, 
      [31559] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "The sand is soft and is still all around you. It is high and shinning in your\
face as you repeatedly walk over endless amounts of sand. You feel enclosed\
because of their great mass. As you walk forward, with every step you take the\
sand dunes grow in size and proportion.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31560, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31565, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 31558, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31559, 
      }, 
      [31560] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "The dunes you are walking on are reaching a few feet high now and you are\
approaching the greater dunes at a rather fast pace.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31561, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31559, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31560, 
      }, 
      [31561] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are on a large dune right now and you can see dunes for a long way.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31560, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31562, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 31564, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31561, 
      }, 
      [31562] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are heading into the sea of dunes. Be careful where you go or you might not come back.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31563, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31561, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31562, 
      }, 
      [31563] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "The dunes under you appear to be growing with every step that you take.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31569, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31562, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31563, 
      }, 
      [31564] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are on a large dune heading further and further away from the grasp of\
civilization.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31561, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31571, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31564, 
      }, 
      [31565] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are walking on the rippling surface of the sand which has been\
exposed to extreme heat over the many years. The sand is very warm and\
stings your face as the wind blows it up onto your soft skin. The air\
is thick and very heavy to breathe, but living with it is something you\
accepted when you entered the desert.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31559, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31566, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31565, 
      }, 
      [31566] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "The hard sand beneath your feet is hot and you can only see the same things\
for miles to come. You are walking on the rippling surface of the sand\
which has been exposed to extreme heat over the many years. The sand is\
very warm and stings your face as the wind blows it up onto your soft\
skin. The air is thick and very heavy to breathe, but living with it\
something you accepted when you entered the desert. \
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31565, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31567, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31566, 
      }, 
      [31567] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "The sand is hard and hot but you continue to explore this vast area.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31566, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31568, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31567, 
      }, 
      [31568] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "The hard sand is getting softer as you walk endlessly.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31567, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31568, 
      }, 
      [31569] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are walking up and down endless amounts of sound shaped into great dunes\
trying to find something in this vast sea.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31563, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31570, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31569, 
      }, 
      [31570] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "The sand dunes seem to get bigger and higher but it only seems this way from\
exhaustion.\
", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31569, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 3301, 
               Direction = "east", 
               Distance = 1, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31570, 
      }, 
      [31571] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "The pummeling dunes are passing under your feet at an alarming rate. Yet there\
is nothing else in sight but sand.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31564, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31572, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31571, 
      }, 
      [31572] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You walk down to the base of one of the largest dunes you have climbed in your\
trip through the great sea of Tatooine.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31571, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31573, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31572, 
      }, 
      [31573] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You turn at the bottom of a dune and start climbing a rather small one.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31574, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31572, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31573, 
      }, 
      [31574] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "The dune you just climbed was a rather small one but when you look down off of\
the dune you realize you are heading down into a valley.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31575, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31577, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 31573, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31574, 
      }, 
      [31575] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You walk through the valley of sand dunes slowly. The harsh conditions are\
slowing you down gradually over the course of many minutes, hours or even days\
depending on how long you last before you find civilization.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31576, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31574, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31575, 
      }, 
      [31576] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "The sand dunes around you are making you nautious on what is still left\
to climb over.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31575, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31576, 
      }, 
      [31577] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are walking and walking through the treacherous sea of never ending sand.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31574, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31578, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31577, 
      }, 
      [31578] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You look on but can only see endless amounts of sand but nothing else.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31577, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31582, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 31579, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31578, 
      }, 
      [31579] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "The great sea starts becoming a blur after looking at the bare sands\
for many long hours now.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31578, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31580, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31579, 
      }, 
      [31580] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "The sea of dunes is making a great impression on what you think of Tatooine.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31579, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31581, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31580, 
      }, 
      [31581] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are coming up to a rise of harder sand than all around. The flat\
continues to the west.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31580, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31590, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31581, 
      }, 
      [31582] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "The sand is plunging downwards and all of the sea seems to be heading to\
a point of falling.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31583, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31578, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31582, 
      }, 
      [31583] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are standing on the last dune before the entry point and can see what\
is developed inside.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31584, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31582, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31583, 
      }, 
      [31584] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are heading down a slope towards a rocky assortment of caves once lived\
in by the native race of this planet. The Jundland Wastes are very large and\
you can see many things from here.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Edge Of The Jundland Wastes", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31585, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31583, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31584, 
      }, 
      [31585] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You can see immense caves all around you and feel enclosed by the high walls\
of the caves.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Jundland Wastes", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31584, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31586, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "mountain", 
         Vnum = 31585, 
      }, 
      [31586] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are walking down a rocky path that passes many old caves. To the south you\
see a cave that is still in pretty good condition. All around there is a\
distinct odour.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Jundland Wastes", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31738, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31589, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 31587, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [4] = 
            {
               Key = -1, 
               DestinationVnum = 31585, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "mountain", 
         Vnum = 31586, 
      }, 
      [31587] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are inside a dark cave which has a strong odour of some sort. The cave\
continues to the south.\
", 
         Flags = 
         {
            [0] = "Dark", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Cave", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31586, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31588, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "mountain", 
         Vnum = 31587, 
      }, 
      [31588] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are in the back of a cave which seems to have been used as a living\
habitat. On the floor in the corner you are appaled when seing three dead\
Jawas. There are some blaster scars on the walls and big gashes everywhere.\
Only one thing could have done this... Sand people.\
", 
         Flags = 
         {
            [0] = "Dark", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Cave", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31587, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "mountain", 
         Vnum = 31588, 
      }, 
      [31589] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You see many things in the rocks around you but the camp seems lifless in many\
ways. The ground is hard and dry for with the twin suns no moisture can be\
kept in the ground.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Dry Area", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31805, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31742, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 31586, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "mountain", 
         Vnum = 31589, 
      }, 
      [31590] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "D.T(to be edited)\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Teeth", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31581, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31590, 
      }, 
      [31591] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "The river of sewage flows into the area from the east and and northwest, and\
disappears off south.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "A Junction In The Sewer Tunnels", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31620, 
               Direction = "east", 
               Distance = 1, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31619, 
               Direction = "south", 
               Distance = 1, 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 31506, 
               Direction = "northwest", 
               Distance = 1, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "underground", 
         Vnum = 31591, 
      }, 
      [31592] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are walking along a hardened sand path which seems to be headed to a\
cliff. The towering sand dunes make you feel scared as you are so small\
and enclosed by the towering heaps of sand. The sun is too warm and is\
getting to you as you tread towards what is to be seen.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31557, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31593, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31592, 
      }, 
      [31593] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are coming to the end of the path as far as you can see. The cliff is\
right ahead of you. The sand blows slowly into your face stinging your\
eyes and the rest of your face. The sun pounds down onto your back making\
you feel twice as heavy as usual. At some points down this way it gets\
steep and you slip a little landing right on your behind.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31592, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31594, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31593, 
      }, 
      [31594] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are standing on the edge of a cliff. It overlooks the great city of Mos\
Eisley. It is a great sight. To the east you see the path curve down the\
side of the cliff. The sand blows slowly into your face stinging your eyes\
and the rest of your face. The sun pounds down onto your back making you\
feel twice as heavy as usual. As you walk slowly down the side of the\
cliff the sand gets sharper and if you are not wearing foot gear it could\
get painful.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "The Cliff", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31593, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31595, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 31597, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31594, 
      }, 
      [31595] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "Still walking along the cliff you start curving down the side of a\
mountain. You are walking down a hard sand path filled with sharp\
minerals that hurt your feet as you walk over the sand. The heat is\
driving against your back as the twin suns start burning your skin, the\
air is hot and heavy lacking moisture. As the sand blows slowly against\
your face you wish you had something to protect it as shards or sand start\
stinging against your face.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31596, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31594, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31595, 
      }, 
      [31596] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You Curve down the bottom of the path and approach the entry to the city. \
You are walking down a hard sand path filled with sharp minerals that hurt\
your feet as you walk over the sand. The heat is driving against your back\
as the twin suns start burning your skin, the air is hot and heavy lacking\
moisture. As the sand blows slowly against your face you wish you had\
something to protect it as shards or sand start stinging against your\
face.\
", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert End", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31601, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31595, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31596, 
      }, 
      [31597] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are walking along the edge of the cliff. Be careful where you go. The\
sand blows slowly into your face, stinging your eyes and the rest of your\
face. The sand flies into your eyes like annoying bugs stinging your eyes\
until the point where you are going to cry. The sun pounds down onto your\
back making you feel twice as heavy as usual.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Cliff", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31600, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31594, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 31598, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31597, 
      }, 
      [31598] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are very near the edge and should return. Be careful. As you walk down\
the edge of the cliff you see chunks of sand falling down the side of the\
cliff. Seconds later you hear the thumping of the sand hitting the ground\
far below. The sand blows slowly into your face stinging your eyes and the\
rest of your face. To the south the sand looks very unstable. It would be\
advisable not to go there.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Cliff", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31667, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31597, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 31599, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31598, 
      }, 
      [31599] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "Aaah, you are loosing your grip! Looking down would not be a good idea as for\
you're about to fall!\
", 
         Flags = 
         {
            [24] = "NoFloor", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Cliffside", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31598, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Flags = 
               {
                  [11] = "Hidden", 
               }, 
               DestinationVnum = 31880, 
               Direction = "down", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31599, 
      }, 
      [31600] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are walking along the flat sands of Tatooine.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31658, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31597, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31600, 
      }, 
      [31601] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You walk into the city, it is a large places with many uses. The thugs of\
the galaxy hang around this town. You are walking down a hard sand path\
filled with sharp minerals that hurt your feet as you walk over the sand.\
The heat is driving against your back as the twin suns start burning your\
skin, the air is hot and heavy lacking moisture. As the sand blows slowly\
against your face you wish you had something to protect it as shards or\
sand start stinging against your face.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Edge Of Mos Eisley", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31596, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31602, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 31878, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "city", 
         Vnum = 31601, 
      }, 
      [31602] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are walking towards the inner town of Mos Eisley and towards the\
spaceport. The market is also in the vicinity of the inner city. You are\
walking down a hard sand path filled with sharp minerals that hurt your\
feet as you walk over the sand. The heat is driving against your back as\
the twin suns start burning your skin, the air is hot and heavy lacking\
moisture. As the sand blows slowly against your face you wish you had\
something to protect it as shards or sand start stinging against your\
face.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "City", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31601, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31628, 
               Direction = "east", 
               Distance = 1, 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 31603, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "city", 
         Vnum = 31602, 
      }, 
      [31603] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are approaching an intersection which will bring you to different parts\
of the city. You are walking down a hard sand path filled with sharp\
minerals that hurt your feet as you walk over the sand. The heat is\
driving against your back as the twin suns start burning your skin, the\
air is hot and heavy lacking moisture. As the sand blows slowly against\
your face you wish you had something to protect it as shards or sand start\
stinging against your face.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "City", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31602, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31604, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "city", 
         Vnum = 31603, 
      }, 
      [31604] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are walking down the path heading directly to the Spaceport. You are\
walking through the large, scum filled city of Mos Eisley. You are\
walking down a hard sand path filled with sharp minerals that hurt your\
feet as you walk over the sand. The heat is driving against your back as\
the twin suns start burning your skin, the air is hot and heavy lacking\
moisture. As the sand blows slowly against your face you wish you had\
something to protect it as shards or sand start stinging against your\
face.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "In Front Of Mos Eisley Spaceport", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31603, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31653, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 31605, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "PlayerStart", 
         Sector = "city", 
         Vnum = 31604, 
      }, 
      [31605] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are walking down a path to the control center. There they watch the\
activities of vessels from all parts of the galaxy. It is not a very large\
building but is suitable for its purpose. The ground beneath your feet is\
hardening as you approach the centre and the air is continuasly heavy and\
warm.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Pathway To Control Center", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31604, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31841, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 31606, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "city", 
         Vnum = 31605, 
      }, 
      [31606] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are in front of the control center for the spaceport. Inside this building\
many descisions are made to decide who should be allowed to land on this\
planet and not to cause air havoc.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Pathway To Control Center", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31605, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31607, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "city", 
         Vnum = 31606, 
      }, 
      [31607] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are in front of the doors to the spaceport control center. To enter it go\
to the west. At many times of the year this building is just chained up and\
locked. Left here abandoned for the law here is not really kept up tight. The\
door is of solid wood and looks very strong.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "In Front Of The Control Center", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31606, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               DestinationVnum = 31608, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "city", 
         Vnum = 31607, 
      }, 
      [31608] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are in the entrance to the control center. There are turbolifts moving\
all around you. The control tower is on the higher levels but the offices are\
here on the main level of the building. The ground is hard and seems to be\
made of stone. The air is crisp and relaxing in here for it is shielded from\
the twin suns of Tatooine.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Inside The Control Center", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31609, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               DestinationVnum = 31607, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 31613, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [4] = 
            {
               Key = -1, 
               DestinationVnum = 31615, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31608, 
      }, 
      [31609] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are in a hallway with doors to executive offices all the way down the\
hall. There are doors placed on both sides of the hall leading into individual\
offices.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Hallway", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31608, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31610, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31609, 
      }, 
      [31610] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You walk down a narrow hallway which has not much space to each side. To your\
sides there are two offices which hold different things. The ground here is\
made of stone and the illumination is poor as for only one glowpanel remains\
to light up this entire hallway. The air is relaxing and constantly flooding\
your lungs for it is a change towards the hot and heavy air outdoors.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "In The Hallway", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               DestinationVnum = 31611, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31609, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               DestinationVnum = 31612, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31610, 
      }, 
      [31611] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are in one of the first offices ever built. It is well furnished and\
decorated. It is used for conferences because of its size but there are not\
many conferences because of the slackness of law on this planet.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Large Conference Room", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               DestinationVnum = 31610, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31611, 
      }, 
      [31612] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "This office is a private office for the manager of this facility. It is a\
rather large office with many vents in it to allow the entrance of crisp air\
to enter the room. There is a large desk made from oak in the middle of the\
room stacked up with 3 pieces of paper.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Manager's Office", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               DestinationVnum = 31610, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31612, 
      }, 
      [31613] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "This hallway heads towards the rooms with the generating and computer\
equipment of the control center.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Hallway", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31608, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               DestinationVnum = 31614, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31613, 
      }, 
      [31614] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "This room contains all of the power generating equipment for the spaceport.\
The generators and computer systems are all mounted on the walls.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Generator Room", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               DestinationVnum = 31613, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31614, 
      }, 
      [31615] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "This is the lobby of the control center. In the corner a secretary takes\
messages and allows passage to the tower.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Lobby", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31608, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Flags = 
               {
                  [0] = "IsDoor", 
                  [5] = "PickProof", 
               }, 
               DestinationVnum = 31616, 
               Direction = "up", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31615, 
      }, 
      [31616] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are standing in the control tower. Most of the tower is run by droids and\
computers. The only living creatures are humans.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Tower", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31617, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Flags = 
               {
                  [0] = "IsDoor", 
                  [5] = "PickProof", 
               }, 
               DestinationVnum = 31615, 
               Direction = "down", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31616, 
      }, 
      [31617] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "Here you can see the whole spaceport from this large viewing screen. As you\
peer through it you can see many different species of life from all across the\
galaxy.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Viewscreen", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31616, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31617, 
      }, 
      [31618] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "The upstairs of the cantina contains a few rooms that Wuher rents out for a\
small fee. They are barren and comfortable but the locks all work so at\
least they should be a safe.\
 \
This would be a good place to rest for a while. You may quit and reenter\
the game from here.\
 \
", 
         Flags = 
         {
            [2] = "NoMob", 
            [10] = "Safe", 
            [23] = "Hotel", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Upstairs In The Cantina", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31863, 
               Direction = "down", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "city", 
         Vnum = 31618, 
      }, 
      [31619] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "Beyond a large grate blocking the way ahead, you see a light far ahead, at the\
end of the tunnel. This is probably where the sewege goes. You probably don't\
even want to know what happens to it next.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Tunnel Blocked By A Large Grate", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31591, 
               Direction = "north", 
               Distance = 1, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "underground", 
         Vnum = 31619, 
      }, 
      [31620] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "The tunnels widen into a large chamber. The river of sewage runs through it,\
but most of the floor is dry ground. The purpose of this chamber is not\
obvious, as it's otherwise empty.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "A Large Chamber", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31622, 
               Direction = "east", 
               Distance = 1, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31591, 
               Direction = "west", 
               Distance = 1, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "underground", 
         Vnum = 31620, 
      }, 
      [31621] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "The tunnel bends as the river flows from the east to the southwest. There are\
some large fans embedded into the wall, probably to provide breathable air\
into the tunnels.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "A Bend In The Tunnels", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31504, 
               Direction = "east", 
               Distance = 1, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31622, 
               Direction = "southwest", 
               Distance = 1, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "underground", 
         Vnum = 31621, 
      }, 
      [31622] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "#31904\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "A Tunnel In The Sewers", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31620, 
               Direction = "west", 
               Distance = 1, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31621, 
               Direction = "northeast", 
               Distance = 1, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "underground", 
         Vnum = 31622, 
      }, 
      [31623] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "Even the people working down here deserve a break, and this is where they\
take it. There are some posters on the walls that otherwise has an industrial\
look to them.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Maintenance Personnel's Area", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
               }, 
               DestinationVnum = 31503, 
               Direction = "south", 
               Distance = 1, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "underground", 
         Vnum = 31623, 
      }, 
      [31624] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "", 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Mercs For Hire", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31882, 
               Direction = "east", 
               Distance = 1, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31625, 
               Direction = "west", 
               Distance = 1, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31624, 
      }, 
      [31625] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Foyer Of Facility", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31626, 
               Direction = "north", 
               Distance = 1, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31624, 
               Direction = "east", 
               Distance = 1, 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 31627, 
               Direction = "west", 
               Distance = 1, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31625, 
      }, 
      [31626] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "", 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Combat Trainer", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31625, 
               Direction = "south", 
               Distance = 1, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31626, 
      }, 
      [31627] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "", 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Equipment Shop", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31625, 
               Direction = "east", 
               Distance = 1, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31627, 
      }, 
      [31628] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Another Street In Mos Eisley", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31629, 
               Direction = "east", 
               Distance = 1, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31602, 
               Direction = "west", 
               Distance = 1, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "city", 
         Vnum = 31628, 
      }, 
      [31629] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Straight Street", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31630, 
               Direction = "north", 
               Distance = 1, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31634, 
               Direction = "east", 
               Distance = 1, 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 31628, 
               Direction = "west", 
               Distance = 1, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "city", 
         Vnum = 31629, 
      }, 
      [31630] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "", 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Artisan Guild", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31631, 
               Direction = "north", 
               Distance = 1, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31629, 
               Direction = "south", 
               Distance = 1, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31630, 
      }, 
      [31631] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Guild Foyer", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31633, 
               Direction = "north", 
               Distance = 1, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31630, 
               Direction = "south", 
               Distance = 1, 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 31632, 
               Direction = "west", 
               Distance = 1, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31631, 
      }, 
      [31632] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "", 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Engineering Classes", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31631, 
               Direction = "east", 
               Distance = 1, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31632, 
      }, 
      [31633] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "", 
         Flags = 
         {
            [26] = "Factory", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "A Large Workshop", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31631, 
               Direction = "south", 
               Distance = 1, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31633, 
      }, 
      [31634] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Straight Street", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31635, 
               Direction = "south", 
               Distance = 1, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31629, 
               Direction = "west", 
               Distance = 1, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "city", 
         Vnum = 31634, 
      }, 
      [31635] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "The Mayor's Building", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31634, 
               Direction = "north", 
               Distance = 1, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31636, 
               Direction = "south", 
               Distance = 1, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31635, 
      }, 
      [31636] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "", 
         Flags = 
         {
            [10] = "Safe", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "A Spacious Office", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31635, 
               Direction = "north", 
               Distance = 1, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31636, 
      }, 
      [31637] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "", 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Floating in a void", 
         Exits = 
         {
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31637, 
      }, 
      [31638] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You're standing in front of a small hut made out of synstone. Because of\
the occasional sand storms in the area tearing at the building, it's hard\
to predict how old this structure is.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Outside Old Ben's Hut", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               DestinationVnum = 31639, 
               Direction = "north", 
               Distance = 1, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31681, 
               Direction = "south", 
               Distance = 1, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "BensHut", 
         Sector = "desert", 
         Vnum = 31638, 
      }, 
      [31639] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "The Living Area", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31641, 
               Direction = "north", 
               Distance = 1, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               DestinationVnum = 31638, 
               Direction = "south", 
               Distance = 1, 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 31640, 
               Direction = "west", 
               Distance = 1, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31639, 
      }, 
      [31640] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "The alcove is small and semicircular. The walls are simple without anything\
interesting on them. There's just enough room for a bed, but nothing else.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "A Semi-circular Sleeping Alcove", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31639, 
               Direction = "east", 
               Distance = 1, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31640, 
      }, 
      [31641] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "A Simple Kitchen", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31642, 
               Direction = "north", 
               Distance = 1, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31639, 
               Direction = "south", 
               Distance = 1, 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               DestinationVnum = 31644, 
               Direction = "down", 
               Distance = 1, 
               Description = "", 
               Keyword = "trapdoor", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31641, 
      }, 
      [31642] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Pantry", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31643, 
               Direction = "east", 
               Distance = 1, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31641, 
               Direction = "south", 
               Distance = 1, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31642, 
      }, 
      [31643] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Bathroom", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31642, 
               Direction = "west", 
               Distance = 1, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31643, 
      }, 
      [31644] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "The Cellar", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31645, 
               Direction = "south", 
               Distance = 1, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               DestinationVnum = 31641, 
               Direction = "up", 
               Distance = 1, 
               Description = "", 
               Keyword = "trapdoor", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31644, 
      }, 
      [31645] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "", 
         Flags = 
         {
            [16] = "Silence", 
            [26] = "Factory", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "A Small Workshop", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31644, 
               Direction = "north", 
               Distance = 1, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31645, 
      }, 
      [31646] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Northern Edge Of The Jundland Wastes", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31523, 
               Direction = "north", 
               Distance = 1, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31647, 
               Direction = "south", 
               Distance = 1, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31646, 
      }, 
      [31647] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Fort Tusken", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31646, 
               Direction = "north", 
               Distance = 1, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "FortTusken", 
         Sector = "desert", 
         Vnum = 31647, 
      }, 
      [31653] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are walking down one of the main roads in Mos Eisley. As you walk by you\
notice a huge pile of junk where people deposit their goods. The ground you\
walk on is hard and sharp and the air continues to remain the same, heavy and\
warm. The air seems to be getting to you with every step you take but you can\
manage it, after all it's only air.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Large Pathway Through The City", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31840, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31654, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 31604, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "city", 
         Vnum = 31653, 
      }, 
      [31654] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
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
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "City Road", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31655, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31653, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               DestinationVnum = 31907, 
               Direction = "down", 
               Distance = 1, 
               Description = "", 
               Keyword = "manhole", 
            }, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "entry_prog", 
               Arguments = "100", 
               Code = "if isjedi($n)\
    if level($n) < 25\
        mpechoat $n You sense that there's something of interest below.\
    endif\
endif\
", 
            }, 
         }, 
         Tag = "", 
         Sector = "city", 
         Vnum = 31654, 
      }, 
      [31655] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are still continuing down the path through Mos Eisley. Just ahead\
you can see the famous cantina. If you would like to enter it veer to\
the south. But beware this place is dangerous. The ground is hot and\
sandy, the air hot and heavy and of course the heat continuously\
pelts down on you as the twin suns heat the planet. The many business\
places that are around you look interesting and some may be of use. \
There is some active life all around you and it scares you at how\
many dirty people can be in one place. \
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "City", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31874, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31873, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 31853, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [4] = 
            {
               Key = -1, 
               DestinationVnum = 31654, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "city", 
         Vnum = 31655, 
      }, 
      [31658] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are standing on the harsh sand of Tatooine. You are walking on the\
rippling surface of the sand which has been exposed to extreme heat over\
the many years. The sand is very warm and stings your face as the wind\
blows it up onto your soft skin. The air is thick and very heavy to\
breathe, but living with it something you accepted when you entered the\
desert.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31659, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31600, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31658, 
      }, 
      [31659] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are on the hard sand of Tatooine. All around you you can see sand for\
miles unless you look back.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31660, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31658, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31659, 
      }, 
      [31660] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are standing on the thickening sand of Tatooine.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31661, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31659, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31660, 
      }, 
      [31661] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "The sand under you is still hard and glowing. As you look around all you can\
see is shiny sand.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31660, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31662, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31661, 
      }, 
      [31662] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You walk on the sand of Tatooine. As you walk over it your feet sink into the\
ground leaving an everlasting mark.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31661, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31663, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31662, 
      }, 
      [31663] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are walking on the sand of Tatooine. The sand gradually hardens with\
every minute exposed to the sun.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31662, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31664, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31663, 
      }, 
      [31664] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "The sand under you is feeling hotter with rays of the sun beaming down on it.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31663, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31665, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31664, 
      }, 
      [31665] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are standing on the great sands of Tatooine. Far away in the distance you\
can see the developing sea of sand dunes.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31664, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31666, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31665, 
      }, 
      [31666] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are heading towards the great sand dunes, yet it is still a long journey\
to reach the sand dune sea.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31683, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31665, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31666, 
      }, 
      [31667] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are headed towards the great dune sea, leaving civilization behind.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31668, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31598, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31667, 
      }, 
      [31668] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are standing on the hard sand of the planet which has been exposed to\
harsh sun rays.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31669, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31667, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31668, 
      }, 
      [31669] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "The sand under you is continually getting softer every step you take towards\
the great sea of sand dunes.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31670, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31668, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31669, 
      }, 
      [31670] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You can now clearly make out the sand dunes ahead of you, but they are still\
very far away.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31671, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31669, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31670, 
      }, 
      [31671] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are nearing the great sea of sand dunes with every step you take.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31672, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31670, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31671, 
      }, 
      [31672] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are approaching the sand dunes quickly now and will be there soon. With\
every step you take the sand seems to be getting softer and thicker.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31673, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31671, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31672, 
      }, 
      [31673] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are only but feet of in reach of the great sea.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31674, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31672, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31673, 
      }, 
      [31674] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are nearing the bottom of the first sand dune in sight. All of a sudden\
they seem much bigger than before. They also seem to be growing with every\
step you take.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31675, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31673, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31674, 
      }, 
      [31675] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "The great dune sea now seems so vast and enormous with every step you take.\
In all directions there are sand dunes towering around and over you.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31676, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31674, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31675, 
      }, 
      [31676] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are surrounded by sand, the dunes extend as far as you can see.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31675, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31677, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31676, 
      }, 
      [31677] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You walk endlessly on the sand beneath you. It towers all around and\
makes you feel enclosed.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31676, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31678, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31677, 
      }, 
      [31678] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are walking on a dune. It is shaped by the everlasting winds of Tatooine.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31677, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31679, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31678, 
      }, 
      [31679] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "The sand around you is thick and hot. In the daytime the sunrays make the\
sand extremely hot.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31678, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31680, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31679, 
      }, 
      [31680] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are walking on the sand dunes of the great sea. They tower around you in\
all directions.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31679, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31681, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31680, 
      }, 
      [31681] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are walking though the thick sand. It covers your feet and makes you feel\
enclosed.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31638, 
               Direction = "north", 
               Distance = 1, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31680, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31681, 
      }, 
      [31682] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You walk on the sand dunes of the great sea of Tatooine. They shimmer around\
you in the daylight.\
", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31682, 
      }, 
      [31683] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are standing on the thickening sand of the desert.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31684, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31666, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31683, 
      }, 
      [31684] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are nearing the first of many sand dunes. All around you can now\
see the sand dunes of the great sea. You can already feel the wind\
blowing the sharp sand into your face. The sand is very sharp so\
wearing something on your face would be a good idea. The twin suns of\
the planet are pounding heat onto your back as you walk slowly\
through the drifts of sand. Your lungs are hurting because this heavy\
air is making their job two times harder. \
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31685, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31683, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31684, 
      }, 
      [31685] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are at the step of the first sand dune. You can enter the sand dune sea\
of Tatooine to the north, the west and the east.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31686, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31698, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 31684, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [4] = 
            {
               Key = -1, 
               DestinationVnum = 31694, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31685, 
      }, 
      [31686] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are on one of many large sand dunes in this vast sea.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31687, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31685, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31686, 
      }, 
      [31687] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "All around you are large sand dunes. If you would like to stay out of the sea\
turn back now.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31688, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31686, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31687, 
      }, 
      [31688] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are inside a small valley of sand dunes. All around you shimmering sand\
dunes tower over you.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31689, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31687, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31688, 
      }, 
      [31689] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are now in the great sea. The only thing you will find is this great sea\
is probably death.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31688, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31690, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31689, 
      }, 
      [31690] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are standing on a vast sand dune which is high enough for you to see\
clearly across the sea.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31689, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31691, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31690, 
      }, 
      [31691] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are among many sand dunes. All around you the great sand dunes tower over\
you and you now wonder what you're doing here.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31690, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31692, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31691, 
      }, 
      [31692] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "The vast sand dunes around you make you feel enclosed. For as far as you can\
see there is only sand.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31691, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31693, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31692, 
      }, 
      [31693] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are going endlessly over sand dunes wondering why you are here.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31692, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31693, 
      }, 
      [31694] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are standing in front of a largely spaced sea of sand dunes which seems\
never ending.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31685, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31695, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31694, 
      }, 
      [31695] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are leaving any hopes of finding civilization behind. The only thing you\
shall find out here is certain death.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31694, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31696, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31695, 
      }, 
      [31696] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are looking endlessly at the sand around you. You are but only a small\
figure compared to the sand surrounding you.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31702, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31695, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 31697, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31696, 
      }, 
      [31697] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are on a sand dune. You can glare far out into the dune sea, but all you\
can see is sand, sand and more sand.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31706, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31696, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 31711, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31697, 
      }, 
      [31698] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are standing in front of a sand dune. In all directions but the one you\
came are sand dunes.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31699, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31685, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31698, 
      }, 
      [31699] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "The sand is thicker now that you are on the sand dunes. The great sea is\
greater than you thought and it might be wise to turn back now.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31700, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31698, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31699, 
      }, 
      [31700] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are on a sand dune. As you look the sand dunes never end in this vast sea.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31701, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31699, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31700, 
      }, 
      [31701] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are in the endless sea of sand dunes. All around you all you can see is\
sand.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31700, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31701, 
      }, 
      [31702] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are still in the endless sea of sand dunes. As you peer around yourself\
it feels hopeless in regards to where you are.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31703, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31696, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31702, 
      }, 
      [31703] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are in between many sand dunes. They are around you from every angle and\
you feel enclosed because of their height.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31704, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31702, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31703, 
      }, 
      [31704] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are on the side of a sand dune. You look around you and there are still\
no traces of life.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31705, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31703, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31704, 
      }, 
      [31705] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "All around you all you can see is sand. The towering sand dunes are all\
around you and you cannot figure out where you are.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31704, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31705, 
      }, 
      [31706] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are standing on soft sand. With sand dunes surrounding you, you just\
keep on walking.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31707, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31697, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 31714, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31706, 
      }, 
      [31707] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are walking on a sand dune. All around you there are sand dunes. They\
tower high over you until you reach the top of one and start heading back\
down.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31708, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31706, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31707, 
      }, 
      [31708] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are standing on the top of a sand dune. And as you hope for something all\
you can see is the voyage down the side of yet another sand dune.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31709, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31707, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 31718, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31708, 
      }, 
      [31709] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are heading down the side of a dune. Its size makes you feel tired for it\
only makes the journey longer.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31710, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31708, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31709, 
      }, 
      [31710] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are surrounded by sand dunes and as they tower over you, you feel\
enclosed.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31709, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31710, 
      }, 
      [31711] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are enlosed by many sand dunes which lay around you.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31697, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31712, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31711, 
      }, 
      [31712] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are on a sand dune. You can only see sand and formations of dunes in your range of vision.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31711, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31713, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31712, 
      }, 
      [31713] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are standing on the top of a sand dune. You feel bigger when you reach the\
top of a sand dune but there is always the way down to think about.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31712, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31713, 
      }, 
      [31714] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are walking down the side of a sand dune. All around you is sand as far\
as you can see.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31706, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31715, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31714, 
      }, 
      [31715] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "The dunes around you are normal as you walk over the endless amount of sand.\
The sea of rippling sand still surrounds you with overwhelming greatness. The\
sand has a reflective shine to it assisted by the sunrays of the heating suns.\
You feel enclosed because the dunes tower over you greatly.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31714, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31716, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31715, 
      }, 
      [31716] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are on the side of a dune. It is a large dune so walking down it only to\
walk up another is starting to bother you. The dunes around you are normal as\
you walk over the endless amount of sand. The sea of rippling sand still\
surrounds you with overwhelming greatness. The sand has a reflective shine to\
it assisted by the sunrays of the heating suns. You feel enclosed because the\
dunes tower over you greatly.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31715, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31717, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31716, 
      }, 
      [31717] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are standing in between various sand dunes of all sizes and shapes.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31716, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31717, 
      }, 
      [31718] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are walking on soft sand. The sand dunes tower around you from all\
directions.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31708, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31719, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31718, 
      }, 
      [31719] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are on the side of a sand dune approaching the top.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31718, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31720, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31719, 
      }, 
      [31720] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are on the top edge of a sand dune. As you peer around you there is only\
sand.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31719, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31721, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31720, 
      }, 
      [31721] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are standing on the side of the sharply shaped sand dune. You are\
approaching the bottom once again so that you can continue with your\
journey.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31722, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31720, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31721, 
      }, 
      [31722] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are on a large sand dune. All around you can see sand.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31723, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31721, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31722, 
      }, 
      [31723] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are walking on the side of a sand dune. All around you sand dunes tower\
over you.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31722, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31724, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31723, 
      }, 
      [31724] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are standing on the top of a sand dune. All around you there is sand.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31725, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31723, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31724, 
      }, 
      [31725] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are surrounded by sand from all sides and feel enclosed.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31724, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31726, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31725, 
      }, 
      [31726] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are standing on the top of a sand dune. You can see what seems to be a\
palace of some sort in the side of a sand dune just ahead.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31725, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31727, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31726, 
      }, 
      [31727] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are standing in front of what you now recognize as Jabba the Hutt's former\
home.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "The Dune Sea", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31728, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31726, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "desert", 
         Vnum = 31727, 
      }, 
      [31728] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are in front of a large door. It seems to not have been opened in years.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "In Front Of Jabba's Palace", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               DestinationVnum = 31729, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31727, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "JabbasPalace", 
         Sector = "desert", 
         Vnum = 31728, 
      }, 
      [31729] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are standing in a large opening surrounded by large walls which tower\
around you. It is very dark in here and you can only continue to the north.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Entrance To Jabba's Palace", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31730, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               DestinationVnum = 31728, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31729, 
      }, 
      [31730] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are walking down a corridor towards the what seems to be a large room.\
The air around you is thick and has a foul odor.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Hallway In Jabba's Palace", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31731, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31729, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31730, 
      }, 
      [31731] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are standing in front of the large audience chamber. It was designed to\
hold many people including dancing girls, bands and tables full of people.\
But, since the Monks took over the palace it has not been used.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "In Front Of Audience Chamber", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31732, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31733, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 31730, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [4] = 
            {
               Key = -1, 
               DestinationVnum = 31734, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31731, 
      }, 
      [31732] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are standing on Jabba the Hutt's former Dais. It is a very large area\
which has an exellent view of the audience chamber.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Jabba's Dais", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31731, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31732, 
      }, 
      [31733] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are standing directly on the trapdoor that was used to feed traitors to\
the Rancor which was killed by Luke Skywalker.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Trapdoor", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31800, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31731, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 31798, 
               Direction = "down", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31733, 
      }, 
      [31734] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are in the audience chambers of the palace. You can go up the stairs\
towards some of the living quarters of the monks.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Audience Chambers", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31736, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31731, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 31735, 
               Direction = "up", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31734, 
      }, 
      [31735] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are on the upper level of the palace that is now inhabited by mainly\
boormir monks and spiderwalkers.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Upper Level Entrance", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31746, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31734, 
               Direction = "down", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31735, 
      }, 
      [31736] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are standing beside the Dais of the former Jabba the Hutt. From here you\
cannot see very well but you are very near the Dais.\
", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Beside The Dais", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31734, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31736, 
      }, 
      [31737] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are standing beside the Dais. From here you have a good view of the chambers.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Beside The Dais", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31733, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "inside", 
         Vnum = 31737, 
      }, 
      [31738] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are standing on a flat rocky surface. As you peer around you see that the\
Jundland Wastes are very large.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Jundland Wastes", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31739, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31586, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "mountain", 
         Vnum = 31738, 
      }, 
      [31739] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You walk around the Jundland Wastes. All around you there is a very\
strong odour.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Jundland Wastes", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31740, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31738, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "mountain", 
         Vnum = 31739, 
      }, 
      [31740] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You stand on rock. It is a very large area you are about to explore. The odour\
is still strong around you.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Jundland Wastes", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31741, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31739, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "mountain", 
         Vnum = 31740, 
      }, 
      [31741] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You can see lots of rocks and cliffs of many different shapes and sizes all\
around you. The odour is still all around you.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "The Lars Homestead", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31740, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "LarsHomestead", 
         Sector = "mountain", 
         Vnum = 31741, 
      }, 
      [31742] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You are walking through the Jundland Wastes. All around you there is a\
distinct odour. Things and small creatures many dead lay here but cannot be\
taken without effort, they must not be worth anything.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Vague Area", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31743, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31589, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "mountain", 
         Vnum = 31742, 
      }, 
      [31743] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Description = "You walk down a path through the wastes. All around you the odour thickens.\
", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Jundland Wastes", 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 31744, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 31742, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tag = "", 
         Sector = "mountain", 
         Vnum = 31743, 
      }, 
   }, 
   Objects = 
   {
      [31500] = 
      {
         ItemType = "light", 
         ShortDescr = "a small white candle", 
         Description = "A candle rests here.", 
         Flags = 
         {
            [0] = "Glow", 
            [10] = "AntiEvil", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Name = "candle", 
         Affects = 
         {
            [1] = 
            {
               Location = 18, 
               Modifier = 1, 
            }, 
         }, 
         ActionDescription = "", 
         Cost = 0, 
         Weight = 1, 
         Layers = 0, 
         ObjectValues = 
         {
            [1] = 1, 
            [2] = 30, 
            [3] = 1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Vnum = 31500, 
      }, 
      [31501] = 
      {
         ItemType = "container", 
         ShortDescr = "a large brain jar with flashing lights", 
         Description = "A large jar containing a sacred brain lies here. ", 
         Flags = 
         {
            [0] = "Glow", 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Name = "brain jar", 
         ActionDescription = "", 
         Cost = 0, 
         Weight = 3, 
         Layers = 0, 
         ObjectValues = 
         {
            [1] = 1, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Vnum = 31501, 
      }, 
      [31502] = 
      {
         ItemType = "corpse", 
         ShortDescr = "a dead Jawa", 
         Description = "A dead Jawa lies motionless on the ground here.", 
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
         ActionDescription = "", 
         Cost = 0, 
         Weight = 100, 
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
         Vnum = 31502, 
      }, 
      [31503] = 
      {
         ItemType = "trash", 
         ShortDescr = "a large egg", 
         Description = "A large egg lays here, falling over every once in a while.", 
         Flags = 
         {
            [12] = "NoRemove", 
         }, 
         Affects = 
         {
            [1] = 
            {
               Location = 9, 
               Modifier = 0, 
            }, 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "A large egg with different colors on it lays here. It would probably not be\
\13wise to take it or the mother might get mad.", 
               Keyword = "look egg", 
            }, 
         }, 
         Name = "Egg", 
         Cost = 0, 
         ActionDescription = "", 
         Weight = 2, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Layers = 0, 
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
      }, 
      [31504] = 
      {
         ItemType = "light", 
         ShortDescr = "a shiny krayt crystal", 
         Description = "A shiny krayt crystal lays here.", 
         Affects = 
         {
            [1] = 
            {
               Location = 17, 
               Modifier = 5, 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Shiny krayt crystal", 
         Cost = 0, 
         ActionDescription = "", 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Layers = 0, 
         ObjectValues = 
         {
            [1] = 9000, 
            [2] = 110, 
            [3] = 1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 100000, 
         }, 
         Vnum = 31504, 
      }, 
      [31505] = 
      {
         ItemType = "armor", 
         ShortDescr = "a krayt pearl", 
         Description = "A glowing pearl lays here.", 
         Flags = 
         {
            [0] = "Glow", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Pearl", 
         Cost = 0, 
         ActionDescription = "", 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Layers = 0, 
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
      }, 
      [31506] = 
      {
         ItemType = "drink_container", 
         ShortDescr = "a canteen", 
         Description = "A canteen rests here, waiting to be picked up.", 
         ExtraDescriptions = 
         {
         }, 
         Name = "Canteen", 
         Cost = 0, 
         ActionDescription = "", 
         Weight = 2, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Layers = 0, 
         ObjectValues = 
         {
            [1] = 10, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         Vnum = 31506, 
      }, 
      [31507] = 
      {
         ItemType = "drink_container", 
         ShortDescr = "a jug of water", 
         Description = "A jug of water rests here.", 
         ExtraDescriptions = 
         {
         }, 
         Name = "jug", 
         Cost = 0, 
         ActionDescription = "", 
         Weight = 5, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Layers = 0, 
         ObjectValues = 
         {
            [1] = 15, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 15, 
         }, 
         Vnum = 31507, 
      }, 
      [31508] = 
      {
         ItemType = "circuit", 
         ShortDescr = "a torn up circuit", 
         Description = "A torn up circuit lies here, waiting to be picked up.", 
         ExtraDescriptions = 
         {
         }, 
         Name = "Circuit", 
         Cost = 0, 
         ActionDescription = "", 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Layers = 0, 
         ObjectValues = 
         {
            [1] = 1, 
            [2] = 5, 
            [3] = 3, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         Vnum = 31508, 
      }, 
      [31509] = 
      {
         ItemType = "armor", 
         ShortDescr = "a dirty Jawa robe", 
         Description = "A Jawa robe is here, waiting to be taken.", 
         Flags = 
         {
            [0] = "Glow", 
            [18] = "SmallSize", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Jawa Robe", 
         Affects = 
         {
            [1] = 
            {
               Location = 5, 
               Modifier = 0, 
            }, 
         }, 
         ActionDescription = "", 
         Cost = 0, 
         Weight = 3, 
         Layers = 0, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 1345, 
            [4] = 0, 
            [5] = 0, 
            [0] = 1, 
         }, 
         Vnum = 31509, 
      }, 
      [31510] = 
      {
         ItemType = "trash", 
         ShortDescr = "some wire", 
         Description = "Some wire is here, waiting to be taken", 
         ExtraDescriptions = 
         {
         }, 
         Name = "Wire", 
         Cost = 0, 
         ActionDescription = "", 
         Weight = 2, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Layers = 0, 
         ObjectValues = 
         {
            [1] = 15, 
            [2] = 6, 
            [3] = 11, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         Vnum = 31510, 
      }, 
      [31511] = 
      {
         ItemType = "weapon", 
         ShortDescr = "a Jawa Blaster", 
         Description = "A elegant little blaster lays here on the ground.", 
         Affects = 
         {
            [1] = 
            {
               Location = 18, 
               Modifier = 0, 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Jawa Blaster", 
         Cost = 0, 
         ActionDescription = "", 
         Weight = 6, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Layers = 0, 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 6, 
            [3] = 6, 
            [4] = 0, 
            [5] = 0, 
            [0] = 7200, 
         }, 
         Vnum = 31511, 
      }, 
      [31512] = 
      {
         ItemType = "armor", 
         ShortDescr = "Satin's Glimmering Belt.", 
         Description = "A powerful godly belt lays on the ground here.", 
         Flags = 
         {
            [0] = "Glow", 
         }, 
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
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "This belt glows and hums with extreme power comming from it. This object cannot be handled by a mortal mind for its powers are to great.", 
               Keyword = "look belt", 
            }, 
         }, 
         Name = "Glimmering Belt", 
         Cost = 0, 
         ActionDescription = "", 
         Weight = 1, 
         WearFlags = 
         {
            [11] = "Waist", 
         }, 
         Layers = 0, 
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
      }, 
      [31513] = 
      {
         ItemType = "treasure", 
         ShortDescr = "a large stick", 
         Description = "A large stick of the Wise Storyteller lays here.", 
         ExtraDescriptions = 
         {
         }, 
         Name = "Stick", 
         Cost = 0, 
         ActionDescription = "", 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Layers = 0, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 17000, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Vnum = 31513, 
      }, 
      [31514] = 
      {
         ItemType = "furniture", 
         ShortDescr = "a large oak desk", 
         Description = "A large oak desk collects dust on the ground here.", 
         ExtraDescriptions = 
         {
         }, 
         Name = "large oak desk", 
         ActionDescription = "", 
         Cost = 0, 
         Weight = 150, 
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
         Vnum = 31514, 
      }, 
      [31515] = 
      {
         ItemType = "armor", 
         ShortDescr = "a mechanics belt", 
         Description = "A mechanics belt lays here waiting to be used.", 
         Flags = 
         {
            [31] = "HumanSize", 
         }, 
         Affects = 
         {
            [1] = 
            {
               Location = 4, 
               Modifier = 0, 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Belt", 
         Cost = 0, 
         ActionDescription = "", 
         Weight = 4, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Layers = 0, 
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
      }, 
      [31516] = 
      {
         ItemType = "armor", 
         ShortDescr = "a mechanics hat", 
         Description = "A mechanics hat collects dust on the ground.", 
         Flags = 
         {
            [31] = "HumanSize", 
         }, 
         Affects = 
         {
            [1] = 
            {
               Location = 2, 
               Modifier = 0, 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Hat", 
         Cost = 0, 
         ActionDescription = "", 
         Weight = 2, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Layers = 0, 
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
      }, 
      [31517] = 
      {
         ItemType = "weapon", 
         ShortDescr = "a Jawa ionization gun", 
         Description = "A Jawa ionization gun has been foolishly left behind.", 
         ExtraDescriptions = 
         {
         }, 
         Name = "Ionization Gun", 
         Cost = 0, 
         ActionDescription = "", 
         Weight = 8, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Layers = 0, 
         ObjectValues = 
         {
            [1] = 6, 
            [2] = 6, 
            [3] = 6, 
            [4] = 1000, 
            [5] = 1000, 
            [0] = 7200, 
         }, 
         Vnum = 31517, 
      }, 
      [31518] = 
      {
         ItemType = "key", 
         ShortDescr = "a small hide Key", 
         Description = "A small key crafted from hide", 
         ExtraDescriptions = 
         {
         }, 
         Name = "key", 
         Cost = 0, 
         ActionDescription = "", 
         Weight = 5, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
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
         Vnum = 31518, 
      }, 
      [31519] = 
      {
         ItemType = "furniture", 
         ShortDescr = "a droid detector", 
         Description = "A droid detector is mounted on the wall here.", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "greet_prog", 
               Arguments = "100", 
               Code = "if isdroid($n)\
    mpechoat $n The droid detector flashes and beeps as you enter.\
    mpechoaround $n The droid detector flashes and beeps as $n enters.\
    mpecho From within the cantina someone shouts, 'Hey! We don't serve your kind here!'\
endif\
", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Detector", 
         ActionDescription = "", 
         Cost = 0, 
         Weight = 900, 
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
         Vnum = 31519, 
      }, 
      [31520] = 
      {
         ItemType = "furniture", 
         ShortDescr = "a large drink machine", 
         Description = "A large and complex drink machine sits here. It is used by Wuher\
\13to dispense drinks.", 
         Flags = 
         {
            [0] = "Glow", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Drink Machine", 
         ActionDescription = "", 
         Cost = 0, 
         Weight = 5, 
         Layers = 0, 
         ObjectValues = 
         {
            [1] = 1, 
            [2] = 6, 
            [3] = 11, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Vnum = 31520, 
      }, 
      [31521] = 
      {
         ItemType = "trash", 
         ShortDescr = "a bed", 
         Description = "A comfortable bed lays here. Maybe laying down would not hurt you.", 
         ExtraDescriptions = 
         {
         }, 
         Name = "Bed", 
         Cost = 0, 
         ActionDescription = "", 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
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
         Vnum = 31521, 
      }, 
      [31522] = 
      {
         ItemType = "food", 
         ShortDescr = "a bantha rib", 
         Description = "A bantha rib is here for your enjoyment.", 
         ExtraDescriptions = 
         {
         }, 
         Name = "Bantha rib", 
         Cost = 10, 
         ActionDescription = "", 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Layers = 0, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 3, 
         }, 
         Vnum = 31522, 
      }, 
      [31523] = 
      {
         ItemType = "food", 
         ShortDescr = "a banthaburger", 
         Description = "A banthaburger site here ready to eat.", 
         ExtraDescriptions = 
         {
         }, 
         Name = "Banthaburger", 
         Cost = 15, 
         ActionDescription = "", 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Layers = 0, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         Vnum = 31523, 
      }, 
      [31524] = 
      {
         ItemType = "food", 
         ShortDescr = "some grilled womp rat", 
         Description = "Some grilled womp rat is here ready to be snatched up.", 
         ExtraDescriptions = 
         {
         }, 
         Name = "Grilled Womp Rat", 
         Cost = 16, 
         ActionDescription = "", 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Layers = 0, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 4, 
         }, 
         Vnum = 31524, 
      }, 
      [31525] = 
      {
         ItemType = "trash", 
         ShortDescr = "a hologram projector", 
         Description = "A hologram projector is here.", 
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
         ActionDescription = "", 
         Cost = 0, 
         Weight = 1, 
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
         Vnum = 31525, 
      }, 
      [31526] = 
      {
         ItemType = "furniture", 
         ShortDescr = "a worn couch", 
         Description = "A worn couch is here.", 
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
         ActionDescription = "", 
         Cost = 0, 
         Weight = 1, 
         Layers = 0, 
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
      }, 
      [31527] = 
      {
         ItemType = "furniture", 
         ShortDescr = "spacious seats", 
         Description = "Rows of spacious seats fill this section.", 
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
         ActionDescription = "", 
         Cost = 0, 
         Weight = 1, 
         Layers = 0, 
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
      }, 
      [31528] = 
      {
         ItemType = "furniture", 
         ShortDescr = "cramped seats", 
         Description = "Cramped seats fill the economy section.", 
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
         ActionDescription = "", 
         Cost = 0, 
         Weight = 1, 
         Layers = 0, 
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
      }, 
      [31529] = 
      {
         ItemType = "container", 
         ShortDescr = "a refridgerator", 
         Description = "A small refridgerator stands in a corner.", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "100", 
               Code = "-- This script restocks the fridge with a randomly picked item of food\
if otypeinobj(food) < 3\
    macro opoload_one_of 31522 31523 31524\
    mpecho The refridgerator makes a loud humming noise.\
endif\
", 
            }, 
         }, 
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
         ActionDescription = "", 
         Cost = 0, 
         Weight = 1, 
         Layers = 0, 
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
      }, 
      [31530] = 
      {
         ItemType = "trash", 
         ShortDescr = "a fake flower", 
         Description = "A large fake flower in a large pot.", 
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
         ActionDescription = "", 
         Cost = 0, 
         Weight = 1, 
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
         Vnum = 31530, 
      }, 
      [31531] = 
      {
         ItemType = "trash", 
         ShortDescr = "the machinery", 
         Description = "Some mysterious-looking machinery is here, making a lot of noise.", 
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
         ActionDescription = "", 
         Cost = 0, 
         Weight = 1, 
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
         Vnum = 31531, 
      }, 
      [31532] = 
      {
         ItemType = "armor", 
         ShortDescr = "a jumpsuit", 
         Description = "A jumpsuit lies neatly folded on the ground.", 
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
         Name = "jumpsuit", 
         Cost = 10, 
         ActionDescription = "", 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
            [3] = "Body", 
         }, 
         Layers = 0, 
         ObjectValues = 
         {
            [1] = 4, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 4, 
         }, 
         Vnum = 31532, 
      }, 
      [31533] = 
      {
         ItemType = "fabric", 
         ShortDescr = "a low-quality rodent skin", 
         Description = "Some low-quality rodent skin is lying on the ground.", 
         ExtraDescriptions = 
         {
         }, 
         Name = "low-quality rodent skin", 
         Cost = 25, 
         ActionDescription = "", 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Layers = 0, 
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Vnum = 31533, 
      }, 
      [31534] = 
      {
         ItemType = "furniture", 
         ShortDescr = "a plastic table", 
         Description = "A plastic table with some chairs is here.", 
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
         ActionDescription = "", 
         Cost = 0, 
         Weight = 1, 
         Layers = 0, 
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
      }, 
      [31535] = 
      {
         ItemType = "trash", 
         ShortDescr = "a few rusty pipes", 
         Description = "A few rusty pipes comes down from the ceiling.", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "25", 
               Code = "mpecho The rusty pipes spew out more sewage into the river.\
", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Name = "rusty pipes", 
         ActionDescription = "", 
         Cost = 0, 
         Weight = 1, 
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
         Vnum = 31535, 
      }, 
      [31536] = 
      {
         ItemType = "furniture", 
         ShortDescr = "an uncomfortable bed", 
         Description = "An uncomfortable bed is here.", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Name = "uncomfortable bed", 
         ActionDescription = "", 
         Cost = 0, 
         Weight = 1, 
         Layers = 0, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 2, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         Vnum = 31536, 
      }, 
      [31537] = 
      {
         ItemType = "container", 
         ShortDescr = "a workbench", 
         Description = "A workbench with drawers.", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Name = "workbench drawers", 
         ActionDescription = "", 
         Cost = 0, 
         Weight = 1, 
         Layers = 0, 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 20, 
         }, 
         Vnum = 31537, 
      }, 
      [31538] = 
      {
         ItemType = "book", 
         ShortDescr = "a mysterious book", 
         Description = "A mysterious book is here.", 
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
         ActionDescription = "", 
         Cost = 0, 
         Weight = 1, 
         Layers = 0, 
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
      }, 
      [31999] = 
      {
         ItemType = "trash", 
         ShortDescr = "a newly created lastobject", 
         Description = "Some god dropped a newly created lastobject here.", 
         ExtraDescriptions = 
         {
         }, 
         Name = "lastobject", 
         ActionDescription = "", 
         Cost = 0, 
         Weight = 1, 
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
         Vnum = 31999, 
      }, 
   }, 
   Filename = "tatooine.lua", 
   FileFormatVersion = 1, 
   ResetMessage = "", 
}
