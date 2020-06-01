-- The ice world Hoth
-- Last saved Monday 01-Jun-2020 11:08:46

AreaEntry
{
   Name = "The ice world Hoth", 
   HighEconomy = 0, 
   FileFormatVersion = 1, 
   ResetFrequency = 10, 
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
      [11104] = 
      {
         Name = "one-armed wampa", 
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
            HitNoDice = 16, 
            HitSizeDice = 10, 
            HitPlus = 800, 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         HitRoll = 16, 
         VipFlags = 
         {
            [18] = "_18", 
         }, 
         Immune = 
         {
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
         Vnum = 11104, 
         NumberOfAttacks = 0, 
         LongDescr = "A one-armed Wampa Leader looks like trouble\
", 
         AttackFlags = 
         {
            [1] = "claws", 
            [2] = "tail", 
            [0] = "bite", 
            [5] = "kick", 
         }, 
         Level = 80, 
         Description = "", 
         Damage = 
         {
            DamNoDice = 8, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         ShortDescr = "a one-armed wampa", 
         DamRoll = 16, 
         Height = 0, 
         Race = "Human", 
         Position = "standing", 
         Credits = 10000, 
         ArmorClass = -100, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [5] = "Aggressive", 
            [18] = "Mountable", 
         }, 
      }, 
      [11105] = 
      {
         Name = "A tech shopkeeper", 
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
         SaveVs = 
         {
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         HitRoll = 10, 
         ArmorClass = -25, 
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
         Vnum = 11105, 
         Immune = 
         {
            [20] = "magic", 
            [11] = "charm", 
         }, 
         LongDescr = "A tech shopkeeper sells items here.\
", 
         NumberOfAttacks = 0, 
         Level = 50, 
         Description = "", 
         Damage = 
         {
            DamNoDice = 5, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         ShortDescr = "a tech shopkeeper", 
         DamRoll = 10, 
         Height = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               Code = "say Welcome, would you like something?\
", 
               MudProgType = "greet_prog", 
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
            KeeperShortDescr = "a tech shopkeeper", 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [30] = "Prototype", 
         }, 
      }, 
      [11106] = 
      {
         Name = "Captain Jusclik", 
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
            HitNoDice = 10, 
            HitSizeDice = 10, 
            HitPlus = 500, 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         HitRoll = 10, 
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
         Vnum = 11106, 
         NumberOfAttacks = 0, 
         LongDescr = "Captain Jusclik stands here giving orders.\
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
         ShortDescr = "captain jusclik", 
         DamRoll = 10, 
         Height = 0, 
         Race = "Human", 
         Position = "standing", 
         Credits = 0, 
         ArmorClass = -25, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
      }, 
      [11107] = 
      {
         Name = "Tech customs officer", 
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
            HitNoDice = 6, 
            HitSizeDice = 10, 
            HitPlus = 300, 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         HitRoll = 6, 
         SpecFuns = 
         {
            [0] = "spec_customs_weapons", 
         }, 
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
         Vnum = 11107, 
         NumberOfAttacks = 0, 
         LongDescr = "A tech customs oficer watches for carried weapons.\
", 
         AttackFlags = 
         {
            [5] = "kick", 
         }, 
         Level = 30, 
         Description = "", 
         Damage = 
         {
            DamNoDice = 3, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         ShortDescr = "a tech customs officer", 
         DamRoll = 6, 
         Height = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "5", 
               Code = "mpat 11274 drop all\
", 
               MudProgType = "rand_prog", 
            }, 
         }, 
         Position = "standing", 
         Credits = 0, 
         ArmorClass = 25, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [10] = "Practice", 
         }, 
      }, 
      [11108] = 
      {
         Name = "tech chef", 
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
            HitNoDice = 10, 
            HitSizeDice = 10, 
            HitPlus = 500, 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         HitRoll = 10, 
         ArmorClass = -25, 
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
         Vnum = 11108, 
         Immune = 
         {
            [20] = "magic", 
            [11] = "charm", 
         }, 
         LongDescr = "A tech chef makes food here.\
", 
         NumberOfAttacks = 0, 
         Level = 50, 
         Description = "", 
         Damage = 
         {
            DamNoDice = 5, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         ShortDescr = "tech chef", 
         DamRoll = 10, 
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
            KeeperShortDescr = "tech chef", 
         }, 
         Flags = 
         {
            [0] = "Npc", 
            [25] = "NoKill", 
            [30] = "Prototype", 
         }, 
      }, 
      [11109] = 
      {
         Name = "Mr Kooos", 
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
            HitPlus = 90, 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         HitRoll = 1, 
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
         Vnum = 11109, 
         Race = "Human", 
         LongDescr = "Mr Kooos is looking for assitance\
", 
         NumberOfAttacks = 0, 
         Level = 9, 
         Description = "", 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         ShortDescr = "Mr Kooos", 
         DamRoll = 1, 
         Height = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "add hello hi", 
               Code = "say Hello, could you please take me to the swimming pool?\
", 
               MudProgType = "speech_prog", 
            }, 
            [2] = 
            {
               Arguments = "add yes sure", 
               Code = "say Are you talking to me?\
say My name is Mr Kooos\
", 
               MudProgType = "speech_prog", 
            }, 
            [3] = 
            {
               Arguments = "add kooos kooos", 
               Code = "say You will take me to the Pool?\
say Thanks $n, I really appreciate this.\
follow $n\
", 
               MudProgType = "speech_prog", 
            }, 
            [4] = 
            {
               Arguments = "turnstile", 
               Code = "mpwithdraw 5\
give 5 credits droid\
", 
               MudProgType = "act_prog", 
            }, 
            [5] = 
            {
               Arguments = "turbocar", 
               Code = "board turbocar\
", 
               MudProgType = "act_prog", 
            }, 
            [6] = 
            {
               Arguments = "exits", 
               Code = "leave\
", 
               MudProgType = "act_prog", 
            }, 
            [7] = 
            {
               Arguments = "100", 
               Code = "if ovnumhere(10206) >= 1\
Say Thank you $r. I really apreciate your help.\
mpwithdraw 200\
give 200 credits $r\
mpgain $r 5 2000\
follow self\
mpecho Mr Looos dives into the swimming pool.\
mpgoto 10240\
endif\
", 
               MudProgType = "entry_prog", 
            }, 
         }, 
         Position = "standing", 
         Credits = 0, 
         ArmorClass = 77, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
      }, 
      [11110] = 
      {
         Name = "Freelance Tech", 
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
         SaveVs = 
         {
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         HitRoll = 10, 
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
         Vnum = 11110, 
         Immune = 
         {
            [11] = "charm", 
         }, 
         LongDescr = "A Freelance Tech will buy hand-crafted weapons here.\
", 
         NumberOfAttacks = 0, 
         Level = 50, 
         Description = "", 
         Damage = 
         {
            DamNoDice = 5, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         ShortDescr = "a freelance tech", 
         DamRoll = 10, 
         Height = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "hello job", 
               Code = "say I am looking for hand-crafted vibroblades and blasters.\
", 
               MudProgType = "speech_prog", 
            }, 
            [2] = 
            {
               Arguments = "money sure okay ok yes", 
               Code = "say I will pay good money.\
say 500 for each vibroblade and 1500 for each blaster.\
", 
               MudProgType = "speech_prog", 
            }, 
            [3] = 
            {
               Arguments = "gives", 
               Code = "if ovnuminv(10420) >= 1\
Say Great Work\
mpwithdraw 5000\
give 5000 credits $n\
drop 5000 credits\
mpat 11283 drop all\
mpecho The Tech quickly delivers the blaster.\
endif\
if ovnuminv(10422) >= 1\
Say Decent craftmanship\
mpwithdraw 500\
give 500 credits $n\
mpat 11283 drop all\
mpecho The tech quickly delivers the vibroblade.\
endif\
", 
               MudProgType = "act_prog", 
            }, 
         }, 
         Position = "standing", 
         Credits = 0, 
         ArmorClass = -25, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
      }, 
      [11111] = 
      {
         Name = "Riiice", 
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
         Vnum = 11111, 
         Race = "Human", 
         LongDescr = "Riiice waits here for his agents.\
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
         ShortDescr = "Riiice", 
         DamRoll = 5, 
         Height = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "hello job", 
               Code = "mpechoat $n Riiice whispers to you: I need some\
mpechoat $n film developed.  It's good money.\
", 
               MudProgType = "speech_prog", 
            }, 
            [2] = 
            {
               Arguments = "sure okay ok yes", 
               Code = "if ovnumcarry(10217) >= 1\
give film $n\
drop film\
mpechoat $n Riiice continues: take this film to the\
mpechoat $n hidden shopkeeper on Coronet.  She will \
mpechoat $n be waiting for you.\
endif\
if ovnumcarry(10217) < 1\
mpechoat $n Riiice says: Im afraid the film has\
mpechoat $n already been delivered.  Sorry.\
endif\
", 
               MudProgType = "speech_prog", 
            }, 
            [3] = 
            {
               Arguments = "gives", 
               Code = "if ovnuminv(10218) >= 1\
mpechoat $n Riiice hisses, \"Incredible. You returned\"\
mpwithdraw 2000\
give 2000 credits $n\
mpat 10299 drop all\
mpat 10299 mppurge\
mpecho Riiice glances quickly over a package of pictures\
mpecho and then dumps them in an incinerator.\
endif\
 \
if ovnuminv(11102) >= 1\
say Good, I have been waiting for this. \
mpwithdraw 1500\
give 1500 credits $n\
mpgain $n 4 1000\
else\
say hmm.. Thanks, but that wasn't quite what i was looking for.\
mpat 10299 drop all\
mpat 10299 mppurge\
endif\
", 
               MudProgType = "act_prog", 
            }, 
         }, 
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
      [11112] = 
      {
         Name = "A salesman", 
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
         Vnum = 11112, 
         Immune = 
         {
            [20] = "magic", 
            [11] = "charm", 
         }, 
         LongDescr = "A freelance salesman sells engineering supplies\
", 
         NumberOfAttacks = 0, 
         Level = 1, 
         Description = "As fast as new products become available to Bounty Hunters, this salesman\
somehow gets them. Of course they can be a little pricy. But that what you\
pay to get the best i guess. \
", 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         ShortDescr = "salesman", 
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
            KeeperShortDescr = "salesman", 
         }, 
         Flags = 
         {
            [0] = "Npc", 
            [25] = "NoKill", 
            [30] = "Prototype", 
         }, 
      }, 
      [11101] = 
      {
         Name = "A disabled blaster-cannon turret", 
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
         Vnum = 11101, 
         LongDescr = "A blaster-cannon turret is installed here.\
", 
         NumberOfAttacks = 0, 
         Level = 1, 
         Description = "Although it looks like a formitable defense, looking closely you see that\
the power cables have been severed. \
", 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         ShortDescr = "a turret", 
         DamRoll = 0, 
         Height = 0, 
         Race = "Human", 
         Position = "standing", 
         Credits = 0, 
         ArmorClass = 97, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
      }, 
      [11102] = 
      {
         Name = "A Wampa", 
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
         Vnum = 11102, 
         LongDescr = "A Wampa tears through bags looking for food.\
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
         ShortDescr = "A wampa", 
         DamRoll = 4, 
         Height = 0, 
         Race = "Human", 
         Position = "standing", 
         Credits = 0, 
         ArmorClass = 50, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [5] = "Aggressive", 
         }, 
      }, 
      [11103] = 
      {
         Name = "Wampa", 
         Sex = "undistinguished", 
         Weight = 0, 
         Alignment = -1000, 
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
            HitNoDice = 8, 
            HitSizeDice = 10, 
            HitPlus = 400, 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         HitRoll = 8, 
         VipFlags = 
         {
            [18] = "_18", 
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
         Vnum = 11103, 
         Immune = 
         {
            [11] = "charm", 
         }, 
         LongDescr = "A Wampa looks comfortable nawing on a bone.\
", 
         NumberOfAttacks = 0, 
         Level = 40, 
         Description = "", 
         Damage = 
         {
            DamNoDice = 4, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         ShortDescr = "a wampa", 
         DamRoll = 8, 
         Height = 0, 
         Race = "Human", 
         Position = "standing", 
         Credits = 500, 
         ArmorClass = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [5] = "Aggressive", 
         }, 
      }, 
   }, 
   ResetMessage = "The wind howls over the snow.", 
   Resets = 
   {
      [1] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 11206, 
         Arg1 = 11101, 
         Arg2 = 2, 
      }, 
      [2] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 11220, 
         Arg1 = 11101, 
         Arg2 = 2, 
      }, 
      [3] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 11233, 
         Arg1 = 11103, 
         Arg2 = 5, 
      }, 
      [4] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 11235, 
         Arg1 = 11103, 
         Arg2 = 5, 
      }, 
      [5] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 11236, 
         Arg1 = 11104, 
         Arg2 = 1, 
      }, 
      [6] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 11236, 
         Arg1 = 11103, 
         Arg2 = 5, 
      }, 
      [7] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 11236, 
         Arg1 = 11103, 
         Arg2 = 5, 
      }, 
      [8] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 11237, 
         Arg1 = 11103, 
         Arg2 = 5, 
      }, 
      [9] = 
      {
         Command = "O", 
         MiscData = 1, 
         Arg3 = 11209, 
         Arg1 = 90, 
         Arg2 = 1, 
      }, 
      [10] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 16, 
         Arg1 = 52, 
         Arg2 = 1, 
      }, 
      [11] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 18, 
         Arg1 = 52, 
         Arg2 = 1, 
      }, 
      [12] = 
      {
         Command = "O", 
         MiscData = 1, 
         Arg3 = 11210, 
         Arg1 = 10493, 
         Arg2 = 1, 
      }, 
   }, 
   Author = "Darrik", 
   VnumRanges = 
   {
      Mob = 
      {
         Last = 11112, 
         First = 11101, 
      }, 
      Room = 
      {
         Last = 11249, 
         First = 11206, 
      }, 
      Object = 
      {
         Last = 11111, 
         First = 11101, 
      }, 
   }, 
   Objects = 
   {
      [11111] = 
      {
         Name = "Outlaw tech idea board", 
         Vnum = 11111, 
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
         Description = "The Outlaw Tech Idea Board", 
         ShortDescr = "outlaw tech idea board", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
         ItemType = "trash", 
      }, 
      [11110] = 
      {
         Name = "outlaw.board", 
         Vnum = 11110, 
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
         Description = "The Outlaw Tech Board", 
         ShortDescr = "outlaw tech baord", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
         ItemType = "government", 
      }, 
      [11109] = 
      {
         Name = "Sign", 
         Vnum = 11109, 
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
         Description = "A sign is tacked to the wall here", 
         ShortDescr = "a sign", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "Sign", 
               Description = "The Mountain Defense School has merged with the Gamaak Fitness Center.  You\
\13can find us there.\
\13", 
            }, 
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
         ItemType = "trash", 
      }, 
      [11101] = 
      {
         Name = "receptionist package", 
         Vnum = 11101, 
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
         Description = "A package addressed to the Hunter's Guild's Receptionist", 
         ShortDescr = "a package addressed receptionist", 
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
      [11102] = 
      {
         Name = "cargo", 
         Vnum = 11102, 
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
         Description = "Some cargo has been left here.", 
         ShortDescr = "cargo", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         Weight = 100, 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ItemType = "trash", 
      }, 
      [11103] = 
      {
         Name = "duraplast tubing", 
         Vnum = 11103, 
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
         Description = "Some duraplast during has been left lying around here.", 
         ShortDescr = "duraplast tubing", 
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
         ItemType = "duraplast", 
      }, 
   }, 
   Filename = "hoth.lua", 
   Rooms = 
   {
      [11206] = 
      {
         Name = "A snowfield", 
         Vnum = 11206, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 11207, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 11246, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [11207] = 
      {
         Name = "Outside the 'hidden' shield doors", 
         Vnum = 11207, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "You are outside the formerly hidden shield doors that once sealed off the\
abandoned Echo Base.   The opening to the ice cave that was the Base, is\
flanked by rocks, even though most of the base was chewed into\
centuries-old packed snow and ice.\
", 
         Sector = "field", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 11208, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 11211, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 11206, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [11208] = 
      {
         Name = "Inside Echo Base", 
         Sector = "field", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "The hangar of Echo Base is now filled with scrap equipment, discarded\
uniforms, and other miscellaneous junk. \
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 11209, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 11207, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 11208, 
         TeleDelay = 0, 
      }, 
      [11209] = 
      {
         Name = "Hallway", 
         Sector = "field", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [23] = "Hotel", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "This hallway, carved from ice has started to collapse and at its end is\
closed off by a previous cave-in.\
 \
There is a bed shoved in a corner.  Perhaps you can rest here.\
 \
 \
It is safe to quit here.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 11208, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 11210, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 11209, 
         TeleDelay = 0, 
      }, 
      [11210] = 
      {
         Name = "Storeroom", 
         Vnum = 11210, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "This storeroom seems to have been ransacked.  All the bags and boxes have\
been destroyed, the remains of wrappers strewn everywhere. \
", 
         Sector = "field", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 11209, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [11211] = 
      {
         Name = "A snowfield", 
         Vnum = 11211, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         Sector = "field", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 11212, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 11207, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [11212] = 
      {
         Name = "A snowfield", 
         Vnum = 11212, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         Sector = "field", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 11215, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 11213, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 11211, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [11213] = 
      {
         Name = "A snowfield", 
         Vnum = 11213, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         Sector = "field", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 11212, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 11214, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [11214] = 
      {
         Name = "A snowfield", 
         Vnum = 11214, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around. \
", 
         Sector = "field", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 11213, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "down", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 11247, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [11215] = 
      {
         Name = "A snowfield", 
         Vnum = 11215, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         Sector = "field", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 11216, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 11212, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [11216] = 
      {
         Name = "A snowfield", 
         Vnum = 11216, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         Sector = "field", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 11217, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 11220, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 11215, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [11217] = 
      {
         Name = "A snowfield", 
         Vnum = 11217, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         Sector = "field", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 11218, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 11216, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [11218] = 
      {
         Name = "A snowfield", 
         Vnum = 11218, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         Sector = "field", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 11219, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 11217, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [11219] = 
      {
         Name = "A snowfield", 
         Vnum = 11219, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         Sector = "field", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 11218, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [11220] = 
      {
         Name = "A snowfield", 
         Vnum = 11220, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         Sector = "field", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 11221, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 11216, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [11221] = 
      {
         Name = "A snowfield", 
         Vnum = 11221, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         Sector = "field", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 11222, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 11220, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [11222] = 
      {
         Name = "A snowfield", 
         Vnum = 11222, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         Sector = "field", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 11221, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 11225, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 11223, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [11223] = 
      {
         Name = "A snowfield", 
         Vnum = 11223, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         Sector = "field", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 11222, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 11224, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [11224] = 
      {
         Name = "A snowfield", 
         Vnum = 11224, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         Sector = "field", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 11223, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [11225] = 
      {
         Name = "A snowfield", 
         Vnum = 11225, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         Sector = "field", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 11226, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 11222, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [11226] = 
      {
         Name = "A snowfield", 
         Vnum = 11226, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         Sector = "field", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 11229, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 11227, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 11225, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [11227] = 
      {
         Name = "A snowfield", 
         Vnum = 11227, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         Sector = "field", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 11226, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 11228, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [11228] = 
      {
         Name = "A snowfield", 
         Vnum = 11228, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         Sector = "field", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 11227, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [11229] = 
      {
         Name = "A snowfield", 
         Vnum = 11229, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         Sector = "field", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 11226, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "down", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 11230, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [11230] = 
      {
         Name = "Wampa Kingdom", 
         Vnum = 11230, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "The entrance to the Wampa Kingdom is a small hole in the ground.  You can\
not see it from more than 6 feet away, and in heavy weather, one can\
easily fall in. \
", 
         Sector = "field", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 11231, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "up", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 11229, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [11231] = 
      {
         Name = "Wampa Kingdom", 
         Vnum = 11231, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "The Wampa kingdom is made up of many ice caves, each filled with boned and\
leavings from the many Wampas. \
", 
         Sector = "field", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 11232, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 11230, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [11232] = 
      {
         Name = "Wampa Kingdom", 
         Vnum = 11232, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "The Wampa kingdom is made up of many ice caves, each filled with bones and\
leavings from the many Wampas. \
", 
         Sector = "field", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 11233, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 11237, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 11234, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 11231, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [11233] = 
      {
         Name = "Wampa Den", 
         Vnum = 11233, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "The Wampa kingdom is made up of many ice caves, each filled with bones and\
leavings from the many Wampas. \
", 
         Sector = "field", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 11232, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [11234] = 
      {
         Name = "Wampa Kingdom", 
         Vnum = 11234, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "The Wampa kingdom is made up of many ice caves, each filled with bones and\
leavings from the many Wampas. \
", 
         Sector = "field", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 11232, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 11235, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 11236, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [11235] = 
      {
         Name = "Wampa Den", 
         Vnum = 11235, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "The Wampa kingdom is made up of many ice caves, each filled with bones and\
leavings from the many Wampas. \
", 
         Sector = "field", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 11234, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [11236] = 
      {
         Name = "Leader's Den", 
         Vnum = 11236, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "The Wampa kingdom is made up of many ice caves, each filled with bones and\
leavings from the many Wampas. \
", 
         Sector = "field", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 11234, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [11237] = 
      {
         Name = "Wampa Den", 
         Vnum = 11237, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "The Wampa kingdom is made up of many ice caves, each filled with bones and\
leavings from the many Wampas. \
", 
         Sector = "field", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 11232, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [11238] = 
      {
         Name = "Cave-in", 
         Vnum = 11238, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "It looks like a cavein blocked the passage way here.  You can go no\
further.\
", 
         Sector = "field", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 11239, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [11239] = 
      {
         Name = "Echo Base Hangar", 
         Vnum = 11239, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "One of the large hangars that were part of Echo base, the room is filled\
with wrecked speeders and fighters.\
", 
         Sector = "field", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 11238, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [11240] = 
      {
         Name = "BlackStar", 
         Sector = "field", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "", 
         Exits = 
         {
         }, 
         Vnum = 11240, 
         TeleDelay = 0, 
      }, 
      [11241] = 
      {
         Name = "Lightning Bomber 11241", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "The new fighter designed by the Outlaw Techs, the Lightning Bomber looks\
similar to an old headhunter.  However, sleaker, faster, heavily shielded,\
with 4 laser cannons and enough firepower to take down a corvette at long\
range.\
", 
         Exits = 
         {
         }, 
         Vnum = 11241, 
         TeleDelay = 0, 
      }, 
      [11242] = 
      {
         Name = "Lightning Bomber 11242", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "The new fighter designed by the Outlaw Techs, the Lightning Bomber looks\
similar to an old headhunter.  However, sleaker, faster, heavily shielded,\
with 4 laser cannons and enough firepower to take down a corvette at long\
range. \
", 
         Exits = 
         {
         }, 
         Vnum = 11242, 
         TeleDelay = 0, 
      }, 
      [11243] = 
      {
         Name = "Lightning Bomber 11243", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "The new fighter designed by the Outlaw Techs, the Lightning Bomber looks\
similar to an old headhunter.  However, sleaker, faster, heavily shielded,\
with 4 laser cannons and enough firepower to take down a corvette at long\
range. \
", 
         Exits = 
         {
         }, 
         Vnum = 11243, 
         TeleDelay = 0, 
      }, 
      [11244] = 
      {
         Name = "Lightning Bomber 11244", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "The new fighter designed by the Outlaw Techs, the Lightning Bomber looks\
similar to an old headhunter.  However, sleaker, faster, heavily shielded,\
with 4 laser cannons and enough firepower to take down a corvette at long\
range. \
", 
         Exits = 
         {
         }, 
         Vnum = 11244, 
         TeleDelay = 0, 
      }, 
      [11245] = 
      {
         Name = "Lightning Bomber 11245", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "The new fighter designed by the Outlaw Techs, the Lightning Bomber looks\
similar to an old headhunter.  However, sleaker, faster, heavily shielded,\
with 4 laser cannons and enough firepower to take down a corvette at long\
range. \
", 
         Exits = 
         {
         }, 
         Vnum = 11245, 
         TeleDelay = 0, 
      }, 
      [11246] = 
      {
         Name = "A snowfield", 
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
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 11206, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 11246, 
         TeleDelay = 0, 
      }, 
      [11247] = 
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
            [1] = 
            {
               Direction = "up", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 11214, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "down", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 11248, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 11247, 
         TeleDelay = 0, 
      }, 
      [11248] = 
      {
         Name = "Ice Worm's Cave", 
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
            [1] = 
            {
               Direction = "up", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 11247, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "down", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 11249, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 11248, 
         TeleDelay = 0, 
      }, 
      [11249] = 
      {
         Name = "A Hidden Cavern", 
         Sector = "field", 
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
            [1] = 
            {
               Direction = "up", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 11248, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 11249, 
         TeleDelay = 0, 
      }, 
   }, 
   LowEconomy = 2750770, 
}
