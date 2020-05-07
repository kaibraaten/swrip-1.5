-- Gamorr
-- Last saved Thursday 07-May-2020 14:47:57

AreaEntry
{
   Filename = "gamorr.lua", 
   Name = "Gamorr", 
   Mobiles = 
   {
      [28000] = 
      {
         Description = "", 
         Name = "A Strange man ", 
         Vnum = 28000, 
         Weight = 0, 
         Credits = 5000, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "A Strange man ", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         LongDescr = "A strange man is sitting here meditating.\
", 
         DefaultPosition = "standing", 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               MudProgType = "greet_prog", 
               Code = "smile\
'Hello, welcome to my home\
", 
            }, 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
               [18] = "_clan", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [18] = "_clan", 
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
         DamRoll = 5, 
         HitRoll = 5, 
         Height = 0, 
         Alignment = 1000, 
         NumberOfAttacks = 3, 
         Level = 100, 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
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
         ArmorClass = -50, 
         Sex = "undistinguished", 
         Position = "standing", 
      }, 
      [28001] = 
      {
         Description = "", 
         Name = "A Gamorrean male", 
         Vnum = 28001, 
         Weight = 0, 
         Credits = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         ShortDescr = "A Gamorrean male", 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 100, 
            HitNoDice = 2, 
         }, 
         LongDescr = "A Gamorrean male wanders around here.\
", 
         DefaultPosition = "standing", 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "5", 
               MudProgType = "rand_prog", 
               Code = "grunt\
", 
            }, 
            [2] = 
            {
               Arguments = "30", 
               MudProgType = "fight_prog", 
               Code = "mpechoat $n The Gamorrean head butts you!\
mpechoaround $n The Gamorrean headbutts $n!\
mpdamage $n 15\
", 
            }, 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [14] = "gamorrese", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [14] = "gamorrese", 
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
         Race = "Gamorrean", 
         VipFlags = 
         {
            [7] = "Gamorr", 
         }, 
         DamRoll = 0, 
         HitRoll = 0, 
         Height = 0, 
         Alignment = 0, 
         NumberOfAttacks = 2, 
         Level = 10, 
         Damage = 
         {
            DamNoDice = 2, 
            DamSizeDice = 6, 
            DamPlus = 0, 
         }, 
         Stats = 
         {
            Force = 0, 
            Luck = 13, 
            Constitution = 13, 
            Wisdom = 13, 
            Dexterity = 13, 
            Strength = 18, 
            Charisma = 13, 
            Intelligence = 13, 
         }, 
         ArmorClass = 10, 
         Sex = "male", 
         Position = "standing", 
      }, 
      [28002] = 
      {
         Description = "", 
         Name = "gamorrean child kid piglet", 
         Vnum = 28002, 
         Weight = 0, 
         Credits = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [7] = "Wimpy", 
         }, 
         ShortDescr = "A Gamorrean child", 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30, 
            HitNoDice = 1, 
         }, 
         LongDescr = "A Gamorrean child is playing around here\
", 
         DefaultPosition = "standing", 
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
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Breath = 0, 
         }, 
         Race = "Gamorrean", 
         DamRoll = 0, 
         HitRoll = 0, 
         Height = 0, 
         Alignment = 0, 
         NumberOfAttacks = 1, 
         Level = 1, 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 3, 
            DamPlus = 3, 
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
         ArmorClass = 0, 
         Sex = "male", 
         Position = "standing", 
      }, 
      [28003] = 
      {
         Description = "You've heard about these guys they are nothing to be messed with, they\
are cunning evil and like to eat living flesh. nothing on this planet\
has the same reputation as the watch-beast so watch you step it could\
be you last!\
 \
", 
         Name = "gamorrean watch beast big pig ", 
         Vnum = 28003, 
         Weight = 0, 
         Credits = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [5] = "Aggressive", 
         }, 
         ShortDescr = "A Gamorreans watch-beast", 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 1000, 
            HitNoDice = 1, 
         }, 
         LongDescr = "A Gamorreans watch-beast is eatting a freshly killed tourist\
", 
         DefaultPosition = "standing", 
         Languages = 
         {
            Speaking = 
            {
               [14] = "gamorrese", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [14] = "gamorrese", 
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
         Race = "Gamorrean", 
         DamRoll = 10, 
         HitRoll = 15, 
         Height = 0, 
         Alignment = 0, 
         NumberOfAttacks = 3, 
         Level = 60, 
         Damage = 
         {
            DamNoDice = 6, 
            DamSizeDice = 6, 
            DamPlus = 6, 
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
         ArmorClass = 0, 
         Sex = "undistinguished", 
         Position = "standing", 
      }, 
      [28004] = 
      {
         Description = "", 
         Name = "Beitl beast terrible run RUN RUN AWAY", 
         Vnum = 28004, 
         Weight = 0, 
         Credits = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [5] = "Aggressive", 
            [18] = "Mountable", 
         }, 
         ShortDescr = "a Desert Beitl", 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 300, 
            HitNoDice = 6, 
         }, 
         LongDescr = "A ferocious Desert Beitl is basking in the desert sun.\
", 
         DefaultPosition = "standing", 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "5", 
               MudProgType = "rand_prog", 
               Code = "grow\
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
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Breath = 0, 
         }, 
         Race = "Human", 
         DamRoll = 6, 
         HitRoll = 6, 
         Height = 0, 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         Level = 30, 
         Damage = 
         {
            DamNoDice = 4, 
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
         ArmorClass = 25, 
         Sex = "undistinguished", 
         Position = "standing", 
      }, 
      [28005] = 
      {
         Description = "", 
         Name = "boar head shushgu", 
         Vnum = 28005, 
         Weight = 0, 
         Credits = 420, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
         }, 
         ShortDescr = "Shushgu", 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 900, 
            HitNoDice = 18, 
         }, 
         LongDescr = "It's Shushgu, One of the Alpha-females Husbands.\
", 
         DefaultPosition = "standing", 
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
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Breath = 0, 
         }, 
         Race = "Gamorrean", 
         DamRoll = 11, 
         HitRoll = 12, 
         Height = 0, 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         Level = 90, 
         Damage = 
         {
            DamNoDice = 11, 
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
            Strength = 21, 
            Charisma = 13, 
            Intelligence = 13, 
         }, 
         ArmorClass = -76, 
         Sex = "male", 
         Position = "standing", 
      }, 
      [28006] = 
      {
         Description = "", 
         Name = "gurda beast ", 
         Vnum = 28006, 
         AttackFlags = 
         {
            [1] = "claws", 
         }, 
         Weight = 0, 
         Credits = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [5] = "Aggressive", 
         }, 
         ShortDescr = "A Gurda Beast", 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 100, 
            HitNoDice = 2, 
         }, 
         LongDescr = "A Gurda Beast is prowling around in the mountain shadows.\
", 
         DefaultPosition = "standing", 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               MudProgType = "all_greet_prog", 
               Code = "get baby\
grow\
l $n\
eat baby\
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
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Breath = 0, 
         }, 
         Sex = "undistinguished", 
         DamRoll = 2, 
         HitRoll = 0, 
         NumberOfAttacks = 0, 
         Height = 0, 
         Alignment = 0, 
         Race = "Human", 
         Level = 10, 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 6, 
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
         ArmorClass = 75, 
         AffectedBy = 
         {
            [1] = "Invisible", 
            [15] = "Sneak", 
            [9] = "Infrared", 
         }, 
         Position = "standing", 
      }, 
      [28007] = 
      {
         Description = "", 
         Name = "Imperial stormtrooper", 
         Vnum = 28007, 
         Weight = 0, 
         Credits = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "An Imperial Stormtrooper", 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 100, 
            HitNoDice = 2, 
         }, 
         LongDescr = "An Imperial Stormtrooper is loading infant Gamorrean watch-beasts\
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
         DamRoll = 2, 
         HitRoll = 2, 
         Height = 0, 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         Level = 10, 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 6, 
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
         ArmorClass = 77, 
         Sex = "male", 
         Position = "standing", 
      }, 
      [28008] = 
      {
         Description = "", 
         Name = "Imperial stormtrooper", 
         Vnum = 28008, 
         Weight = 0, 
         Credits = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "An Imperial Stormtrooper", 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 100, 
            HitNoDice = 2, 
         }, 
         LongDescr = "An Imperial Stormtrooper has his blaster aimed at the watch-beasts.\
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
         DamRoll = 2, 
         HitRoll = 2, 
         Height = 0, 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         Level = 10, 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 6, 
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
         ArmorClass = 77, 
         Sex = "male", 
         Position = "standing", 
      }, 
      [28009] = 
      {
         Description = "", 
         Name = "Jos third husband", 
         Vnum = 28009, 
         Weight = 0, 
         Credits = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [25] = "NoKill", 
         }, 
         ShortDescr = "Jos", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         LongDescr = "Jos, The Alpha-females third Husband\
", 
         DefaultPosition = "standing", 
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
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Breath = 0, 
         }, 
         Race = "Gamorrean", 
         DamRoll = 7, 
         HitRoll = 7, 
         Height = 0, 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         Level = 70, 
         Damage = 
         {
            DamNoDice = 4, 
            DamSizeDice = 7, 
            DamPlus = 0, 
         }, 
         Stats = 
         {
            Force = 0, 
            Luck = 13, 
            Constitution = 13, 
            Wisdom = 13, 
            Dexterity = 13, 
            Strength = 22, 
            Charisma = 13, 
            Intelligence = 13, 
         }, 
         ArmorClass = 0, 
         Sex = "male", 
         Position = "standing", 
      }, 
      [28010] = 
      {
         Description = "", 
         Name = "gamorrean guard", 
         Vnum = 28010, 
         Weight = 0, 
         Credits = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [2] = "Scavenger", 
            [0] = "Npc", 
         }, 
         ShortDescr = "A Gamorrean guard", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         LongDescr = "A Gamorrean stands guard here\
", 
         DefaultPosition = "standing", 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               MudProgType = "greet_prog", 
               Code = "sigh\
say Welcome to Gamorr may you stay be...\
grunt\
say pleasing.\
smirk\
", 
            }, 
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
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Breath = 0, 
         }, 
         Race = "Gamorrean", 
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
            Luck = 13, 
            Constitution = 13, 
            Wisdom = 13, 
            Dexterity = 13, 
            Strength = 13, 
            Charisma = 13, 
            Intelligence = 13, 
         }, 
         ArmorClass = 0, 
         Sex = "male", 
         Position = "standing", 
      }, 
      [28011] = 
      {
         Shop = 
         {
            BuyTypes = 
            {
               [1] = "drink_container", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "food", 
            }, 
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
            ProfitSell = 90, 
            ProfitBuy = 120, 
            KeeperShortDescr = "The shop owner", 
         }, 
         Description = "", 
         Name = "stand owner ", 
         Vnum = 28011, 
         Weight = 0, 
         Credits = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "The shop owner", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         LongDescr = "The Small stands owner is selling refreshing drinks here\
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
      [28012] = 
      {
         Description = "", 
         Name = "Fruck", 
         Vnum = 28012, 
         Weight = 0, 
         Credits = 240, 
         Flags = 
         {
            [0] = "Npc", 
            [25] = "NoKill", 
         }, 
         ShortDescr = "Fruck", 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 100, 
            HitNoDice = 10, 
         }, 
         LongDescr = "Fruck is here keeping watch over Ugmush's ship.\
", 
         DefaultPosition = "standing", 
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
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Breath = 0, 
         }, 
         Race = "Gamorrean", 
         DamRoll = 15, 
         HitRoll = 15, 
         Height = 0, 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         Level = 70, 
         Damage = 
         {
            DamNoDice = 8, 
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
         ArmorClass = -30, 
         Sex = "male", 
         Position = "standing", 
      }, 
      [28013] = 
      {
         Description = "", 
         Name = "raxe pest ", 
         Vnum = 28013, 
         Weight = 0, 
         Credits = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         ShortDescr = "a raxe pest", 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 30, 
            HitNoDice = 1, 
         }, 
         LongDescr = "A raxe pest is scurrying around here.\
", 
         DefaultPosition = "standing", 
         SpecFuns = 
         {
            [1] = "spec_fido", 
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
         Level = 3, 
         Damage = 
         {
            DamNoDice = 3, 
            DamSizeDice = 1, 
            DamPlus = 3, 
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
      [28014] = 
      {
         Description = "This is the Zicreex, well known around Gamorr for its hunting of the\
natives most gamorreans keep a safe distance from these hungry beasts\
and with good reason too the Zicreexs diet mainly consists of\
gamorreans.\
 \
", 
         Name = "zicreex beast", 
         Vnum = 28014, 
         Weight = 0, 
         Credits = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [5] = "Aggressive", 
         }, 
         ShortDescr = "a zicreex beast ", 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 300, 
            HitNoDice = 6, 
         }, 
         LongDescr = "A Zicreex beast is on the hunt here.\
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
         Level = 30, 
         Damage = 
         {
            DamNoDice = 4, 
            DamSizeDice = 4, 
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
      [28015] = 
      {
         Description = "", 
         Name = "shaga mountain matron", 
         Vnum = 28015, 
         AttackFlags = 
         {
            [9] = "_09", 
            [4] = "punch", 
            [5] = "kick", 
            [6] = "_06", 
            [7] = "_07", 
         }, 
         Weight = 0, 
         Credits = 450, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "Shaga", 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 900, 
            HitNoDice = 18, 
         }, 
         LongDescr = "Shaga the mountain clan matron is standing here.\
", 
         DefaultPosition = "standing", 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               MudProgType = "death_prog", 
               Code = "mpecho With her last bit of strength, Shaga desperatly tries to hold\
mpecho onto the clans sacred stone.\
mpoload 28030\
drop all\
", 
            }, 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [14] = "gamorrese", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [14] = "gamorrese", 
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
         Race = "Gamorrean", 
         VipFlags = 
         {
            [7] = "Gamorr", 
         }, 
         DamRoll = 0, 
         HitRoll = 0, 
         Height = 0, 
         Alignment = 0, 
         NumberOfAttacks = 2, 
         Level = 90, 
         Damage = 
         {
            DamNoDice = 11, 
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
            Strength = 18, 
            Charisma = 13, 
            Intelligence = 13, 
         }, 
         ArmorClass = -74, 
         Sex = "female", 
         Position = "standing", 
      }, 
      [28016] = 
      {
         Description = "This old human man seems to be content just gazing at the stars. He is\
dressed in a long hooded cloak and old brown boots. from the scars on\
his face you think that this man has seen a fair share of action in\
his days.\
Maybe he could teach you a thing or two....\
", 
         Name = "shaman gamorrean healer", 
         Vnum = 28016, 
         Weight = 0, 
         Credits = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [10] = "Practice", 
            [20] = "Scholar", 
         }, 
         ShortDescr = "a gamorrean shaman", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         LongDescr = "A gamorrean shaman is sitting here.\
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
         Level = 103, 
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
         Position = "sitting", 
      }, 
      [28017] = 
      {
         Shop = 
         {
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "drink_container", 
            }, 
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
            ProfitSell = 90, 
            ProfitBuy = 120, 
            KeeperShortDescr = "a gamorrean shop keeper", 
         }, 
         Description = "", 
         Name = "gamorrean shop owner", 
         Vnum = 28017, 
         Weight = 0, 
         Credits = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "a gamorrean shop keeper", 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 12998, 
            HitNoDice = 1, 
         }, 
         LongDescr = "A gamorrean shop keeper is selling some water goods.\
", 
         DefaultPosition = "standing", 
         Languages = 
         {
            Speaking = 
            {
               [14] = "gamorrese", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [14] = "gamorrese", 
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
         Race = "Gamorrean", 
         DamRoll = 0, 
         HitRoll = 0, 
         Height = 0, 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         Level = 20, 
         Damage = 
         {
            DamNoDice = 10, 
            DamSizeDice = 5, 
            DamPlus = 10, 
         }, 
         Stats = 
         {
            Force = 0, 
            Luck = 13, 
            Constitution = 13, 
            Wisdom = 13, 
            Dexterity = 13, 
            Strength = 25, 
            Charisma = 13, 
            Intelligence = 13, 
         }, 
         ArmorClass = 0, 
         Sex = "female", 
         Position = "standing", 
      }, 
      [28018] = 
      {
         Shop = 
         {
            BuyTypes = 
            {
               [1] = "container", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "food", 
            }, 
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
            ProfitSell = 90, 
            ProfitBuy = 120, 
            KeeperShortDescr = "The Gamorrean Shop keeper", 
         }, 
         Description = "", 
         Name = "gamorrean shop owner", 
         Vnum = 28018, 
         Weight = 0, 
         Credits = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "The Gamorrean Shop keeper", 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 12998, 
            HitNoDice = 1, 
         }, 
         LongDescr = "A gamorrean shop keeper is selling some goods here.\
", 
         DefaultPosition = "standing", 
         Languages = 
         {
            Speaking = 
            {
               [14] = "gamorrese", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [14] = "gamorrese", 
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
         Race = "Gamorrean", 
         DamRoll = 0, 
         HitRoll = 0, 
         Height = 0, 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         Level = 20, 
         Damage = 
         {
            DamNoDice = 10, 
            DamSizeDice = 5, 
            DamPlus = 10, 
         }, 
         Stats = 
         {
            Force = 0, 
            Luck = 13, 
            Constitution = 13, 
            Wisdom = 13, 
            Dexterity = 13, 
            Strength = 25, 
            Charisma = 13, 
            Intelligence = 13, 
         }, 
         ArmorClass = 0, 
         Sex = "female", 
         Position = "standing", 
      }, 
      [28019] = 
      {
         Shop = 
         {
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "armor", 
            }, 
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
            ProfitSell = 90, 
            ProfitBuy = 120, 
            KeeperShortDescr = "The Gamorrean Shop keeper", 
         }, 
         Description = "", 
         Name = "gamorrean shop owner", 
         Vnum = 28019, 
         Weight = 0, 
         Credits = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "The Gamorrean Shop keeper", 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 12998, 
            HitNoDice = 1, 
         }, 
         LongDescr = "A gamorrean shop keeper is selling some of her weapons here.\
", 
         DefaultPosition = "standing", 
         Languages = 
         {
            Speaking = 
            {
               [14] = "gamorrese", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [14] = "gamorrese", 
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
         Race = "Gamorrean", 
         DamRoll = 0, 
         HitRoll = 0, 
         Height = 0, 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         Level = 20, 
         Damage = 
         {
            DamNoDice = 10, 
            DamSizeDice = 5, 
            DamPlus = 10, 
         }, 
         Stats = 
         {
            Force = 0, 
            Luck = 13, 
            Constitution = 13, 
            Wisdom = 13, 
            Dexterity = 13, 
            Strength = 25, 
            Charisma = 13, 
            Intelligence = 13, 
         }, 
         ArmorClass = 0, 
         Sex = "female", 
         Position = "standing", 
      }, 
      [28020] = 
      {
         Description = "", 
         Name = "noghri patron", 
         Vnum = 28020, 
         Weight = 0, 
         Credits = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "a noghri", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         LongDescr = "A noghri is sitting here minding his own business.\
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
            Luck = 13, 
            Constitution = 13, 
            Wisdom = 13, 
            Dexterity = 13, 
            Strength = 13, 
            Charisma = 13, 
            Intelligence = 13, 
         }, 
         ArmorClass = 0, 
         Sex = "male", 
         Position = "standing", 
      }, 
      [28021] = 
      {
         Description = "", 
         Name = "trandoshan hunter", 
         Vnum = 28021, 
         Weight = 0, 
         Credits = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "A trandoshan hunter", 
         HitChance = 
         {
            HitSizeDice = 9, 
            HitPlus = 450, 
            HitNoDice = 10, 
         }, 
         LongDescr = "A trandoshan hunter is sitting here watching out for something.\
", 
         DefaultPosition = "standing", 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               MudProgType = "all_greet_prog", 
               Code = "if race($n) == wookiee\
' Wookiee Scum!!\
mpkill $n\
endif\
", 
            }, 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [22] = "dosh", 
            }, 
            Speaks = 
            {
               [22] = "dosh", 
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
         Race = "Trandoshan", 
         DamRoll = 9, 
         HitRoll = 9, 
         Height = 0, 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         Level = 40, 
         Damage = 
         {
            DamNoDice = 8, 
            DamSizeDice = 3, 
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
         ArmorClass = 0, 
         Sex = "male", 
         Position = "standing", 
      }, 
      [28022] = 
      {
         Description = "", 
         Name = "wookiee", 
         Vnum = 28022, 
         Weight = 0, 
         Credits = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         ShortDescr = "a newly created wookiee", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         LongDescr = "Some god abandoned a newly created wookiee here.\
", 
         DefaultPosition = "standing", 
         Languages = 
         {
            Speaking = 
            {
               [1] = "shyriiwook", 
            }, 
            Speaks = 
            {
               [1] = "shyriiwook", 
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
         Race = "Wookiee", 
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
            Luck = 13, 
            Constitution = 13, 
            Wisdom = 13, 
            Dexterity = 13, 
            Strength = 13, 
            Charisma = 13, 
            Intelligence = 13, 
         }, 
         ArmorClass = 0, 
         Sex = "undistinguished", 
         Position = "standing", 
      }, 
      [28023] = 
      {
         Description = "", 
         Name = "Shugsha", 
         Vnum = 28023, 
         AttackFlags = 
         {
            [9] = "_09", 
            [4] = "punch", 
            [5] = "kick", 
            [6] = "_06", 
            [7] = "_07", 
         }, 
         Weight = 0, 
         Credits = 450, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "Shugsha", 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 900, 
            HitNoDice = 18, 
         }, 
         LongDescr = "Shugsha the forest clan matron is here.\
", 
         DefaultPosition = "standing", 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               MudProgType = "death_prog", 
               Code = "mpecho Shugsha drops a shield as she collapses to the ground.\
mpoload 28029\
", 
            }, 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [14] = "gamorrese", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [14] = "gamorrese", 
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
         Race = "Gamorrean", 
         DamRoll = 0, 
         HitRoll = 0, 
         Height = 0, 
         Alignment = 0, 
         NumberOfAttacks = 6, 
         Level = 90, 
         Damage = 
         {
            DamNoDice = 11, 
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
            Strength = 18, 
            Charisma = 13, 
            Intelligence = 13, 
         }, 
         ArmorClass = -74, 
         Sex = "female", 
         Position = "standing", 
      }, 
      [28025] = 
      {
         Description = "", 
         Name = "female gamorrean", 
         Vnum = 28025, 
         Weight = 0, 
         Credits = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         ShortDescr = "A Female Gamorrean", 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 100, 
            HitNoDice = 2, 
         }, 
         LongDescr = "A Female Gamorrean is going to collect the crops.\
", 
         DefaultPosition = "standing", 
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
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Breath = 0, 
         }, 
         Race = "Gamorrean", 
         DamRoll = 0, 
         HitRoll = 0, 
         Height = 0, 
         Alignment = 0, 
         NumberOfAttacks = 2, 
         Level = 10, 
         Damage = 
         {
            DamNoDice = 2, 
            DamSizeDice = 6, 
            DamPlus = 0, 
         }, 
         Stats = 
         {
            Force = 0, 
            Luck = 13, 
            Constitution = 13, 
            Wisdom = 13, 
            Dexterity = 13, 
            Strength = 18, 
            Charisma = 13, 
            Intelligence = 13, 
         }, 
         ArmorClass = 10, 
         Sex = "male", 
         Position = "standing", 
      }, 
      [28139] = 
      {
         Description = "", 
         Name = "morrt", 
         Vnum = 28139, 
         AttackFlags = 
         {
            [0] = "bite", 
         }, 
         Weight = 0, 
         Credits = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [5] = "Aggressive", 
            [2] = "Scavenger", 
            [6] = "StayArea", 
         }, 
         ShortDescr = "A large Morrt", 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 100, 
            HitNoDice = 1, 
         }, 
         LongDescr = "A hungery Morrt is crawling around the ground here.\
", 
         DefaultPosition = "standing", 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "10", 
               MudProgType = "rand_prog", 
               Code = "drool\
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
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Breath = 0, 
         }, 
         Race = "Human", 
         DamRoll = 10, 
         HitRoll = 0, 
         Height = 0, 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         Level = 10, 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
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
         ArmorClass = 0, 
         Sex = "undistinguished", 
         Position = "standing", 
      }, 
      [28116] = 
      {
         Description = "Ugmush is a Beauty to the Gamorreans, she has a long pink wig and her\
heavy muscled arms and breasts are sporting fifteen parasitic morrts\
to demonstrate her strength and endurance.   \
 \
", 
         Name = "Ugmush alpha female", 
         Vnum = 28116, 
         AttackFlags = 
         {
            [9] = "_09", 
            [4] = "punch", 
            [5] = "kick", 
            [6] = "_06", 
            [7] = "_07", 
         }, 
         Weight = 0, 
         Credits = 450, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "Ugmush", 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 900, 
            HitNoDice = 18, 
         }, 
         LongDescr = "The Alpha-Female Ugmush stands before you.\
", 
         DefaultPosition = "standing", 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               MudProgType = "death_prog", 
               Code = "mpecho &YWith her dying breath Ugmush drops a cerimonial axe.\
mpoload 28028\
", 
            }, 
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
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Breath = 0, 
         }, 
         Race = "Gamorrean", 
         DamRoll = 14, 
         HitRoll = 14, 
         Height = 0, 
         Alignment = 0, 
         NumberOfAttacks = 6, 
         Level = 90, 
         Damage = 
         {
            DamNoDice = 11, 
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
            Strength = 18, 
            Charisma = 13, 
            Intelligence = 13, 
         }, 
         ArmorClass = -74, 
         Sex = "female", 
         Position = "standing", 
      }, 
      [28107] = 
      {
         Shop = 
         {
            BuyTypes = 
            {
               [1] = "armor", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "weapon", 
            }, 
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
            ProfitSell = 90, 
            ProfitBuy = 120, 
            KeeperShortDescr = "The Gamorrean Shop keeper", 
         }, 
         Description = "", 
         Name = "Gamorrean Shop keeper.", 
         Vnum = 28107, 
         Weight = 0, 
         Credits = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "The Gamorrean Shop keeper", 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 12998, 
            HitNoDice = 1, 
         }, 
         LongDescr = "The Gamorrean shop keeper is selling her weapons.\
", 
         DefaultPosition = "standing", 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100 ", 
               MudProgType = "greet_prog", 
               Code = "say I have very many usefull things you might like \
", 
            }, 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [14] = "gamorrese", 
            }, 
            Speaks = 
            {
               [2] = "twileki", 
               [3] = "rodese", 
               [4] = "huttese", 
               [6] = "shistavanen", 
               [7] = "ewokese", 
               [8] = "ithorese", 
               [9] = "antarian", 
               [10] = "devaronese", 
               [11] = "barabel", 
               [15] = "togorian", 
               [0] = "basic", 
               [17] = "jawaese", 
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
         Race = "Gamorrean", 
         DamRoll = 0, 
         HitRoll = 0, 
         Height = 0, 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         Level = 20, 
         Damage = 
         {
            DamNoDice = 10, 
            DamSizeDice = 5, 
            DamPlus = 10, 
         }, 
         Stats = 
         {
            Force = 0, 
            Luck = 13, 
            Constitution = 13, 
            Wisdom = 13, 
            Dexterity = 13, 
            Strength = 25, 
            Charisma = 13, 
            Intelligence = 13, 
         }, 
         ArmorClass = 0, 
         Sex = "female", 
         Position = "standing", 
      }, 
   }, 
   Resets = 
   {
      [1] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 41, 
         Arg1 = 28001, 
         Arg3 = 28000, 
      }, 
      [2] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 41, 
         Arg1 = 28001, 
         Arg3 = 28000, 
      }, 
      [3] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 28015, 
         Arg3 = 28003, 
      }, 
      [4] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 28010, 
         Arg3 = 28010, 
      }, 
      [5] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 28012, 
         Arg3 = 16, 
      }, 
      [6] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 28020, 
         Arg3 = 28014, 
      }, 
      [7] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 28021, 
         Arg3 = 28015, 
      }, 
      [8] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 28011, 
         Arg3 = 28016, 
      }, 
      [9] = 
      {
         Command = "G", 
         Arg1 = 32253, 
         Arg2 = 1, 
         MiscData = 1, 
      }, 
      [10] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 28003, 
         Arg3 = 28023, 
      }, 
      [11] = 
      {
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 28013, 
         Arg3 = 28023, 
      }, 
      [12] = 
      {
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 28014, 
         Arg3 = 28023, 
      }, 
      [13] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 28006, 
         Arg3 = 28031, 
      }, 
      [14] = 
      {
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 28001, 
         Arg3 = 28031, 
      }, 
      [15] = 
      {
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 28027, 
         Arg3 = 28036, 
      }, 
      [16] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 28000, 
         Arg3 = 28102, 
      }, 
      [17] = 
      {
         Command = "D", 
         MiscData = 0, 
         Arg2 = 1, 
         Arg1 = 28102, 
         Arg3 = 0, 
      }, 
      [18] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 10, 
         Arg1 = 28013, 
         Arg3 = 28103, 
      }, 
      [19] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 4, 
         Arg1 = 28002, 
         Arg3 = 28103, 
      }, 
      [20] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 41, 
         Arg1 = 28001, 
         Arg3 = 28103, 
      }, 
      [21] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 10, 
         Arg1 = 28013, 
         Arg3 = 28103, 
      }, 
      [22] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 41, 
         Arg1 = 28001, 
         Arg3 = 28106, 
      }, 
      [23] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 28107, 
         Arg3 = 28107, 
      }, 
      [24] = 
      {
         Command = "G", 
         Arg1 = 28003, 
         Arg2 = 1, 
         MiscData = 1, 
      }, 
      [25] = 
      {
         Command = "G", 
         Arg1 = 28016, 
         Arg2 = 1, 
         MiscData = 1, 
      }, 
      [26] = 
      {
         Command = "G", 
         Arg1 = 28015, 
         Arg2 = 1, 
         MiscData = 1, 
      }, 
      [27] = 
      {
         Command = "G", 
         Arg1 = 28017, 
         Arg2 = 1, 
         MiscData = 1, 
      }, 
      [28] = 
      {
         Command = "G", 
         Arg1 = 28011, 
         Arg2 = 1, 
         MiscData = 1, 
      }, 
      [29] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 4, 
         Arg1 = 28002, 
         Arg3 = 28112, 
      }, 
      [30] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 41, 
         Arg1 = 28001, 
         Arg3 = 28113, 
      }, 
      [31] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 4, 
         Arg1 = 28002, 
         Arg3 = 28113, 
      }, 
      [32] = 
      {
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 28001, 
         Arg3 = 28114, 
      }, 
      [33] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 28116, 
         Arg3 = 28116, 
      }, 
      [34] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 28008, 
         Arg3 = 5, 
      }, 
      [35] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 28019, 
         Arg3 = 6, 
      }, 
      [36] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 10, 
         Arg1 = 28013, 
         Arg3 = 28117, 
      }, 
      [37] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 10, 
         Arg1 = 28013, 
         Arg3 = 28117, 
      }, 
      [38] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 10, 
         Arg1 = 28013, 
         Arg3 = 28117, 
      }, 
      [39] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 4, 
         Arg1 = 28002, 
         Arg3 = 28118, 
      }, 
      [40] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 41, 
         Arg1 = 28001, 
         Arg3 = 28121, 
      }, 
      [41] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 28005, 
         Arg3 = 28122, 
      }, 
      [42] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 28189, 
         Arg3 = 16, 
      }, 
      [43] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 28010, 
         Arg3 = 5, 
      }, 
      [44] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 28015, 
         Arg3 = 6, 
      }, 
      [45] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 28016, 
         Arg3 = 8, 
      }, 
      [46] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 28017, 
         Arg3 = 14, 
      }, 
      [47] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 28017, 
         Arg3 = 15, 
      }, 
      [48] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 28011, 
         Arg3 = 13, 
      }, 
      [49] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 28024, 
         Arg3 = 3, 
      }, 
      [50] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 28024, 
         Arg3 = 4, 
      }, 
      [51] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 41, 
         Arg1 = 28001, 
         Arg3 = 28122, 
      }, 
      [52] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 10, 
         Arg1 = 28013, 
         Arg3 = 28123, 
      }, 
      [53] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 41, 
         Arg1 = 28001, 
         Arg3 = 28124, 
      }, 
      [54] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 10, 
         Arg1 = 28013, 
         Arg3 = 28125, 
      }, 
      [55] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 10, 
         Arg1 = 28013, 
         Arg3 = 28130, 
      }, 
      [56] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 10, 
         Arg1 = 28013, 
         Arg3 = 28131, 
      }, 
      [57] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 10, 
         Arg1 = 28013, 
         Arg3 = 28131, 
      }, 
      [58] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 41, 
         Arg1 = 28001, 
         Arg3 = 28133, 
      }, 
      [59] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 41, 
         Arg1 = 28001, 
         Arg3 = 28145, 
      }, 
      [60] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 41, 
         Arg1 = 28001, 
         Arg3 = 28150, 
      }, 
      [61] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 41, 
         Arg1 = 28001, 
         Arg3 = 28150, 
      }, 
      [62] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 41, 
         Arg1 = 28001, 
         Arg3 = 28151, 
      }, 
      [63] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 41, 
         Arg1 = 28001, 
         Arg3 = 28151, 
      }, 
      [64] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 41, 
         Arg1 = 28001, 
         Arg3 = 28151, 
      }, 
      [65] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 41, 
         Arg1 = 28001, 
         Arg3 = 28151, 
      }, 
      [66] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 41, 
         Arg1 = 28001, 
         Arg3 = 28151, 
      }, 
      [67] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 41, 
         Arg1 = 28001, 
         Arg3 = 28151, 
      }, 
      [68] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 41, 
         Arg1 = 28001, 
         Arg3 = 28151, 
      }, 
      [69] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 41, 
         Arg1 = 28001, 
         Arg3 = 28151, 
      }, 
      [70] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 41, 
         Arg1 = 28001, 
         Arg3 = 28152, 
      }, 
      [71] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 28018, 
         Arg3 = 28154, 
      }, 
      [72] = 
      {
         Command = "G", 
         Arg1 = 10313, 
         Arg2 = 1, 
         MiscData = 1, 
      }, 
      [73] = 
      {
         Command = "G", 
         Arg1 = 25, 
         Arg2 = 1, 
         MiscData = 1, 
      }, 
      [74] = 
      {
         Command = "G", 
         Arg1 = 10317, 
         Arg2 = 1, 
         MiscData = 1, 
      }, 
      [75] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 28017, 
         Arg3 = 28155, 
      }, 
      [76] = 
      {
         Command = "G", 
         Arg1 = 32253, 
         Arg2 = 1, 
         MiscData = 1, 
      }, 
      [77] = 
      {
         Command = "G", 
         Arg1 = 10314, 
         Arg2 = 1, 
         MiscData = 1, 
      }, 
      [78] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 28019, 
         Arg3 = 28156, 
      }, 
      [79] = 
      {
         Command = "G", 
         Arg1 = 28020, 
         Arg2 = 1, 
         MiscData = 1, 
      }, 
      [80] = 
      {
         Command = "G", 
         Arg1 = 28004, 
         Arg2 = 1, 
         MiscData = 1, 
      }, 
      [81] = 
      {
         Command = "G", 
         Arg1 = 28006, 
         Arg2 = 1, 
         MiscData = 1, 
      }, 
      [82] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 41, 
         Arg1 = 28001, 
         Arg3 = 28156, 
      }, 
      [83] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 41, 
         Arg1 = 28001, 
         Arg3 = 28156, 
      }, 
      [84] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 41, 
         Arg1 = 28001, 
         Arg3 = 28157, 
      }, 
      [85] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 41, 
         Arg1 = 28001, 
         Arg3 = 28158, 
      }, 
      [86] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 28023, 
         Arg3 = 28159, 
      }, 
      [87] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 41, 
         Arg1 = 28001, 
         Arg3 = 28160, 
      }, 
      [88] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 41, 
         Arg1 = 28001, 
         Arg3 = 28160, 
      }, 
      [89] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 28004, 
         Arg3 = 28168, 
      }, 
      [90] = 
      {
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 28007, 
         Arg3 = 28168, 
      }, 
      [91] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 28012, 
         Arg3 = 28181, 
      }, 
      [92] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 28015, 
         Arg3 = 6, 
      }, 
      [93] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 28016, 
         Arg3 = 8, 
      }, 
      [94] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 28017, 
         Arg3 = 14, 
      }, 
      [95] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 28011, 
         Arg3 = 13, 
      }, 
      [96] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 28017, 
         Arg3 = 15, 
      }, 
      [97] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 28009, 
         Arg3 = 5, 
      }, 
      [98] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 28024, 
         Arg3 = 3, 
      }, 
      [99] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 28024, 
         Arg3 = 4, 
      }, 
      [100] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 28025, 
         Arg3 = 16, 
      }, 
      [101] = 
      {
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 28026, 
         Arg3 = 28183, 
      }, 
      [102] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 28009, 
         Arg3 = 28186, 
      }, 
      [103] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 28008, 
         Arg3 = 5, 
      }, 
      [104] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 28011, 
         Arg3 = 13, 
      }, 
      [105] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 28015, 
         Arg3 = 6, 
      }, 
      [106] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 28016, 
         Arg3 = 8, 
      }, 
      [107] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 28017, 
         Arg3 = 14, 
      }, 
      [108] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 28120, 
         Arg3 = 3, 
      }, 
      [109] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 28017, 
         Arg3 = 15, 
      }, 
      [110] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 28020, 
         Arg3 = 16, 
      }, 
      [111] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 28020, 
         Arg3 = 18, 
      }, 
      [112] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 41, 
         Arg1 = 28001, 
         Arg3 = 28189, 
      }, 
      [113] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 41, 
         Arg1 = 28001, 
         Arg3 = 28191, 
      }, 
      [114] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 41, 
         Arg1 = 28001, 
         Arg3 = 28191, 
      }, 
      [115] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 41, 
         Arg1 = 28001, 
         Arg3 = 28193, 
      }, 
      [116] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 41, 
         Arg1 = 28001, 
         Arg3 = 28195, 
      }, 
      [117] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 28016, 
         Arg3 = 28196, 
      }, 
      [118] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 41, 
         Arg1 = 28001, 
         Arg3 = 28196, 
      }, 
      [119] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 41, 
         Arg1 = 28001, 
         Arg3 = 28196, 
      }, 
      [120] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 41, 
         Arg1 = 28001, 
         Arg3 = 28196, 
      }, 
      [121] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 41, 
         Arg1 = 28001, 
         Arg3 = 28197, 
      }, 
      [122] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 41, 
         Arg1 = 28001, 
         Arg3 = 28197, 
      }, 
      [123] = 
      {
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 28014, 
         Arg3 = 28197, 
      }, 
      [124] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 41, 
         Arg1 = 28001, 
         Arg3 = 28198, 
      }, 
      [125] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 41, 
         Arg1 = 28001, 
         Arg3 = 28198, 
      }, 
      [126] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 41, 
         Arg1 = 28001, 
         Arg3 = 28198, 
      }, 
      [127] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 41, 
         Arg1 = 28001, 
         Arg3 = 28198, 
      }, 
      [128] = 
      {
         Command = "M", 
         MiscData = 0, 
         Arg2 = 30, 
         Arg1 = 28025, 
         Arg3 = 28003, 
      }, 
      [129] = 
      {
         Command = "M", 
         MiscData = 0, 
         Arg2 = 30, 
         Arg1 = 28025, 
         Arg3 = 28128, 
      }, 
      [130] = 
      {
         Command = "M", 
         MiscData = 0, 
         Arg2 = 30, 
         Arg1 = 28025, 
         Arg3 = 28148, 
      }, 
      [131] = 
      {
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 28021, 
         Arg3 = 28038, 
      }, 
      [132] = 
      {
         Command = "P", 
         MiscData = 0, 
         Arg2 = 1, 
         Arg1 = 28022, 
         Arg3 = 0, 
      }, 
      [133] = 
      {
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 28023, 
         Arg3 = 28038, 
      }, 
   }, 
   Rooms = 
   {
      [28160] = 
      {
         Description = "This is a small hut. Its main purpose in life is to shealter the males\
from the rain or the harsh rays of the afternoon sun. The Hut is made\
from wood scavenged from the near by forest and held together with\
mud and clay. It is also stune with blankets and there is the odd\
hamock streched out from wall to post here and there. \
", 
         TeleVnum = 0, 
         Vnum = 28160, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "A hut.", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28151, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28161] = 
      {
         Description = "This is a small hut. Its main purpose in life is to shealter the males\
from the rain or the harsh rays of the afternoon sun. The Hut is made\
from wood scavenged from the near by forest and held together with\
mud and clay. It is also stune with blankets and there is the odd\
hamock streched out from wall to post here and there. \
", 
         TeleVnum = 0, 
         Vnum = 28161, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "A hut.", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28151, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28162] = 
      {
         Description = "This is a small hut. Its main purpose in life is to shealter the males\
from the rain or the harsh rays of the afternoon sun. The Hut is made\
from wood scavenged from the near by forest and held together with\
mud and clay. It is also stune with blankets and there is the odd\
hamock streched out from wall to post here and there. \
", 
         TeleVnum = 0, 
         Vnum = 28162, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "A hut.", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28151, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28163] = 
      {
         Description = "The Gamorrean deset stretches on for miles. It is hot and you start to\
sweat almost immediatly. You can see the odd cactus here and there,\
as well as  the odd corpino scurrying past you in search of some\
shade. The relentless sun beats down on you neck causeing you to\
start gasping for some water, it is a wonder how anything could\
possibly live in such a harsh enviornment, but then again the\
gamorreans are a harsh people.\
", 
         TeleVnum = 0, 
         Vnum = 28163, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert plains of Gamorr.", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28127, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28164, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28164] = 
      {
         Description = "The Gamorrean deset stretches on for miles. It is hot and you start to\
sweat almost immediatly. You can see the odd cactus here and there,\
as well as  the odd corpino scurrying past you in search of some\
shade. The relentless sun beats down on you neck causeing you to\
start gasping for some water, it is a wonder how anything could\
possibly live in such a harsh enviornment, but then again the\
gamorreans are a harsh people. \
", 
         TeleVnum = 0, 
         Vnum = 28164, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert plains.", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28165, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28163, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28165] = 
      {
         Description = "The Gamorrean deset stretches on for miles. It is hot and you start to\
sweat almost immediatly. You can see the odd cactus here and there,\
as well as  the odd corpino scurrying past you in search of some\
shade. The relentless sun beats down on you neck causeing you to\
start gasping for some water, it is a wonder how anything could\
possibly live in such a harsh enviornment, but then again the\
gamorreans are a harsh people. \
", 
         TeleVnum = 0, 
         Vnum = 28165, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Desert path.", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28025, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28164, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28166, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28166] = 
      {
         Description = "You are standing on what might have been, at one point, a very well\
put together walkway, but over time has eroded to a few stones the\
have with stood the test of time and seem to be on there last legs,\
since the elements here, at times, sand blast everything that stands\
and leaves it in a crumbling mass of useless rubble. The path turns\
and you notice ahead that it keeps twisting and turning. You aren't\
sure if it was made that way or if it was one time a large and\
straight path. \
", 
         TeleVnum = 0, 
         Vnum = 28166, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "An eroding walkway.", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28167, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28165, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28167] = 
      {
         Description = "You are standing on what might have been, at one point, a very well\
put together walkway, but over time has eroded to a few stones the\
have with stood the test of time and seem to be on there last legs,\
since the elements here, at times, sand blast everything that stands\
and leaves it in a crumbling mass of useless rubble. The path turns\
and you notice ahead that it keeps twisting and turning. You aren't\
sure if it was made that way or if it was one time a large and\
straight path. \
", 
         TeleVnum = 0, 
         Vnum = 28167, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "More of the eroding walkway.", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28166, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28168, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28168] = 
      {
         Description = "You are standing on what might have been, at one point, a very well\
put together walkway, but over time has eroded to a few stones the\
have with stood the test of time and seem to be on there last legs,\
since the elements here, at times, sand blast everything that stands\
and leaves it in a crumbling mass of useless rubble. The path turns\
and you notice ahead that it keeps twisting and turning. You aren't\
sure if it was made that way or if it was one time a large and\
straight path. \
", 
         TeleVnum = 0, 
         Vnum = 28168, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "End of the walkway.", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28167, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28169, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28169] = 
      {
         Description = "You stand in front of an old entrance, once you look through it you\
see nothing but more desert and the odd post of what might have been\
at one time an old house. You come to the conclusion that this at one\
point was the plains area abut has now been over taken by the\
constant shifting sands of the relentless desert. In due time all teh\
plains will be just like this barren and devoid of semi intellegent\
life... \
", 
         TeleVnum = 0, 
         Vnum = 28169, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Entrance to the Desert town.", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28168, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28170] = 
      {
         Description = "The mud bubbles and gurggles all around you, the bubbles tickling you as\
they rise to the top. The mud is very refreshing to your aches and pains\
and seems  to ease all the sores you have accumulated from your travels.\
The only problem is, There are other gamorreans here with you and you\
don't know if the bubbles are from the underground or from them, and the\
slight smell is starting to make you wonder. \
", 
         TeleVnum = 0, 
         Vnum = 28170, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               MudProgType = "rand_prog", 
               Code = "mpechoat $n The soothing mud eases your pain.\
feel heal $n\
", 
            }, 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Mud Hole", 
         Exits = 
         {
            [1] = 
            {
               Direction = "somewhere", 
               Key = -1, 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [11] = "Hidden", 
               }, 
               DestinationVnum = 28036, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28171] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 28171, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "floating in the void", 
         Exits = 
         {
         }, 
         Sector = "city", 
      }, 
      [28172] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 28172, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "floating in the void", 
         Exits = 
         {
         }, 
         Sector = "city", 
      }, 
      [28173] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 28173, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "floating in the void", 
         Exits = 
         {
         }, 
         Sector = "city", 
      }, 
      [28174] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 28174, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "floating in the void", 
         Exits = 
         {
         }, 
         Sector = "city", 
      }, 
      [28175] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 28175, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "floating in the void", 
         Exits = 
         {
         }, 
         Sector = "city", 
      }, 
      [28176] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 28176, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "floating in the void", 
         Exits = 
         {
         }, 
         Sector = "city", 
      }, 
      [28177] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 28177, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "floating in the void", 
         Exits = 
         {
         }, 
         Sector = "city", 
      }, 
      [28178] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 28178, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "floating in the void", 
         Exits = 
         {
         }, 
         Sector = "city", 
      }, 
      [28179] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 28179, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "floating in the void", 
         Exits = 
         {
         }, 
         Sector = "city", 
      }, 
      [28180] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 28180, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "floating in the void", 
         Exits = 
         {
         }, 
         Sector = "city", 
      }, 
      [28181] = 
      {
         Description = "You are standing in the infamous Zicreex. Which is owned by Ugmush and\
it has a slight stench to it, could possible be from her husbands as\
well as the other ship men she has to maintain can help pilot her\
beloved ship. It isn't exactlly the best of ships but how often do\
you get to sit in a Gamorrean Cube ship?\
", 
         TeleVnum = 0, 
         Vnum = 28181, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Inside the Zicreex", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28183, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28182, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "somewhere", 
               Key = -1, 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [11] = "Hidden", 
               }, 
               DestinationVnum = 28038, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28182] = 
      {
         Description = "This is the cockpit of the Zicreex. it isn't as bad as it seems to be\
from outside appearences, it does get its passengers from a to b with\
very little problems. The lights on the controls blink on and off and\
you here some bits and pieces of communication going back and forth\
over the comm system.\
", 
         TeleVnum = 0, 
         Vnum = 28182, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Cockpit", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28181, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28183] = 
      {
         Description = "This is where the crew put all its scavenge good the score from debris\
the find floating around in space, mostly from destroyed ships and\
such. There are bits and pieces of useless scraps cluttering the\
floor here.\
", 
         TeleVnum = 0, 
         Vnum = 28183, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Large storage compartment", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28181, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28184] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 28184, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "floating in the void", 
         Exits = 
         {
         }, 
         Sector = "city", 
      }, 
      [28185] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 28185, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "floating in the void", 
         Exits = 
         {
         }, 
         Sector = "city", 
      }, 
      [28186] = 
      {
         Description = "This Path is almost impossible to notice due to the lack of traffic\
flowing to the mountains. You sit and wonder why the Gammoreans\
wouldn'y use the path and come to the conclusion that maybe there is\
another clan up in the mountains and this might not be the season for\
the wars in fact as you look up the path you notice there is some\
spires of smoke rising from what you think could be home fires\
burning.\
", 
         TeleVnum = 0, 
         Vnum = 28186, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Pathway to the Mountains", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28187, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "northeast", 
               Key = -1, 
               DestinationVnum = 28110, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28187] = 
      {
         Description = "The trail is scattered with pebbels and bits of grass and wild\
flowers, you also see insects scurrying out of you way as well as the\
odd foot print leading up to what seems to be a mountain village. As\
you keep ascending the mountain the smells and sounds of village\
living gets stronger and stronger ecspecially the smells peewww it\
stinks. but you plug you nose and stick to the trail and keep\
climbing.\
", 
         TeleVnum = 0, 
         Vnum = 28187, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Mountain trail.", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28186, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 28188, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28188] = 
      {
         Description = "The trail is scattered with pebbels and bits of grass and wild\
flowers, you also see insects scurrying out of you way as well as the\
odd foot print leading up to what seems to be a mountain village. As\
you keep ascending the mountain the smells and sounds of village\
living gets stronger and stronger ecspecially the smells peewww it\
stinks. but you plug you nose and stick to the trail and keep\
climbing.\
", 
         TeleVnum = 0, 
         Vnum = 28188, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Steep path.", 
         Exits = 
         {
            [1] = 
            {
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 28189, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 28187, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28189] = 
      {
         Description = "You can see for miles when you look over the ledge. In the distance\
you can see lush rain forests, further south you see a vast desert as\
well as the Huntbird in the village below While you were admiring the\
view, You completly forgot to check the stability of the ledge and it\
doesn't look to strong, you can notice a huge crack about three feet\
behind you where the ledge looks like it is about to colapse. Maybe\
you should get to safer ground.\
", 
         TeleVnum = 0, 
         Vnum = 28189, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Cliff Ledge", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28190, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28191, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 28188, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28190] = 
      {
         Description = "While admiring the view, you completly forgot to check the stablity of\
the cliff. You feel a slight rumble, and the lip of the cliff gives\
way to ou weight you fall for hundreds of feet clipping your head off\
of large rock jutting out from the cliff face. Trying to save\
yourself you try to grab for a anything else  that might be sticking\
out but you hit your head again and the light go out.\
 \
YOU ARE DEAD......\
 \
", 
         TeleVnum = 0, 
         Vnum = 28190, 
         Flags = 
         {
            [1] = "_Reserved", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Weak Cliff Lip", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28189, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28191] = 
      {
         Description = "You can see alomost the whole planet from here, it looks great. You\
have a cool breeze blowing past you face making you feel refreshed\
after that long climb you can here what sounds like gamorreans\
getting ready to do something, you have no idea what, but it sounds\
very important or dangerous the way they sound. \
", 
         TeleVnum = 0, 
         Vnum = 28191, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Cliff Ledge", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28189, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28192, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28192] = 
      {
         Description = "You can see alomost the whole planet from here, it looks great. You\
have a cool breeze blowing past you face making you feel refreshed\
after that long climb you can here what sounds like gamorreans\
getting ready to do something, you have no idea what, but it sounds\
very important or dangerous the way they sound. \
", 
         TeleVnum = 0, 
         Vnum = 28192, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Cliff Ledge", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28193, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28191, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28193] = 
      {
         Description = "Now you can see where all the noise was comeing from. The mountain\
clan seems to be in a bit of a tizzy, something seems to have come\
into their area, and they don't seem to be happy about it, some even\
look afraid at what has invaded their homes, and it seems to be\
around the mine shaft that is in the center of  the village .\
", 
         TeleVnum = 0, 
         Vnum = 28193, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Mountain Pathway", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28194, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28192, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28194] = 
      {
         Description = "You are standing in the entrance and no gamorrean seems to have\
noticed you, They are far to busy trying to rid themselve of this\
small problem that it has left them open to unwanted visitors. From\
the mine shaft in the ground you hear a viscious groweling and it\
doesn't sound to pleasent to teh ears. You have heard of the Gurdas\
that have been known to snatch the odd child from its cribs and now\
it seems you are gonna witness one from a distance.\
", 
         TeleVnum = 0, 
         Vnum = 28194, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Entrance to the Mountain Clan", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28195, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28193, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28195] = 
      {
         Description = "The village is in chaos, there seems to be only one gamorrean with his\
thoughts straight and the is the shammon to the south. The groweling\
is still very  loud and promenent as still very viscious. Hear the\
scream of a child as it sound as if it has been captured by a gurda.\
You think and hope to yourself  that they dont hunt in packs cause\
then this place could be surrounded by them.  the thought sends\
shivers up and down you spine..\
", 
         TeleVnum = 0, 
         Vnum = 28195, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Path in the Clan Village", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28198, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28194, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 28196, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28196] = 
      {
         Description = "This is the home to the Gamorreans only known shammon, he has his\
place in good order for a Gamorrean, and the smell isn't as bad as\
you had the pleaseue of smelling in the main village. The Shammon has\
an assortment of small trinkets lying around his abode everything\
from small and large gems to the odd credit and you think you see a\
hilt of some sort but, that would not be a surprise even for a\
Gamorrean of his age.\
", 
         TeleVnum = 0, 
         Vnum = 28196, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Small Cave Entrance", 
         Exits = 
         {
            [1] = 
            {
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 28195, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28197] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 28197, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Large Cave Entrance", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 28198, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28198] = 
      {
         Description = "The chaos and the groweling is getting worse as time goes on, you see\
of blood comeing from the cave and going north and you also see a\
babies little booty in the trail, seems like the panic has its\
reasons, something has got a baby and it is most likely a gurda that\
has it too. The mother is standing here screaming for her babies safe\
return, she's looking at you as if you might be the only one who can\
do it.\
", 
         TeleVnum = 0, 
         Vnum = 28198, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Mountain Path", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28199, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28195, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 28197, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28199] = 
      {
         Description = "You walk along a mountain pass there are steep ledges all around you.\
The path you are on seems sturdy though if not carefull you could get\
harmed. There are some large boulders around the path that could\
start a cool rock slide at anytime. Birds are cherping in the\
distance and there are soem other animals making noise around you.\
", 
         TeleVnum = 0, 
         Vnum = 28199, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Mountain Path", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28000, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28198, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28000] = 
      {
         Description = "You walk along a mountain pass there are steep ledges all around you. The path \
you are on seems sturdy though if not carefull you could get harmed. There are \
some large boulders around the path that could start a cool rock slide at\
anytime. Birds are cherping in the distance and there are soem other animals\
making noise around you.\
", 
         TeleVnum = 0, 
         Vnum = 28000, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Mountain Path", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28001, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28199, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28001] = 
      {
         Description = "You have finaly reached the center of the chaos, everyone is holding\
spears and wielding axes and looking down what looks to be an\
abandoned mine, the source of the growling and the squeals of an\
injured and scared baby. The sounds pull on your hart and a tear\
trickles down you cheeck as you feel the urge to help the baby and\
destroy the evil gurda that has absolutly no care for the child.\
", 
         TeleVnum = 0, 
         Vnum = 28001, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Mountain Path", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28000, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 28002, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 28004, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28002] = 
      {
         Description = "You Stand in front of a rather large cave that the Alpha female has\
designated as her own, It is really big, it reminds you of a black\
hole. When the wind blows past the opening it makes a rather eriy\
howl that make your skin crawl with fear for some strange reason.\
Strangly though, no one is around here, they all seem to be\
preoccupied with the gurda and the baby, leaveing the large cave\
defenseless.\
", 
         TeleVnum = 0, 
         Vnum = 28002, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Steep Trail", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 28003, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 28001, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28003] = 
      {
         Description = "This is the cave of the mountain clans matron. It seems to be a little\
messed up, there is what looks like would be the nest of a gurda on\
the floor, could it be the she owns the gurda?, it would make sense\
since only the matron is allowd to have childern and no other female\
can because the would defeat the purpose of haveing the social\
structure the gamorreans have adopted as their own. You come to the\
conclusion that the matron sent the gurda after the other females\
child, to kill t or to bring it back, only the matron knows.\
", 
         TeleVnum = 0, 
         Vnum = 28003, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Alpha-Cave", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 28002, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28004] = 
      {
         Description = "There is a very weak wooden ledge here, it doesn't look as if it is\
able to support the weight of anything your size. The boards start to\
groan under your feet and you start to here them snap and crack,\
splinters of wood start to fly through the air and you here a snap as\
they give way\
", 
         TeleVnum = 0, 
         Vnum = 28004, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Mine Shaft", 
         Exits = 
         {
            [1] = 
            {
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 28001, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "down", 
               Key = -1, 
               Flags = 
               {
                  [16] = "CanClimb", 
               }, 
               DestinationVnum = 28005, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28005] = 
      {
         Description = "There is a very weak wooden ledge here, it doesn't look as if it is\
able to support the weight of anything your size. The boards start to\
groan under your feet and you start to here them snap and crack,\
splinters of wood start to fly through the air and you here a snap as\
they give way\
", 
         TeleVnum = 0, 
         Vnum = 28005, 
         Flags = 
         {
            [0] = "Dark", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Mine Shaft", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28031, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 28004, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "down", 
               Key = -1, 
               Flags = 
               {
                  [16] = "CanClimb", 
               }, 
               DestinationVnum = 28006, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28006] = 
      {
         Description = "There is a very weak wooden ledge here, it doesn't look as if it is\
able to support the weight of anything your size. The boards start to\
groan under your feet and you start to here them snap and crack,\
splinters of wood start to fly through the air and you here a snap as\
they give way\
", 
         TeleVnum = 0, 
         Vnum = 28006, 
         Flags = 
         {
            [0] = "Dark", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Mine Shaft", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28032, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 28005, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "down", 
               Key = -1, 
               Flags = 
               {
                  [16] = "CanClimb", 
               }, 
               DestinationVnum = 28007, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28007] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 28007, 
         Flags = 
         {
            [0] = "Dark", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Bottom of the Shaft.", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28033, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 28006, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28008] = 
      {
         Description = "You are standing in the Gamorr safe house. Far to the south\
you can here the loud chatter of fellow visitors and natives\
takeing time out and haveing some refreshments to easy the \
pressure of everyday life.\
", 
         TeleVnum = 0, 
         Vnum = 28008, 
         Flags = 
         {
            [10] = "Safe", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Entrance to a Corridor.", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28100, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28009, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28009] = 
      {
         Description = "This is one long and straight corridor, its very well kept\
and from the sounds of it, very peaceful meaning no sounds \
of fighting what so ever. This is good new, cause now you\
can really sit back and relax.\
", 
         TeleVnum = 0, 
         Vnum = 28009, 
         Flags = 
         {
            [10] = "Safe", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Long corridor.", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28008, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28010, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28010] = 
      {
         Description = "This is one long and straight corridor, its very well kept\
and from the sounds of it, very peaceful meaning no sounds \
of fighting what so ever. This is good new, cause now you\
can really sit back and relax.\
", 
         TeleVnum = 0, 
         Vnum = 28010, 
         Flags = 
         {
            [10] = "Safe", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Long corridor.", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28009, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28011, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28011] = 
      {
         Description = "The lounge is very nicely built. It is very large, with tables\
spread in a nice orderly fashion. The tabels themselves are \
quite a sight to see, they are all supported by large beams of\
dark blue light which comes from the floor and into the ceiling.\
There is a refreshments stand that stands in the middle of the\
whole area.\
", 
         TeleVnum = 0, 
         Vnum = 28011, 
         Flags = 
         {
            [23] = "Hotel", 
            [10] = "Safe", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Lounge area", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28010, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28038, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28015, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28012, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28012] = 
      {
         Description = "The lounge has a very relaxed atmosphere, with soft music playing\
and quiet conversations going on here and there. You stand here\
waiting for a waitress, and during this time you take a look\
at some of the patrons here, and notice that they seem to be very\
friendly people, all have smiles and are very relaxed you too\
decide its time to have a drink and a rest.\
", 
         TeleVnum = 0, 
         Vnum = 28012, 
         Flags = 
         {
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Lounge area", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28013, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28011, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28016, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28013] = 
      {
         Description = "The lounge has a very relaxed atmosphere, with soft music playing\
and quiet conversations going on here and there. You stand here\
waiting for a waitress, and during this time you take a look\
at some of the patrons here, and notice that they seem to be very\
friendly people, all have smiles and are very relaxed you too\
decide its time to have a drink and a rest.\
", 
         TeleVnum = 0, 
         Vnum = 28013, 
         Flags = 
         {
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Lounge area", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28014, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28012, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28016, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28014] = 
      {
         Description = "The lounge has a very relaxed atmosphere, with soft music playing\
and quiet conversations going on here and there. You stand here\
waiting for a waitress, and during this time you take a look\
at some of the patrons here, and notice that they seem to be very\
friendly people, all have smiles and are very relaxed you too\
decide its time to have a drink and a rest.\
", 
         TeleVnum = 0, 
         Vnum = 28014, 
         Flags = 
         {
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Lounge area", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28016, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28015, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28013, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28015] = 
      {
         Description = "The lounge has a very relaxed atmosphere, with soft music playing\
and quiet conversations going on here and there. You stand here\
waiting for a waitress, and during this time you take a look\
at some of the patrons here, and notice that they seem to be very\
friendly people, all have smiles and are very relaxed you too\
decide its time to have a drink and a rest.\
", 
         TeleVnum = 0, 
         Vnum = 28015, 
         Flags = 
         {
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Lounge area", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28011, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28016, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28014, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28016] = 
      {
         Description = "This is a nicely put together stand, as far as stands go, because\
it is made from a rare wood not found anywhere on this planet\
and it has been very well cut aswell as the designs cut into it\
make it seem as though it has a little story scrolling across its \
edge. The stand has a nice odour to it, due to the variety of drinks\
and snacks that are being sold to its patrons.\
", 
         TeleVnum = 0, 
         Vnum = 28016, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Refreshments Stand.", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28012, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28013, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28014, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28015, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28017] = 
      {
         Description = "The Forest seems to go on forever. A slight breeze seduces your nose\
with its beautiful armoas and cool touch, Wild birds, of some kind\
fill the air with a musical ensamble like you never heard before. but\
deep in the forest you hey the preditors of the  land hunting and\
capturing their prey and the prey scream their last breath. You can\
also hear the beast haveing a feast of some sort might be a good\
chance to sneak up on one and catch a glimps of what the ferocious\
beast look like, but you remember warnings of caution and be ready to\
run at the drop of a hat these, beast are nothing to be messed with.\
", 
         TeleVnum = 0, 
         Vnum = 28017, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Deep in the Forest.", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28018, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28120, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28018] = 
      {
         Description = "The forest seems to go on forever, the breeze still blow on you face\
and the sounds of the wild surround you. You also notice that the\
forest is getting thicker and thicker as well as darker and darker.\
You notice red eyes peeking at you from behind trees and under roots.\
The smell of rotting flesh mixed with rotting vegitables hits your\
nose, you can just barely see you hand in front of your face its\
getting darker You light up your flashlight and hear the hidden\
creaturs flee from the sudden brightness and you feel as if you have\
just lit up a bright sigh flashing free fresh meat come and get it!!\
", 
         TeleVnum = 0, 
         Vnum = 28018, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "The Darkend Forest.", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28017, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "northwest", 
               Key = -1, 
               DestinationVnum = 28019, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28019] = 
      {
         Description = "The forest seems to go on forever, the breeze still blow on you face\
and the sounds of the wild surround you. You also notice that the\
forest is getting thicker and thicker as well as darker and darker.\
You notice red eyes peeking at you from behind trees and under roots.\
The smell of rotting flesh mixed with rotting vegitables hits your\
nose, you can just barely see you hand in front of your face its\
getting darker You light up your flashlight and hear the hidden\
creaturs flee from the sudden brightness and you feel as if you have\
just lit up a bright sigh flashing free fresh meat come and get it!!\
", 
         TeleVnum = 0, 
         Vnum = 28019, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Uncharted Forest area.", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28036, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28020, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "southeast", 
               Key = -1, 
               DestinationVnum = 28018, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28020] = 
      {
         Description = "The forest seems to go on forever, the breeze still blow on you face\
and the sounds of the wild surround you. You also notice that the\
forest is getting thicker and thicker as well as darker and darker.\
You notice red eyes peeking at you from behind trees and under roots.\
The smell of rotting flesh mixed with rotting vegitables hits your\
nose, you can just barely see you hand in front of your face its\
getting darker You light up your flashlight and hear the hidden\
creaturs flee from the sudden brightness and you feel as if you have\
just lit up a bright sigh flashing free fresh meat come and get it!!\
", 
         TeleVnum = 0, 
         Vnum = 28020, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Forest Ravine", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28019, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 28021, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28021] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 28021, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Sudden Drop off.", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 28020, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28022] = 
      {
         Description = "The Forest seems to go on forever. A slight breeze seduces your nose\
with its beautiful armoas and cool touch, Wild birds, of some kind\
fill the air with a musical ensamble like you never heard before. but\
deep in the forest you hey the preditors of the  land hunting and\
capturing their prey and the prey scream their last breath. You can\
also hear the beast haveing a feast of some sort might be a good\
chance to sneak up on one and catch a glimps of what the ferocious\
beast look like, but you remember warnings of caution and be ready to\
run at the drop of a hat, these beasts are nothing to be messed with.\
", 
         TeleVnum = 0, 
         Vnum = 28022, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Deep in the forest.", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28137, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28023, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "northwest", 
               Key = -1, 
               DestinationVnum = 28036, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28023] = 
      {
         Description = "The Forest seems to go on forever. A slight breeze seduces your nose\
with its beautiful armoas and cool touch, Wild birds, of some kind\
fill the air with a musical ensamble like you never heard before. but\
deep in the forest you hey the preditors of the land hunting and\
capturing their prey and the prey scream their last breath. You can\
also hear the beast haveing a feast of some sort might be a good\
chance to sneak up on one and catch a glimps of what the ferocious\
beast look like, but you remember warnings of caution and be ready to\
run at the drop of a hat, these beasts are nothing to be messed with.\
", 
         TeleVnum = 0, 
         Vnum = 28023, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Near the Edge of a Ravine", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28022, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 28024, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28024] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 28024, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Sudden Drop.", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 28023, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28025] = 
      {
         Description = "The Gamorrean deset stretches on for miles. It is hot and you start to\
sweat almost immediatly. You can see the odd cactus here and there,\
as well as  the odd corpino scurrying past you in search of some\
shade. The relentless sun beats down on you neck causeing you to\
start gasping for some water, it is a wonder how anything could\
possibly live in such a harsh enviornment, but then again the\
gamorreans are a harsh people. \
", 
         TeleVnum = 0, 
         Vnum = 28025, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "The Desert.", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28165, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "northeast", 
               Key = -1, 
               DestinationVnum = 28026, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28026] = 
      {
         Description = "The Gamorrean deset stretches on for miles. It is hot and you start to\
sweat almost immediatly. You can see the odd cactus here and there,\
as well as  the odd corpino scurrying past you in search of some\
shade. The relentless sun beats down on you neck causeing you to\
start gasping for some water, it is a wonder how anything could\
possibly live in such a harsh enviornment, but then again the\
gamorreans are a harsh people.\
", 
         TeleVnum = 0, 
         Vnum = 28026, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Deep in the Gamorr Desert.", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28027, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28028, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "southwest", 
               Key = -1, 
               DestinationVnum = 28025, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28027] = 
      {
         Description = "You have completly lost you way. You cant seem to get you dirctions\
straight, everything  is looking the same to you you think you see a\
path to your right, you go to it and it vanishes you start\
hallucinating you see fire all around you, you collapse to you knees \
you dying of thirst, your water is empty you food is gone, you feel\
tired, you see your pillow you used to have when you were a child as\
well as you bed right in front of you you decide it is a nice time to\
go to sleep, mom will wake you up in the morning...  \
 \
You never wake up again.....\
 \
", 
         TeleVnum = 0, 
         Vnum = 28027, 
         Flags = 
         {
            [1] = "_Reserved", 
            [2] = "NoMob", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Lost in The Deserts of Gamorr.", 
         Exits = 
         {
         }, 
         Sector = "city", 
      }, 
      [28028] = 
      {
         Description = "You are standing in the infamous land of no return. It would be in\
your best interests to turn back now, it has earned its name and has\
never give up any of its helpless wonderers, and anyone who dares to\
enter find out fast how deadly the sink holes can be and even the\
desert creatures seem to be avoiding this area it would be a good\
idea if you followed their example. \
", 
         TeleVnum = 0, 
         Vnum = 28028, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "The Land of no Return.", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28029, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28030, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28026, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28029] = 
      {
         Description = "You are standing on the soft sands of the land of no return. The gound\
seems to open up  right under you and you start to slowly sink down.\
You try to grasp for something  but there is nothing to hold except\
for the sand itself. You life flashes before your eyes. the sand is\
now up to your neck, it slowly move to your chin and eventually your\
mouth where you ingest a mouthful. You try to gasp for breath but\
fill you lungs with the hot sands.\
", 
         TeleVnum = 0, 
         Vnum = 28029, 
         Flags = 
         {
            [24] = "NoFloor", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "A SINK HOLE!!", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28028, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 28131, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28030] = 
      {
         Description = "You are standing in the infamous land of no return. It would be in\
your best interests to turn back now, it has earned its name and has\
never give up any of its helpless wonderers, and anyone who dares to\
enter find out fast how deadly the sink holes can be and even the\
desert creatures seem to be avoiding this area it would be a good\
idea if you followed their example. \
", 
         TeleVnum = 0, 
         Vnum = 28030, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Sands of the soft Sink Holes.", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28028, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28031] = 
      {
         Description = "The tunnel end abruptly, and the stench from the gurda has filled the\
tunnel with a mind numbing sickening smell that makes you wanna blow\
chunks everywhere, to think that the gamorreans wear the gurdas skin as a\
prize, The tunnel itself is realy to dark to make heads or tails of what\
might be on the walls, from what you can tell  its just cuts made from the\
tools of mining.\
", 
         TeleVnum = 0, 
         Vnum = 28031, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Mine Tunnel", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28005, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28032] = 
      {
         Description = "The tunnel end abruptly, and the stench from the gurda has filled the\
tunnel with a mind numbing sickening smell that makes you wanna blow\
chunks everywhere, to think that the gamorreans wear the gurdas skin as a\
prize, The tunnel itself is realy to dark to make heads or tails of what\
might be on the walls, from what you can tell  its just cuts made from the\
tools of mining.\
", 
         TeleVnum = 0, 
         Vnum = 28032, 
         Flags = 
         {
            [0] = "Dark", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Short tunnel.", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28006, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28033] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 28033, 
         Flags = 
         {
            [0] = "Dark", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Long tunnel.", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28034, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28007, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28034] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 28034, 
         Flags = 
         {
            [0] = "Dark", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "More of the Tunnel.", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28035, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28033, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28035] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 28035, 
         Flags = 
         {
            [0] = "Dark", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "End of the Tunnel.", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28034, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28036] = 
      {
         Description = "The small clearing has a rather large mudhole in it that the gamorreans\
have classified as the sacred land, where no fighting can take place. They\
come here to relax and heal there sore and swollen muscles after a hard\
days battle. The place smells like a sewer on coruscant, but it does look\
inviting.\
", 
         TeleVnum = 0, 
         Vnum = 28036, 
         Flags = 
         {
            [10] = "Safe", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Small Clearing.", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28019, 
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
               DestinationVnum = 28170, 
               Distance = 0, 
               Keyword = "mud hole", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28037] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 28037, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Large Mud Hole.", 
         Exits = 
         {
         }, 
         Sector = "city", 
      }, 
      [28038] = 
      {
         Description = "The landing area is rather large, it looks as though it can hold and\
Imperial Star Destroyer, but how often do you see that. The area has\
the odd small cargo ship parked here and there as well as one or two\
stock light freighters loading and unloading so stuff you don't want\
to get involved with. You even see a ship loading a couple of infant\
Gamorrean watch-beasts with extream caution\
", 
         TeleVnum = 0, 
         Vnum = 28038, 
         Flags = 
         {
            [4] = "CanLand", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Landing Area", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28011, 
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
               DestinationVnum = 28181, 
               Distance = 0, 
               Keyword = "ship zicreex", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28054] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 28054, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Floating in a void", 
         Exits = 
         {
         }, 
         Sector = "city", 
      }, 
      [28100] = 
      {
         Description = "You stand in the entrance to the Wreckage of the Huntbird\
Its is a rather large hunk of junk that even thought its\
real old it seems to be holding up to the elements of the \
planet and has not rusted through. In here you will find\
all the comforts you will need to get rested and or hide\
from aggressive natives or evil visitor that might want\
to do you some harm, don't worry your safe here.\
", 
         TeleVnum = 0, 
         Vnum = 28100, 
         Flags = 
         {
            [10] = "Safe", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "The Huntbird.", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28103, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28008, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 28101, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28101] = 
      {
         Description = "The Upperdeck of the wreck is, well, boring, the walls are empty\
except for the dust the is creatively decorated with finger \
prints and writting simply stateing \"WASH ME!\" other then \
that this is one barren place.\
", 
         TeleVnum = 0, 
         Vnum = 28101, 
         Flags = 
         {
            [10] = "Safe", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Upperdeck of the Huntbird.", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28102, 
               Distance = 0, 
               Keyword = "door", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 28100, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28102] = 
      {
         Description = "Through the cockpit window, you can see for miles, well you\
would be able to if that mountain wasn't in the way! But it \
looks to be a very beautiful planet with lush vegitation\
a desert in the distance and an old man sitting on the floor \
watching everything you do with hauntingly knowing eyes.\
", 
         TeleVnum = 0, 
         Vnum = 28102, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Cockpit.", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               DestinationVnum = 28101, 
               Distance = 0, 
               Keyword = "door", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28103] = 
      {
         Description = "You wonder through the village streets wondering where to go\
the sight here are very pleasant to thte eye, well it would be\
if the Gamorreans would stop fighting to keep the places looking \
helf descent, but other then that the sights here are very \
pleaseing to the eye. The street carries on to the north, east\
and west or you can go south back to the Huntbird.\
", 
         TeleVnum = 0, 
         Vnum = 28103, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Village Street.", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28108, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28104, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28100, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28107, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28104] = 
      {
         Description = "You wonder through the village streets wondering where to go the sight\
here are very pleasant to thte eye, well it would be if the\
Gamorreans would stop fighting to keep the places looking  helf\
descent, but other then that the sights here are very  pleaseing to\
the eye. The street carries on the the south and back to the west, to\
the north is a gamorrean house.\
", 
         TeleVnum = 0, 
         Vnum = 28104, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Village street.", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28105, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28121, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28103, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28105] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 28105, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Gamorrean House Hold.", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28106, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28104, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28106] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 28106, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Backroom.", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28105, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28107] = 
      {
         Description = "You are standing in the the Black smith and leather work shop of the\
village. The smell of burning metals and drying hides fills the air\
in a sickening mixture of sents. There is the shop owner standing\
in the corner of the smithy looking over at some of the things she\
crafted.\
", 
         TeleVnum = 0, 
         Vnum = 28107, 
         Flags = 
         {
            [7] = "NoMagic", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Black Smithy and Leather Workshop.", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28103, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28108] = 
      {
         Description = "Wondering through the street, the strong smell of the male half of\
the Gamorrean race hits your nose like a ton of bricks. It is a \
very strong smell of urine as well as some other stench you really\
aren't to interested in finding out its origins. The street travels\
east, west and north as well as the way you came.\
", 
         TeleVnum = 0, 
         Vnum = 28108, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Village Street.", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28109, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28112, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28103, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28111, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28109] = 
      {
         Description = "The smell from the house you just past still makes your eyes burn,\
The street keeps going north and south but up ahead you notice it\
bend to the southwest. You are unable to see past that distance\
due to the houses and huts blocking your view. You just hope where\
ever this road leads you its to a place that smells better then this\
this village, then again nothing could smell worse then this.\
", 
         TeleVnum = 0, 
         Vnum = 28109, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Village Street.", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28110, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28108, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28110] = 
      {
         Description = "The street doesn't appear to be well used. There are no surounding\
houses or huts that you can see. The area looks to have been abandond\
for some reason that is unknown to you. You can smell the fragrance of\
a variety of different flowers as well as different types of trees, you \
also feel a nice cool breeze brush across your face. Street bends to\
the southwest and leads to a pathway.\
", 
         TeleVnum = 0, 
         Vnum = 28110, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Village Street.", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28109, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "southwest", 
               Key = -1, 
               DestinationVnum = 28186, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28111] = 
      {
         Description = "This pathways seems to be well used by the gammoreans of this tribe.\
You are thankfull that you have gotten away from the fowl odur of the\
males and pray to yourself that you never go through torture like\
that again. You can here the sounds from the main part of the village\
off in the distance as well as the wild birds and other animals that\
make the village there home.\
", 
         TeleVnum = 0, 
         Vnum = 28111, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Village Pathway.", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28108, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28113, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28112] = 
      {
         Description = "The house is filthy and it needs some deoderant sprayed around, now\
you know where the smell from out in the street was coming from PEEW!\
You can't find anything of any interest in here and you feel the stench \
start burning you nostrils and making you stomach spin.\
", 
         TeleVnum = 0, 
         Vnum = 28112, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               MudProgType = "entry_prog", 
               Code = "if race($n) != gamorrean\
mpforce $n puke\
else\
mpforce $n grunt\
endif\
", 
            }, 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "A house.", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28108, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28113] = 
      {
         Description = "You now stand in front of the matrons house of the Plains clan. The\
house is very nice compared to the huts and the other poor excusses\
for houses you've seen so far The trim around the doors and windows\
is a pretty bright pink, the roof is made  of clay that has a pinkish\
hue to it in fact you notice that most of the house is well, pink The\
matron seems to like the colour pink so much that she decided to have\
her house pink after all it is a very femminin colour....\
", 
         TeleVnum = 0, 
         Vnum = 28113, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Front of The Alpha House.", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28111, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28117, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28115, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28114] = 
      {
         Description = "This is the Alph-Females nursery. It smells absolutly fowl with these\
babies squirming  around in their little pens, the stench burns you\
nose nad the squealing is giving you a massive headache, though the\
babies do look a little appatising to you you moral judgment is\
telling you not to eat one but you hunger is telling you whet the\
heck why not!\
", 
         TeleVnum = 0, 
         Vnum = 28114, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Alpha Nursery.", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28115, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28115] = 
      {
         Description = "&Y You look around at the inside of the small house and see that &P\
pink &Y &Y is absolutly everywhere, no matter where you look its &P\
pink &Y this and &P pink &Y that. It for some reason is makeing you\
feel a little nauseaus You hear the sound of babies to the south and\
quite frankly smell them too and to the north looks to be where the\
matron herself stays.\
", 
         TeleVnum = 0, 
         Vnum = 28115, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               MudProgType = "entry_prog", 
               Code = "if race($n) == gamorrean\
mpforce $n comb\
endif\
", 
            }, 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Alpha House", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28116, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28113, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28114, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28116] = 
      {
         Description = "You are standing in the quarters of the Alfa-Female, Ugmush. She is\
well known for her fierceness and she might not be to happy about\
intruders in her home. The house has a semi-pleasent odour to it\
considering the fact that its owned by a Gamorrean. You hear the\
comotion of the children in there bedrooms as well as the  adults\
outside the house.\
", 
         TeleVnum = 0, 
         Vnum = 28116, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Alpha Females Quarters.", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28115, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28117] = 
      {
         Description = "The pathway is hardly used, As you keep walking you can see the mountain is\
the distance getting bigger and bigger as you draw closer to it's base.\
From here you can see the forest crawls up the mountains bottom and\
reaches about one quarter of the way up until it tappers off into a\
spattering of trees here and there.\
", 
         TeleVnum = 0, 
         Vnum = 28117, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "A Pathway in the Village.", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28113, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28118, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28118] = 
      {
         Description = "The pathway is hardly used, As you keep walking you can see the mountain is\
the distance getting bigger and bigger as you draw closer to it's base.\
From here you can see the forest crawls up the mountains bottom and\
reaches about one quarter of the way up until it tappers off into a\
spattering of trees here and there.\
", 
         TeleVnum = 0, 
         Vnum = 28118, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "More of the Path", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28117, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28119, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28119] = 
      {
         Description = "The pathway is hardly used, As you keep walking you can see the mountain is\
the distance getting bigger and bigger as you draw closer to it's base.\
From here you can see the forest crawls up the mountains bottom and\
reaches about one quarter of the way up until it tappers off into a\
spattering of trees here and there.\
", 
         TeleVnum = 0, 
         Vnum = 28119, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "End of the Path", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28118, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28120, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28120] = 
      {
         Description = "The Forest seems to go on forever. A slight breeze seduces your nose\
with its beautiful armoas and cool touch, Wild birds, of some kind\
fill the air with a musical ensamble like you never heard before. but\
deep in the forest you hey the preditors of the  land hunting and\
capturing their prey and the prey scream their last breath. You can\
also hear the beast haveing a feast of some sort might be a good\
chance to sneak up on one and catch a glimps of what the ferocious\
beast look like, but you remember warnings of caution and be ready to\
run at the drop of a hat these, beast are nothing to be messed with.\
", 
         TeleVnum = 0, 
         Vnum = 28120, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "In the Forest.", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28017, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28137, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28119, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28121] = 
      {
         Description = "Wondering through the streets, you notice to the east and west are \
small huts for the males of the tribe. To the south is more of the\
village street. You also see the streets full of various levels of\
females in the hierarchy of the Gamorrean society, you also notice \
that there is no sign of the Alpha Female anywhere to be seen.\
", 
         TeleVnum = 0, 
         Vnum = 28121, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Village Street.", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28104, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28123, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28124, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28122, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28122] = 
      {
         Description = "This is a small hut. Its main purpose in life is to shealter the \
males from the rain or the harsh rays of the afternoon sun. The Hut\
is made from wood scavenged from the near by forest and held \
together with mud and clay. It is also stune with blankets and \
there is the odd hamock streched out from wall to post here and \
there.\
", 
         TeleVnum = 0, 
         Vnum = 28122, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "A hut", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28121, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28123] = 
      {
         Description = "This is a small hut. Its main purpose in life is to shealter the \
males from the rain or the harsh rays of the afternoon sun. The Hut\
is made from wood scavenged from the near by forest and held \
together with mud and clay. It is also stune with blankets and \
there is the odd hamock streched out from wall to post here and \
there.\
", 
         TeleVnum = 0, 
         Vnum = 28123, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "A hut", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28121, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28124] = 
      {
         Description = "Wondering through the streets, you notice to the east and west are\
small huts for the males of the tribe. To the south is more of the\
village street. You also see the streets full of various levels of\
females in the hierarchy of the Gamorrean society, you also notice\
that there is no sign of the Alpha Female anywhere to be seen.\
", 
         TeleVnum = 0, 
         Vnum = 28124, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Village street.", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28121, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28128, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28125, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28130, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28125] = 
      {
         Description = "Wondering through the streets, you notice to the east and west are\
small huts for the males of the tribe. To the south is more of the\
village street. You also see the streets full of various levels of\
females in the hierarchy of the Gamorrean society, you also notice\
that there is no sign of the Alpha Female anywhere to be seen.\
", 
         TeleVnum = 0, 
         Vnum = 28125, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Village Street.", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28124, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28126, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28126] = 
      {
         Description = "You stand at the abrupt end of the village road. Seems as the the\
desert is encroching on the main village and probably has been for a\
very long time. You can feel the heat from the desert even from just\
standing at its edge, and it looks very unforgiving to the happless\
wonderer. Roumors have been floating around that some huge beast\
thing lives out in the desert eatting anything and everything it\
wants and its has been known to wander into the village from time to\
time to snatch the odd gamorrean. \
", 
         TeleVnum = 0, 
         Vnum = 28126, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "End of The road.", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28125, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28127, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28127] = 
      {
         Description = "The Gamorrean deset stretches on for miles. It is hot and you start to\
sweat almost immediatly. You can see the odd cactus here and there,\
as well as  the odd corpino scurrying past you in search of some\
shade. The relentless sun beats down on you neck causeing you to\
start gasping for some water, it is a wonder how anything could\
possibly live in such a harsh enviornment, but then again the\
gamorreans are a harsh people.\
", 
         TeleVnum = 0, 
         Vnum = 28127, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Out in the desert.", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28126, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28163, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28128] = 
      {
         Description = "Wondering through the streets, you notice to the east and west are\
small huts for the males of the tribe. To the south is more of the\
village street. You also see the streets full of various levels of\
females in the hierarchy of the Gamorrean society, you also notice\
that there is no sign of the Alpha Female anywhere to be seen.\
", 
         TeleVnum = 0, 
         Vnum = 28128, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Village path.", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28135, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28136, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28129, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28124, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28129] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 28129, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "End of the Village Path.", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28128, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28130] = 
      {
         Description = "Wondering through the streets, you notice to the east and west are\
small huts for the males of the tribe. To the south is more of the\
village street. You also see the streets full of various levels of\
females in the hierarchy of the Gamorrean society, you also notice\
that there is no sign of the Alpha Female anywhere to be seen. \
", 
         TeleVnum = 0, 
         Vnum = 28130, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "A path in the village.", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28124, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28133, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28132, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28131] = 
      {
         Description = "You slowly sufficate to death....\
 \
 \
", 
         TeleVnum = 0, 
         Vnum = 28131, 
         Flags = 
         {
            [1] = "_Reserved", 
            [2] = "NoMob", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Buried alive", 
         Exits = 
         {
         }, 
         Sector = "city", 
      }, 
      [28132] = 
      {
         Description = "This is another small hut. much like the others, its main purpose in\
life is to shealter the boars from the rain or the harsh rays of the\
afternoon sun. The hut is made from wood scavenged from the forest\
perimeter and held together with mud, clay and some what looks like\
leather bindings. It is also strune with blankets and the odd hamock\
stretched from wall to post.\
", 
         TeleVnum = 0, 
         Vnum = 28132, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "A Hut", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28130, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28133] = 
      {
         Description = "This is another small hut. much like the others, its main purpose in\
life is to shealter the boars from the rain or the harsh rays of the\
afternoon sun. The hut is made from wood scavenged from the forest\
perimeter and held together with mud, clay and some what looks like\
leather bindings. It is also strune with blankets and the odd hamock\
stretched from wall to post.\
", 
         TeleVnum = 0, 
         Vnum = 28133, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "A Hut.", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28130, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28134] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 28134, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "A Hut.", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28128, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28135] = 
      {
         Description = "This is another small hut. much like the others, its main purpose in\
life is to shealter the boars from the rain or the harsh rays of the\
afternoon sun. The hut is made from wood scavenged from the forest\
perimeter and held together with mud, clay and some what looks like\
leather bindings. It is also strune with blankets and the odd hamock\
stretched from wall to post.\
", 
         TeleVnum = 0, 
         Vnum = 28135, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "A Hut.", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28128, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28136] = 
      {
         Description = "This is another small hut. much like the others, its main purpose in\
life is to shealter the boars from the rain or the harsh rays of the\
afternoon sun. The hut is made from wood scavenged from the forest\
perimeter and held together with mud, clay and some what looks like\
leather bindings. It is also strune with blankets and the odd hamock\
stretched from wall to post.\
", 
         TeleVnum = 0, 
         Vnum = 28136, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "A Hut.", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28128, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28137] = 
      {
         Description = "The Forest seems to go on forever. A slight breeze seduces your nose\
with its beautiful armoas and cool touch, Wild birds, of some kind\
fill the air with a musical ensamble like you never heard before. but\
deep in the forest you hey the preditors of the  land hunting and\
capturing their prey and the prey scream their last breath. You can\
also hear the beast haveing a feast of some sort might be a good\
chance to sneak up on one and catch a glimps of what the ferocious\
beast look like, but you remember warnings of caution and be ready to\
run at the drop of a hat, these beast are nothing to be messed with.\
", 
         TeleVnum = 0, 
         Vnum = 28137, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Within the Forest", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28120, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28022, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28138, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28138] = 
      {
         Description = "The forest seems to go on forever. Slight breeze seduces you nose with\
its beautiful aromas and cool touch. Wild birds , of some kind fill\
the air with a musical ensamble like you never heard before, but deep\
in the forest you hear the preditors of the land hunting and\
capturing their prey as well as the prey screaming their last breath.\
You can also hear a beast having a feast of some sort, Might be a\
good chance to sneak up on one and catch a glimps of what the\
ferocious beast might look like, but you remember warnings of caution\
and to be ready to run at the drop of a hat, these beasts are nothing\
to be messed with.\
", 
         TeleVnum = 0, 
         Vnum = 28138, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "A path in the Forest.", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28140, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28137, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28139] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 28139, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "in the Forest.", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28120, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28140] = 
      {
         Description = "The forest seems to go on forever. Slight breeze seduces you nose with\
its beautiful aromas and cool touch. Wild birds , of some kind fill\
the air with a musical ensamble like you never heard before, but deep\
in the forest you hear the preditors of the land hunting and\
capturing their  prey as well as the prey screaming their last\
breath. You can also hear a beast having a feast of some sort, Might\
be a good chance to sneak up on one and catch a glimps of what the\
ferocious beast might look like, but you remember warnings of caution\
and to be ready to run at the drop of a hat, these beasts are nothing\
to be messed with.\
", 
         TeleVnum = 0, 
         Vnum = 28140, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "More of the Path.", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28141, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28138, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28141] = 
      {
         Description = "The forest seems to go on forever. A slight breeze seduces your nose\
with its beautiful aromas and cool touch. Wild birds, of some kind\
fill  the air with their musical ensamble like you've never heard\
before, but deep in the forest you hear the preditors of the land\
hunting and capturing their prey as well as the prey screaming their\
last breath. \
", 
         TeleVnum = 0, 
         Vnum = 28141, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Crocked Path.", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28142, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28140, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28142] = 
      {
         Description = "The forest seems to go on forever. A slight breeze seduces your nose\
with its beautiful aromas and cool touch. Wild birds, of some kind\
fill the air with their musical ensamble like you've never heard\
before, but deep in the forest you hear the preditors of the land\
hunting and capturing their prey as well as the prey screaming their\
last breath. \
", 
         TeleVnum = 0, 
         Vnum = 28142, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "The Paths end.", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28143, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28141, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28143] = 
      {
         Description = "The forest seems to go on forever. A slight breeze seduces your nose\
with its beautiful aromas and cool touch. Wild birds, of some kind\
fill the air with their musical ensamble like you've never heard\
before, but deep in the forest you hear the preditors of the land\
hunting and capturing their prey as well as the prey screaming their\
last breath. \
", 
         TeleVnum = 0, 
         Vnum = 28143, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "A Clearing.", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28144, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28142, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28144] = 
      {
         Description = "This clearing leads you straight in to a villages entrance. Of course\
it is swarming with gamorreans and for some stange reason they are\
what is causing the strange noises in most of the forest. With what\
looks like a feast in honour of the Matron herself The smell of\
barbaque and some other thing fill the air with a wierd aroma. \
", 
         TeleVnum = 0, 
         Vnum = 28144, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "An Old Path.", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28145, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28143, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28145] = 
      {
         Description = "This is the entrance to the Forest clans village. The entrance is\
guarded by two large coloumns made from a concrete type of matierial\
and stnads at least fifteen feet high and three feet wide. Inside the\
entrance it is swarming with gamorreans and for some strange reason\
they are what is causing the strange noises in most of the forest.\
With what looks like a feast in honour of the Matron herself The\
smell of barbaque and some other thing fill the air with a wierd\
aroma. \
", 
         TeleVnum = 0, 
         Vnum = 28145, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Entrance to a Village.", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28146, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28144, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28146] = 
      {
         Description = "The smell from the house you just past still makes your eyes burn, The\
street keeps going north and south but up ahead you notice it bend to\
the southwest. You are unable to see past that distance due to the\
houses and huts blocking your view. You just hope where ever this\
road leads you its to a place that smells better then this this\
village, then again nothing could smell worse then this.\
", 
         TeleVnum = 0, 
         Vnum = 28146, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Village Street.", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28145, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28152, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28147, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28147] = 
      {
         Description = "The smell from the house you just past still makes your eyes burn, The\
street keeps going north and south but up ahead you notice it bend to\
the southwest. You are unable to see past that distance due to the\
houses and huts blocking your view. You just hope where ever this\
road leads you its to a place that smells better then this this\
village, then again nothing could smell worse then this.\
", 
         TeleVnum = 0, 
         Vnum = 28147, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Village Street.", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28146, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28155, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28148, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28154, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28148] = 
      {
         Description = "The smell from the house you just past still makes your eyes burn, The\
street keeps going north and south but up ahead you notice it bend to\
the southwest. You are unable to see past that distance due to the\
houses and huts blocking your view. You just hope where ever this\
road leads you its to a place that smells better then this this\
village, then again nothing could smell worse then this.\
", 
         TeleVnum = 0, 
         Vnum = 28148, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Village Street.", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28147, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28149, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28156, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28149] = 
      {
         Description = "The smell from the house you just past still makes your eyes burn, The\
street keeps going north and south but up ahead you notice it bend to\
the southwest. You are unable to see past that distance due to the\
houses and huts blocking your view. You just hope where ever this\
road leads you its to a place that smells better then this this\
village, then again nothing could smell worse then this.\
", 
         TeleVnum = 0, 
         Vnum = 28149, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Village Street.", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28148, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28157, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28150, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28150] = 
      {
         Description = "The street to the west ends on a semi circle of huts where you presume\
the male gamorreans sleep and gather for there clan war meetings.\
This part of the street turns west to this little ending and from\
there it goes no where but back to the spot. You can return back to\
the east and go back into the heart of the village or head into the\
dead end. \
", 
         TeleVnum = 0, 
         Vnum = 28150, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "A turn in the Village Street.", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28149, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28151, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28151] = 
      {
         Description = "This little semi circle is surrounded by the male gamorreans huts. And\
you can tell by the smell they dont take good care of their living\
quarters, the smell of urine fills the air and burns your nose.\
Though the smell of the forest you were travelling in had such a\
sweet sent to it, the smell from these huts completly cancels out any\
presence of the forest with surrounds the entire village.\
", 
         TeleVnum = 0, 
         Vnum = 28151, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "End of the Village Street.", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28161, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28150, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28160, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28162, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28152] = 
      {
         Description = "This small path leads looks like it leads away from the village and\
straight back into the forest for some unknown reason. maybe its for\
future expansion of the village you have no idea nor do you really\
care. The path leads east and from what you can tell ends right there\
and right back into the forest.\
", 
         TeleVnum = 0, 
         Vnum = 28152, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Small path in the Village.", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28153, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28146, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28153] = 
      {
         Description = "This small path leads looks like it leads away from the village and\
straight back into the forest for some unknown reason. maybe its for\
future expansion of the village you have no idea nor do you really\
care. The path leads east and from what you can tell ends right there\
and right back into the forest.\
", 
         TeleVnum = 0, 
         Vnum = 28153, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Small path.", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28152, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28154] = 
      {
         Description = "This store has all its supplies on the wall behind the counter, to prevent\
slippery little hands from snatching the goods that might have been on\
shelves in the middle of the store.  The gamorrean behind the counter\
doesnt look to pleasent either she looks like she was hit by a swoop and\
draged for a few light years on her face.\
", 
         TeleVnum = 0, 
         Vnum = 28154, 
         Flags = 
         {
            [10] = "Safe", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "General Store.", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28147, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28155] = 
      {
         Description = "You are standing in the forest clans water supply shop, the funny thing is,\
it seems that the clan members dont have to pay for their water and oddly\
enough the off worlders have to pay the highest prices for something as\
abundent as water. You come the the conclusion the these clan people are\
nothing but crooks. The walls in the shop are lind with different types of\
ancient canteens, this place is almost like a canteen museum.\
", 
         TeleVnum = 0, 
         Vnum = 28155, 
         Flags = 
         {
            [10] = "Safe", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Water shop.", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28147, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28156] = 
      {
         Description = "These walls are lined with very well crafted axes that look as though the\
gamorrean who crafted them might have taken her time and put alot of care\
into makeing them because they all have real nice intricate designs\
covering the blades and the war hammers look like they could fetch a\
bundle in the black market.  this Gamorrean much like the rest enjoys her\
work and takes alot of pride in what she does and she looks like the type\
of gamorrean that will not hesitate to hack off a hand or two to protect\
her goods.\
", 
         TeleVnum = 0, 
         Vnum = 28156, 
         Flags = 
         {
            [10] = "Safe", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Arms for Sale.", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28148, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28157] = 
      {
         Description = "This path is wider then most of the other paths you have encountered thus\
far, to the south you notice that the path comes to an end and leads\
straight to the alpha females house. The path is also loaded with\
gamorreans coming and going to and from the matrons house, paying homage\
and mostly the males are trying to find out when the next mateing battles\
will take place.\
", 
         TeleVnum = 0, 
         Vnum = 28157, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "A Wide Path.", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28149, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28158, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28158] = 
      {
         Description = "This path is wider then most of the other paths you have encountered thus\
far, to the south you notice that the path comes to an end and leads\
straight to the alpha females house. The path is also loaded with\
gamorreans coming and going to and from the matrons house, paying homage\
and mostly the males are trying to find out when the next mateing battles\
will take place. \
", 
         TeleVnum = 0, 
         Vnum = 28158, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "End of the path.", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28157, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28159, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [28159] = 
      {
         Description = "This is the home of the matron, the house is made a little better then the\
other huts made from stick and such, this one is made from trees that were\
cut into palnks and held together with mud and nails and its real sturdy\
which is the obvious reason why the matron has made it her home.\
", 
         TeleVnum = 0, 
         Vnum = 28159, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "House of the Alfa female.", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28158, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
   }, 
   LevelRanges = 
   {
      Hard = 
      {
         Low = 1, 
         High = 100, 
      }, 
      Soft = 
      {
         Low = 1, 
         High = 100, 
      }, 
   }, 
   Objects = 
   {
      [28100] = 
      {
         Affects = 
         {
            [1] = 
            {
               Location = 19, 
               Modifier = 5, 
            }, 
            [2] = 
            {
               Location = 18, 
               Modifier = 5, 
            }, 
         }, 
         ActionDescription = "", 
         Name = "SUPER noghri blaster thingy", 
         Vnum = 28100, 
         Weight = 1, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               MudProgType = "use_prog", 
               Code = "mpechoat $n The power of this weapon flows into your soul.\
mpechoaround $n You wet yourself when $n wields a Noghri blaster\
", 
            }, 
         }, 
         Flags = 
         {
            [1] = "Hum", 
            [30] = "Prototype", 
         }, 
         ShortDescr = "A Noghri Blaster", 
         Description = "A sleak and deadly blaster lies on the ground here.", 
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
      [28120] = 
      {
         ActionDescription = "", 
         Name = "morrt", 
         Vnum = 28120, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               MudProgType = "wear_prog", 
               Code = "mpechoat $n The Morrt tears into your flesh.\
mpechoaround $n A morrt is tearing into $n's flash!!\
mpdamage $n 10\
", 
            }, 
            [2] = 
            {
               Arguments = "100", 
               MudProgType = "remove_prog", 
               Code = "mpechoat $n You rip a morrt from you neck.\
mpechoaround $n Blood runs down $n's neck.\
mpdamage $n 20\
", 
            }, 
            [3] = 
            {
               Arguments = "100", 
               MudProgType = "damage_prog", 
               Code = "mpechoat $n Your morrt gets injured and bites you harder. OUCH!!\
mpdamage $n 5\
mpechoaround $n $n's Morrt Screams in pain!\
", 
            }, 
         }, 
         Weight = 10, 
         Description = "A hungry Morrt is crawling on the ground here.", 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         ShortDescr = "A large Morrt", 
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
            [2] = "Neck", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
      }, 
      [28187] = 
      {
         ActionDescription = "", 
         Name = "mountain clan insignia", 
         Vnum = 28187, 
         Weight = 1, 
         Description = "A clan insignia is collecting dust on the ground here.", 
         ShortDescr = "mountain clan insignia", 
         Layers = 0, 
         ItemType = "armor", 
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
            [2] = "Neck", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
      }, 
      [28188] = 
      {
         ActionDescription = "", 
         Name = "mountain clan helm helmet", 
         Vnum = 28188, 
         Weight = 1, 
         Description = "A helmet is lying on the ground attracting flies.", 
         Flags = 
         {
            [0] = "Glow", 
            [8] = "Bless", 
         }, 
         ShortDescr = "a mountain clan helm", 
         Layers = 128, 
         ItemType = "armor", 
         ObjectValues = 
         {
            [1] = 20, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 20, 
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
      [28189] = 
      {
         Affects = 
         {
            [1] = 
            {
               Location = 18, 
               Modifier = 3, 
            }, 
            [2] = 
            {
               Location = 19, 
               Modifier = 3, 
            }, 
         }, 
         ActionDescription = "", 
         Name = "a Large battle axe", 
         Vnum = 28189, 
         Weight = 10, 
         Description = "A very large battle axe gleams in the dirt.", 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         ShortDescr = "a Large battle axe", 
         Layers = 0, 
         ItemType = "weapon", 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 3, 
            [3] = 0, 
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
         Cost = 20000, 
      }, 
      [28000] = 
      {
         ActionDescription = "", 
         Name = "white contacts blites", 
         Vnum = 28000, 
         Weight = 1, 
         Description = "Blite has dropped his colour contacts here.", 
         ShortDescr = "White contact lenses.", 
         Layers = 0, 
         ItemType = "trash", 
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
            [17] = "Eyes", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
      }, 
      [28001] = 
      {
         ActionDescription = "", 
         Name = "baby gamorrean pig piglet piggy swine", 
         Vnum = 28001, 
         Weight = 1, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               MudProgType = "rand_prog", 
               Code = "mpecho The baby Gamorrean squeals loudly!\
", 
            }, 
            [2] = 
            {
               Arguments = "100", 
               MudProgType = "use_prog", 
               Code = "mpechoat $n The Gamorrean baby SCREAMS in terror as you swallow it whole\
mpechoaround $n The Gamorrean baby SCREAMS in shear terror as $n eats it!!!!\
", 
            }, 
         }, 
         Description = "A baby Gamorrean is lying here.", 
         ShortDescr = "A baby Gamorrean", 
         Layers = 0, 
         ItemType = "food", 
         ObjectValues = 
         {
            [1] = 0, 
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
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
      }, 
      [28002] = 
      {
         Affects = 
         {
            [1] = 
            {
               Location = 19, 
               Modifier = 4, 
            }, 
            [2] = 
            {
               Location = 18, 
               Modifier = 3, 
            }, 
         }, 
         ActionDescription = "", 
         Name = "A Blue Lightsaber", 
         Vnum = 28002, 
         Weight = 1, 
         Description = "A Blue lightsaber glows here.", 
         ShortDescr = "A Blue lightsaber ", 
         Layers = 0, 
         ItemType = "weapon", 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 6, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         WearFlags = 
         {
            [13] = "Wield", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
      }, 
      [28003] = 
      {
         ActionDescription = "", 
         Name = "A Leather cap", 
         Vnum = 28003, 
         Weight = 10, 
         ShortDescr = "A Small leather cap ", 
         Description = "A Small leather cap is lying here ", 
         ItemType = "armor", 
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
         Cost = 100, 
      }, 
      [28004] = 
      {
         Affects = 
         {
            [1] = 
            {
               Location = 19, 
               Modifier = 2, 
            }, 
            [2] = 
            {
               Location = 18, 
               Modifier = 2, 
            }, 
         }, 
         ActionDescription = "", 
         Name = "war hammer", 
         Vnum = 28004, 
         Weight = 15, 
         Description = "A heavy looking hammer lies on the ground.", 
         ShortDescr = "a war hammer", 
         Layers = 0, 
         ItemType = "weapon", 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 5, 
            [3] = 7, 
            [4] = 0, 
            [5] = 0, 
            [0] = 100, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 10000, 
      }, 
      [28005] = 
      {
         ActionDescription = "", 
         Name = "leather boots", 
         Vnum = 28005, 
         Weight = 1, 
         Description = "A pair of boots lay crumpled on the ground.", 
         ShortDescr = "a pair of leather boots", 
         Layers = 128, 
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
            [6] = "Feet", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 100, 
      }, 
      [28006] = 
      {
         ActionDescription = "", 
         Name = "large wooden shield", 
         Vnum = 28006, 
         Weight = 5, 
         Description = "Someone has carelessly drop a wooden shield here.", 
         ShortDescr = "a large wooden shield", 
         Layers = 128, 
         ItemType = "armor", 
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
            [9] = "Shield", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 100, 
      }, 
      [28007] = 
      {
         Affects = 
         {
            [1] = 
            {
               Location = 2, 
               Modifier = -3, 
            }, 
            [2] = 
            {
               Location = 46, 
               Modifier = 10, 
            }, 
            [3] = 
            {
               Location = 19, 
               Modifier = 4, 
            }, 
            [4] = 
            {
               Location = 11, 
               Modifier = 50, 
            }, 
            [5] = 
            {
               Location = 51, 
               Modifier = -10, 
            }, 
            [6] = 
            {
               Location = 14, 
               Modifier = -100, 
            }, 
         }, 
         ActionDescription = "", 
         Name = "war axe", 
         Vnum = 28007, 
         Weight = 10, 
         Description = "A magnificent looking axe has been carlessly drop here.", 
         Flags = 
         {
            [8] = "Bless", 
            [13] = "Inventory", 
            [0] = "Glow", 
            [19] = "LargeSize", 
         }, 
         ShortDescr = "a war axe", 
         Layers = 0, 
         ItemType = "weapon", 
         ObjectValues = 
         {
            [1] = 8, 
            [2] = 4, 
            [3] = 1, 
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
      [28008] = 
      {
         ActionDescription = "", 
         Name = "morrts 15", 
         Vnum = 28008, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               MudProgType = "wear_prog", 
               Code = "mpechoat $n You cover you body with 15 Morrts.\
mpdamage $n 50\
mpechoaround $n $n covers $s body with Morrts!\
", 
            }, 
            [2] = 
            {
               Arguments = "100", 
               MudProgType = "remove_prog", 
               Code = "mpechoat $n You slowly remove the Morrts from you body.\
mpdamage $n 75\
mpechoaround $n $n slowly removes 15 morrts from $s body\
", 
            }, 
         }, 
         Weight = 5, 
         Description = "A small group of Morrts are here relaxing.", 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         ShortDescr = "15 morrts", 
         Layers = 4, 
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
            [3] = "Body", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
      }, 
      [28009] = 
      {
         ActionDescription = "", 
         Name = "morrts 20", 
         Vnum = 28009, 
         Weight = 5, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               MudProgType = "wear_prog", 
               Code = "mpechoat $n You cover your body with 20 Morrts.\
mpdamage $n 80\
mpechoaround $n $n covers $s body with 20 Morrts!\
", 
            }, 
            [2] = 
            {
               Arguments = "100", 
               MudProgType = "remove_prog", 
               Code = "mpechoat $n You slowly remove the Morrts from your body.\
mpdamage $n 85\
mpechoaround $n $n  slowly remove 20 morrts $s body.\
", 
            }, 
         }, 
         Description = "A large group of Morrts are huddled together here", 
         ShortDescr = "20 morrts", 
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
            [3] = "Body", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
      }, 
      [28010] = 
      {
         ActionDescription = "", 
         Name = "morrts 25", 
         Vnum = 28010, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               MudProgType = "wear_prog", 
               Code = "mpechoat $n You cover your body with 25 Morrts.\
mpdamage $n 250\
mpechoaround $n $n covers $s body with Morrts!\
", 
            }, 
            [2] = 
            {
               Arguments = "100", 
               MudProgType = "remove_prog", 
               Code = "mpechoat $n You slowly remove the morrts from you body.\
mpdamage $n 300\
mpechoaround $n $n slowly removes 25 morrts from $s body.\
mpechoaround $n You feel $s pain.\
", 
            }, 
         }, 
         Weight = 5, 
         Description = "A bunch of Morrts lay huddled together", 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         ShortDescr = "25 Morrts", 
         Layers = 12, 
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
         Cost = 0, 
      }, 
      [28011] = 
      {
         ActionDescription = "", 
         Name = "skin", 
         Vnum = 28011, 
         Weight = 2, 
         Description = "A piece of fur is lying here collecting flies.", 
         ShortDescr = "Gurda skin", 
         Layers = 12, 
         ItemType = "armor", 
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
            [11] = "Waist", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 10, 
      }, 
      [28012] = 
      {
         ActionDescription = "", 
         Name = "pike", 
         Vnum = 28012, 
         Weight = 1, 
         Description = "A pike is lying in your way here.", 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         ShortDescr = "a pike", 
         Layers = 0, 
         ItemType = "weapon", 
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
            [13] = "Wield", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
      }, 
      [28013] = 
      {
         ActionDescription = "", 
         Name = "arm limb", 
         Vnum = 28013, 
         Weight = 1, 
         ShortDescr = "An arm of a tourist", 
         Description = "An arm of a tourist", 
         ItemType = "trash", 
         Layers = 0, 
         ObjectValues = 
         {
            [1] = 13, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 13, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
      }, 
      [28014] = 
      {
         ActionDescription = "", 
         Name = "blood", 
         Vnum = 28014, 
         Weight = 1, 
         ShortDescr = "&r a pool of blood&Y", 
         Description = "&r a pool of blood&Y", 
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
      [28015] = 
      {
         ActionDescription = "", 
         Name = "metal helmet gamorrean", 
         Vnum = 28015, 
         Weight = 3, 
         Description = "Some clumsy Gamorrean has drop his helmet", 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         ShortDescr = "a metal helm", 
         Layers = 128, 
         ItemType = "armor", 
         ObjectValues = 
         {
            [1] = 6, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 6, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [4] = "Head", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 120, 
      }, 
      [28016] = 
      {
         ActionDescription = "", 
         Name = "metal boots", 
         Vnum = 28016, 
         Weight = 1, 
         Description = "A pair of metal boots are attracting flies here.", 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         ShortDescr = "metal boots", 
         Layers = 0, 
         ItemType = "armor", 
         ObjectValues = 
         {
            [1] = 7, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 7, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [6] = "Feet", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 150, 
      }, 
      [28017] = 
      {
         ActionDescription = "", 
         Name = "wrist guards", 
         Vnum = 28017, 
         Weight = 3, 
         Description = "Some clumsy Gamorrean has drop his wrist guards here", 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         ShortDescr = "wrist guards", 
         Layers = 64, 
         ItemType = "armor", 
         ObjectValues = 
         {
            [1] = 7, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 7, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [12] = "Wrist", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 200, 
      }, 
      [28018] = 
      {
         ActionDescription = "", 
         Name = "imperial cargo cruiser", 
         Vnum = 28018, 
         Weight = 1, 
         ShortDescr = "Imperial cargo ship", 
         Description = "An Imperial cargo ship has landed here.", 
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
      [28019] = 
      {
         ActionDescription = "", 
         Name = "pink wig", 
         Vnum = 28019, 
         Weight = 1, 
         Description = "A dirty, bright pink wig is being trampled by people here.", 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         ShortDescr = "a pink wig", 
         Layers = 0, 
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
            [4] = "Head", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
      }, 
      [28020] = 
      {
         ActionDescription = "", 
         Name = "hand axe", 
         Vnum = 28020, 
         Weight = 3, 
         Description = "A clumsy gamorrean has carlessly drop his axe here.", 
         ShortDescr = "a hand axe", 
         Layers = 0, 
         ItemType = "weapon", 
         ObjectValues = 
         {
            [1] = 4, 
            [2] = 3, 
            [3] = 3, 
            [4] = 0, 
            [5] = 0, 
            [0] = 12, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
            [14] = "Hold", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 100, 
      }, 
      [28021] = 
      {
         ActionDescription = "", 
         Name = "crate box", 
         Vnum = 28021, 
         Weight = 100, 
         ShortDescr = "a crate", 
         Description = "A large crate is here.", 
         ItemType = "container", 
         Layers = 0, 
         ObjectValues = 
         {
            [1] = 1, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 500, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
      }, 
      [28022] = 
      {
         ActionDescription = "", 
         Name = "infant gamorrean watch beats", 
         Vnum = 28022, 
         Weight = 1, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               MudProgType = "get_prog", 
               Code = "mpechoat $n An infant watch-beast claws at you!\
mpdamage $n 10\
mpechoaround $n An infant watch-beast claws at $n!\
mpforce $n put infant crate\
", 
            }, 
         }, 
         ShortDescr = "an infant watch-beast", 
         Description = "An infant watch-beast is sitting here.", 
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
      [28023] = 
      {
         ActionDescription = "", 
         Name = "ship cube zicreex", 
         Vnum = 28023, 
         Weight = 1, 
         ShortDescr = "The Gamorrean cube ship Zireex", 
         Description = "The gamorrean cube ship Zicreex is parked here.", 
         ItemType = "spacecraft", 
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
      [28024] = 
      {
         ActionDescription = "", 
         Name = "metal shoulder plates", 
         Vnum = 28024, 
         Weight = 3, 
         Description = "Metal shoulder plates have been carelessly drop here.", 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         ShortDescr = "metal shoulder plates", 
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
      [28025] = 
      {
         Affects = 
         {
            [1] = 
            {
               Location = 18, 
               Modifier = 3, 
            }, 
            [2] = 
            {
               Location = 19, 
               Modifier = 3, 
            }, 
         }, 
         ActionDescription = "", 
         Name = "vibro axe", 
         Vnum = 28025, 
         Weight = 10, 
         Description = "A vibro-axe vibro axe is here collecting dust.", 
         Flags = 
         {
            [4] = "Contraband", 
            [19] = "LargeSize", 
         }, 
         ShortDescr = "a vibro-axe", 
         Layers = 0, 
         ItemType = "weapon", 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 3, 
            [3] = 1, 
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
         Cost = 500, 
      }, 
      [28026] = 
      {
         ActionDescription = "", 
         Name = "ship scraps", 
         Vnum = 28026, 
         Weight = 1, 
         Description = "The scraps of a ship lie here.", 
         ShortDescr = "scraps of a ship", 
         Layers = 0, 
         ItemType = "durasteel", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
      }, 
      [28027] = 
      {
         ActionDescription = "", 
         Name = "mud hole", 
         Vnum = 28027, 
         Weight = 1, 
         ShortDescr = "a mud hole", 
         Description = "A rather large mud hole.", 
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
      [28028] = 
      {
         ActionDescription = "", 
         Name = "cerimonial axe", 
         Vnum = 28028, 
         Weight = 1, 
         Flags = 
         {
            [0] = "Glow", 
         }, 
         ShortDescr = "a beautiful axe", 
         Description = "A beautifuly crafted axe is on a pedestal here.", 
         ItemType = "government", 
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
      [28029] = 
      {
         ActionDescription = "", 
         Name = "cerimonial shield", 
         Vnum = 28029, 
         Weight = 1, 
         ShortDescr = "a cerimonial shield", 
         Description = "A fine shield is being displayed on a mantel.", 
         ItemType = "government", 
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
      [28030] = 
      {
         ActionDescription = "", 
         Name = "sacred stone", 
         Vnum = 28030, 
         Weight = 1, 
         ShortDescr = "a sacred stone", 
         Description = "The sacred stone of the Mountains is here.", 
         ItemType = "government", 
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
      [28199] = 
      {
         ActionDescription = "", 
         Name = "chair", 
         Vnum = 28199, 
         Weight = 1, 
         ShortDescr = "a newly created chair", 
         Description = "Some god dropped a newly created chair here.", 
         ItemType = "furniture", 
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
         Last = 28139, 
         First = 28000, 
      }, 
      Room = 
      {
         Last = 28199, 
         First = 28000, 
      }, 
      Object = 
      {
         Last = 28199, 
         First = 28000, 
      }, 
   }, 
   ResetFrequency = 0, 
   ResetMessage = "A warm breeze blows softly across your face.", 
   FileFormatVersion = 1, 
   LowEconomy = 99986589, 
   Author = "Thrawn", 
}
