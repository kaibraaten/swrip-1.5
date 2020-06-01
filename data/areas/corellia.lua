-- Corellia
-- Last saved Monday 01-Jun-2020 11:08:46

AreaEntry
{
   Name = "Corellia", 
   HighEconomy = 0, 
   FileFormatVersion = 1, 
   ResetFrequency = 0, 
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
   Mobiles = 
   {
      [10500] = 
      {
         Name = "Corellian Citizen", 
         Sex = "undistinguished", 
         Weight = 0, 
         Alignment = 0, 
         DefaultPosition = "standing", 
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
            HitNoDice = 4, 
            HitSizeDice = 10, 
            HitPlus = 200, 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         HitRoll = 4, 
         VipFlags = 
         {
            [17] = "Hoth", 
         }, 
         Stats = 
         {
            Strength = 0, 
            Dexterity = 0, 
            Intelligence = 0, 
            Force = 0, 
            Constitution = 0, 
            Luck = 0, 
            Wisdom = 0, 
            Charisma = 0, 
         }, 
         Vnum = 10500, 
         LongDescr = "Corellian Citizen\
", 
         NumberOfAttacks = 2, 
         Level = 20, 
         Description = "", 
         Damage = 
         {
            DamNoDice = 2, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         ShortDescr = "corellian citizen", 
         DamRoll = 4, 
         Height = 0, 
         Race = "Human", 
         Position = "standing", 
         Credits = 0, 
         ArmorClass = 50, 
         Flags = 
         {
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
      }, 
      [10501] = 
      {
         Name = "A shady shopkeeper", 
         Sex = "female", 
         Weight = 0, 
         Alignment = 0, 
         DefaultPosition = "standing", 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
               [20] = "verpine", 
            }, 
            Speaking = 
            {
               [0] = "basic", 
            }, 
         }, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         HitRoll = 0, 
         ArmorClass = 0, 
         Race = "Human", 
         Stats = 
         {
            Strength = 0, 
            Dexterity = 0, 
            Intelligence = 0, 
            Force = 0, 
            Constitution = 0, 
            Luck = 0, 
            Wisdom = 0, 
            Charisma = 0, 
         }, 
         Vnum = 10501, 
         Immune = 
         {
            [20] = "magic", 
            [11] = "charm", 
         }, 
         LongDescr = "A shady shopkeeper\
", 
         NumberOfAttacks = 0, 
         Level = 1, 
         Description = "This shopkeeper keeps an eye on her security monitors and a hand on her\
blaster while she deals with you.   \
", 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         ShortDescr = "a shopkeeper", 
         DamRoll = 0, 
         Height = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "gives", 
               Code = "if ovnuminv(10217) >= 1\
say I've been waiting for you.\
mpoload 10218\
give pictures $n\
mpat 10299 drop film\
mpat 10299 mppurge\
endif\
", 
               MudProgType = "act_prog", 
            }, 
         }, 
         Position = "standing", 
         Credits = 0, 
         Shop = 
         {
            ProfitBuy = 120, 
            ProfitSell = 69, 
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
            KeeperShortDescr = "a shopkeeper", 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
      }, 
      [10502] = 
      {
         Name = "Galin", 
         Sex = "undistinguished", 
         Weight = 0, 
         Alignment = 0, 
         DefaultPosition = "standing", 
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
            HitNoDice = 4, 
            HitSizeDice = 10, 
            HitPlus = 200, 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         HitRoll = 4, 
         ArmorClass = 50, 
         Stats = 
         {
            Strength = 0, 
            Dexterity = 0, 
            Intelligence = 0, 
            Force = 0, 
            Constitution = 0, 
            Luck = 0, 
            Wisdom = 0, 
            Charisma = 0, 
         }, 
         Vnum = 10502, 
         Immune = 
         {
            [20] = "magic", 
            [11] = "charm", 
         }, 
         LongDescr = "Cook Galin bakes loaves of bread here.\
", 
         NumberOfAttacks = 0, 
         Level = 20, 
         Description = "", 
         Damage = 
         {
            DamNoDice = 2, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         ShortDescr = "galin", 
         DamRoll = 4, 
         Height = 0, 
         Race = "Human", 
         Position = "standing", 
         Credits = 0, 
         Shop = 
         {
            ProfitBuy = 120, 
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
            KeeperShortDescr = "galin", 
         }, 
         Flags = 
         {
            [0] = "Npc", 
            [25] = "NoKill", 
            [30] = "Prototype", 
         }, 
      }, 
      [10503] = 
      {
         Name = "Minit", 
         Sex = "undistinguished", 
         Weight = 0, 
         Alignment = 0, 
         DefaultPosition = "standing", 
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
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         HitRoll = 0, 
         ArmorClass = 0, 
         Stats = 
         {
            Strength = 0, 
            Dexterity = 0, 
            Intelligence = 0, 
            Force = 0, 
            Constitution = 0, 
            Luck = 0, 
            Wisdom = 0, 
            Charisma = 0, 
         }, 
         Vnum = 10503, 
         Immune = 
         {
            [20] = "magic", 
            [11] = "charm", 
         }, 
         LongDescr = "Minit the cute little tavernmaid serves drinks here\
", 
         NumberOfAttacks = 0, 
         Level = 1, 
         Description = "", 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         ShortDescr = "Minit", 
         DamRoll = 0, 
         Height = 0, 
         Race = "Human", 
         Position = "standing", 
         Credits = 0, 
         Shop = 
         {
            ProfitBuy = 120, 
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
            KeeperShortDescr = "Minit", 
         }, 
         Flags = 
         {
            [0] = "Npc", 
            [25] = "NoKill", 
            [30] = "Prototype", 
         }, 
      }, 
      [10504] = 
      {
         Name = "Corellian Diktat", 
         Sex = "undistinguished", 
         Weight = 0, 
         Alignment = 0, 
         DefaultPosition = "standing", 
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
            HitNoDice = 10, 
            HitSizeDice = 10, 
            HitPlus = 500, 
         }, 
         AffectedBy = 
         {
            [22] = "TrueSight", 
         }, 
         Race = "Human", 
         HitRoll = 10, 
         VipFlags = 
         {
            [17] = "Hoth", 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         Stats = 
         {
            Strength = 0, 
            Dexterity = 0, 
            Intelligence = 0, 
            Force = 0, 
            Constitution = 0, 
            Luck = 0, 
            Wisdom = 0, 
            Charisma = 0, 
         }, 
         Vnum = 10504, 
         NumberOfAttacks = 0, 
         LongDescr = "The Diktat of Corellia stands here giving orders.\
", 
         AttackFlags = 
         {
            [5] = "kick", 
         }, 
         Level = 50, 
         Description = "", 
         Damage = 
         {
            DamNoDice = 5, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         ShortDescr = "the corellian diktat", 
         DamRoll = 10, 
         Height = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "gives", 
               Code = "if ovnuminv(10208) >= 1\
Say I have been waiting for this important package.  Thank you.\
mpwithdraw 2500\
give 2500 credits $n\
drop 2500 credits\
mpgain $n 5 100000\
mpat 10299 drop all\
mpat 10299 mppurge\
endif\
", 
               MudProgType = "act_prog", 
            }, 
         }, 
         Position = "standing", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [10] = "Practice", 
            [30] = "Prototype", 
         }, 
         Credits = 0, 
         ArmorClass = -25, 
      }, 
      [10505] = 
      {
         Name = "Palace Guard", 
         Sex = "undistinguished", 
         Weight = 0, 
         Alignment = 0, 
         DefaultPosition = "standing", 
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
            HitNoDice = 5, 
            HitSizeDice = 10, 
            HitPlus = 250, 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         HitRoll = 5, 
         Stats = 
         {
            Strength = 0, 
            Dexterity = 0, 
            Intelligence = 0, 
            Force = 0, 
            Constitution = 0, 
            Luck = 0, 
            Wisdom = 0, 
            Charisma = 0, 
         }, 
         Vnum = 10505, 
         SpecFuns = 
         {
            [0] = "spec_police", 
         }, 
         LongDescr = "A palace guard keeps the peace.\
", 
         NumberOfAttacks = 0, 
         Level = 25, 
         Description = "", 
         Damage = 
         {
            DamNoDice = 2, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         ShortDescr = "a palace guard", 
         DamRoll = 5, 
         Height = 0, 
         Race = "Human", 
         Position = "standing", 
         Credits = 0, 
         ArmorClass = 37, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
      }, 
      [10506] = 
      {
         Name = "Master Bunyon", 
         Sex = "undistinguished", 
         Weight = 0, 
         Alignment = 0, 
         DefaultPosition = "standing", 
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
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         HitRoll = 0, 
         Stats = 
         {
            Strength = 0, 
            Dexterity = 0, 
            Intelligence = 0, 
            Force = 0, 
            Constitution = 0, 
            Luck = 0, 
            Wisdom = 0, 
            Charisma = 0, 
         }, 
         Vnum = 10506, 
         Race = "Human", 
         LongDescr = "Master Bunyon waits for callers here.\
", 
         NumberOfAttacks = 0, 
         Level = 1, 
         Description = "", 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         ShortDescr = "Master Bunyon", 
         DamRoll = 0, 
         Height = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               Code = "say Greetings, welcome to the Master and Fool.  Make yourself at home.\
", 
               MudProgType = "greet_prog", 
            }, 
         }, 
         Position = "standing", 
         Credits = 0, 
         ArmorClass = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
      }, 
      [10507] = 
      {
         Name = "Turen", 
         Sex = "undistinguished", 
         Weight = 0, 
         Alignment = 0, 
         DefaultPosition = "standing", 
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
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         HitChance = 
         {
            HitNoDice = 18, 
            HitSizeDice = 10, 
            HitPlus = 900, 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         ArmorClass = -125, 
         HitRoll = 18, 
         Race = "Human", 
         Immune = 
         {
            [20] = "magic", 
            [11] = "charm", 
         }, 
         Stats = 
         {
            Strength = 0, 
            Dexterity = 0, 
            Intelligence = 0, 
            Force = 0, 
            Constitution = 0, 
            Luck = 0, 
            Wisdom = 0, 
            Charisma = 0, 
         }, 
         Vnum = 10507, 
         NumberOfAttacks = 0, 
         LongDescr = "Turen is selling tools of the trade here.\
", 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         Level = 90, 
         Description = "", 
         Damage = 
         {
            DamNoDice = 9, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         ShortDescr = "Turen", 
         DamRoll = 18, 
         Height = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "1", 
               Code = "if rand(1)\
say I had a customer the other day........rather a strange fellow.\
emote shakes his head sadly.\
say Thought he might have had a bit too much ale, you know how tourists\
are.\
emote winks at you.\
say He rambled on about a garden and a secret cove and buried treasure here\
on Corellia!\
emote furrows his brows.\
say Musta been the drink.  I've never heard such a story...but....\
emote thinks a moment.\
say There is a garden near one of the houses that has a secret exit.....\
endif\
", 
               MudProgType = "rand_prog", 
            }, 
         }, 
         Position = "standing", 
         Credits = 0, 
         Shop = 
         {
            ProfitBuy = 120, 
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
            KeeperShortDescr = "Turen", 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
         }, 
      }, 
      [10508] = 
      {
         Name = "craftsman", 
         Sex = "female", 
         Weight = 0, 
         Alignment = 0, 
         DefaultPosition = "standing", 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
               [17] = "jawaese", 
               [2] = "twileki", 
               [20] = "verpine", 
               [5] = "mon calamarian", 
               [14] = "gamorrese", 
               [7] = "ewokese", 
            }, 
            Speaking = 
            {
               [2] = "twileki", 
            }, 
         }, 
         HitChance = 
         {
            HitNoDice = 20, 
            HitSizeDice = 10, 
            HitPlus = 1000, 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         HitRoll = 0, 
         ArmorClass = -150, 
         Stats = 
         {
            Strength = 0, 
            Dexterity = 0, 
            Intelligence = 0, 
            Force = 0, 
            Constitution = 0, 
            Luck = 0, 
            Wisdom = 0, 
            Charisma = 0, 
         }, 
         Vnum = 10508, 
         Immune = 
         {
            [20] = "magic", 
            [11] = "charm", 
         }, 
         LongDescr = "A craftsman has set up a booth here.\
", 
         NumberOfAttacks = 0, 
         Level = 100, 
         Description = "This old twilek woman has a booth with some incredably beautiful\
items. She is very skilled in her craft. Maybe she could teach you a\
few things.\
", 
         Damage = 
         {
            DamNoDice = 10, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         ShortDescr = "a craftsman", 
         DamRoll = 0, 
         Height = 0, 
         Race = "Twi'lek", 
         Position = "standing", 
         Credits = 20, 
         Shop = 
         {
            ProfitBuy = 120, 
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
            KeeperShortDescr = "a craftsman", 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [10] = "Practice", 
            [30] = "Prototype", 
         }, 
      }, 
      [10509] = 
      {
         Name = "An instructor", 
         Sex = "undistinguished", 
         Weight = 0, 
         Alignment = 0, 
         DefaultPosition = "standing", 
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
            HitNoDice = 21, 
            HitSizeDice = 10, 
            HitPlus = 1050, 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         HitRoll = 21, 
         Stats = 
         {
            Strength = 0, 
            Dexterity = 0, 
            Intelligence = 0, 
            Force = 0, 
            Constitution = 0, 
            Luck = 0, 
            Wisdom = 0, 
            Charisma = 0, 
         }, 
         Vnum = 10509, 
         LongDescr = "An instructor stands here.\
", 
         NumberOfAttacks = 0, 
         Level = 105, 
         Description = "", 
         Damage = 
         {
            DamNoDice = 10, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         ShortDescr = "an instructor", 
         DamRoll = 21, 
         Height = 0, 
         Race = "Wookiee", 
         Position = "standing", 
         Credits = 0, 
         ArmorClass = -162, 
         Flags = 
         {
            [1] = "Sentinel", 
            [24] = "NoAssist", 
            [9] = "Train", 
            [10] = "Practice", 
            [25] = "NoKill", 
            [0] = "Npc", 
         }, 
      }, 
      [10510] = 
      {
         Name = "a training remote", 
         Sex = "undistinguished", 
         Weight = 0, 
         Alignment = 0, 
         DefaultPosition = "standing", 
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
            HitNoDice = 0, 
            HitSizeDice = 10, 
            HitPlus = 10, 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         HitRoll = 0, 
         Stats = 
         {
            Strength = 0, 
            Dexterity = 0, 
            Intelligence = 0, 
            Force = 0, 
            Constitution = 0, 
            Luck = 0, 
            Wisdom = 0, 
            Charisma = 0, 
         }, 
         Vnum = 10510, 
         Race = "Human", 
         LongDescr = "A training remote hovers nearby.\
", 
         NumberOfAttacks = 0, 
         Level = 1, 
         Description = "", 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         ShortDescr = "a remote", 
         DamRoll = 0, 
         Height = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               Code = "mpecho As the remote explodes, a door opens in the wall and another remote\
mpecho floats out.\
mpmload 10510\
", 
               MudProgType = "death_prog", 
            }, 
         }, 
         Position = "standing", 
         Credits = 0, 
         ArmorClass = 97, 
         Flags = 
         {
            [1] = "Sentinel", 
            [24] = "NoAssist", 
            [26] = "Droid", 
            [0] = "Npc", 
         }, 
      }, 
      [10511] = 
      {
         Name = "a training remote", 
         Sex = "undistinguished", 
         Weight = 0, 
         Alignment = 0, 
         DefaultPosition = "standing", 
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
            HitNoDice = 0, 
            HitSizeDice = 10, 
            HitPlus = 20, 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         HitRoll = 0, 
         Stats = 
         {
            Strength = 0, 
            Dexterity = 0, 
            Intelligence = 0, 
            Force = 0, 
            Constitution = 0, 
            Luck = 0, 
            Wisdom = 0, 
            Charisma = 0, 
         }, 
         Vnum = 10511, 
         Race = "Human", 
         LongDescr = "A training remote hovers nearby.\
", 
         NumberOfAttacks = 0, 
         Level = 2, 
         Description = "", 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         ShortDescr = "a remote", 
         DamRoll = 0, 
         Height = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               Code = "mpecho As the remote explodes, a door opens in the wall and another \
mpecho remote floats out.\
mpmload 10511\
", 
               MudProgType = "death_prog", 
            }, 
         }, 
         Position = "standing", 
         Credits = 0, 
         ArmorClass = 95, 
         Flags = 
         {
            [1] = "Sentinel", 
            [24] = "NoAssist", 
            [26] = "Droid", 
            [0] = "Npc", 
         }, 
      }, 
      [10512] = 
      {
         Name = "a training remote", 
         Sex = "undistinguished", 
         Weight = 0, 
         Alignment = 0, 
         DefaultPosition = "standing", 
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
            HitNoDice = 0, 
            HitSizeDice = 10, 
            HitPlus = 30, 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         HitRoll = 0, 
         Stats = 
         {
            Strength = 0, 
            Dexterity = 0, 
            Intelligence = 0, 
            Force = 0, 
            Constitution = 0, 
            Luck = 0, 
            Wisdom = 0, 
            Charisma = 0, 
         }, 
         Vnum = 10512, 
         Race = "Human", 
         LongDescr = "A training remote hovers nearby.\
", 
         NumberOfAttacks = 0, 
         Level = 3, 
         Description = "", 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         ShortDescr = "a remote", 
         DamRoll = 0, 
         Height = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               Code = "mpecho As the remote explodes, a door opens in the wall and another \
mpecho remote floats out.\
mpmload 10512\
", 
               MudProgType = "death_prog", 
            }, 
         }, 
         Position = "standing", 
         Credits = 0, 
         ArmorClass = 92, 
         Flags = 
         {
            [1] = "Sentinel", 
            [24] = "NoAssist", 
            [26] = "Droid", 
            [0] = "Npc", 
         }, 
      }, 
      [10513] = 
      {
         Name = "a training remote", 
         Sex = "undistinguished", 
         Weight = 0, 
         Alignment = 0, 
         DefaultPosition = "standing", 
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
            HitNoDice = 0, 
            HitSizeDice = 10, 
            HitPlus = 40, 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         HitRoll = 0, 
         Stats = 
         {
            Strength = 0, 
            Dexterity = 0, 
            Intelligence = 0, 
            Force = 0, 
            Constitution = 0, 
            Luck = 0, 
            Wisdom = 0, 
            Charisma = 0, 
         }, 
         Vnum = 10513, 
         Race = "Human", 
         LongDescr = "A training remote hovers nearby.\
", 
         NumberOfAttacks = 0, 
         Level = 4, 
         Description = "", 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         ShortDescr = "a remote", 
         DamRoll = 0, 
         Height = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               Code = "mpecho As the remote explodes, a door opens in the wall and another \
mpecho remote floats out.\
mpmload 10513\
", 
               MudProgType = "death_prog", 
            }, 
         }, 
         Position = "standing", 
         Credits = 0, 
         ArmorClass = 90, 
         Flags = 
         {
            [1] = "Sentinel", 
            [24] = "NoAssist", 
            [26] = "Droid", 
            [0] = "Npc", 
         }, 
      }, 
      [10514] = 
      {
         Name = "a training remote", 
         Sex = "undistinguished", 
         Weight = 0, 
         Alignment = 0, 
         DefaultPosition = "standing", 
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
            HitNoDice = 1, 
            HitSizeDice = 10, 
            HitPlus = 50, 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         HitRoll = 0, 
         Stats = 
         {
            Strength = 0, 
            Dexterity = 0, 
            Intelligence = 0, 
            Force = 0, 
            Constitution = 0, 
            Luck = 0, 
            Wisdom = 0, 
            Charisma = 0, 
         }, 
         Vnum = 10514, 
         Race = "Human", 
         LongDescr = "A training remote hovers nearby.\
", 
         NumberOfAttacks = 0, 
         Level = 5, 
         Description = "", 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         ShortDescr = "a remote", 
         DamRoll = 0, 
         Height = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               Code = "mpecho As the remote explodes, a door opens in the wall and another \
mpecho remote floats out.\
mpmload 10514\
", 
               MudProgType = "death_prog", 
            }, 
         }, 
         Position = "standing", 
         Credits = 0, 
         ArmorClass = 87, 
         Flags = 
         {
            [1] = "Sentinel", 
            [24] = "NoAssist", 
            [30] = "Prototype", 
            [26] = "Droid", 
            [0] = "Npc", 
         }, 
      }, 
      [10515] = 
      {
         Name = "Corsec Agent", 
         Sex = "undistinguished", 
         Weight = 0, 
         Alignment = 0, 
         DefaultPosition = "standing", 
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
            HitNoDice = 4, 
            HitSizeDice = 10, 
            HitPlus = 200, 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         HitRoll = 4, 
         VipFlags = 
         {
            [17] = "Hoth", 
         }, 
         SpecFuns = 
         {
            [1] = "spec_police_attack", 
            [0] = "spec_guardian", 
         }, 
         Stats = 
         {
            Strength = 0, 
            Dexterity = 0, 
            Intelligence = 0, 
            Force = 0, 
            Constitution = 0, 
            Luck = 0, 
            Wisdom = 0, 
            Charisma = 0, 
         }, 
         Vnum = 10515, 
         Race = "Human", 
         LongDescr = "A Corsec Agent patrolls the area.\
", 
         NumberOfAttacks = 0, 
         Level = 20, 
         Description = "", 
         Damage = 
         {
            DamNoDice = 2, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         ShortDescr = "a corsec agent", 
         DamRoll = 4, 
         Height = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               Code = "if ovnumcarry(54) < 1\
mpoload 54\
wield t-21\
endif\
", 
               MudProgType = "fight_prog", 
            }, 
         }, 
         Position = "standing", 
         Credits = 0, 
         ArmorClass = 50, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
      }, 
      [10516] = 
      {
         Name = "chef", 
         Sex = "female", 
         Weight = 0, 
         Alignment = 0, 
         DefaultPosition = "standing", 
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
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         HitRoll = 0, 
         Race = "Human", 
         Stats = 
         {
            Strength = 0, 
            Dexterity = 0, 
            Intelligence = 0, 
            Force = 0, 
            Constitution = 0, 
            Luck = 0, 
            Wisdom = 0, 
            Charisma = 0, 
         }, 
         Vnum = 10516, 
         Immune = 
         {
            [20] = "magic", 
            [11] = "charm", 
         }, 
         LongDescr = "A chef is here preparing mouthwatering food.\
", 
         NumberOfAttacks = 0, 
         Level = 1, 
         Description = "", 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         ShortDescr = "A chef", 
         DamRoll = 0, 
         Height = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "food", 
               Code = "emote asks, '&PWhat kind of food?  A salad or a steak?&R&W'\
", 
               MudProgType = "speech_prog", 
            }, 
            [2] = 
            {
               Arguments = "steak", 
               Code = "mpoload 10541\
emote smiles and says, '&PThere are go, $n.&R&W'\
give steak $n\
drop all\
", 
               MudProgType = "speech_prog", 
            }, 
            [3] = 
            {
               Arguments = "salad", 
               Code = "mpoload 10542\
emote smiles and says, '&PEnjoy, $n.&R&W'\
give salad $n\
drop all\
", 
               MudProgType = "speech_prog", 
            }, 
         }, 
         Position = "standing", 
         Credits = 0, 
         ArmorClass = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [27] = "NoCorpse", 
         }, 
      }, 
      [10517] = 
      {
         Name = "orchestra band", 
         Sex = "undistinguished", 
         Weight = 0, 
         Alignment = 0, 
         DefaultPosition = "standing", 
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
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         HitRoll = 0, 
         Race = "Human", 
         Stats = 
         {
            Strength = 0, 
            Dexterity = 0, 
            Intelligence = 0, 
            Force = 0, 
            Constitution = 0, 
            Luck = 0, 
            Wisdom = 0, 
            Charisma = 0, 
         }, 
         Vnum = 10517, 
         Immune = 
         {
            [20] = "magic", 
            [11] = "charm", 
         }, 
         LongDescr = "A small group of musicians play quietly off to the side.\
", 
         NumberOfAttacks = 0, 
         Level = 1, 
         Description = "", 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         ShortDescr = "An orchestra", 
         DamRoll = 0, 
         Height = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "10", 
               Code = "mpecho &cSoft, beautiful music lifts from the band. \
", 
               MudProgType = "rand_prog", 
            }, 
         }, 
         Position = "standing", 
         Credits = 0, 
         ArmorClass = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
      }, 
      [10518] = 
      {
         Name = "waiter", 
         Sex = "male", 
         Weight = 0, 
         Alignment = 0, 
         DefaultPosition = "standing", 
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
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         HitRoll = 0, 
         Race = "Human", 
         Stats = 
         {
            Strength = 0, 
            Dexterity = 0, 
            Intelligence = 0, 
            Force = 0, 
            Constitution = 0, 
            Luck = 0, 
            Wisdom = 0, 
            Charisma = 0, 
         }, 
         Vnum = 10518, 
         Immune = 
         {
            [20] = "magic", 
            [11] = "charm", 
         }, 
         LongDescr = "A young man in fine clothes is here greeting guests.\
", 
         NumberOfAttacks = 0, 
         Level = 1, 
         Description = "", 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         ShortDescr = "A young waiter", 
         DamRoll = 0, 
         Height = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               Code = "mpecho &cThe young man bows deeply before $n.\
mpecho He says, '&PGreetings, $n.&R&W'\
mpecho He smiles, '&PCan I get you a bottle of wine?&R&W'\
", 
               MudProgType = "all_greet_prog", 
            }, 
            [2] = 
            {
               Arguments = "Yes", 
               Code = "mpoload 10545\
give wine $n\
mpecho He says, '&PThere you go, $n.&R&W'\
drop all\
", 
               MudProgType = "speech_prog", 
            }, 
            [3] = 
            {
               Arguments = "No", 
               Code = "sniff\
mpecho He says, '&PAs you wish, $n.&R&W'\
bow\
", 
               MudProgType = "speech_prog", 
            }, 
         }, 
         Position = "standing", 
         Credits = 0, 
         ArmorClass = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
         }, 
      }, 
      [10572] = 
      {
         Name = "Niku", 
         Sex = "undistinguished", 
         Weight = 0, 
         Alignment = 0, 
         DefaultPosition = "standing", 
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
            HitNoDice = 3, 
            HitSizeDice = 10, 
            HitPlus = 160, 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         HitRoll = 3, 
         SpecFuns = 
         {
            [1] = "spec_customs_smut", 
            [0] = "spec_customs_weapons", 
         }, 
         Stats = 
         {
            Strength = 0, 
            Dexterity = 0, 
            Intelligence = 0, 
            Force = 0, 
            Constitution = 0, 
            Luck = 0, 
            Wisdom = 0, 
            Charisma = 0, 
         }, 
         Vnum = 10572, 
         Race = "Human", 
         LongDescr = "Niku, the weapons check girl will check in your weapons while your here\
", 
         NumberOfAttacks = 0, 
         Level = 16, 
         Description = "", 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         ShortDescr = "Niku", 
         DamRoll = 3, 
         Height = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "prog 20", 
               Code = "time_prg 16\
mpecho Niku leaves in a rush\
mpgoto 10556\
drop all\
mpgoto 10554\
mpecho Niku has returned to her post\
", 
               MudProgType = "hitprcnt_prog", 
            }, 
         }, 
         Position = "standing", 
         Credits = 0, 
         ArmorClass = 60, 
         Flags = 
         {
            [1] = "Sentinel", 
            [2] = "Scavenger", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [6] = "StayArea", 
            [15] = "Guardian", 
         }, 
      }, 
      [10570] = 
      {
         Name = "shistanoven guard", 
         Sex = "undistinguished", 
         Weight = 0, 
         Alignment = 0, 
         DefaultPosition = "standing", 
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
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         HitChance = 
         {
            HitNoDice = 21, 
            HitSizeDice = 10, 
            HitPlus = 1050, 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         HitRoll = 21, 
         Stats = 
         {
            Strength = 0, 
            Dexterity = 0, 
            Intelligence = 0, 
            Force = 0, 
            Constitution = 0, 
            Luck = 0, 
            Wisdom = 0, 
            Charisma = 0, 
         }, 
         Vnum = 10570, 
         NumberOfAttacks = 0, 
         LongDescr = "A burly and well armed shistanoven guard stands here and glares at you.\
", 
         AttackFlags = 
         {
            [0] = "bite", 
            [4] = "punch", 
         }, 
         Level = 105, 
         Description = "", 
         Damage = 
         {
            DamNoDice = 10, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         ShortDescr = "A Shistanoven Guard", 
         DamRoll = 21, 
         Height = 0, 
         Race = "Human", 
         Position = "standing", 
         Credits = 0, 
         ArmorClass = -162, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [17] = "NoWander", 
         }, 
      }, 
      [10549] = 
      {
         Name = "The TRIAD Syndicate", 
         Sex = "undistinguished", 
         Weight = 0, 
         Alignment = 0, 
         DefaultPosition = "standing", 
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
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         HitChance = 
         {
            HitNoDice = 21, 
            HitSizeDice = 10, 
            HitPlus = 1050, 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         HitRoll = 0, 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         Stats = 
         {
            Strength = 0, 
            Dexterity = 0, 
            Intelligence = 0, 
            Force = 0, 
            Constitution = 0, 
            Luck = 0, 
            Wisdom = 0, 
            Charisma = 0, 
         }, 
         Vnum = 10549, 
         NumberOfAttacks = 0, 
         LongDescr = "A burly and well armed shistanoven guard stands here and glares at you.\
", 
         AttackFlags = 
         {
            [0] = "bite", 
            [4] = "punch", 
         }, 
         Level = 105, 
         Description = "", 
         Damage = 
         {
            DamNoDice = 10, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         ShortDescr = "A Shistanoven Guard", 
         DamRoll = 0, 
         Height = 0, 
         Race = "Human", 
         Position = "standing", 
         Credits = 0, 
         ArmorClass = -162, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [17] = "NoWander", 
         }, 
      }, 
      [10548] = 
      {
         Name = "Niku", 
         Sex = "undistinguished", 
         Weight = 0, 
         Alignment = 0, 
         DefaultPosition = "standing", 
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
            HitNoDice = 3, 
            HitSizeDice = 10, 
            HitPlus = 160, 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         HitRoll = 0, 
         SpecFuns = 
         {
            [1] = "spec_customs_smut", 
            [0] = "spec_customs_weapons", 
         }, 
         Stats = 
         {
            Strength = 0, 
            Dexterity = 0, 
            Intelligence = 0, 
            Force = 0, 
            Constitution = 0, 
            Luck = 0, 
            Wisdom = 0, 
            Charisma = 0, 
         }, 
         Vnum = 10548, 
         Race = "Human", 
         LongDescr = "Niku is here checking in weapons\
", 
         NumberOfAttacks = 0, 
         Level = 16, 
         Description = "", 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         ShortDescr = "Niku", 
         DamRoll = 0, 
         Height = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "5", 
               Code = "mpat 10556 drop all\
say Sorry but weapons are not allowed in the Headquarters\
emote drops something down a chute.\
", 
               MudProgType = "rand_prog", 
            }, 
         }, 
         Position = "standing", 
         Credits = 0, 
         ArmorClass = 60, 
         Flags = 
         {
            [1] = "Sentinel", 
            [2] = "Scavenger", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [30] = "Prototype", 
            [6] = "StayArea", 
            [15] = "Guardian", 
         }, 
      }, 
      [10545] = 
      {
         Name = "A Corellian pirate", 
         Sex = "undistinguished", 
         Weight = 0, 
         Alignment = 0, 
         DefaultPosition = "standing", 
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
            HitNoDice = 20, 
            HitSizeDice = 10, 
            HitPlus = 1000, 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         HitRoll = 14, 
         Stats = 
         {
            Strength = 0, 
            Dexterity = 0, 
            Intelligence = 0, 
            Force = 0, 
            Constitution = 0, 
            Luck = 0, 
            Wisdom = 0, 
            Charisma = 0, 
         }, 
         Vnum = 10545, 
         Resistant = 
         {
            [20] = "magic", 
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         LongDescr = "A dark skinned, fierce Corellian pirate is here, guarding his treasure.\
", 
         NumberOfAttacks = 3, 
         Level = 100, 
         Description = "", 
         Damage = 
         {
            DamNoDice = 10, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         ShortDescr = "A fierce Corellian pirate", 
         DamRoll = 7, 
         Height = 0, 
         Race = "Human", 
         Position = "standing", 
         Credits = 0, 
         ArmorClass = -300, 
         Flags = 
         {
            [0] = "Npc", 
            [5] = "Aggressive", 
            [2] = "Scavenger", 
            [27] = "NoCorpse", 
         }, 
      }, 
   }, 
   ResetMessage = "", 
   Resets = 
   {
      [1] = 
      {
         Command = "O", 
         MiscData = 1, 
         Arg3 = 10501, 
         Arg1 = 90, 
         Arg2 = 1, 
      }, 
      [2] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10504, 
         Arg1 = 10500, 
         Arg2 = 6, 
      }, 
      [3] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10505, 
         Arg1 = 10502, 
         Arg2 = 1, 
      }, 
      [4] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg1 = 301, 
         Arg2 = 1, 
      }, 
      [5] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg1 = 302, 
         Arg2 = 1, 
      }, 
      [6] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg1 = 305, 
         Arg2 = 1, 
      }, 
      [7] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10506, 
         Arg1 = 10503, 
         Arg2 = 1, 
      }, 
      [8] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg1 = 32207, 
         Arg2 = 1, 
      }, 
      [9] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg1 = 301, 
         Arg2 = 1, 
      }, 
      [10] = 
      {
         Command = "D", 
         MiscData = 0, 
         Arg3 = 2, 
         Arg1 = 10507, 
         Arg2 = 8, 
      }, 
      [11] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10514, 
         Arg1 = 10505, 
         Arg2 = 8, 
      }, 
      [12] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10515, 
         Arg1 = 10505, 
         Arg2 = 8, 
      }, 
      [13] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10515, 
         Arg1 = 10505, 
         Arg2 = 8, 
      }, 
      [14] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10517, 
         Arg1 = 10505, 
         Arg2 = 8, 
      }, 
      [15] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10518, 
         Arg1 = 10505, 
         Arg2 = 8, 
      }, 
      [16] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10518, 
         Arg1 = 10505, 
         Arg2 = 8, 
      }, 
      [17] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10519, 
         Arg1 = 10504, 
         Arg2 = 1, 
      }, 
      [18] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10519, 
         Arg1 = 10505, 
         Arg2 = 8, 
      }, 
      [19] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 16, 
         Arg1 = 54, 
         Arg2 = 1, 
      }, 
      [20] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10519, 
         Arg1 = 10505, 
         Arg2 = 8, 
      }, 
      [21] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 16, 
         Arg1 = 54, 
         Arg2 = 1, 
      }, 
      [22] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10521, 
         Arg1 = 10515, 
         Arg2 = 3, 
      }, 
      [23] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10521, 
         Arg1 = 10500, 
         Arg2 = 6, 
      }, 
      [24] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10522, 
         Arg1 = 10515, 
         Arg2 = 3, 
      }, 
      [25] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10526, 
         Arg1 = 10500, 
         Arg2 = 6, 
      }, 
      [26] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10528, 
         Arg1 = 10500, 
         Arg2 = 6, 
      }, 
      [27] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10529, 
         Arg1 = 10500, 
         Arg2 = 6, 
      }, 
      [28] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10554, 
         Arg1 = 10548, 
         Arg2 = 1, 
      }, 
      [29] = 
      {
         Command = "D", 
         MiscData = 0, 
         Arg3 = 2, 
         Arg1 = 10554, 
         Arg2 = 5, 
      }, 
      [30] = 
      {
         Command = "O", 
         MiscData = 1, 
         Arg3 = 10556, 
         Arg1 = 10571, 
         Arg2 = 1, 
      }, 
      [31] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg1 = 50, 
         Arg2 = 1, 
      }, 
      [32] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg1 = 54, 
         Arg2 = 1, 
      }, 
      [33] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg1 = 10311, 
         Arg2 = 1, 
      }, 
      [34] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg1 = 10313, 
         Arg2 = 1, 
      }, 
      [35] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg1 = 10569, 
         Arg2 = 1, 
      }, 
      [36] = 
      {
         Command = "O", 
         MiscData = 1, 
         Arg3 = 10564, 
         Arg1 = 10570, 
         Arg2 = 1, 
      }, 
      [37] = 
      {
         Command = "O", 
         MiscData = 1, 
         Arg3 = 10571, 
         Arg1 = 10313, 
         Arg2 = 1, 
      }, 
      [38] = 
      {
         Command = "O", 
         MiscData = 1, 
         Arg3 = 10571, 
         Arg1 = 32208, 
         Arg2 = 1, 
      }, 
      [39] = 
      {
         Command = "D", 
         MiscData = 0, 
         Arg3 = 2, 
         Arg1 = 10571, 
         Arg2 = 4, 
      }, 
      [40] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10578, 
         Arg1 = 10545, 
         Arg2 = 1, 
      }, 
      [41] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10582, 
         Arg1 = 10500, 
         Arg2 = 6, 
      }, 
      [42] = 
      {
         Command = "O", 
         MiscData = 1, 
         Arg3 = 10583, 
         Arg1 = 32208, 
         Arg2 = 1, 
      }, 
      [43] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10589, 
         Arg1 = 413, 
         Arg2 = 6, 
      }, 
      [44] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10590, 
         Arg1 = 10510, 
         Arg2 = 1, 
      }, 
      [45] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10591, 
         Arg1 = 10511, 
         Arg2 = 1, 
      }, 
      [46] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10592, 
         Arg1 = 10512, 
         Arg2 = 1, 
      }, 
      [47] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10593, 
         Arg1 = 10513, 
         Arg2 = 1, 
      }, 
      [48] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10594, 
         Arg1 = 10514, 
         Arg2 = 4, 
      }, 
      [49] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10595, 
         Arg1 = 10514, 
         Arg2 = 4, 
      }, 
      [50] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10605, 
         Arg1 = 10515, 
         Arg2 = 3, 
      }, 
      [51] = 
      {
         Command = "O", 
         MiscData = 1, 
         Arg3 = 10608, 
         Arg1 = 38, 
         Arg2 = 1, 
      }, 
      [52] = 
      {
         Command = "O", 
         MiscData = 1, 
         Arg3 = 10555, 
         Arg1 = 32208, 
         Arg2 = 1, 
      }, 
      [53] = 
      {
         Command = "D", 
         MiscData = 0, 
         Arg3 = 0, 
         Arg1 = 10555, 
         Arg2 = 3, 
      }, 
      [54] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10549, 
         Arg1 = 10517, 
         Arg2 = 1, 
      }, 
      [55] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10650, 
         Arg1 = 10518, 
         Arg2 = 1, 
      }, 
      [56] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10547, 
         Arg1 = 10516, 
         Arg2 = 1, 
      }, 
      [57] = 
      {
         Command = "O", 
         MiscData = 1, 
         Arg3 = 10548, 
         Arg1 = 10543, 
         Arg2 = 1, 
      }, 
      [58] = 
      {
         Command = "O", 
         MiscData = 1, 
         Arg3 = 10548, 
         Arg1 = 10544, 
         Arg2 = 1, 
      }, 
      [59] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10530, 
         Arg1 = 10501, 
         Arg2 = 2, 
      }, 
      [60] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg1 = 32229, 
         Arg2 = 1, 
      }, 
      [61] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg1 = 32238, 
         Arg2 = 1, 
      }, 
      [62] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg1 = 10546, 
         Arg2 = 1, 
      }, 
      [63] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10587, 
         Arg1 = 10509, 
         Arg2 = 8, 
      }, 
      [64] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10584, 
         Arg1 = 10508, 
         Arg2 = 2, 
      }, 
      [65] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg1 = 32281, 
         Arg2 = 1, 
      }, 
      [66] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg1 = 330, 
         Arg2 = 1, 
      }, 
      [67] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10545, 
         Arg1 = 10507, 
         Arg2 = 2, 
      }, 
      [68] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg1 = 10497, 
         Arg2 = 1, 
      }, 
      [69] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg1 = 324, 
         Arg2 = 1, 
      }, 
      [70] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg1 = 32210, 
         Arg2 = 1, 
      }, 
      [71] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg1 = 32234, 
         Arg2 = 1, 
      }, 
      [72] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg1 = 32280, 
         Arg2 = 1, 
      }, 
      [73] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg1 = 10494, 
         Arg2 = 1, 
      }, 
      [74] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10502, 
         Arg1 = 10506, 
         Arg2 = 1, 
      }, 
      [75] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10502, 
         Arg1 = 10500, 
         Arg2 = 6, 
      }, 
      [76] = 
      {
         Command = "O", 
         MiscData = 1, 
         Arg3 = 10572, 
         Arg1 = 32257, 
         Arg2 = 1, 
      }, 
   }, 
   Author = "Darrik", 
   VnumRanges = 
   {
      Mob = 
      {
         Last = 10572, 
         First = 10500, 
      }, 
      Room = 
      {
         Last = 10650, 
         First = 10500, 
      }, 
      Object = 
      {
         Last = 10571, 
         First = 10540, 
      }, 
   }, 
   Objects = 
   {
      [10544] = 
      {
         Name = "exquisite mahogany table", 
         Vnum = 10544, 
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
         Description = "An exquisite mahogany table is here.", 
         ShortDescr = "an exquisite mahogany table", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
         ItemType = "furniture", 
      }, 
      [10545] = 
      {
         Name = "bottle wine", 
         Vnum = 10545, 
         ObjectValues = 
         {
            [1] = 10, 
            [2] = 2, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         Layers = 0, 
         Description = "A bottle of sparkling wine lies here, looks tempting.", 
         ShortDescr = "a bottle of sparkling wine", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 1000, 
         Weight = 3, 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ItemType = "drink_container", 
      }, 
      [10546] = 
      {
         Name = "pair infrared binoculars", 
         Vnum = 10546, 
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
         Description = "A pair of infrared binoculars have been dropped here.", 
         ShortDescr = "infrared binoculars", 
         Cost = 10000, 
         ExtraDescriptions = 
         {
         }, 
         Affects = 
         {
            [1] = 
            {
               Location = 26, 
               Modifier = 32, 
            }, 
         }, 
         Weight = 1, 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ItemType = "trash", 
      }, 
      [10569] = 
      {
         Name = "Triad Backpack", 
         Vnum = 10569, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 35, 
         }, 
         Layers = 128, 
         Description = "A Triad Backpack was dropped here", 
         ShortDescr = "a Triad Backpack", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 200, 
         Weight = 1, 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
            [10] = "About", 
            [14] = "Hold", 
         }, 
         ItemType = "container", 
      }, 
      [10570] = 
      {
         Name = "Workbench", 
         Vnum = 10570, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10000, 
         }, 
         Layers = 0, 
         Description = "A Workbench is here.", 
         ShortDescr = "workbench", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
         ItemType = "container", 
      }, 
      [10571] = 
      {
         Name = "Triad Key", 
         Vnum = 10571, 
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
         Description = "A Triad Key is here.", 
         ShortDescr = "a Triad Key", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         Weight = 1, 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ItemType = "trash", 
      }, 
      [10540] = 
      {
         Name = "treasure chest", 
         Vnum = 10540, 
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
         Description = "A treasure chest is here.", 
         ShortDescr = "a treasure chest", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
         ItemType = "container", 
      }, 
      [10541] = 
      {
         Name = "delicious steak", 
         Vnum = 10541, 
         ObjectValues = 
         {
            [1] = 30, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 30, 
         }, 
         Layers = 0, 
         Description = "A delicious steak lies here rotting.", 
         ShortDescr = "a delicious steak", 
         Cost = 0, 
         ExtraDescriptions = 
         {
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               Code = "mpechoat $n &YMmmm, now that was a good steak.\
", 
               MudProgType = "use_prog", 
            }, 
         }, 
         Weight = 3, 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ItemType = "food", 
      }, 
      [10542] = 
      {
         Name = "hand tossed salad", 
         Vnum = 10542, 
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
         Description = "A hand-tossed salad lies scattered on the floor.", 
         ShortDescr = "a hand-tossed &rs&Ga&R&Wl&Ga&rd&R&W", 
         Cost = 0, 
         ExtraDescriptions = 
         {
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               Code = "mpechoat $n &GA satisfactory salad, you've had better.&R&W\
", 
               MudProgType = "use_prog", 
            }, 
         }, 
         Weight = 2, 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ItemType = "food", 
      }, 
      [10543] = 
      {
         Name = "satin cushioned mahogany chair", 
         Vnum = 10543, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 2, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         Layers = 0, 
         Description = "A satin-cushioned mahogany chair looks very comfortable.", 
         ShortDescr = "a satin cushioned mahogany chair", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
         ItemType = "furniture", 
      }, 
   }, 
   Filename = "corellia.lua", 
   Rooms = 
   {
      [10500] = 
      {
         Name = "Corellia Serin Stop", 
         Vnum = 10500, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "The docking bay on Corellia is a crowded platform.  Ships continually land,\
delivering supplies and passengers, then lift off again, millions of\
credits richer.  You see a white palace in the distance to the northeast. \
You brush by merchants and travelers as you move your way across the pad.\
", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10605, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [10501] = 
      {
         Name = "Main Street", 
         Vnum = 10501, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "Running down the center of the town, Main Street is paved with white\
marble, worn down by the feet of the millions of citizens of Corellia.\
", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10503, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10502, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10605, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [10502] = 
      {
         Name = "The Master and Fool", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [31] = "Auction", 
            [23] = "Hotel", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "The Master and Fool is one of the more frequented hotels on Corellia. \
Master Bunyon owns the establishment, although he seems to wear the\
clothes of a servant most of the time.\
 \
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10501, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10502, 
         TeleDelay = 0, 
      }, 
      [10503] = 
      {
         Name = "Street intersection", 
         Vnum = 10503, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "Running down the center of the town, Main Street is paved with white\
marble, worn down by the feet of the millions of citizens of Corellia.\
", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10510, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10504, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10501, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10522, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [10504] = 
      {
         Name = "Treasure Ship Row", 
         Vnum = 10504, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "Treasure Ship Row is lined with vendors selling all kinds of goods and\
services.  Wading through the crowd, vendors yell slogans.  More line the\
side of the road, trying to get your\
attention.\
", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10505, 
               Flags = 
               {
                  [24] = "NoMob", 
               }, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10521, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10506, 
               Flags = 
               {
                  [24] = "NoMob", 
               }, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10503, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [10505] = 
      {
         Name = "Galin's bakery", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "Galin bakes the best bread in the sector.  However, it is not the only\
attraction.  Womp rats are imported in from Tatooine and sold here, as\
well.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10504, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10505, 
         TeleDelay = 0, 
      }, 
      [10506] = 
      {
         Name = "Minit's Tavern", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "The Tavern is a popular hangout for the citizens of Corellia.  You have to\
push your way through, but the wait is well worth it when you see the\
owner... and the\
drinks\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10504, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10506, 
         TeleDelay = 0, 
      }, 
      [10507] = 
      {
         Name = "A garden", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "As you enter the garden your breath is taken away from you from the exotic\
flowers, vegatation, fruits, and many huge trees. There is a small\
trickling creak running into a small pond. There is a bench and a stone\
path leading to a house.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10521, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10573, 
               Flags = 
               {
                  [11] = "Hidden", 
               }, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10508, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "southeast", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10508, 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [3] = "Secret", 
                  [0] = "IsDoor", 
                  [11] = "Hidden", 
               }, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10507, 
         TeleDelay = 0, 
      }, 
      [10508] = 
      {
         Name = "An Empty Home", 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10507, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10508, 
         TeleDelay = 0, 
      }, 
      [10509] = 
      {
         Name = "The Corellian Ocean", 
         Sector = "water_swim", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "The green waters of the ocean are chilly to your skin, but not so much as\
to inhibit your functioning if you do not spend too much time floating.\
The waves are high, but not periously so. At the top of each crest, the\
vision of an island appears to solidify into the real thing. \
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10575, 
               Flags = 
               {
                  [4] = "Swim", 
               }, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10579, 
               Flags = 
               {
                  [4] = "Swim", 
               }, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10509, 
         TeleDelay = 0, 
      }, 
      [10510] = 
      {
         Name = "Main Street", 
         Vnum = 10510, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "Running down the center of the town, Main Street is paved with white\
marble, worn down by the feet of the millions of citizens of Corellia.\
", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10511, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10503, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [10511] = 
      {
         Name = "Street intersection", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "Main Street is intersected by Starlight Avenue here.   To the east and\
north, the palace seems closer.   To the west, are apartments and\
housing.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10580, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10512, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10510, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10524, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10511, 
         TeleDelay = 0, 
      }, 
      [10512] = 
      {
         Name = "Starlight Avenue", 
         Vnum = 10512, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "Starlight Avenue is a newer road than Main Street.  You can not see any\
worn down stones or cracked mortar in the street. \
", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10514, 
               Flags = 
               {
                  [24] = "NoMob", 
               }, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10513, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10511, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [10513] = 
      {
         Name = "An Empty Home", 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10512, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10513, 
         TeleDelay = 0, 
      }, 
      [10514] = 
      {
         Name = "Starlight Avenue", 
         Vnum = 10514, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "Starlight Avenue is a newer road than Main Street.  You can not see any\
worn down stones or cracked mortar in the street. \
", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10515, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10512, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [10515] = 
      {
         Name = "Diktat Avenue", 
         Vnum = 10515, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "This road leads to the Diktat's palace.  Black marble statues have been\
carved and placed on pedestals, standing out from the white marble of the\
street. \
", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10516, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10514, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [10516] = 
      {
         Name = "Diktat Avenue", 
         Vnum = 10516, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "This road leads to the Diktat's palace.  Black marble statues have been \
carved and placed on pedestals, standing out from the white marble of the\
street. \
", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10517, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10515, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [10517] = 
      {
         Name = "Diktat's Palace", 
         Vnum = 10517, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "The Palace is huge.  White and black marble were the primary materials in\
building this work of art.  Corellia spares no expense in making their\
Diktat feel at home. \
", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10518, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10520, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10516, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [10518] = 
      {
         Name = "Palace Hallway", 
         Vnum = 10518, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "The Palace is huge.  White and black marble were the primary materials in\
building this work of art.  Corellia spares no expense in making their\
Diktat feel at home. \
", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10519, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10517, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [10519] = 
      {
         Name = "The Throne Room", 
         Vnum = 10519, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "The Palace is huge.  White and black marble were the primary materials in\
building this work of art.  Corellia spares no expense in making their\
Diktat feel at home.  The throne room is spectacular, featuring many\
different styles of tapestries hanging on the walls. \
", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10518, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [10520] = 
      {
         Name = "Diktat's Palace", 
         Vnum = 10520, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "The Palace is huge.  White and black marble were the primary materials in\
building this work of art.  Corellia spares no expense in making their\
Diktat feel at home. \
", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10517, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [10521] = 
      {
         Name = "Treasure Ship Row", 
         Vnum = 10521, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "Treasure Ship Row is lined with vendors selling all kinds of goods and\
services.  Wading through the crowd, vendors yell slogans.  More line the\
side of the road, trying to get your attention.\
", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10625, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10507, 
               Flags = 
               {
                  [24] = "NoMob", 
               }, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10504, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [10522] = 
      {
         Name = "Treasure Ship Row", 
         Vnum = 10522, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "Treasure Ship Row is lined with vendors selling all kinds of goods and\
services.  Wading through the crowd, they yell slogans attempting to get\
your attention.  More of them line the side of the road.\
", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10627, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10503, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10545, 
               Flags = 
               {
                  [24] = "NoMob", 
               }, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10523, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [10523] = 
      {
         Name = "Treasure Ship Row", 
         Vnum = 10523, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "Treasure Ship Row is lined with vendors selling all kinds of goods and\
services.  Wading through the crowd, they yell slogans attempting to get\
your attention.  More of them line the side of the road.\
", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10522, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10569, 
               Flags = 
               {
                  [24] = "NoMob", 
               }, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10608, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [10524] = 
      {
         Name = "Starlight Avenue", 
         Vnum = 10524, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "Starlight Avenue is a newer road than Main Street.  You can not see any\
worn down stones or cracked mortar in the street. \
", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10511, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10525, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10526, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [10525] = 
      {
         Name = "An Empty Home", 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10524, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10525, 
         TeleDelay = 0, 
      }, 
      [10526] = 
      {
         Name = "Starlight Avenue", 
         Vnum = 10526, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "Starlight Avenue is a newer road than Main Street.  You can not see any\
worn down stones or cracked mortar in the street. \
", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10527, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10524, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10550, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [10527] = 
      {
         Name = "Recluse Apartment Complex", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "The Recluse Apartment's can hold many people. Maybe you should look around\
for a home here?\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10533, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10531, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10526, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10532, 
               Keyword = "", 
               Description = "", 
            }, 
            [5] = 
            {
               Direction = "up", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10528, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10527, 
         TeleDelay = 0, 
      }, 
      [10528] = 
      {
         Name = "Second Floor", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "The Recluse Apartment's can hold many people. Maybe you should look around\
for a home here?\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10537, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10535, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10538, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10536, 
               Keyword = "", 
               Description = "", 
            }, 
            [5] = 
            {
               Direction = "up", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10529, 
               Keyword = "", 
               Description = "", 
            }, 
            [6] = 
            {
               Direction = "down", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10527, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10528, 
         TeleDelay = 0, 
      }, 
      [10529] = 
      {
         Name = "Third Floor", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "The Recluse Apartment's can hold many people. Maybe you should look around\
for a home here?\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10541, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10539, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10542, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10540, 
               Keyword = "", 
               Description = "", 
            }, 
            [5] = 
            {
               Direction = "up", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10530, 
               Flags = 
               {
                  [11] = "Hidden", 
               }, 
               Keyword = "", 
               Description = "", 
            }, 
            [6] = 
            {
               Direction = "down", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10528, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10529, 
         TeleDelay = 0, 
      }, 
      [10530] = 
      {
         Name = "Secret Shop", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "down", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10529, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10530, 
         TeleDelay = 0, 
      }, 
      [10531] = 
      {
         Name = "An Empty Home", 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "75", 
               Code = "feel heal $n\
feel heal $n\
feel heal $n\
feel heal $n\
feel heal $n\
", 
               MudProgType = "rand_prog", 
            }, 
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10527, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10531, 
         TeleDelay = 0, 
      }, 
      [10532] = 
      {
         Name = "An Empty Home", 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10527, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10622, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10532, 
         TeleDelay = 0, 
      }, 
      [10533] = 
      {
         Name = "An Empty Home", 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10527, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10533, 
         TeleDelay = 0, 
      }, 
      [10534] = 
      {
         Name = "An Empty Home", 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10527, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10534, 
         TeleDelay = 0, 
      }, 
      [10535] = 
      {
         Name = "An Empty Home", 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10528, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10535, 
         TeleDelay = 0, 
      }, 
      [10536] = 
      {
         Name = "An Empty Home", 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10528, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10536, 
         TeleDelay = 0, 
      }, 
      [10537] = 
      {
         Name = "An Empty Home", 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10528, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10537, 
         TeleDelay = 0, 
      }, 
      [10538] = 
      {
         Name = "An Empty Home", 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10528, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10538, 
         TeleDelay = 0, 
      }, 
      [10539] = 
      {
         Name = "An Empty Home", 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10529, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10539, 
         TeleDelay = 0, 
      }, 
      [10540] = 
      {
         Name = "An Empty Home", 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10529, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10540, 
         TeleDelay = 0, 
      }, 
      [10541] = 
      {
         Name = "An Empty Home", 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10529, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10541, 
         TeleDelay = 0, 
      }, 
      [10542] = 
      {
         Name = "An Empty Home", 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10529, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10542, 
         TeleDelay = 0, 
      }, 
      [10543] = 
      {
         Name = "An Empty Home", 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10650, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10543, 
         TeleDelay = 0, 
      }, 
      [10544] = 
      {
         Name = "Back room", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "southwest", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10543, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10544, 
         TeleDelay = 0, 
      }, 
      [10545] = 
      {
         Name = "Turen's Hardware", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "A simple store, Turen's shop is bursting with things electronic.   He sells\
goods for a fair price and will give you a smile if you do the\
same.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10522, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10545, 
         TeleDelay = 0, 
      }, 
      [10546] = 
      {
         Name = "Bacta Tank", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "", 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               Code = "feel heal $n\
", 
               MudProgType = "rand_prog", 
            }, 
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "southwest", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10587, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10546, 
         TeleDelay = 0, 
      }, 
      [10547] = 
      {
         Name = "Kitchen", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "Here the chef prepares many fine delicasies.  On the menu for tonight is\
steak, and a salad, so tell her what you would like.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10650, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10547, 
         TeleDelay = 0, 
      }, 
      [10548] = 
      {
         Name = "Dining Room", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "This fine dining room has finely crafter furnishings that appear to be very\
expensive.  Take a seat and enjoy the great meal cooked by the chef.  Just\
make sure to clean up after yourself when you leave. \
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10650, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10548, 
         TeleDelay = 0, 
      }, 
      [10549] = 
      {
         Name = "A Ballroom", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "A beautiful room will a finished oak floor and a band playing soft music in\
the background.  Many people are dancing, having a good time.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10650, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10549, 
         TeleDelay = 0, 
      }, 
      [10550] = 
      {
         Name = "A dark alley", 
         Vnum = 10550, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "This is the entrance to an alley that runs south from here. There is very\
limited light here even in day, as shadows cover this whole area. You can\
see that the alley only runs a little ways south and then ends as it meets\
a large building's wall.\
", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10526, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10551, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [10551] = 
      {
         Name = "A dark alley", 
         Vnum = 10551, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "This seems to be the middle of the alley.  To the north, you can see the\
people walking on Starlight Avenue.   In fact, north is the only direction\
you can really see anything, as shadows press in on you from the other\
directions. To the south, there are a couple of vague outlines, that might\
be people.  This is verified as you hear two hushed voices in\
conversation.  The growls you hear don't sound pleasant.\
", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10550, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10552, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [10552] = 
      {
         Name = "The end of the alley", 
         Vnum = 10552, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "As you come to the end of the alley, you can see that the two outlines were\
in fact, two heavily armed private guards. These Shistavinians stand on\
either side of a door to the east.  The door is marked 'Private' in large\
letters.  These guards have been posted here to make sure people observe\
the sign and stay out.   And although they have not made a sound, you\
notice that both of them have dropped their hands to their weapons as they\
look directly at you.  On the wall, there is a small sign posted that\
reads, 'If you dont belong here, you should leave!!! NOW!!!'\
", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10551, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10553, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [10553] = 
      {
         Name = "Dark entrance", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "As you enter, you notice the large symbol engraved on the walls on either\
side of you.  It appears to be the symbol known throughout the galaxy for\
the Triad Syndicate. An almost silent humming of scanners running various\
tests over you and your inventory, can be heard if you stay quiet.  Due to\
the extreme privacy guarding this organization, you must know the password\
to enter the Main Lobby.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10552, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "somewhere", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10554, 
               Flags = 
               {
                  [19] = "Auto", 
                  [11] = "Hidden", 
               }, 
               Keyword = "evangelion", 
               Description = "", 
            }, 
         }, 
         Vnum = 10553, 
         TeleDelay = 0, 
      }, 
      [10554] = 
      {
         Name = "Lobby", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "This is the main lobby of the Triad's Headquarters.  There seems to be\
every possible luxury around you. Fromt he marble floors to the expensive\
gems set in the hangings on the walls.  There is a fortune put in this\
room alone.  To the north you can see the Triad Hotel, where members and\
guests may stay. To the south,  you can see that the Triad has their own\
shop here to buy and sell their wares and weapons. To the east is a\
hallway that leads to a turbolift to take you to the rest of the building.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10555, 
               Flags = 
               {
                  [2] = "Locked", 
               }, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10558, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10557, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10553, 
               Keyword = "", 
               Description = "", 
            }, 
            [5] = 
            {
               Direction = "down", 
               Distance = 0, 
               Key = 10571, 
               DestinationVnum = 10571, 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
               }, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10554, 
         TeleDelay = 0, 
      }, 
      [10555] = 
      {
         Name = "The Triad Hotel", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [8] = "Bank", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "This room is quiet and cozy. With large couches and soft music playing from\
somewhere you almost feel a need to lie down and take a rest. This hotel\
was added here strictly for members of the Triad Syndicate so as to not\
inconvieniance them with traveling around for a hotel. While the lighting\
is low, it is adequate enough to see the log book on the lobby desk and\
see that there are plenty of rooms left. To the west is the storeroom of \
the headquarters. \
You see an ATM machine attached to the wall here.\
 \
You may safely save and quit here.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10554, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = 10571, 
               DestinationVnum = 10556, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Keyword = "grate", 
               Description = "", 
            }, 
         }, 
         Vnum = 10555, 
         TeleDelay = 0, 
      }, 
      [10556] = 
      {
         Name = "Weapons Storage", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "This durasteel walled storeroom is for members to reclaim any weapons that\
may have been checked in when they entered the lobby. There is a large\
somewhat organized shelf system here where the weapons sit or hang. Any\
Triad member engineers may drop off weapons or armor in this room for\
delivery to the clan. To the south is a one way exit to the entrance. This\
exit may be used to reclaim or pick up weapons and leave while bypassing\
the weapons check in the lobby. \
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10555, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10553, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10556, 
         TeleDelay = 0, 
      }, 
      [10557] = 
      {
         Name = "Shop", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "This is the shop of the Triad Syndicate. At this shop members can sell\
weapons that they may have 'come across' to the salesman for credits no\
questions asked. They may also buy standard weapons and other items that\
members may have sold here in the past. A large shelf behind the counter\
seems to be filled to overflowing with assorted items.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10554, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10570, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10557, 
         TeleDelay = 0, 
      }, 
      [10558] = 
      {
         Name = "Stairway First Floor", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "This stairway is quite elegant with marble floors and an engraved banister.\
The stairs lead up to the Lounge Room and the Secondary Apartments. To the\
west is the Main Lobby. \
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10554, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "up", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10559, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10558, 
         TeleDelay = 0, 
      }, 
      [10559] = 
      {
         Name = "Stairway Second Floor", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "The stairway here has marble floors and an engraved banister as well as\
some precious metals hammered into the sides of the steps. The stairs lead\
up to the Meeting Room and the Penthouse apartment while down from here is\
the Main Lobby. To the west is a very nice and well lit hallway.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10565, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "up", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10560, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "down", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10558, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10559, 
         TeleDelay = 0, 
      }, 
      [10560] = 
      {
         Name = "Stairway Third Floor", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "The landing here at the top of the stairs is engraved as well as encrusted\
with many precious gems and metels. The walls are adorned with pictures\
that seem to focus around the possesions of the Triad Syndicate. Some of\
ships and some of buildings, they all seem very elegant and placed proudly\
and in plain view.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "down", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10559, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "northwest", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10567, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "southwest", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10568, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10560, 
         TeleDelay = 0, 
      }, 
      [10561] = 
      {
         Name = "An Empty Home", 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10565, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10561, 
         TeleDelay = 0, 
      }, 
      [10562] = 
      {
         Name = "An Empty Home", 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10566, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10562, 
         TeleDelay = 0, 
      }, 
      [10563] = 
      {
         Name = "Private Lounge", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "This is the lounge for relaxing among clan memebers. This room is generaly\
reserved for Triads only and if you are a guest here you should not be in\
here. There are many different sofas and chairs around the room for\
members to relax and meet with one another. To the north is the hallway\
that leads to the secondary apartments and the stairway through the\
building.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10565, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10563, 
         TeleDelay = 0, 
      }, 
      [10564] = 
      {
         Name = "Workshop", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [26] = "Factory", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "This room is intended to be used by the engineers of the Triad.  There are\
racks of tools lining the walls, and a workbench also holds some tools.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10566, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10564, 
         TeleDelay = 0, 
      }, 
      [10565] = 
      {
         Name = "Hallway", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "This is the floor dedicated to the secondary apartments for the first\
second and third of the clan. It has polished wood floors that echo with\
your steps. To the west you can see the end of the hallway. To the north\
is the apartment for the first of the clan. To the south is the private\
lounge for resting and visiting between assignments.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10561, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10559, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10563, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10566, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10565, 
         TeleDelay = 0, 
      }, 
      [10566] = 
      {
         Name = "Hallway", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "This is the floor dedicated to the secondary apartments for the first\
second and third of the clan. It has polished wood floors that echo with\
your steps. To the east you can see the stairway leading through the\
builing. To the north stands the door for the apartment of the second in\
the clan. To the south is the apartment for the third.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10562, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10565, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10564, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10566, 
         TeleDelay = 0, 
      }, 
      [10567] = 
      {
         Name = "An Empty Home", 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10568, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "southeast", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10560, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10567, 
         TeleDelay = 0, 
      }, 
      [10568] = 
      {
         Name = "Meeting Room", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "This is the main meeting room for the Leader and secondary members of The\
Triad Syndicate to meet and decide policy and action. The room is\
dominated by a large cirular table with a Triad symbol emblazened in the\
center of it. There are 25 chairs surronding the table for meetings with\
other clan leaders and for meeting with many members of this clan.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10567, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "northeast", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10560, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10568, 
         TeleDelay = 0, 
      }, 
      [10569] = 
      {
         Name = "Enterance to Steven's Mansion", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "Kasaan's mansion towers above you, inspiring you with wonder... maybe you\
should take a look around.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10523, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "northeast", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10650, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10569, 
         TeleDelay = 0, 
      }, 
      [10570] = 
      {
         Name = "Armor Repair", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "", 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "", 
               Code = "mpechoat $n Faro looks around nervously.\
", 
               MudProgType = "rand_prog", 
            }, 
            [2] = 
            {
               Arguments = "", 
               Code = "Faro looks up from his book.\
Faro says, \"Hello got something for me to\
fix?\"\
Faro peers around the corner nervously.\
", 
               MudProgType = "greet_prog", 
            }, 
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10557, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10570, 
         TeleDelay = 0, 
      }, 
      [10571] = 
      {
         Name = "Triad Jail", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [10] = "Safe", 
            [23] = "Hotel", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "up", 
               Distance = 0, 
               Key = 10571, 
               DestinationVnum = 10554, 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
               }, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10571, 
         TeleDelay = 0, 
      }, 
      [10572] = 
      {
         Name = "A high clifftop", 
         Sector = "field", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "Once at the top of the cliffs, you find a quiet meadow.   Tall grass sways\
in the ocean breeze.  The sun beats down on you mercilessly. There are\
piles of rocks scattered all over the place, perhaps they are ancient\
markers of some sort. \
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10577, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10578, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10575, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10572, 
         TeleDelay = 0, 
      }, 
      [10573] = 
      {
         Name = "A hidden cove", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "A small path from the garden leads down to a rocky beach.  The Corellian\
Ocean laps at your feet as you stand on one of the slippery rocks. The\
water is a clear deep green, and many fish swim its depths.   Far upon the\
watery horizon, you see what appears to be perhaps an island. Are you\
brave enough to swim out and see what is there?\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10579, 
               Flags = 
               {
                  [4] = "Swim", 
               }, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10507, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10573, 
         TeleDelay = 0, 
      }, 
      [10575] = 
      {
         Name = "A sandy beach", 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "The Corellian ocean laps at the edges of this tranquil beach.  The sand is\
a coarser type that is slightly sticky.   A few rocks protrude from the\
ground at the edge where the sand meets the vegetation of the island. Tall\
trees sway in the cooling trade winds, and the Corellian sun heats you\
pleasantly.  The steep wall of a cliff rises precipitously from the jungle\
immediately to your east.  The beach continues to the northeast and\
southwest.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10572, 
               Flags = 
               {
                  [7] = "Climb", 
               }, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10509, 
               Flags = 
               {
                  [4] = "Swim", 
               }, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "northeast", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10576, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "southeast", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10578, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10575, 
         TeleDelay = 0, 
      }, 
      [10576] = 
      {
         Name = "A sandy beach", 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "The Corellian ocean laps at the edges of this tranquil beach.  The sand is\
a coarser type that is slightly sticky.   A few rocks protrude from the\
ground at the edge where the sand meets the vegetation of the island. Tall\
trees sway in the cooling trade winds, and the Corellian sun heats you\
pleasantly.  The steep wall of a cliff rises precipitously from the jungle\
immediately to your south.  The beach continues to the southeast and\
southwest.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10572, 
               Flags = 
               {
                  [7] = "Climb", 
               }, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "southeast", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10577, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "southwest", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10575, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10576, 
         TeleDelay = 0, 
      }, 
      [10577] = 
      {
         Name = "A sandy beach", 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "The Corellian ocean laps at the edges of this tranquil beach.  The sand is\
a coarser type that is slightly sticky.   A few rocks protrude from the\
ground at the edge where the sand meets the vegetation of the island. Tall\
trees sway in the cooling trade winds, and the Corellian sun heats you\
pleasantly.  The steep wall of a cliff rises precipitously from the jungle\
immediately to your west. The beach continues to the northwest and\
southwest.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10572, 
               Flags = 
               {
                  [7] = "Climb", 
               }, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "northwest", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10576, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "southwest", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10578, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10577, 
         TeleDelay = 0, 
      }, 
      [10578] = 
      {
         Name = "A sandy beach", 
         Sector = "desert", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "The Corellian ocean laps at the edges of this tranquil beach.  The sand is\
a coarser type that is slightly sticky.   A few rocks protrude from the\
ground at the edge where the sand meets the vegetation of the island. Tall\
trees sway in the cooling trade winds, and the Corellian sun heats you\
pleasantly.  The steep wall of a cliff rises precipitously from the jungle\
immediately to your north. The beach continues to the northwest and\
northeast. \
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10572, 
               Flags = 
               {
                  [7] = "Climb", 
               }, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "northeast", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10577, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "northwest", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10575, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10578, 
         TeleDelay = 0, 
      }, 
      [10579] = 
      {
         Name = "The Corellian Ocean", 
         Sector = "water_swim", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "The green waters of the ocean are chilly to your skin, but not so much as\
to inhibit your functioning if you do not spend too much time floating.\
The waves are high, but not periously so. At the top of each crest, the\
vision of an island appears to solidify into the real thing.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10509, 
               Flags = 
               {
                  [4] = "Swim", 
               }, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10573, 
               Flags = 
               {
                  [4] = "Swim", 
               }, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10579, 
         TeleDelay = 0, 
      }, 
      [10580] = 
      {
         Name = "Main Street", 
         Vnum = 10580, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10581, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10511, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [10581] = 
      {
         Name = "Street Intersection", 
         Vnum = 10581, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "Main street continues north into the Corellian main plaza.  To the west is\
the Corellian school, Coronet Academy. Corsec agents patrol the clean\
streets, and pedestrians walk without fear here.\
", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10582, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10580, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10587, 
               Flags = 
               {
                  [24] = "NoMob", 
               }, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [10582] = 
      {
         Name = "Plaza Entrance", 
         Vnum = 10582, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "The Corellian plaza, is a clean and airy area.  Couples stroll around the\
wide walkways.  A few speeders weave through them easily.  Peace and\
security are maintained by Corsec agents.\
", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10583, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10581, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10620, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "northeast", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10585, 
               Keyword = "", 
               Description = "", 
            }, 
            [5] = 
            {
               Direction = "northwest", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10584, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [10583] = 
      {
         Name = "Central Plaza", 
         Vnum = 10583, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10586, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10585, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10582, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10584, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [10584] = 
      {
         Name = "West Plaza", 
         Vnum = 10584, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "The Corellian plaza, is a clean and airy area.  Couples stroll around the\
wide walkways.  A few speeders weave through them easily.  Peace and\
security are maintained by Corsec agents\
", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10583, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "northeast", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10586, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "southeast", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10582, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [10585] = 
      {
         Name = "East Plaza", 
         Vnum = 10585, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10583, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "northwest", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10586, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "southwest", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10582, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [10586] = 
      {
         Name = "North Plaza", 
         Vnum = 10586, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10583, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "northeast", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10596, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "southeast", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10585, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "southwest", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10584, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [10587] = 
      {
         Name = "Coronet Academy", 
         Vnum = 10587, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "The Coronet Academy was created to train the Corellian guard.  Mainly\
concentrating on combat skills, it is the ideal place for a new arrival to\
begin.\
", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10588, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10581, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10590, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "northeast", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10546, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [10588] = 
      {
         Name = "Target Range", 
         Vnum = 10588, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10587, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10589, 
               Flags = 
               {
                  [25] = "Window", 
               }, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [10589] = 
      {
         Name = "Target Area", 
         Vnum = 10589, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10588, 
               Flags = 
               {
                  [24] = "NoMob", 
               }, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [10590] = 
      {
         Name = "Combat Training 1", 
         Vnum = 10590, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10591, 
               Flags = 
               {
                  [24] = "NoMob", 
               }, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10587, 
               Flags = 
               {
                  [24] = "NoMob", 
               }, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [10591] = 
      {
         Name = "Combat Training 2", 
         Vnum = 10591, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10590, 
               Flags = 
               {
                  [24] = "NoMob", 
               }, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10592, 
               Flags = 
               {
                  [24] = "NoMob", 
               }, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [10592] = 
      {
         Name = "Combat Training 3", 
         Vnum = 10592, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10591, 
               Flags = 
               {
                  [24] = "NoMob", 
               }, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10593, 
               Flags = 
               {
                  [24] = "NoMob", 
               }, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [10593] = 
      {
         Name = "Combat Training 4", 
         Vnum = 10593, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10592, 
               Flags = 
               {
                  [24] = "NoMob", 
               }, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10594, 
               Flags = 
               {
                  [24] = "NoMob", 
               }, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [10594] = 
      {
         Name = "Combat Training 5", 
         Vnum = 10594, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10595, 
               Flags = 
               {
                  [24] = "NoMob", 
               }, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10593, 
               Flags = 
               {
                  [24] = "NoMob", 
               }, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [10595] = 
      {
         Name = "Combat Training 6", 
         Vnum = 10595, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10594, 
               Flags = 
               {
                  [24] = "NoMob", 
               }, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [10596] = 
      {
         Name = "Corellia Shipyard", 
         Vnum = 10596, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10597, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10599, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "southwest", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10586, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [10597] = 
      {
         Name = "Corellian Shipyard", 
         Vnum = 10597, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10598, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10596, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [10598] = 
      {
         Name = "Corellian Shipyard", 
         Vnum = 10598, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10601, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10599, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10597, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [10599] = 
      {
         Name = "Corellian Shipyard", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10598, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10600, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10596, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10599, 
         TeleDelay = 0, 
      }, 
      [10600] = 
      {
         Name = "Corellian Shipyard", 
         Vnum = 10600, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10601, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10603, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10599, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [10601] = 
      {
         Name = "Corellian Shipyard", 
         Vnum = 10601, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10600, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10598, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [10602] = 
      {
         Name = "Shipyard Launching Bay", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "", 
         Exits = 
         {
         }, 
         Vnum = 10602, 
         TeleDelay = 0, 
      }, 
      [10603] = 
      {
         Name = "Shipyard Landing Bay", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [4] = "CanLand", 
            [5] = "CanFly", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10600, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10603, 
         TeleDelay = 0, 
      }, 
      [10605] = 
      {
         Name = "Corellia Docking Bay", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [4] = "CanLand", 
            [5] = "CanFly", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "The docking bay on Corellia is a crowded platform.  Ships continually land,\
delivering supplies and passengers, then lift off again, millions of\
credits richer.  You see a white palace in the distance to the northeast.\
You brush by merchants and travelers as you move your way across the pad.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10501, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10500, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10605, 
         TeleDelay = 0, 
      }, 
      [10606] = 
      {
         Name = "An Empty Home", 
         Sector = "inside", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10609, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10606, 
         TeleDelay = 0, 
      }, 
      [10607] = 
      {
         Name = "A Factory", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [26] = "Factory", 
            [2] = "NoMob", 
            [23] = "Hotel", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "Here it be, home and work.  The interior has been redesigned to resemble\
that of a simple hut, like that in Honoghr, but off to the side, half of\
the room is occupied by a real office and workstation, where the Chief\
Exec works upon the machineries and papers that happen to come upon his\
hands.  Automated tools lie strewn about, and storage compartments serve\
to stock his extra supplies.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10609, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10607, 
         TeleDelay = 0, 
      }, 
      [10608] = 
      {
         Name = "Galatech Corporation", 
         Sector = "city", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "prices", 
               Description = "Items         |    Price |\
\13Container     |    100   |\
\13Comlink       |    450   |\
\13Flashlight    |    400   |\
\13ARMOR                    \
\13Full Armor    |  55,000  |\
\13Shield        |  10,000  |\
\13Jewelry (one) |   150    |\
\13Armor Piece   |   250    |\
\13WEAPONS\
\13Vibro-blade   |   600    |\
\13Blaster       |  4,000   |\
\13Landmine      |  1,000   |\
\13Grenade       |  1,000   |\
\13", 
            }, 
            [2] = 
            {
               Keyword = "list", 
               Description = "&gEMPLOYEE         &c|&C RANK            &c|&Y FL/ROOM\
\13&C==============================================\
\13&gDaraen Khi'hone  &c|&C Chief Executive &c|&Y 1/N\
\13&gHemini           &c|&C Executive       &c|&R N/A\
\13&gDena Dar'kyyon   &c|&C Engineer        &c|&Y 1/W\
\13&gK1-39 (DarweidU) &c|&C Engineer        &c|&R N/A\
\13&gDK-83 (Deimos)   &c|&C Apprentice      &c|&R N/A\
\13&gDartan Vinas     &c|&C Apprentice      &c|&R N/A\
\13&gDeacon           &c|&C Apprentice      &c|&R N/A\
\13&gNottingham       &c|&C Apprentice      &c|&R N/A\
\13", 
            }, 
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "Here you enter the shop for Galatech Corporations, owned by Daraen of the\
Khi'hone.  A collection of freelance engineers have setup shop here to\
serve any who are in need of equipment of any kind. This place has a\
reputation of sending out orders within a week. Surrounded by an array of\
display models, an oak counter sits at the back of the shop, sporting two\
terminals. One terminal shows the list of prices, while the other shows a\
list of orders. This way, one can place an order while all engineers are\
away, and pay as necessary, and there is no charge for holding your order.\
At the back, a door remains locked, serving as the backroom to where all\
the employees work and live. \
 \
To see the list of prices, type 'Look prices'.\
To see the Engineers of GalaTech, type \"Look List\"\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10609, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10523, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10608, 
         TeleDelay = 0, 
      }, 
      [10609] = 
      {
         Name = "Office Hallway", 
         Sector = "city", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "rules", 
               Description = "&G*&C  Each Employee has his/her/its own room, and can share with as\
\13&C   many as possible.  (Ask IMM for new room, up to 7.)\
\13&G*&C  Each room has a workshop, but no refinery.  NO SPICES!\
\13&G*&C  No deviation from any listed prices.\
\13&G*&C  Each order sent via mail shall be answered promptly\
\13&G*&C  Each engineer will mail to their customer that their order is\
\13&C   ready, when it is ready.\
\13&G*&C  Your work here is freelance, stick to the prices, and you may\
\13&C   stay as long as you like, and keep all your money.\
\13", 
            }, 
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "A hallway of offices lead down along the shop, each one consisting of a\
chamber for the engineers to use as their apartment and private workshop.\
Three doors line either-side of the hall, while at the very back, with a\
brass nameplate, lies the bedroom-office of the owner of Galatech Corp.\
 \
Employees, please read rules, type \"Look Rules\".\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10607, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10608, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10606, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10609, 
         TeleDelay = 0, 
      }, 
      [10610] = 
      {
         Name = "Training Center", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
            [4] = "CanLand", 
            [30] = "Prototype", 
            [5] = "CanFly", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "", 
         Exits = 
         {
         }, 
         Vnum = 10610, 
         TeleDelay = 0, 
      }, 
      [10620] = 
      {
         Name = "Corellian Central Bank", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [8] = "Bank", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "The Corellian bank is well appointed.  Cool air filters in with soft muzac\
through overhead ducts. A few cushioned chairs and plants are placed\
strategically throughout the lobby.   Innumerable guards, droids, monitors\
and barriers provide protection for customers. Several privacy booths and\
desks are available for more involved transactions.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10582, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10620, 
         TeleDelay = 0, 
      }, 
      [10622] = 
      {
         Name = "A small room", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [26] = "Factory", 
            [25] = "Refinery", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "This room is small but relatively organized.  There is a wooden table and\
many exotic tools for working on various projects. There is a power\
generator in the corner with many outlets.  It would be an excellent place\
to design some equipment.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10532, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10622, 
         TeleDelay = 0, 
      }, 
      [10625] = 
      {
         Name = "Treasure Ship Row", 
         Vnum = 10625, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "Treasure Ship Row is lined with vendors selling all kinds of goods and\
services.  Wading through the crowd, vendors yell slogans.  More line the\
side of the road, trying to get your attention.\
", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10626, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10631, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10630, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10521, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [10626] = 
      {
         Name = "A Small Plaza", 
         Vnum = 10626, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "A Small Plaza leads off of Treasure Row.  The colorful signs of vendors \
attract the eye. Several have incredible designs in various spectrums, \
invisible to the human eye.  In the plaza, each shop can be bought and \
privately owned.\
", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10633, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10625, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10632, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "northeast", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10629, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [10627] = 
      {
         Name = "A Small Plaza", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "A Small Plaza leads off of Treasure Row.  The colorful signs of vendors \
attract the eye. Several have incredible designs in various spectrums, \
invisible to the human eye.  In the plaza, each shop can be bought and \
privately owned. \
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10628, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10638, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10522, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10637, 
               Keyword = "", 
               Description = "", 
            }, 
            [5] = 
            {
               Direction = "northeast", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10636, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10627, 
         TeleDelay = 0, 
      }, 
      [10628] = 
      {
         Name = "A Small Plaza", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "A Small Plaza leads off of Treasure Row.  The colorful signs of vendors \
attract the eye. Several have incredible designs in various spectrums, \
invisible to the human eye.  In the plaza, each shop can be bought and \
privately owned. \
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10640, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10636, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10627, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10639, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10628, 
         TeleDelay = 0, 
      }, 
      [10629] = 
      {
         Name = "A Small Plaza", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "A Small Plaza leads off of Treasure Row.  The colorful signs of vendors \
attract the eye. Several have incredible designs in various spectrums, \
invisible to the human eye.  In the plaza, each shop can be bought and \
privately owned.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10635, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10634, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "southwest", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10626, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10629, 
         TeleDelay = 0, 
      }, 
      [10630] = 
      {
         Name = "An Empty Shop", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [28] = "PlayerShop", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "Shelves line the walls of this shop, and several high quality glass  cases\
stand in rows.  If the shop has been bought, there will be a  shopkeeper\
here to sell you his wares. \
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10625, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10630, 
         TeleDelay = 0, 
      }, 
      [10631] = 
      {
         Name = "Corellian Engineering Corporation", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [28] = "PlayerShop", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "Shelves line the walls of this shop, and several high quality glass  cases\
stand in rows.  If the shop has been bought, there will be a  shopkeeper\
here to sell you his wares. \
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10625, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10631, 
         TeleDelay = 0, 
      }, 
      [10632] = 
      {
         Name = "An Empty Shop", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [28] = "PlayerShop", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "Shelves line the walls of this shop, and several high quality glass  cases\
stand in rows.  If the shop has been bought, there will be a  shopkeeper\
here to sell you his wares.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10626, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10632, 
         TeleDelay = 0, 
      }, 
      [10633] = 
      {
         Name = "&z&OA small shop&R&W", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [28] = "PlayerShop", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "Shelves line the walls of this shop, and several high quality glass  cases\
stand in rows.  If the shop has been bought, there will be a  shopkeeper\
here to sell you his wares.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10626, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10633, 
         TeleDelay = 0, 
      }, 
      [10634] = 
      {
         Name = "An Empty Shop", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [28] = "PlayerShop", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "Shelves line the walls of this shop, and several high quality glass  cases\
stand in rows.  If the shop has been bought, there will be a  shopkeeper\
here to sell you his wares.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10629, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10634, 
         TeleDelay = 0, 
      }, 
      [10635] = 
      {
         Name = "An Empty Shop", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [28] = "PlayerShop", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "Shelves line the walls of this shop, and several high quality glass  cases\
stand in rows.  If the shop has been bought, there will be a  shopkeeper\
here to sell you his wares.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10629, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10635, 
         TeleDelay = 0, 
      }, 
      [10636] = 
      {
         Name = "A Small Plaza", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "A Small Plaza leads off of Treasure Row.  The colorful signs of vendors \
attract the eye. Several have incredible designs in various spectrums, \
invisible to the human eye.  In the plaza, each shop can be bought and \
privately owned. \
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10641, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10642, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10628, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "southwest", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10627, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10636, 
         TeleDelay = 0, 
      }, 
      [10637] = 
      {
         Name = "An Empty Shop", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [28] = "PlayerShop", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "Shelves line the walls of this shop, and several high quality glass  cases\
stand in rows.  If the shop has been bought, there will be a  shopkeeper\
here to sell you his wares.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10627, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10637, 
         TeleDelay = 0, 
      }, 
      [10638] = 
      {
         Name = "An Empty Shop", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [28] = "PlayerShop", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "Shelves line the walls of this shop, and several high quality glass  cases\
stand in rows.  If the shop has been bought, there will be a  shopkeeper\
here to sell you his wares.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10627, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10638, 
         TeleDelay = 0, 
      }, 
      [10639] = 
      {
         Name = "An Empty Shop", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [28] = "PlayerShop", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "Shelves line the walls of this shop, and several high quality glass  cases\
stand in rows.  If the shop has been bought, there will be a  shopkeeper\
here to sell you his wares. \
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10628, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10639, 
         TeleDelay = 0, 
      }, 
      [10640] = 
      {
         Name = "An Empty Shop", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [28] = "PlayerShop", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "Shelves line the walls of this shop, and several high quality glass  cases\
stand in rows.  If the shop has been bought, there will be a  shopkeeper\
here to sell you his wares. \
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10628, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10640, 
         TeleDelay = 0, 
      }, 
      [10641] = 
      {
         Name = "An Empty Shop", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [28] = "PlayerShop", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "Shelves line the walls of this shop, and several high quality glass  cases\
stand in rows.  If the shop has been bought, there will be a  shopkeeper\
here to sell you his wares. \
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10636, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10641, 
         TeleDelay = 0, 
      }, 
      [10642] = 
      {
         Name = "An Empty Shop", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [28] = "PlayerShop", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "Shelves line the walls of this shop, and several high quality glass  cases\
stand in rows.  If the shop has been bought, there will be a  shopkeeper\
here to sell you his wares. \
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10636, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10642, 
         TeleDelay = 0, 
      }, 
      [10643] = 
      {
         Name = "Floating in a void", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "", 
         Exits = 
         {
         }, 
         Vnum = 10643, 
         TeleDelay = 0, 
      }, 
      [10644] = 
      {
         Name = "Floating in a void", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "", 
         Exits = 
         {
         }, 
         Vnum = 10644, 
         TeleDelay = 0, 
      }, 
      [10645] = 
      {
         Name = "Floating in a void", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "", 
         Exits = 
         {
         }, 
         Vnum = 10645, 
         TeleDelay = 0, 
      }, 
      [10650] = 
      {
         Name = "Central Chamber", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "As you walk into the central chamber, you are overcome with a sense of awe.\
 The sheer mass of it is breathtaking.  A glass ceiling allows sunlight to\
shine, illuminating the room.  The floor is made of polished marble.  A\
fountain gurgles in the center of the room, as a waiter waits patiently\
handing out fine wine.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10543, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10548, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10547, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10549, 
               Keyword = "", 
               Description = "", 
            }, 
            [5] = 
            {
               Direction = "southwest", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10569, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10650, 
         TeleDelay = 0, 
      }, 
   }, 
   LowEconomy = 2682878, 
}
