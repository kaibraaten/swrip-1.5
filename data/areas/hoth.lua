-- The ice world Hoth
-- Last saved Thursday 07-May-2020 14:47:57

AreaEntry
{
   Filename = "hoth.lua", 
   Name = "The ice world Hoth", 
   Mobiles = 
   {
      [11104] = 
      {
         Description = "", 
         Name = "one-armed wampa", 
         Vnum = 11104, 
         AttackFlags = 
         {
            [1] = "claws", 
            [2] = "tail", 
            [0] = "bite", 
            [5] = "kick", 
         }, 
         Weight = 0, 
         Credits = 10000, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [5] = "Aggressive", 
            [18] = "Mountable", 
         }, 
         ShortDescr = "a one-armed wampa", 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 800, 
            HitNoDice = 16, 
         }, 
         LongDescr = "A one-armed Wampa Leader looks like trouble\
", 
         DefaultPosition = "standing", 
         Immune = 
         {
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
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Breath = 0, 
         }, 
         Race = "Human", 
         VipFlags = 
         {
            [18] = "_18", 
         }, 
         DamRoll = 16, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         HitRoll = 16, 
         Height = 0, 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         Level = 80, 
         Damage = 
         {
            DamNoDice = 8, 
            DamSizeDice = 4, 
            DamPlus = 2, 
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
         ArmorClass = -100, 
         Sex = "undistinguished", 
         Position = "standing", 
      }, 
      [11105] = 
      {
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
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
            ProfitSell = 90, 
            ProfitBuy = 120, 
            KeeperShortDescr = "a tech shopkeeper", 
         }, 
         Description = "", 
         Name = "A tech shopkeeper", 
         Vnum = 11105, 
         Weight = 0, 
         Credits = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [30] = "Prototype", 
         }, 
         ShortDescr = "a tech shopkeeper", 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 500, 
            HitNoDice = 10, 
         }, 
         LongDescr = "A tech shopkeeper sells items here.\
", 
         DefaultPosition = "standing", 
         Immune = 
         {
            [20] = "magic", 
            [11] = "charm", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               MudProgType = "greet_prog", 
               Code = "say Welcome, would you like something?\
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
         HitRoll = 10, 
         Height = 0, 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         Level = 50, 
         Damage = 
         {
            DamNoDice = 5, 
            DamSizeDice = 4, 
            DamPlus = 2, 
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
         ArmorClass = -25, 
         Sex = "undistinguished", 
         Position = "standing", 
      }, 
      [11106] = 
      {
         Description = "", 
         Name = "Captain Jusclik", 
         Vnum = 11106, 
         AttackFlags = 
         {
            [5] = "kick", 
         }, 
         Weight = 0, 
         Credits = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "captain jusclik", 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 500, 
            HitNoDice = 10, 
         }, 
         LongDescr = "Captain Jusclik stands here giving orders.\
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
         DamRoll = 10, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         HitRoll = 10, 
         Height = 0, 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         Level = 50, 
         Damage = 
         {
            DamNoDice = 5, 
            DamSizeDice = 4, 
            DamPlus = 2, 
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
         ArmorClass = -25, 
         Sex = "undistinguished", 
         Position = "standing", 
      }, 
      [11107] = 
      {
         Description = "", 
         Name = "Tech customs officer", 
         Vnum = 11107, 
         AttackFlags = 
         {
            [5] = "kick", 
         }, 
         Weight = 0, 
         Credits = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [10] = "Practice", 
         }, 
         ShortDescr = "a tech customs officer", 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 300, 
            HitNoDice = 6, 
         }, 
         LongDescr = "A tech customs oficer watches for carried weapons.\
", 
         DefaultPosition = "standing", 
         SpecFuns = 
         {
            [1] = "spec_customs_weapons", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "5", 
               MudProgType = "rand_prog", 
               Code = "mpat 11274 drop all\
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
            DamNoDice = 3, 
            DamSizeDice = 4, 
            DamPlus = 2, 
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
         ArmorClass = 25, 
         Sex = "undistinguished", 
         Position = "standing", 
      }, 
      [11108] = 
      {
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
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
            ProfitSell = 90, 
            ProfitBuy = 120, 
            KeeperShortDescr = "tech chef", 
         }, 
         Description = "", 
         Name = "tech chef", 
         Vnum = 11108, 
         Weight = 0, 
         Credits = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [25] = "NoKill", 
            [30] = "Prototype", 
         }, 
         ShortDescr = "tech chef", 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 500, 
            HitNoDice = 10, 
         }, 
         LongDescr = "A tech chef makes food here.\
", 
         DefaultPosition = "standing", 
         Immune = 
         {
            [20] = "magic", 
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
         HitRoll = 10, 
         Height = 0, 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         Level = 50, 
         Damage = 
         {
            DamNoDice = 5, 
            DamSizeDice = 4, 
            DamPlus = 2, 
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
         ArmorClass = -25, 
         Sex = "male", 
         Position = "standing", 
      }, 
      [11109] = 
      {
         Description = "", 
         Name = "Mr Kooos", 
         Vnum = 11109, 
         Weight = 0, 
         Credits = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         ShortDescr = "Mr Kooos", 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 90, 
            HitNoDice = 1, 
         }, 
         LongDescr = "Mr Kooos is looking for assitance\
", 
         DefaultPosition = "standing", 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "add hello hi", 
               MudProgType = "speech_prog", 
               Code = "say Hello, could you please take me to the swimming pool?\
", 
            }, 
            [2] = 
            {
               Arguments = "add yes sure", 
               MudProgType = "speech_prog", 
               Code = "say Are you talking to me?\
say My name is Mr Kooos\
", 
            }, 
            [3] = 
            {
               Arguments = "add kooos kooos", 
               MudProgType = "speech_prog", 
               Code = "say You will take me to the Pool?\
say Thanks $n, I really appreciate this.\
follow $n\
", 
            }, 
            [4] = 
            {
               Arguments = "turnstile", 
               MudProgType = "act_prog", 
               Code = "mpwithdraw 5\
give 5 credits droid\
", 
            }, 
            [5] = 
            {
               Arguments = "turbocar", 
               MudProgType = "act_prog", 
               Code = "board turbocar\
", 
            }, 
            [6] = 
            {
               Arguments = "exits", 
               MudProgType = "act_prog", 
               Code = "leave\
", 
            }, 
            [7] = 
            {
               Arguments = "100", 
               MudProgType = "entry_prog", 
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
         DamRoll = 1, 
         HitRoll = 1, 
         Height = 0, 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         Level = 9, 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 4, 
            DamPlus = 2, 
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
         ArmorClass = 77, 
         Sex = "undistinguished", 
         Position = "standing", 
      }, 
      [11110] = 
      {
         Description = "", 
         Name = "Freelance Tech", 
         Vnum = 11110, 
         Weight = 0, 
         Credits = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         ShortDescr = "a freelance tech", 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 500, 
            HitNoDice = 10, 
         }, 
         LongDescr = "A Freelance Tech will buy hand-crafted weapons here.\
", 
         DefaultPosition = "standing", 
         Immune = 
         {
            [11] = "charm", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "hello job", 
               MudProgType = "speech_prog", 
               Code = "say I am looking for hand-crafted vibroblades and blasters.\
", 
            }, 
            [2] = 
            {
               Arguments = "money sure okay ok yes", 
               MudProgType = "speech_prog", 
               Code = "say I will pay good money.\
say 500 for each vibroblade and 1500 for each blaster.\
", 
            }, 
            [3] = 
            {
               Arguments = "gives", 
               MudProgType = "act_prog", 
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
         HitRoll = 10, 
         Height = 0, 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         Level = 50, 
         Damage = 
         {
            DamNoDice = 5, 
            DamSizeDice = 4, 
            DamPlus = 2, 
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
         ArmorClass = -25, 
         Sex = "undistinguished", 
         Position = "standing", 
      }, 
      [11111] = 
      {
         Description = "", 
         Name = "Riiice", 
         Vnum = 11111, 
         Weight = 0, 
         Credits = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         ShortDescr = "Riiice", 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 250, 
            HitNoDice = 5, 
         }, 
         LongDescr = "Riiice waits here for his agents.\
", 
         DefaultPosition = "standing", 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "hello job", 
               MudProgType = "speech_prog", 
               Code = "mpechoat $n Riiice whispers to you: I need some\
mpechoat $n film developed.  It's good money.\
", 
            }, 
            [2] = 
            {
               Arguments = "sure okay ok yes", 
               MudProgType = "speech_prog", 
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
            }, 
            [3] = 
            {
               Arguments = "gives", 
               MudProgType = "act_prog", 
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
         DamRoll = 5, 
         HitRoll = 5, 
         Height = 0, 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         Level = 25, 
         Damage = 
         {
            DamNoDice = 2, 
            DamSizeDice = 4, 
            DamPlus = 2, 
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
         ArmorClass = 37, 
         Sex = "undistinguished", 
         Position = "standing", 
      }, 
      [11112] = 
      {
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
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
            ProfitSell = 90, 
            ProfitBuy = 120, 
            KeeperShortDescr = "salesman", 
         }, 
         Description = "As fast as new products become available to Bounty Hunters, this salesman\
somehow gets them. Of course they can be a little pricy. But that what you\
pay to get the best i guess. \
", 
         Name = "A salesman", 
         Vnum = 11112, 
         Weight = 0, 
         Credits = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [25] = "NoKill", 
            [30] = "Prototype", 
         }, 
         ShortDescr = "salesman", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         LongDescr = "A freelance salesman sells engineering supplies\
", 
         DefaultPosition = "standing", 
         Immune = 
         {
            [20] = "magic", 
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
      [11101] = 
      {
         Description = "Although it looks like a formitable defense, looking closely you see that\
the power cables have been severed. \
", 
         Name = "A disabled blaster-cannon turret", 
         Vnum = 11101, 
         Weight = 0, 
         Credits = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "a turret", 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 10, 
            HitNoDice = 0, 
         }, 
         LongDescr = "A blaster-cannon turret is installed here.\
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
            DamSizeDice = 4, 
            DamPlus = 2, 
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
         ArmorClass = 97, 
         Sex = "undistinguished", 
         Position = "standing", 
      }, 
      [11102] = 
      {
         Description = "", 
         Name = "A Wampa", 
         Vnum = 11102, 
         Weight = 0, 
         Credits = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [5] = "Aggressive", 
         }, 
         ShortDescr = "A wampa", 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 200, 
            HitNoDice = 4, 
         }, 
         LongDescr = "A Wampa tears through bags looking for food.\
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
         DamRoll = 4, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         HitRoll = 4, 
         Height = 0, 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         Level = 20, 
         Damage = 
         {
            DamNoDice = 2, 
            DamSizeDice = 4, 
            DamPlus = 2, 
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
         ArmorClass = 50, 
         Sex = "undistinguished", 
         Position = "standing", 
      }, 
      [11103] = 
      {
         Description = "", 
         Name = "Wampa", 
         Vnum = 11103, 
         Weight = 0, 
         Credits = 500, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [5] = "Aggressive", 
         }, 
         ShortDescr = "a wampa", 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 400, 
            HitNoDice = 8, 
         }, 
         LongDescr = "A Wampa looks comfortable nawing on a bone.\
", 
         DefaultPosition = "standing", 
         Immune = 
         {
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
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Breath = 0, 
         }, 
         Race = "Human", 
         VipFlags = 
         {
            [18] = "_18", 
         }, 
         DamRoll = 8, 
         HitRoll = 8, 
         Height = 0, 
         Alignment = -1000, 
         NumberOfAttacks = 0, 
         Level = 40, 
         Damage = 
         {
            DamNoDice = 4, 
            DamSizeDice = 4, 
            DamPlus = 2, 
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
   }, 
   Resets = 
   {
      [1] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 2, 
         Arg1 = 11101, 
         Arg3 = 11206, 
      }, 
      [2] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 2, 
         Arg1 = 11101, 
         Arg3 = 11220, 
      }, 
      [3] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 5, 
         Arg1 = 11103, 
         Arg3 = 11233, 
      }, 
      [4] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 5, 
         Arg1 = 11103, 
         Arg3 = 11235, 
      }, 
      [5] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 11104, 
         Arg3 = 11236, 
      }, 
      [6] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 5, 
         Arg1 = 11103, 
         Arg3 = 11236, 
      }, 
      [7] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 5, 
         Arg1 = 11103, 
         Arg3 = 11236, 
      }, 
      [8] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 5, 
         Arg1 = 11103, 
         Arg3 = 11237, 
      }, 
      [9] = 
      {
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 90, 
         Arg3 = 11209, 
      }, 
      [10] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 52, 
         Arg3 = 16, 
      }, 
      [11] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 52, 
         Arg3 = 18, 
      }, 
      [12] = 
      {
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 10493, 
         Arg3 = 11210, 
      }, 
   }, 
   Rooms = 
   {
      [11206] = 
      {
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         TeleVnum = 0, 
         Vnum = 11206, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "A snowfield", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 11207, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 11246, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [11207] = 
      {
         Description = "You are outside the formerly hidden shield doors that once sealed off the\
abandoned Echo Base.   The opening to the ice cave that was the Base, is\
flanked by rocks, even though most of the base was chewed into\
centuries-old packed snow and ice.\
", 
         TeleVnum = 0, 
         Vnum = 11207, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Outside the 'hidden' shield doors", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 11208, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 11211, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 11206, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "field", 
      }, 
      [11208] = 
      {
         Description = "The hangar of Echo Base is now filled with scrap equipment, discarded\
uniforms, and other miscellaneous junk. \
", 
         TeleVnum = 0, 
         Vnum = 11208, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Inside Echo Base", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 11209, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 11207, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "field", 
      }, 
      [11209] = 
      {
         Description = "This hallway, carved from ice has started to collapse and at its end is\
closed off by a previous cave-in.\
 \
There is a bed shoved in a corner.  Perhaps you can rest here.\
 \
 \
It is safe to quit here.\
", 
         TeleVnum = 0, 
         Vnum = 11209, 
         Flags = 
         {
            [23] = "Hotel", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Hallway", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 11208, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 11210, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "field", 
      }, 
      [11210] = 
      {
         Description = "This storeroom seems to have been ransacked.  All the bags and boxes have\
been destroyed, the remains of wrappers strewn everywhere. \
", 
         TeleVnum = 0, 
         Vnum = 11210, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Storeroom", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 11209, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "field", 
      }, 
      [11211] = 
      {
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         TeleVnum = 0, 
         Vnum = 11211, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "A snowfield", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 11212, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 11207, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "field", 
      }, 
      [11212] = 
      {
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         TeleVnum = 0, 
         Vnum = 11212, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "A snowfield", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 11215, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 11213, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 11211, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "field", 
      }, 
      [11213] = 
      {
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         TeleVnum = 0, 
         Vnum = 11213, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "A snowfield", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 11212, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 11214, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "field", 
      }, 
      [11214] = 
      {
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around. \
", 
         TeleVnum = 0, 
         Vnum = 11214, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "A snowfield", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 11213, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 11247, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "field", 
      }, 
      [11215] = 
      {
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         TeleVnum = 0, 
         Vnum = 11215, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "A snowfield", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 11216, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 11212, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "field", 
      }, 
      [11216] = 
      {
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         TeleVnum = 0, 
         Vnum = 11216, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "A snowfield", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 11217, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 11220, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 11215, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "field", 
      }, 
      [11217] = 
      {
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         TeleVnum = 0, 
         Vnum = 11217, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "A snowfield", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 11218, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 11216, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "field", 
      }, 
      [11218] = 
      {
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         TeleVnum = 0, 
         Vnum = 11218, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "A snowfield", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 11219, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 11217, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "field", 
      }, 
      [11219] = 
      {
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         TeleVnum = 0, 
         Vnum = 11219, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "A snowfield", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 11218, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "field", 
      }, 
      [11220] = 
      {
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         TeleVnum = 0, 
         Vnum = 11220, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "A snowfield", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 11221, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 11216, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "field", 
      }, 
      [11221] = 
      {
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         TeleVnum = 0, 
         Vnum = 11221, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "A snowfield", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 11222, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 11220, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "field", 
      }, 
      [11222] = 
      {
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         TeleVnum = 0, 
         Vnum = 11222, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "A snowfield", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 11221, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 11225, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 11223, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "field", 
      }, 
      [11223] = 
      {
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         TeleVnum = 0, 
         Vnum = 11223, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "A snowfield", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 11222, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 11224, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "field", 
      }, 
      [11224] = 
      {
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         TeleVnum = 0, 
         Vnum = 11224, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "A snowfield", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 11223, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "field", 
      }, 
      [11225] = 
      {
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         TeleVnum = 0, 
         Vnum = 11225, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "A snowfield", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 11226, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 11222, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "field", 
      }, 
      [11226] = 
      {
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         TeleVnum = 0, 
         Vnum = 11226, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "A snowfield", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 11229, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 11227, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 11225, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "field", 
      }, 
      [11227] = 
      {
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         TeleVnum = 0, 
         Vnum = 11227, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "A snowfield", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 11226, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 11228, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "field", 
      }, 
      [11228] = 
      {
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         TeleVnum = 0, 
         Vnum = 11228, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "A snowfield", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 11227, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "field", 
      }, 
      [11229] = 
      {
         Description = "This large field is covered with snow.  The only break from the sheet of\
flat white, is the hills that make up the abandoned Rebel Base.  You see\
footprints that appear to be left by large animals, all around.\
", 
         TeleVnum = 0, 
         Vnum = 11229, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "A snowfield", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 11226, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 11230, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "field", 
      }, 
      [11230] = 
      {
         Description = "The entrance to the Wampa Kingdom is a small hole in the ground.  You can\
not see it from more than 6 feet away, and in heavy weather, one can\
easily fall in. \
", 
         TeleVnum = 0, 
         Vnum = 11230, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Wampa Kingdom", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 11231, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 11229, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "field", 
      }, 
      [11231] = 
      {
         Description = "The Wampa kingdom is made up of many ice caves, each filled with boned and\
leavings from the many Wampas. \
", 
         TeleVnum = 0, 
         Vnum = 11231, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Wampa Kingdom", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 11232, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 11230, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "field", 
      }, 
      [11232] = 
      {
         Description = "The Wampa kingdom is made up of many ice caves, each filled with bones and\
leavings from the many Wampas. \
", 
         TeleVnum = 0, 
         Vnum = 11232, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Wampa Kingdom", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 11233, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 11237, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 11234, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 11231, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "field", 
      }, 
      [11233] = 
      {
         Description = "The Wampa kingdom is made up of many ice caves, each filled with bones and\
leavings from the many Wampas. \
", 
         TeleVnum = 0, 
         Vnum = 11233, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Wampa Den", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 11232, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "field", 
      }, 
      [11234] = 
      {
         Description = "The Wampa kingdom is made up of many ice caves, each filled with bones and\
leavings from the many Wampas. \
", 
         TeleVnum = 0, 
         Vnum = 11234, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Wampa Kingdom", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 11232, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 11235, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 11236, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "field", 
      }, 
      [11235] = 
      {
         Description = "The Wampa kingdom is made up of many ice caves, each filled with bones and\
leavings from the many Wampas. \
", 
         TeleVnum = 0, 
         Vnum = 11235, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Wampa Den", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 11234, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "field", 
      }, 
      [11236] = 
      {
         Description = "The Wampa kingdom is made up of many ice caves, each filled with bones and\
leavings from the many Wampas. \
", 
         TeleVnum = 0, 
         Vnum = 11236, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Leader's Den", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 11234, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "field", 
      }, 
      [11237] = 
      {
         Description = "The Wampa kingdom is made up of many ice caves, each filled with bones and\
leavings from the many Wampas. \
", 
         TeleVnum = 0, 
         Vnum = 11237, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Wampa Den", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 11232, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "field", 
      }, 
      [11238] = 
      {
         Description = "It looks like a cavein blocked the passage way here.  You can go no\
further.\
", 
         TeleVnum = 0, 
         Vnum = 11238, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Cave-in", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 11239, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "field", 
      }, 
      [11239] = 
      {
         Description = "One of the large hangars that were part of Echo base, the room is filled\
with wrecked speeders and fighters.\
", 
         TeleVnum = 0, 
         Vnum = 11239, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Echo Base Hangar", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 11238, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "field", 
      }, 
      [11240] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 11240, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "BlackStar", 
         Exits = 
         {
         }, 
         Sector = "field", 
      }, 
      [11241] = 
      {
         Description = "The new fighter designed by the Outlaw Techs, the Lightning Bomber looks\
similar to an old headhunter.  However, sleaker, faster, heavily shielded,\
with 4 laser cannons and enough firepower to take down a corvette at long\
range.\
", 
         TeleVnum = 0, 
         Vnum = 11241, 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Lightning Bomber 11241", 
         Exits = 
         {
         }, 
         Sector = "city", 
      }, 
      [11242] = 
      {
         Description = "The new fighter designed by the Outlaw Techs, the Lightning Bomber looks\
similar to an old headhunter.  However, sleaker, faster, heavily shielded,\
with 4 laser cannons and enough firepower to take down a corvette at long\
range. \
", 
         TeleVnum = 0, 
         Vnum = 11242, 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Lightning Bomber 11242", 
         Exits = 
         {
         }, 
         Sector = "city", 
      }, 
      [11243] = 
      {
         Description = "The new fighter designed by the Outlaw Techs, the Lightning Bomber looks\
similar to an old headhunter.  However, sleaker, faster, heavily shielded,\
with 4 laser cannons and enough firepower to take down a corvette at long\
range. \
", 
         TeleVnum = 0, 
         Vnum = 11243, 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Lightning Bomber 11243", 
         Exits = 
         {
         }, 
         Sector = "city", 
      }, 
      [11244] = 
      {
         Description = "The new fighter designed by the Outlaw Techs, the Lightning Bomber looks\
similar to an old headhunter.  However, sleaker, faster, heavily shielded,\
with 4 laser cannons and enough firepower to take down a corvette at long\
range. \
", 
         TeleVnum = 0, 
         Vnum = 11244, 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Lightning Bomber 11244", 
         Exits = 
         {
         }, 
         Sector = "city", 
      }, 
      [11245] = 
      {
         Description = "The new fighter designed by the Outlaw Techs, the Lightning Bomber looks\
similar to an old headhunter.  However, sleaker, faster, heavily shielded,\
with 4 laser cannons and enough firepower to take down a corvette at long\
range. \
", 
         TeleVnum = 0, 
         Vnum = 11245, 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Lightning Bomber 11245", 
         Exits = 
         {
         }, 
         Sector = "city", 
      }, 
      [11246] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 11246, 
         Flags = 
         {
            [4] = "CanLand", 
            [5] = "CanFly", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "A snowfield", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 11206, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [11247] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 11247, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Floating in a void", 
         Exits = 
         {
            [1] = 
            {
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 11214, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 11248, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [11248] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 11248, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Ice Worm's Cave", 
         Exits = 
         {
            [1] = 
            {
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 11247, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 11249, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [11249] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 11249, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "A Hidden Cavern", 
         Exits = 
         {
            [1] = 
            {
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 11248, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "field", 
      }, 
   }, 
   LevelRanges = 
   {
      Hard = 
      {
         Low = 1, 
         High = 105, 
      }, 
      Soft = 
      {
         Low = 0, 
         High = 0, 
      }, 
   }, 
   Objects = 
   {
      [11111] = 
      {
         ActionDescription = "", 
         Name = "Outlaw tech idea board", 
         Vnum = 11111, 
         Weight = 1, 
         ShortDescr = "outlaw tech idea board", 
         Description = "The Outlaw Tech Idea Board", 
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
      [11110] = 
      {
         ActionDescription = "", 
         Name = "outlaw.board", 
         Vnum = 11110, 
         Weight = 1, 
         ShortDescr = "outlaw tech baord", 
         Description = "The Outlaw Tech Board", 
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
      [11109] = 
      {
         ActionDescription = "", 
         Name = "Sign", 
         Vnum = 11109, 
         Weight = 1, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         ShortDescr = "a sign", 
         Description = "A sign is tacked to the wall here", 
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
            [1] = 
            {
               Keyword = "Sign", 
               Description = "The Mountain Defense School has merged with the Gamaak Fitness Center.  You\
\13can find us there.\
\13", 
            }, 
         }, 
         Cost = 0, 
      }, 
      [11101] = 
      {
         ActionDescription = "", 
         Name = "receptionist package", 
         Vnum = 11101, 
         Weight = 1, 
         Description = "A package addressed to the Hunter's Guild's Receptionist", 
         ShortDescr = "a package addressed receptionist", 
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
            [0] = "Take", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
      }, 
      [11102] = 
      {
         ActionDescription = "", 
         Name = "cargo", 
         Vnum = 11102, 
         Weight = 100, 
         Description = "Some cargo has been left here.", 
         ShortDescr = "cargo", 
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
            [0] = "Take", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
      }, 
      [11103] = 
      {
         ActionDescription = "", 
         Name = "duraplast tubing", 
         Vnum = 11103, 
         Weight = 1, 
         Description = "Some duraplast during has been left lying around here.", 
         ShortDescr = "duraplast tubing", 
         Layers = 0, 
         ItemType = "duraplast", 
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
   ResetFrequency = 10, 
   ResetMessage = "The wind howls over the snow.", 
   FileFormatVersion = 1, 
   LowEconomy = 2775770, 
   Author = "Darrik", 
}
