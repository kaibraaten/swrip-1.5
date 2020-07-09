-- Corellia
-- Last saved Thursday 09-Jul-2020 21:56:48

AreaEntry
{
   ResetMessage = "", 
   ResetFrequency = 0, 
   Filename = "corellia.lua", 
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
   LowEconomy = 2682818, 
   Mobiles = 
   {
      [10500] = 
      {
         Level = 20, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 200, 
            HitNoDice = 4, 
         }, 
         Race = "Human", 
         Position = "standing", 
         Flags = 
         {
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         Stats = 
         {
            Force = 0, 
            Charisma = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Dexterity = 0, 
            Wisdom = 0, 
            Constitution = 0, 
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
         Name = "Corellian Citizen", 
         SaveVs = 
         {
            Wand = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
         }, 
         Vnum = 10500, 
         VipFlags = 
         {
            [17] = "Hoth", 
         }, 
         Height = 0, 
         ShortDescr = "corellian citizen", 
         LongDescr = "Corellian Citizen\
", 
         NumberOfAttacks = 2, 
         Description = "", 
         Credits = 0, 
         Damage = 
         {
            DamNoDice = 2, 
            DamPlus = 2, 
            DamSizeDice = 4, 
         }, 
         Weight = 0, 
         ArmorClass = 50, 
         Alignment = 0, 
         Sex = "undistinguished", 
         DefaultPosition = "standing", 
         HitRoll = 4, 
         DamRoll = 4, 
      }, 
      [10501] = 
      {
         Level = 1, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         Race = "Human", 
         Shop = 
         {
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
            ProfitBuy = 120, 
            KeeperShortDescr = "a shopkeeper", 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            ProfitSell = 69, 
         }, 
         DefaultPosition = "standing", 
         Position = "standing", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Stats = 
         {
            Force = 0, 
            Charisma = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Dexterity = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         Vnum = 10501, 
         Name = "A shady shopkeeper", 
         SaveVs = 
         {
            Wand = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
         }, 
         NumberOfAttacks = 0, 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [20] = "verpine", 
            }, 
         }, 
         Height = 0, 
         ShortDescr = "a shopkeeper", 
         LongDescr = "A shady shopkeeper\
", 
         Immune = 
         {
            [20] = "magic", 
            [11] = "charm", 
         }, 
         Description = "This shopkeeper keeps an eye on her security monitors and a hand on her\
blaster while she deals with you.   \
", 
         Credits = 0, 
         Damage = 
         {
            DamNoDice = 0, 
            DamPlus = 0, 
            DamSizeDice = 0, 
         }, 
         Weight = 0, 
         ArmorClass = 0, 
         Alignment = 0, 
         Sex = "female", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "act_prog", 
               Arguments = "gives", 
               Code = "if ovnuminv(10217) >= 1\
say I've been waiting for you.\
mpoload 10218\
give pictures $n\
mpat 10299 drop film\
mpat 10299 mppurge\
endif\
", 
            }, 
         }, 
         HitRoll = 0, 
         DamRoll = 0, 
      }, 
      [10502] = 
      {
         Level = 20, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 200, 
            HitNoDice = 4, 
         }, 
         Race = "Human", 
         Shop = 
         {
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
            ProfitBuy = 120, 
            KeeperShortDescr = "galin", 
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
         Position = "standing", 
         Flags = 
         {
            [0] = "Npc", 
            [25] = "NoKill", 
            [30] = "Prototype", 
         }, 
         Stats = 
         {
            Force = 0, 
            Charisma = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Dexterity = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         Vnum = 10502, 
         Name = "Galin", 
         SaveVs = 
         {
            Wand = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
         }, 
         NumberOfAttacks = 0, 
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
         Height = 0, 
         ShortDescr = "galin", 
         LongDescr = "Cook Galin bakes loaves of bread here.\
", 
         Immune = 
         {
            [20] = "magic", 
            [11] = "charm", 
         }, 
         Description = "", 
         Credits = 0, 
         Damage = 
         {
            DamNoDice = 2, 
            DamPlus = 2, 
            DamSizeDice = 4, 
         }, 
         Weight = 0, 
         ArmorClass = 50, 
         Alignment = 0, 
         Sex = "undistinguished", 
         DefaultPosition = "standing", 
         HitRoll = 4, 
         DamRoll = 4, 
      }, 
      [10503] = 
      {
         Level = 1, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         Race = "Human", 
         Shop = 
         {
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
            ProfitBuy = 120, 
            KeeperShortDescr = "Minit", 
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
         Position = "standing", 
         Flags = 
         {
            [0] = "Npc", 
            [25] = "NoKill", 
            [30] = "Prototype", 
         }, 
         Stats = 
         {
            Force = 0, 
            Charisma = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Dexterity = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         Vnum = 10503, 
         Name = "Minit", 
         SaveVs = 
         {
            Wand = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
         }, 
         NumberOfAttacks = 0, 
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
         Height = 0, 
         ShortDescr = "Minit", 
         LongDescr = "Minit the cute little tavernmaid serves drinks here\
", 
         Immune = 
         {
            [20] = "magic", 
            [11] = "charm", 
         }, 
         Description = "", 
         Credits = 0, 
         Damage = 
         {
            DamNoDice = 0, 
            DamPlus = 0, 
            DamSizeDice = 0, 
         }, 
         Weight = 0, 
         ArmorClass = 0, 
         Alignment = 0, 
         Sex = "undistinguished", 
         DefaultPosition = "standing", 
         HitRoll = 0, 
         DamRoll = 0, 
      }, 
      [10504] = 
      {
         Level = 50, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 500, 
            HitNoDice = 10, 
         }, 
         Race = "Human", 
         LongDescr = "The Diktat of Corellia stands here giving orders.\
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
         SaveVs = 
         {
            Wand = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
         }, 
         Position = "standing", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [10] = "Practice", 
            [30] = "Prototype", 
         }, 
         Stats = 
         {
            Force = 0, 
            Charisma = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Dexterity = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         ArmorClass = -25, 
         Name = "Corellian Diktat", 
         AttackFlags = 
         {
            [5] = "kick", 
         }, 
         Vnum = 10504, 
         VipFlags = 
         {
            [17] = "Hoth", 
         }, 
         Height = 0, 
         ShortDescr = "the corellian diktat", 
         NumberOfAttacks = 0, 
         Weight = 0, 
         Description = "", 
         Credits = 0, 
         Damage = 
         {
            DamNoDice = 5, 
            DamPlus = 2, 
            DamSizeDice = 4, 
         }, 
         AffectedBy = 
         {
            [22] = "TrueSight", 
         }, 
         Sex = "undistinguished", 
         Alignment = 0, 
         DefaultPosition = "standing", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "act_prog", 
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
            }, 
         }, 
         HitRoll = 10, 
         DamRoll = 10, 
      }, 
      [10505] = 
      {
         Level = 25, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 250, 
            HitNoDice = 5, 
         }, 
         Race = "Human", 
         Position = "standing", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         Stats = 
         {
            Force = 0, 
            Charisma = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Dexterity = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         Sex = "undistinguished", 
         Name = "Palace Guard", 
         Vnum = 10505, 
         SaveVs = 
         {
            Wand = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
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
         Height = 0, 
         ShortDescr = "a palace guard", 
         LongDescr = "A palace guard keeps the peace.\
", 
         NumberOfAttacks = 0, 
         Description = "", 
         Credits = 0, 
         Damage = 
         {
            DamNoDice = 2, 
            DamPlus = 2, 
            DamSizeDice = 4, 
         }, 
         Weight = 0, 
         ArmorClass = 37, 
         Alignment = 0, 
         SpecFuns = 
         {
            [0] = "spec_police", 
         }, 
         DefaultPosition = "standing", 
         HitRoll = 5, 
         DamRoll = 5, 
      }, 
      [10506] = 
      {
         Level = 1, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         Race = "Human", 
         Position = "standing", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Stats = 
         {
            Force = 0, 
            Charisma = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Dexterity = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         DefaultPosition = "standing", 
         Name = "Master Bunyon", 
         Vnum = 10506, 
         SaveVs = 
         {
            Wand = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
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
         Height = 0, 
         ShortDescr = "Master Bunyon", 
         LongDescr = "Master Bunyon waits for callers here.\
", 
         NumberOfAttacks = 0, 
         Description = "", 
         Credits = 0, 
         Damage = 
         {
            DamNoDice = 0, 
            DamPlus = 0, 
            DamSizeDice = 0, 
         }, 
         Weight = 0, 
         ArmorClass = 0, 
         Alignment = 0, 
         Sex = "undistinguished", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "greet_prog", 
               Arguments = "100", 
               Code = "say Greetings, welcome to the Master and Fool.  Make yourself at home.\
", 
            }, 
         }, 
         HitRoll = 0, 
         DamRoll = 0, 
      }, 
      [10507] = 
      {
         Level = 90, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 900, 
            HitNoDice = 18, 
         }, 
         Race = "Human", 
         Shop = 
         {
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
            ProfitBuy = 120, 
            KeeperShortDescr = "Turen", 
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
         DefaultPosition = "standing", 
         Vnum = 10507, 
         SaveVs = 
         {
            Wand = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
         }, 
         Position = "standing", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
         }, 
         Stats = 
         {
            Force = 0, 
            Charisma = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Dexterity = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         NumberOfAttacks = 0, 
         Name = "Turen", 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
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
         Height = 0, 
         ShortDescr = "Turen", 
         LongDescr = "Turen is selling tools of the trade here.\
", 
         Immune = 
         {
            [20] = "magic", 
            [11] = "charm", 
         }, 
         Description = "", 
         Credits = 0, 
         Damage = 
         {
            DamNoDice = 9, 
            DamPlus = 2, 
            DamSizeDice = 4, 
         }, 
         Weight = 0, 
         ArmorClass = -125, 
         Alignment = 0, 
         Sex = "undistinguished", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
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
            }, 
         }, 
         HitRoll = 18, 
         DamRoll = 18, 
      }, 
      [10508] = 
      {
         Level = 100, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 1000, 
            HitNoDice = 20, 
         }, 
         Race = "Twi'lek", 
         Shop = 
         {
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
            ProfitBuy = 120, 
            KeeperShortDescr = "a craftsman", 
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
         Position = "standing", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [10] = "Practice", 
            [30] = "Prototype", 
         }, 
         Stats = 
         {
            Force = 0, 
            Charisma = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Dexterity = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         Vnum = 10508, 
         Name = "craftsman", 
         SaveVs = 
         {
            Wand = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
         }, 
         NumberOfAttacks = 0, 
         Languages = 
         {
            Speaking = 
            {
               [2] = "twileki", 
            }, 
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
         }, 
         Height = 0, 
         ShortDescr = "a craftsman", 
         LongDescr = "A craftsman has set up a booth here.\
", 
         Immune = 
         {
            [20] = "magic", 
            [11] = "charm", 
         }, 
         Description = "This old twilek woman has a booth with some incredably beautiful\
items. She is very skilled in her craft. Maybe she could teach you a\
few things.\
", 
         Credits = 20, 
         Damage = 
         {
            DamNoDice = 10, 
            DamPlus = 2, 
            DamSizeDice = 4, 
         }, 
         Weight = 0, 
         ArmorClass = -150, 
         Alignment = 0, 
         Sex = "female", 
         DefaultPosition = "standing", 
         HitRoll = 0, 
         DamRoll = 0, 
      }, 
      [10509] = 
      {
         Level = 105, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 1050, 
            HitNoDice = 21, 
         }, 
         Race = "Wookiee", 
         Position = "standing", 
         Flags = 
         {
            [1] = "Sentinel", 
            [24] = "NoAssist", 
            [9] = "Train", 
            [10] = "Practice", 
            [25] = "NoKill", 
            [0] = "Npc", 
         }, 
         Stats = 
         {
            Force = 0, 
            Charisma = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Dexterity = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         Name = "An instructor", 
         Vnum = 10509, 
         SaveVs = 
         {
            Wand = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
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
         Height = 0, 
         ShortDescr = "an instructor", 
         LongDescr = "An instructor stands here.\
", 
         NumberOfAttacks = 0, 
         Description = "", 
         Credits = 0, 
         Damage = 
         {
            DamNoDice = 10, 
            DamPlus = 2, 
            DamSizeDice = 4, 
         }, 
         Weight = 0, 
         ArmorClass = -162, 
         Alignment = 0, 
         Sex = "undistinguished", 
         DefaultPosition = "standing", 
         HitRoll = 21, 
         DamRoll = 21, 
      }, 
      [10510] = 
      {
         Level = 1, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 10, 
            HitNoDice = 0, 
         }, 
         Race = "Human", 
         Position = "standing", 
         Flags = 
         {
            [1] = "Sentinel", 
            [24] = "NoAssist", 
            [26] = "Droid", 
            [0] = "Npc", 
         }, 
         Stats = 
         {
            Force = 0, 
            Charisma = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Dexterity = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         DefaultPosition = "standing", 
         Name = "a training remote", 
         Vnum = 10510, 
         SaveVs = 
         {
            Wand = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
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
         Height = 0, 
         ShortDescr = "a remote", 
         LongDescr = "A training remote hovers nearby.\
", 
         NumberOfAttacks = 0, 
         Description = "", 
         Credits = 0, 
         Damage = 
         {
            DamNoDice = 0, 
            DamPlus = 2, 
            DamSizeDice = 4, 
         }, 
         Weight = 0, 
         ArmorClass = 97, 
         Alignment = 0, 
         Sex = "undistinguished", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "death_prog", 
               Arguments = "100", 
               Code = "mpecho As the remote explodes, a door opens in the wall and another remote\
mpecho floats out.\
mpmload 10510\
", 
            }, 
         }, 
         HitRoll = 0, 
         DamRoll = 0, 
      }, 
      [10511] = 
      {
         Level = 2, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 20, 
            HitNoDice = 0, 
         }, 
         Race = "Human", 
         Position = "standing", 
         Flags = 
         {
            [1] = "Sentinel", 
            [24] = "NoAssist", 
            [26] = "Droid", 
            [0] = "Npc", 
         }, 
         Stats = 
         {
            Force = 0, 
            Charisma = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Dexterity = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         DefaultPosition = "standing", 
         Name = "a training remote", 
         Vnum = 10511, 
         SaveVs = 
         {
            Wand = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
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
         Height = 0, 
         ShortDescr = "a remote", 
         LongDescr = "A training remote hovers nearby.\
", 
         NumberOfAttacks = 0, 
         Description = "", 
         Credits = 0, 
         Damage = 
         {
            DamNoDice = 0, 
            DamPlus = 2, 
            DamSizeDice = 4, 
         }, 
         Weight = 0, 
         ArmorClass = 95, 
         Alignment = 0, 
         Sex = "undistinguished", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "death_prog", 
               Arguments = "100", 
               Code = "mpecho As the remote explodes, a door opens in the wall and another \
mpecho remote floats out.\
mpmload 10511\
", 
            }, 
         }, 
         HitRoll = 0, 
         DamRoll = 0, 
      }, 
      [10512] = 
      {
         Level = 3, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 30, 
            HitNoDice = 0, 
         }, 
         Race = "Human", 
         Position = "standing", 
         Flags = 
         {
            [1] = "Sentinel", 
            [24] = "NoAssist", 
            [26] = "Droid", 
            [0] = "Npc", 
         }, 
         Stats = 
         {
            Force = 0, 
            Charisma = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Dexterity = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         DefaultPosition = "standing", 
         Name = "a training remote", 
         Vnum = 10512, 
         SaveVs = 
         {
            Wand = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
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
         Height = 0, 
         ShortDescr = "a remote", 
         LongDescr = "A training remote hovers nearby.\
", 
         NumberOfAttacks = 0, 
         Description = "", 
         Credits = 0, 
         Damage = 
         {
            DamNoDice = 0, 
            DamPlus = 2, 
            DamSizeDice = 4, 
         }, 
         Weight = 0, 
         ArmorClass = 92, 
         Alignment = 0, 
         Sex = "undistinguished", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "death_prog", 
               Arguments = "100", 
               Code = "mpecho As the remote explodes, a door opens in the wall and another \
mpecho remote floats out.\
mpmload 10512\
", 
            }, 
         }, 
         HitRoll = 0, 
         DamRoll = 0, 
      }, 
      [10513] = 
      {
         Level = 4, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 40, 
            HitNoDice = 0, 
         }, 
         Race = "Human", 
         Position = "standing", 
         Flags = 
         {
            [1] = "Sentinel", 
            [24] = "NoAssist", 
            [26] = "Droid", 
            [0] = "Npc", 
         }, 
         Stats = 
         {
            Force = 0, 
            Charisma = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Dexterity = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         DefaultPosition = "standing", 
         Name = "a training remote", 
         Vnum = 10513, 
         SaveVs = 
         {
            Wand = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
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
         Height = 0, 
         ShortDescr = "a remote", 
         LongDescr = "A training remote hovers nearby.\
", 
         NumberOfAttacks = 0, 
         Description = "", 
         Credits = 0, 
         Damage = 
         {
            DamNoDice = 0, 
            DamPlus = 2, 
            DamSizeDice = 4, 
         }, 
         Weight = 0, 
         ArmorClass = 90, 
         Alignment = 0, 
         Sex = "undistinguished", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "death_prog", 
               Arguments = "100", 
               Code = "mpecho As the remote explodes, a door opens in the wall and another \
mpecho remote floats out.\
mpmload 10513\
", 
            }, 
         }, 
         HitRoll = 0, 
         DamRoll = 0, 
      }, 
      [10514] = 
      {
         Level = 5, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 50, 
            HitNoDice = 1, 
         }, 
         Race = "Human", 
         Position = "standing", 
         Flags = 
         {
            [1] = "Sentinel", 
            [24] = "NoAssist", 
            [30] = "Prototype", 
            [26] = "Droid", 
            [0] = "Npc", 
         }, 
         Stats = 
         {
            Force = 0, 
            Charisma = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Dexterity = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         DefaultPosition = "standing", 
         Name = "a training remote", 
         Vnum = 10514, 
         SaveVs = 
         {
            Wand = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
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
         Height = 0, 
         ShortDescr = "a remote", 
         LongDescr = "A training remote hovers nearby.\
", 
         NumberOfAttacks = 0, 
         Description = "", 
         Credits = 0, 
         Damage = 
         {
            DamNoDice = 0, 
            DamPlus = 2, 
            DamSizeDice = 4, 
         }, 
         Weight = 0, 
         ArmorClass = 87, 
         Alignment = 0, 
         Sex = "undistinguished", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "death_prog", 
               Arguments = "100", 
               Code = "mpecho As the remote explodes, a door opens in the wall and another \
mpecho remote floats out.\
mpmload 10514\
", 
            }, 
         }, 
         HitRoll = 0, 
         DamRoll = 0, 
      }, 
      [10515] = 
      {
         Level = 20, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 200, 
            HitNoDice = 4, 
         }, 
         Race = "Human", 
         Sex = "undistinguished", 
         DefaultPosition = "standing", 
         Position = "standing", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Stats = 
         {
            Force = 0, 
            Charisma = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Dexterity = 0, 
            Wisdom = 0, 
            Constitution = 0, 
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
         Name = "Corsec Agent", 
         SaveVs = 
         {
            Wand = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
         }, 
         Vnum = 10515, 
         VipFlags = 
         {
            [17] = "Hoth", 
         }, 
         Height = 0, 
         ShortDescr = "a corsec agent", 
         LongDescr = "A Corsec Agent patrolls the area.\
", 
         NumberOfAttacks = 0, 
         Description = "", 
         Credits = 0, 
         Damage = 
         {
            DamNoDice = 2, 
            DamPlus = 2, 
            DamSizeDice = 4, 
         }, 
         Weight = 0, 
         ArmorClass = 50, 
         Alignment = 0, 
         SpecFuns = 
         {
            [1] = "spec_police_attack", 
            [0] = "spec_guardian", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "fight_prog", 
               Arguments = "100", 
               Code = "if ovnumcarry(54) < 1\
mpoload 54\
wield t-21\
endif\
", 
            }, 
         }, 
         HitRoll = 4, 
         DamRoll = 4, 
      }, 
      [10516] = 
      {
         Level = 1, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         Race = "Human", 
         DefaultPosition = "standing", 
         Position = "standing", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [27] = "NoCorpse", 
         }, 
         Stats = 
         {
            Force = 0, 
            Charisma = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Dexterity = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         Vnum = 10516, 
         Name = "chef", 
         SaveVs = 
         {
            Wand = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
         }, 
         NumberOfAttacks = 0, 
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
         Height = 0, 
         ShortDescr = "A chef", 
         LongDescr = "A chef is here preparing mouthwatering food.\
", 
         Immune = 
         {
            [20] = "magic", 
            [11] = "charm", 
         }, 
         Description = "", 
         Credits = 0, 
         Damage = 
         {
            DamNoDice = 0, 
            DamPlus = 0, 
            DamSizeDice = 0, 
         }, 
         Weight = 0, 
         ArmorClass = 0, 
         Alignment = 0, 
         Sex = "female", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "food", 
               Code = "emote asks, '&PWhat kind of food?  A salad or a steak?&R&W'\
", 
            }, 
            [2] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "steak", 
               Code = "mpoload 10541\
emote smiles and says, '&PThere are go, $n.&R&W'\
give steak $n\
drop all\
", 
            }, 
            [3] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "salad", 
               Code = "mpoload 10542\
emote smiles and says, '&PEnjoy, $n.&R&W'\
give salad $n\
drop all\
", 
            }, 
         }, 
         HitRoll = 0, 
         DamRoll = 0, 
      }, 
      [10517] = 
      {
         Level = 1, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         Race = "Human", 
         DefaultPosition = "standing", 
         Position = "standing", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Stats = 
         {
            Force = 0, 
            Charisma = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Dexterity = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         Vnum = 10517, 
         Name = "orchestra band", 
         SaveVs = 
         {
            Wand = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
         }, 
         NumberOfAttacks = 0, 
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
         Height = 0, 
         ShortDescr = "An orchestra", 
         LongDescr = "A small group of musicians play quietly off to the side.\
", 
         Immune = 
         {
            [20] = "magic", 
            [11] = "charm", 
         }, 
         Description = "", 
         Credits = 0, 
         Damage = 
         {
            DamNoDice = 0, 
            DamPlus = 0, 
            DamSizeDice = 0, 
         }, 
         Weight = 0, 
         ArmorClass = 0, 
         Alignment = 0, 
         Sex = "undistinguished", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "10", 
               Code = "mpecho &cSoft, beautiful music lifts from the band. \
", 
            }, 
         }, 
         HitRoll = 0, 
         DamRoll = 0, 
      }, 
      [10518] = 
      {
         Level = 1, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         Race = "Human", 
         DefaultPosition = "standing", 
         Position = "standing", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
         }, 
         Stats = 
         {
            Force = 0, 
            Charisma = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Dexterity = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         Vnum = 10518, 
         Name = "waiter", 
         SaveVs = 
         {
            Wand = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
         }, 
         NumberOfAttacks = 0, 
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
         Height = 0, 
         ShortDescr = "A young waiter", 
         LongDescr = "A young man in fine clothes is here greeting guests.\
", 
         Immune = 
         {
            [20] = "magic", 
            [11] = "charm", 
         }, 
         Description = "", 
         Credits = 0, 
         Damage = 
         {
            DamNoDice = 0, 
            DamPlus = 0, 
            DamSizeDice = 0, 
         }, 
         Weight = 0, 
         ArmorClass = 0, 
         Alignment = 0, 
         Sex = "male", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "all_greet_prog", 
               Arguments = "100", 
               Code = "mpecho &cThe young man bows deeply before $n.\
mpecho He says, '&PGreetings, $n.&R&W'\
mpecho He smiles, '&PCan I get you a bottle of wine?&R&W'\
", 
            }, 
            [2] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "Yes", 
               Code = "mpoload 10545\
give wine $n\
mpecho He says, '&PThere you go, $n.&R&W'\
drop all\
", 
            }, 
            [3] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "No", 
               Code = "sniff\
mpecho He says, '&PAs you wish, $n.&R&W'\
bow\
", 
            }, 
         }, 
         HitRoll = 0, 
         DamRoll = 0, 
      }, 
      [10572] = 
      {
         Level = 16, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 160, 
            HitNoDice = 3, 
         }, 
         Race = "Human", 
         Sex = "undistinguished", 
         Position = "standing", 
         Flags = 
         {
            [1] = "Sentinel", 
            [2] = "Scavenger", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [6] = "StayArea", 
         }, 
         Stats = 
         {
            Force = 0, 
            Charisma = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Dexterity = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         DefaultPosition = "standing", 
         Name = "Niku", 
         Vnum = 10572, 
         SaveVs = 
         {
            Wand = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
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
         Height = 0, 
         ShortDescr = "Niku", 
         LongDescr = "Niku, the weapons check girl will check in your weapons while your here\
", 
         NumberOfAttacks = 0, 
         Description = "", 
         Credits = 0, 
         Damage = 
         {
            DamNoDice = 1, 
            DamPlus = 2, 
            DamSizeDice = 4, 
         }, 
         Weight = 0, 
         ArmorClass = 60, 
         Alignment = 0, 
         SpecFuns = 
         {
            [1] = "spec_customs_smut", 
            [0] = "spec_customs_weapons", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "hitprcnt_prog", 
               Arguments = "prog 20", 
               Code = "time_prg 16\
mpecho Niku leaves in a rush\
mpgoto 10556\
drop all\
mpgoto 10554\
mpecho Niku has returned to her post\
", 
            }, 
         }, 
         HitRoll = 3, 
         DamRoll = 3, 
      }, 
      [10570] = 
      {
         Level = 105, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 1050, 
            HitNoDice = 21, 
         }, 
         Race = "Human", 
         Vnum = 10570, 
         Position = "standing", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Stats = 
         {
            Force = 0, 
            Charisma = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Dexterity = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         SaveVs = 
         {
            Wand = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
         }, 
         Name = "shistanoven guard", 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         AttackFlags = 
         {
            [0] = "bite", 
            [4] = "punch", 
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
         Height = 0, 
         ShortDescr = "A Shistanoven Guard", 
         LongDescr = "A burly and well armed shistanoven guard stands here and glares at you.\
", 
         NumberOfAttacks = 0, 
         Description = "", 
         Credits = 0, 
         Damage = 
         {
            DamNoDice = 10, 
            DamPlus = 2, 
            DamSizeDice = 4, 
         }, 
         Weight = 0, 
         ArmorClass = -162, 
         Alignment = 0, 
         Sex = "undistinguished", 
         DefaultPosition = "standing", 
         HitRoll = 21, 
         DamRoll = 21, 
      }, 
      [10549] = 
      {
         Level = 105, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 1050, 
            HitNoDice = 21, 
         }, 
         Race = "Human", 
         Sex = "undistinguished", 
         Vnum = 10549, 
         Position = "standing", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Stats = 
         {
            Force = 0, 
            Charisma = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Dexterity = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         SaveVs = 
         {
            Wand = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
         }, 
         Name = "The TRIAD Syndicate", 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         AttackFlags = 
         {
            [0] = "bite", 
            [4] = "punch", 
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
         Height = 0, 
         ShortDescr = "A Shistanoven Guard", 
         LongDescr = "A burly and well armed shistanoven guard stands here and glares at you.\
", 
         NumberOfAttacks = 0, 
         Description = "", 
         Credits = 0, 
         Damage = 
         {
            DamNoDice = 10, 
            DamPlus = 2, 
            DamSizeDice = 4, 
         }, 
         Weight = 0, 
         ArmorClass = -162, 
         Alignment = 0, 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         DefaultPosition = "standing", 
         HitRoll = 0, 
         DamRoll = 0, 
      }, 
      [10548] = 
      {
         Level = 16, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 160, 
            HitNoDice = 3, 
         }, 
         Race = "Human", 
         Sex = "undistinguished", 
         Position = "standing", 
         Flags = 
         {
            [1] = "Sentinel", 
            [2] = "Scavenger", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [6] = "StayArea", 
            [30] = "Prototype", 
         }, 
         Stats = 
         {
            Force = 0, 
            Charisma = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Dexterity = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         DefaultPosition = "standing", 
         Name = "Niku", 
         Vnum = 10548, 
         SaveVs = 
         {
            Wand = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
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
         Height = 0, 
         ShortDescr = "Niku", 
         LongDescr = "Niku is here checking in weapons\
", 
         NumberOfAttacks = 0, 
         Description = "", 
         Credits = 0, 
         Damage = 
         {
            DamNoDice = 1, 
            DamPlus = 2, 
            DamSizeDice = 4, 
         }, 
         Weight = 0, 
         ArmorClass = 60, 
         Alignment = 0, 
         SpecFuns = 
         {
            [1] = "spec_customs_smut", 
            [0] = "spec_customs_weapons", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "5", 
               Code = "mpat 10556 drop all\
say Sorry but weapons are not allowed in the Headquarters\
emote drops something down a chute.\
", 
            }, 
         }, 
         HitRoll = 0, 
         DamRoll = 0, 
      }, 
      [10545] = 
      {
         Level = 100, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 1000, 
            HitNoDice = 20, 
         }, 
         Race = "Human", 
         Position = "standing", 
         Flags = 
         {
            [0] = "Npc", 
            [5] = "Aggressive", 
            [2] = "Scavenger", 
            [27] = "NoCorpse", 
         }, 
         Stats = 
         {
            Force = 0, 
            Charisma = 0, 
            Luck = 0, 
            Strength = 0, 
            Intelligence = 0, 
            Dexterity = 0, 
            Wisdom = 0, 
            Constitution = 0, 
         }, 
         Vnum = 10545, 
         Name = "A Corellian pirate", 
         SaveVs = 
         {
            Wand = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
         }, 
         Resistant = 
         {
            [20] = "magic", 
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
         Height = 0, 
         ShortDescr = "A fierce Corellian pirate", 
         LongDescr = "A dark skinned, fierce Corellian pirate is here, guarding his treasure.\
", 
         NumberOfAttacks = 3, 
         Description = "", 
         Credits = 0, 
         Damage = 
         {
            DamNoDice = 10, 
            DamPlus = 2, 
            DamSizeDice = 4, 
         }, 
         Weight = 0, 
         ArmorClass = -300, 
         Alignment = 0, 
         Sex = "undistinguished", 
         DefaultPosition = "standing", 
         HitRoll = 14, 
         DamRoll = 7, 
      }, 
   }, 
   HighEconomy = 0, 
   Resets = 
   {
      [1] = 
      {
         Command = "O", 
         MiscData = 1, 
         Arg3 = 10501, 
         Arg2 = 1, 
         Arg1 = 90, 
      }, 
      [2] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10504, 
         Arg2 = 6, 
         Arg1 = 10500, 
      }, 
      [3] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10505, 
         Arg2 = 1, 
         Arg1 = 10502, 
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
         Arg2 = 1, 
         Arg1 = 10503, 
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
         Arg2 = 8, 
         Arg1 = 10507, 
      }, 
      [11] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10514, 
         Arg2 = 8, 
         Arg1 = 10505, 
      }, 
      [12] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10515, 
         Arg2 = 8, 
         Arg1 = 10505, 
      }, 
      [13] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10515, 
         Arg2 = 8, 
         Arg1 = 10505, 
      }, 
      [14] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10517, 
         Arg2 = 8, 
         Arg1 = 10505, 
      }, 
      [15] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10518, 
         Arg2 = 8, 
         Arg1 = 10505, 
      }, 
      [16] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10518, 
         Arg2 = 8, 
         Arg1 = 10505, 
      }, 
      [17] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10519, 
         Arg2 = 1, 
         Arg1 = 10504, 
      }, 
      [18] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10519, 
         Arg2 = 8, 
         Arg1 = 10505, 
      }, 
      [19] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 16, 
         Arg2 = 1, 
         Arg1 = 54, 
      }, 
      [20] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10519, 
         Arg2 = 8, 
         Arg1 = 10505, 
      }, 
      [21] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 16, 
         Arg2 = 1, 
         Arg1 = 54, 
      }, 
      [22] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10521, 
         Arg2 = 3, 
         Arg1 = 10515, 
      }, 
      [23] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10521, 
         Arg2 = 6, 
         Arg1 = 10500, 
      }, 
      [24] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10522, 
         Arg2 = 3, 
         Arg1 = 10515, 
      }, 
      [25] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10526, 
         Arg2 = 6, 
         Arg1 = 10500, 
      }, 
      [26] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10528, 
         Arg2 = 6, 
         Arg1 = 10500, 
      }, 
      [27] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10529, 
         Arg2 = 6, 
         Arg1 = 10500, 
      }, 
      [28] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10554, 
         Arg2 = 1, 
         Arg1 = 10548, 
      }, 
      [29] = 
      {
         Command = "D", 
         MiscData = 0, 
         Arg3 = 2, 
         Arg2 = 5, 
         Arg1 = 10554, 
      }, 
      [30] = 
      {
         Command = "O", 
         MiscData = 1, 
         Arg3 = 10556, 
         Arg2 = 1, 
         Arg1 = 10571, 
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
         Arg2 = 1, 
         Arg1 = 10570, 
      }, 
      [37] = 
      {
         Command = "O", 
         MiscData = 1, 
         Arg3 = 10571, 
         Arg2 = 1, 
         Arg1 = 10313, 
      }, 
      [38] = 
      {
         Command = "O", 
         MiscData = 1, 
         Arg3 = 10571, 
         Arg2 = 1, 
         Arg1 = 32208, 
      }, 
      [39] = 
      {
         Command = "D", 
         MiscData = 0, 
         Arg3 = 2, 
         Arg2 = 4, 
         Arg1 = 10571, 
      }, 
      [40] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10578, 
         Arg2 = 1, 
         Arg1 = 10545, 
      }, 
      [41] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10582, 
         Arg2 = 6, 
         Arg1 = 10500, 
      }, 
      [42] = 
      {
         Command = "O", 
         MiscData = 1, 
         Arg3 = 10583, 
         Arg2 = 1, 
         Arg1 = 32208, 
      }, 
      [43] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10589, 
         Arg2 = 6, 
         Arg1 = 413, 
      }, 
      [44] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10590, 
         Arg2 = 1, 
         Arg1 = 10510, 
      }, 
      [45] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10591, 
         Arg2 = 1, 
         Arg1 = 10511, 
      }, 
      [46] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10592, 
         Arg2 = 1, 
         Arg1 = 10512, 
      }, 
      [47] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10593, 
         Arg2 = 1, 
         Arg1 = 10513, 
      }, 
      [48] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10594, 
         Arg2 = 4, 
         Arg1 = 10514, 
      }, 
      [49] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10595, 
         Arg2 = 4, 
         Arg1 = 10514, 
      }, 
      [50] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10605, 
         Arg2 = 3, 
         Arg1 = 10515, 
      }, 
      [51] = 
      {
         Command = "O", 
         MiscData = 1, 
         Arg3 = 10608, 
         Arg2 = 1, 
         Arg1 = 38, 
      }, 
      [52] = 
      {
         Command = "O", 
         MiscData = 1, 
         Arg3 = 10555, 
         Arg2 = 1, 
         Arg1 = 32208, 
      }, 
      [53] = 
      {
         Command = "D", 
         MiscData = 0, 
         Arg3 = 0, 
         Arg2 = 3, 
         Arg1 = 10555, 
      }, 
      [54] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10549, 
         Arg2 = 1, 
         Arg1 = 10517, 
      }, 
      [55] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10650, 
         Arg2 = 1, 
         Arg1 = 10518, 
      }, 
      [56] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10547, 
         Arg2 = 1, 
         Arg1 = 10516, 
      }, 
      [57] = 
      {
         Command = "O", 
         MiscData = 1, 
         Arg3 = 10548, 
         Arg2 = 1, 
         Arg1 = 10543, 
      }, 
      [58] = 
      {
         Command = "O", 
         MiscData = 1, 
         Arg3 = 10548, 
         Arg2 = 1, 
         Arg1 = 10544, 
      }, 
      [59] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10530, 
         Arg2 = 2, 
         Arg1 = 10501, 
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
         Arg2 = 8, 
         Arg1 = 10509, 
      }, 
      [64] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10584, 
         Arg2 = 2, 
         Arg1 = 10508, 
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
         Arg2 = 2, 
         Arg1 = 10507, 
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
         Arg2 = 1, 
         Arg1 = 10506, 
      }, 
      [75] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10502, 
         Arg2 = 6, 
         Arg1 = 10500, 
      }, 
      [76] = 
      {
         Command = "O", 
         MiscData = 1, 
         Arg3 = 10572, 
         Arg2 = 1, 
         Arg1 = 32257, 
      }, 
   }, 
   FileFormatVersion = 1, 
   Rooms = 
   {
      [10500] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10605, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "east", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "The docking bay on Corellia is a crowded platform.  Ships continually land,\
delivering supplies and passengers, then lift off again, millions of\
credits richer.  You see a white palace in the distance to the northeast. \
You brush by merchants and travelers as you move your way across the pad.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10500, 
         TeleDelay = 0, 
         Name = "Corellia Serin Stop", 
         Sector = "city", 
      }, 
      [10501] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10503, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 10502, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 10605, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "south", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "Running down the center of the town, Main Street is paved with white\
marble, worn down by the feet of the millions of citizens of Corellia.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10501, 
         TeleDelay = 0, 
         Name = "Main Street", 
         Sector = "city", 
      }, 
      [10502] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10501, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "west", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "The Master and Fool is one of the more frequented hotels on Corellia. \
Master Bunyon owns the establishment, although he seems to wear the\
clothes of a servant most of the time.\
 \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10502, 
         Sector = "city", 
         TeleDelay = 0, 
         Name = "The Master and Fool", 
         Flags = 
         {
            [31] = "Auction", 
            [23] = "Hotel", 
         }, 
      }, 
      [10503] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10510, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 10504, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 10501, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "south", 
            }, 
            [4] = 
            {
               Key = -1, 
               DestinationVnum = 10522, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "west", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "Running down the center of the town, Main Street is paved with white\
marble, worn down by the feet of the millions of citizens of Corellia.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10503, 
         TeleDelay = 0, 
         Name = "Street intersection", 
         Sector = "city", 
      }, 
      [10504] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Flags = 
               {
                  [24] = "NoMob", 
               }, 
               DestinationVnum = 10505, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 10521, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               Key = -1, 
               Flags = 
               {
                  [24] = "NoMob", 
               }, 
               DestinationVnum = 10506, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "south", 
            }, 
            [4] = 
            {
               Key = -1, 
               DestinationVnum = 10503, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "west", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "Treasure Ship Row is lined with vendors selling all kinds of goods and\
services.  Wading through the crowd, vendors yell slogans.  More line the\
side of the road, trying to get your\
attention.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10504, 
         TeleDelay = 0, 
         Name = "Treasure Ship Row", 
         Sector = "city", 
      }, 
      [10505] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10504, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "south", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "Galin bakes the best bread in the sector.  However, it is not the only\
attraction.  Womp rats are imported in from Tatooine and sold here, as\
well.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10505, 
         Sector = "city", 
         TeleDelay = 0, 
         Name = "Galin's bakery", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
      }, 
      [10506] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10504, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "north", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "The Tavern is a popular hangout for the citizens of Corellia.  You have to\
push your way through, but the wait is well worth it when you see the\
owner... and the\
drinks\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10506, 
         Sector = "city", 
         TeleDelay = 0, 
         Name = "Minit's Tavern", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
      }, 
      [10507] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10521, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Key = -1, 
               Flags = 
               {
                  [11] = "Hidden", 
               }, 
               DestinationVnum = 10573, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 10508, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "south", 
            }, 
            [4] = 
            {
               Key = -1, 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [3] = "Secret", 
                  [0] = "IsDoor", 
                  [11] = "Hidden", 
               }, 
               DestinationVnum = 10508, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "southeast", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "As you enter the garden your breath is taken away from you from the exotic\
flowers, vegatation, fruits, and many huge trees. There is a small\
trickling creak running into a small pond. There is a bench and a stone\
path leading to a house.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10507, 
         Sector = "city", 
         TeleDelay = 0, 
         Name = "A garden", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
      }, 
      [10508] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10507, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "north", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10508, 
         Sector = "inside", 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
      }, 
      [10509] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Flags = 
               {
                  [4] = "Swim", 
               }, 
               DestinationVnum = 10575, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               Key = -1, 
               Flags = 
               {
                  [4] = "Swim", 
               }, 
               DestinationVnum = 10579, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "west", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "The green waters of the ocean are chilly to your skin, but not so much as\
to inhibit your functioning if you do not spend too much time floating.\
The waves are high, but not periously so. At the top of each crest, the\
vision of an island appears to solidify into the real thing. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10509, 
         Sector = "water_swim", 
         TeleDelay = 0, 
         Name = "The Corellian Ocean", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
      }, 
      [10510] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10511, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 10503, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "south", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "Running down the center of the town, Main Street is paved with white\
marble, worn down by the feet of the millions of citizens of Corellia.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10510, 
         TeleDelay = 0, 
         Name = "Main Street", 
         Sector = "city", 
      }, 
      [10511] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10580, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 10512, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 10510, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "south", 
            }, 
            [4] = 
            {
               Key = -1, 
               DestinationVnum = 10524, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "west", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "Main Street is intersected by Starlight Avenue here.   To the east and\
north, the palace seems closer.   To the west, are apartments and\
housing.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10511, 
         Sector = "city", 
         TeleDelay = 0, 
         Name = "Street intersection", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
      }, 
      [10512] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Flags = 
               {
                  [24] = "NoMob", 
               }, 
               DestinationVnum = 10514, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 10513, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "south", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 10511, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "west", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "Starlight Avenue is a newer road than Main Street.  You can not see any\
worn down stones or cracked mortar in the street. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10512, 
         TeleDelay = 0, 
         Name = "Starlight Avenue", 
         Sector = "city", 
      }, 
      [10513] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10512, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "north", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10513, 
         Sector = "inside", 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
      }, 
      [10514] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10515, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 10512, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "west", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "Starlight Avenue is a newer road than Main Street.  You can not see any\
worn down stones or cracked mortar in the street. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10514, 
         TeleDelay = 0, 
         Name = "Starlight Avenue", 
         Sector = "city", 
      }, 
      [10515] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10516, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 10514, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "south", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "This road leads to the Diktat's palace.  Black marble statues have been\
carved and placed on pedestals, standing out from the white marble of the\
street. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10515, 
         TeleDelay = 0, 
         Name = "Diktat Avenue", 
         Sector = "city", 
      }, 
      [10516] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10517, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 10515, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "south", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "This road leads to the Diktat's palace.  Black marble statues have been \
carved and placed on pedestals, standing out from the white marble of the\
street. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10516, 
         TeleDelay = 0, 
         Name = "Diktat Avenue", 
         Sector = "city", 
      }, 
      [10517] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10518, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 10520, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 10516, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "south", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "The Palace is huge.  White and black marble were the primary materials in\
building this work of art.  Corellia spares no expense in making their\
Diktat feel at home. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10517, 
         TeleDelay = 0, 
         Name = "Diktat's Palace", 
         Sector = "city", 
      }, 
      [10518] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10519, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 10517, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "south", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "The Palace is huge.  White and black marble were the primary materials in\
building this work of art.  Corellia spares no expense in making their\
Diktat feel at home. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10518, 
         TeleDelay = 0, 
         Name = "Palace Hallway", 
         Sector = "city", 
      }, 
      [10519] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10518, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "south", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "The Palace is huge.  White and black marble were the primary materials in\
building this work of art.  Corellia spares no expense in making their\
Diktat feel at home.  The throne room is spectacular, featuring many\
different styles of tapestries hanging on the walls. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10519, 
         TeleDelay = 0, 
         Name = "The Throne Room", 
         Sector = "city", 
      }, 
      [10520] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10517, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "west", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "The Palace is huge.  White and black marble were the primary materials in\
building this work of art.  Corellia spares no expense in making their\
Diktat feel at home. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10520, 
         TeleDelay = 0, 
         Name = "Diktat's Palace", 
         Sector = "city", 
      }, 
      [10521] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10625, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               Key = -1, 
               Flags = 
               {
                  [24] = "NoMob", 
               }, 
               DestinationVnum = 10507, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "south", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 10504, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "west", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "Treasure Ship Row is lined with vendors selling all kinds of goods and\
services.  Wading through the crowd, vendors yell slogans.  More line the\
side of the road, trying to get your attention.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10521, 
         TeleDelay = 0, 
         Name = "Treasure Ship Row", 
         Sector = "city", 
      }, 
      [10522] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10627, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 10503, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               Key = -1, 
               Flags = 
               {
                  [24] = "NoMob", 
               }, 
               DestinationVnum = 10545, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "south", 
            }, 
            [4] = 
            {
               Key = -1, 
               DestinationVnum = 10523, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "west", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "Treasure Ship Row is lined with vendors selling all kinds of goods and\
services.  Wading through the crowd, they yell slogans attempting to get\
your attention.  More of them line the side of the road.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10522, 
         TeleDelay = 0, 
         Name = "Treasure Ship Row", 
         Sector = "city", 
      }, 
      [10523] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10522, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               Key = -1, 
               Flags = 
               {
                  [24] = "NoMob", 
               }, 
               DestinationVnum = 10569, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "south", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 10608, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "west", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "Treasure Ship Row is lined with vendors selling all kinds of goods and\
services.  Wading through the crowd, they yell slogans attempting to get\
your attention.  More of them line the side of the road.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10523, 
         TeleDelay = 0, 
         Name = "Treasure Ship Row", 
         Sector = "city", 
      }, 
      [10524] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10511, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 10525, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "south", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 10526, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "west", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "Starlight Avenue is a newer road than Main Street.  You can not see any\
worn down stones or cracked mortar in the street. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10524, 
         TeleDelay = 0, 
         Name = "Starlight Avenue", 
         Sector = "city", 
      }, 
      [10525] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10524, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "north", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10525, 
         Sector = "inside", 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
      }, 
      [10526] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10527, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 10524, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 10550, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "south", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "Starlight Avenue is a newer road than Main Street.  You can not see any\
worn down stones or cracked mortar in the street. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10526, 
         TeleDelay = 0, 
         Name = "Starlight Avenue", 
         Sector = "city", 
      }, 
      [10527] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10533, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 10531, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 10526, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "south", 
            }, 
            [4] = 
            {
               Key = -1, 
               DestinationVnum = 10532, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "west", 
            }, 
            [5] = 
            {
               Key = -1, 
               DestinationVnum = 10528, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "up", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "The Recluse Apartment's can hold many people. Maybe you should look around\
for a home here?\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10527, 
         Sector = "city", 
         TeleDelay = 0, 
         Name = "Recluse Apartment Complex", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [10528] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10537, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 10535, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 10538, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "south", 
            }, 
            [4] = 
            {
               Key = -1, 
               DestinationVnum = 10536, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "west", 
            }, 
            [5] = 
            {
               Key = -1, 
               DestinationVnum = 10529, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "up", 
            }, 
            [6] = 
            {
               Key = -1, 
               DestinationVnum = 10527, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "down", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "The Recluse Apartment's can hold many people. Maybe you should look around\
for a home here?\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10528, 
         Sector = "city", 
         TeleDelay = 0, 
         Name = "Second Floor", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
      }, 
      [10529] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10541, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 10539, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 10542, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "south", 
            }, 
            [4] = 
            {
               Key = -1, 
               DestinationVnum = 10540, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "west", 
            }, 
            [5] = 
            {
               Key = -1, 
               Flags = 
               {
                  [11] = "Hidden", 
               }, 
               DestinationVnum = 10530, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "up", 
            }, 
            [6] = 
            {
               Key = -1, 
               DestinationVnum = 10528, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "down", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "The Recluse Apartment's can hold many people. Maybe you should look around\
for a home here?\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10529, 
         Sector = "city", 
         TeleDelay = 0, 
         Name = "Third Floor", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
      }, 
      [10530] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10529, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "down", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10530, 
         Sector = "city", 
         TeleDelay = 0, 
         Name = "Secret Shop", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
      }, 
      [10531] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10527, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "west", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "75", 
               Code = "feel heal $n\
feel heal $n\
feel heal $n\
feel heal $n\
feel heal $n\
", 
            }, 
         }, 
         Vnum = 10531, 
         Sector = "inside", 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
      }, 
      [10532] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10527, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 10622, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "west", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10532, 
         Sector = "inside", 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
      }, 
      [10533] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10527, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "south", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10533, 
         Sector = "inside", 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
      }, 
      [10534] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10527, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "north", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10534, 
         Sector = "inside", 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
      }, 
      [10535] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10528, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "west", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10535, 
         Sector = "inside", 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
      }, 
      [10536] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10528, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "east", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10536, 
         Sector = "inside", 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
      }, 
      [10537] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10528, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "south", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10537, 
         Sector = "inside", 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
      }, 
      [10538] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10528, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "north", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10538, 
         Sector = "inside", 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
      }, 
      [10539] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10529, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "west", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10539, 
         Sector = "inside", 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
      }, 
      [10540] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10529, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "east", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10540, 
         Sector = "inside", 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
      }, 
      [10541] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10529, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "south", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10541, 
         Sector = "inside", 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
      }, 
      [10542] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10529, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "north", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10542, 
         Sector = "inside", 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
      }, 
      [10543] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10650, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "south", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10543, 
         Sector = "inside", 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
      }, 
      [10544] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10543, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "southwest", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10544, 
         Sector = "city", 
         TeleDelay = 0, 
         Name = "Back room", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
      }, 
      [10545] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10522, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "north", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "A simple store, Turen's shop is bursting with things electronic.   He sells\
goods for a fair price and will give you a smile if you do the\
same.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10545, 
         Sector = "city", 
         TeleDelay = 0, 
         Name = "Turen's Hardware", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
      }, 
      [10546] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10587, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "southwest", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "100", 
               Code = "feel heal $n\
", 
            }, 
         }, 
         Vnum = 10546, 
         Sector = "city", 
         TeleDelay = 0, 
         Name = "Bacta Tank", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
      }, 
      [10547] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10650, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "north", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "Here the chef prepares many fine delicasies.  On the menu for tonight is\
steak, and a salad, so tell her what you would like.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10547, 
         Sector = "city", 
         TeleDelay = 0, 
         Name = "Kitchen", 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
      }, 
      [10548] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10650, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "west", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "This fine dining room has finely crafter furnishings that appear to be very\
expensive.  Take a seat and enjoy the great meal cooked by the chef.  Just\
make sure to clean up after yourself when you leave. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10548, 
         Sector = "city", 
         TeleDelay = 0, 
         Name = "Dining Room", 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
      }, 
      [10549] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10650, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "east", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "A beautiful room will a finished oak floor and a band playing soft music in\
the background.  Many people are dancing, having a good time.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10549, 
         Sector = "city", 
         TeleDelay = 0, 
         Name = "A Ballroom", 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
      }, 
      [10550] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10526, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 10551, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "west", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "This is the entrance to an alley that runs south from here. There is very\
limited light here even in day, as shadows cover this whole area. You can\
see that the alley only runs a little ways south and then ends as it meets\
a large building's wall.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10550, 
         TeleDelay = 0, 
         Name = "A dark alley", 
         Sector = "city", 
      }, 
      [10551] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10550, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 10552, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "south", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "This seems to be the middle of the alley.  To the north, you can see the\
people walking on Starlight Avenue.   In fact, north is the only direction\
you can really see anything, as shadows press in on you from the other\
directions. To the south, there are a couple of vague outlines, that might\
be people.  This is verified as you hear two hushed voices in\
conversation.  The growls you hear don't sound pleasant.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10551, 
         TeleDelay = 0, 
         Name = "A dark alley", 
         Sector = "city", 
      }, 
      [10552] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10551, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 10553, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "east", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "As you come to the end of the alley, you can see that the two outlines were\
in fact, two heavily armed private guards. These Shistavinians stand on\
either side of a door to the east.  The door is marked 'Private' in large\
letters.  These guards have been posted here to make sure people observe\
the sign and stay out.   And although they have not made a sound, you\
notice that both of them have dropped their hands to their weapons as they\
look directly at you.  On the wall, there is a small sign posted that\
reads, 'If you dont belong here, you should leave!!! NOW!!!'\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10552, 
         TeleDelay = 0, 
         Name = "The end of the alley", 
         Sector = "city", 
      }, 
      [10553] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10552, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "west", 
            }, 
            [2] = 
            {
               Key = -1, 
               Flags = 
               {
                  [19] = "Auto", 
                  [11] = "Hidden", 
               }, 
               DestinationVnum = 10554, 
               Distance = 0, 
               Keyword = "evangelion", 
               Description = "", 
               Direction = "somewhere", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "As you enter, you notice the large symbol engraved on the walls on either\
side of you.  It appears to be the symbol known throughout the galaxy for\
the Triad Syndicate. An almost silent humming of scanners running various\
tests over you and your inventory, can be heard if you stay quiet.  Due to\
the extreme privacy guarding this organization, you must know the password\
to enter the Main Lobby.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10553, 
         Sector = "city", 
         TeleDelay = 0, 
         Name = "Dark entrance", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [10554] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Flags = 
               {
                  [2] = "Locked", 
               }, 
               DestinationVnum = 10555, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 10558, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 10557, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "south", 
            }, 
            [4] = 
            {
               Key = -1, 
               DestinationVnum = 10553, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "west", 
            }, 
            [5] = 
            {
               Key = 10571, 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
               }, 
               DestinationVnum = 10571, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "down", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "This is the main lobby of the Triad's Headquarters.  There seems to be\
every possible luxury around you. Fromt he marble floors to the expensive\
gems set in the hangings on the walls.  There is a fortune put in this\
room alone.  To the north you can see the Triad Hotel, where members and\
guests may stay. To the south,  you can see that the Triad has their own\
shop here to buy and sell their wares and weapons. To the east is a\
hallway that leads to a turbolift to take you to the rest of the building.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10554, 
         Sector = "city", 
         TeleDelay = 0, 
         Name = "Lobby", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [10555] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10554, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "south", 
            }, 
            [2] = 
            {
               Key = 10571, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               DestinationVnum = 10556, 
               Distance = 0, 
               Keyword = "grate", 
               Description = "", 
               Direction = "west", 
            }, 
         }, 
         TeleVnum = 0, 
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
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10555, 
         Sector = "city", 
         TeleDelay = 0, 
         Name = "The Triad Hotel", 
         Flags = 
         {
            [8] = "Bank", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
      }, 
      [10556] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10555, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 10553, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "south", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "This durasteel walled storeroom is for members to reclaim any weapons that\
may have been checked in when they entered the lobby. There is a large\
somewhat organized shelf system here where the weapons sit or hang. Any\
Triad member engineers may drop off weapons or armor in this room for\
delivery to the clan. To the south is a one way exit to the entrance. This\
exit may be used to reclaim or pick up weapons and leave while bypassing\
the weapons check in the lobby. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10556, 
         Sector = "city", 
         TeleDelay = 0, 
         Name = "Weapons Storage", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [10557] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10554, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 10570, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "east", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "This is the shop of the Triad Syndicate. At this shop members can sell\
weapons that they may have 'come across' to the salesman for credits no\
questions asked. They may also buy standard weapons and other items that\
members may have sold here in the past. A large shelf behind the counter\
seems to be filled to overflowing with assorted items.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10557, 
         Sector = "city", 
         TeleDelay = 0, 
         Name = "Shop", 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
      }, 
      [10558] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10554, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "west", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 10559, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "up", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "This stairway is quite elegant with marble floors and an engraved banister.\
The stairs lead up to the Lounge Room and the Secondary Apartments. To the\
west is the Main Lobby. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10558, 
         Sector = "city", 
         TeleDelay = 0, 
         Name = "Stairway First Floor", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [10559] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10565, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "west", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 10560, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "up", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 10558, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "down", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "The stairway here has marble floors and an engraved banister as well as\
some precious metals hammered into the sides of the steps. The stairs lead\
up to the Meeting Room and the Penthouse apartment while down from here is\
the Main Lobby. To the west is a very nice and well lit hallway.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10559, 
         Sector = "city", 
         TeleDelay = 0, 
         Name = "Stairway Second Floor", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [10560] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10559, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "down", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 10567, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "northwest", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 10568, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "southwest", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "The landing here at the top of the stairs is engraved as well as encrusted\
with many precious gems and metels. The walls are adorned with pictures\
that seem to focus around the possesions of the Triad Syndicate. Some of\
ships and some of buildings, they all seem very elegant and placed proudly\
and in plain view.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10560, 
         Sector = "city", 
         TeleDelay = 0, 
         Name = "Stairway Third Floor", 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
      }, 
      [10561] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10565, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "south", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10561, 
         Sector = "inside", 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
      }, 
      [10562] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10566, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "south", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10562, 
         Sector = "inside", 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
      }, 
      [10563] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10565, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "north", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "This is the lounge for relaxing among clan memebers. This room is generaly\
reserved for Triads only and if you are a guest here you should not be in\
here. There are many different sofas and chairs around the room for\
members to relax and meet with one another. To the north is the hallway\
that leads to the secondary apartments and the stairway through the\
building.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10563, 
         Sector = "city", 
         TeleDelay = 0, 
         Name = "Private Lounge", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [10564] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10566, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "north", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "This room is intended to be used by the engineers of the Triad.  There are\
racks of tools lining the walls, and a workbench also holds some tools.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10564, 
         Sector = "city", 
         TeleDelay = 0, 
         Name = "Workshop", 
         Flags = 
         {
            [26] = "Factory", 
            [3] = "Indoors", 
         }, 
      }, 
      [10565] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10561, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 10559, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 10563, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "south", 
            }, 
            [4] = 
            {
               Key = -1, 
               DestinationVnum = 10566, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "west", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "This is the floor dedicated to the secondary apartments for the first\
second and third of the clan. It has polished wood floors that echo with\
your steps. To the west you can see the end of the hallway. To the north\
is the apartment for the first of the clan. To the south is the private\
lounge for resting and visiting between assignments.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10565, 
         Sector = "city", 
         TeleDelay = 0, 
         Name = "Hallway", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [10566] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10562, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 10565, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 10564, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "south", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "This is the floor dedicated to the secondary apartments for the first\
second and third of the clan. It has polished wood floors that echo with\
your steps. To the east you can see the stairway leading through the\
builing. To the north stands the door for the apartment of the second in\
the clan. To the south is the apartment for the third.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10566, 
         Sector = "city", 
         TeleDelay = 0, 
         Name = "Hallway", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [10567] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10568, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "south", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 10560, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "southeast", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10567, 
         Sector = "inside", 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
      }, 
      [10568] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10567, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 10560, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "northeast", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "This is the main meeting room for the Leader and secondary members of The\
Triad Syndicate to meet and decide policy and action. The room is\
dominated by a large cirular table with a Triad symbol emblazened in the\
center of it. There are 25 chairs surronding the table for meetings with\
other clan leaders and for meeting with many members of this clan.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10568, 
         Sector = "city", 
         TeleDelay = 0, 
         Name = "Meeting Room", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [10569] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10523, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 10650, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "northeast", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "Kasaan's mansion towers above you, inspiring you with wonder... maybe you\
should take a look around.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10569, 
         Sector = "city", 
         TeleDelay = 0, 
         Name = "Enterance to Steven's Mansion", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [10570] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10557, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "west", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "greet_prog", 
               Arguments = "", 
               Code = "Faro looks up from his book.\
Faro says, \"Hello got something for me to\
fix?\"\
Faro peers around the corner nervously.\
", 
            }, 
            [2] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "", 
               Code = "mpechoat $n Faro looks around nervously.\
", 
            }, 
         }, 
         Vnum = 10570, 
         Sector = "city", 
         TeleDelay = 0, 
         Name = "Armor Repair", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
      }, 
      [10571] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = 10571, 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
               }, 
               DestinationVnum = 10554, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "up", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10571, 
         Sector = "city", 
         TeleDelay = 0, 
         Name = "Triad Jail", 
         Flags = 
         {
            [10] = "Safe", 
            [23] = "Hotel", 
         }, 
      }, 
      [10572] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10577, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 10578, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "south", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 10575, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "west", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "Once at the top of the cliffs, you find a quiet meadow.   Tall grass sways\
in the ocean breeze.  The sun beats down on you mercilessly. There are\
piles of rocks scattered all over the place, perhaps they are ancient\
markers of some sort. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10572, 
         Sector = "field", 
         TeleDelay = 0, 
         Name = "A high clifftop", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
      }, 
      [10573] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Flags = 
               {
                  [4] = "Swim", 
               }, 
               DestinationVnum = 10579, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 10507, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "west", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "A small path from the garden leads down to a rocky beach.  The Corellian\
Ocean laps at your feet as you stand on one of the slippery rocks. The\
water is a clear deep green, and many fish swim its depths.   Far upon the\
watery horizon, you see what appears to be perhaps an island. Are you\
brave enough to swim out and see what is there?\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10573, 
         Sector = "city", 
         TeleDelay = 0, 
         Name = "A hidden cove", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
      }, 
      [10575] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Flags = 
               {
                  [7] = "Climb", 
               }, 
               DestinationVnum = 10572, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               Key = -1, 
               Flags = 
               {
                  [4] = "Swim", 
               }, 
               DestinationVnum = 10509, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "west", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 10576, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "northeast", 
            }, 
            [4] = 
            {
               Key = -1, 
               DestinationVnum = 10578, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "southeast", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "The Corellian ocean laps at the edges of this tranquil beach.  The sand is\
a coarser type that is slightly sticky.   A few rocks protrude from the\
ground at the edge where the sand meets the vegetation of the island. Tall\
trees sway in the cooling trade winds, and the Corellian sun heats you\
pleasantly.  The steep wall of a cliff rises precipitously from the jungle\
immediately to your east.  The beach continues to the northeast and\
southwest.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10575, 
         Sector = "desert", 
         TeleDelay = 0, 
         Name = "A sandy beach", 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
      }, 
      [10576] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Flags = 
               {
                  [7] = "Climb", 
               }, 
               DestinationVnum = 10572, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "south", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 10577, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "southeast", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 10575, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "southwest", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "The Corellian ocean laps at the edges of this tranquil beach.  The sand is\
a coarser type that is slightly sticky.   A few rocks protrude from the\
ground at the edge where the sand meets the vegetation of the island. Tall\
trees sway in the cooling trade winds, and the Corellian sun heats you\
pleasantly.  The steep wall of a cliff rises precipitously from the jungle\
immediately to your south.  The beach continues to the southeast and\
southwest.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10576, 
         Sector = "desert", 
         TeleDelay = 0, 
         Name = "A sandy beach", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
      }, 
      [10577] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Flags = 
               {
                  [7] = "Climb", 
               }, 
               DestinationVnum = 10572, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "west", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 10576, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "northwest", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 10578, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "southwest", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "The Corellian ocean laps at the edges of this tranquil beach.  The sand is\
a coarser type that is slightly sticky.   A few rocks protrude from the\
ground at the edge where the sand meets the vegetation of the island. Tall\
trees sway in the cooling trade winds, and the Corellian sun heats you\
pleasantly.  The steep wall of a cliff rises precipitously from the jungle\
immediately to your west. The beach continues to the northwest and\
southwest.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10577, 
         Sector = "desert", 
         TeleDelay = 0, 
         Name = "A sandy beach", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
      }, 
      [10578] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Flags = 
               {
                  [7] = "Climb", 
               }, 
               DestinationVnum = 10572, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 10577, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "northeast", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 10575, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "northwest", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "The Corellian ocean laps at the edges of this tranquil beach.  The sand is\
a coarser type that is slightly sticky.   A few rocks protrude from the\
ground at the edge where the sand meets the vegetation of the island. Tall\
trees sway in the cooling trade winds, and the Corellian sun heats you\
pleasantly.  The steep wall of a cliff rises precipitously from the jungle\
immediately to your north. The beach continues to the northwest and\
northeast. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10578, 
         Sector = "desert", 
         TeleDelay = 0, 
         Name = "A sandy beach", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
      }, 
      [10579] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Flags = 
               {
                  [4] = "Swim", 
               }, 
               DestinationVnum = 10509, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               Key = -1, 
               Flags = 
               {
                  [4] = "Swim", 
               }, 
               DestinationVnum = 10573, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "west", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "The green waters of the ocean are chilly to your skin, but not so much as\
to inhibit your functioning if you do not spend too much time floating.\
The waves are high, but not periously so. At the top of each crest, the\
vision of an island appears to solidify into the real thing.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10579, 
         Sector = "water_swim", 
         TeleDelay = 0, 
         Name = "The Corellian Ocean", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
      }, 
      [10580] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10581, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 10511, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "south", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10580, 
         TeleDelay = 0, 
         Name = "Main Street", 
         Sector = "city", 
      }, 
      [10581] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10582, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 10580, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "south", 
            }, 
            [3] = 
            {
               Key = -1, 
               Flags = 
               {
                  [24] = "NoMob", 
               }, 
               DestinationVnum = 10587, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "west", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "Main street continues north into the Corellian main plaza.  To the west is\
the Corellian school, Coronet Academy. Corsec agents patrol the clean\
streets, and pedestrians walk without fear here.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10581, 
         TeleDelay = 0, 
         Name = "Street Intersection", 
         Sector = "city", 
      }, 
      [10582] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10583, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 10581, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "south", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 10620, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "west", 
            }, 
            [4] = 
            {
               Key = -1, 
               DestinationVnum = 10585, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "northeast", 
            }, 
            [5] = 
            {
               Key = -1, 
               DestinationVnum = 10584, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "northwest", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "The Corellian plaza, is a clean and airy area.  Couples stroll around the\
wide walkways.  A few speeders weave through them easily.  Peace and\
security are maintained by Corsec agents.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10582, 
         TeleDelay = 0, 
         Name = "Plaza Entrance", 
         Sector = "city", 
      }, 
      [10583] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10586, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 10585, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 10582, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "south", 
            }, 
            [4] = 
            {
               Key = -1, 
               DestinationVnum = 10584, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "west", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10583, 
         TeleDelay = 0, 
         Name = "Central Plaza", 
         Sector = "city", 
      }, 
      [10584] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10583, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 10586, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "northeast", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 10582, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "southeast", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "The Corellian plaza, is a clean and airy area.  Couples stroll around the\
wide walkways.  A few speeders weave through them easily.  Peace and\
security are maintained by Corsec agents\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10584, 
         TeleDelay = 0, 
         Name = "West Plaza", 
         Sector = "city", 
      }, 
      [10585] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10583, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "west", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 10586, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "northwest", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 10582, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "southwest", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10585, 
         TeleDelay = 0, 
         Name = "East Plaza", 
         Sector = "city", 
      }, 
      [10586] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10583, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "south", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 10596, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "northeast", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 10585, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "southeast", 
            }, 
            [4] = 
            {
               Key = -1, 
               DestinationVnum = 10584, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "southwest", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10586, 
         TeleDelay = 0, 
         Name = "North Plaza", 
         Sector = "city", 
      }, 
      [10587] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10588, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 10581, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 10590, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "west", 
            }, 
            [4] = 
            {
               Key = -1, 
               DestinationVnum = 10546, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "northeast", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "The Coronet Academy was created to train the Corellian guard.  Mainly\
concentrating on combat skills, it is the ideal place for a new arrival to\
begin.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10587, 
         TeleDelay = 0, 
         Name = "Coronet Academy", 
         Sector = "city", 
      }, 
      [10588] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10587, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "south", 
            }, 
            [2] = 
            {
               Key = -1, 
               Flags = 
               {
                  [25] = "Window", 
               }, 
               DestinationVnum = 10589, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "west", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10588, 
         TeleDelay = 0, 
         Name = "Target Range", 
         Sector = "city", 
      }, 
      [10589] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Flags = 
               {
                  [24] = "NoMob", 
               }, 
               DestinationVnum = 10588, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "east", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10589, 
         TeleDelay = 0, 
         Name = "Target Area", 
         Sector = "city", 
      }, 
      [10590] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Flags = 
               {
                  [24] = "NoMob", 
               }, 
               DestinationVnum = 10591, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Key = -1, 
               Flags = 
               {
                  [24] = "NoMob", 
               }, 
               DestinationVnum = 10587, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "east", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10590, 
         TeleDelay = 0, 
         Name = "Combat Training 1", 
         Sector = "city", 
      }, 
      [10591] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Flags = 
               {
                  [24] = "NoMob", 
               }, 
               DestinationVnum = 10590, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "south", 
            }, 
            [2] = 
            {
               Key = -1, 
               Flags = 
               {
                  [24] = "NoMob", 
               }, 
               DestinationVnum = 10592, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "west", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10591, 
         TeleDelay = 0, 
         Name = "Combat Training 2", 
         Sector = "city", 
      }, 
      [10592] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Flags = 
               {
                  [24] = "NoMob", 
               }, 
               DestinationVnum = 10591, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               Key = -1, 
               Flags = 
               {
                  [24] = "NoMob", 
               }, 
               DestinationVnum = 10593, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "south", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10592, 
         TeleDelay = 0, 
         Name = "Combat Training 3", 
         Sector = "city", 
      }, 
      [10593] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Flags = 
               {
                  [24] = "NoMob", 
               }, 
               DestinationVnum = 10592, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Key = -1, 
               Flags = 
               {
                  [24] = "NoMob", 
               }, 
               DestinationVnum = 10594, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "west", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10593, 
         TeleDelay = 0, 
         Name = "Combat Training 4", 
         Sector = "city", 
      }, 
      [10594] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Flags = 
               {
                  [24] = "NoMob", 
               }, 
               DestinationVnum = 10595, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Key = -1, 
               Flags = 
               {
                  [24] = "NoMob", 
               }, 
               DestinationVnum = 10593, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "east", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10594, 
         TeleDelay = 0, 
         Name = "Combat Training 5", 
         Sector = "city", 
      }, 
      [10595] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Flags = 
               {
                  [24] = "NoMob", 
               }, 
               DestinationVnum = 10594, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "south", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10595, 
         TeleDelay = 0, 
         Name = "Combat Training 6", 
         Sector = "city", 
      }, 
      [10596] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10597, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 10599, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 10586, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "southwest", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10596, 
         TeleDelay = 0, 
         Name = "Corellia Shipyard", 
         Sector = "city", 
      }, 
      [10597] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10598, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 10596, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "south", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10597, 
         TeleDelay = 0, 
         Name = "Corellian Shipyard", 
         Sector = "city", 
      }, 
      [10598] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10601, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 10599, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "south", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 10597, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "west", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10598, 
         TeleDelay = 0, 
         Name = "Corellian Shipyard", 
         Sector = "city", 
      }, 
      [10599] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10598, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 10600, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 10596, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "west", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10599, 
         Sector = "city", 
         TeleDelay = 0, 
         Name = "Corellian Shipyard", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
      }, 
      [10600] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10601, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 10603, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 10599, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "west", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10600, 
         TeleDelay = 0, 
         Name = "Corellian Shipyard", 
         Sector = "city", 
      }, 
      [10601] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10600, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "south", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 10598, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "west", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10601, 
         TeleDelay = 0, 
         Name = "Corellian Shipyard", 
         Sector = "city", 
      }, 
      [10602] = 
      {
         Exits = 
         {
         }, 
         TeleVnum = 0, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10602, 
         Sector = "city", 
         TeleDelay = 0, 
         Name = "Shipyard Launching Bay", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
      }, 
      [10603] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10600, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "west", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10603, 
         Sector = "city", 
         TeleDelay = 0, 
         Name = "Shipyard Landing Bay", 
         Flags = 
         {
            [4] = "CanLand", 
            [5] = "CanFly", 
         }, 
      }, 
      [10605] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10501, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 10500, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "west", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "The docking bay on Corellia is a crowded platform.  Ships continually land,\
delivering supplies and passengers, then lift off again, millions of\
credits richer.  You see a white palace in the distance to the northeast.\
You brush by merchants and travelers as you move your way across the pad.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10605, 
         Sector = "city", 
         TeleDelay = 0, 
         Name = "Corellia Docking Bay", 
         Flags = 
         {
            [4] = "CanLand", 
            [5] = "CanFly", 
         }, 
      }, 
      [10606] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10609, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "east", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10606, 
         Sector = "inside", 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
      }, 
      [10607] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10609, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "south", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "Here it be, home and work.  The interior has been redesigned to resemble\
that of a simple hut, like that in Honoghr, but off to the side, half of\
the room is occupied by a real office and workstation, where the Chief\
Exec works upon the machineries and papers that happen to come upon his\
hands.  Automated tools lie strewn about, and storage compartments serve\
to stock his extra supplies.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10607, 
         Sector = "city", 
         TeleDelay = 0, 
         Name = "A Factory", 
         Flags = 
         {
            [26] = "Factory", 
            [2] = "NoMob", 
            [23] = "Hotel", 
         }, 
      }, 
      [10608] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10609, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 10523, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "east", 
            }, 
         }, 
         TeleVnum = 0, 
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
         ExtraDescriptions = 
         {
            [1] = 
            {
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
               Keyword = "list", 
            }, 
            [2] = 
            {
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
               Keyword = "prices", 
            }, 
         }, 
         Tunnel = 0, 
         Vnum = 10608, 
         Sector = "city", 
         TeleDelay = 0, 
         Name = "Galatech Corporation", 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
      }, 
      [10609] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10607, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 10608, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "south", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 10606, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "west", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "A hallway of offices lead down along the shop, each one consisting of a\
chamber for the engineers to use as their apartment and private workshop.\
Three doors line either-side of the hall, while at the very back, with a\
brass nameplate, lies the bedroom-office of the owner of Galatech Corp.\
 \
Employees, please read rules, type \"Look Rules\".\
", 
         ExtraDescriptions = 
         {
            [1] = 
            {
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
               Keyword = "rules", 
            }, 
         }, 
         Tunnel = 0, 
         Vnum = 10609, 
         Sector = "city", 
         TeleDelay = 0, 
         Name = "Office Hallway", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [10610] = 
      {
         Exits = 
         {
         }, 
         TeleVnum = 0, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10610, 
         Sector = "city", 
         TeleDelay = 0, 
         Name = "Training Center", 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
            [4] = "CanLand", 
            [30] = "Prototype", 
            [5] = "CanFly", 
         }, 
      }, 
      [10620] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10582, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "east", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "The Corellian bank is well appointed.  Cool air filters in with soft muzac\
through overhead ducts. A few cushioned chairs and plants are placed\
strategically throughout the lobby.   Innumerable guards, droids, monitors\
and barriers provide protection for customers. Several privacy booths and\
desks are available for more involved transactions.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10620, 
         Sector = "city", 
         TeleDelay = 0, 
         Name = "Corellian Central Bank", 
         Flags = 
         {
            [8] = "Bank", 
            [3] = "Indoors", 
         }, 
      }, 
      [10622] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10532, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "east", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "This room is small but relatively organized.  There is a wooden table and\
many exotic tools for working on various projects. There is a power\
generator in the corner with many outlets.  It would be an excellent place\
to design some equipment.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10622, 
         Sector = "city", 
         TeleDelay = 0, 
         Name = "A small room", 
         Flags = 
         {
            [26] = "Factory", 
            [25] = "Refinery", 
         }, 
      }, 
      [10625] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10626, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 10631, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 10630, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "south", 
            }, 
            [4] = 
            {
               Key = -1, 
               DestinationVnum = 10521, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "west", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "Treasure Ship Row is lined with vendors selling all kinds of goods and\
services.  Wading through the crowd, vendors yell slogans.  More line the\
side of the road, trying to get your attention.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10625, 
         TeleDelay = 0, 
         Name = "Treasure Ship Row", 
         Sector = "city", 
      }, 
      [10626] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10633, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 10625, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "south", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 10632, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "west", 
            }, 
            [4] = 
            {
               Key = -1, 
               DestinationVnum = 10629, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "northeast", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "A Small Plaza leads off of Treasure Row.  The colorful signs of vendors \
attract the eye. Several have incredible designs in various spectrums, \
invisible to the human eye.  In the plaza, each shop can be bought and \
privately owned.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10626, 
         TeleDelay = 0, 
         Name = "A Small Plaza", 
         Sector = "city", 
      }, 
      [10627] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10628, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 10638, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 10522, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "south", 
            }, 
            [4] = 
            {
               Key = -1, 
               DestinationVnum = 10637, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "west", 
            }, 
            [5] = 
            {
               Key = -1, 
               DestinationVnum = 10636, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "northeast", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "A Small Plaza leads off of Treasure Row.  The colorful signs of vendors \
attract the eye. Several have incredible designs in various spectrums, \
invisible to the human eye.  In the plaza, each shop can be bought and \
privately owned. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10627, 
         Sector = "city", 
         TeleDelay = 0, 
         Name = "A Small Plaza", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
      }, 
      [10628] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10640, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 10636, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 10627, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "south", 
            }, 
            [4] = 
            {
               Key = -1, 
               DestinationVnum = 10639, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "west", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "A Small Plaza leads off of Treasure Row.  The colorful signs of vendors \
attract the eye. Several have incredible designs in various spectrums, \
invisible to the human eye.  In the plaza, each shop can be bought and \
privately owned. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10628, 
         Sector = "city", 
         TeleDelay = 0, 
         Name = "A Small Plaza", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
      }, 
      [10629] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10635, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 10634, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 10626, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "southwest", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "A Small Plaza leads off of Treasure Row.  The colorful signs of vendors \
attract the eye. Several have incredible designs in various spectrums, \
invisible to the human eye.  In the plaza, each shop can be bought and \
privately owned.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10629, 
         Sector = "city", 
         TeleDelay = 0, 
         Name = "A Small Plaza", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
      }, 
      [10630] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10625, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "north", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "Shelves line the walls of this shop, and several high quality glass  cases\
stand in rows.  If the shop has been bought, there will be a  shopkeeper\
here to sell you his wares. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10630, 
         Sector = "city", 
         TeleDelay = 0, 
         Name = "An Empty Shop", 
         Flags = 
         {
            [28] = "PlayerShop", 
         }, 
      }, 
      [10631] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10625, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "west", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "Shelves line the walls of this shop, and several high quality glass  cases\
stand in rows.  If the shop has been bought, there will be a  shopkeeper\
here to sell you his wares. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10631, 
         Sector = "city", 
         TeleDelay = 0, 
         Name = "Corellian Engineering Corporation", 
         Flags = 
         {
            [28] = "PlayerShop", 
         }, 
      }, 
      [10632] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10626, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "east", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "Shelves line the walls of this shop, and several high quality glass  cases\
stand in rows.  If the shop has been bought, there will be a  shopkeeper\
here to sell you his wares.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10632, 
         Sector = "city", 
         TeleDelay = 0, 
         Name = "An Empty Shop", 
         Flags = 
         {
            [28] = "PlayerShop", 
         }, 
      }, 
      [10633] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10626, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "south", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "Shelves line the walls of this shop, and several high quality glass  cases\
stand in rows.  If the shop has been bought, there will be a  shopkeeper\
here to sell you his wares.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10633, 
         Sector = "city", 
         TeleDelay = 0, 
         Name = "&z&OA small shop&R&W", 
         Flags = 
         {
            [28] = "PlayerShop", 
         }, 
      }, 
      [10634] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10629, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "west", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "Shelves line the walls of this shop, and several high quality glass  cases\
stand in rows.  If the shop has been bought, there will be a  shopkeeper\
here to sell you his wares.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10634, 
         Sector = "city", 
         TeleDelay = 0, 
         Name = "An Empty Shop", 
         Flags = 
         {
            [28] = "PlayerShop", 
         }, 
      }, 
      [10635] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10629, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "south", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "Shelves line the walls of this shop, and several high quality glass  cases\
stand in rows.  If the shop has been bought, there will be a  shopkeeper\
here to sell you his wares.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10635, 
         Sector = "city", 
         TeleDelay = 0, 
         Name = "An Empty Shop", 
         Flags = 
         {
            [28] = "PlayerShop", 
         }, 
      }, 
      [10636] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10641, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 10642, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 10628, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "west", 
            }, 
            [4] = 
            {
               Key = -1, 
               DestinationVnum = 10627, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "southwest", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "A Small Plaza leads off of Treasure Row.  The colorful signs of vendors \
attract the eye. Several have incredible designs in various spectrums, \
invisible to the human eye.  In the plaza, each shop can be bought and \
privately owned. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10636, 
         Sector = "city", 
         TeleDelay = 0, 
         Name = "A Small Plaza", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
      }, 
      [10637] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10627, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "east", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "Shelves line the walls of this shop, and several high quality glass  cases\
stand in rows.  If the shop has been bought, there will be a  shopkeeper\
here to sell you his wares.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10637, 
         Sector = "city", 
         TeleDelay = 0, 
         Name = "An Empty Shop", 
         Flags = 
         {
            [28] = "PlayerShop", 
         }, 
      }, 
      [10638] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10627, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "west", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "Shelves line the walls of this shop, and several high quality glass  cases\
stand in rows.  If the shop has been bought, there will be a  shopkeeper\
here to sell you his wares.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10638, 
         Sector = "city", 
         TeleDelay = 0, 
         Name = "An Empty Shop", 
         Flags = 
         {
            [28] = "PlayerShop", 
         }, 
      }, 
      [10639] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10628, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "east", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "Shelves line the walls of this shop, and several high quality glass  cases\
stand in rows.  If the shop has been bought, there will be a  shopkeeper\
here to sell you his wares. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10639, 
         Sector = "city", 
         TeleDelay = 0, 
         Name = "An Empty Shop", 
         Flags = 
         {
            [28] = "PlayerShop", 
         }, 
      }, 
      [10640] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10628, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "south", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "Shelves line the walls of this shop, and several high quality glass  cases\
stand in rows.  If the shop has been bought, there will be a  shopkeeper\
here to sell you his wares. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10640, 
         Sector = "city", 
         TeleDelay = 0, 
         Name = "An Empty Shop", 
         Flags = 
         {
            [28] = "PlayerShop", 
         }, 
      }, 
      [10641] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10636, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "south", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "Shelves line the walls of this shop, and several high quality glass  cases\
stand in rows.  If the shop has been bought, there will be a  shopkeeper\
here to sell you his wares. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10641, 
         Sector = "city", 
         TeleDelay = 0, 
         Name = "An Empty Shop", 
         Flags = 
         {
            [28] = "PlayerShop", 
         }, 
      }, 
      [10642] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10636, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "west", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "Shelves line the walls of this shop, and several high quality glass  cases\
stand in rows.  If the shop has been bought, there will be a  shopkeeper\
here to sell you his wares. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10642, 
         Sector = "city", 
         TeleDelay = 0, 
         Name = "An Empty Shop", 
         Flags = 
         {
            [28] = "PlayerShop", 
         }, 
      }, 
      [10643] = 
      {
         Exits = 
         {
         }, 
         TeleVnum = 0, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10643, 
         Sector = "city", 
         TeleDelay = 0, 
         Name = "Floating in a void", 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
      }, 
      [10644] = 
      {
         Exits = 
         {
         }, 
         TeleVnum = 0, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10644, 
         Sector = "city", 
         TeleDelay = 0, 
         Name = "Floating in a void", 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
      }, 
      [10645] = 
      {
         Exits = 
         {
         }, 
         TeleVnum = 0, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10645, 
         Sector = "city", 
         TeleDelay = 0, 
         Name = "Floating in a void", 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
      }, 
      [10650] = 
      {
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10543, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 10548, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 10547, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "south", 
            }, 
            [4] = 
            {
               Key = -1, 
               DestinationVnum = 10549, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "west", 
            }, 
            [5] = 
            {
               Key = -1, 
               DestinationVnum = 10569, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
               Direction = "southwest", 
            }, 
         }, 
         TeleVnum = 0, 
         Description = "As you walk into the central chamber, you are overcome with a sense of awe.\
 The sheer mass of it is breathtaking.  A glass ceiling allows sunlight to\
shine, illuminating the room.  The floor is made of polished marble.  A\
fountain gurgles in the center of the room, as a waiter waits patiently\
handing out fine wine.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Vnum = 10650, 
         Sector = "city", 
         TeleDelay = 0, 
         Name = "Central Chamber", 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
      }, 
   }, 
   Objects = 
   {
      [10544] = 
      {
         ShortDescr = "an exquisite mahogany table", 
         Description = "An exquisite mahogany table is here.", 
         ItemType = "furniture", 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "", 
         Weight = 1, 
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
         Name = "exquisite mahogany table", 
         Cost = 0, 
      }, 
      [10545] = 
      {
         ShortDescr = "a bottle of sparkling wine", 
         Weight = 3, 
         Description = "A bottle of sparkling wine lies here, looks tempting.", 
         ItemType = "drink_container", 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 10, 
            [2] = 2, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         Vnum = 10545, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Layers = 0, 
         Name = "bottle wine", 
         Cost = 1000, 
      }, 
      [10546] = 
      {
         ShortDescr = "infrared binoculars", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Weight = 1, 
         Description = "A pair of infrared binoculars have been dropped here.", 
         ItemType = "trash", 
         ExtraDescriptions = 
         {
         }, 
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
         Vnum = 10546, 
         Affects = 
         {
            [1] = 
            {
               Modifier = 32, 
               Location = 26, 
            }, 
         }, 
         Layers = 0, 
         Name = "pair infrared binoculars", 
         Cost = 10000, 
      }, 
      [10569] = 
      {
         ShortDescr = "a Triad Backpack", 
         Weight = 1, 
         Description = "A Triad Backpack was dropped here", 
         ItemType = "container", 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 35, 
         }, 
         Vnum = 10569, 
         WearFlags = 
         {
            [0] = "Take", 
            [10] = "About", 
            [14] = "Hold", 
         }, 
         Layers = 128, 
         Name = "Triad Backpack", 
         Cost = 200, 
      }, 
      [10570] = 
      {
         ShortDescr = "workbench", 
         Description = "A Workbench is here.", 
         ItemType = "container", 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "", 
         Weight = 1, 
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
         Name = "Workbench", 
         Cost = 0, 
      }, 
      [10571] = 
      {
         ShortDescr = "a Triad Key", 
         Weight = 1, 
         Description = "A Triad Key is here.", 
         ItemType = "trash", 
         ExtraDescriptions = 
         {
         }, 
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
         Vnum = 10571, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Layers = 0, 
         Name = "Triad Key", 
         Cost = 0, 
      }, 
      [10540] = 
      {
         ShortDescr = "a treasure chest", 
         Description = "A treasure chest is here.", 
         ItemType = "container", 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "", 
         Weight = 1, 
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
         Name = "treasure chest", 
         Cost = 0, 
      }, 
      [10541] = 
      {
         ShortDescr = "a delicious steak", 
         Layers = 0, 
         Weight = 3, 
         Description = "A delicious steak lies here rotting.", 
         ItemType = "food", 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 30, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 30, 
         }, 
         Vnum = 10541, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "use_prog", 
               Arguments = "100", 
               Code = "mpechoat $n &YMmmm, now that was a good steak.\
", 
            }, 
         }, 
         Name = "delicious steak", 
         Cost = 0, 
      }, 
      [10542] = 
      {
         ShortDescr = "a hand-tossed &rs&Ga&R&Wl&Ga&rd&R&W", 
         Layers = 0, 
         Weight = 2, 
         Description = "A hand-tossed salad lies scattered on the floor.", 
         ItemType = "food", 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 10, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         Vnum = 10542, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "use_prog", 
               Arguments = "100", 
               Code = "mpechoat $n &GA satisfactory salad, you've had better.&R&W\
", 
            }, 
         }, 
         Name = "hand tossed salad", 
         Cost = 0, 
      }, 
      [10543] = 
      {
         ShortDescr = "a satin cushioned mahogany chair", 
         Description = "A satin-cushioned mahogany chair looks very comfortable.", 
         ItemType = "furniture", 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "", 
         Weight = 1, 
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
         Name = "satin cushioned mahogany chair", 
         Cost = 0, 
      }, 
   }, 
   VnumRanges = 
   {
      Mob = 
      {
         First = 10500, 
         Last = 10572, 
      }, 
      Object = 
      {
         First = 10540, 
         Last = 10571, 
      }, 
      Room = 
      {
         First = 10500, 
         Last = 10650, 
      }, 
   }, 
   Name = "Corellia", 
   Author = "Darrik", 
}
