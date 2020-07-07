-- Tatooine
-- Last saved Tuesday 07-Jul-2020 18:36:00

AreaEntry
{
   Filename = "tatooine.lua", 
   Mobiles = 
   {
      [31500] = 
      {
         Position = "standing", 
         Flags = 
         {
            [0] = "Npc", 
            [2] = "Scavenger", 
            [6] = "StayArea", 
         }, 
         Description = "This is a aged monk. He has lived here for many years and has small scars on\
his body.\
", 
         ArmorClass = 0, 
         Alignment = 100, 
         Stats = 
         {
            Intelligence = 0, 
            Wisdom = 0, 
            Luck = 0, 
            Constitution = 0, 
            Force = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Strength = 0, 
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
         Weight = 0, 
         LongDescr = "A monk wanders around the palace.\
", 
         SaveVs = 
         {
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Race = "Human", 
         HitRoll = 0, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Name = "monk", 
         Level = 22, 
         Height = 0, 
         DamRoll = 0, 
         ShortDescr = "a short monk", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Sex = "male", 
         DefaultPosition = "standing", 
         Vnum = 31500, 
         NumberOfAttacks = 0, 
         Credits = 0, 
      }, 
      [31501] = 
      {
         Position = "standing", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [6] = "StayArea", 
            [7] = "Wimpy", 
         }, 
         Description = "This jawa seems fierce and old. He has a small pouch where he keeps his money\
and change for customers willing to purchase something.\
", 
         ArmorClass = 0, 
         Alignment = 111, 
         Stats = 
         {
            Intelligence = 0, 
            Wisdom = 0, 
            Luck = 0, 
            Constitution = 0, 
            Force = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Strength = 0, 
         }, 
         Shop = 
         {
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
            KeeperShortDescr = "a large Jawa", 
            ProfitBuy = 110, 
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
         MudProgs = 
         {
            [1] = 
            {
               Code = "say If you're looking for some goods...\
say ... you've come to the right place.\
", 
               Arguments = "100", 
               MudProgType = "all_greet_prog", 
            }, 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Weight = 0, 
         LongDescr = "A large, mean looking Jawa sits in his chair comfortably here selling liquids for journeys out into the great dune sea.\
", 
         Race = "Human", 
         ShortDescr = "a large Jawa", 
         HitRoll = 0, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Name = "water jawa", 
         AffectedBy = 
         {
            [7] = "Sanctuary", 
         }, 
         Height = 0, 
         DamRoll = 0, 
         Credits = 30000, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Sex = "male", 
         DefaultPosition = "standing", 
         Vnum = 31501, 
         NumberOfAttacks = 0, 
         Level = 35, 
      }, 
      [31502] = 
      {
         Position = "standing", 
         Flags = 
         {
            [1] = "Sentinel", 
            [2] = "Scavenger", 
            [0] = "Npc", 
            [5] = "Aggressive", 
            [6] = "StayArea", 
         }, 
         Description = "This ferocious creature is rare but very valuble to many people throughout\
this galaxy. As it eyes you, you wonder what to do.\
", 
         ArmorClass = -170, 
         Alignment = 0, 
         Stats = 
         {
            Intelligence = 0, 
            Wisdom = 0, 
            Luck = 0, 
            Constitution = 0, 
            Force = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Strength = 0, 
         }, 
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
         SaveVs = 
         {
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Weight = 0, 
         LongDescr = "A large krayt stands here towering over you, staring you in the eye.\
", 
         Race = "Human", 
         ShortDescr = "a large krayt dragon", 
         HitRoll = 0, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Name = "Krayt dragon", 
         AffectedBy = 
         {
            [7] = "Sanctuary", 
         }, 
         Height = 0, 
         DamRoll = 0, 
         Credits = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Sex = "female", 
         DefaultPosition = "standing", 
         Vnum = 31502, 
         NumberOfAttacks = 0, 
         Level = 100, 
      }, 
      [31503] = 
      {
         Position = "standing", 
         Flags = 
         {
            [0] = "Npc", 
            [2] = "Scavenger", 
            [6] = "StayArea", 
         }, 
         Description = "This creature does not look to be of one of the more appreciated kind.\
", 
         ArmorClass = 97, 
         Alignment = 0, 
         Stats = 
         {
            Intelligence = 0, 
            Wisdom = 0, 
            Luck = 0, 
            Constitution = 0, 
            Force = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Strength = 0, 
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
         Weight = 0, 
         LongDescr = "A womp rat hops by.\
", 
         SaveVs = 
         {
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Race = "Human", 
         HitRoll = 0, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 10, 
            HitPlus = 10, 
         }, 
         Name = "womp rat", 
         Level = 1, 
         Height = 0, 
         DamRoll = 0, 
         ShortDescr = "a small womp Rat", 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 0, 
         }, 
         Sex = "male", 
         DefaultPosition = "standing", 
         Vnum = 31503, 
         NumberOfAttacks = 0, 
         Credits = 0, 
      }, 
      [31504] = 
      {
         Position = "standing", 
         Flags = 
         {
            [0] = "Npc", 
            [2] = "Scavenger", 
            [6] = "StayArea", 
         }, 
         Description = "This creature is not one of the more respectable species but manages to live\
on its own. This Jawa is a very young and untrained.\
", 
         ArmorClass = 0, 
         Alignment = 115, 
         Stats = 
         {
            Intelligence = 0, 
            Wisdom = 0, 
            Luck = 0, 
            Constitution = 0, 
            Force = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Strength = 0, 
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
         Weight = 0, 
         LongDescr = "A young Jawa walks around here.\
", 
         SaveVs = 
         {
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Race = "Human", 
         HitRoll = 0, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Name = "Young Jawa", 
         Level = 3, 
         Height = 0, 
         DamRoll = 0, 
         ShortDescr = "a young Jawa", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Sex = "male", 
         DefaultPosition = "standing", 
         Vnum = 31504, 
         NumberOfAttacks = 0, 
         Credits = 0, 
      }, 
      [31505] = 
      {
         Position = "standing", 
         Flags = 
         {
            [1] = "Sentinel", 
            [2] = "Scavenger", 
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         Description = "This is not a regular filthy creature. This Jawa is trained and armed to the\
teeth. Consider it before you attack him.\
", 
         ArmorClass = 0, 
         Alignment = 150, 
         Stats = 
         {
            Intelligence = 0, 
            Wisdom = 0, 
            Luck = 0, 
            Constitution = 0, 
            Force = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Strength = 0, 
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
         Weight = 0, 
         LongDescr = "The Jawa guard stands here guarding something.\
", 
         SaveVs = 
         {
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Race = "Human", 
         HitRoll = 0, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Name = "jawa guard", 
         Level = 25, 
         Height = 0, 
         DamRoll = 0, 
         ShortDescr = "a Jawa guard", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Sex = "male", 
         DefaultPosition = "standing", 
         Vnum = 31505, 
         NumberOfAttacks = 0, 
         Credits = 0, 
      }, 
      [31506] = 
      {
         Position = "standing", 
         Flags = 
         {
            [0] = "Npc", 
            [2] = "Scavenger", 
            [6] = "StayArea", 
         }, 
         Description = "This scavenger is a small animal whom which no attention is regarded.\
", 
         ArmorClass = 0, 
         Alignment = 0, 
         Stats = 
         {
            Intelligence = 0, 
            Wisdom = 0, 
            Luck = 0, 
            Constitution = 0, 
            Force = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Strength = 0, 
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
         Weight = 0, 
         LongDescr = "A scavenger walks around here picking up anything he can see.\
", 
         SaveVs = 
         {
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Race = "Human", 
         HitRoll = 0, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Name = "Scavenger", 
         Level = 3, 
         Height = 0, 
         DamRoll = 0, 
         ShortDescr = "a scavenger", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Sex = "male", 
         DefaultPosition = "standing", 
         Vnum = 31506, 
         NumberOfAttacks = 0, 
         Credits = 0, 
      }, 
      [31507] = 
      {
         Position = "standing", 
         Flags = 
         {
            [0] = "Npc", 
            [2] = "Scavenger", 
            [6] = "StayArea", 
         }, 
         Description = "You are looking at one of the ancestors of this planet. They have been here\
ever since the Dowager Queen crashed into the planet.\
", 
         ArmorClass = 0, 
         Alignment = 140, 
         Stats = 
         {
            Intelligence = 0, 
            Wisdom = 0, 
            Luck = 0, 
            Constitution = 0, 
            Force = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Strength = 0, 
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
         Weight = 0, 
         LongDescr = "A moisture farmer walks around here, trying to find his destination.\
", 
         SaveVs = 
         {
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Race = "Human", 
         HitRoll = 0, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Name = "Moisture Farmer", 
         Level = 9, 
         Height = 0, 
         DamRoll = 0, 
         ShortDescr = "a moisture farmer", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Sex = "male", 
         DefaultPosition = "standing", 
         Vnum = 31507, 
         NumberOfAttacks = 0, 
         Credits = 0, 
      }, 
      [31508] = 
      {
         Position = "standing", 
         Flags = 
         {
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         Description = "This power droid is rather old and has been used for many different purposes\
over the years of its existence. Although it is still functional it is almost\
ready to be trashed. Small wires and shorted connections are sprawled out on\
different parts of the droids surface.\
", 
         ArmorClass = 0, 
         Alignment = 0, 
         Stats = 
         {
            Intelligence = 0, 
            Wisdom = 0, 
            Luck = 0, 
            Constitution = 0, 
            Force = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Strength = 0, 
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
         Weight = 0, 
         LongDescr = "A power droid moves around on the ground here, humming.\
", 
         SaveVs = 
         {
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Race = "Human", 
         HitRoll = 0, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Name = "Power droid", 
         Level = 8, 
         Height = 0, 
         DamRoll = 0, 
         ShortDescr = "a square power droid", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Sex = "undistinguished", 
         DefaultPosition = "standing", 
         Vnum = 31508, 
         NumberOfAttacks = 0, 
         Credits = 0, 
      }, 
      [31509] = 
      {
         Position = "standing", 
         Flags = 
         {
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         Description = "This droid, when speaking, makes no sense to you. Throught its beeps and\
sounds its trying to say something to you but you have no clue what. This\
droid seems to have been used before but is in excellent shape.\
", 
         ArmorClass = 0, 
         Alignment = 0, 
         Stats = 
         {
            Intelligence = 0, 
            Wisdom = 0, 
            Luck = 0, 
            Constitution = 0, 
            Force = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Strength = 0, 
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
         Weight = 0, 
         LongDescr = "A small astromech droid stands around here chirping away.\
", 
         SaveVs = 
         {
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Race = "Human", 
         HitRoll = 0, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Name = "Astromech droid.", 
         Level = 15, 
         Height = 0, 
         DamRoll = 0, 
         ShortDescr = "an astromech droid", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Sex = "undistinguished", 
         DefaultPosition = "standing", 
         Vnum = 31509, 
         NumberOfAttacks = 0, 
         Credits = 0, 
      }, 
      [31510] = 
      {
         Position = "standing", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [9] = "Train", 
            [6] = "StayArea", 
         }, 
         Description = "This Jawa has studied the ways of this world for many years, and if you pay\
attention can teach you may things of many uses. Be careful not to attack him\
for he has great powers.\
", 
         ArmorClass = 0, 
         Alignment = 210, 
         Stats = 
         {
            Intelligence = 0, 
            Wisdom = 0, 
            Luck = 0, 
            Constitution = 0, 
            Force = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Strength = 0, 
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
         SaveVs = 
         {
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         VipFlags = 
         {
            [8] = "Tatooine", 
         }, 
         Weight = 0, 
         LongDescr = "A wise Jawa stands here ready to teach you skills.\
", 
         Race = "Human", 
         ShortDescr = "a wise Jawa", 
         HitRoll = 0, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Name = "Wise Jawa", 
         AffectedBy = 
         {
            [7] = "Sanctuary", 
         }, 
         Height = 0, 
         DamRoll = 0, 
         Credits = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Sex = "undistinguished", 
         DefaultPosition = "standing", 
         Vnum = 31510, 
         NumberOfAttacks = 0, 
         Level = 45, 
      }, 
      [31511] = 
      {
         Position = "standing", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         Description = "This is no mere guard. He too has developed many skills and is powerful. You\
should consider attacking him, wisely.\
", 
         ArmorClass = 0, 
         Alignment = 0, 
         Stats = 
         {
            Intelligence = 0, 
            Wisdom = 0, 
            Luck = 0, 
            Constitution = 0, 
            Force = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Strength = 0, 
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
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpechoat $n The guard ushers you into the chamber.\
mpechoaround $n The guard ushers $n into the chamber.\
mptransfer $n 31838\
mpat $n mpechoaround $n $n is ushered into the chamber.\
", 
               Arguments = "p yes", 
               MudProgType = "speech_prog", 
            }, 
            [2] = 
            {
               Code = "say Welcome! Are you ready to learn young apprentice?\
", 
               Arguments = "p arrives from the west.", 
               MudProgType = "act_prog", 
            }, 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Weight = 0, 
         LongDescr = "A guardian stands here watching over The Wise One.\
", 
         Race = "Human", 
         ShortDescr = "a guardian", 
         HitRoll = 0, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Name = "Guardian", 
         AffectedBy = 
         {
            [7] = "Sanctuary", 
         }, 
         Height = 0, 
         DamRoll = 0, 
         Credits = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Sex = "male", 
         DefaultPosition = "standing", 
         Vnum = 31511, 
         NumberOfAttacks = 0, 
         Level = 40, 
      }, 
      [31512] = 
      {
         Position = "standing", 
         Flags = 
         {
            [0] = "Npc", 
            [5] = "Aggressive", 
            [2] = "Scavenger", 
            [6] = "StayArea", 
         }, 
         Description = "This species has adapted to the ways of living in the desert. He is strong in\
mind and is very vicious. Be careful what you do.\
", 
         ArmorClass = 0, 
         Alignment = 0, 
         Stats = 
         {
            Intelligence = 0, 
            Wisdom = 0, 
            Luck = 0, 
            Constitution = 0, 
            Force = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Strength = 0, 
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
         MudProgs = 
         {
            [1] = 
            {
               Code = "snarl\
swear $n\
", 
               Arguments = "70", 
               MudProgType = "all_greet_prog", 
            }, 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Weight = 0, 
         LongDescr = "A Tusken Rauder watches you waiting for the right moment to attack.\
", 
         Level = 23, 
         Race = "Human", 
         HitRoll = 0, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Name = "Sand person tusken raider", 
         VipFlags = 
         {
            [8] = "Tatooine", 
         }, 
         Height = 0, 
         DamRoll = 0, 
         ShortDescr = "a Tusken Raider", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Sex = "male", 
         DefaultPosition = "standing", 
         Vnum = 31512, 
         NumberOfAttacks = 0, 
         Credits = 0, 
      }, 
      [31513] = 
      {
         Position = "standing", 
         Flags = 
         {
            [0] = "Npc", 
            [2] = "Scavenger", 
            [6] = "StayArea", 
         }, 
         Description = "This Tusken Raider has survived years of training and memory. To become what\
he is he cannot make any mistakes or alter in any way a story told from the\
past or he will be killed, for the Sand People believe that once told a story\
can never be altered in any way.\
", 
         ArmorClass = 0, 
         Alignment = 0, 
         Stats = 
         {
            Intelligence = 0, 
            Wisdom = 0, 
            Luck = 0, 
            Constitution = 0, 
            Force = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Strength = 0, 
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
         Weight = 0, 
         LongDescr = "A Wise Tusken Raider sits here telling a story.\
", 
         SaveVs = 
         {
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Race = "Human", 
         HitRoll = 0, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Name = "Sand people tusken raider Storyteller.", 
         Level = 30, 
         Height = 0, 
         DamRoll = 0, 
         ShortDescr = "a Tusken Raider storyteller.", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Sex = "male", 
         DefaultPosition = "standing", 
         Vnum = 31513, 
         NumberOfAttacks = 0, 
         Credits = 0, 
      }, 
      [31514] = 
      {
         Position = "standing", 
         Flags = 
         {
            [0] = "Npc", 
            [2] = "Scavenger", 
            [6] = "StayArea", 
         }, 
         Description = "This is one of the younger, wiser Sand People. He is being trained to become\
the next Storyteller of the Sand People. He just hopes in his mind that he\
will remember and remember well every story precisely.\
", 
         ArmorClass = 0, 
         Alignment = 0, 
         Stats = 
         {
            Intelligence = 0, 
            Wisdom = 0, 
            Luck = 0, 
            Constitution = 0, 
            Force = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Strength = 0, 
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
         Weight = 0, 
         LongDescr = "A storyteller in training listens carefully here so that he may remember every story with precision and awe.      \
", 
         SaveVs = 
         {
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Race = "Human", 
         HitRoll = 0, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Name = "Storyteller training.", 
         Level = 25, 
         Height = 0, 
         DamRoll = 0, 
         ShortDescr = "a storyteller in training", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Sex = "male", 
         DefaultPosition = "standing", 
         Vnum = 31514, 
         NumberOfAttacks = 0, 
         Credits = 0, 
      }, 
      [31515] = 
      {
         Position = "standing", 
         Flags = 
         {
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         Description = "This creature is rather tame but when provoked can be aggressive and\
dangerous. Watch your step.\
", 
         ArmorClass = 0, 
         Alignment = 0, 
         Stats = 
         {
            Intelligence = 0, 
            Wisdom = 0, 
            Luck = 0, 
            Constitution = 0, 
            Force = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Strength = 0, 
         }, 
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
         Weight = 0, 
         LongDescr = "A ronto stands here towering over you.\
", 
         SaveVs = 
         {
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Race = "Human", 
         HitRoll = 0, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Name = "Ronto", 
         Level = 45, 
         Height = 0, 
         DamRoll = 0, 
         ShortDescr = "a ronto", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Sex = "male", 
         DefaultPosition = "standing", 
         Vnum = 31515, 
         NumberOfAttacks = 0, 
         Credits = 0, 
      }, 
      [31516] = 
      {
         Position = "standing", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [5] = "Aggressive", 
            [6] = "StayArea", 
         }, 
         Description = "This is a large furry creature which is rumored to have crushed people with\
one step. Be careful for he does not like people who are not his master.\
", 
         ArmorClass = 0, 
         Alignment = 0, 
         Stats = 
         {
            Intelligence = 0, 
            Wisdom = 0, 
            Luck = 0, 
            Constitution = 0, 
            Force = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Strength = 0, 
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
         Weight = 0, 
         LongDescr = "A bantha walks around here slowly, waiting for its master.\
", 
         SaveVs = 
         {
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Race = "Human", 
         HitRoll = 0, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Name = "Bantha", 
         Level = 35, 
         Height = 0, 
         DamRoll = 0, 
         ShortDescr = "a bantha", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Sex = "male", 
         DefaultPosition = "standing", 
         Vnum = 31516, 
         NumberOfAttacks = 0, 
         Credits = 0, 
      }, 
      [31517] = 
      {
         Position = "standing", 
         Flags = 
         {
            [1] = "Sentinel", 
            [2] = "Scavenger", 
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         Description = "This mechanic is rather young, he has marks and wrinkles from work and\
possibly war. He seems to be calm and will stay away from you unless you\
need something which he may sometimes have.\
", 
         ArmorClass = 0, 
         Alignment = 0, 
         Stats = 
         {
            Intelligence = 0, 
            Wisdom = 0, 
            Luck = 0, 
            Constitution = 0, 
            Force = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Strength = 0, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "say So ya need something fixed, eh?\
", 
               Arguments = "100", 
               MudProgType = "all_greet_prog", 
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
         Weight = 0, 
         LongDescr = "A mechanic waits here to be hired.\
", 
         SaveVs = 
         {
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Race = "Human", 
         HitRoll = 0, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Name = "Mechanic", 
         Level = 14, 
         Height = 0, 
         DamRoll = 0, 
         ShortDescr = "a mechanic", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Sex = "male", 
         DefaultPosition = "standing", 
         Vnum = 31517, 
         NumberOfAttacks = 0, 
         Credits = 0, 
      }, 
      [31518] = 
      {
         Position = "standing", 
         Flags = 
         {
            [1] = "Sentinel", 
            [2] = "Scavenger", 
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         Description = "This Jawa is probably the tallest Jawa ever. Although he is still smaller than\
you he looks tough, and with that gun I would be scared.\
", 
         ArmorClass = 0, 
         Alignment = 140, 
         Stats = 
         {
            Intelligence = 0, 
            Wisdom = 0, 
            Luck = 0, 
            Constitution = 0, 
            Force = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Strength = 0, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "say So...\
say You're interested in rontos, eh?\
nudge $n\
", 
               Arguments = "100", 
               MudProgType = "all_greet_prog", 
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
         Weight = 0, 
         LongDescr = "A tall jawa stands here protecting his Rontos.\
", 
         SaveVs = 
         {
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Race = "Human", 
         HitRoll = 0, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Name = "tall jawa", 
         Level = 19, 
         Height = 0, 
         DamRoll = 0, 
         ShortDescr = "a tall Jawa", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Sex = "male", 
         DefaultPosition = "standing", 
         Vnum = 31518, 
         NumberOfAttacks = 0, 
         Credits = 0, 
      }, 
      [31519] = 
      {
         Position = "standing", 
         Flags = 
         {
            [1] = "Sentinel", 
            [2] = "Scavenger", 
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         Description = "This man is rather old and has been working here for many years as bartender.\
Be careful though, he still has his same old edge.\
", 
         ArmorClass = 0, 
         Alignment = 0, 
         Stats = 
         {
            Intelligence = 0, 
            Wisdom = 0, 
            Luck = 0, 
            Constitution = 0, 
            Force = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Strength = 0, 
         }, 
         Shop = 
         {
            BusinessHours = 
            {
               Close = 23, 
               Open = 1, 
            }, 
            KeeperShortDescr = "Wuher", 
            ProfitBuy = 105, 
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
         Weight = 0, 
         LongDescr = "Wuher stands here serving people their drinks.\
", 
         SaveVs = 
         {
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Race = "Human", 
         HitRoll = 0, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Name = "Wuher", 
         Level = 65, 
         Height = 0, 
         DamRoll = 0, 
         ShortDescr = "Wuher", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Sex = "male", 
         DefaultPosition = "standing", 
         Vnum = 31519, 
         NumberOfAttacks = 0, 
         Credits = 0, 
      }, 
      [31520] = 
      {
         Position = "standing", 
         Flags = 
         {
            [0] = "Npc", 
            [24] = "NoAssist", 
         }, 
         Description = "A small womp rat walk around here seeking shelter.\
", 
         ArmorClass = 0, 
         Alignment = 0, 
         Stats = 
         {
            Intelligence = 0, 
            Wisdom = 0, 
            Luck = 0, 
            Constitution = 0, 
            Force = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Strength = 0, 
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
         Weight = 0, 
         LongDescr = "A small womp rat walks around here.\
", 
         SaveVs = 
         {
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Race = "Jawa", 
         HitRoll = 0, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Name = "small Womp Rat", 
         Level = 0, 
         Height = 0, 
         DamRoll = 0, 
         ShortDescr = "a small womp rat", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Sex = "undistinguished", 
         DefaultPosition = "standing", 
         Vnum = 31520, 
         NumberOfAttacks = 0, 
         Credits = 0, 
      }, 
      [31521] = 
      {
         Position = "standing", 
         Flags = 
         {
            [0] = "Npc", 
            [24] = "NoAssist", 
         }, 
         Description = "", 
         ArmorClass = 0, 
         Alignment = 0, 
         Stats = 
         {
            Intelligence = 0, 
            Wisdom = 0, 
            Luck = 0, 
            Constitution = 0, 
            Force = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Strength = 0, 
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
         SaveVs = 
         {
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Weight = 0, 
         LongDescr = "A small thief Walks about trying to pick your pocket.\
", 
         AttackFlags = 
         {
            [5] = "kick", 
         }, 
         Race = "Human", 
         HitRoll = 0, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Name = "Small Thief", 
         Level = 9, 
         Height = 0, 
         DamRoll = 0, 
         ShortDescr = "a small thief", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Sex = "undistinguished", 
         DefaultPosition = "standing", 
         Vnum = 31521, 
         NumberOfAttacks = 0, 
         Credits = 0, 
      }, 
      [31522] = 
      {
         Position = "standing", 
         Flags = 
         {
            [0] = "Npc", 
            [24] = "NoAssist", 
         }, 
         Description = "", 
         ArmorClass = 0, 
         Alignment = 0, 
         Stats = 
         {
            Intelligence = 0, 
            Wisdom = 0, 
            Luck = 0, 
            Constitution = 0, 
            Force = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Strength = 0, 
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
         SaveVs = 
         {
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Weight = 0, 
         LongDescr = "A large thief walks about here.\
", 
         AttackFlags = 
         {
            [4] = "punch", 
         }, 
         Race = "Human", 
         HitRoll = 0, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Name = "Large thief", 
         Level = 11, 
         Height = 0, 
         DamRoll = 0, 
         ShortDescr = "a large thief", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Sex = "undistinguished", 
         DefaultPosition = "standing", 
         Vnum = 31522, 
         NumberOfAttacks = 0, 
         Credits = 0, 
      }, 
      [31523] = 
      {
         Position = "standing", 
         Flags = 
         {
            [0] = "Npc", 
            [24] = "NoAssist", 
         }, 
         Description = "", 
         ArmorClass = 0, 
         Alignment = 0, 
         Stats = 
         {
            Intelligence = 0, 
            Wisdom = 0, 
            Luck = 0, 
            Constitution = 0, 
            Force = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Strength = 0, 
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
         MudProgs = 
         {
            [1] = 
            {
               Code = "Steal credits $n\
", 
               Arguments = "35", 
               MudProgType = "rand_prog", 
            }, 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Weight = 0, 
         LongDescr = "A skillful thief walks about here.\
", 
         AttackFlags = 
         {
            [4] = "punch", 
         }, 
         Race = "Human", 
         HitRoll = 0, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Name = "skillful thief", 
         Level = 17, 
         Height = 0, 
         DamRoll = 0, 
         ShortDescr = "a skillful thief", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Sex = "undistinguished", 
         DefaultPosition = "standing", 
         Vnum = 31523, 
         NumberOfAttacks = 0, 
         Credits = 0, 
      }, 
      [31524] = 
      {
         Position = "standing", 
         Flags = 
         {
            [0] = "Npc", 
            [24] = "NoAssist", 
         }, 
         Description = "", 
         ArmorClass = 0, 
         Alignment = 0, 
         Stats = 
         {
            Intelligence = 0, 
            Wisdom = 0, 
            Luck = 0, 
            Constitution = 0, 
            Force = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Strength = 0, 
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
         SaveVs = 
         {
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Weight = 0, 
         LongDescr = "A smuggler sits at a table watching.\
", 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         Race = "Human", 
         HitRoll = 0, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Name = "Smuggler", 
         Level = 18, 
         Height = 0, 
         DamRoll = 0, 
         ShortDescr = "a smuggler", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Sex = "undistinguished", 
         DefaultPosition = "standing", 
         Vnum = 31524, 
         NumberOfAttacks = 0, 
         Credits = 0, 
      }, 
      [31525] = 
      {
         Position = "standing", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Description = "", 
         ArmorClass = 0, 
         Alignment = 0, 
         Stats = 
         {
            Intelligence = 0, 
            Wisdom = 0, 
            Luck = 0, 
            Constitution = 0, 
            Force = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Strength = 0, 
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
         SaveVs = 
         {
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Weight = 0, 
         LongDescr = "An experienced smuggler waits for his contact here.\
", 
         AttackFlags = 
         {
            [5] = "kick", 
            [6] = "_06", 
            [9] = "_09", 
         }, 
         Race = "Human", 
         HitRoll = 0, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Name = "Experienced Smuggler", 
         Level = 26, 
         Height = 0, 
         DamRoll = 0, 
         ShortDescr = "an experienced smuggler", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Sex = "undistinguished", 
         DefaultPosition = "standing", 
         Vnum = 31525, 
         NumberOfAttacks = 0, 
         Credits = 0, 
      }, 
      [31526] = 
      {
         Position = "standing", 
         Flags = 
         {
            [0] = "Npc", 
            [24] = "NoAssist", 
         }, 
         Description = "", 
         ArmorClass = 0, 
         Alignment = 0, 
         Stats = 
         {
            Intelligence = 0, 
            Wisdom = 0, 
            Luck = 0, 
            Constitution = 0, 
            Force = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Strength = 0, 
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
         SaveVs = 
         {
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Weight = 0, 
         LongDescr = "An Ithorian drinks his liquors here.\
", 
         AttackFlags = 
         {
            [6] = "_06", 
            [5] = "kick", 
         }, 
         Race = "Human", 
         HitRoll = 0, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Name = "Ithorian", 
         Level = 14, 
         Height = 0, 
         DamRoll = 0, 
         ShortDescr = "an Ithorian", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Sex = "undistinguished", 
         DefaultPosition = "standing", 
         Vnum = 31526, 
         NumberOfAttacks = 0, 
         Credits = 0, 
      }, 
      [31527] = 
      {
         Position = "standing", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Description = "", 
         ArmorClass = 0, 
         Alignment = 0, 
         Stats = 
         {
            Intelligence = 0, 
            Wisdom = 0, 
            Luck = 0, 
            Constitution = 0, 
            Force = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Strength = 0, 
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
         Weight = 0, 
         LongDescr = "A female citizen minds her own buisness here.\
", 
         SaveVs = 
         {
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Race = "Human", 
         HitRoll = 0, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Name = "Female citizen", 
         Level = 6, 
         Height = 0, 
         DamRoll = 0, 
         ShortDescr = "a female citizen", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Sex = "undistinguished", 
         DefaultPosition = "standing", 
         Vnum = 31527, 
         NumberOfAttacks = 0, 
         Credits = 0, 
      }, 
      [31528] = 
      {
         Position = "standing", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Description = "", 
         ArmorClass = 0, 
         Alignment = 0, 
         Stats = 
         {
            Intelligence = 0, 
            Wisdom = 0, 
            Luck = 0, 
            Constitution = 0, 
            Force = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Strength = 0, 
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
         Weight = 0, 
         LongDescr = "A male citizen walks around here.\
", 
         SaveVs = 
         {
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Race = "Human", 
         HitRoll = 0, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Name = "Male citizen", 
         Level = 13, 
         Height = 0, 
         DamRoll = 0, 
         ShortDescr = "a male citizen", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Sex = "undistinguished", 
         DefaultPosition = "standing", 
         Vnum = 31528, 
         NumberOfAttacks = 0, 
         Credits = 0, 
      }, 
      [31529] = 
      {
         Position = "standing", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Description = "", 
         ArmorClass = 0, 
         Alignment = 0, 
         Stats = 
         {
            Intelligence = 0, 
            Wisdom = 0, 
            Luck = 0, 
            Constitution = 0, 
            Force = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Strength = 0, 
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
         Weight = 0, 
         LongDescr = "A Rodian sits here contemplating his navel.\
", 
         SaveVs = 
         {
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Race = "Human", 
         HitRoll = 0, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Name = "Rodian", 
         Level = 9, 
         Height = 0, 
         DamRoll = 0, 
         ShortDescr = "a Rodian", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Sex = "undistinguished", 
         DefaultPosition = "standing", 
         Vnum = 31529, 
         NumberOfAttacks = 0, 
         Credits = 0, 
      }, 
      [31530] = 
      {
         Position = "standing", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Description = "", 
         ArmorClass = 0, 
         Alignment = 0, 
         Stats = 
         {
            Intelligence = 0, 
            Wisdom = 0, 
            Luck = 0, 
            Constitution = 0, 
            Force = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Strength = 0, 
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
         MudProgs = 
         {
            [1] = 
            {
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
               Arguments = "100", 
               MudProgType = "fight_prog", 
            }, 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Weight = 0, 
         LongDescr = "Merth walks around here.\
", 
         AttackFlags = 
         {
            [9] = "_09", 
            [5] = "kick", 
         }, 
         Race = "Human", 
         HitRoll = 0, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Name = "Merth", 
         Level = 103, 
         Height = 0, 
         DamRoll = 0, 
         ShortDescr = "Merth", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Sex = "undistinguished", 
         DefaultPosition = "standing", 
         Vnum = 31530, 
         NumberOfAttacks = 0, 
         Credits = 0, 
      }, 
      [31531] = 
      {
         Position = "standing", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         Description = "", 
         ArmorClass = 20, 
         Alignment = 0, 
         Stats = 
         {
            Intelligence = 0, 
            Wisdom = 0, 
            Luck = 0, 
            Constitution = 0, 
            Force = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Strength = 0, 
         }, 
         Shop = 
         {
            BusinessHours = 
            {
               Close = 23, 
               Open = 1, 
            }, 
            KeeperShortDescr = "Wioslea", 
            ProfitBuy = 120, 
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
         MudProgs = 
         {
            [1] = 
            {
               Code = "say Business is bad, get outta here!\
grin\
", 
               Arguments = "100", 
               MudProgType = "all_greet_prog", 
            }, 
         }, 
         SaveVs = 
         {
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Weight = 0, 
         LongDescr = "Wioslea tends to her customers need.\
", 
         Level = 32, 
         Race = "Human", 
         HitRoll = 6, 
         HitChance = 
         {
            HitNoDice = 6, 
            HitSizeDice = 10, 
            HitPlus = 320, 
         }, 
         Name = "Wioslea", 
         VipFlags = 
         {
            [8] = "Tatooine", 
         }, 
         Height = 0, 
         DamRoll = 6, 
         ShortDescr = "Wioslea", 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 3, 
         }, 
         Sex = "undistinguished", 
         DefaultPosition = "standing", 
         Vnum = 31531, 
         NumberOfAttacks = 0, 
         Credits = 0, 
      }, 
      [31532] = 
      {
         Position = "standing", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         Description = "", 
         ArmorClass = 0, 
         Alignment = 0, 
         Stats = 
         {
            Intelligence = 0, 
            Wisdom = 0, 
            Luck = 0, 
            Constitution = 0, 
            Force = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Strength = 0, 
         }, 
         Shop = 
         {
            BusinessHours = 
            {
               Close = 23, 
               Open = 1, 
            }, 
            KeeperShortDescr = "Gep", 
            ProfitBuy = 110, 
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
         MudProgs = 
         {
            [1] = 
            {
               Code = "say Hello customer.\
say I have everything you need just type \"list\".\
", 
               Arguments = "100", 
               MudProgType = "all_greet_prog", 
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
         Weight = 0, 
         LongDescr = "Gep Stands here selling you food for your travels.\
", 
         SaveVs = 
         {
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Race = "Human", 
         HitRoll = 0, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Name = "Gep", 
         Level = 1, 
         Height = 0, 
         DamRoll = 0, 
         ShortDescr = "Gep", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Sex = "undistinguished", 
         DefaultPosition = "standing", 
         Vnum = 31532, 
         NumberOfAttacks = 0, 
         Credits = 0, 
      }, 
      [31533] = 
      {
         Position = "standing", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [17] = "NoWander", 
         }, 
         Description = "Taller than most Sullustans, the pump maintenance mechanic appears to be\
in decent shape. His ears is also larger than usual, and his eyes are dark\
and gleaming.\
", 
         ArmorClass = 50, 
         Alignment = 0, 
         Stats = 
         {
            Intelligence = 0, 
            Wisdom = 0, 
            Luck = 0, 
            Constitution = 0, 
            Force = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Strength = 0, 
         }, 
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
         Weight = 0, 
         LongDescr = "A Sullustan pump maintenance mechanic seems to be goofing off here.\
", 
         SaveVs = 
         {
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Race = "Sullustan", 
         HitRoll = 4, 
         HitChance = 
         {
            HitNoDice = 4, 
            HitSizeDice = 10, 
            HitPlus = 200, 
         }, 
         Name = "Sullustan pump mechanic", 
         Level = 20, 
         Height = 0, 
         DamRoll = 4, 
         ShortDescr = "a pump mechanic", 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 2, 
         }, 
         Sex = "male", 
         DefaultPosition = "standing", 
         Vnum = 31533, 
         NumberOfAttacks = 0, 
         Credits = 200, 
      }, 
      [31534] = 
      {
         Position = "standing", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Description = "A tatoo-rat is a small rodent with brown fur and a long tail.\
", 
         ArmorClass = 50, 
         Alignment = 0, 
         Stats = 
         {
            Intelligence = 0, 
            Wisdom = 0, 
            Luck = 0, 
            Constitution = 0, 
            Force = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Strength = 0, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "-- Drop loot on death\
if rand(50)\
    -- Low-quality rodent skin\
    mpoload 31533\
endif\
", 
               Arguments = "100", 
               MudProgType = "death_prog", 
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
         Weight = 0, 
         LongDescr = "A tatoo-rat seems to be searching for food.\
", 
         SaveVs = 
         {
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Race = "Rodent", 
         HitRoll = 4, 
         HitChance = 
         {
            HitNoDice = 4, 
            HitSizeDice = 10, 
            HitPlus = 200, 
         }, 
         Name = "tatoo-rat", 
         Level = 20, 
         Height = 0, 
         DamRoll = 4, 
         ShortDescr = "a tatoo-rat", 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 2, 
         }, 
         Sex = "undistinguished", 
         DefaultPosition = "standing", 
         Vnum = 31534, 
         NumberOfAttacks = 0, 
         Credits = 0, 
      }, 
      [31900] = 
      {
         Position = "standing", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [17] = "NoWander", 
            [10] = "Practice", 
            [25] = "NoKill", 
            [9] = "Train", 
         }, 
         Description = "Zim is a middle-aged male human with silvery stripes in his dark brown hair.\
His stomach is bulging over a leather belt that has a lightsaber hanging from\
it. \
\
In his younger days, during the Clone Wars, he was an apprentice to a minor\
Jedi Master. Unfortunately Zim never quite had the talent to pass the Jedi\
trials, and when Order 66 was issued, he was somehow overlooked. Since then\
he's been in hiding, seeking to pass on what little he learned. \
", 
         ArmorClass = -150, 
         Alignment = 0, 
         Stats = 
         {
            Intelligence = 0, 
            Wisdom = 0, 
            Luck = 0, 
            Constitution = 0, 
            Force = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Strength = 0, 
         }, 
         Shop = 
         {
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
            KeeperShortDescr = "Zim the Failed Jedi", 
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
         SaveVs = 
         {
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Languages = 
         {
            Speaks = 
            {
               [1] = "shyriiwook", 
               [0] = "basic", 
               [17] = "jawaese", 
            }, 
            Speaking = 
            {
               [0] = "basic", 
            }, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "if rand(33)\
    hiccup\
elif rand(50)\
    say Where did I put that bottle?\
else\
    mutter\
endif\
", 
               Arguments = "3", 
               MudProgType = "rand_prog", 
            }, 
            [2] = 
            {
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
               Arguments = "100", 
               MudProgType = "all_greet_prog", 
            }, 
         }, 
         Level = 100, 
         Weight = 0, 
         LongDescr = "Zim the Failed Jedi stands here before you.\
", 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         Race = "Human", 
         HitRoll = 20, 
         HitChance = 
         {
            HitNoDice = 20, 
            HitSizeDice = 10, 
            HitPlus = 15000, 
         }, 
         Name = "zim failed jedi", 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         Height = 0, 
         DamRoll = 20, 
         ShortDescr = "Zim the Failed Jedi", 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 10, 
         }, 
         Sex = "male", 
         DefaultPosition = "standing", 
         Vnum = 31900, 
         NumberOfAttacks = 0, 
         Credits = 0, 
      }, 
      [31902] = 
      {
         Position = "standing", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Description = "", 
         ArmorClass = 0, 
         Alignment = 0, 
         Stats = 
         {
            Intelligence = 0, 
            Wisdom = 0, 
            Luck = 0, 
            Constitution = 0, 
            Force = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Strength = 0, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
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
               Arguments = "100", 
               MudProgType = "greet_prog", 
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
         Weight = 0, 
         LongDescr = "A disillusioned student is doing chores.\
", 
         SaveVs = 
         {
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Race = "Human", 
         HitRoll = 0, 
         HitChance = 
         {
            HitNoDice = 10, 
            HitSizeDice = 100, 
            HitPlus = 0, 
         }, 
         Name = "disillusioned student", 
         Level = 1, 
         Height = 0, 
         DamRoll = 0, 
         ShortDescr = "a disillusioned student", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Sex = "male", 
         DefaultPosition = "standing", 
         Vnum = 31902, 
         NumberOfAttacks = 0, 
         Credits = 0, 
      }, 
      [31901] = 
      {
         Position = "standing", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [17] = "NoWander", 
            [25] = "NoKill", 
         }, 
         Description = "This young Jedi apprentice has long, brown hair in a low ponytail. His bland\
facial features are covered by a cropped beard. He's wearing plain clothes to\
blend in with the Mos Eisley population. Wearing Jedi robes would be very\
risky these days.\
", 
         ArmorClass = 50, 
         Alignment = 0, 
         Stats = 
         {
            Intelligence = 0, 
            Wisdom = 0, 
            Luck = 0, 
            Constitution = 0, 
            Force = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Strength = 0, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
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
               Arguments = "p disarm me", 
               MudProgType = "speech_prog", 
            }, 
            [2] = 
            {
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
               Arguments = "100", 
               MudProgType = "all_greet_prog", 
            }, 
            [3] = 
            {
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
               Arguments = "1", 
               MudProgType = "rand_prog", 
            }, 
            [4] = 
            {
               Code = "-- This script will make sure the mob always has a working lightsaber.\
-- This way the mob can be used to grind the disarm skill.\
\
if ovnumcarry(10323) < 1\
    mpoload 10323\
endif\
\
wield lightsaber\
", 
               Arguments = "10", 
               MudProgType = "rand_prog", 
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
         Weight = 0, 
         LongDescr = "A Jedi sparring partner looks eager for action.\
", 
         SaveVs = 
         {
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Race = "Human", 
         HitRoll = 4, 
         HitChance = 
         {
            HitNoDice = 4, 
            HitSizeDice = 10, 
            HitPlus = 10000, 
         }, 
         Name = "jedi sparring partner", 
         Level = 20, 
         Height = 0, 
         DamRoll = 4, 
         ShortDescr = "a Jedi sparring partner", 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 2, 
         }, 
         Sex = "male", 
         DefaultPosition = "standing", 
         Vnum = 31901, 
         NumberOfAttacks = 0, 
         Credits = 0, 
      }, 
      [31999] = 
      {
         Position = "standing", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Description = "", 
         ArmorClass = 0, 
         Alignment = 0, 
         Stats = 
         {
            Intelligence = 0, 
            Wisdom = 0, 
            Luck = 0, 
            Constitution = 0, 
            Force = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Strength = 0, 
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
         Weight = 0, 
         LongDescr = "Some god abandoned a newly created lastmob here.\
", 
         SaveVs = 
         {
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Race = "Human", 
         HitRoll = 0, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Name = "lastmob", 
         Level = 1, 
         Height = 0, 
         DamRoll = 0, 
         ShortDescr = "a newly created lastmob", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Sex = "undistinguished", 
         DefaultPosition = "standing", 
         Vnum = 31999, 
         NumberOfAttacks = 0, 
         Credits = 0, 
      }, 
   }, 
   ResetFrequency = 0, 
   Name = "Tatooine", 
   Rooms = 
   {
      [31744] = 
      {
         Sector = "mountain", 
         TeleVnum = 0, 
         Name = "Wastes", 
         Description = "You can smell an odour developing around you.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31745, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31743, 
            }, 
         }, 
         Vnum = 31744, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31745] = 
      {
         Sector = "mountain", 
         TeleVnum = 0, 
         Name = "Wastes", 
         Description = "You stand on a hard rocky surface. The air around you is very unpleasant.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31744, 
            }, 
         }, 
         Vnum = 31745, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31746] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "You are walking down a long, narrow hallway which turns at the end.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31747, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31735, 
            }, 
         }, 
         Name = "Long Hallway", 
         Vnum = 31746, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31747] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "You are walking down a hallway. It is old and there is a rather digusting\
smell all around you.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31748, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31746, 
            }, 
         }, 
         Name = "Hallway Through Jabba's Palace", 
         Vnum = 31747, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31748] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "You are standing in a hallway. To each side all along the hall there are\
small individual rooms.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31749, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31747, 
            }, 
         }, 
         Name = "Long Hallway in Jabba's Palace", 
         Vnum = 31748, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31749] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "You are coming to the end of the hallway which curves both to the east and\
to the west.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31750, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31748, 
            }, 
         }, 
         Name = "Long Hallway End", 
         Vnum = 31749, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31750] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "You are in a small narrow hallway which has a very disgusting odour, not\
surprising considering what creatures and animals have lived here in the past\
and even now. The ground is cool and hard full of ripples as if never crafted\
or taken care of.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31751, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31749, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31770, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "up", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31788, 
            }, 
         }, 
         Name = "Narrow Hallway", 
         Vnum = 31750, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31751] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "You are standing in a hallway facing east. As you look down the hallway at\
the end you can see different colored lights flashing in the dimness and the\
darkness. The ground is rough and the air is hot and heavy. Above a burnt out\
glowpanel lays motionless but you can still see pretty well.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31768, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31752, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31769, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31750, 
            }, 
         }, 
         Name = "Hallway Facing A Dark Room", 
         Vnum = 31751, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31752] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "You are walking down a narrow hallway. To each side there are very small rooms\
which are vacant.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31766, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31753, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31767, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31751, 
            }, 
         }, 
         Name = "Narrow Hallway ", 
         Vnum = 31752, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31753] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "You are walking down a hallway towards a very large opening. It appears not\
to be guarded or have a door in place. The ground beneath you is hard and full\
of cracks and uneven places. The air is heavy and hot but nothing that cannot\
be lived with.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31764, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31754, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31765, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31752, 
            }, 
         }, 
         Name = "A Long Hallway ", 
         Vnum = 31753, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31754] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "You approach the dark room at the end of the hallway with every step you\
take. To you sides you continually see small occupied rooms. The ground\
beneath your feet is rough and uneven making you feet ache all over. The\
lighting here is minimal but you can still see down the hall.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31762, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31755, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31763, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31753, 
            }, 
         }, 
         Name = "End Of Hallway Before A Large Room", 
         Vnum = 31754, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31755] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "You are standing in front of a very large room with different sections in it.\
The entrance used to have doors but as you can see they have been removed for\
all that remains is the hinges.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31760, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31756, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31761, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31754, 
            }, 
         }, 
         Name = "In Front Of A Large Room", 
         Vnum = 31755, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31756] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [0] = "Dark", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "You stand in a dark room filled with brain jars. Each brain is used to put\
inside of a spiderwalker. You can go down the rows in front of you. The ground\
is softer in here as if taken care of, there is not one ripple in the whole\
surface showing grace and care from the person or people that finished this\
room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31759, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31757, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31755, 
            }, 
         }, 
         Name = "Brain Jar Room", 
         Vnum = 31756, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31757] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [0] = "Dark", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "All around you there are brains in jars. As you walk by they start screaming.\
As they scream the lights on the jars change color indicating that they are\
not calm at all. In front of you there is a row of containing shelves with\
jars gently placed on them.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31758, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31756, 
            }, 
         }, 
         Name = "Brain Room", 
         Vnum = 31757, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31758] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [0] = "Dark", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "You are walking down a row. To your sides shelves are filled with brains from\
all species of the galaxy. These jars seem to be a bit calmer for their lights\
are not flaring off when you pass by them. this shows they are mature and\
prepared to be put into a body of some sort, most likely a spiderwalker.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31757, 
            }, 
         }, 
         Name = "Brain Compartment", 
         Vnum = 31758, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31759] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [0] = "Dark", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "You are standing in a row with shelves in it. On each shelf jars have been\
placed carefully to ensure that they are safe and will not fall to the ground\
and break. The air is crisp and provides stability as you stare longly at the\
large amounts of jars.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31756, 
            }, 
         }, 
         Name = "Row Of Jars", 
         Vnum = 31759, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31760] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "You are standing in small room which was initially designed to home a person.\
It has a window facing the sun.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31755, 
            }, 
         }, 
         Name = "Old Room", 
         Vnum = 31760, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31761] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "You are standing in room. It has dust all over it for it has not been used\
for many, many years.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31755, 
            }, 
         }, 
         Name = "Dusty Old Room", 
         Vnum = 31761, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31762] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "This is a larger room. It was probably designed to hold a larger species.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31754, 
            }, 
         }, 
         Name = "Large Guest Room", 
         Vnum = 31762, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31763] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "The room you are standing in is very small room. It has a window in the\
corner and an old bedframe in the corner which seems to have been destroyed by\
small rodents.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31754, 
            }, 
         }, 
         Name = "Old Small Calibered Room", 
         Vnum = 31763, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31764] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "You are standing in an extremely small room that was designed to hold a\
cleaning droid or two.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31753, 
            }, 
         }, 
         Name = "Storage Compartment For Droids", 
         Vnum = 31764, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31765] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "You are in a large room. It was made for a larger type species. It is used to\
house and for sleeping. This room has a very disgusting odour.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31753, 
            }, 
         }, 
         Name = "Large Specimen Room", 
         Vnum = 31765, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31766] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "You are standing in a small room with a window facing the great sand dune\
sea.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31752, 
            }, 
         }, 
         Name = "Small Unused Room", 
         Vnum = 31766, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31767] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "You are standing in a room which seems to be habitated. There is a small bed\
in the corner with a window mounted on the wall which looks outside.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31752, 
            }, 
         }, 
         Name = "Habitated Room", 
         Vnum = 31767, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31768] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "You are in a room of small caliber. You feel enclosed as you look around the\
room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31751, 
            }, 
         }, 
         Name = "Small Enclosed Room", 
         Vnum = 31768, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31769] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "You are standing in a bedroom. It is not habitated but could be.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31751, 
            }, 
         }, 
         Name = "Unhabitated Room", 
         Vnum = 31769, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31770] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "You walk down a long narrow hallway which floor is covered with stone and\
provides discomfort for your feet. To each side you can see some small and\
large rooms all with different uses. There is a glowpanel above your head\
barely functioning providing the dimmest of light all over.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31750, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31771, 
            }, 
         }, 
         Name = "Long Hallway", 
         Vnum = 31770, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31771] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "The hallway you walk down is on an uneven\
surface, it has ripples all along it and provides not much for heat or for\
comfort. There is no lighting here but you can still see down the gloomy\
hallway but not always with ease.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31770, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31772, 
            }, 
         }, 
         Name = "A Hallway Passage", 
         Vnum = 31771, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31772] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "As you walk down the hallway on a cool stone floor you smell an odour, a\
rather unpleasant one, but having been in this palace it is no surprise that\
this smell is located here. The hallway is gloomy and the floor has a rough\
texture as if never smoothed out.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31782, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31771, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31784, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31773, 
            }, 
         }, 
         Name = "Dense Hallway", 
         Vnum = 31772, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31773] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "The ground beneath your feet is made of pure stone, rather cold at night and\
still cool in the day the stone is what covers all the palace floors. You can\
see the end of the hallway just ahead of yourself. Large and without any\
features. Just a simple stone wall.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31780, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31772, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31781, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31774, 
            }, 
         }, 
         Name = "Long Narrowed Hallway", 
         Vnum = 31773, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31774] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "The hallway you walk down is covered in stone, cold on your feet as you walk\
over it for it does not preserve heat well. A glowpanel above is burnt out\
and every once in a while a small burst of electricity comes rippling through\
the end of the cables. The air here is dense but not filled with a stench, a\
rather unusual thing for this palace. To both sides there are rooms of\
different caliber. There is a great stone wall stopping the end of the hall\
just ahead.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31778, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31773, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31779, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31775, 
            }, 
         }, 
         Name = "Hallway Leading To Individual Rooms", 
         Vnum = 31774, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31775] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "You are standing at the end of the hallway. There is a very large stone wall\
before you covering your way further down the hallway. The stone wall is\
thick and rough with different textures all over its surface.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31776, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31774, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31777, 
            }, 
         }, 
         Name = "End Of A Long Hallway", 
         Vnum = 31775, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31776] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "You are standing in room of very small caliber. It was probably constructed to\
hold extra blankets. There are closets all along the walls.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31775, 
            }, 
         }, 
         Name = "Extra Small Compartment Room", 
         Vnum = 31776, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31777] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "You are in a large room. It was probably used as a sleeping quarter. There is\
a small bed in the corner which has been chewed away at by a small rodent.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31775, 
            }, 
         }, 
         Name = "Large Old Room", 
         Vnum = 31777, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31778] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "You are in a well sized room. It was used as a living quarters in the past.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31774, 
            }, 
         }, 
         Name = "Well Sized Room", 
         Vnum = 31778, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31779] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "You are standing in a living quarters. It is currently habitated. You can\
tell because of food on the floor.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31774, 
            }, 
         }, 
         Name = "Habitated Living Quarters", 
         Vnum = 31779, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31780] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "You are standing in a small room used to store extra supplies.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31773, 
            }, 
         }, 
         Name = "Supply Storage", 
         Vnum = 31780, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31781] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "You are in a very large room. It was made as a living quaters. There is a\
large window in front of you.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31773, 
            }, 
         }, 
         Name = "Large Living Quarters", 
         Vnum = 31781, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31782] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "You are in a smaller room. It can be used for any purpose.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31772, 
            }, 
         }, 
         Name = "Small Room", 
         Vnum = 31782, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31784] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "You are standing in a large room. There is a bed that can hold any species\
and a large window on the back wall.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31772, 
            }, 
         }, 
         Name = "Large Room", 
         Vnum = 31784, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31788] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "You are standing at the top of a staircase. In front of you there is a long\
hallway. Along the hallway many prison cells are there because Jabba use them\
for keeping people of unimportance.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31789, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "down", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31750, 
            }, 
         }, 
         Name = "Top Of Staircase", 
         Vnum = 31788, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31789] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "You are walking down the hallway. As you walk along you notice that all of\
the doors have been removed.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31788, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31790, 
            }, 
         }, 
         Name = "Prison Hallway", 
         Vnum = 31789, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31790] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "You are in the hallway. It ends just up ahead making it a rather short\
corridor.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31789, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31794, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31791, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31795, 
            }, 
         }, 
         Name = "Prison Hallway", 
         Vnum = 31790, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31791] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "You have come to the end of the hall. A stone wall lays in front of you,\
preventing you from advancing.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31790, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31792, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31793, 
            }, 
         }, 
         Name = "Prison Hallway End", 
         Vnum = 31791, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31792] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "You are standing in a prison cell. If you turn back there are metal bars\
across the wall. All around you the only furniture in this cell is a prison\
bed.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31791, 
            }, 
         }, 
         Name = "Small Prison Cell", 
         Vnum = 31792, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31793] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "You are standing in a large prison cell. This cell was used for larger\
specimens. It has a toilet and a small bunk in the corner.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31791, 
            }, 
         }, 
         Name = "Large Prison Cell", 
         Vnum = 31793, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31794] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "You are standing in the smallest cell. This cell was used to hold very small\
specimens of life.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31790, 
            }, 
         }, 
         Name = "Extremely Small Cell", 
         Vnum = 31794, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31795] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "You are standing in a very large prison cell. It scares you to think what was\
kept in here. There is an awful smell.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31790, 
            }, 
         }, 
         Name = "Very Large Prison Cell", 
         Vnum = 31795, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31796] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleDelay = 0, 
         Description = "You just fell down the trapdoor into the rancor's pit. Here there is a very\
disgusting smell. This room is immense. To the north is the smaller\
compartment the rancor was kept in while his cage was cleaned.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
         }, 
         Name = "Rancor's Pit", 
         Vnum = 31796, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31797] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleDelay = 0, 
         Description = "You get crushed by gate and die(d.t)\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
         }, 
         Name = "DT", 
         Vnum = 31797, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31798] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "You just slid down the chute into the rancor's cage. The room is an immense\
room and has a very foul odour to it. To the north the smaller room lays which\
the rancor was put when the cage was cleaned.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31799, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "up", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31733, 
            }, 
         }, 
         Name = "Rancor's Cage", 
         Vnum = 31798, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31799] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "EDIT\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31798, 
            }, 
         }, 
         Name = "DT", 
         Vnum = 31799, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31800] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "You are standing in front of hallway which leads down into the rancor pit. To\
the south is the kitchen. To continue down the hall go east.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31733, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31802, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31801, 
            }, 
         }, 
         Name = "Hallway to Rancor Pit", 
         Vnum = 31800, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31801] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "You are standing inside the kitchen that is used to make Jabba the Hutt's\
disgusting foods. There is a table in the center of the room with a cutting\
board and extra utensils. On the wall there are many shelves and utensils\
layed everywhere.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31800, 
            }, 
         }, 
         Name = "Jabba's Palace's Kitchen", 
         Vnum = 31801, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31802] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "You are walking down a hall which passes the docking bay and many living\
quarters.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31803, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31800, 
            }, 
         }, 
         Name = "Hallway Past Docking Bay", 
         Vnum = 31802, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31803] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "You are standing in front of one of many rooms located on the bottom level.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31802, 
            }, 
         }, 
         Name = "Hallway Past A Room", 
         Vnum = 31803, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31804] = 
      {
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleDelay = 0, 
         Description = "You are standing on a rather small sized landing pad. It can be used to keep\
smaller sized vehicles of any origin.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
         }, 
         Name = "Landing Pad 6", 
         Vnum = 31804, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31805] = 
      {
         Sector = "mountain", 
         TeleVnum = 0, 
         Name = "Rocky Cliff", 
         Description = "You are standing at the top of a high cliff. As you look downwards it is not a\
far drop but what scares you is that you would land on sharp jagged stones of\
all shapes and sizes. As you look the other way there is a steep cliff. If you\
can climb it go ahead.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31589, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "up", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31806, 
            }, 
         }, 
         Vnum = 31805, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31806] = 
      {
         Sector = "mountain", 
         TeleVnum = 0, 
         Name = "Krayt Nest", 
         Description = "You are standing in the middle of a Krayt Dragon's nest. It does not smell\
particularly good. A large female krayt towers over you here wondering what\
you are doing.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "down", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31805, 
            }, 
         }, 
         Vnum = 31806, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31807] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "All around you is sand and shiny dunes piling as high as you can see. As far\
as you can guess anything could be behind there. The towering sand dunes make\
you feel scared as you are so small and enclosed by the towering heaps of\
sand.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31501, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31808, 
            }, 
         }, 
         Vnum = 31807, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31808] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Deserty Path", 
         Description = "You are walking along the hot sand heated by the twin suns of Tatooine. The\
ground beneath you is hardening gradually as you walk over it or is it just\
your imagination?\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31809, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31807, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31812, 
            }, 
         }, 
         Vnum = 31808, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31809] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Hard Sandy Area", 
         Description = "You walk along a large area covered with sand. This sand seems to have\
hardened gradually over the years and is now almost of the consistency of\
sandstone. To the west the sand slopes downward in many directions. \
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31814, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31808, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31810, 
            }, 
         }, 
         Vnum = 31809, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31810] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Sandy Surface", 
         Description = "You are standing on top of very hard sand, yet maybe even rock covered with\
sand. As you look westwards you see the dune sea stop abruptly and plummet\
downwards. I wonder why.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31809, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31811, 
            }, 
         }, 
         Vnum = 31810, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31811] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Overseeing A Small Colony.", 
         Description = "You are standing on the edge of a very steep drop that falls directly into the\
heart of what looks to be a colony of some sorts. You would not want to fall\
down this cliff for it is a ways down.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31810, 
            }, 
         }, 
         Vnum = 31811, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31812] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Flat Area", 
         Description = "You are walking on one of the only things on this planet. Sand. It is nice and\
soft but some patches of hardened sand can bee seen all around.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31808, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31813, 
            }, 
         }, 
         Vnum = 31812, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31813] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You look about, look from the direction you came, nothing, nothing at all but\
sand. You wonder how much of this stuff could there possibly be?\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31812, 
            }, 
         }, 
         Vnum = 31813, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31814] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Unstable Ground", 
         Description = "As the ground beaneath your feet is in a transition from sand to rock\
it seems to be versatile and flakes away in some areas with every\
step that you take on it. Northward you see all the sand is no longer\
there but it is totally a rock surface.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31815, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31809, 
            }, 
         }, 
         Vnum = 31814, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31815] = 
      {
         Sector = "mountain", 
         TeleVnum = 0, 
         Name = "Rocky Area", 
         Description = "The texture beneath your feet is no longer primarily sand but totally\
rock. The rock continues for twenty or thirty feet ahead of you but\
then stops abruptly and becomes sand once again. Downwards a cliff\
slopes downwards. This side is still very steep but you can perceive\
that it is very possible to go up and down of it.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31814, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "down", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31816, 
            }, 
         }, 
         Vnum = 31815, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31816] = 
      {
         Sector = "mountain", 
         TeleVnum = 0, 
         Name = "Side Of Steep Path", 
         Description = "You are on a pathway facing a severe angle which makes it so that\
there is not much room to move around without falling downwards\
towards flat ground. To the east there is a small cave in the side of\
a cliff. If you continue downwards you will be entering the city.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31817, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "up", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31815, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "down", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31818, 
            }, 
         }, 
         Vnum = 31816, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31817] = 
      {
         Sector = "mountain", 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "You are standing in a dimly lit room. There is an aged Jawa shopkeeper\
sitting in the corner behind a table selling items you may need to\
explore this vast land filled with opportunities and predators. In\
this small cave it is darker which makes the temperature drop\
drastically and therefore makes this place a good one to stay in for\
long periods of time especially when both suns are up, sending rays of\
heat onto you. \
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31816, 
            }, 
         }, 
         Name = "Water Shack", 
         Vnum = 31817, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31818] = 
      {
         Sector = "mountain", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleDelay = 0, 
         Description = "You are standing on the same level most of this city is based on. All\
around tere are small shops and tents set up quickly used for\
merchandising goods to any passers.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31819, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31870, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "up", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31816, 
            }, 
         }, 
         Name = "Entering The City", 
         Vnum = 31818, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31819] = 
      {
         Sector = "mountain", 
         TeleVnum = 0, 
         Name = "Path In The City", 
         Description = "You are walking down a wide path in the middle of this small city\
seemingly belonging to the Jawas. It has been used frequently and\
you can tell this for the rock is shaved away by weight and the path\
is full of marks. Straight ahead also there is a huge fortress of\
some sorts. It is simply constructed and seems old, but that is\
probably because of the wind and the scorching suns of Tatooine. \
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31818, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31849, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31820, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31851, 
            }, 
         }, 
         Vnum = 31819, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31820] = 
      {
         Sector = "mountain", 
         TeleVnum = 0, 
         Name = "Dusty Path", 
         Description = "You walk along a wide dusty path between two of the most popular\
places in this small veritable city. All around Jawas and small\
creatures of likes you do not want to be aquainted with. As you\
continue down this path you recognize many things and see the\
fortress growing with every step you take, seemingly growing to an \
endless extent. Although it is rather large it seems to be of simple\
construction and not very complicated.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31819, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31821, 
            }, 
         }, 
         Vnum = 31820, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31821] = 
      {
         Sector = "mountain", 
         TeleVnum = 0, 
         Name = "Path", 
         Description = "You walk along a wide path seemingly wider than you think because of\
the reflection and glare of the two twin suns of Tatooine. In front\
of you the Jawa fortress stands immensely with not much architectural\
design to it. You can continue down this road towards the fortress or\
turn off into one of the side streets leading to who knows where.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31820, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31822, 
            }, 
         }, 
         Vnum = 31821, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31822] = 
      {
         Sector = "mountain", 
         TeleVnum = 0, 
         Name = "Directly In Front Of The Jawa Fortress", 
         Description = "You are standing directly in front of the Jawa Fortress. It seems rather\
large from this viewpoint but is limited to levels and interior space\
due to its design. there are some small designs on the fortress but\
they seem to not have been part of the original plans of the fortress\
but added in by certain individuals. \
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31821, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31823, 
            }, 
         }, 
         Vnum = 31822, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31823] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "You are standing in a very large room. It was built plainly and simply\
and there are no signs of art even from their own culture in this\
room. There are some narrow corridors in many directions leading to\
different parts of the fortress.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31822, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31827, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31824, 
            }, 
         }, 
         Name = "Entrance To Jawa Fortress", 
         Vnum = 31823, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31824] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "You are walking down a small narrow hallway that is not very well\
lit. The few glowpanels that are left on the ceiling are either\
inoperative or malfunctioning. Further down the hallway, the hallway\
come to an abrupt stop and turn off. The ground you walk on is rough\
but the lack of sunlight keeps its moisture and color well. \
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31823, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31825, 
            }, 
         }, 
         Name = "A Narrow Hallway", 
         Vnum = 31824, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31825] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "You are standing on a colder harder surface than in the hot desert. It\
is like this because of the lack of sunlight in this enormous\
fortress. The glow panels above flicker as if running out of energy.\
Directly in front of you the hallway splits off with a sharp turn\
towards the south. \
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31824, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31829, 
            }, 
         }, 
         Name = "Hallway", 
         Vnum = 31825, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31827] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "You walk along in a large room. The ground beneath your feet is rocky\
and yet sandy at the same time making your feet feel better for the\
ground is not as rough as straight rock. There is no lighting in this\
room but you can still make your way around. The air is cool and crisp\
making it a little easier to breathe. \
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31828, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31823, 
            }, 
         }, 
         Name = "A Large Room", 
         Vnum = 31827, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31828] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "You are standing in room #31828.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31827, 
            }, 
         }, 
         Name = "A room", 
         Vnum = 31828, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31829] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "You are standing in an enormous room. There are small bags, matresses\
and all sorts of small things all over the room layed about. There\
are a few Jawas young and old roaming these hallways. This here room\
is used for more of a storage place and not for eating.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31825, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31832, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31830, 
            }, 
         }, 
         Name = "Large Room", 
         Vnum = 31829, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31830] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
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
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31829, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "down", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31831, 
            }, 
            [3] = 
            {
               Keyword = "bed", 
               Key = -1, 
               Direction = "somewhere", 
               Flags = 
               {
                  [17] = "CanEnter", 
                  [11] = "Hidden", 
               }, 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31876, 
            }, 
         }, 
         Name = "Quarters", 
         Vnum = 31830, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31831] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "You are standing in what seems to be an area where extra things and stolen\
goods are kept. In the corners there are baskets full of wires and old\
goods that are probably useless to the everyday person. There is a jawa\
guard half asleep here watching over the items. This room does not seem to\
have been dug out yet was put here by nature.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "up", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31830, 
            }, 
         }, 
         Name = "Small Room", 
         Vnum = 31831, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31832] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "You are standing in a simple room. Designed and built with ease this room\
posed no problem to the people that built it. It is extremely dark in here and\
not much is visible to the plain eye. The ground is cold and stiff and makes\
your feet feel cold as you walk over it.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31833, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31829, 
            }, 
         }, 
         Name = "Entrance", 
         Vnum = 31832, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31833] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "You are at an intersection. You may go either east or west and explore this\
vast place. In both directions the small corridors lighten up further down.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31832, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31839, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31834, 
            }, 
         }, 
         Name = "Intersection", 
         Vnum = 31833, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31834] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "You are standing in a think gloomy hallway. Towards the south you can hear\
the sounds of discussion and occasional laughter. The ground is cool and soft\
for it is not dried by the everydays suns of Tatooine. The hallway is a gloomy\
place and makes you think twice before you do anything.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31833, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31835, 
            }, 
         }, 
         Name = "Hallway", 
         Vnum = 31834, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31835] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "You reach the end of the small and tight gloomy hallway and see a few\
guardians discussing near a heavily guarded door leading into a large room\
with someone, or something, important inside of it.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31834, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31836, 
            }, 
         }, 
         Name = "End Of Hallway", 
         Vnum = 31835, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31836] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "You are standing in the beginning of the large room filled with\
guardians. Just ahead they talk to each other silently trying not to\
disturb anyone. The ground is more of a sand color and is quite soft\
and hot. Upwards there is an oppening in the roof letting sunlight in\
and momentarily blinding you.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31837, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31835, 
            }, 
         }, 
         Name = "Opening", 
         Vnum = 31836, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31837] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "You stand before the heavily guarded entrance into the Wise Mans\
chambers. the two guardians stand up watching you closely so that you\
cause no harm to their master. The room has a large crack in the\
ceiling and it is rather hot in here. The way you see it staying in this\
fortress is not a bad idea. \
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
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
               Distance = 1, 
               Description = "", 
               DestinationVnum = 31838, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31836, 
            }, 
         }, 
         Name = "Entrance", 
         Vnum = 31837, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31838] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "You are standing in the chambers of the Wise Jawa of these parts. The\
walls are poorly decorated and any signs of extra materials does not\
exist. Maybe you should try to understand him before coming to any\
conclusions for he may able to help you, or to teach you something of\
use. \
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31837, 
            }, 
         }, 
         Name = "Chambers", 
         Vnum = 31838, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31839] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "You are standing in a hallway leading to a stone wall. At the end of the hall\
the hallway itself curves toward the south leaving only two way to go, south\
and back from where you came.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31833, 
            }, 
         }, 
         Name = "Hallway", 
         Vnum = 31839, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31840] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Name = "Neighberhood Junk Pile", 
         Description = "You are standing on a large pile of junk. People throw things they dont need\
here just to get rid of it. But for some people this place is where they can\
get everything they need to start out. Everything from scrap metal to blasters\
are here waiting for anyone to pick them up.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31653, 
            }, 
         }, 
         Vnum = 31840, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31841] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Name = "Entrance To Docking Bay 94", 
         Description = "You are standing in front of the infamous Dockingbay 94. From here Han Solo\
and the Millenium Falcon escaped with their newly acquired passengers for a\
trip to Alderaan. There is a large entrance into the docking bay. All the\
ground beneath you is made of stone and sand. The air is warm yet lighter\
here for it is sheltered by the docking bay.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31872, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31842, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31605, 
            }, 
         }, 
         Vnum = 31841, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31842] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Name = "Inside The Entrance To Docking Bay 92", 
         Description = "You are standing in front of a large sliding door. When opened you can enter\
the docking bay with ease and embark on a ship to go to other places in the\
galaxy. The door is made of metal and has blaster scorching all over it from\
when the imperials chased Han Solo and Chewbacca in a race to capture the\
droid R2-D2 and return him to Darth Vader. The ground is hard and covered with\
sand as most of this planet is and the air is rather refreshing.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31841, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31843, 
            }, 
         }, 
         Vnum = 31842, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31843] = 
      {
         Sector = "city", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "You are standing inside a large room that can contain a few smaller sized\
ships or one large ship like the Millenium Falcon. The ground here is covered\
with sand, but there are patches where you can see the stone floor beneath.\
The air in here is cool and refreshing and gives you a warm sensation. There\
are ships comming and leaving here continually and make it so that the air\
smells of fumes and exhaust.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31842, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31847, 
            }, 
         }, 
         Name = "Inside Docking Bay 92", 
         Vnum = 31843, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31846] = 
      {
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleDelay = 0, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
         }, 
         Name = "Floating in a void", 
         Vnum = 31846, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31847] = 
      {
         Sector = "city", 
         Flags = 
         {
            [4] = "CanLand", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "All around you there is only one thing. A large room stands here waiting to\
be filled with crafts and vessels. The air is crisp and cool unlike\
outside in the sun, but smells of ships. On the walls there are blaster\
bolts. Extra tools lay on the ground for a mechanic that walks around\
here.   \
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31843, 
            }, 
         }, 
         Name = "Docking Bay 92", 
         Vnum = 31847, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31849] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "You are standing inside a small store. Here Hundo the owner will\
gladly sell you clothing or possibly custom make some for you if the\
price is right. There is a small workstation in the corner and a\
entry to a room near the back of the store. The store is pretty run\
down but serves it's purpose.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31850, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31819, 
            }, 
         }, 
         Name = "Hundo's Shop", 
         Vnum = 31849, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31850] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "There are some small crates scattered along the floor. Most of them are empty\
but some seem to be filled with cloth and useless items. This room is very\
dirty and has a rather disturbing smell to it. The ground is smooth and cold\
being made of stone. The air is fresher in here than most parts of this city\
and it makes you want to stay here.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31849, 
            }, 
         }, 
         Name = "Back Of The Shop", 
         Vnum = 31850, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31851] = 
      {
         Sector = "mountain", 
         TeleVnum = 0, 
         Name = "In Front Of A Large Keeping Area", 
         Description = "You are standing in front of some large fences. Inside these fences are kept\
many rontos, the animal that Jawas ride to go to different areas. There is a\
rather tall Jawa at the gate entry with an ionization gun ready to shoot any\
thieves or trespassers.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31819, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31852, 
            }, 
         }, 
         Vnum = 31851, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31852] = 
      {
         Sector = "mountain", 
         TeleVnum = 0, 
         Name = "Ronto Keeping Area", 
         Description = "You are standing inside a large pen sourrounded by gates that are filled with\
rontos. These rontos have been trained to a certain degree so it is not\
likely that they will try to escape. The ground is rough and is filled with\
cracks for the weight of these beasts is quite surprising. The sun shines down\
all day long and makes it warm here but the rontos have adjusted to the\
temperature.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31851, 
            }, 
         }, 
         Vnum = 31852, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31853] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "You are standing in the entrance to the well known cantina. Here some of the\
filthiest and richest scum hang around. Watch your step. Mounted on the wall is\
a droid detector. For here in this cantina they do not serve their kind.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31655, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31854, 
            }, 
         }, 
         Name = "Entrance To The Cantina.", 
         Vnum = 31853, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31854] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "You are facing the bar slowly. With small booths all around filled with\
people talking. Wuher slowly pours drinks for his customers being careful not\
to get hurt. The floor is poorly covered and the walls filled with blaster\
marks and other such things from fights and encounters.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31853, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31855, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31856, 
            }, 
         }, 
         Name = "Interior Of The Cantina", 
         Vnum = 31854, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31855] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "Most of this section is rather empty for it leads the entrance into the\
cantina. For the other part there is a few tables with some stools and chairs\
but for the most part they are empty as for people seem to have adopted a\
liking towards the booths.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31858, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31859, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31854, 
            }, 
         }, 
         Name = "Large Open Way", 
         Vnum = 31855, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31856] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "You stand in awe as many horrible characters walk around. Some you\
recognize and some you do not. There are small tables filled with\
people all along this large area of the Cantina. The air is full of\
smoke from hookas being used all along. There is some broke glass on\
the floor. As you walk over it it cracks and makes you shiver.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31854, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31861, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31857, 
            }, 
         }, 
         Name = "A Large Section Of The Cantina", 
         Vnum = 31856, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31857] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "You are standing inside a small booth. Here a table is mounted in the middle\
with all sorts of seats and chairs aligned around. The table is beat up with\
holes all over it, vandalized over and over. This booth has less lighting in\
it for the glow panel has shorted out and makes it relaxing with the change in\
temperature from the outdoors.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31856, 
            }, 
         }, 
         Name = "A Small Booth", 
         Vnum = 31857, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31858] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "There are two small booths attached together here making one large booth.\
This booth is a very well known booth for here Han Solo fried Greedo the\
bounty hunter. There is a large table in the middle of the booth. The seats\
are dirty and the table even more so. There is a hookah on the table but it\
seems to be stuck to it.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31855, 
            }, 
         }, 
         Name = "A Large Double Booth", 
         Vnum = 31858, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31859] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "This room is located on the far side of the cantina, beside one of the\
small corner booths towards the west. The floor is dirty, filled with blood in\
some places from a recent fight. The air is full of smoke as people walk\
around you, some smoking hookahs.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31855, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31860, 
            }, 
         }, 
         Name = "A Section Of The Cantina", 
         Vnum = 31859, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31860] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "This booth is one of very small size. There is a small table in the\
middle with 2 stools set down around it. The stools are in rather\
good shape but the table is in horrible condition. The ground is\
cracked and makes you feel you will fall through the floor. The air\
is dirty and heavy here and makes you want to leave.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31859, 
            }, 
         }, 
         Name = "A Very Small Booth", 
         Vnum = 31860, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31861] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "You are standing in an open area filled with tables. To the east the bar\
stands. Chairs all around filled with different people and different species.\
The chairs themselves are rather dirty and so most people stand. The smell\
here is not too bad but not a beautiful one neither.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31856, 
            }, 
            [2] = 
            {
               Keyword = "Counter", 
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
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31863, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31862, 
            }, 
         }, 
         Name = "Section Of The Cantina", 
         Vnum = 31861, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31862] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "You are standing in a rather large both in the furthest corner of the\
cantina. The table here is very used yet in good shape compared to the others.\
The chairs on the other hand are worn down to the nub. The air here is less\
filthy for many people whom do not want to be bothered by the smoke sit\
here.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31861, 
            }, 
         }, 
         Name = "A Corner Booth", 
         Vnum = 31862, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31863] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "You are standing in front of Wuher, the man who serves drinks to people here.\
The beverage machine is very large and complex but seems to be efficient in\
the way it works. AS he sees you he gets angry. Maybe you should run.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "counter", 
               Key = -1, 
               Direction = "west", 
               Flags = 
               {
                  [0] = "IsDoor", 
                  [5] = "PickProof", 
               }, 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31861, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "up", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31618, 
            }, 
         }, 
         Name = "Inside The Bar", 
         Vnum = 31863, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31870] = 
      {
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "You are inside a large cave. It has two parts to it. It is rather dark\
making the air cool. The cave protects you from the sand being\
blown by the winds. Inside this cave many womp rats seek shelter for\
the only other places are inside the city of Mos Eisley where they\
will most likely be prosecuted. The ground is hard and has little to\
no sand on it. This place is sure a break to the outdoors.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31818, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31871, 
            }, 
         }, 
         Name = "Inside A Large Cave", 
         Vnum = 31870, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31871] = 
      {
         Sector = "city", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "You are in the back portion of a large cave planted into the side of\
the cliff. The air here is very cool and relaxing giving you the\
sensation of being relaxed. The ground is hard and made entirely of\
rock, without a trace of sand this cave is rather clean besides the\
womp rat mess. There is a particular smell in here from the mess but\
nothing to be concerned about if you do not stay in this cave for an\
extended period of time.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31870, 
            }, 
         }, 
         Name = "In The Back Of A Cave", 
         Vnum = 31871, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31872] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Name = "The Bus Stop", 
         Description = "You are standing on a platform where the public busses land every so\
often. You can access different planets using these busses. Although\
the busses are slow they are a means of transportation. The only\
reason they are slow is because they are provided to the public for\
free. Thinking about this it makes it hard to maintain the busses\
without enough resources.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31841, 
            }, 
         }, 
         Vnum = 31872, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31873] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
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
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31875, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31881, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31882, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31655, 
            }, 
         }, 
         Vnum = 31873, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31874] = 
      {
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleDelay = 0, 
         Description = "You are walking down an unused side street. The street is mostly shady\
because the buildings to the sides cover the sunlight from the\
street. The ground is softer and less dense and compact, but when the\
wind blows it hurts more for the grains of sand hit you in larger\
numbers making you ache all over. The air is hot, not as hot as the\
rest of the city because the street is covered in shade, but it is\
still hot. The air is also lighter and makes you relax as you walk.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31655, 
            }, 
         }, 
         Name = "Walking Down A Side Street", 
         Vnum = 31874, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31875] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
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
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31873, 
            }, 
         }, 
         Vnum = 31875, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31876] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
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
               Code = "feel cure $n\
emote Vapors slowly seep into your body helping you relax.\
", 
               Arguments = "100", 
               MudProgType = "rand_prog", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "somewhere", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [11] = "Hidden", 
               }, 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31830, 
            }, 
         }, 
         Vnum = 31876, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31878] = 
      {
         Sector = "desert", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleDelay = 0, 
         Description = "You are walking along the bottom of the cliff. High above you see the edge\
of the cliff and you think about how much it would hurt to fall from\
there. The sand here is much harder than normal as for the wind does not\
get at it very well because the cliff covers the sand from being swept\
away by the gusting winds. The sun is also not so intense here but it is\
still very warm and just as dry as the rest of the planet.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31601, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31879, 
            }, 
         }, 
         Name = "Along The Bottom Of The Cliff", 
         Vnum = 31878, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31879] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Nearing The Curve In The Cliff", 
         Description = "You are walking along the bottom of the cliff. High above you see the edge\
of the cliff and you think about how much it would hurt to fall from\
there. The sand here is much harder than normal as for the wind does not\
get at it very well because the cliff covers the sand from being swept\
away by the gusting winds. The sun is also not so intense here but it is\
still very warm and just as dry as the rest of the planet.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31878, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31880, 
            }, 
         }, 
         Vnum = 31879, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31880] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "On The Curve Of The Cliff", 
         Description = "You are walking along the bottom of the cliff. High above you see the edge\
of the cliff and you think about how much it would hurt to fall from\
there. As you think of that you notice some blood splatter on the sand.\
Then you look up to see a large chunk of the cliff missing as if someone\
had fell from there taking a large portion of the side of the cliff with\
them. \
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31879, 
            }, 
         }, 
         Vnum = 31880, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31881] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Name = "On A Path In The City", 
         Description = "You walk along a path inside the well known city of Mos Eisley. The ground\
here is hard yet made fully of sand. As you walk over it, it is hot and\
sharp. The wind blows in your face, sometimes bringing particles of sand\
into your face stinging you and sometimes getting into your eyes. The air\
is very warm, heated by the twin suns of the planet. The heat makes the\
air heavier and harder to breath yet you move on. To the north you can see\
a scattering of buildings.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 6600, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31873, 
            }, 
         }, 
         Vnum = 31881, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31882] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Name = "In The Depths Of The City", 
         Description = "You walk along a path inside the well known city of Mos Eisley. The ground\
here is hard yet made fully of sand. As you walk over it it is hot and sharp.\
The wind blows in your face, sometimes bringing particles of sand into your\
face stinging you and sometimes getting into your eyes. The air is very warm,\
heated by the twin suns of the planet. The heat makes the air heavier and\
harder to breath yet you move on. To the west you see smoke coming from\
freshly cooked meat and food. \
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31873, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31883, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 1, 
               Description = "", 
               DestinationVnum = 31624, 
            }, 
         }, 
         Vnum = 31882, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31883] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Name = "Gep's Grill", 
         Description = "You are standing in front of an old man. Here he makes his own food to sell\
to people passing by. He has a large selection, everything from\
banthaburgers to dewbak ribs depending on how carnivorous your appetite\
is. His booth is made of old junk probably scavenged or bought from the\
Jawas. His cooking supplies are rather disgusting to look at and when you\
think of what you are eating from it makes your stomach churn.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31882, 
            }, 
         }, 
         Vnum = 31883, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31898] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "northeast", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 106, 
            }, 
         }, 
         Name = "An Empty Home", 
         Vnum = 31898, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31899] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "This passage looks somewhat cleaner than the reset of the sewer, suggesting\
that someone maintains it. There's no sewage flowing here, rather the ground\
is quite dry.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31904, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31900, 
            }, 
         }, 
         Name = "A Hidden Passage In The Sewers", 
         Vnum = 31899, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31900] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "This circular area seems to be a simple common room, complete with cheap\
furniture and some faded posters on the walls.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31899, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31901, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31902, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 1, 
               Description = "", 
               DestinationVnum = 31909, 
            }, 
         }, 
         Name = "Common Room", 
         Vnum = 31900, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31901] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "The kitchen bench is full of unwashed plates, glasses and cutlery. Above the\
bench are a few cupboards. Despite the mess on the bench, the place smells\
clean.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31900, 
            }, 
         }, 
         Name = "Kitchen", 
         Vnum = 31901, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31902] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "The hallway has light gray walls with some lamps hanging on them. Doors\
lead to other rooms in the small complex.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31900, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31903, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31905, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31906, 
            }, 
         }, 
         Name = "Hallway", 
         Vnum = 31902, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31903] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "There are a few cheap beds scattered around this dimly lit room. Otherwise\
it's quite empty.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31902, 
            }, 
         }, 
         Name = "Sleeping Quarters", 
         Vnum = 31903, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31904] = 
      {
         Sector = "underground", 
         TeleVnum = 0, 
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
               Code = "if isjedi($n)\
    if level($n) < 25\
        mpechoat $n You sense that the south wall is a hologram.\
    endif\
endif\
", 
               Arguments = "100", 
               MudProgType = "entry_prog", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 1, 
               Description = "", 
               DestinationVnum = 31907, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Flags = 
               {
                  [11] = "Hidden", 
               }, 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31899, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "southwest", 
               Distance = 1, 
               Description = "", 
               DestinationVnum = 31505, 
            }, 
         }, 
         Vnum = 31904, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31905] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "In theory this is where Zim would meditate and attune himself to the Force.\
But in reality it's where he drinks all day, feeling sorry for himself.\
There's a smell of alcohol in the air.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31902, 
            }, 
         }, 
         Name = "Zim's Meditation Chamber", 
         Vnum = 31905, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31906] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [16] = "Silence", 
            [26] = "Factory", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "This rooms contains all facilities you need to craft just about anything.\
It's very cluttered. A few broken items that someone failed to assemble\
correctly have been tossed into a corner.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31902, 
            }, 
         }, 
         Name = "Workshop", 
         Vnum = 31906, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31907] = 
      {
         Sector = "underground", 
         TeleVnum = 0, 
         Name = "Mos Eisley Sewers", 
         Description = "This is the main entrance to the sewers. There is a river of sewage flowing\
through the tunnel, giving off a strong smell. Along one wall is a catwalk\
allowing one to walk through the sewers.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 1, 
               Description = "", 
               DestinationVnum = 31908, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 1, 
               Description = "", 
               DestinationVnum = 31904, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "up", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Distance = 1, 
               Description = "", 
               DestinationVnum = 31654, 
            }, 
         }, 
         Vnum = 31907, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31908] = 
      {
         Sector = "underground", 
         TeleVnum = 0, 
         Name = "A Tunnel In The Sewers", 
         Description = "#31904\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 1, 
               Description = "", 
               DestinationVnum = 31502, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 1, 
               Description = "", 
               DestinationVnum = 31907, 
            }, 
         }, 
         Vnum = 31908, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31909] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "The sparring area is a square room about 10x10 meters. Most of the floor is\
covered by a gray mat so that people won't land too hard when they fall.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 1, 
               Description = "", 
               DestinationVnum = 31900, 
            }, 
         }, 
         Name = "Sparring Area", 
         Vnum = 31909, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31997] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "This section is smelly and dirty. It's probably not cleaned very often.\
The noise from the engines at the back of the shuttle contributes to making\
it an uncomfortable trip.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 1, 
               Description = "", 
               DestinationVnum = 31999, 
            }, 
         }, 
         Name = "Economy Class Section", 
         Vnum = 31997, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31998] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "This section of the shuttle is clean, quiet and comfortable. In other words\
it's the opposite of what you usually meet on this planet.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Flags = 
               {
                  [1] = "Closed", 
               }, 
               Distance = 1, 
               Description = "", 
               DestinationVnum = 31999, 
            }, 
         }, 
         Name = "Business Class Section", 
         Vnum = 31998, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31999] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "The Tatooine Planetary Shuttle travels between major settlements on this\
backwater planet. The entrance area leads to the business class section in one\
direction, and the economy class section in the other. The business class\
section is behind a curtain so that the wealthier passengers won't have to\
look at the seedier elements in the back.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "curtain", 
               Key = -1, 
               Direction = "north", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Distance = 1, 
               Description = "", 
               DestinationVnum = 31998, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 1, 
               Description = "", 
               DestinationVnum = 31997, 
            }, 
         }, 
         Name = "Tatooine Planetary Shuttle Entrance", 
         Vnum = 31999, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31500] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "The dunes around you are normal as you walk over the endless amount of sand.\
The sea of rippling sand still surrounds you with overwhelming greatness. The\
sand has a reflective shine to it assisted by the sunrays of the heating suns.\
You feel enclosed because the dunes tower over you greatly.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31501, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31557, 
            }, 
         }, 
         Vnum = 31500, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31501] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You are walking along the soft sand in the desert of Tatooine. Just ahead of\
you you can see the dune sea developping. Behind you the small city diminishes\
into only a spot. With every step you take the city becomes smaller and\
smaller.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31507, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31500, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31807, 
            }, 
         }, 
         Vnum = 31501, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31502] = 
      {
         Sector = "underground", 
         TeleVnum = 0, 
         Name = "Tunnel Junction", 
         Description = "A junction breaks up the monotony of these tunnels. The river of sewage runs\
south, but to the north there seems to be a dry area.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 1, 
               Description = "", 
               DestinationVnum = 31503, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 1, 
               Description = "", 
               DestinationVnum = 31504, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 1, 
               Description = "", 
               DestinationVnum = 31908, 
            }, 
         }, 
         Vnum = 31502, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31503] = 
      {
         Sector = "underground", 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "This room is about 20x20 meters, and several meters high. It smells as bad\
as the rest of the sewers. In the middle of the room is a large piece of\
machinery enclosed in an old-fashioned wire fence.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
               }, 
               Distance = 1, 
               Description = "", 
               DestinationVnum = 31623, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 1, 
               Description = "", 
               DestinationVnum = 31502, 
            }, 
         }, 
         Name = "Pumping Station", 
         Vnum = 31503, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31504] = 
      {
         Sector = "underground", 
         TeleVnum = 0, 
         Name = "Endless Tunnels In The Sewers", 
         Description = "#31904\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 1, 
               Description = "", 
               DestinationVnum = 31502, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 1, 
               Description = "", 
               DestinationVnum = 31621, 
            }, 
         }, 
         Vnum = 31504, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31505] = 
      {
         Sector = "underground", 
         TeleVnum = 0, 
         Name = "A Deep Pool Of Sewage", 
         Description = "The tunnel widens into a room filled with sewage that gathers into a large\
pool. Just like the rest of the sewers, there's a rusty catwalk running along\
one wall where it's possible to walk through the area.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 1, 
               Description = "", 
               DestinationVnum = 31506, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "northeast", 
               Distance = 1, 
               Description = "", 
               DestinationVnum = 31904, 
            }, 
         }, 
         Vnum = 31505, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31506] = 
      {
         Sector = "underground", 
         TeleVnum = 0, 
         Name = "A Tunnel In The Sewers", 
         Description = "#31904\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 1, 
               Description = "", 
               DestinationVnum = 31505, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "southeast", 
               Distance = 1, 
               Description = "", 
               DestinationVnum = 31591, 
            }, 
         }, 
         Vnum = 31506, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31507] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You are standing on a hard sandy surface, there is nothing around you unless\
you turn back. In all directions you can see but sand. The dunes in the sea\
are enourmous and grow with every step that you take.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31509, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31508, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31501, 
            }, 
         }, 
         Vnum = 31507, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31508] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "All around you is sand and shiny dunes piling as high as you can see. As far\
as you can guess anything could be behind there. The towering sand dunes make\
you feel scared as you are so small and enclosed by the towering heaps of sand.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31555, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31507, 
            }, 
         }, 
         Vnum = 31508, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31509] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You are surrounded by sand from all possible directions. You can still see a\
glimpse of the city behind you but once you leave the city the land is yours\
to explore.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31510, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31507, 
            }, 
         }, 
         Vnum = 31509, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31510] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "Around you there is only sand as far as you can see. The direction is not\
noticable and civilization is far away. If you wander too far be careful\
of where you end up.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31511, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31513, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31509, 
            }, 
         }, 
         Vnum = 31510, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31511] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "The sand is soft and is still all around you. It is high and shinning in your\
face as you repeatidly walk over endless amounts of sand. You feel enclosed\
because of their great mass. As you walk forward, with every step you take the\
sand dunes grow in size and proportion.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31512, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31510, 
            }, 
         }, 
         Vnum = 31511, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31512] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "The sand is soft and is still all around you. It is high and shinning in your\
face as you repeatidly walk over endless amounts of sand. You feel enclosed\
because of their great mass. As you walk forward, with every step you take\
the sand dunes grow in size and proportion.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31511, 
            }, 
         }, 
         Vnum = 31512, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31513] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "The sand is soft and is still all around you. The sun is high and shining in\
your face as you repeatedly walk over endless amounts of sand. You feel\
enclosed because of their great mass. As you walk forward, with every step you\
take the sand dunes grow in size and proportion.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31514, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31510, 
            }, 
         }, 
         Vnum = 31513, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31514] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "The sand is soft and is still all around you. It is high and shining in your\
face as you repeatidly walk over endless amounts of sand. You feel enclosed\
because of their great mass. As you walk forward, with every step you take\
the sand dunes grow in size and proportion.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31513, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31515, 
            }, 
         }, 
         Vnum = 31514, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31515] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "All around you is sand and shiny dunes piling as high as you can see. As far\
as you can guess anything could be behind there. The towering sand dunes make\
you feel scared as you are so small and enclosed by the towering heaps of sand.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31514, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31516, 
            }, 
         }, 
         Vnum = 31515, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31516] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You are on the top of a sand dune and you can see across the whole dune sea.\
It is just a great sight to see. The sand dunes dip in and out of the ground.\
The immense amount of sand frightens you as you look across the great sand\
dune sea of Tatooine.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31515, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31517, 
            }, 
         }, 
         Vnum = 31516, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31517] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You are heading down the side of a sand a dune entering another valley of\
dunes. With every step you take the sand seems to be increasing.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31516, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31518, 
            }, 
         }, 
         Vnum = 31517, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31518] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You are on the top of a sand dune and you can see across the whole dune sea.\
It is just a great sight to see. The sand dunes dip in and out of the ground.\
The immense amount of sand frightens you as you look across the great sand\
dune sea of Tatooine.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31519, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31517, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31522, 
            }, 
         }, 
         Vnum = 31518, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31519] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "The sand is soft and is still all around you. It is high and shining in your\
face as you repeatedly walk over endless amounts of sand. You feel enclosed\
because of their great mass. As you walk forward, with every step you take the\
sand dunes grow in size and proportion.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31520, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31518, 
            }, 
         }, 
         Vnum = 31519, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31520] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You are on the top of a sand dune and you can see across the whole dune sea.\
It is just a great sight to see. The sand dunes dip in and out of the ground.\
The immense amount of sand frightens you as you look across the great sand dune\
sea of Tatooine.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31521, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31519, 
            }, 
         }, 
         Vnum = 31520, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31521] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You are on the top of a sand dune and you can see across the whole dune sea.\
It is just a great sight to see. The sand dunes dip in and out of the ground.\
The immense amount of sand frightens you as you look across the great sand\
dune sea of Tatooine.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31520, 
            }, 
         }, 
         Vnum = 31521, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31522] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "The sand is soft and is still all around you. It is high and shining in your\
face as you repeatedly walk over endless amounts of sand. You feel enclosed\
because of their great mass. As you walk forward, with every step you take the\
sand dunes grow in size and proportion.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31518, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31523, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31524, 
            }, 
         }, 
         Vnum = 31522, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31523] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "The dunes around you are normal as you walk over the endless amount of dunes.\
The sea of dunes still surrounds you with overwhelming greatness. The sand has\
a reflective shine to it assisted by the sunrays of the heating suns.  You feel\
enclosed because the dunes tower over you greatly.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31522, 
            }, 
         }, 
         Vnum = 31523, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31524] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "All around you is sand and you are The dunes around you are normal as you walk\
over the endless amount of dunes. The sea of dunes still surrounds you with\
overwhelming greatness. The sand has a reflective shine to it assisted by the\
sunrays of the heating suns. You feel enclosed because the dunes tower over\
you greatly.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31525, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31522, 
            }, 
         }, 
         Vnum = 31524, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31525] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "The dunes around you are normal as you walk over the endless amount of dunes.\
The sea of dunes still surrounds you with overwhelming greatness. The sand has\
a reflective shine to it assisted by the sunrays of the heating suns. You feel\
enclosed because the dunes tower over you greatly.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31526, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31524, 
            }, 
         }, 
         Vnum = 31525, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31526] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "All around you is sand and shiny dunes piling as high as you can see. As far\
as you can guess anything could be behind there. The towering sand dunes make\
you feel scared as you are so small and enclosed by the towering heaps of sand.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31527, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31525, 
            }, 
         }, 
         Vnum = 31526, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31527] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "All around you is sand and shiny dunes piling as high as you can see. As far\
as you can guess anything could be behind there. The towering sand dunes make\
you feel scared as you are so small and enclosed by the towering heaps of sand.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31528, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31536, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31526, 
            }, 
         }, 
         Vnum = 31527, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31528] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You start walking over the tip of a dune an can see something in the far sea\
of dunes. All around you is sand and shiny dunes piling as high as you can\
see. As far as you can guess anything could be behind there. The towering sand\
dunes make you feel scared as you are so small and enclosed by the towering\
heaps of sand.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31529, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31527, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31530, 
            }, 
         }, 
         Vnum = 31528, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31529] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "The dunes around you are normal as you walk over the endless amount of dunes.\
The sea of dunes still surrounds you with overwhelming greatness. The sand has\
a reflective shine to it assisted by the sunrays of the heating suns. You feel\
enclosed because the dunes tower over you greatly.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31528, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31531, 
            }, 
         }, 
         Vnum = 31529, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31530] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "All around you is sand and shiny dunes piling as high as you can see. As far\
as you can guess anything could be behind there. The towering sand dunes make\
you feel scared as you are so small and enclosed by the towering heaps of sand.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31528, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31537, 
            }, 
         }, 
         Vnum = 31530, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31531] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "All around you is sand and shiny dunes piling as high as you can see. As far\
as you can guess anything could be behind there. The towering sand dunes make\
you feel scared as you are so small and enclosed by the towering heaps of sand.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31529, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31532, 
            }, 
         }, 
         Vnum = 31531, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31532] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Opening", 
         Description = "The sand is soft and is still all around you. It is high and shinning in your\
face as you repeatidly walk over endless amounts of sand. You feel enclosed\
because of their great mass. As you walk forward, with every step you take the\
sand dunes grow in size and proportion.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31531, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31533, 
            }, 
         }, 
         Vnum = 31532, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31533] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Opening", 
         Description = "You are traveling along the side of the large opening and can see something in\
the center of the opening.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31534, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31532, 
            }, 
         }, 
         Vnum = 31533, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31534] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Opening", 
         Description = "You are standing infront of a very large opening in the ground that seems to\
have endless turns inside itself. To explore this hold continue to the west.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31533, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31535, 
            }, 
         }, 
         Vnum = 31534, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31535] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Sarlacc", 
         Description = "This is a D.T(To be edited)\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31534, 
            }, 
         }, 
         Vnum = 31535, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31536] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You are in the middle of the sea of dunes and are hopelessly lost.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31527, 
            }, 
         }, 
         Vnum = 31536, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31537] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You can now perceive that the object that you are walking towars is a metallic\
form of some sort.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31530, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31538, 
            }, 
         }, 
         Vnum = 31537, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31538] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You are very close to the object and you can now identify it in the sand. It\
is a very old shipwreck plowed into the top of a dune.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31539, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31537, 
            }, 
         }, 
         Vnum = 31538, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31539] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You are infront of the shipwreck and it seems to be habitible. To explore it\
continue north up the hatch.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31540, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31538, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31552, 
            }, 
         }, 
         Vnum = 31539, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31540] = 
      {
         Sector = "inside", 
         TeleVnum = 0, 
         Name = "Hatch", 
         Description = "You are inside the hatch of a ship which seems very new and cared for.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31547, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31542, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31539, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31541, 
            }, 
         }, 
         Vnum = 31540, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31541] = 
      {
         Sector = "inside", 
         TeleVnum = 0, 
         Name = "Cargo Hold", 
         Description = "You are standing infront of an immense cargo room containing many\
crates of items.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31540, 
            }, 
         }, 
         Vnum = 31541, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31542] = 
      {
         Sector = "inside", 
         TeleVnum = 0, 
         Name = "Tunnel", 
         Description = "You are in a small room with lots of wiring and you can see the maintenance\
tunnel in front of you.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31543, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31540, 
            }, 
         }, 
         Vnum = 31542, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31543] = 
      {
         Sector = "inside", 
         TeleVnum = 0, 
         Name = "Mainentance Tunnel", 
         Description = "You are inside the maintenance tunnel. It is a very small space so you must\
crawl inside the tunnel to move.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31544, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31542, 
            }, 
         }, 
         Vnum = 31543, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31544] = 
      {
         Sector = "inside", 
         TeleVnum = 0, 
         Name = "Tunnel", 
         Description = "You are crawling through the tunnel and can see an opening to the west.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31543, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31545, 
            }, 
         }, 
         Vnum = 31544, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31545] = 
      {
         Sector = "inside", 
         TeleVnum = 0, 
         Name = "Secret Compartment", 
         Description = "You enter a small compartment room filled with electronic equipment. It seems\
to be an interrogation room of some sort. You can see computers mounted the\
wall.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31546, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31544, 
            }, 
         }, 
         Vnum = 31545, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31546] = 
      {
         Sector = "inside", 
         TeleVnum = 0, 
         Name = "Death", 
         Description = "You are in a room containing nothing but an assault droid in the corner.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31545, 
            }, 
         }, 
         Vnum = 31546, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31547] = 
      {
         Sector = "inside", 
         TeleVnum = 0, 
         Name = "Corridor", 
         Description = "You are walking down a corridor and can see a ladder at the end of the hall.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31540, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "up", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31548, 
            }, 
         }, 
         Vnum = 31547, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31548] = 
      {
         Sector = "inside", 
         TeleVnum = 0, 
         Name = "Ladder", 
         Description = "You are heading up a ladder headed towards the top portion of the ship.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31550, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31551, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31549, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "down", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31547, 
            }, 
         }, 
         Vnum = 31548, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31549] = 
      {
         Sector = "inside", 
         TeleVnum = 0, 
         Name = "Passenger Compartment", 
         Description = "You enter a passenger compartment that seems to have been inhabitated.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31548, 
            }, 
         }, 
         Vnum = 31549, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31550] = 
      {
         Sector = "inside", 
         TeleVnum = 0, 
         Name = "Pilot Compartment", 
         Description = "You are in the pilot compartment and you look out the viewer console to see\
sand covering it. The computer equipment seems to be usable and undamaged.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31548, 
            }, 
         }, 
         Vnum = 31550, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31551] = 
      {
         Sector = "inside", 
         TeleVnum = 0, 
         Name = "Room", 
         Description = "This room contains nothing in it besides a viewer console and\
seems very strange.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31548, 
            }, 
         }, 
         Vnum = 31551, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31552] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You walk around the immense shuttle to the top of a dune and continue exploring\
the dune sea of Tatooine. It tower around you fromm all directions.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31539, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31553, 
            }, 
         }, 
         Vnum = 31552, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31553] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "The shuttle starts to get smaller and you can see only sand in front of you.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31554, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31552, 
            }, 
         }, 
         Vnum = 31553, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31554] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert ", 
         Description = "You walk slowly and exhausted to find nothing here.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31553, 
            }, 
         }, 
         Vnum = 31554, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31555] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "All around you is sand and shiny dunes piling as high as you can see. As far\
as you can guess anything could be behind there. The towering sand dunes make\
you feel scared as you are so small and enclosed by the towering heaps of sand.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31508, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31556, 
            }, 
         }, 
         Vnum = 31555, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31556] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "All around you is sand and shiny dunes piling as high as you can see. As far\
as you can guess anything could be behind there. The towering sand dunes make\
you feel scared as you are so small and enclosed by the towering heaps of sand.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31555, 
            }, 
         }, 
         Vnum = 31556, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31557] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "All around you is sand and shiny dunes piling as high as you can see.\
As far as you can guess anything could be behind there. The towering\
sand dunes make you  eel scared as you are so small and enclosed by\
the towering heaps of sand.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31500, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31558, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31592, 
            }, 
         }, 
         Vnum = 31557, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31558] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You are on the top of a sand dune and you can see across the whole dune sea.\
It is just a great sight to see. The sand dunes dip in and out of the ground.\
The immense amount of sand frightens you as you look across the great sand\
dune sea of Tatooine.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31559, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31557, 
            }, 
         }, 
         Vnum = 31558, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31559] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "The sand is soft and is still all around you. It is high and shinning in your\
face as you repeatedly walk over endless amounts of sand. You feel enclosed\
because of their great mass. As you walk forward, with every step you take the\
sand dunes grow in size and proportion.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31560, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31565, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31558, 
            }, 
         }, 
         Vnum = 31559, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31560] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "The dunes you are walking on are reaching a few feet high now and you are\
approaching the greater dunes at a rather fast pace.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31561, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31559, 
            }, 
         }, 
         Vnum = 31560, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31561] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You are on a large dune right now and you can see dunes for a long way.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31560, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31562, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31564, 
            }, 
         }, 
         Vnum = 31561, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31562] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You are heading into the sea of dunes. Be careful where you go or you might not come back.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31563, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31561, 
            }, 
         }, 
         Vnum = 31562, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31563] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "The dunes under you appear to be growing with every step that you take.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31569, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31562, 
            }, 
         }, 
         Vnum = 31563, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31564] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You are on a large dune heading further and further away from the grasp of\
civilization.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31561, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31571, 
            }, 
         }, 
         Vnum = 31564, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31565] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You are walking on the rippling surface of the sand which has been\
exposed to extreme heat over the many years. The sand is very warm and\
stings your face as the wind blows it up onto your soft skin. The air\
is thick and very heavy to breathe, but living with it is something you\
accepted when you entered the desert.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31559, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31566, 
            }, 
         }, 
         Vnum = 31565, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31566] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "The hard sand beneath your feet is hot and you can only see the same things\
for miles to come. You are walking on the rippling surface of the sand\
which has been exposed to extreme heat over the many years. The sand is\
very warm and stings your face as the wind blows it up onto your soft\
skin. The air is thick and very heavy to breathe, but living with it\
something you accepted when you entered the desert. \
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31565, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31567, 
            }, 
         }, 
         Vnum = 31566, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31567] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "The sand is hard and hot but you continue to explore this vast area.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31566, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31568, 
            }, 
         }, 
         Vnum = 31567, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31568] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "The hard sand is getting softer as you walk endlessly.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31567, 
            }, 
         }, 
         Vnum = 31568, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31569] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You are walking up and down endless amounts of sound shaped into great dunes\
trying to find something in this vast sea.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31563, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31570, 
            }, 
         }, 
         Vnum = 31569, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31570] = 
      {
         Sector = "desert", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleDelay = 0, 
         Description = "The sand dunes seem to get bigger and higher but it only seems this way from\
exhaustion.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31569, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 1, 
               Description = "", 
               DestinationVnum = 3301, 
            }, 
         }, 
         Name = "Desert", 
         Vnum = 31570, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31571] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "The pummeling dunes are passing under your feet at an alarming rate. Yet there\
is nothing else in sight but sand.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31564, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31572, 
            }, 
         }, 
         Vnum = 31571, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31572] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You walk down to the base of one of the largest dunes you have climbed in your\
trip through the great sea of Tatooine.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31571, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31573, 
            }, 
         }, 
         Vnum = 31572, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31573] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You turn at the bottom of a dune and start climbing a rather small one.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31574, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31572, 
            }, 
         }, 
         Vnum = 31573, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31574] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "The dune you just climbed was a rather small one but when you look down off of\
the dune you realize you are heading down into a valley.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31575, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31577, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31573, 
            }, 
         }, 
         Vnum = 31574, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31575] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You walk through the valley of sand dunes slowly. The harsh conditions are\
slowing you down gradually over the course of many minutes, hours or even days\
depending on how long you last before you find civilization.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31576, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31574, 
            }, 
         }, 
         Vnum = 31575, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31576] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "The sand dunes around you are making you nautious on what is still left\
to climb over.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31575, 
            }, 
         }, 
         Vnum = 31576, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31577] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You are walking and walking through the treacherous sea of never ending sand.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31574, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31578, 
            }, 
         }, 
         Vnum = 31577, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31578] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You look on but can only see endless amounts of sand but nothing else.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31577, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31582, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31579, 
            }, 
         }, 
         Vnum = 31578, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31579] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "The great sea starts becoming a blur after looking at the bare sands\
for many long hours now.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31578, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31580, 
            }, 
         }, 
         Vnum = 31579, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31580] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "The sea of dunes is making a great impression on what you think of Tatooine.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31579, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31581, 
            }, 
         }, 
         Vnum = 31580, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31581] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You are coming up to a rise of harder sand than all around. The flat\
continues to the west.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31580, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31590, 
            }, 
         }, 
         Vnum = 31581, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31582] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "The sand is plunging downwards and all of the sea seems to be heading to\
a point of falling.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31583, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31578, 
            }, 
         }, 
         Vnum = 31582, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31583] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You are standing on the last dune before the entry point and can see what\
is developed inside.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31584, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31582, 
            }, 
         }, 
         Vnum = 31583, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31584] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You are heading down a slope towards a rocky assortment of caves once lived\
in by the native race of this planet. The Jundland Wastes are very large and\
you can see many things from here.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31585, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31583, 
            }, 
         }, 
         Vnum = 31584, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31585] = 
      {
         Sector = "mountain", 
         TeleVnum = 0, 
         Name = "Wastes", 
         Description = "You can see immense caves all around you and feel enclosed by the high walls\
of the caves.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31584, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31586, 
            }, 
         }, 
         Vnum = 31585, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31586] = 
      {
         Sector = "mountain", 
         TeleVnum = 0, 
         Name = "Wastes", 
         Description = "You are walking down a rocky path that passes many old caves. To the south you\
see a cave that is still in pretty good condition. All around there is a\
distinct odour.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31738, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31589, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31587, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31585, 
            }, 
         }, 
         Vnum = 31586, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31587] = 
      {
         Sector = "mountain", 
         Flags = 
         {
            [0] = "Dark", 
         }, 
         TeleDelay = 0, 
         Description = "You are inside a dark cave which has a strong odour of some sort. The cave\
continues to the south.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31586, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31588, 
            }, 
         }, 
         Name = "Cave", 
         Vnum = 31587, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31588] = 
      {
         Sector = "mountain", 
         Flags = 
         {
            [0] = "Dark", 
         }, 
         TeleDelay = 0, 
         Description = "You are in the back of a cave which seems to have been used as a living\
habitat. On the floor in the corner you are appaled when seing three dead\
Jawas. There are some blaster scars on the walls and big gashes everywhere.\
Only one thing could have done this... Sand people.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31587, 
            }, 
         }, 
         Name = "Cave", 
         Vnum = 31588, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31589] = 
      {
         Sector = "mountain", 
         TeleVnum = 0, 
         Name = "Dry Area", 
         Description = "You see many things in the rocks around you but the camp seems lifless in many\
ways. The ground is hard and dry for with the twin suns no moisture can be\
kept in the ground.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31805, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31742, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31586, 
            }, 
         }, 
         Vnum = 31589, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31590] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Teeth", 
         Description = "D.T(to be edited)\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31581, 
            }, 
         }, 
         Vnum = 31590, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31591] = 
      {
         Sector = "underground", 
         TeleVnum = 0, 
         Name = "A Junction In The Sewer Tunnels", 
         Description = "The river of sewage flows into the area from the east and and northwest, and\
disappears off south.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 1, 
               Description = "", 
               DestinationVnum = 31620, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 1, 
               Description = "", 
               DestinationVnum = 31619, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "northwest", 
               Distance = 1, 
               Description = "", 
               DestinationVnum = 31506, 
            }, 
         }, 
         Vnum = 31591, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31592] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You are walking along a hardened sand path which seems to be headed to a\
cliff. The towering sand dunes make you feel scared as you are so small\
and enclosed by the towering heaps of sand. The sun is too warm and is\
getting to you as you tread towards what is to be seen.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31557, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31593, 
            }, 
         }, 
         Vnum = 31592, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31593] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You are coming to the end of the path as far as you can see. The cliff is\
right ahead of you. The sand blows slowly into your face stinging your\
eyes and the rest of your face. The sun pounds down onto your back making\
you feel twice as heavy as usual. At some points down this way it gets\
steep and you slip a little landing right on your behind.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31592, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31594, 
            }, 
         }, 
         Vnum = 31593, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31594] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "The Cliff", 
         Description = "You are standing on the edge of a cliff. It overlooks the great city of Mos\
Eisley. It is a great sight. To the east you see the path curve down the\
side of the cliff. The sand blows slowly into your face stinging your eyes\
and the rest of your face. The sun pounds down onto your back making you\
feel twice as heavy as usual. As you walk slowly down the side of the\
cliff the sand gets sharper and if you are not wearing foot gear it could\
get painful.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31593, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31595, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31597, 
            }, 
         }, 
         Vnum = 31594, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31595] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "Still walking along the cliff you start curving down the side of a\
mountain. You are walking down a hard sand path filled with sharp\
minerals that hurt your feet as you walk over the sand. The heat is\
driving against your back as the twin suns start burning your skin, the\
air is hot and heavy lacking moisture. As the sand blows slowly against\
your face you wish you had something to protect it as shards or sand start\
stinging against your face.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31596, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31594, 
            }, 
         }, 
         Vnum = 31595, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31596] = 
      {
         Sector = "desert", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleDelay = 0, 
         Description = "You Curve down the bottom of the path and approach the entry to the city. \
You are walking down a hard sand path filled with sharp minerals that hurt\
your feet as you walk over the sand. The heat is driving against your back\
as the twin suns start burning your skin, the air is hot and heavy lacking\
moisture. As the sand blows slowly against your face you wish you had\
something to protect it as shards or sand start stinging against your\
face.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31601, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31595, 
            }, 
         }, 
         Name = "Desert End", 
         Vnum = 31596, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31597] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Cliff", 
         Description = "You are walking along the edge of the cliff. Be careful where you go. The\
sand blows slowly into your face, stinging your eyes and the rest of your\
face. The sand flies into your eyes like annoying bugs stinging your eyes\
until the point where you are going to cry. The sun pounds down onto your\
back making you feel twice as heavy as usual.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31600, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31594, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31598, 
            }, 
         }, 
         Vnum = 31597, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31598] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Cliff", 
         Description = "You are very near the edge and should return. Be careful. As you walk down\
the edge of the cliff you see chunks of sand falling down the side of the\
cliff. Seconds later you hear the thumping of the sand hitting the ground\
far below. The sand blows slowly into your face stinging your eyes and the\
rest of your face. To the south the sand looks very unstable. It would be\
advisable not to go there.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31667, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31597, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31599, 
            }, 
         }, 
         Vnum = 31598, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31599] = 
      {
         Sector = "desert", 
         Flags = 
         {
            [24] = "NoFloor", 
         }, 
         TeleDelay = 0, 
         Description = "Aaah, you are loosing your grip! Looking down would not be a good idea as for\
you're about to fall!\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31598, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "down", 
               Flags = 
               {
                  [11] = "Hidden", 
               }, 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31880, 
            }, 
         }, 
         Name = "Cliffside", 
         Vnum = 31599, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31600] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You are walking along the flat sands of Tatooine.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31658, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31597, 
            }, 
         }, 
         Vnum = 31600, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31601] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Name = "City", 
         Description = "You walk into the city, it is a large places with many uses. The thugs of\
the galaxy hang around this town. You are walking down a hard sand path\
filled with sharp minerals that hurt your feet as you walk over the sand.\
The heat is driving against your back as the twin suns start burning your\
skin, the air is hot and heavy lacking moisture. As the sand blows slowly\
against your face you wish you had something to protect it as shards or\
sand start stinging against your face.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31596, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31602, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31878, 
            }, 
         }, 
         Vnum = 31601, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31602] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
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
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31601, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31603, 
            }, 
         }, 
         Vnum = 31602, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31603] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Name = "City", 
         Description = "You are approaching an intersection which will bring you to different parts\
of the city. You are walking down a hard sand path filled with sharp\
minerals that hurt your feet as you walk over the sand. The heat is\
driving against your back as the twin suns start burning your skin, the\
air is hot and heavy lacking moisture. As the sand blows slowly against\
your face you wish you had something to protect it as shards or sand start\
stinging against your face.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31602, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31604, 
            }, 
         }, 
         Vnum = 31603, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31604] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
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
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31603, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31653, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31605, 
            }, 
         }, 
         Vnum = 31604, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31605] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Name = "Pathway To Control Center", 
         Description = "You are walking down a path to the control center. There they watch the\
activities of vessels from all parts of the galaxy. It is not a very large\
building but is suitable for its purpose. The ground beneath your feet is\
hardening as you approach the centre and the air is continuasly heavy and\
warm.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31604, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31841, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31606, 
            }, 
         }, 
         Vnum = 31605, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31606] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Name = "Pathway To Control Center", 
         Description = "You are in front of the control center for the spaceport. Inside this building\
many descisions are made to decide who should be allowed to land on this\
planet and not to cause air havoc.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31605, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31607, 
            }, 
         }, 
         Vnum = 31606, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31607] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Name = "In Front Of The Control Center", 
         Description = "You are in front of the doors to the spaceport control center. To enter it go\
to the west. At many times of the year this building is just chained up and\
locked. Left here abandoned for the law here is not really kept up tight. The\
door is of solid wood and looks very strong.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31606, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31608, 
            }, 
         }, 
         Vnum = 31607, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31608] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "You are in the entrance to the control center. There are turbolifts moving\
all around you. The control tower is on the higher levels but the offices are\
here on the main level of the building. The ground is hard and seems to be\
made of stone. The air is crisp and relaxing in here for it is shielded from\
the twin suns of Tatooine.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31609, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31607, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31613, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31615, 
            }, 
         }, 
         Name = "Inside The Control Center", 
         Vnum = 31608, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31609] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "You are in a hallway with doors to executive offices all the way down the\
hall. There are doors placed on both sides of the hall leading into individual\
offices.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31608, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31610, 
            }, 
         }, 
         Name = "Hallway", 
         Vnum = 31609, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31610] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "You walk down a narrow hallway which has not much space to each side. To your\
sides there are two offices which hold different things. The ground here is\
made of stone and the illumination is poor as for only one glowpanel remains\
to light up this entire hallway. The air is relaxing and constantly flooding\
your lungs for it is a change towards the hot and heavy air outdoors.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31611, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31609, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31612, 
            }, 
         }, 
         Name = "In The Hallway", 
         Vnum = 31610, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31611] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "You are in one of the first offices ever built. It is well furnished and\
decorated. It is used for conferences because of its size but there are not\
many conferences because of the slackness of law on this planet.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31610, 
            }, 
         }, 
         Name = "Large Conference Room", 
         Vnum = 31611, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31612] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "This office is a private office for the manager of this facility. It is a\
rather large office with many vents in it to allow the entrance of crisp air\
to enter the room. There is a large desk made from oak in the middle of the\
room stacked up with 3 pieces of paper.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31610, 
            }, 
         }, 
         Name = "Manager's Office", 
         Vnum = 31612, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31613] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "This hallway heads towards the rooms with the generating and computer\
equipment of the control center.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31608, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31614, 
            }, 
         }, 
         Name = "Hallway", 
         Vnum = 31613, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31614] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "This room contains all of the power generating equipment for the spaceport.\
The generators and computer systems are all mounted on the walls.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31613, 
            }, 
         }, 
         Name = "Generator Room", 
         Vnum = 31614, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31615] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "This is the lobby of the control center. In the corner a secretary takes\
messages and allows passage to the tower.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31608, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "up", 
               Flags = 
               {
                  [0] = "IsDoor", 
                  [5] = "PickProof", 
               }, 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31616, 
            }, 
         }, 
         Name = "Lobby", 
         Vnum = 31615, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31616] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "You are standing in the control tower. Most of the tower is run by droids and\
computers. The only living creatures are humans.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31617, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "down", 
               Flags = 
               {
                  [0] = "IsDoor", 
                  [5] = "PickProof", 
               }, 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31615, 
            }, 
         }, 
         Name = "Tower", 
         Vnum = 31616, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31617] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "Here you can see the whole spaceport from this large viewing screen. As you\
peer through it you can see many different species of life from all across the\
galaxy.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31616, 
            }, 
         }, 
         Name = "Viewscreen", 
         Vnum = 31617, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31618] = 
      {
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [10] = "Safe", 
            [23] = "Hotel", 
         }, 
         TeleDelay = 0, 
         Description = "The upstairs of the cantina contains a few rooms that Wuher rents out for a\
small fee. They are barren and comfortable but the locks all work so at\
least they should be a safe.\
 \
This would be a good place to rest for a while. You may quit and reenter\
the game from here.\
 \
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "down", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31863, 
            }, 
         }, 
         Name = "Upstairs In The Cantina", 
         Vnum = 31618, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31619] = 
      {
         Sector = "underground", 
         TeleVnum = 0, 
         Name = "Tunnel Blocked By A Large Grate", 
         Description = "Beyond a large grate blocking the way ahead, you see a light far ahead, at the\
end of the tunnel. This is probably where the sewege goes. You probably don't\
even want to know what happens to it next.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 1, 
               Description = "", 
               DestinationVnum = 31591, 
            }, 
         }, 
         Vnum = 31619, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31620] = 
      {
         Sector = "underground", 
         TeleVnum = 0, 
         Name = "A Large Chamber", 
         Description = "The tunnels widen into a large chamber. The river of sewage runs through it,\
but most of the floor is dry ground. The purpose of this chamber is not\
obvious, as it's otherwise empty.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 1, 
               Description = "", 
               DestinationVnum = 31622, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 1, 
               Description = "", 
               DestinationVnum = 31591, 
            }, 
         }, 
         Vnum = 31620, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31621] = 
      {
         Sector = "underground", 
         TeleVnum = 0, 
         Name = "A Bend In The Tunnels", 
         Description = "The tunnel bends as the river flows from the east to the southwest. There are\
some large fans embedded into the wall, probably to provide breathable air\
into the tunnels.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 1, 
               Description = "", 
               DestinationVnum = 31504, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "southwest", 
               Distance = 1, 
               Description = "", 
               DestinationVnum = 31622, 
            }, 
         }, 
         Vnum = 31621, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31622] = 
      {
         Sector = "underground", 
         TeleVnum = 0, 
         Name = "A Tunnel In The Sewers", 
         Description = "#31904\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 1, 
               Description = "", 
               DestinationVnum = 31620, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "northeast", 
               Distance = 1, 
               Description = "", 
               DestinationVnum = 31621, 
            }, 
         }, 
         Vnum = 31622, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31623] = 
      {
         Sector = "underground", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "Even the people working down here deserve a break, and this is where they\
take it. There are some posters on the walls that otherwise has an industrial\
look to them.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
               }, 
               Distance = 1, 
               Description = "", 
               DestinationVnum = 31503, 
            }, 
         }, 
         Name = "Maintenance Personnel's Area", 
         Vnum = 31623, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31624] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 1, 
               Description = "", 
               DestinationVnum = 31882, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 1, 
               Description = "", 
               DestinationVnum = 31625, 
            }, 
         }, 
         Name = "Mercs For Hire", 
         Vnum = 31624, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31625] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 1, 
               Description = "", 
               DestinationVnum = 31624, 
            }, 
         }, 
         Name = "Foyer Of Facility", 
         Vnum = 31625, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31653] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Name = "Large Pathway Through The City", 
         Description = "You are walking down one of the main roads in Mos Eisley. As you walk by you\
notice a huge pile of junk where people deposit their goods. The ground you\
walk on is hard and sharp and the air continues to remain the same, heavy and\
warm. The air seems to be getting to you with every step you take but you can\
manage it, after all it's only air.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31840, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31654, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31604, 
            }, 
         }, 
         Vnum = 31653, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31654] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
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
         MudProgs = 
         {
            [1] = 
            {
               Code = "if isjedi($n)\
    if level($n) < 25\
        mpechoat $n You sense that there's something of interest below.\
    endif\
endif\
", 
               Arguments = "100", 
               MudProgType = "entry_prog", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31655, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31653, 
            }, 
            [3] = 
            {
               Keyword = "manhole", 
               Key = -1, 
               Direction = "down", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Distance = 1, 
               Description = "", 
               DestinationVnum = 31907, 
            }, 
         }, 
         Vnum = 31654, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31655] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
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
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31874, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31873, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31853, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31654, 
            }, 
         }, 
         Vnum = 31655, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31658] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You are standing on the harsh sand of Tatooine. You are walking on the\
rippling surface of the sand which has been exposed to extreme heat over\
the many years. The sand is very warm and stings your face as the wind\
blows it up onto your soft skin. The air is thick and very heavy to\
breathe, but living with it something you accepted when you entered the\
desert.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31659, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31600, 
            }, 
         }, 
         Vnum = 31658, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31659] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You are on the hard sand of Tatooine. All around you you can see sand for\
miles unless you look back.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31660, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31658, 
            }, 
         }, 
         Vnum = 31659, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31660] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You are standing on the thickening sand of Tatooine.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31661, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31659, 
            }, 
         }, 
         Vnum = 31660, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31661] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "The sand under you is still hard and glowing. As you look around all you can\
see is shiny sand.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31660, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31662, 
            }, 
         }, 
         Vnum = 31661, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31662] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You walk on the sand of Tatooine. As you walk over it your feet sink into the\
ground leaving an everlasting mark.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31661, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31663, 
            }, 
         }, 
         Vnum = 31662, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31663] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You are walking on the sand of Tatooine. The sand gradually hardens with\
every minute exposed to the sun.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31662, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31664, 
            }, 
         }, 
         Vnum = 31663, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31664] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "The sand under you is feeling hotter with rays of the sun beaming down on it.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31663, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31665, 
            }, 
         }, 
         Vnum = 31664, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31665] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You are standing on the great sands of Tatooine. Far away in the distance you\
can see the developing sea of sand dunes.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31664, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31666, 
            }, 
         }, 
         Vnum = 31665, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31666] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You are heading towards the great sand dunes, yet it is still a long journey\
to reach the sand dune sea.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31683, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31665, 
            }, 
         }, 
         Vnum = 31666, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31667] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You are headed towards the great dune sea, leaving civilization behind.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31668, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31598, 
            }, 
         }, 
         Vnum = 31667, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31668] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You are standing on the hard sand of the planet which has been exposed to\
harsh sun rays.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31669, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31667, 
            }, 
         }, 
         Vnum = 31668, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31669] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "The sand under you is continually getting softer every step you take towards\
the great sea of sand dunes.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31670, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31668, 
            }, 
         }, 
         Vnum = 31669, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31670] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You can now clearly make out the sand dunes ahead of you, but they are still\
very far away.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31671, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31669, 
            }, 
         }, 
         Vnum = 31670, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31671] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You are nearing the great sea of sand dunes with every step you take.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31672, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31670, 
            }, 
         }, 
         Vnum = 31671, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31672] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You are approaching the sand dunes quickly now and will be there soon. With\
every step you take the sand seems to be getting softer and thicker.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31673, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31671, 
            }, 
         }, 
         Vnum = 31672, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31673] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You are only but feet of in reach of the great sea.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31674, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31672, 
            }, 
         }, 
         Vnum = 31673, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31674] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You are nearing the bottom of the first sand dune in sight. All of a sudden\
they seem much bigger than before. They also seem to be growing with every\
step you take.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31675, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31673, 
            }, 
         }, 
         Vnum = 31674, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31675] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "The great dune sea now seems so vast and enormous with every step you take.\
In all directions there are sand dunes towering around and over you.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31676, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31674, 
            }, 
         }, 
         Vnum = 31675, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31676] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You are surrounded by sand, the dunes extend as far as you can see.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31675, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31677, 
            }, 
         }, 
         Vnum = 31676, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31677] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You walk endlessly on the sand beneath you. It towers all around and\
makes you feel enclosed.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31676, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31678, 
            }, 
         }, 
         Vnum = 31677, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31678] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You are walking on a dune. It is shaped by the everlasting winds of Tatooine.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31677, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31679, 
            }, 
         }, 
         Vnum = 31678, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31679] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "The sand around you is thick and hot. In the daytime the sunrays make the\
sand extremely hot.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31678, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31680, 
            }, 
         }, 
         Vnum = 31679, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31680] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You are walking on the sand dunes of the great sea. They tower around you in\
all directions.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31679, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31681, 
            }, 
         }, 
         Vnum = 31680, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31681] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You are walking though the thick sand. It covers your feet and makes you feel\
enclosed.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31680, 
            }, 
         }, 
         Vnum = 31681, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31682] = 
      {
         Sector = "desert", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleDelay = 0, 
         Description = "You walk on the sand dunes of the great sea of Tatooine. They shimmer around\
you in the daylight.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
         }, 
         Name = "Desert", 
         Vnum = 31682, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31683] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You are standing on the thickening sand of the desert.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31684, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31666, 
            }, 
         }, 
         Vnum = 31683, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31684] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You are nearing the first of many sand dunes. All around you can now\
see the sand dunes of the great sea. You can already feel the wind\
blowing the sharp sand into your face. The sand is very sharp so\
wearing something on your face would be a good idea. The twin suns of\
the planet are pounding heat onto your back as you walk slowly\
through the drifts of sand. Your lungs are hurting because this heavy\
air is making their job two times harder. \
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31685, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31683, 
            }, 
         }, 
         Vnum = 31684, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31685] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You are at the step of the first sand dune. You can enter the sand dune sea\
of Tatooine to the north, the west and the east.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31686, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31698, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31684, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31694, 
            }, 
         }, 
         Vnum = 31685, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31686] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You are on one of many large sand dunes in this vast sea.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31687, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31685, 
            }, 
         }, 
         Vnum = 31686, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31687] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "All around you are large sand dunes. If you would like to stay out of the sea\
turn back now.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31688, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31686, 
            }, 
         }, 
         Vnum = 31687, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31688] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You are inside a small valley of sand dunes. All around you shimmering sand\
dunes tower over you.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31689, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31687, 
            }, 
         }, 
         Vnum = 31688, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31689] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You are now in the great sea. The only thing you will find is this great sea\
is probably death.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31688, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31690, 
            }, 
         }, 
         Vnum = 31689, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31690] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You are standing on a vast sand dune which is high enough for you to see\
clearly across the sea.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31689, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31691, 
            }, 
         }, 
         Vnum = 31690, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31691] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You are among many sand dunes. All around you the great sand dunes tower over\
you and you now wonder what you're doing here.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31690, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31692, 
            }, 
         }, 
         Vnum = 31691, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31692] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "The vast sand dunes around you make you feel enclosed. For as far as you can\
see there is only sand.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31691, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31693, 
            }, 
         }, 
         Vnum = 31692, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31693] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You are going endlessly over sand dunes wondering why you are here.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31692, 
            }, 
         }, 
         Vnum = 31693, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31694] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You are standing in front of a largely spaced sea of sand dunes which seems\
never ending.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31685, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31695, 
            }, 
         }, 
         Vnum = 31694, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31695] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You are leaving any hopes of finding civilization behind. The only thing you\
shall find out here is certain death.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31694, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31696, 
            }, 
         }, 
         Vnum = 31695, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31696] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You are looking endlessly at the sand around you. You are but only a small\
figure compared to the sand surrounding you.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31702, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31695, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31697, 
            }, 
         }, 
         Vnum = 31696, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31697] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You are on a sand dune. You can glare far out into the dune sea, but all you\
can see is sand, sand and more sand.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31706, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31696, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31711, 
            }, 
         }, 
         Vnum = 31697, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31698] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You are standing in front of a sand dune. In all directions but the one you\
came are sand dunes.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31699, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31685, 
            }, 
         }, 
         Vnum = 31698, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31699] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "The sand is thicker now that you are on the sand dunes. The great sea is\
greater than you thought and it might be wise to turn back now.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31700, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31698, 
            }, 
         }, 
         Vnum = 31699, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31700] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You are on a sand dune. As you look the sand dunes never end in this vast sea.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31701, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31699, 
            }, 
         }, 
         Vnum = 31700, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31701] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You are in the endless sea of sand dunes. All around you all you can see is\
sand.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31700, 
            }, 
         }, 
         Vnum = 31701, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31702] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You are still in the endless sea of sand dunes. As you peer around yourself\
it feels hopeless in regards to where you are.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31703, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31696, 
            }, 
         }, 
         Vnum = 31702, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31703] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You are in between many sand dunes. They are around you from every angle and\
you feel enclosed because of their height.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31704, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31702, 
            }, 
         }, 
         Vnum = 31703, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31704] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You are on the side of a sand dune. You look around you and there are still\
no traces of life.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31705, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31703, 
            }, 
         }, 
         Vnum = 31704, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31705] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "All around you all you can see is sand. The towering sand dunes are all\
around you and you cannot figure out where you are.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31704, 
            }, 
         }, 
         Vnum = 31705, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31706] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You are standing on soft sand. With sand dunes surrounding you, you just\
keep on walking.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31707, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31697, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31714, 
            }, 
         }, 
         Vnum = 31706, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31707] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You are walking on a sand dune. All around you there are sand dunes. They\
tower high over you until you reach the top of one and start heading back\
down.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31708, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31706, 
            }, 
         }, 
         Vnum = 31707, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31708] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You are standing on the top of a sand dune. And as you hope for something all\
you can see is the voyage down the side of yet another sand dune.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31709, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31707, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31718, 
            }, 
         }, 
         Vnum = 31708, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31709] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You are heading down the side of a dune. Its size makes you feel tired for it\
only makes the journey longer.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31710, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31708, 
            }, 
         }, 
         Vnum = 31709, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31710] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You are surrounded by sand dunes and as they tower over you, you feel\
enclosed.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31709, 
            }, 
         }, 
         Vnum = 31710, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31711] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You are enlosed by many sand dunes which lay around you.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31697, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31712, 
            }, 
         }, 
         Vnum = 31711, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31712] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You are on a sand dune. You can only see sand and formations of dunes in your range of vision.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31711, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31713, 
            }, 
         }, 
         Vnum = 31712, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31713] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You are standing on the top of a sand dune. You feel bigger when you reach the\
top of a sand dune but there is always the way down to think about.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31712, 
            }, 
         }, 
         Vnum = 31713, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31714] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You are walking down the side of a sand dune. All around you is sand as far\
as you can see.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31706, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31715, 
            }, 
         }, 
         Vnum = 31714, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31715] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "The dunes around you are normal as you walk over the endless amount of sand.\
The sea of rippling sand still surrounds you with overwhelming greatness. The\
sand has a reflective shine to it assisted by the sunrays of the heating suns.\
You feel enclosed because the dunes tower over you greatly.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31714, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31716, 
            }, 
         }, 
         Vnum = 31715, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31716] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You are on the side of a dune. It is a large dune so walking down it only to\
walk up another is starting to bother you. The dunes around you are normal as\
you walk over the endless amount of sand. The sea of rippling sand still\
surrounds you with overwhelming greatness. The sand has a reflective shine to\
it assisted by the sunrays of the heating suns. You feel enclosed because the\
dunes tower over you greatly.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31715, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31717, 
            }, 
         }, 
         Vnum = 31716, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31717] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You are standing in between various sand dunes of all sizes and shapes.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31716, 
            }, 
         }, 
         Vnum = 31717, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31718] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You are walking on soft sand. The sand dunes tower around you from all\
directions.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31708, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31719, 
            }, 
         }, 
         Vnum = 31718, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31719] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You are on the side of a sand dune approaching the top.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31718, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31720, 
            }, 
         }, 
         Vnum = 31719, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31720] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You are on the top edge of a sand dune. As you peer around you there is only\
sand.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31719, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31721, 
            }, 
         }, 
         Vnum = 31720, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31721] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You are standing on the side of the sharply shaped sand dune. You are\
approaching the bottom once again so that you can continue with your\
journey.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31722, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31720, 
            }, 
         }, 
         Vnum = 31721, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31722] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You are on a large sand dune. All around you can see sand.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31723, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31721, 
            }, 
         }, 
         Vnum = 31722, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31723] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You are walking on the side of a sand dune. All around you sand dunes tower\
over you.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31722, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31724, 
            }, 
         }, 
         Vnum = 31723, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31724] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You are standing on the top of a sand dune. All around you there is sand.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31725, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31723, 
            }, 
         }, 
         Vnum = 31724, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31725] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You are surrounded by sand from all sides and feel enclosed.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31724, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31726, 
            }, 
         }, 
         Vnum = 31725, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31726] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You are standing on the top of a sand dune. You can see what seems to be a\
palace of some sort in the side of a sand dune just ahead.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31725, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31727, 
            }, 
         }, 
         Vnum = 31726, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31727] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "Desert", 
         Description = "You are standing in front of what you now recognize as Jabba the Hutt's former\
home.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31728, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31726, 
            }, 
         }, 
         Vnum = 31727, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31728] = 
      {
         Sector = "desert", 
         TeleVnum = 0, 
         Name = "In Front Of Jabba's Palace", 
         Description = "You are in front of a large door. It seems to not have been opened in years.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31729, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31727, 
            }, 
         }, 
         Vnum = 31728, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31729] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "You are standing in a large opening surrounded by large walls which tower\
around you. It is very dark in here and you can only continue to the north.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31730, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31728, 
            }, 
         }, 
         Name = "Entrance To Jabba's Palace", 
         Vnum = 31729, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31730] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "You are walking down a corridor towards the what seems to be a large room.\
The air around you is thick and has a foul odor.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31731, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31729, 
            }, 
         }, 
         Name = "Hallway In Jabba's Palace", 
         Vnum = 31730, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31731] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "You are standing in front of the large audience chamber. It was designed to\
hold many people including dancing girls, bands and tables full of people.\
But, since the Monks took over the palace it has not been used.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31732, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31733, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31730, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31734, 
            }, 
         }, 
         Name = "In Front Of Audience Chamber", 
         Vnum = 31731, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31732] = 
      {
         Sector = "inside", 
         TeleVnum = 0, 
         Name = "Jabba's Dais", 
         Description = "You are standing on Jabba the Hutt's former Dais. It is a very large area\
which has an exellent view of the audience chamber.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31731, 
            }, 
         }, 
         Vnum = 31732, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31733] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "You are standing directly on the trapdoor that was used to feed traitors to\
the Rancor which was killed by Luke Skywalker.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31800, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31731, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "down", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31798, 
            }, 
         }, 
         Name = "Trapdoor", 
         Vnum = 31733, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31734] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "You are in the audience chambers of the palace. You can go up the stairs\
towards some of the living quarters of the monks.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31736, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31731, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "up", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31735, 
            }, 
         }, 
         Name = "Audience Chambers", 
         Vnum = 31734, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31735] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "You are on the upper level of the palace that is now inhabited by mainly\
boormir monks and spiderwalkers.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31746, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "down", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31734, 
            }, 
         }, 
         Name = "Upper Level Entrance", 
         Vnum = 31735, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31736] = 
      {
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Description = "You are standing beside the Dais of the former Jabba the Hutt. From here you\
cannot see very well but you are very near the Dais.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31734, 
            }, 
         }, 
         Name = "Beside The Dais", 
         Vnum = 31736, 
         TeleVnum = 0, 
         Tunnel = 0, 
      }, 
      [31737] = 
      {
         Sector = "inside", 
         TeleVnum = 0, 
         Name = "Beside The Dais", 
         Description = "You are standing beside the Dais. From here you have a good view of the chambers.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31733, 
            }, 
         }, 
         Vnum = 31737, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31738] = 
      {
         Sector = "mountain", 
         TeleVnum = 0, 
         Name = "Wastes", 
         Description = "You are standing on a flat rocky surface. As you peer around you see that the\
Jundland Wastes are very large.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31739, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31586, 
            }, 
         }, 
         Vnum = 31738, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31739] = 
      {
         Sector = "mountain", 
         TeleVnum = 0, 
         Name = "Wastes", 
         Description = "You walk around the Jundland Wastes. All around you there is a very\
strong odour.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31740, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31738, 
            }, 
         }, 
         Vnum = 31739, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31740] = 
      {
         Sector = "mountain", 
         TeleVnum = 0, 
         Name = "Wastes", 
         Description = "You stand on rock. It is a very large area you are about to explore. The odour\
is still strong around you.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31741, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31739, 
            }, 
         }, 
         Vnum = 31740, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31741] = 
      {
         Sector = "mountain", 
         TeleVnum = 0, 
         Name = "Wastes", 
         Description = "You can see lots of rocks and cliffs of many different shapes and sizes all\
around you. The odour is still all around you.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31740, 
            }, 
         }, 
         Vnum = 31741, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31742] = 
      {
         Sector = "mountain", 
         TeleVnum = 0, 
         Name = "Vague Area", 
         Description = "You are walking through the Jundland Wastes. All around you there is a\
distinct odour. Things and small creatures many dead lay here but cannot be\
taken without effort, they must not be worth anything.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31743, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31589, 
            }, 
         }, 
         Vnum = 31742, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [31743] = 
      {
         Sector = "mountain", 
         TeleVnum = 0, 
         Name = "Wastes", 
         Description = "You walk down a path through the wastes. All around you the odour thickens.\
", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31744, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Description = "", 
               DestinationVnum = 31742, 
            }, 
         }, 
         Vnum = 31743, 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
   }, 
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
   LowEconomy = 28968939, 
   Author = "Satin", 
   Resets = 
   {
      [1] = 
      {
         Arg2 = 1, 
         Arg1 = 31500, 
         Arg3 = 31767, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [2] = 
      {
         Arg2 = 100, 
         Arg1 = 31500, 
         Arg3 = 0, 
         Command = "E", 
         MiscData = 1, 
      }, 
      [3] = 
      {
         Arg2 = 100, 
         Arg1 = 31501, 
         Arg3 = 31756, 
         Command = "O", 
         MiscData = 1, 
      }, 
      [4] = 
      {
         Arg2 = 100, 
         Arg1 = 31501, 
         Arg3 = 31756, 
         Command = "O", 
         MiscData = 1, 
      }, 
      [5] = 
      {
         Arg2 = 1, 
         Arg1 = 31500, 
         Arg3 = 31756, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [6] = 
      {
         Arg2 = 100, 
         Arg1 = 31500, 
         Arg3 = 0, 
         Command = "E", 
         MiscData = 1, 
      }, 
      [7] = 
      {
         Arg2 = 100, 
         Arg1 = 31501, 
         Arg3 = 31759, 
         Command = "O", 
         MiscData = 1, 
      }, 
      [8] = 
      {
         Arg2 = 100, 
         Arg1 = 31501, 
         Arg3 = 31758, 
         Command = "O", 
         MiscData = 1, 
      }, 
      [9] = 
      {
         Arg2 = 100, 
         Arg1 = 31501, 
         Arg3 = 31758, 
         Command = "O", 
         MiscData = 1, 
      }, 
      [10] = 
      {
         Arg2 = 100, 
         Arg1 = 31501, 
         Arg3 = 31758, 
         Command = "O", 
         MiscData = 1, 
      }, 
      [11] = 
      {
         Arg2 = 100, 
         Arg1 = 31502, 
         Arg3 = 31588, 
         Command = "O", 
         MiscData = 1, 
      }, 
      [12] = 
      {
         Arg2 = 100, 
         Arg1 = 31502, 
         Arg3 = 31588, 
         Command = "O", 
         MiscData = 1, 
      }, 
      [13] = 
      {
         Arg2 = 100, 
         Arg1 = 31502, 
         Arg3 = 31588, 
         Command = "O", 
         MiscData = 1, 
      }, 
      [14] = 
      {
         Arg2 = 100, 
         Arg1 = 31503, 
         Arg3 = 31806, 
         Command = "O", 
         MiscData = 1, 
      }, 
      [15] = 
      {
         Arg2 = 100, 
         Arg1 = 31503, 
         Arg3 = 31806, 
         Command = "O", 
         MiscData = 1, 
      }, 
      [16] = 
      {
         Arg2 = 1, 
         Arg1 = 31502, 
         Arg3 = 31806, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [17] = 
      {
         Arg2 = 100, 
         Arg1 = 31504, 
         Arg3 = 0, 
         Command = "E", 
         MiscData = 1, 
      }, 
      [18] = 
      {
         Arg2 = 100, 
         Arg1 = 31505, 
         Arg3 = 6, 
         Command = "E", 
         MiscData = 1, 
      }, 
      [19] = 
      {
         Arg2 = 1, 
         Arg1 = 31505, 
         Arg3 = 31831, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [20] = 
      {
         Arg2 = 100, 
         Arg1 = 31508, 
         Arg3 = 31833, 
         Command = "O", 
         MiscData = 1, 
      }, 
      [21] = 
      {
         Arg2 = 1, 
         Arg1 = 31511, 
         Arg3 = 31837, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [22] = 
      {
         Arg2 = 1, 
         Arg1 = 31511, 
         Arg3 = 31837, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [23] = 
      {
         Arg2 = 1, 
         Arg1 = 31511, 
         Arg3 = 31837, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [24] = 
      {
         Arg2 = 100, 
         Arg1 = 31511, 
         Arg3 = 16, 
         Command = "E", 
         MiscData = 1, 
      }, 
      [25] = 
      {
         Arg2 = 1, 
         Arg1 = 31510, 
         Arg3 = 31838, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [26] = 
      {
         Arg2 = 100, 
         Arg1 = 31508, 
         Arg3 = 31831, 
         Command = "O", 
         MiscData = 1, 
      }, 
      [27] = 
      {
         Arg2 = 100, 
         Arg1 = 31514, 
         Arg3 = 31612, 
         Command = "O", 
         MiscData = 1, 
      }, 
      [28] = 
      {
         Arg2 = 1, 
         Arg1 = 31517, 
         Arg3 = 31847, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [29] = 
      {
         Arg2 = 100, 
         Arg1 = 31516, 
         Arg3 = 6, 
         Command = "E", 
         MiscData = 1, 
      }, 
      [30] = 
      {
         Arg2 = 100, 
         Arg1 = 31515, 
         Arg3 = 13, 
         Command = "E", 
         MiscData = 1, 
      }, 
      [31] = 
      {
         Arg2 = 5, 
         Arg1 = 31850, 
         Arg3 = 2, 
         Command = "D", 
         MiscData = 1, 
      }, 
      [32] = 
      {
         Arg2 = 1, 
         Arg1 = 31518, 
         Arg3 = 31851, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [33] = 
      {
         Arg2 = 100, 
         Arg1 = 31517, 
         Arg3 = 16, 
         Command = "E", 
         MiscData = 1, 
      }, 
      [34] = 
      {
         Arg2 = 4, 
         Arg1 = 31515, 
         Arg3 = 31852, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [35] = 
      {
         Arg2 = 1, 
         Arg1 = 31515, 
         Arg3 = 31852, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [36] = 
      {
         Arg2 = 1, 
         Arg1 = 31515, 
         Arg3 = 31852, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [37] = 
      {
         Arg2 = 1, 
         Arg1 = 31515, 
         Arg3 = 31852, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [38] = 
      {
         Arg2 = 1, 
         Arg1 = 31515, 
         Arg3 = 31852, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [39] = 
      {
         Arg2 = 1, 
         Arg1 = 31515, 
         Arg3 = 31852, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [40] = 
      {
         Arg2 = 1, 
         Arg1 = 31512, 
         Arg3 = 31715, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [41] = 
      {
         Arg2 = 1, 
         Arg1 = 31512, 
         Arg3 = 31715, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [42] = 
      {
         Arg2 = 1, 
         Arg1 = 31513, 
         Arg3 = 31715, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [43] = 
      {
         Arg2 = 1, 
         Arg1 = 31514, 
         Arg3 = 31715, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [44] = 
      {
         Arg2 = 1, 
         Arg1 = 31513, 
         Arg3 = 31715, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [45] = 
      {
         Arg2 = 1, 
         Arg1 = 31516, 
         Arg3 = 31715, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [46] = 
      {
         Arg2 = 1, 
         Arg1 = 31516, 
         Arg3 = 31715, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [47] = 
      {
         Arg2 = 100, 
         Arg1 = 31519, 
         Arg3 = 31853, 
         Command = "O", 
         MiscData = 1, 
      }, 
      [48] = 
      {
         Arg2 = 1, 
         Arg1 = 31519, 
         Arg3 = 31863, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [49] = 
      {
         Arg2 = 100, 
         Arg1 = 31520, 
         Arg3 = 31863, 
         Command = "O", 
         MiscData = 1, 
      }, 
      [50] = 
      {
         Arg2 = 12, 
         Arg1 = 31520, 
         Arg3 = 31871, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [51] = 
      {
         Arg2 = 12, 
         Arg1 = 31520, 
         Arg3 = 31871, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [52] = 
      {
         Arg2 = 12, 
         Arg1 = 31520, 
         Arg3 = 31871, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [53] = 
      {
         Arg2 = 12, 
         Arg1 = 31520, 
         Arg3 = 31871, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [54] = 
      {
         Arg2 = 12, 
         Arg1 = 31520, 
         Arg3 = 31871, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [55] = 
      {
         Arg2 = 12, 
         Arg1 = 31520, 
         Arg3 = 31871, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [56] = 
      {
         Arg2 = 1, 
         Arg1 = 31501, 
         Arg3 = 31817, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [57] = 
      {
         Arg2 = 1, 
         Arg1 = 31509, 
         Arg3 = 12, 
         Command = "E", 
         MiscData = 1, 
      }, 
      [58] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 10314, 
      }, 
      [59] = 
      {
         Arg2 = 1, 
         Arg1 = 31504, 
         Arg3 = 31861, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [60] = 
      {
         Arg2 = 1, 
         Arg1 = 31527, 
         Arg3 = 31861, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [61] = 
      {
         Arg2 = 1, 
         Arg1 = 31507, 
         Arg3 = 31861, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [62] = 
      {
         Arg2 = 1, 
         Arg1 = 31526, 
         Arg3 = 31862, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [63] = 
      {
         Arg2 = 1, 
         Arg1 = 31521, 
         Arg3 = 31862, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [64] = 
      {
         Arg2 = 1, 
         Arg1 = 31524, 
         Arg3 = 31862, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [65] = 
      {
         Arg2 = 1, 
         Arg1 = 31525, 
         Arg3 = 31857, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [66] = 
      {
         Arg2 = 1, 
         Arg1 = 31506, 
         Arg3 = 31857, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [67] = 
      {
         Arg2 = 2, 
         Arg1 = 31527, 
         Arg3 = 31854, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [68] = 
      {
         Arg2 = 1, 
         Arg1 = 31523, 
         Arg3 = 31854, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [69] = 
      {
         Arg2 = 2, 
         Arg1 = 31525, 
         Arg3 = 31854, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [70] = 
      {
         Arg2 = 1, 
         Arg1 = 31528, 
         Arg3 = 31854, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [71] = 
      {
         Arg2 = 2, 
         Arg1 = 31526, 
         Arg3 = 31856, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [72] = 
      {
         Arg2 = 2, 
         Arg1 = 31528, 
         Arg3 = 31856, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [73] = 
      {
         Arg2 = 1, 
         Arg1 = 31529, 
         Arg3 = 31858, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [74] = 
      {
         Arg2 = 13, 
         Arg1 = 31520, 
         Arg3 = 31855, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [75] = 
      {
         Arg2 = 2, 
         Arg1 = 31524, 
         Arg3 = 31855, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [76] = 
      {
         Arg2 = 1, 
         Arg1 = 31503, 
         Arg3 = 31653, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [77] = 
      {
         Arg2 = 1, 
         Arg1 = 31514, 
         Arg3 = 31840, 
         Command = "O", 
         MiscData = 1, 
      }, 
      [78] = 
      {
         Arg2 = 19, 
         Arg1 = 31520, 
         Arg3 = 31870, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [79] = 
      {
         Arg2 = 19, 
         Arg1 = 31520, 
         Arg3 = 31870, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [80] = 
      {
         Arg2 = 19, 
         Arg1 = 31520, 
         Arg3 = 31870, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [81] = 
      {
         Arg2 = 19, 
         Arg1 = 31520, 
         Arg3 = 31870, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [82] = 
      {
         Arg2 = 19, 
         Arg1 = 31520, 
         Arg3 = 31870, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [83] = 
      {
         Arg2 = 19, 
         Arg1 = 31520, 
         Arg3 = 31870, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [84] = 
      {
         Arg2 = 1, 
         Arg1 = 31521, 
         Arg3 = 31830, 
         Command = "O", 
         MiscData = 1, 
      }, 
      [85] = 
      {
         Arg2 = 1, 
         Arg1 = 31531, 
         Arg3 = 31875, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [86] = 
      {
         Arg2 = 100, 
         Arg1 = 31504, 
         Arg3 = 31601, 
         Command = "M", 
         MiscData = 0, 
      }, 
      [87] = 
      {
         Arg2 = 100, 
         Arg1 = 31504, 
         Arg3 = 31602, 
         Command = "M", 
         MiscData = 0, 
      }, 
      [88] = 
      {
         Arg2 = 100, 
         Arg1 = 31504, 
         Arg3 = 31603, 
         Command = "M", 
         MiscData = 0, 
      }, 
      [89] = 
      {
         Arg2 = 100, 
         Arg1 = 31504, 
         Arg3 = 31604, 
         Command = "M", 
         MiscData = 0, 
      }, 
      [90] = 
      {
         Arg2 = 100, 
         Arg1 = 31504, 
         Arg3 = 31819, 
         Command = "M", 
         MiscData = 0, 
      }, 
      [91] = 
      {
         Arg2 = 100, 
         Arg1 = 31504, 
         Arg3 = 31821, 
         Command = "M", 
         MiscData = 0, 
      }, 
      [92] = 
      {
         Arg2 = 100, 
         Arg1 = 31504, 
         Arg3 = 31822, 
         Command = "M", 
         MiscData = 0, 
      }, 
      [93] = 
      {
         Arg2 = 100, 
         Arg1 = 31504, 
         Arg3 = 31824, 
         Command = "M", 
         MiscData = 0, 
      }, 
      [94] = 
      {
         Arg2 = 100, 
         Arg1 = 31504, 
         Arg3 = 31828, 
         Command = "M", 
         MiscData = 0, 
      }, 
      [95] = 
      {
         Arg2 = 100, 
         Arg1 = 31504, 
         Arg3 = 31829, 
         Command = "M", 
         MiscData = 0, 
      }, 
      [96] = 
      {
         Arg2 = 100, 
         Arg1 = 31504, 
         Arg3 = 31830, 
         Command = "M", 
         MiscData = 0, 
      }, 
      [97] = 
      {
         Arg2 = 100, 
         Arg1 = 31504, 
         Arg3 = 31832, 
         Command = "M", 
         MiscData = 0, 
      }, 
      [98] = 
      {
         Arg2 = 100, 
         Arg1 = 31504, 
         Arg3 = 31834, 
         Command = "M", 
         MiscData = 0, 
      }, 
      [99] = 
      {
         Arg2 = 100, 
         Arg1 = 31504, 
         Arg3 = 31835, 
         Command = "M", 
         MiscData = 0, 
      }, 
      [100] = 
      {
         Arg2 = 100, 
         Arg1 = 31504, 
         Arg3 = 31837, 
         Command = "M", 
         MiscData = 0, 
      }, 
      [101] = 
      {
         Arg2 = 20, 
         Arg1 = 31503, 
         Arg3 = 31601, 
         Command = "M", 
         MiscData = 0, 
      }, 
      [102] = 
      {
         Arg2 = 20, 
         Arg1 = 31503, 
         Arg3 = 31602, 
         Command = "M", 
         MiscData = 0, 
      }, 
      [103] = 
      {
         Arg2 = 20, 
         Arg1 = 31503, 
         Arg3 = 31603, 
         Command = "M", 
         MiscData = 0, 
      }, 
      [104] = 
      {
         Arg2 = 20, 
         Arg1 = 31503, 
         Arg3 = 31604, 
         Command = "M", 
         MiscData = 0, 
      }, 
      [105] = 
      {
         Arg2 = 20, 
         Arg1 = 31503, 
         Arg3 = 31653, 
         Command = "M", 
         MiscData = 0, 
      }, 
      [106] = 
      {
         Arg2 = 20, 
         Arg1 = 31503, 
         Arg3 = 31840, 
         Command = "M", 
         MiscData = 0, 
      }, 
      [107] = 
      {
         Arg2 = 1, 
         Arg1 = 31532, 
         Arg3 = 31883, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [108] = 
      {
         Arg2 = 1, 
         Arg1 = 328, 
         Arg3 = 31863, 
         Command = "M", 
         MiscData = 0, 
      }, 
      [109] = 
      {
         Arg2 = 1, 
         Arg1 = 55, 
         Arg3 = 16, 
         Command = "E", 
         MiscData = 1, 
      }, 
      [110] = 
      {
         Arg2 = 1, 
         Arg1 = 31900, 
         Arg3 = 31905, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [111] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 10323, 
      }, 
      [112] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 10324, 
      }, 
      [113] = 
      {
         Arg2 = 1, 
         Arg1 = 31525, 
         Arg3 = 31899, 
         Command = "O", 
         MiscData = 1, 
      }, 
      [114] = 
      {
         Arg2 = 1, 
         Arg1 = 31526, 
         Arg3 = 31900, 
         Command = "O", 
         MiscData = 1, 
      }, 
      [115] = 
      {
         Arg2 = 1, 
         Arg1 = 31527, 
         Arg3 = 31998, 
         Command = "O", 
         MiscData = 0, 
      }, 
      [116] = 
      {
         Arg2 = 1, 
         Arg1 = 31528, 
         Arg3 = 31997, 
         Command = "O", 
         MiscData = 0, 
      }, 
      [117] = 
      {
         Arg2 = 1, 
         Arg1 = 31901, 
         Arg3 = 31909, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [118] = 
      {
         Arg2 = 1, 
         Arg1 = 10323, 
         Arg3 = 16, 
         Command = "E", 
         MiscData = 1, 
      }, 
      [119] = 
      {
         Arg2 = 1, 
         Arg1 = 31902, 
         Arg3 = 31901, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [120] = 
      {
         Arg2 = 1, 
         Arg1 = 31529, 
         Arg3 = 31901, 
         Command = "O", 
         MiscData = 1, 
      }, 
      [121] = 
      {
         Arg2 = 1, 
         Arg1 = 31522, 
         Arg3 = 0, 
         Command = "P", 
         MiscData = 0, 
      }, 
      [122] = 
      {
         Arg2 = 1, 
         Arg1 = 31524, 
         Arg3 = 0, 
         Command = "P", 
         MiscData = 1, 
      }, 
      [123] = 
      {
         Arg2 = 1, 
         Arg1 = 31530, 
         Arg3 = 31902, 
         Command = "O", 
         MiscData = 1, 
      }, 
      [124] = 
      {
         Arg2 = 1, 
         Arg1 = 31533, 
         Arg3 = 31503, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [125] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 32210, 
      }, 
      [126] = 
      {
         Arg2 = 1, 
         Arg1 = 31532, 
         Arg3 = 5, 
         Command = "E", 
         MiscData = 1, 
      }, 
      [127] = 
      {
         Arg2 = 1, 
         Arg1 = 31531, 
         Arg3 = 31503, 
         Command = "O", 
         MiscData = 1, 
      }, 
      [128] = 
      {
         Arg2 = 2, 
         Arg1 = 31534, 
         Arg3 = 31502, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [129] = 
      {
         Arg2 = 2, 
         Arg1 = 31534, 
         Arg3 = 31502, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [130] = 
      {
         Arg2 = 1, 
         Arg1 = 31534, 
         Arg3 = 31623, 
         Command = "O", 
         MiscData = 1, 
      }, 
      [131] = 
      {
         Arg2 = 2, 
         Arg1 = 31623, 
         Arg3 = 2, 
         Command = "D", 
         MiscData = 0, 
      }, 
      [132] = 
      {
         Arg2 = 3, 
         Arg1 = 31534, 
         Arg3 = 31908, 
         Command = "M", 
         MiscData = 1, 
      }, 
      [133] = 
      {
         Arg2 = 1, 
         Arg1 = 31535, 
         Arg3 = 31908, 
         Command = "O", 
         MiscData = 1, 
      }, 
   }, 
   HighEconomy = 0, 
   VnumRanges = 
   {
      Mob = 
      {
         Last = 31999, 
         First = 31500, 
      }, 
      Room = 
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
   Objects = 
   {
      [31500] = 
      {
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 1, 
            [2] = 30, 
            [3] = 1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Flags = 
         {
            [0] = "Glow", 
            [10] = "AntiEvil", 
         }, 
         Name = "candle", 
         Description = "A candle rests here.", 
         ActionDescription = "", 
         ItemType = "light", 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         Affects = 
         {
            [1] = 
            {
               Location = 18, 
               Modifier = 1, 
            }, 
         }, 
         Vnum = 31500, 
         ShortDescr = "a small white candle", 
         Weight = 1, 
      }, 
      [31501] = 
      {
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 1, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Flags = 
         {
            [0] = "Glow", 
         }, 
         Name = "brain jar", 
         Description = "A large jar containing a sacred brain lies here. ", 
         ActionDescription = "", 
         Layers = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         ItemType = "container", 
         Vnum = 31501, 
         ShortDescr = "a large brain jar with flashing lights", 
         Weight = 3, 
      }, 
      [31502] = 
      {
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
         Name = "corpse dead Jawa", 
         Description = "A dead Jawa lies motionless on the ground here.", 
         ActionDescription = "", 
         Layers = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "This jawa has been laying here for quite a while as it seems. His skin has\
\13begun decaying and you can see his bones in certain spots.", 
               Keyword = "look jawa", 
            }, 
         }, 
         ItemType = "corpse", 
         Vnum = 31502, 
         ShortDescr = "a dead Jawa", 
         Weight = 100, 
      }, 
      [31503] = 
      {
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 97000, 
            [2] = 10000, 
            [3] = 11000, 
            [4] = 0, 
            [5] = 0, 
            [0] = 100000, 
         }, 
         Flags = 
         {
            [12] = "NoRemove", 
         }, 
         Name = "Egg", 
         Description = "A large egg lays here, falling over every once in a while.", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "A large egg with different colors on it lays here. It would probably not be\
\13wise to take it or the mother might get mad.", 
               Keyword = "look egg", 
            }, 
         }, 
         Layers = 0, 
         ItemType = "trash", 
         Affects = 
         {
            [1] = 
            {
               Location = 9, 
               Modifier = 0, 
            }, 
         }, 
         Vnum = 31503, 
         ShortDescr = "a large egg", 
         Weight = 2, 
      }, 
      [31504] = 
      {
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 9000, 
            [2] = 110, 
            [3] = 1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 100000, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Name = "Shiny krayt crystal", 
         Description = "A shiny krayt crystal lays here.", 
         ActionDescription = "", 
         ItemType = "light", 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         Affects = 
         {
            [1] = 
            {
               Location = 17, 
               Modifier = 5, 
            }, 
         }, 
         Vnum = 31504, 
         ShortDescr = "a shiny krayt crystal", 
         Weight = 1, 
      }, 
      [31505] = 
      {
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 2000, 
            [2] = 6000, 
            [3] = 1100, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10000, 
         }, 
         Flags = 
         {
            [0] = "Glow", 
         }, 
         Name = "Pearl", 
         Description = "A glowing pearl lays here.", 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Layers = 0, 
         ItemType = "armor", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 31505, 
         ShortDescr = "a krayt pearl", 
         Weight = 1, 
      }, 
      [31506] = 
      {
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 10, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Name = "Canteen", 
         Description = "A canteen rests here, waiting to be picked up.", 
         ActionDescription = "", 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         ItemType = "drink_container", 
         Vnum = 31506, 
         ShortDescr = "a canteen", 
         Weight = 2, 
      }, 
      [31507] = 
      {
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 15, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 15, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Name = "jug", 
         Description = "A jug of water rests here.", 
         ActionDescription = "", 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         ItemType = "drink_container", 
         Vnum = 31507, 
         ShortDescr = "a jug of water", 
         Weight = 5, 
      }, 
      [31508] = 
      {
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 1, 
            [2] = 5, 
            [3] = 3, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Name = "Circuit", 
         Description = "A torn up circuit lies here, waiting to be picked up.", 
         ActionDescription = "", 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         ItemType = "circuit", 
         Vnum = 31508, 
         ShortDescr = "a torn up circuit", 
         Weight = 1, 
      }, 
      [31509] = 
      {
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 1345, 
            [4] = 0, 
            [5] = 0, 
            [0] = 1, 
         }, 
         Flags = 
         {
            [0] = "Glow", 
            [18] = "SmallSize", 
         }, 
         Name = "Jawa Robe", 
         Description = "A Jawa robe is here, waiting to be taken.", 
         ActionDescription = "", 
         ItemType = "armor", 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         Affects = 
         {
            [1] = 
            {
               Location = 5, 
               Modifier = 0, 
            }, 
         }, 
         Vnum = 31509, 
         ShortDescr = "a dirty Jawa robe", 
         Weight = 3, 
      }, 
      [31510] = 
      {
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 15, 
            [2] = 6, 
            [3] = 11, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Name = "Wire", 
         Description = "Some wire is here, waiting to be taken", 
         ActionDescription = "", 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         ItemType = "trash", 
         Vnum = 31510, 
         ShortDescr = "some wire", 
         Weight = 2, 
      }, 
      [31511] = 
      {
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 6, 
            [3] = 6, 
            [4] = 0, 
            [5] = 0, 
            [0] = 7200, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Name = "Jawa Blaster", 
         Description = "A elegant little blaster lays here on the ground.", 
         ActionDescription = "", 
         ItemType = "weapon", 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         Affects = 
         {
            [1] = 
            {
               Location = 18, 
               Modifier = 0, 
            }, 
         }, 
         Vnum = 31511, 
         ShortDescr = "a Jawa Blaster", 
         Weight = 6, 
      }, 
      [31512] = 
      {
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = -259084288, 
            [4] = 0, 
            [5] = 0, 
            [0] = 200, 
         }, 
         Flags = 
         {
            [0] = "Glow", 
         }, 
         Name = "Glimmering Belt", 
         Description = "A powerful godly belt lays on the ground here.", 
         WearFlags = 
         {
            [11] = "Waist", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "This belt glows and hums with extreme power comming from it. This object cannot be handled by a mortal mind for its powers are to great.", 
               Keyword = "look belt", 
            }, 
         }, 
         Layers = 0, 
         ItemType = "armor", 
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
         Vnum = 31512, 
         ShortDescr = "Satin's Glimmering Belt.", 
         Weight = 1, 
      }, 
      [31513] = 
      {
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 17000, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Name = "Stick", 
         Description = "A large stick of the Wise Storyteller lays here.", 
         ActionDescription = "", 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         ItemType = "treasure", 
         Vnum = 31513, 
         ShortDescr = "a large stick", 
         Weight = 1, 
      }, 
      [31514] = 
      {
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
         Name = "large oak desk", 
         Description = "A large oak desk collects dust on the ground here.", 
         ActionDescription = "", 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         ItemType = "furniture", 
         Vnum = 31514, 
         ShortDescr = "a large oak desk", 
         Weight = 150, 
      }, 
      [31515] = 
      {
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 1300, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         Flags = 
         {
            [31] = "HumanSize", 
         }, 
         Name = "Belt", 
         Description = "A mechanics belt lays here waiting to be used.", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Layers = 0, 
         ItemType = "armor", 
         Affects = 
         {
            [1] = 
            {
               Location = 4, 
               Modifier = 0, 
            }, 
         }, 
         Vnum = 31515, 
         ShortDescr = "a mechanics belt", 
         Weight = 4, 
      }, 
      [31516] = 
      {
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 600, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         Flags = 
         {
            [31] = "HumanSize", 
         }, 
         Name = "Hat", 
         Description = "A mechanics hat collects dust on the ground.", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Layers = 0, 
         ItemType = "armor", 
         Affects = 
         {
            [1] = 
            {
               Location = 2, 
               Modifier = 0, 
            }, 
         }, 
         Vnum = 31516, 
         ShortDescr = "a mechanics hat", 
         Weight = 2, 
      }, 
      [31517] = 
      {
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 6, 
            [2] = 6, 
            [3] = 6, 
            [4] = 1000, 
            [5] = 1000, 
            [0] = 7200, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Name = "Ionization Gun", 
         Description = "A Jawa ionization gun has been foolishly left behind.", 
         ActionDescription = "", 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         ItemType = "weapon", 
         Vnum = 31517, 
         ShortDescr = "a Jawa ionization gun", 
         Weight = 8, 
      }, 
      [31518] = 
      {
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
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Name = "key", 
         Description = "A small key crafted from hide", 
         ActionDescription = "", 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         ItemType = "key", 
         Vnum = 31518, 
         ShortDescr = "a small hide Key", 
         Weight = 5, 
      }, 
      [31519] = 
      {
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
         Name = "Detector", 
         Description = "A droid detector is mounted on the wall here.", 
         ActionDescription = "", 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         ItemType = "furniture", 
         Vnum = 31519, 
         ShortDescr = "a droid detector", 
         Weight = 900, 
      }, 
      [31520] = 
      {
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 1, 
            [2] = 6, 
            [3] = 11, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Flags = 
         {
            [0] = "Glow", 
         }, 
         Name = "Drink Machine", 
         Description = "A large and complex drink machine sits here. It is used by Wuher\
\13to dispense drinks.", 
         ActionDescription = "", 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         ItemType = "furniture", 
         Vnum = 31520, 
         ShortDescr = "a large drink machine", 
         Weight = 5, 
      }, 
      [31521] = 
      {
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
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Name = "Bed", 
         Description = "A comfortable bed lays here. Maybe laying down would not hurt you.", 
         ActionDescription = "", 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         ItemType = "trash", 
         Vnum = 31521, 
         ShortDescr = "a bed", 
         Weight = 1, 
      }, 
      [31522] = 
      {
         Cost = 10, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 3, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Name = "Bantha rib", 
         Description = "A bantha rib is here for your enjoyment.", 
         ActionDescription = "", 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         ItemType = "food", 
         Vnum = 31522, 
         ShortDescr = "a bantha rib", 
         Weight = 1, 
      }, 
      [31523] = 
      {
         Cost = 15, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Name = "Banthaburger", 
         Description = "A banthaburger site here ready to eat.", 
         ActionDescription = "", 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         ItemType = "food", 
         Vnum = 31523, 
         ShortDescr = "a banthaburger", 
         Weight = 1, 
      }, 
      [31524] = 
      {
         Cost = 16, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 4, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Name = "Grilled Womp Rat", 
         Description = "Some grilled womp rat is here ready to be snatched up.", 
         ActionDescription = "", 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         ItemType = "food", 
         Vnum = 31524, 
         ShortDescr = "some grilled womp rat", 
         Weight = 1, 
      }, 
      [31525] = 
      {
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
         Name = "hologram projector", 
         Description = "A hologram projector is here.", 
         ActionDescription = "", 
         Layers = 0, 
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
         ItemType = "trash", 
         Vnum = 31525, 
         ShortDescr = "a hologram projector", 
         Weight = 1, 
      }, 
      [31526] = 
      {
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 3, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 3, 
         }, 
         Name = "worn couch", 
         Description = "A worn couch is here.", 
         ActionDescription = "", 
         Layers = 0, 
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
         ItemType = "furniture", 
         Vnum = 31526, 
         ShortDescr = "a worn couch", 
         Weight = 1, 
      }, 
      [31527] = 
      {
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 2, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         Name = "spacious seats", 
         Description = "Rows of spacious seats fill this section.", 
         ActionDescription = "", 
         Layers = 0, 
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
         ItemType = "furniture", 
         Vnum = 31527, 
         ShortDescr = "spacious seats", 
         Weight = 1, 
      }, 
      [31528] = 
      {
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 2, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         Name = "cramped seats", 
         Description = "Cramped seats fill the economy section.", 
         ActionDescription = "", 
         Layers = 0, 
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
         ItemType = "furniture", 
         Vnum = 31528, 
         ShortDescr = "cramped seats", 
         Weight = 1, 
      }, 
      [31529] = 
      {
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 20, 
         }, 
         Name = "refridgerator fridge", 
         Description = "A small refridgerator stands in a corner.", 
         ActionDescription = "", 
         MudProgs = 
         {
            [1] = 
            {
               Code = "-- This script restocks the fridge with a randomly picked item of food\
if otypeinobj(food) < 3\
    macro opoload_one_of 31522 31523 31524\
    mpecho The refridgerator makes a loud humming noise.\
endif\
\
def opoload_one_of\
    if rand(33)\
        opoload $1\
    elif rand(50)\
        opoload $2\
    else\
        opoload $3\
    endif\
enddef\
", 
               Arguments = "100", 
               MudProgType = "rand_prog", 
            }, 
         }, 
         Layers = 0, 
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
         ItemType = "container", 
         Vnum = 31529, 
         ShortDescr = "a refridgerator", 
         Weight = 1, 
      }, 
      [31530] = 
      {
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
         Name = "fake flower", 
         Description = "A large fake flower in a large pot.", 
         ActionDescription = "", 
         Layers = 0, 
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
         ItemType = "trash", 
         Vnum = 31530, 
         ShortDescr = "a fake flower", 
         Weight = 1, 
      }, 
      [31531] = 
      {
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
         Name = "mysterious machinery", 
         Description = "Some mysterious-looking machinery is here, making a lot of noise.", 
         ActionDescription = "", 
         Layers = 0, 
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
         ItemType = "trash", 
         Vnum = 31531, 
         ShortDescr = "the machinery", 
         Weight = 1, 
      }, 
      [31532] = 
      {
         Cost = 10, 
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
            [3] = "Body", 
         }, 
         Name = "jumpsuit", 
         Description = "A jumpsuit lies neatly folded on the ground.", 
         ActionDescription = "", 
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
         ItemType = "armor", 
         Vnum = 31532, 
         ShortDescr = "a jumpsuit", 
         Weight = 1, 
      }, 
      [31533] = 
      {
         Cost = 25, 
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Name = "low-quality rodent skin", 
         Description = "Some low-quality rodent skin is lying on the ground.", 
         ActionDescription = "", 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         ItemType = "fabric", 
         Vnum = 31533, 
         ShortDescr = "a low-quality rodent skin", 
         Weight = 1, 
      }, 
      [31534] = 
      {
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 1, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 6, 
         }, 
         Name = "platic table chairs", 
         Description = "A plastic table with some chairs is here.", 
         ActionDescription = "", 
         Layers = 0, 
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
         ItemType = "furniture", 
         Vnum = 31534, 
         ShortDescr = "a plastic table", 
         Weight = 1, 
      }, 
      [31535] = 
      {
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
         Name = "rusty pipes", 
         Description = "A few rusty pipes comes down from the ceiling.", 
         ActionDescription = "", 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpecho The rusty pipes spew out more sewage into the river.\
", 
               Arguments = "25", 
               MudProgType = "rand_prog", 
            }, 
         }, 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         ItemType = "trash", 
         Vnum = 31535, 
         ShortDescr = "a few rusty pipes", 
         Weight = 1, 
      }, 
      [31999] = 
      {
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
         Name = "lastobject", 
         Description = "Some god dropped a newly created lastobject here.", 
         ActionDescription = "", 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         ItemType = "trash", 
         Vnum = 31999, 
         ShortDescr = "a newly created lastobject", 
         Weight = 1, 
      }, 
   }, 
   ResetMessage = "", 
   FileFormatVersion = 1, 
}
