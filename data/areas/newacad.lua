-- Coruscant Academy
-- Last saved Wednesday 06-May-2020 12:59:10

AreaEntry
{
   ResetFrequency = 3, 
   Flags = 
   {
      [1] = "_01", 
      [0] = "NoPkill", 
   }, 
   HighEconomy = 0, 
   Mobiles = 
   {
      [10370] = 
      {
         Weight = 0, 
         LongDescr = "A droid is here selling useful items to students.\
", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [26] = "Droid", 
         }, 
         HitRoll = 2, 
         Level = 20, 
         Position = "standing", 
         ArmorClass = 80, 
         AffectedBy = 
         {
            [3] = "DetectInvis", 
         }, 
         DefaultPosition = "standing", 
         Shop = 
         {
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "container", 
            }, 
            ProfitBuy = 120, 
            KeeperShortDescr = "a shopkeeper", 
            ProfitSell = 90, 
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
            KeeperVnum = 10370, 
         }, 
         Languages = 
         {
            Speaks = 
            {
               [1] = "shyriiwook", 
               [2] = "twileki", 
               [4] = "huttese", 
               [5] = "mon calamarian", 
               [6] = "shistavanen", 
               [7] = "ewokese", 
               [9] = "antarian", 
               [10] = "devaronese", 
               [14] = "gamorrese", 
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
               [0] = "basic", 
            }, 
            Speaking = 
            {
               [1] = "shyriiwook", 
               [2] = "twileki", 
               [4] = "huttese", 
               [5] = "mon calamarian", 
               [6] = "shistavanen", 
               [7] = "ewokese", 
               [0] = "basic", 
               [17] = "jawaese", 
               [18] = "_clan", 
               [19] = "adarese", 
               [20] = "verpine", 
               [21] = "defel", 
               [22] = "dosh", 
               [23] = "chadra-fan", 
               [24] = "quarrenese", 
               [25] = "sullustese", 
               [14] = "gamorrese", 
            }, 
         }, 
         NumberOfAttacks = 0, 
         Name = "shopkeeper droid", 
         SaveVs = 
         {
            Breath = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Height = 0, 
         Stats = 
         {
            Wisdom = 13, 
            Intelligence = 13, 
            Strength = 13, 
            Constitution = 13, 
            Dexterity = 13, 
            Force = 0, 
            Luck = 13, 
            Charisma = 13, 
         }, 
         Immune = 
         {
            [20] = "magic", 
            [11] = "charm", 
         }, 
         HitChance = 
         {
            HitPlus = 2, 
            HitSizeDice = 20, 
            HitNoDice = 2, 
         }, 
         Credits = 100, 
         ShortDescr = "a shopkeeper", 
         DamRoll = 2, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamNoDice = 2, 
            DamPlus = 10, 
         }, 
         Sex = "undistinguished", 
         Race = "Human", 
         Description = "", 
         Vnum = 10370, 
         Alignment = 0, 
      }, 
      [10355] = 
      {
         Weight = 0, 
         SpecFuns = 
         {
            [1] = "spec_newbie_pilot", 
         }, 
         LongDescr = "A Mon Calamarian pilot is here ferrying academy graduates.\
", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         HitRoll = 0, 
         Level = 1, 
         Position = "standing", 
         ArmorClass = 0, 
         Sex = "undistinguished", 
         DefaultPosition = "standing", 
         NumberOfAttacks = 0, 
         Name = "pilot", 
         MudProgs = 
         {
            [1] = 
            {
               Code = "look diploma\
say Thank-you.\
give diploma $n\
", 
               Arguments = "p gives you a diploma.", 
               MudProgType = "act_prog", 
            }, 
            [2] = 
            {
               Code = "bow $n\
say May I see your diploma please.\
", 
               Arguments = "100", 
               MudProgType = "all_greet_prog", 
            }, 
         }, 
         Height = 0, 
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
            Breath = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         Credits = 0, 
         ShortDescr = "a pilot", 
         Stats = 
         {
            Wisdom = 10, 
            Intelligence = 10, 
            Strength = 10, 
            Constitution = 10, 
            Dexterity = 10, 
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         DamRoll = 0, 
         Race = "Human", 
         Description = "", 
         Vnum = 10355, 
         Alignment = 0, 
      }, 
      [10340] = 
      {
         Weight = 0, 
         LongDescr = "Domick, Lord of Knowledge, sits here reading, waiting for students.\
", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [10] = "Practice", 
            [30] = "Prototype", 
         }, 
         HitRoll = 0, 
         Level = 1, 
         Position = "standing", 
         ArmorClass = 94, 
         AffectedBy = 
         {
            [7] = "Sanctuary", 
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         DefaultPosition = "standing", 
         MudProgs = 
         {
            [1] = 
            {
               Code = "tell $n Are you ready for your lessons?\
", 
               Arguments = "100", 
               MudProgType = "all_greet_prog", 
            }, 
            [2] = 
            {
               Code = "tell $n That will be 10 credits.\
mpechoat $n All teachers will charge you a certain amount \
mpechoat $n of credits, depending on the level you receive the skill at.\
mpechoat $n It is taken out automatically, so do not give Domick 10\
mpechoat $n credits :).\
", 
               Arguments = "practices", 
               MudProgType = "act_prog", 
            }, 
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
               [17] = "jawaese", 
            }, 
         }, 
         NumberOfAttacks = 0, 
         Name = "Domick Dom teacher", 
         SaveVs = 
         {
            Breath = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 37, 
         }, 
         Height = 0, 
         Stats = 
         {
            Wisdom = 13, 
            Intelligence = 13, 
            Strength = 13, 
            Constitution = 13, 
            Dexterity = 13, 
            Force = 0, 
            Luck = 0, 
            Charisma = 13, 
         }, 
         Immune = 
         {
            [20] = "magic", 
            [13] = "nonmagic", 
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         HitChance = 
         {
            HitPlus = 1000, 
            HitSizeDice = 1, 
            HitNoDice = 1, 
         }, 
         Credits = 100, 
         ShortDescr = "Domick", 
         DamRoll = 0, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         Sex = "male", 
         Race = "Human", 
         Description = "Domick carries himself with a grace and confidence born from his\
long life and many experiences in these Realms. He is looked on\
with awe and unquestioned respect. That respect is well deserved.\
Do not attempt to kill him, for you shall surely die.\
", 
         Vnum = 10340, 
         Alignment = 1000, 
      }, 
      [10342] = 
      {
         Weight = 0, 
         LongDescr = "An acadamy student is here taking a break from his studies.\
", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         HitRoll = 0, 
         Level = 1, 
         Position = "standing", 
         ArmorClass = 0, 
         Sex = "undistinguished", 
         DefaultPosition = "standing", 
         NumberOfAttacks = 0, 
         Name = "academy student", 
         MudProgs = 
         {
            [1] = 
            {
               Code = "say You can have it anyways.\
give luke $n\
drop all\
", 
               Arguments = "no nope", 
               MudProgType = "speech_prog", 
            }, 
            [2] = 
            {
               Code = "say Ok you can have it then.\
give luke $n\
drop all\
", 
               Arguments = "yes yep", 
               MudProgType = "speech_prog", 
            }, 
            [3] = 
            {
               Code = "say Hello.\
Say I found this toy ... is it yours?\
mpat 10399 mpoload 10320\
mpecho A student shows you a Luke Skywalker Action Figure.\
", 
               Arguments = "hi hello", 
               MudProgType = "speech_prog", 
            }, 
         }, 
         Height = 0, 
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
               [18] = "_clan", 
               [19] = "adarese", 
               [20] = "verpine", 
               [21] = "defel", 
               [22] = "dosh", 
               [23] = "chadra-fan", 
               [24] = "quarrenese", 
               [25] = "sullustese", 
               [0] = "basic", 
            }, 
            Speaking = 
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
               [18] = "_clan", 
               [19] = "adarese", 
               [20] = "verpine", 
               [21] = "defel", 
               [22] = "dosh", 
               [23] = "chadra-fan", 
               [24] = "quarrenese", 
               [25] = "sullustese", 
               [0] = "basic", 
            }, 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         Credits = 0, 
         ShortDescr = "a student", 
         Stats = 
         {
            Wisdom = 10, 
            Intelligence = 10, 
            Strength = 10, 
            Constitution = 10, 
            Dexterity = 10, 
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         DamRoll = 0, 
         Race = "Human", 
         Description = "", 
         Vnum = 10342, 
         Alignment = 0, 
      }, 
      [10343] = 
      {
         Weight = 0, 
         LongDescr = "A young child is sitting here.\
", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         HitRoll = 0, 
         Level = 1, 
         Position = "standing", 
         ArmorClass = 0, 
         Sex = "male", 
         DefaultPosition = "standing", 
         NumberOfAttacks = 0, 
         Name = "kid child", 
         MudProgs = 
         {
            [1] = 
            {
               Code = "say thank you\
", 
               Arguments = "p gives you a Luke Skywalker action figure.", 
               MudProgType = "act_prog", 
            }, 
            [2] = 
            {
               Code = "snif\
say I lost my Luke Skywalker toy\
cry\
", 
               Arguments = "100", 
               MudProgType = "all_greet_prog", 
            }, 
            [3] = 
            {
               Code = "if ovnuminv (10320) >= 1\
say You want the key for this door?\
point north\
say here let me open it for you\
mpat 10399 mpoload 10423\
unlock north\
open north\
mpat 10399 drop all\
mpat 10399 purge\
else\
cry\
endif\
", 
               Arguments = "key", 
               MudProgType = "speech_prog", 
            }, 
            [4] = 
            {
               Code = "if ovnuminv (10320) >= 1\
say You want the key for this door?\
point north\
say here let me open it for you\
mpat 10399 mpoload 10423\
unlock north\
open north\
mpat 10399 drop all\
mpat 10399 purge\
else\
cry\
endif\
", 
               Arguments = "door door? key?", 
               MudProgType = "speech_prog", 
            }, 
            [5] = 
            {
               Code = "if ovnuminv (10320) >= 1\
say You want the key for this door?\
point north\
say here let me open it for you\
mpat 10399 mpoload 10423\
unlock north\
open north\
mpat 10399 drop all\
mpat 10399 purge\
else\
cry\
endif\
", 
               Arguments = "door? north", 
               MudProgType = "speech_prog", 
            }, 
         }, 
         Height = 0, 
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
               [18] = "_clan", 
               [19] = "adarese", 
               [20] = "verpine", 
               [21] = "defel", 
               [22] = "dosh", 
               [23] = "chadra-fan", 
               [24] = "quarrenese", 
               [25] = "sullustese", 
               [0] = "basic", 
            }, 
            Speaking = 
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
               [18] = "_clan", 
               [19] = "adarese", 
               [20] = "verpine", 
               [21] = "defel", 
               [22] = "dosh", 
               [23] = "chadra-fan", 
               [24] = "quarrenese", 
               [25] = "sullustese", 
               [0] = "basic", 
            }, 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         Credits = 0, 
         ShortDescr = "a small child", 
         Stats = 
         {
            Wisdom = 10, 
            Intelligence = 10, 
            Strength = 10, 
            Constitution = 10, 
            Dexterity = 10, 
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         DamRoll = 0, 
         Race = "Human", 
         Description = "", 
         Vnum = 10343, 
         Alignment = 0, 
      }, 
      [10360] = 
      {
         Weight = 0, 
         LongDescr = "A practice droid is here waiting for combat.\
", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [26] = "Droid", 
         }, 
         HitRoll = 0, 
         Level = 1, 
         Position = "standing", 
         ArmorClass = 100, 
         Sex = "undistinguished", 
         DefaultPosition = "standing", 
         NumberOfAttacks = 0, 
         Name = "practice droid", 
         Height = 0, 
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
            Breath = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         HitChance = 
         {
            HitPlus = 5, 
            HitSizeDice = 4, 
            HitNoDice = 1, 
         }, 
         Credits = 10, 
         ShortDescr = "a practice droid", 
         Stats = 
         {
            Wisdom = 10, 
            Intelligence = 10, 
            Strength = 10, 
            Constitution = 10, 
            Dexterity = 10, 
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         DamRoll = 0, 
         Race = "Human", 
         Description = "", 
         Vnum = 10360, 
         Alignment = 0, 
      }, 
      [10345] = 
      {
         Weight = 0, 
         LongDescr = "The chadoyn is straining its leash, attempting to attack you.\
", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         HitRoll = 0, 
         Level = 2, 
         Position = "standing", 
         ArmorClass = 25, 
         Sex = "undistinguished", 
         DefaultPosition = "standing", 
         MudProgs = 
         {
            [1] = 
            {
               Code = "if level($n) >= 6\
if rand(50)\
mpechoat $n You feel an overwhelming desire for greater challenge.\
else\
mpechoat $n The chadoyn is far too easy for you to kill.\
endif\
endif\
", 
               Arguments = "85", 
               MudProgType = "death_prog", 
            }, 
         }, 
         NumberOfAttacks = 0, 
         Name = "chadoyn cage", 
         Languages = 
         {
            Speaks = 
            {
               [17] = "jawaese", 
            }, 
            Speaking = 
            {
               [0] = "basic", 
               [17] = "jawaese", 
            }, 
         }, 
         Height = 0, 
         SaveVs = 
         {
            Breath = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 44, 
         }, 
         Immune = 
         {
            [11] = "charm", 
         }, 
         HitChance = 
         {
            HitPlus = 1, 
            HitSizeDice = 4, 
            HitNoDice = 2, 
         }, 
         Credits = 0, 
         ShortDescr = "the chadoyn", 
         Stats = 
         {
            Wisdom = 13, 
            Intelligence = 13, 
            Strength = 13, 
            Constitution = 13, 
            Dexterity = 13, 
            Force = 0, 
            Luck = 0, 
            Charisma = 13, 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         DamRoll = 0, 
         Race = "_85", 
         Description = "He looks back at you with his beady little eyes and a snarl on his face.\
You are pretty sure you can best him in regards to combat.\
", 
         Vnum = 10345, 
         Alignment = 0, 
      }, 
      [10394] = 
      {
         Weight = 0, 
         LongDescr = "A beautiful lady stands here, waiting for her students.\
", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [20] = "Scholar", 
         }, 
         HitRoll = 0, 
         Level = 5, 
         Position = "standing", 
         ArmorClass = 5, 
         AffectedBy = 
         {
            [7] = "Sanctuary", 
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         DefaultPosition = "standing", 
         MudProgs = 
         {
            [1] = 
            {
               Code = "if ispc($n)\
wink $n\
if level($n) < 20\
tell $n My lessons start when you reach level 20. Have fun until then.\
else\
tell $n I am ready to teach you, are you prepared for the lessons?\
endif\
grin $n\
endif\
", 
               Arguments = "100", 
               MudProgType = "all_greet_prog", 
            }, 
            [2] = 
            {
               Code = "say You know, I am really a lover, not a fighter ...\
mpslay $n\
mpat $n mpechoat $n But alas, killing me was a slaying offense.\
mpgoto 10399\
mpat 10306 mpmload 10394\
", 
               Arguments = "100", 
               MudProgType = "death_prog", 
            }, 
            [3] = 
            {
               Code = "mptrans 0.$n\
mpechoat $n Abbigayle says, 'You fled, so I shall spare your life!'\
mpgoto 10399\
mpat 10306 mpmload 10394\
", 
               Arguments = "p flees head over heels!", 
               MudProgType = "act_prog", 
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
               [11] = "barabel", 
               [12] = "firrerreo", 
               [13] = "bothese", 
               [14] = "gamorrese", 
               [15] = "togorian", 
               [16] = "kubazian", 
               [17] = "jawaese", 
               [19] = "adarese", 
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
               [1] = "shyriiwook", 
               [2] = "twileki", 
               [3] = "rodese", 
               [4] = "huttese", 
               [5] = "mon calamarian", 
               [6] = "shistavanen", 
               [11] = "barabel", 
               [12] = "firrerreo", 
               [13] = "bothese", 
               [14] = "gamorrese", 
               [15] = "togorian", 
               [16] = "kubazian", 
               [17] = "jawaese", 
               [18] = "_clan", 
               [19] = "adarese", 
               [26] = "falleen", 
               [27] = "binary", 
               [28] = "yevethan", 
               [29] = "gand", 
               [30] = "durese", 
               [31] = "coyn", 
               [0] = "basic", 
            }, 
         }, 
         NumberOfAttacks = 0, 
         Name = "Abbigayle language teacher", 
         SaveVs = 
         {
            Breath = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Height = 0, 
         Stats = 
         {
            Wisdom = 13, 
            Intelligence = 13, 
            Strength = 13, 
            Constitution = 13, 
            Dexterity = 13, 
            Force = 0, 
            Luck = 13, 
            Charisma = 13, 
         }, 
         Immune = 
         {
            [20] = "magic", 
            [13] = "nonmagic", 
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 1, 
            HitNoDice = 1000, 
         }, 
         Credits = 50, 
         ShortDescr = "abbigayle", 
         DamRoll = 0, 
         Damage = 
         {
            DamSizeDice = 6, 
            DamNoDice = 1, 
            DamPlus = 3, 
         }, 
         Sex = "female", 
         Race = "Human", 
         Description = "This has to be one of the most beautiful women in these Realms, both inside\
and out. Her eyes have a sparkle of amusement and her face an easy smile.\
She knows you are admiring her, and she does not seem to mind. She is\
comfortable and confident that the picture she makes is breath taking. Her\
voice at last breaks the spell. Her voice is like satin, you can hardly\
wait for your lessons to begin. Any reason to hear her speak the tongues\
foreign to your ears.\
", 
         Vnum = 10394, 
         Alignment = 0, 
      }, 
      [10395] = 
      {
         Weight = 0, 
         LongDescr = "A sad student leans against the wall.\
", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         HitRoll = 0, 
         Level = 1, 
         Position = "standing", 
         ArmorClass = 0, 
         Sex = "undistinguished", 
         DefaultPosition = "standing", 
         NumberOfAttacks = 0, 
         Name = "sad student", 
         MudProgs = 
         {
            [1] = 
            {
               Code = "close north\
say Don't let it happen to you $n\
", 
               Arguments = "100", 
               MudProgType = "all_greet_prog", 
            }, 
            [2] = 
            {
               Code = "say My brother is dead.\
say Killed by a stray blaster shot.\
snif\
say If only he had made a clone.\
", 
               Arguments = "", 
               MudProgType = "script_prog", 
            }, 
         }, 
         Height = 0, 
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
               [18] = "_clan", 
               [19] = "adarese", 
               [20] = "verpine", 
               [21] = "defel", 
               [22] = "dosh", 
               [23] = "chadra-fan", 
               [24] = "quarrenese", 
               [25] = "sullustese", 
               [0] = "basic", 
            }, 
            Speaking = 
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
               [18] = "_clan", 
               [19] = "adarese", 
               [20] = "verpine", 
               [21] = "defel", 
               [22] = "dosh", 
               [23] = "chadra-fan", 
               [24] = "quarrenese", 
               [25] = "sullustese", 
               [0] = "basic", 
            }, 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         Credits = 0, 
         ShortDescr = "a sad student", 
         Stats = 
         {
            Wisdom = 10, 
            Intelligence = 10, 
            Strength = 10, 
            Constitution = 10, 
            Dexterity = 10, 
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         DamRoll = 0, 
         Race = "Human", 
         Description = "", 
         Vnum = 10395, 
         Alignment = 0, 
      }, 
      [10365] = 
      {
         Weight = 0, 
         LongDescr = "A service droid is here handing out canteens and rations.\
", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [26] = "Droid", 
         }, 
         HitRoll = 0, 
         Level = 10, 
         Position = "standing", 
         ArmorClass = 0, 
         Sex = "undistinguished", 
         DefaultPosition = "standing", 
         NumberOfAttacks = 0, 
         Name = "service droid", 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpoload 10314 1\
give canteen $n\
drop all\
", 
               Arguments = "canteen? canteen", 
               MudProgType = "speech_prog", 
            }, 
            [2] = 
            {
               Code = "mpoload 10313 1\
give ration $n\
drop all\
", 
               Arguments = "food? ration? food ration", 
               MudProgType = "speech_prog", 
            }, 
         }, 
         Height = 0, 
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
            Breath = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         HitChance = 
         {
            HitPlus = 100, 
            HitSizeDice = 0, 
            HitNoDice = 10, 
         }, 
         Credits = 0, 
         ShortDescr = "a service droid", 
         Stats = 
         {
            Wisdom = 10, 
            Intelligence = 10, 
            Strength = 10, 
            Constitution = 10, 
            Dexterity = 10, 
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 25, 
         }, 
         DamRoll = 0, 
         Race = "Human", 
         Description = "", 
         Vnum = 10365, 
         Alignment = 0, 
      }, 
      [10350] = 
      {
         Weight = 0, 
         SpecFuns = 
         {
            [1] = "spec_auth", 
         }, 
         LongDescr = "The schoolmaster is here offering diplomas to academy graduates.\
", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         HitRoll = 0, 
         Level = 1, 
         Position = "standing", 
         ArmorClass = 94, 
         AffectedBy = 
         {
            [7] = "Sanctuary", 
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         DefaultPosition = "standing", 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpadvance $n 2\
mpoload 10423\
mpat 10323 close n\
mpat 10323 lock n\
at 10299 drop 10423\
at 10299 mppurge\
 \
if goldamt($n) > 10500\
mpechoat $n &RDon't carry so much money as a newbie.\
mpechoat $n It's hazardous to your health.\
mpdamage $n 3000\
mppurge\
endif\
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
         NumberOfAttacks = 0, 
         Name = "professor schoolmaster teacher headmaster", 
         SaveVs = 
         {
            Breath = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Height = 0, 
         Stats = 
         {
            Wisdom = 13, 
            Intelligence = 13, 
            Strength = 13, 
            Constitution = 13, 
            Dexterity = 13, 
            Force = 0, 
            Luck = 0, 
            Charisma = 13, 
         }, 
         Immune = 
         {
            [20] = "magic", 
            [13] = "nonmagic", 
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         HitChance = 
         {
            HitPlus = 1000, 
            HitSizeDice = 1, 
            HitNoDice = 1, 
         }, 
         Credits = 100, 
         ShortDescr = "the Schoolmaster", 
         DamRoll = 0, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         Sex = "male", 
         Race = "Human", 
         Description = "Domick carries himself with a grace and confidence born from his\
long life and many experiences in these Realms. He is looked on\
with awe and unquestioned respect. That respect is well deserved.\
Do not attempt to kill him, for you shall surely die.\
", 
         Vnum = 10350, 
         Alignment = 1000, 
      }, 
      [10499] = 
      {
         Weight = 0, 
         LongDescr = "Some god abandoned a newly created final mob here.\
", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         HitRoll = 0, 
         Level = 1, 
         Position = "standing", 
         ArmorClass = 0, 
         Sex = "undistinguished", 
         DefaultPosition = "standing", 
         NumberOfAttacks = 0, 
         Name = "final mob", 
         Height = 0, 
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
            Breath = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         Credits = 0, 
         ShortDescr = "a newly created final mob", 
         Stats = 
         {
            Wisdom = 10, 
            Intelligence = 10, 
            Strength = 10, 
            Constitution = 10, 
            Dexterity = 10, 
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         DamRoll = 0, 
         Race = "Human", 
         Description = "", 
         Vnum = 10499, 
         Alignment = 0, 
      }, 
   }, 
   FileFormatVersion = 1, 
   Objects = 
   {
      [10304] = 
      {
         Weight = 2, 
         Name = "academy cap", 
         ActionDescription = "", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [4] = "Head", 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "This is a helmet made of fine iron, from the Darkhaven Academy.  It will\
\13protect you until you can find better.\
\13", 
               Keyword = "helmet iron", 
            }, 
         }, 
         ShortDescr = "an academy cap", 
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 3, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 3, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpforce $n sac $o\
", 
               Arguments = "100", 
               MudProgType = "drop_prog", 
            }, 
         }, 
         ItemType = "armor", 
         Description = "A Coruscant Academy cap is here.", 
         Affects = 
         {
            [1] = 
            {
               Location = 3, 
               Modifier = 1, 
            }, 
         }, 
         Vnum = 10304, 
      }, 
      [10305] = 
      {
         Weight = 3, 
         Name = "cape brocade academy", 
         ActionDescription = "", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [10] = "About", 
         }, 
         ShortDescr = "a black brocade cape", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "This cape is made from a heavy brocade. It will offer you warmth and\
\13protection until you can find something better. You can find it at the\
\13Darkhave Academy.\
\13", 
               Keyword = "cape brocade", 
            }, 
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
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpforce $n sac $o\
", 
               Arguments = "100", 
               MudProgType = "drop_prog", 
            }, 
         }, 
         ItemType = "armor", 
         Description = "A black brocade cape from the academy", 
         Cost = 0, 
         Vnum = 10305, 
      }, 
      [10306] = 
      {
         Weight = 5, 
         Name = "collar metal academy", 
         ActionDescription = "", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
         }, 
         ShortDescr = "a strong metal collar", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "This collar fits closely around your neck. It is thick with spikes to\
\13protect you in battle. You can find it in the Darkhaven Academy\
\13", 
               Keyword = "collar metal ", 
            }, 
         }, 
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 3, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpforce $n sac $o\
", 
               Arguments = "100", 
               MudProgType = "drop_prog", 
            }, 
         }, 
         ItemType = "armor", 
         Description = "A strong metal collar from the academy", 
         Cost = 0, 
         Vnum = 10306, 
      }, 
      [10307] = 
      {
         Weight = 1, 
         Name = "visor completion academy", 
         ActionDescription = "", 
         Flags = 
         {
            [6] = "Magic", 
         }, 
         Cost = 0, 
         Vnum = 10307, 
         WearFlags = 
         {
            [0] = "Take", 
            [17] = "Eyes", 
         }, 
         ShortDescr = "a visor of completion", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "Congratulations! You have completed the Darkhaven Academy and can now\
\13wear this visor with pride! It is magic too, type WEAR VISOR to use.\
\13", 
               Keyword = "visor completion", 
            }, 
         }, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpechoat $n As you wear this visor, you feel more intelligent and wise!\
mpechoaround $n As $n wears the visor of completion, $e looks more complete!\
", 
               Arguments = "100", 
               MudProgType = "wear_prog", 
            }, 
         }, 
         ItemType = "armor", 
         Description = "A visor of completion is here, emitting a faint glow.", 
         Affects = 
         {
            [1] = 
            {
               Location = 4, 
               Modifier = 1, 
            }, 
            [2] = 
            {
               Location = 3, 
               Modifier = 1, 
            }, 
         }, 
         Layers = 0, 
      }, 
      [10308] = 
      {
         Weight = 5, 
         Name = "academy vest", 
         ActionDescription = "", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [3] = "Body", 
         }, 
         ShortDescr = "an academy vest", 
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "This plate of armour will give you protection until you can find\
\13something better. \
\13", 
               Keyword = "plate armour", 
            }, 
         }, 
         ItemType = "armor", 
         Description = "An academy vest was left here.", 
         Cost = 0, 
         Vnum = 10308, 
      }, 
      [10309] = 
      {
         Weight = 1, 
         Name = "sleeves tin academy", 
         ActionDescription = "", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [8] = "Arms", 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "This sleeves will protect your arms until you can find something better.\
\13You can find them in the Darkhaven Academy.\
\13", 
               Keyword = "sleeves tin", 
            }, 
         }, 
         ShortDescr = "lightweight tin sleeves", 
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 3, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 3, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpforce $n sac $o\
", 
               Arguments = "100", 
               MudProgType = "drop_prog", 
            }, 
         }, 
         ItemType = "armor", 
         Description = "Lightweight tin sleeves from the academy", 
         Affects = 
         {
            [1] = 
            {
               Location = 1, 
               Modifier = 1, 
            }, 
         }, 
         Vnum = 10309, 
      }, 
      [10310] = 
      {
         Weight = 5, 
         Name = "forceshield energyshield shields shield", 
         ActionDescription = "", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [9] = "Shield", 
         }, 
         ShortDescr = "an energy shield", 
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "This is your first shield, it will help keep you safe until you can\
\13find something better.\
\13", 
               Keyword = "shield crest", 
            }, 
         }, 
         ItemType = "armor", 
         Description = "An energy shield was dropped here.", 
         Cost = 0, 
         Vnum = 10310, 
      }, 
      [10311] = 
      {
         Weight = 1, 
         Name = "light glowrod glowstick", 
         ActionDescription = "", 
         Flags = 
         {
            [0] = "Glow", 
            [13] = "Inventory", 
            [6] = "Magic", 
         }, 
         Vnum = 10311, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ShortDescr = "a glowrod", 
         ExtraDescriptions = 
         {
         }, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 50, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Cost = 5, 
         ItemType = "light", 
         Description = "A glowrod would make a good light source.", 
         Affects = 
         {
            [1] = 
            {
               Location = 24, 
               Modifier = -1, 
            }, 
         }, 
         Layers = 0, 
      }, 
      [10312] = 
      {
         Weight = 3, 
         Name = "academy vibro blade knife dagger vibro-blade", 
         ActionDescription = "", 
         Flags = 
         {
            [6] = "Magic", 
         }, 
         Vnum = 10312, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         ShortDescr = "a vibro-blade", 
         ExtraDescriptions = 
         {
         }, 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 4, 
            [3] = 2, 
            [4] = 1000, 
            [5] = 1000, 
            [0] = 12, 
         }, 
         Cost = 250, 
         ItemType = "weapon", 
         Description = "You see a finely honed vibro-blade here.", 
         Affects = 
         {
            [1] = 
            {
               Location = 18, 
               Modifier = -2, 
            }, 
         }, 
         Layers = 0, 
      }, 
      [10313] = 
      {
         Weight = 2, 
         Name = "ration standard packaged", 
         ActionDescription = "", 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         Vnum = 10313, 
         ShortDescr = "a packaged ration", 
         ExtraDescriptions = 
         {
         }, 
         ObjectValues = 
         {
            [1] = 50, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 50, 
         }, 
         Cost = 5, 
         ItemType = "food", 
         Description = "A packaged ration is here, waiting to be eaten.", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Layers = 0, 
      }, 
      [10314] = 
      {
         Weight = 1, 
         Name = "canteen water grey stock", 
         ActionDescription = "", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ShortDescr = "a canteen", 
         ObjectValues = 
         {
            [1] = 40, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 40, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         ItemType = "drink_container", 
         Description = "A small grey canteen has been drooped here.", 
         Cost = 10, 
         Vnum = 10314, 
      }, 
      [10315] = 
      {
         Weight = 1, 
         Name = "drinking fountain", 
         ActionDescription = "", 
         Layers = 0, 
         Vnum = 10315, 
         ShortDescr = "a fountain", 
         ObjectValues = 
         {
            [1] = 1000, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 1000, 
         }, 
         ItemType = "fountain", 
         Description = "A drinking fountain rests against the wall.", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
      }, 
      [10316] = 
      {
         Weight = 1, 
         Name = "socks", 
         ActionDescription = "", 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         Vnum = 10316, 
         ShortDescr = "a pair of socks", 
         ExtraDescriptions = 
         {
         }, 
         ObjectValues = 
         {
            [1] = 1, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Cost = 5, 
         ItemType = "armor", 
         Description = "A pair of socks is in a ball on the floor.", 
         WearFlags = 
         {
            [0] = "Take", 
            [6] = "Feet", 
         }, 
         Layers = 1, 
      }, 
      [10317] = 
      {
         Weight = 1, 
         Name = "academy backpack", 
         ActionDescription = "", 
         Layers = 64, 
         WearFlags = 
         {
            [0] = "Take", 
            [10] = "About", 
         }, 
         ShortDescr = "a backpack", 
         Cost = 5, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 20, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         ItemType = "container", 
         Description = "An academy backpack was carelessly misplaced here.", 
         Affects = 
         {
            [1] = 
            {
               Location = 17, 
               Modifier = -5, 
            }, 
         }, 
         Vnum = 10317, 
      }, 
      [10318] = 
      {
         Weight = 1, 
         Name = "grey button", 
         ActionDescription = "", 
         Layers = 0, 
         Vnum = 10318, 
         ShortDescr = "a button", 
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
               Code = "mpoload 10316 1\
mpoload 10308 1\
mpoload 10303 1\
pull button\
drop all\
mpecho A small panel opens revealing several articles of clothing.\
", 
               Arguments = "100", 
               MudProgType = "push_prog", 
            }, 
         }, 
         ItemType = "button", 
         Description = "A small grey button seems out of place on the wall here.", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
      }, 
      [10319] = 
      {
         Weight = 1, 
         Name = "box", 
         ActionDescription = "", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ShortDescr = "a box", 
         ObjectValues = 
         {
            [1] = 1, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         ItemType = "container", 
         Description = "A small box .. I wonder whats inside, maybe you should open it.", 
         Cost = 0, 
         Vnum = 10319, 
      }, 
      [10320] = 
      {
         Weight = 1, 
         Name = "luke toy action figure doll", 
         ActionDescription = "", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ShortDescr = "a Luke Skywalker action figure", 
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
         ItemType = "trash", 
         Description = "A Luke Skywalker action figure was misplaced here.", 
         Cost = 0, 
         Vnum = 10320, 
      }, 
      [10321] = 
      {
         Weight = 1, 
         Name = "diploma academy coruscant graduation", 
         ActionDescription = "", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ShortDescr = "a diploma", 
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
         ItemType = "paper", 
         Description = "Someone dropped their coruscant academy graduation diploma here.", 
         Cost = 0, 
         Vnum = 10321, 
      }, 
      [10322] = 
      {
         Weight = 1, 
         Name = "academy shuttle", 
         ActionDescription = "", 
         Layers = 0, 
         Vnum = 10322, 
         ShortDescr = "a shuttle", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "trash", 
         Description = "A small shuttle is docked here.", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
      }, 
      [10323] = 
      {
         Weight = 1, 
         Name = "practice lightsaber", 
         ActionDescription = "", 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         Vnum = 10323, 
         ShortDescr = "a practice lightsaber", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "Powered by a synthesized crystal, this weapon works like a real\
\13lightsaber, only significantly less powerful.\
\13", 
               Keyword = "practice lightsaber", 
            }, 
            [2] = 
            {
               Description = "Powered by a synthesized crystal, this weapon works like a real\
\13lightsaber, only significantly less powerful.\
\13", 
               Keyword = "practice lightsaber", 
            }, 
         }, 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 4, 
            [3] = 3, 
            [4] = 1000, 
            [5] = 1000, 
            [0] = 12, 
         }, 
         Cost = 500, 
         ItemType = "weapon", 
         Description = "A practice lightsaber is here.", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Layers = 0, 
      }, 
      [10324] = 
      {
         Weight = 1, 
         Name = "lightsaber battery", 
         ActionDescription = "", 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         Vnum = 10324, 
         ShortDescr = "a lightsaber battery", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "This power cell, the size of a fingertip, is\
\13well suited for powering a lightsaber.\
\13", 
               Keyword = "lightsaber battery", 
            }, 
         }, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 1000, 
         }, 
         Cost = 50, 
         ItemType = "battery", 
         Description = "A lightsaber battery is lying here.", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Layers = 0, 
      }, 
      [10499] = 
      {
         Weight = 1, 
         Name = "final object", 
         ActionDescription = "", 
         Layers = 0, 
         Vnum = 10499, 
         ShortDescr = "a newly created final object", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "trash", 
         Description = "Some god dropped a newly created final object here.", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
      }, 
      [10498] = 
      {
         Weight = 1, 
         Name = "superconductor", 
         ActionDescription = "", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ShortDescr = "a superconductor", 
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
         ItemType = "superconductor", 
         Description = "A superconductor is lying here.", 
         Cost = 0, 
         Vnum = 10498, 
      }, 
      [10497] = 
      {
         Weight = 1, 
         Name = "circuit board", 
         ActionDescription = "", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ShortDescr = "a circuit board", 
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
         ItemType = "circuit", 
         Description = "A circuit board was dropped here.", 
         Cost = 120, 
         Vnum = 10497, 
      }, 
      [10496] = 
      {
         Weight = 1, 
         Name = "mirror", 
         ActionDescription = "", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ShortDescr = "a tiny, round mirror", 
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
         ItemType = "mirror", 
         Description = "A tiny, round mirror is lying here.", 
         Cost = 0, 
         Vnum = 10496, 
      }, 
      [10495] = 
      {
         Weight = 1, 
         Name = "non-adegan crystal", 
         ActionDescription = "", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ShortDescr = "a non-adegan crystal", 
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
         ItemType = "crystal", 
         Description = "A non-adegan crystal is lying here.", 
         Cost = 0, 
         Vnum = 10495, 
      }, 
      [10494] = 
      {
         Weight = 1, 
         Name = "some scrap durasteel", 
         ActionDescription = "", 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         Vnum = 10494, 
         ShortDescr = "some scrap durasteel", 
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
         Cost = 50, 
         ItemType = "durasteel", 
         Description = "A scrap of some material lies here.", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Layers = 0, 
      }, 
      [10493] = 
      {
         Weight = 1, 
         Name = "portable oven", 
         ActionDescription = "", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ShortDescr = "a portable oven", 
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
         ItemType = "oven", 
         Description = "A portable oven is here.", 
         Cost = 0, 
         Vnum = 10493, 
      }, 
      [10492] = 
      {
         Weight = 1, 
         Name = "battery", 
         ActionDescription = "", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ShortDescr = "a battery", 
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
         ItemType = "battery", 
         Description = "A battery is lying here.", 
         Cost = 0, 
         Vnum = 10492, 
      }, 
      [10491] = 
      {
         Weight = 1, 
         Name = "staff durastaff", 
         ActionDescription = "", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ShortDescr = "a durastaff", 
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
         ItemType = "staff", 
         Description = "A durastaff is lying here.", 
         Cost = 0, 
         Vnum = 10491, 
      }, 
      [10490] = 
      {
         Weight = 1, 
         Name = "toolkit", 
         ActionDescription = "", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ShortDescr = "a toolkit", 
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
         ItemType = "toolkit", 
         Description = "A toolkit is lying here.", 
         Cost = 0, 
         Vnum = 10490, 
      }, 
      [10489] = 
      {
         Weight = 1, 
         Name = "lens", 
         ActionDescription = "", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ShortDescr = "a small lens", 
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
         ItemType = "lens", 
         Description = "A small lens is lying here.", 
         Cost = 0, 
         Vnum = 10489, 
      }, 
      [10488] = 
      {
         Weight = 1, 
         Name = "ammo cell amunition cartridge", 
         ActionDescription = "", 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         Vnum = 10488, 
         ShortDescr = "an ammunition cell", 
         ExtraDescriptions = 
         {
         }, 
         ObjectValues = 
         {
            [1] = 500, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 500, 
         }, 
         Cost = 10, 
         ItemType = "ammo", 
         Description = "An ammunition cell was carelessly left here.", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Layers = 0, 
      }, 
      [10487] = 
      {
         Weight = 1, 
         Name = "carsanum spice", 
         ActionDescription = "", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ShortDescr = "some poorly refined carsanum", 
         ObjectValues = 
         {
            [1] = 10, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 1, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         ItemType = "spice", 
         Description = "Some carsanum was dropped here.", 
         Cost = 200, 
         Vnum = 10487, 
      }, 
      [10435] = 
      {
         Weight = 1, 
         Name = "prototype spice", 
         ActionDescription = "", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ShortDescr = "a prototype spice", 
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
         ItemType = "spice", 
         Description = "A prototype spice is here.", 
         Cost = 0, 
         Vnum = 10435, 
      }, 
      [10434] = 
      {
         Weight = 1, 
         Name = "prototype disguise", 
         ActionDescription = "", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ShortDescr = "a prototype disguise", 
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
         ItemType = "disguise", 
         Description = "A prototype disguise is here.", 
         Cost = 0, 
         Vnum = 10434, 
      }, 
      [10433] = 
      {
         Weight = 1, 
         Name = "prototype armor", 
         ActionDescription = "", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ShortDescr = "a prototype armor", 
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
         ItemType = "armor", 
         Description = "A prototype armor is here.", 
         Cost = 100, 
         Vnum = 10433, 
      }, 
      [10414] = 
      {
         Weight = 1, 
         Name = "student message terminal", 
         ActionDescription = "", 
         Layers = 0, 
         Vnum = 10414, 
         ShortDescr = "a student message terminal", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "furniture", 
         Description = "A student message terminal is here for you to play with.", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
      }, 
      [10432] = 
      {
         Weight = 1, 
         Name = "prototype container", 
         ActionDescription = "", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ShortDescr = "a prototype container", 
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
         ItemType = "container", 
         Description = "A prototype container is here.", 
         Cost = 100, 
         Vnum = 10432, 
      }, 
      [10431] = 
      {
         Weight = 1, 
         Name = "prototype bowcaster", 
         ActionDescription = "", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         ShortDescr = "prototype bowcaster", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 9, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         ItemType = "weapon", 
         Description = "A proottype bowcaster is here", 
         Cost = 0, 
         Vnum = 10431, 
      }, 
      [10430] = 
      {
         Weight = 1, 
         Name = "prototype comlink", 
         ActionDescription = "", 
         Layers = 0, 
         Vnum = 10430, 
         ShortDescr = "a newly created prototype comlink", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "comlink", 
         Description = "Some god dropped a newly created prototype comlink here.", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
      }, 
      [10429] = 
      {
         Weight = 1, 
         Name = "prototype shield", 
         ActionDescription = "", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [9] = "Shield", 
         }, 
         ShortDescr = "a newly created prototype shield", 
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
         ItemType = "armor", 
         Description = "Some god dropped a newly created prototype shield here.", 
         Cost = 0, 
         Vnum = 10429, 
      }, 
      [10428] = 
      {
         Weight = 1, 
         Name = "prototype light", 
         ActionDescription = "", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ShortDescr = "a newly created prototype light", 
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
         ItemType = "light", 
         Description = "Some god dropped a newly created prototype light here.", 
         Cost = 0, 
         Vnum = 10428, 
      }, 
      [10420] = 
      {
         Weight = 1, 
         Name = "prototype blaster", 
         ActionDescription = "", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         ShortDescr = "prototype blaster", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 6, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         ItemType = "weapon", 
         Description = "A prototype blaster is here", 
         Cost = 0, 
         Vnum = 10420, 
      }, 
      [10421] = 
      {
         Weight = 1, 
         Name = "prototype saber lightsaber", 
         ActionDescription = "", 
         Flags = 
         {
            [4] = "Contraband", 
         }, 
         Vnum = 10421, 
         Cost = 0, 
         ShortDescr = "a prototype lightsaber", 
         ExtraDescriptions = 
         {
         }, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 3, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpechoat $n Your lightsaber ignites with a soft hum and a bright glow.\
mpechoaround $n $n's lightsaber seemingly jumps into $s hand.\
mpechoaround $n &WIt ignites with a hum and a bright glow.\
", 
               Arguments = "100", 
               MudProgType = "use_prog", 
            }, 
         }, 
         ItemType = "weapon", 
         Description = "A prototype lightsaber shouldn't be here", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Layers = 128, 
      }, 
      [10422] = 
      {
         Weight = 1, 
         Name = "prototype vibro-blade", 
         ActionDescription = "", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         ShortDescr = "prototype vibro-blade", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 2, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         ItemType = "weapon", 
         Description = "A prototype vibro-blade shouldn't be here", 
         Cost = 0, 
         Vnum = 10422, 
      }, 
      [10423] = 
      {
         Weight = 1, 
         Name = "key", 
         ActionDescription = "", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ShortDescr = "a key", 
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
         ItemType = "key", 
         Description = "An old fashioned mechanical key was left on the ground here.", 
         Cost = 0, 
         Vnum = 10423, 
      }, 
      [10424] = 
      {
         Weight = 1, 
         Name = "comlink radio communicator", 
         ActionDescription = "", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ShortDescr = "a comlink", 
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
         ItemType = "comlink", 
         Description = "A small hand-held comlink.", 
         Cost = 50, 
         Vnum = 10424, 
      }, 
      [10425] = 
      {
         Weight = 1, 
         Name = "prototype grenade", 
         ActionDescription = "", 
         Layers = 0, 
         Vnum = 10425, 
         ShortDescr = "a newly created prototype grenade", 
         ObjectValues = 
         {
            [1] = 350, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 200, 
         }, 
         ItemType = "grenade", 
         Description = "Some god dropped a newly created prototype grenade here.", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
      }, 
      [10426] = 
      {
         Weight = 1, 
         Name = "generic armor", 
         ActionDescription = "", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Vnum = 10426, 
         ShortDescr = "a newly created generic armor", 
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
         ItemType = "trash", 
         Description = "Some god dropped a newly created generic armor here.", 
         Cost = 0, 
         Layers = 0, 
      }, 
      [10427] = 
      {
         Weight = 1, 
         Name = "protoype landmine", 
         ActionDescription = "", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ShortDescr = "a newly created protoype landmine", 
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
         ItemType = "landmine", 
         Description = "Some god dropped a newly created protoype landmine here.", 
         Cost = 0, 
         Vnum = 10427, 
      }, 
      [10300] = 
      {
         Weight = 2, 
         Name = "bracelet charm academy", 
         ActionDescription = "", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [12] = "Wrist", 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "This is a bracelet that will bring you luck in your travels. It can\
\13be found at the Darkhaven Acamdemy\
\13", 
               Keyword = "bracelet charm", 
            }, 
         }, 
         ShortDescr = "a charm bracelet", 
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpforce $n sac $o\
", 
               Arguments = "100", 
               MudProgType = "drop_prog", 
            }, 
         }, 
         ItemType = "armor", 
         Description = "A charm bracelet from the academy lies here", 
         Affects = 
         {
            [1] = 
            {
               Location = 31, 
               Modifier = 1, 
            }, 
         }, 
         Vnum = 10300, 
      }, 
      [10301] = 
      {
         Weight = 3, 
         Name = "combat boots academy", 
         ActionDescription = "", 
         Layers = 126, 
         WearFlags = 
         {
            [0] = "Take", 
            [6] = "Feet", 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "This boots are so comfortable and light, you feel you can walk a lot\
\13farther. The can be found at the Darkhaven Academy.\
\13", 
               Keyword = "combat boots", 
            }, 
         }, 
         ShortDescr = "a pair of black combat boots", 
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 3, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 3, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpforce $n sac $o\
", 
               Arguments = "100", 
               MudProgType = "drop_prog", 
            }, 
         }, 
         ItemType = "armor", 
         Description = "A pair of black combat boots from the Academy lies here", 
         Affects = 
         {
            [1] = 
            {
               Location = 14, 
               Modifier = 100, 
            }, 
         }, 
         Vnum = 10301, 
      }, 
      [10302] = 
      {
         Weight = 2, 
         Name = "belt leather academy", 
         ActionDescription = "", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [11] = "Waist", 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "This belt is made of a fine leather, braided for strength. You can get\
\13it at the Darkhaven Academy.\
\13", 
               Keyword = "belt leather", 
            }, 
         }, 
         ShortDescr = "a braided leather belt", 
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpforce $n sac $o\
", 
               Arguments = "100", 
               MudProgType = "drop_prog", 
            }, 
         }, 
         ItemType = "armor", 
         Description = "A braided leather belt from the Academy lies here", 
         Affects = 
         {
            [1] = 
            {
               Location = 5, 
               Modifier = 1, 
            }, 
         }, 
         Vnum = 10302, 
      }, 
      [10303] = 
      {
         Weight = 3, 
         Name = "pants trousers slacks leggings", 
         ActionDescription = "", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [5] = "Legs", 
         }, 
         ShortDescr = "some leggings", 
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "These leggings will offer good protection until you can get better. They\
\13can be found at the Darkhaven Academy.\
\13", 
               Keyword = "leggings", 
            }, 
         }, 
         ItemType = "armor", 
         Description = "A pair of academy leggings is here.", 
         Cost = 0, 
         Vnum = 10303, 
      }, 
   }, 
   Resets = 
   {
      [1] = 
      {
         Arg2 = 1, 
         MiscData = 0, 
         Arg1 = 10340, 
         Command = "M", 
         Arg3 = 10303, 
      }, 
      [2] = 
      {
         Arg2 = 1, 
         MiscData = 0, 
         Arg1 = 10394, 
         Command = "M", 
         Arg3 = 10306, 
      }, 
      [3] = 
      {
         Arg2 = 0, 
         MiscData = 0, 
         Arg1 = 10309, 
         Command = "D", 
         Arg3 = 1, 
      }, 
      [4] = 
      {
         Arg2 = 2, 
         MiscData = 0, 
         Arg1 = 10310, 
         Command = "D", 
         Arg3 = 1, 
      }, 
      [5] = 
      {
         Arg2 = 3, 
         MiscData = 0, 
         Arg1 = 10312, 
         Command = "D", 
         Arg3 = 1, 
      }, 
      [6] = 
      {
         Arg2 = 1, 
         MiscData = 0, 
         Arg1 = 10313, 
         Command = "D", 
         Arg3 = 1, 
      }, 
      [7] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 10414, 
         Command = "O", 
         Arg3 = 10430, 
      }, 
      [8] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 10345, 
         Command = "M", 
         Arg3 = 10308, 
      }, 
      [9] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 10360, 
         Command = "M", 
         Arg3 = 10320, 
      }, 
      [10] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 10301, 
         Command = "E", 
         Arg3 = 8, 
      }, 
      [11] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 10302, 
         Command = "E", 
         Arg3 = 13, 
      }, 
      [12] = 
      {
         Arg1 = 10304, 
         Arg2 = 1, 
         Command = "G", 
         MiscData = 1, 
      }, 
      [13] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 10318, 
         Command = "O", 
         Arg3 = 10319, 
      }, 
      [14] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 10342, 
         Command = "M", 
         Arg3 = 10318, 
      }, 
      [15] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 10343, 
         Command = "M", 
         Arg3 = 10323, 
      }, 
      [16] = 
      {
         Arg2 = 0, 
         MiscData = 0, 
         Arg1 = 10323, 
         Command = "D", 
         Arg3 = 2, 
      }, 
      [17] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 10355, 
         Command = "M", 
         Arg3 = 10326, 
      }, 
      [18] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 10315, 
         Command = "O", 
         Arg3 = 10317, 
      }, 
      [19] = 
      {
         Arg2 = 1, 
         MiscData = 0, 
         Arg1 = 10365, 
         Command = "M", 
         Arg3 = 10317, 
      }, 
      [20] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 10395, 
         Command = "M", 
         Arg3 = 10327, 
      }, 
      [21] = 
      {
         Arg2 = 0, 
         MiscData = 0, 
         Arg1 = 10327, 
         Command = "D", 
         Arg3 = 1, 
      }, 
      [22] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 10370, 
         Command = "M", 
         Arg3 = 10321, 
      }, 
      [23] = 
      {
         Arg1 = 10317, 
         Arg2 = 1, 
         Command = "G", 
         MiscData = 1, 
      }, 
      [24] = 
      {
         Arg1 = 10311, 
         Arg2 = 1, 
         Command = "G", 
         MiscData = 1, 
      }, 
      [25] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 10322, 
         Command = "O", 
         Arg3 = 10325, 
      }, 
      [26] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 10321, 
         Command = "O", 
         Arg3 = 10325, 
      }, 
      [27] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 10350, 
         Command = "M", 
         Arg3 = 10324, 
      }, 
      [28] = 
      {
         Arg1 = 10423, 
         Arg2 = 1, 
         Command = "G", 
         MiscData = 1, 
      }, 
      [29] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 10414, 
         Command = "O", 
         Arg3 = 10324, 
      }, 
      [30] = 
      {
         Arg2 = 2, 
         MiscData = 0, 
         Arg1 = 10324, 
         Command = "D", 
         Arg3 = 1, 
      }, 
   }, 
   ResetMessage = "You hear the hum of repulsorlifts powering up in the distance", 
   Rooms = 
   {
      [10304] = 
      {
         Name = "The Reading Room", 
         Flags = 
         {
            [16] = "Silence", 
            [3] = "Indoors", 
         }, 
         Vnum = 10304, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10314, 
               Distance = 0, 
               Description = "A Marble Corridor\
", 
               Direction = "north", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 10301, 
               Distance = 0, 
               Description = "A Stone Corridor\
", 
               Direction = "south", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 10307, 
               Distance = 0, 
               Description = "Wandering the Academy\
", 
               Direction = "west", 
               Keyword = "", 
            }, 
         }, 
         Sector = "inside", 
         Description = "This is a silent room, which means while here you will not see any of the\
channels. In fact, you can only use socials, emotes and group tell here.\
The room was created to give you a quiet place to read our help files. You\
can reduce your own screen scroll by reducing the number of channels  you\
receive. You can get a full list of channels by typing CHAN. You may  turn\
off a channel by typing CHAN -<channel> and reactivate a channel by typing\
CHAN +all. Once you have finished reading, you are ready to test your\
ability to negotiate your way around. Going west will take you into\
another part of the Academy.  The test is to follow all the room\
descriptions until you can find your way back to this point. If you get\
lost at any time, type U to return here.  Once you have successfully\
returned here, please continue to the north to explore further.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [10305] = 
      {
         Name = "Chamber of Trials for Rangers", 
         Flags = 
         {
            [10] = "Safe", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 10305, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
         }, 
         Sector = "inside", 
         Description = "Here you will experience your first full combat against MOBILES, also known\
as MOBS. Mobile is the name used for monsters and the like in the game.\
All exits, except down, lead to a CAGE mob. Some of these cage mobs may be\
aggressive and will attack you upon entering their room. As you kill them, \
you will gain experience, as well as academy equipment and gold. Once you \
have defeated a mob, type GET ALL CORPSE to loot the coins and equipment.\
You may also type CONFIG +AUTOLOOT or CONFIG +AUTOGOLD. Autoloot will take\
everything from the corpse when you kill it. Autogold will take only the\
gold from the corpse. When you loot a corpse of equipment, the items are\
transferred to your inventory. You may suffer injury during the battle, so \
return here and type REST or SLEEP. This will speed your healing process. \
When you are finished healing, type WAKE or STAND to continue.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [10306] = 
      {
         Name = "Abbigayle's Language Lessons", 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Vnum = 10306, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10301, 
               Distance = 0, 
               Description = "A Stone Corridor\
", 
               Direction = "east", 
               Keyword = "", 
            }, 
         }, 
         Sector = "inside", 
         Description = "UNTIL FURTHER NOTICE:  ALL LANGUAGES CAN BE LEARNED FROM THE OLD MAN ON THE\
PLUOGUS. Some information about languages:  Languages are learned\
differently from skills, spells and weapons, as you must be adept at a\
language before you may use it. To learn a language, type LANGUAGE LEARN\
<language type>.   For more information on how to learn a language, type\
HELP LANGUAGES. To learn how to use languages, type HELP SPEAK and HELP\
TONGUE.   It will cost some money each time you wish to increase your\
fluency in a language. Those who are intelligent, wise and lucky will find\
it takes fewer practices to become adept at a language. Wookiees can NEVER\
learn to speak common.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [10307] = 
      {
         Name = "Wandering the Academy", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Vnum = 10307, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "You see a solid oak door.\
\13", 
               Keyword = "Door", 
            }, 
         }, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10304, 
               Distance = 0, 
               Description = "The Reading Room\
", 
               Direction = "east", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 10309, 
               Distance = 0, 
               Description = "Wandering Darkhaven Academy, it looks safe\
", 
               Direction = "west", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 10304, 
               Distance = 0, 
               Description = "Back to the beginning\
", 
               Direction = "up", 
               Keyword = "", 
            }, 
         }, 
         Sector = "inside", 
         Description = "Each player has a menu of items that the game controls automatically once\
it has been configured. To get a list of this menu, type CONFIG. For this\
part of your schooling, it is suggested you type CONFIG +AUTOEXIT. This\
will have the mud show you all obvious exits available to you. When you\
are moving around the game, EXIT is a very important command. When you\
type EXIT, it shows you the room names each exit shown under obvious exits.\
You can use this command to get hints of dangers and death traps that might\
be close by. You may also try to LOOK in adjoining rooms. You do this by\
typing LOOK <direction>. Your next move is to the west, to see what you\
are walking into, try typing EXIT and L W. \
", 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [10308] = 
      {
         Name = "A Dank Pit", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Vnum = 10308, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10316, 
               Distance = 0, 
               Description = "A Dank Pit\
", 
               Direction = "west", 
               Keyword = "", 
            }, 
         }, 
         Sector = "inside", 
         Description = "Here stands a Chadoyn.  He was captured trying to slaughter the students\
of the Academy, and the Immortals decided to spare his life and throw him\
in chains for use as a teaching aid.  With him you can practice attacking\
and fleeing, but hopefully not dying.  You will also want to make use of\
the 'consider' command.  This command compares your level and hitpoints\
to that of the creature.  To use here, type 'con chadoyn'.\
 \
To use the consider command elsewhere, type CON <MOBNAME>.  It is wise to\
ALWAYS consider a mob before fighting it the first time.  This will many\
times save your life, as mobs are often a lot more difficult then they\
outwardly appear.  Be careful and enjoy your fight.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [10309] = 
      {
         Name = "Wandering Coruscant Academy", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Vnum = 10309, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "You see a solid oak door.\
\13", 
               Keyword = "door", 
            }, 
         }, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10310, 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               Description = "An Enclosed Room\
", 
               Direction = "north", 
               Keyword = "door", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 10307, 
               Distance = 0, 
               Description = "Wandering the Academy\
", 
               Direction = "east", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 10311, 
               Distance = 0, 
               Description = "Lost in Darkhaven Academy\
", 
               Direction = "west", 
               Keyword = "", 
            }, 
            [4] = 
            {
               Key = -1, 
               DestinationVnum = 10304, 
               Distance = 0, 
               Description = "Back to the beginning\
", 
               Direction = "up", 
               Keyword = "", 
            }, 
         }, 
         Sector = "inside", 
         Description = "This is where you will start learning about exits not listed under \"Exits\".\
Doors are not seen on the game. You must read room description and LOOK\
<direction> to find them. Another method of finding a door is to \"bump\" into\
the walls. Type N. OUCH! You ran into the door. You want to be careful not\
to be affected with the pass door spell while using the bump method, as you\
may end up in a room you would rather not visit. Now, type OPEN N or OPEN\
DOOR. Next type EXIT, you will now see the north exit listed under \"Exits\".\
Type HELP OPEN to find out more information on doors.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [10310] = 
      {
         Name = "An Enclosed Room", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Vnum = 10310, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10309, 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               Description = "Wandering Darkhaven Academy\
", 
               Direction = "south", 
               Keyword = "door", 
            }, 
         }, 
         Sector = "inside", 
         Description = "You did it! Well done. You will find many rooms such as this all over the\
game. Some are easy to find because of hints in the room descriptions.\
Some are very hard to find, as the clues could be rooms away. However, you\
are now armed with the tools to locate them. You know how to use \"look\", \
bump, and \"exit\". Many classes also get a spell called \"scry\". This spell\
will allow the person affected by it to see the into the adjoining rooms.\
It is used like \"look\", but gives you more detailed information. To see if\
you gain the scry spell at a later level, type SLIST. This will give you a\
list of all spells, skills and weapon types you may practice. Slist also\
gives you information on what level you may practice each, to what percent\
you are currently practiced in each, and what the maximum percent that you\
may practice each.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [10311] = 
      {
         Name = "Lost in Coruscant Academy", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Vnum = 10311, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10312, 
               Distance = 0, 
               Description = "Lost in Darkhaven Academy\
", 
               Direction = "north", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 10309, 
               Distance = 0, 
               Description = "Wandering Darkhaven Academy\
", 
               Direction = "east", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 10304, 
               Distance = 0, 
               Description = "Back to the beginning\
", 
               Direction = "up", 
               Keyword = "", 
            }, 
         }, 
         Sector = "inside", 
         Description = "There are several special exit types that you may encounter in your travels.\
You have experienced open exits and closed doors to this point. There are\
also hidden doors. The hidden door can not be found with the \"bump\" method.\
Often they will not show up with the \"look\" method either. These exits are\
found by reading room descriptions, mobiles descriptions and looking at\
objects. You are looking for words that stand out, those words will be the\
door name. You will also find doors that are locked. You may get past some\
locked doors with the pass door spell, the pick door skill or bash door skill.\
Some doors may only be passed by using the matching key. Other exits you\
may find require you to be skilled in climb or affected by the fly spell.\
All exits are in real directions that can be abbreviated to the following:\
N, E, W, S, NE, NW, SE, SW, U, or D. There are also SOMEWHERE exits that\
use \"leave\", \"climb\", \"enter\", or just a word to use. To the north you\
will experience a hidden exit, use the room description to find the door name.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [10312] = 
      {
         Name = "Lost in Coruscant Academy", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Vnum = 10312, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "Upon closer inspection you realise that this is not even a tapestry, but\
\13a cunningly camouflaged wall! You can see the outline of a door as you\
\13look closer.\
\13", 
               Keyword = "tapestry", 
            }, 
            [2] = 
            {
               Description = "You see a tapestry on the wall here, something just isn't right about it.\
\13", 
               Keyword = "west", 
            }, 
            [3] = 
            {
               Description = "You see a tapestry on the wall.\
\13", 
               Keyword = "w", 
            }, 
            [4] = 
            {
               Description = "You see a cleverly disguised door.\
\13", 
               Keyword = "door", 
            }, 
            [5] = 
            {
               Description = "This globes cast shadows in the corners. The shadows on the west\
\13tapestry almost appears to be an opening.\
\13", 
               Keyword = "Crystal globes", 
            }, 
         }, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10311, 
               Distance = 0, 
               Description = "Lost in Darkhaven Academy\
", 
               Direction = "south", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 10313, 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
                  [3] = "Secret", 
               }, 
               Distance = 0, 
               Description = "door\
", 
               Direction = "west", 
               Keyword = "tapestry door", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 10304, 
               Distance = 0, 
               Description = "Back to the beginning\
", 
               Direction = "up", 
               Keyword = "", 
            }, 
         }, 
         Sector = "inside", 
         Description = "You are standing in a richly decorated room. A large oak table surrounded\
by twelve chairs dominates a large portion of the area. Crystal globes with\
continual light spells cast on them hover about the room, providing a soft\
comfortable light. The walls are adorned with tapestries of the finest\
quality. The tapestry on the west wall draws your attention more so than\
the others. Now, you have many clues on the possible exit. Try to find the\
right word by typing LOOK <word>. For example, try LOOK GLOBES. Sometimes\
looking at other things in the rooms description will lead you to the word\
that will open the exit. \
", 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [10313] = 
      {
         Name = "A Secret Alcove", 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 10313, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "You see an oak door.\
\13", 
               Keyword = "door", 
            }, 
            [2] = 
            {
               Description = "This is a picture of fresh cut flowers in a glass vase. It seems to\
\13be hanging here just to cover a huge crack. That crack is so large, you\
\13can probably squeeze through it! Perhaps you should look closer at the\
\13crack. HINT: type CRACK. \
\13", 
               Keyword = "picture", 
            }, 
            [3] = 
            {
               Description = "This is a huge CRACK, you could probably squeeze through it. \
\13", 
               Keyword = "crack", 
            }, 
            [4] = 
            {
               Description = "This is a picture of fresh cut flowers in a glass vase. It seems to\
\13be hanging here just to cover a huge crack. That crack is so large, you\
\13can probably squeeze through it! Perhaps you should look closer at the\
\13crack. HINT: type CRACK.\
\13", 
               Keyword = "wall", 
            }, 
         }, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10312, 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               Description = "Lost in Darkhaven Academy\
", 
               Direction = "east", 
               Keyword = "door", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 10304, 
               Distance = 0, 
               Description = "Back to the beginning\
", 
               Direction = "up", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 10302, 
               Flags = 
               {
                  [19] = "Auto", 
                  [11] = "Hidden", 
               }, 
               Distance = 0, 
               Description = "", 
               Direction = "somewhere", 
               Keyword = "crack", 
            }, 
         }, 
         Sector = "inside", 
         Description = "Well Done! You have found this secret room. Sometimes these secret rooms\
will contain valuable items or will lead to other parts of the area you\
are exploring. Always pay close attention to room descriptions, mobiles\
descriptions and items, this will many times bring profitable results.\
This is a where you will experience a Somewhere exit. To find your way\
out, try looking at the picture on the wall. If you can not figure it out, \
you may leave by the up exit. Good luck!\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [10314] = 
      {
         Name = "A Marble Corridor", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Vnum = 10314, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10315, 
               Distance = 0, 
               Description = "Preparing for combat\
", 
               Direction = "north", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 10304, 
               Distance = 0, 
               Description = "The Reading Room\
", 
               Direction = "south", 
               Keyword = "", 
            }, 
         }, 
         Sector = "inside", 
         Description = "This room will teach you several commands to check your statistics and \
character health. These commands are SCORE, EQUIPMENT, INVENTORY, and\
LEVEL. Score is used by typing SC, it tells you all the basic statistics\
about your character. Equipment is used by typing EQ, this shows you all \
the items you are currently wearing. Inventory is used by typing I, and \
shows you all items you are carrying other than your worn equipment.\
Level is used by typing LEVEL, it show your current level, your current\
experience points, and the experience needed for the next few levels.\
Use the help menu to get more information on the topics covered here,\
type HELP <subject>.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [10315] = 
      {
         Name = "Preparing for combat", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Vnum = 10315, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10317, 
               Distance = 0, 
               Description = "", 
               Direction = "north", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 10314, 
               Distance = 0, 
               Description = "A Marble Corridor\
", 
               Direction = "south", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 10316, 
               Distance = 0, 
               Description = "A Dank Pit\
", 
               Direction = "down", 
               Keyword = "", 
            }, 
         }, 
         Sector = "inside", 
         Description = "The time is drawing near to experience combat.  Directly below you  is the\
Chadoyn Pit, the home of a creature which will assist you in learning how\
to initiate combat. The Chadoyn is not aggressive, which means you must\
begin the fight.  There are many ways to do so.  The quickest is KILL\
<mob>. As you gain skills and spells, you may find many of them are also\
capable of initiating combat.  Some of the more popular spells that do so\
are:  DISPEL FORCE, SLEEP, DOMINATE, WEAKEN and BLINDNESS. Some of the\
most popular skills used are STEAL and BACKSTAB.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [10316] = 
      {
         Name = "A Dank Pit", 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 10316, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10308, 
               Distance = 0, 
               Description = "A Dank Pit\
", 
               Direction = "east", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 10315, 
               Distance = 0, 
               Description = "Preparing for combat\
", 
               Direction = "up", 
               Keyword = "", 
            }, 
         }, 
         Sector = "inside", 
         Description = "This room explains about WIMPY, FLEE, and RECALL as a way to leave from\
combat. Wimpy is an automatic withdrawal from a fight when your hitpoints\
reach a set minimum. To set your wimpy, type WIMPY or WIMPY <number>. The\
number being the amount of hitpoints you want remaining when you leave the\
battle. You will lose experience for wimpying out of a fight, but the\
amount of experience lost will generally be less then the amount lost from\
death. You may also manually withdraw from a fight with flee. To use flee,\
just type FLEE. You may flee out of the fight at any amount of hitpoints.\
Fleeing will cost you loss of experience. \
", 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [10317] = 
      {
         Name = "Time To Take A Break", 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Vnum = 10317, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10327, 
               Distance = 0, 
               Description = "", 
               Direction = "north", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 10315, 
               Distance = 0, 
               Description = "", 
               Direction = "south", 
               Keyword = "", 
            }, 
         }, 
         Sector = "city", 
         Description = "After a long fight or even a long walk you character may need to rest. The\
safest way to do this is to type REST. You may also SLEEP but only do that\
in safe places as you will be more open to being attacked or robbed when\
you are sleeping. When you are done sleeping type WAKE, and when you are\
done resting type STAND.   You may find that occasionally your character\
begins to get hungry or thirsty as you travel around in Star Wars Reality.\
The droid in this room will give you food or a canteen if you ask it\
nicely. To use them type EAT <whatever> or DRINK <whatever>. If you are\
really hungry you might have to do this twice. There is also a fountain\
here you may drink out of or use to fill your canteen. (try: fill canteen\
fountain)\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [10318] = 
      {
         Name = "A Useless Item?", 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Vnum = 10318, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10322, 
               Distance = 0, 
               Description = "", 
               Direction = "up", 
               Keyword = "", 
            }, 
         }, 
         Sector = "city", 
         Description = "Sometimes an item may appear useless at first.  There are many junk items\
that are just that, junk.  But some items can come in handy.  Try making\
small talk with this student. HE seems to have found something that might\
prove useful to you.  Sometimes one item may be found inside another.  To\
look in to an object that is a container use :  LOOK IN <container>.  To\
get an item from a container, use :  GET <item> FROM <container> as well. \
                          Hint:  say hello. \
", 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [10319] = 
      {
         Name = "Up in a Small Loft", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Vnum = 10319, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10322, 
               Distance = 0, 
               Description = "", 
               Direction = "down", 
               Keyword = "", 
            }, 
         }, 
         Sector = "city", 
         Description = "Sometimes items can be obtained by manipulating other items. Some classes\
can make items from other ones using skills such as MAKEBLASTER, MAKESPICE,\
or MAKELIGHTSABER. Other times it is as simple as opening a box or pushing\
a button as is the case in this room.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [10320] = 
      {
         Name = "Looting Your Kills", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Vnum = 10320, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10322, 
               Distance = 0, 
               Description = "", 
               Direction = "west", 
               Keyword = "", 
            }, 
         }, 
         Sector = "city", 
         Description = "The most common way in most muds to gain equipment is by looting the\
corpses of dead mobiles(monsters etc). After you kill this droid use\
EXAMINE CORPSE to see what it was carrying. Then use GET ALL FROM CORPSE\
to get the goodies from it. To automaticly loot corpses when you kill\
something you can set CONFIG +AUTOLOOT or CONFIG +AUTOCRED for just\
credits.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [10321] = 
      {
         Name = "Academy Store", 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Vnum = 10321, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10322, 
               Distance = 0, 
               Description = "", 
               Direction = "east", 
               Keyword = "", 
            }, 
         }, 
         Sector = "city", 
         Description = "Shops are a great way of aquiring equipment and getting rid of extras.\
To get a list of what a shopkeeper is selling type LIST. To buy an item\
type BUY <objectname>. If you have extra equipment or have found something\
that you want to sell type SELL <object>. To find out how much a shopkeeper\
will buy something for type VALUE <object>.\
 \
One of the more useful items in this shop is the backpack. Once you have\
bought one you can put any extra items you have in it for safe keeping.\
You may also wear it. If you don't have enough credits to buy anything try\
getting some from the droid a couple of rooms to the east.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [10322] = 
      {
         Name = "Getting More Useful Items", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Vnum = 10322, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10323, 
               Distance = 0, 
               Description = "", 
               Direction = "north", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 10320, 
               Distance = 0, 
               Description = "", 
               Direction = "east", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 10327, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               Description = "", 
               Direction = "south", 
               Keyword = "", 
            }, 
            [4] = 
            {
               Key = -1, 
               DestinationVnum = 10321, 
               Distance = 0, 
               Description = "", 
               Direction = "west", 
               Keyword = "", 
            }, 
            [5] = 
            {
               Key = -1, 
               DestinationVnum = 10319, 
               Distance = 0, 
               Description = "", 
               Direction = "up", 
               Keyword = "", 
            }, 
            [6] = 
            {
               Key = -1, 
               DestinationVnum = 10318, 
               Distance = 0, 
               Description = "", 
               Direction = "down", 
               Keyword = "", 
            }, 
         }, 
         Sector = "city", 
         Description = "One of the major goals you will have playing the mud, is finding better\
equipment to make your character's life safer and easier.  There are\
several ways of doing this. Two that you need to remember but won't yet be\
able to do, until you learn the skills, are SEARCHing and DIGging. \
STEALing is also a way to get items but only criminal characters who\
practice steal are able to do this. (Be warned: Even if you are not a\
criminal, this is a good way to lose eq.)   The rooms to the east and\
west, as well as the ones up and down from here, exhibit different ways of\
getting items. After exploring these four rooms and getting everything you\
need, you may move on to the next room to the north.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [10323] = 
      {
         Name = "The Last Challenge", 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Vnum = 10323, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Key = 10423, 
               DestinationVnum = 10324, 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               Description = "", 
               Direction = "north", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 10322, 
               Distance = 0, 
               Description = "", 
               Direction = "south", 
               Keyword = "", 
            }, 
         }, 
         Sector = "city", 
         Description = "Congratulations, you're almost done. The graduation hall is just to the\
north. Only one problem though. The door's locked. Maybe this kid knows\
where the key is. If only he'd stop crying long enough for you to ask.\
hint: find his doll\
hint: give doll child\
hint: say where's the key\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [10324] = 
      {
         Name = "Graduating from the Academy", 
         Flags = 
         {
            [10] = "Safe", 
         }, 
         Vnum = 10324, 
         TeleVnum = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10323, 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
                  [5] = "PickProof", 
               }, 
               Distance = 0, 
               Description = "", 
               Direction = "south", 
               Keyword = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "if isimmort($n)\
mpechoat $n dumbass! trans yourself!\
else\
mptransfer $n 10325\
endif\
", 
               Arguments = "iamauthed", 
               MudProgType = "speech_prog", 
            }, 
         }, 
         Sector = "city", 
         Description = "Congratulations you did it... line up and get your diploma.   You are in a\
long wide hallway. The floor is covered in a plush red carpet. The walls\
are made of a tansparent duraplast and come together to form a dome over\
your head. Looking out the window you notice that the hallway is in fact a\
catwalk connecting the academy to a small landing platform at the end. You\
can't look much more than 20 or 30 levels into the city depths below, as\
many walkways criss-cross between the buildings, obscuring your view of\
the lower levels. Looking up you see several cloudcars slowly navigating\
Coruscant's many skyscrapers. A stairway at the end of the hall slopes up\
towards the docking bay. It is the only exit other than the door behind\
you, back into the academy. \
 \
&RSay 'iamauthed' and you will be authorized.&R&W\
PLEASE LOOK AT THE ROOM ONCE YOU HAVE SAID 'IAMAUTHED'!\
 \
When the schoolmaster shakes your hand, you are authed.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [10325] = 
      {
         Name = "Academy Docking Bay", 
         Vnum = 10325, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10326, 
               Flags = 
               {
                  [17] = "CanEnter", 
                  [11] = "Hidden", 
               }, 
               Distance = 0, 
               Description = "", 
               Direction = "somewhere", 
               Keyword = "", 
            }, 
         }, 
         Sector = "city", 
         Description = "Detached from the rest of the Academy to leave room for ships to manuever,\
this docking bay is large enough to hold four or five shuttles. The space\
above is clear and you can see the clouds above you. Anyone launching\
a shuttle from here would have to fly straight though as several larger\
buildings box in the sides of the docking bay no less 30 feet out on each\
side. The noise of the city is blends together forming a loud pulsing hum\
pushing in from all directions. There is a slight and very rare breeze\
blowing down beetween the buildings and across the pad. It is an odd\
feeling in such a boxed in environment.\
 \
There is a small shuttle here waiting to take you home. To board it type\
ENTER.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [10326] = 
      {
         Name = "The Shuttle home", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Vnum = 10326, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10325, 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [11] = "Hidden", 
               }, 
               Distance = 0, 
               Description = "", 
               Direction = "somewhere", 
               Keyword = "", 
            }, 
         }, 
         Sector = "city", 
         Description = "You are in a small single compartment shuttle. The passenger seats are\
directly behind the pilots chair and slightly raised to give you a\
nice view for your journey. The seats recline back into a sleeping\
position in case you get tired. A small pantry and a restroom are at\
the back of the cabin.   The purpose of this shuttle is to take the\
newly graduated students home. Its a bit of a luxury compared to the\
rest of your stay at the academy. It must be as much for apearances\
as it is to honor the graduates. You will need to give your diploma\
to the driver before he will launch... Wouldn't want to spend this\
much money on drop outs. If you don't have a diploma yet type LEAVE,\
and then go look for the schoolmaster. \
", 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [10327] = 
      {
         Name = "Some Important Words of Advice", 
         Flags = 
         {
            [30] = "Prototype", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 10327, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10322, 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               Description = "", 
               Direction = "north", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 10317, 
               Distance = 0, 
               Description = "", 
               Direction = "south", 
               Keyword = "", 
            }, 
         }, 
         Sector = "city", 
         Description = "A very important thing to learn about early is cloning. Death is permanent.\
When you die you loose everything. However... somewhere deep in the core\
worlds is a place that creates and stores the clones of those who are\
willing to pay a small fee. Having a clone makes a back up of your\
character at the moment of cloning that can be used in the event of an\
untimely death. My advice is to find the cloning facilities as soon as\
possible and make a new clone at least every five levels. Death is a lot\
less painful when you loose 5 levels as opposed to having to start over\
from the beginning.   To exit, open the door north of you by using the\
command open north. This can be used any place doors are located. Simply\
use 'open' and then the direction. \
", 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [10399] = 
      {
         Name = "This Room is used by a Mob program do not delete.", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Vnum = 10399, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
         }, 
         Sector = "city", 
         Description = "", 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [10400] = 
      {
         Name = "A test workshop", 
         Flags = 
         {
            [2] = "NoMob", 
            [26] = "Factory", 
         }, 
         Vnum = 10400, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
         }, 
         Sector = "city", 
         Description = "", 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [10401] = 
      {
         Name = "a quiet place", 
         Flags = 
         {
            [16] = "Silence", 
            [10] = "Safe", 
            [2] = "NoMob", 
         }, 
         Vnum = 10401, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
         }, 
         Sector = "city", 
         Description = "", 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [10340] = 
      {
         Name = "Floating in a void", 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 10340, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
         }, 
         Sector = "city", 
         Description = "", 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [10342] = 
      {
         Name = "Floating in a void", 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 10342, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
         }, 
         Sector = "city", 
         Description = "", 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [10430] = 
      {
         Name = "Student Lounge", 
         Flags = 
         {
            [2] = "NoMob", 
            [10] = "Safe", 
         }, 
         Vnum = 10430, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10300, 
               Distance = 0, 
               Description = "", 
               Direction = "east", 
               Keyword = "", 
            }, 
         }, 
         Sector = "inside", 
         Description = "You stand in the player lounge.  It is the last safe zone in the galaxy.  \
Relax and have a cool drink, as this will be the last time you can let\
your guard down and not be marked for death.\
 \
A student message terminal is here for you to practice reading and writing\
messages.  Use NOTE LIST to get a list of the messages, and NOTE READ\
<message number> to read a specific message.\
Type HELP NOTE for more commands.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [10429] = 
      {
         Name = "Floating in a void", 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 10429, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
         }, 
         Sector = "city", 
         Description = "", 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [10300] = 
      {
         Name = "Coruscant Academy", 
         Flags = 
         {
            [23] = "Hotel", 
            [10] = "Safe", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 10300, 
         TeleVnum = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10301, 
               Distance = 0, 
               Description = "", 
               Direction = "north", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 10430, 
               Distance = 0, 
               Description = "", 
               Direction = "west", 
               Keyword = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpat 122 mpecho $n has just begun life!\
mpat 101 mpecho $n has just entered the game.\
", 
               Arguments = "entered", 
               MudProgType = "act_prog", 
            }, 
            [2] = 
            {
               Code = "mpat 122 mpecho $n just slit his own throat at the creations room!\
mpat 101 mpecho $n just sucicided at the creations room.\
", 
               Arguments = "throat", 
               MudProgType = "act_prog", 
            }, 
         }, 
         Sector = "inside", 
         Description = "You stand inside the Coruscant Academy, an establishment designed to teach\
the basics of survival within the galaxy. Each room has a specific purpose\
and contains information on the various commands available to you for\
maneuvering around and interacting with other players. We recommend you\
explore the Academy in full, taking the time to read the instructions in\
each room. Check out the bulletin board to the west by typing w.  Then\
come back and explore the rest of the Academy to the north. There is no\
need to ask for authorization. You will be authorized as you leave the\
academy.\
&C\
HOWEVER:  Bios and descriptions are required for anyone over the level of\
newbie.  Type help bio and help desc for further information on creating\
these important documents.\
 \
&RMake sure you have an acceptable name, or you are just wasting your time,\
we -will- have you recreate if you have a bad name.&R&W\
\
Names such as Nathan, Jeff, George, or any other RL name of the like are\
no longer acceptable on this mud. Don't use them.\
 \
&RHere is a good website on naming conventions:&R&W\
http://themudjournal.com/rp/ABCs-A.html\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [10301] = 
      {
         Name = "A Duraplast Corridor", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Vnum = 10301, 
         TeleVnum = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10304, 
               Distance = 0, 
               Description = "Reading Room\
", 
               Direction = "north", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               DestinationVnum = 10303, 
               Distance = 0, 
               Description = "The Laboratory of Skills.\
", 
               Direction = "east", 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               DestinationVnum = 10300, 
               Distance = 0, 
               Description = "Entrance to Darkhaven Academy\
", 
               Direction = "south", 
               Keyword = "", 
            }, 
            [4] = 
            {
               Key = -1, 
               DestinationVnum = 10306, 
               Distance = 0, 
               Description = "Abbigayle's Language Lessons.\
", 
               Direction = "west", 
               Keyword = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "if isimmort($n)\
else\
  mpforce $n vis\
endif\
", 
               Arguments = "100", 
               MudProgType = "leave_prog", 
            }, 
         }, 
         Sector = "inside", 
         Description = "To the west is Lady Abbigayle's room, and to the east is Domick.  Lady\
Abbigayle has information about languages, and Domick has information on\
practicing weapons and skills. When you are finished exploring these\
areas, come back here and continue north through the Academy.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [10302] = 
      {
         Name = "Somewhere", 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 10302, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10304, 
               Distance = 0, 
               Description = "The Reading Room\
", 
               Direction = "north", 
               Keyword = "", 
            }, 
         }, 
         Sector = "inside", 
         Description = "You did it! You are an excellent student! To continue your education,\
please leave north. That will return you to the Reading room.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
      [10303] = 
      {
         Name = "The Laboratory of Skills", 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Vnum = 10303, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               DestinationVnum = 10301, 
               Distance = 0, 
               Description = "A Stone Corridor\
", 
               Direction = "west", 
               Keyword = "", 
            }, 
         }, 
         Sector = "inside", 
         Description = "This is where you will practice your arsenal of weapons and skills. Type\
PRACTICE to get a list of these currently available to you.  Everyone will\
have sections listing skills, weapons, and languages. You will also have\
an additional section for force powers. Force skills, including meditate,\
are taught elsewhere in the game. When training, there are some things you\
should know: When practicing a skill, one practice will earn you between\
15% and 20% proficiency. The amount is determined by the amount of wisdom\
you have. Additional knowledge is gained through usage of the skill/weapon\
until adepted. To see information about a specific skill or weapon, type\
HELP <skill or weapon style>.  For general questions on practicing, type\
HELP PRACTICE.\
", 
         TeleDelay = 0, 
         Tunnel = 0, 
      }, 
   }, 
   LowEconomy = 496056230, 
   Author = "Scarab/Durga", 
   Name = "Coruscant Academy", 
   Filename = "newacad.lua", 
}
