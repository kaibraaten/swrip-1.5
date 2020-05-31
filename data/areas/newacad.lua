-- Coruscant Academy
-- Last saved Sunday 31-May-2020 15:51:33

AreaEntry
{
   Mobiles = 
   {
      [10370] = 
      {
         ShortDescr = "a shopkeeper", 
         Level = 20, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [26] = "Droid", 
         }, 
         Shop = 
         {
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            ProfitSell = 90, 
            KeeperShortDescr = "a shopkeeper", 
            ProfitBuy = 120, 
         }, 
         Sex = "undistinguished", 
         Description = "", 
         DamRoll = 2, 
         HitRoll = 2, 
         Credits = 100, 
         AffectedBy = 
         {
            [3] = "DetectInvis", 
         }, 
         Weight = 0, 
         SaveVs = 
         {
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Vnum = 10370, 
         Stats = 
         {
            Force = 0, 
            Wisdom = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Constitution = 0, 
            Luck = 0, 
            Dexterity = 0, 
         }, 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitSizeDice = 20, 
            HitPlus = 2, 
            HitNoDice = 2, 
         }, 
         ArmorClass = 80, 
         Immune = 
         {
            [20] = "magic", 
            [11] = "charm", 
         }, 
         Height = 0, 
         Languages = 
         {
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
         }, 
         NumberOfAttacks = 0, 
         Race = "Human", 
         Alignment = 0, 
         Name = "shopkeeper droid", 
         LongDescr = "A droid is here selling useful items to students.\
", 
         Position = "standing", 
         Damage = 
         {
            DamSizeDice = 10, 
            DamNoDice = 2, 
            DamPlus = 10, 
         }, 
      }, 
      [10355] = 
      {
         ShortDescr = "a pilot", 
         Level = 1, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Sex = "undistinguished", 
         Description = "", 
         DamRoll = 0, 
         HitRoll = 0, 
         Credits = 0, 
         Weight = 0, 
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
         SpecFuns = 
         {
            [0] = "spec_newbie_pilot", 
         }, 
         Vnum = 10355, 
         SaveVs = 
         {
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         ArmorClass = 0, 
         Stats = 
         {
            Force = 0, 
            Wisdom = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Constitution = 0, 
            Luck = 0, 
            Dexterity = 0, 
         }, 
         Height = 0, 
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
         NumberOfAttacks = 0, 
         LongDescr = "A Mon Calamarian pilot is here ferrying academy graduates.\
", 
         Alignment = 0, 
         Name = "pilot", 
         Race = "Human", 
         Position = "standing", 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
      }, 
      [10340] = 
      {
         ShortDescr = "Domick", 
         Level = 1, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [10] = "Practice", 
            [30] = "Prototype", 
         }, 
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
         Sex = "male", 
         Description = "Domick carries himself with a grace and confidence born from his\
long life and many experiences in these Realms. He is looked on\
with awe and unquestioned respect. That respect is well deserved.\
Do not attempt to kill him, for you shall surely die.\
", 
         DamRoll = 0, 
         HitRoll = 0, 
         Credits = 100, 
         AffectedBy = 
         {
            [7] = "Sanctuary", 
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         Weight = 0, 
         SaveVs = 
         {
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Vnum = 10340, 
         Stats = 
         {
            Force = 0, 
            Wisdom = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Constitution = 0, 
            Luck = 0, 
            Dexterity = 0, 
         }, 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 1000, 
            HitNoDice = 1, 
         }, 
         ArmorClass = 94, 
         Immune = 
         {
            [20] = "magic", 
            [13] = "nonmagic", 
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         Height = 0, 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
               [17] = "jawaese", 
            }, 
            Speaks = 
            {
               [17] = "jawaese", 
            }, 
         }, 
         NumberOfAttacks = 0, 
         Race = "Human", 
         Alignment = 1000, 
         Name = "Domick Dom teacher", 
         LongDescr = "Domick, Lord of Knowledge, sits here reading, waiting for students.\
", 
         Position = "standing", 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
      }, 
      [10342] = 
      {
         ShortDescr = "a student", 
         Level = 1, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         Sex = "undistinguished", 
         Description = "", 
         DamRoll = 0, 
         HitRoll = 0, 
         Credits = 0, 
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
         Weight = 0, 
         Vnum = 10342, 
         SaveVs = 
         {
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         ArmorClass = 0, 
         Stats = 
         {
            Force = 0, 
            Wisdom = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Constitution = 0, 
            Luck = 0, 
            Dexterity = 0, 
         }, 
         Height = 0, 
         Languages = 
         {
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
         }, 
         NumberOfAttacks = 0, 
         LongDescr = "An acadamy student is here taking a break from his studies.\
", 
         Alignment = 0, 
         Name = "academy student", 
         Race = "Human", 
         Position = "standing", 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
      }, 
      [10343] = 
      {
         ShortDescr = "a small child", 
         Level = 1, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         Sex = "male", 
         Description = "", 
         DamRoll = 0, 
         HitRoll = 0, 
         Credits = 0, 
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
         Weight = 0, 
         Vnum = 10343, 
         SaveVs = 
         {
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         ArmorClass = 0, 
         Stats = 
         {
            Force = 0, 
            Wisdom = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Constitution = 0, 
            Luck = 0, 
            Dexterity = 0, 
         }, 
         Height = 0, 
         Languages = 
         {
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
         }, 
         NumberOfAttacks = 0, 
         LongDescr = "A young child is sitting here.\
", 
         Alignment = 0, 
         Name = "kid child", 
         Race = "Human", 
         Position = "standing", 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
      }, 
      [10360] = 
      {
         ShortDescr = "a practice droid", 
         Level = 1, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [26] = "Droid", 
         }, 
         Sex = "undistinguished", 
         Description = "", 
         DamRoll = 0, 
         HitRoll = 0, 
         Credits = 10, 
         Weight = 0, 
         Vnum = 10360, 
         SaveVs = 
         {
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitSizeDice = 4, 
            HitPlus = 5, 
            HitNoDice = 1, 
         }, 
         ArmorClass = 100, 
         Stats = 
         {
            Force = 0, 
            Wisdom = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Constitution = 0, 
            Luck = 0, 
            Dexterity = 0, 
         }, 
         Height = 0, 
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
         NumberOfAttacks = 0, 
         LongDescr = "A practice droid is here waiting for combat.\
", 
         Alignment = 0, 
         Name = "practice droid", 
         Race = "Human", 
         Position = "standing", 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
      }, 
      [10345] = 
      {
         ShortDescr = "the chadoyn", 
         Level = 2, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Sex = "undistinguished", 
         Description = "He looks back at you with his beady little eyes and a snarl on his face.\
You are pretty sure you can best him in regards to combat.\
", 
         DamRoll = 0, 
         HitRoll = 0, 
         Credits = 0, 
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
         Weight = 0, 
         SaveVs = 
         {
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Vnum = 10345, 
         Stats = 
         {
            Force = 0, 
            Wisdom = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Constitution = 0, 
            Luck = 0, 
            Dexterity = 0, 
         }, 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitSizeDice = 4, 
            HitPlus = 1, 
            HitNoDice = 2, 
         }, 
         ArmorClass = 25, 
         Immune = 
         {
            [11] = "charm", 
         }, 
         Height = 0, 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
               [17] = "jawaese", 
            }, 
            Speaks = 
            {
               [17] = "jawaese", 
            }, 
         }, 
         NumberOfAttacks = 0, 
         LongDescr = "The chadoyn is straining its leash, attempting to attack you.\
", 
         Alignment = 0, 
         Name = "chadoyn cage", 
         Race = "_85", 
         Position = "standing", 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
      }, 
      [10394] = 
      {
         ShortDescr = "abbigayle", 
         Level = 5, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [20] = "Scholar", 
         }, 
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
         Sex = "female", 
         Description = "This has to be one of the most beautiful women in these Realms, both inside\
and out. Her eyes have a sparkle of amusement and her face an easy smile.\
She knows you are admiring her, and she does not seem to mind. She is\
comfortable and confident that the picture she makes is breath taking. Her\
voice at last breaks the spell. Her voice is like satin, you can hardly\
wait for your lessons to begin. Any reason to hear her speak the tongues\
foreign to your ears.\
", 
         DamRoll = 0, 
         HitRoll = 0, 
         Credits = 50, 
         AffectedBy = 
         {
            [7] = "Sanctuary", 
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         Weight = 0, 
         SaveVs = 
         {
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Vnum = 10394, 
         Stats = 
         {
            Force = 0, 
            Wisdom = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Constitution = 0, 
            Luck = 0, 
            Dexterity = 0, 
         }, 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 0, 
            HitNoDice = 1000, 
         }, 
         ArmorClass = 5, 
         Immune = 
         {
            [20] = "magic", 
            [13] = "nonmagic", 
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         Height = 0, 
         Languages = 
         {
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
         }, 
         NumberOfAttacks = 0, 
         Race = "Human", 
         Alignment = 0, 
         Name = "Abbigayle language teacher", 
         LongDescr = "A beautiful lady stands here, waiting for her students.\
", 
         Position = "standing", 
         Damage = 
         {
            DamSizeDice = 6, 
            DamNoDice = 1, 
            DamPlus = 3, 
         }, 
      }, 
      [10395] = 
      {
         ShortDescr = "a sad student", 
         Level = 1, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         Sex = "undistinguished", 
         Description = "", 
         DamRoll = 0, 
         HitRoll = 0, 
         Credits = 0, 
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
         Weight = 0, 
         Vnum = 10395, 
         SaveVs = 
         {
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         ArmorClass = 0, 
         Stats = 
         {
            Force = 0, 
            Wisdom = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Constitution = 0, 
            Luck = 0, 
            Dexterity = 0, 
         }, 
         Height = 0, 
         Languages = 
         {
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
         }, 
         NumberOfAttacks = 0, 
         LongDescr = "A sad student leans against the wall.\
", 
         Alignment = 0, 
         Name = "sad student", 
         Race = "Human", 
         Position = "standing", 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
      }, 
      [10365] = 
      {
         ShortDescr = "a service droid", 
         Level = 10, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [26] = "Droid", 
         }, 
         Sex = "undistinguished", 
         Description = "", 
         DamRoll = 0, 
         HitRoll = 0, 
         Credits = 0, 
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
         Weight = 0, 
         Vnum = 10365, 
         SaveVs = 
         {
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 100, 
            HitNoDice = 10, 
         }, 
         ArmorClass = 0, 
         Stats = 
         {
            Force = 0, 
            Wisdom = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Constitution = 0, 
            Luck = 0, 
            Dexterity = 0, 
         }, 
         Height = 0, 
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
         NumberOfAttacks = 0, 
         LongDescr = "A service droid is here handing out canteens and rations.\
", 
         Alignment = 0, 
         Name = "service droid", 
         Race = "Human", 
         Position = "standing", 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 25, 
         }, 
      }, 
      [10350] = 
      {
         ShortDescr = "the Schoolmaster", 
         Level = 1, 
         SaveVs = 
         {
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
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
         Sex = "male", 
         Description = "Domick carries himself with a grace and confidence born from his\
long life and many experiences in these Realms. He is looked on\
with awe and unquestioned respect. That respect is well deserved.\
Do not attempt to kill him, for you shall surely die.\
", 
         DamRoll = 0, 
         HitRoll = 0, 
         Credits = 100, 
         AffectedBy = 
         {
            [7] = "Sanctuary", 
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         Weight = 0, 
         SpecFuns = 
         {
            [0] = "spec_auth", 
         }, 
         Vnum = 10350, 
         Stats = 
         {
            Force = 0, 
            Wisdom = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Constitution = 0, 
            Luck = 0, 
            Dexterity = 0, 
         }, 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitSizeDice = 1, 
            HitPlus = 1000, 
            HitNoDice = 1, 
         }, 
         ArmorClass = 94, 
         Immune = 
         {
            [20] = "magic", 
            [13] = "nonmagic", 
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         Height = 0, 
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
         NumberOfAttacks = 0, 
         Race = "Human", 
         Alignment = 1000, 
         Name = "professor schoolmaster teacher headmaster", 
         LongDescr = "The schoolmaster is here offering diplomas to academy graduates.\
", 
         Position = "standing", 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
      }, 
      [10499] = 
      {
         ShortDescr = "a newly created final mob", 
         Level = 1, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Sex = "undistinguished", 
         Description = "", 
         DamRoll = 0, 
         HitRoll = 0, 
         Credits = 0, 
         Weight = 0, 
         Vnum = 10499, 
         SaveVs = 
         {
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
         }, 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         ArmorClass = 0, 
         Stats = 
         {
            Force = 0, 
            Wisdom = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Charisma = 0, 
            Constitution = 0, 
            Luck = 0, 
            Dexterity = 0, 
         }, 
         Height = 0, 
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
         NumberOfAttacks = 0, 
         LongDescr = "Some god abandoned a newly created final mob here.\
", 
         Alignment = 0, 
         Name = "final mob", 
         Race = "Human", 
         Position = "standing", 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
      }, 
   }, 
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
   Author = "Scarab/Durga", 
   Rooms = 
   {
      [10304] = 
      {
         TeleDelay = 0, 
         Vnum = 10304, 
         TeleVnum = 0, 
         Flags = 
         {
            [16] = "Silence", 
            [3] = "Indoors", 
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
         Tunnel = 0, 
         Name = "The Reading Room", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 10314, 
               Distance = 0, 
               Keyword = "", 
               Description = "A Marble Corridor\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 10301, 
               Distance = 0, 
               Keyword = "", 
               Description = "A Stone Corridor\
", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 10307, 
               Distance = 0, 
               Keyword = "", 
               Description = "Wandering the Academy\
", 
            }, 
         }, 
      }, 
      [10305] = 
      {
         TeleDelay = 0, 
         Vnum = 10305, 
         TeleVnum = 0, 
         Flags = 
         {
            [10] = "Safe", 
            [2] = "NoMob", 
            [3] = "Indoors", 
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
         Tunnel = 0, 
         Name = "Chamber of Trials for Rangers", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
         }, 
      }, 
      [10306] = 
      {
         TeleDelay = 0, 
         Vnum = 10306, 
         TeleVnum = 0, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
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
         Tunnel = 0, 
         Name = "Abbigayle's Language Lessons", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 10301, 
               Distance = 0, 
               Keyword = "", 
               Description = "A Stone Corridor\
", 
            }, 
         }, 
      }, 
      [10307] = 
      {
         TeleDelay = 0, 
         Vnum = 10307, 
         TeleVnum = 0, 
         Flags = 
         {
            [3] = "Indoors", 
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
         Tunnel = 0, 
         Name = "Wandering the Academy", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "Door", 
               Description = "You see a solid oak door.\
\13", 
            }, 
         }, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 10304, 
               Distance = 0, 
               Keyword = "", 
               Description = "The Reading Room\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 10309, 
               Distance = 0, 
               Keyword = "", 
               Description = "Wandering Darkhaven Academy, it looks safe\
", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 10304, 
               Distance = 0, 
               Keyword = "", 
               Description = "Back to the beginning\
", 
            }, 
         }, 
      }, 
      [10308] = 
      {
         TeleDelay = 0, 
         Vnum = 10308, 
         TeleVnum = 0, 
         Flags = 
         {
            [3] = "Indoors", 
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
         Tunnel = 0, 
         Name = "A Dank Pit", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 10316, 
               Distance = 0, 
               Keyword = "", 
               Description = "A Dank Pit\
", 
            }, 
         }, 
      }, 
      [10309] = 
      {
         TeleDelay = 0, 
         Vnum = 10309, 
         TeleVnum = 0, 
         Flags = 
         {
            [3] = "Indoors", 
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
         Tunnel = 0, 
         Name = "Wandering Coruscant Academy", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "door", 
               Description = "You see a solid oak door.\
\13", 
            }, 
         }, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 10310, 
               Distance = 0, 
               Description = "An Enclosed Room\
", 
               Keyword = "door", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 10307, 
               Distance = 0, 
               Keyword = "", 
               Description = "Wandering the Academy\
", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 10311, 
               Distance = 0, 
               Keyword = "", 
               Description = "Lost in Darkhaven Academy\
", 
            }, 
            [4] = 
            {
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 10304, 
               Distance = 0, 
               Keyword = "", 
               Description = "Back to the beginning\
", 
            }, 
         }, 
      }, 
      [10310] = 
      {
         TeleDelay = 0, 
         Vnum = 10310, 
         TeleVnum = 0, 
         Flags = 
         {
            [3] = "Indoors", 
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
         Tunnel = 0, 
         Name = "An Enclosed Room", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 10309, 
               Distance = 0, 
               Description = "Wandering Darkhaven Academy\
", 
               Keyword = "door", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
            }, 
         }, 
      }, 
      [10311] = 
      {
         TeleDelay = 0, 
         Vnum = 10311, 
         TeleVnum = 0, 
         Flags = 
         {
            [3] = "Indoors", 
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
         Tunnel = 0, 
         Name = "Lost in Coruscant Academy", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 10312, 
               Distance = 0, 
               Keyword = "", 
               Description = "Lost in Darkhaven Academy\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 10309, 
               Distance = 0, 
               Keyword = "", 
               Description = "Wandering Darkhaven Academy\
", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 10304, 
               Distance = 0, 
               Keyword = "", 
               Description = "Back to the beginning\
", 
            }, 
         }, 
      }, 
      [10312] = 
      {
         TeleDelay = 0, 
         Vnum = 10312, 
         TeleVnum = 0, 
         Flags = 
         {
            [3] = "Indoors", 
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
         Tunnel = 0, 
         Name = "Lost in Coruscant Academy", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "tapestry", 
               Description = "Upon closer inspection you realise that this is not even a tapestry, but\
\13a cunningly camouflaged wall! You can see the outline of a door as you\
\13look closer.\
\13", 
            }, 
            [2] = 
            {
               Keyword = "west", 
               Description = "You see a tapestry on the wall here, something just isn't right about it.\
\13", 
            }, 
            [3] = 
            {
               Keyword = "w", 
               Description = "You see a tapestry on the wall.\
\13", 
            }, 
            [4] = 
            {
               Keyword = "door", 
               Description = "You see a cleverly disguised door.\
\13", 
            }, 
            [5] = 
            {
               Keyword = "Crystal globes", 
               Description = "This globes cast shadows in the corners. The shadows on the west\
\13tapestry almost appears to be an opening.\
\13", 
            }, 
         }, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 10311, 
               Distance = 0, 
               Keyword = "", 
               Description = "Lost in Darkhaven Academy\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 10313, 
               Distance = 0, 
               Description = "door\
", 
               Keyword = "tapestry door", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
                  [3] = "Secret", 
               }, 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 10304, 
               Distance = 0, 
               Keyword = "", 
               Description = "Back to the beginning\
", 
            }, 
         }, 
      }, 
      [10313] = 
      {
         TeleDelay = 0, 
         Vnum = 10313, 
         TeleVnum = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
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
         Tunnel = 0, 
         Name = "A Secret Alcove", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "crack", 
               Description = "This is a huge CRACK, you could probably squeeze through it. \
\13", 
            }, 
            [2] = 
            {
               Keyword = "wall", 
               Description = "This is a picture of fresh cut flowers in a glass vase. It seems to\
\13be hanging here just to cover a huge crack. That crack is so large, you\
\13can probably squeeze through it! Perhaps you should look closer at the\
\13crack. HINT: type CRACK.\
\13", 
            }, 
            [3] = 
            {
               Keyword = "door", 
               Description = "You see an oak door.\
\13", 
            }, 
            [4] = 
            {
               Keyword = "picture", 
               Description = "This is a picture of fresh cut flowers in a glass vase. It seems to\
\13be hanging here just to cover a huge crack. That crack is so large, you\
\13can probably squeeze through it! Perhaps you should look closer at the\
\13crack. HINT: type CRACK. \
\13", 
            }, 
         }, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 10312, 
               Distance = 0, 
               Description = "Lost in Darkhaven Academy\
", 
               Keyword = "door", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 10304, 
               Distance = 0, 
               Keyword = "", 
               Description = "Back to the beginning\
", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "somewhere", 
               DestinationVnum = 10302, 
               Distance = 0, 
               Description = "", 
               Keyword = "crack", 
               Flags = 
               {
                  [19] = "Auto", 
                  [11] = "Hidden", 
               }, 
            }, 
         }, 
      }, 
      [10314] = 
      {
         TeleDelay = 0, 
         Vnum = 10314, 
         TeleVnum = 0, 
         Flags = 
         {
            [3] = "Indoors", 
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
         Tunnel = 0, 
         Name = "A Marble Corridor", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 10315, 
               Distance = 0, 
               Keyword = "", 
               Description = "Preparing for combat\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 10304, 
               Distance = 0, 
               Keyword = "", 
               Description = "The Reading Room\
", 
            }, 
         }, 
      }, 
      [10315] = 
      {
         TeleDelay = 0, 
         Vnum = 10315, 
         TeleVnum = 0, 
         Flags = 
         {
            [3] = "Indoors", 
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
         Tunnel = 0, 
         Name = "Preparing for combat", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 10317, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 10314, 
               Distance = 0, 
               Keyword = "", 
               Description = "A Marble Corridor\
", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 10316, 
               Distance = 0, 
               Keyword = "", 
               Description = "A Dank Pit\
", 
            }, 
         }, 
      }, 
      [10316] = 
      {
         TeleDelay = 0, 
         Vnum = 10316, 
         TeleVnum = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
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
         Tunnel = 0, 
         Name = "A Dank Pit", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 10308, 
               Distance = 0, 
               Keyword = "", 
               Description = "A Dank Pit\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 10315, 
               Distance = 0, 
               Keyword = "", 
               Description = "Preparing for combat\
", 
            }, 
         }, 
      }, 
      [10317] = 
      {
         TeleDelay = 0, 
         Vnum = 10317, 
         TeleVnum = 0, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
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
         Tunnel = 0, 
         Name = "Time To Take A Break", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 10327, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 10315, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
      }, 
      [10318] = 
      {
         TeleDelay = 0, 
         Vnum = 10318, 
         TeleVnum = 0, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
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
         Tunnel = 0, 
         Name = "A Useless Item?", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 10322, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
      }, 
      [10319] = 
      {
         TeleDelay = 0, 
         Vnum = 10319, 
         TeleVnum = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "city", 
         Description = "Sometimes items can be obtained by manipulating other items. Some classes\
can make items from other ones using skills such as MAKEBLASTER, MAKESPICE,\
or MAKELIGHTSABER. Other times it is as simple as opening a box or pushing\
a button as is the case in this room.\
", 
         Tunnel = 0, 
         Name = "Up in a Small Loft", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 10322, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
      }, 
      [10320] = 
      {
         TeleDelay = 0, 
         Vnum = 10320, 
         TeleVnum = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "city", 
         Description = "The most common way in most muds to gain equipment is by looting the\
corpses of dead mobiles(monsters etc). After you kill this droid use\
EXAMINE CORPSE to see what it was carrying. Then use GET ALL FROM CORPSE\
to get the goodies from it. To automaticly loot corpses when you kill\
something you can set CONFIG +AUTOLOOT or CONFIG +AUTOCRED for just\
credits.\
", 
         Tunnel = 0, 
         Name = "Looting Your Kills", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 10322, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
      }, 
      [10321] = 
      {
         TeleDelay = 0, 
         Vnum = 10321, 
         TeleVnum = 0, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
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
         Tunnel = 0, 
         Name = "Academy Store", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 10322, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
      }, 
      [10322] = 
      {
         TeleDelay = 0, 
         Vnum = 10322, 
         TeleVnum = 0, 
         Flags = 
         {
            [3] = "Indoors", 
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
         Tunnel = 0, 
         Name = "Getting More Useful Items", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 10323, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 10320, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 10327, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
            }, 
            [4] = 
            {
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 10321, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [5] = 
            {
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 10319, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [6] = 
            {
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 10318, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
      }, 
      [10323] = 
      {
         TeleDelay = 0, 
         Vnum = 10323, 
         TeleVnum = 0, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Sector = "city", 
         Description = "Congratulations, you're almost done. The graduation hall is just to the\
north. Only one problem though. The door's locked. Maybe this kid knows\
where the key is. If only he'd stop crying long enough for you to ask.\
hint: find his doll\
hint: give doll child\
hint: say where's the key\
", 
         Tunnel = 0, 
         Name = "The Last Challenge", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Key = 10423, 
               Direction = "north", 
               DestinationVnum = 10324, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
               }, 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 10322, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
      }, 
      [10324] = 
      {
         TeleDelay = 0, 
         Vnum = 10324, 
         TeleVnum = 0, 
         Flags = 
         {
            [10] = "Safe", 
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
         Tunnel = 0, 
         Name = "Graduating from the Academy", 
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
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 10323, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
                  [5] = "PickProof", 
               }, 
            }, 
         }, 
      }, 
      [10325] = 
      {
         TeleDelay = 0, 
         Vnum = 10325, 
         TeleVnum = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "somewhere", 
               DestinationVnum = 10326, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Flags = 
               {
                  [17] = "CanEnter", 
                  [11] = "Hidden", 
               }, 
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
         Tunnel = 0, 
         Name = "Academy Docking Bay", 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [10326] = 
      {
         TeleDelay = 0, 
         Vnum = 10326, 
         TeleVnum = 0, 
         Flags = 
         {
            [2] = "NoMob", 
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
         Tunnel = 0, 
         Name = "The Shuttle home", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "somewhere", 
               DestinationVnum = 10325, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [11] = "Hidden", 
               }, 
            }, 
         }, 
      }, 
      [10327] = 
      {
         TeleDelay = 0, 
         Vnum = 10327, 
         TeleVnum = 0, 
         Flags = 
         {
            [30] = "Prototype", 
            [2] = "NoMob", 
            [3] = "Indoors", 
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
         Tunnel = 0, 
         Name = "Some Important Words of Advice", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 10322, 
               Distance = 0, 
               Description = "", 
               Keyword = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 10317, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
      }, 
      [10399] = 
      {
         TeleDelay = 0, 
         Vnum = 10399, 
         TeleVnum = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Sector = "city", 
         Description = "", 
         Tunnel = 0, 
         Name = "This Room is used by a Mob program do not delete.", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
         }, 
      }, 
      [10400] = 
      {
         TeleDelay = 0, 
         Vnum = 10400, 
         TeleVnum = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [26] = "Factory", 
         }, 
         Sector = "city", 
         Description = "", 
         Tunnel = 0, 
         Name = "A test workshop", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
         }, 
      }, 
      [10401] = 
      {
         TeleDelay = 0, 
         Vnum = 10401, 
         TeleVnum = 0, 
         Flags = 
         {
            [16] = "Silence", 
            [10] = "Safe", 
            [2] = "NoMob", 
         }, 
         Sector = "city", 
         Description = "", 
         Tunnel = 0, 
         Name = "a quiet place", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
         }, 
      }, 
      [10340] = 
      {
         TeleDelay = 0, 
         Vnum = 10340, 
         TeleVnum = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Sector = "city", 
         Description = "", 
         Tunnel = 0, 
         Name = "Floating in a void", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
         }, 
      }, 
      [10342] = 
      {
         TeleDelay = 0, 
         Vnum = 10342, 
         TeleVnum = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Sector = "city", 
         Description = "", 
         Tunnel = 0, 
         Name = "Floating in a void", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
         }, 
      }, 
      [10430] = 
      {
         TeleDelay = 0, 
         Vnum = 10430, 
         TeleVnum = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [10] = "Safe", 
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
         Tunnel = 0, 
         Name = "Student Lounge", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 10300, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
      }, 
      [10429] = 
      {
         TeleDelay = 0, 
         Vnum = 10429, 
         TeleVnum = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Sector = "city", 
         Description = "", 
         Tunnel = 0, 
         Name = "Floating in a void", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
         }, 
      }, 
      [10300] = 
      {
         TeleDelay = 0, 
         Vnum = 10300, 
         TeleVnum = 0, 
         Flags = 
         {
            [23] = "Hotel", 
            [10] = "Safe", 
            [2] = "NoMob", 
            [3] = "Indoors", 
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
         Tunnel = 0, 
         Name = "Coruscant Academy", 
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
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 10301, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 10430, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
      }, 
      [10301] = 
      {
         TeleDelay = 0, 
         Vnum = 10301, 
         TeleVnum = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Description = "To the west is Lady Abbigayle's room, and to the east is Domick.  Lady\
Abbigayle has information about languages, and Domick has information on\
practicing weapons and skills. When you are finished exploring these\
areas, come back here and continue north through the Academy.\
", 
         Tunnel = 0, 
         Name = "A Duraplast Corridor", 
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
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 10304, 
               Distance = 0, 
               Keyword = "", 
               Description = "Reading Room\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 10303, 
               Distance = 0, 
               Keyword = "", 
               Description = "The Laboratory of Skills.\
", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 10300, 
               Distance = 0, 
               Keyword = "", 
               Description = "Entrance to Darkhaven Academy\
", 
            }, 
            [4] = 
            {
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 10306, 
               Distance = 0, 
               Keyword = "", 
               Description = "Abbigayle's Language Lessons.\
", 
            }, 
         }, 
      }, 
      [10302] = 
      {
         TeleDelay = 0, 
         Vnum = 10302, 
         TeleVnum = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Description = "You did it! You are an excellent student! To continue your education,\
please leave north. That will return you to the Reading room.\
", 
         Tunnel = 0, 
         Name = "Somewhere", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 10304, 
               Distance = 0, 
               Keyword = "", 
               Description = "The Reading Room\
", 
            }, 
         }, 
      }, 
      [10303] = 
      {
         TeleDelay = 0, 
         Vnum = 10303, 
         TeleVnum = 0, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
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
         Tunnel = 0, 
         Name = "The Laboratory of Skills", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 10301, 
               Distance = 0, 
               Keyword = "", 
               Description = "A Stone Corridor\
", 
            }, 
         }, 
      }, 
   }, 
   FileFormatVersion = 1, 
   Resets = 
   {
      [1] = 
      {
         MiscData = 0, 
         Arg1 = 10340, 
         Arg3 = 10303, 
         Command = "M", 
         Arg2 = 1, 
      }, 
      [2] = 
      {
         MiscData = 0, 
         Arg1 = 10394, 
         Arg3 = 10306, 
         Command = "M", 
         Arg2 = 1, 
      }, 
      [3] = 
      {
         MiscData = 0, 
         Arg1 = 10309, 
         Arg3 = 1, 
         Command = "D", 
         Arg2 = 0, 
      }, 
      [4] = 
      {
         MiscData = 0, 
         Arg1 = 10310, 
         Arg3 = 1, 
         Command = "D", 
         Arg2 = 2, 
      }, 
      [5] = 
      {
         MiscData = 0, 
         Arg1 = 10312, 
         Arg3 = 1, 
         Command = "D", 
         Arg2 = 3, 
      }, 
      [6] = 
      {
         MiscData = 0, 
         Arg1 = 10313, 
         Arg3 = 1, 
         Command = "D", 
         Arg2 = 1, 
      }, 
      [7] = 
      {
         MiscData = 1, 
         Arg1 = 10414, 
         Arg3 = 10430, 
         Command = "O", 
         Arg2 = 1, 
      }, 
      [8] = 
      {
         MiscData = 1, 
         Arg1 = 10345, 
         Arg3 = 10308, 
         Command = "M", 
         Arg2 = 1, 
      }, 
      [9] = 
      {
         MiscData = 1, 
         Arg1 = 10360, 
         Arg3 = 10320, 
         Command = "M", 
         Arg2 = 1, 
      }, 
      [10] = 
      {
         MiscData = 1, 
         Arg1 = 10301, 
         Arg3 = 8, 
         Command = "E", 
         Arg2 = 1, 
      }, 
      [11] = 
      {
         MiscData = 1, 
         Arg1 = 10302, 
         Arg3 = 13, 
         Command = "E", 
         Arg2 = 1, 
      }, 
      [12] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 10304, 
      }, 
      [13] = 
      {
         MiscData = 1, 
         Arg1 = 10318, 
         Arg3 = 10319, 
         Command = "O", 
         Arg2 = 1, 
      }, 
      [14] = 
      {
         MiscData = 1, 
         Arg1 = 10342, 
         Arg3 = 10318, 
         Command = "M", 
         Arg2 = 1, 
      }, 
      [15] = 
      {
         MiscData = 1, 
         Arg1 = 10343, 
         Arg3 = 10323, 
         Command = "M", 
         Arg2 = 1, 
      }, 
      [16] = 
      {
         MiscData = 0, 
         Arg1 = 10323, 
         Arg3 = 2, 
         Command = "D", 
         Arg2 = 0, 
      }, 
      [17] = 
      {
         MiscData = 1, 
         Arg1 = 10355, 
         Arg3 = 10326, 
         Command = "M", 
         Arg2 = 1, 
      }, 
      [18] = 
      {
         MiscData = 1, 
         Arg1 = 10315, 
         Arg3 = 10317, 
         Command = "O", 
         Arg2 = 1, 
      }, 
      [19] = 
      {
         MiscData = 0, 
         Arg1 = 10365, 
         Arg3 = 10317, 
         Command = "M", 
         Arg2 = 1, 
      }, 
      [20] = 
      {
         MiscData = 1, 
         Arg1 = 10395, 
         Arg3 = 10327, 
         Command = "M", 
         Arg2 = 1, 
      }, 
      [21] = 
      {
         MiscData = 0, 
         Arg1 = 10327, 
         Arg3 = 1, 
         Command = "D", 
         Arg2 = 0, 
      }, 
      [22] = 
      {
         MiscData = 1, 
         Arg1 = 10370, 
         Arg3 = 10321, 
         Command = "M", 
         Arg2 = 1, 
      }, 
      [23] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 10317, 
      }, 
      [24] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 10311, 
      }, 
      [25] = 
      {
         MiscData = 1, 
         Arg1 = 10350, 
         Arg3 = 10324, 
         Command = "M", 
         Arg2 = 1, 
      }, 
      [26] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
         Arg1 = 10423, 
      }, 
      [27] = 
      {
         MiscData = 1, 
         Arg1 = 10414, 
         Arg3 = 10324, 
         Command = "O", 
         Arg2 = 1, 
      }, 
      [28] = 
      {
         MiscData = 0, 
         Arg1 = 10324, 
         Arg3 = 1, 
         Command = "D", 
         Arg2 = 2, 
      }, 
      [29] = 
      {
         MiscData = 1, 
         Arg1 = 10322, 
         Arg3 = 10325, 
         Command = "O", 
         Arg2 = 1, 
      }, 
   }, 
   Flags = 
   {
      [1] = "_01", 
      [0] = "NoPkill", 
   }, 
   ResetMessage = "You hear the hum of repulsorlifts powering up in the distance", 
   HighEconomy = 0, 
   ResetFrequency = 3, 
   Objects = 
   {
      [10304] = 
      {
         ShortDescr = "an academy cap", 
         Vnum = 10304, 
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
         Affects = 
         {
            [1] = 
            {
               Modifier = 1, 
               Location = 3, 
            }, 
         }, 
         Weight = 2, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "helmet iron", 
               Description = "This is a helmet made of fine iron, from the Darkhaven Academy.  It will\
\13protect you until you can find better.\
\13", 
            }, 
         }, 
         Layers = 0, 
         ObjectValues = 
         {
            [1] = 3, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 3, 
         }, 
         Name = "academy cap", 
         Description = "A Coruscant Academy cap is here.", 
         WearFlags = 
         {
            [0] = "Take", 
            [4] = "Head", 
         }, 
         Cost = 0, 
      }, 
      [10305] = 
      {
         ShortDescr = "a black brocade cape", 
         Vnum = 10305, 
         ItemType = "armor", 
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
         Weight = 3, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "cape brocade", 
               Description = "This cape is made from a heavy brocade. It will offer you warmth and\
\13protection until you can find something better. You can find it at the\
\13Darkhave Academy.\
\13", 
            }, 
         }, 
         Layers = 0, 
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         Name = "cape brocade academy", 
         Description = "A black brocade cape from the academy", 
         WearFlags = 
         {
            [0] = "Take", 
            [10] = "About", 
         }, 
         Cost = 0, 
      }, 
      [10306] = 
      {
         ShortDescr = "a strong metal collar", 
         Vnum = 10306, 
         ItemType = "armor", 
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
         Weight = 5, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "collar metal ", 
               Description = "This collar fits closely around your neck. It is thick with spikes to\
\13protect you in battle. You can find it in the Darkhaven Academy\
\13", 
            }, 
         }, 
         Layers = 0, 
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 3, 
         }, 
         Name = "collar metal academy", 
         Description = "A strong metal collar from the academy", 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
         }, 
         Cost = 0, 
      }, 
      [10307] = 
      {
         ShortDescr = "a visor of completion", 
         Vnum = 10307, 
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
         Affects = 
         {
            [1] = 
            {
               Modifier = 1, 
               Location = 4, 
            }, 
            [2] = 
            {
               Modifier = 1, 
               Location = 3, 
            }, 
         }, 
         ActionDescription = "", 
         Weight = 1, 
         Flags = 
         {
            [6] = "Magic", 
         }, 
         ItemType = "armor", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "visor completion", 
               Description = "Congratulations! You have completed the Darkhaven Academy and can now\
\13wear this visor with pride! It is magic too, type WEAR VISOR to use.\
\13", 
            }, 
         }, 
         Layers = 0, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         Name = "visor completion academy", 
         WearFlags = 
         {
            [0] = "Take", 
            [17] = "Eyes", 
         }, 
         Description = "A visor of completion is here, emitting a faint glow.", 
         Cost = 0, 
      }, 
      [10308] = 
      {
         ShortDescr = "an academy vest", 
         Vnum = 10308, 
         ItemType = "armor", 
         Weight = 5, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "plate armour", 
               Description = "This plate of armour will give you protection until you can find\
\13something better. \
\13", 
            }, 
         }, 
         Layers = 0, 
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         Name = "academy vest", 
         Description = "An academy vest was left here.", 
         WearFlags = 
         {
            [0] = "Take", 
            [3] = "Body", 
         }, 
         Cost = 0, 
      }, 
      [10309] = 
      {
         ShortDescr = "lightweight tin sleeves", 
         Vnum = 10309, 
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
         Affects = 
         {
            [1] = 
            {
               Modifier = 1, 
               Location = 1, 
            }, 
         }, 
         Weight = 1, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "sleeves tin", 
               Description = "This sleeves will protect your arms until you can find something better.\
\13You can find them in the Darkhaven Academy.\
\13", 
            }, 
         }, 
         Layers = 0, 
         ObjectValues = 
         {
            [1] = 3, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 3, 
         }, 
         Name = "sleeves tin academy", 
         Description = "Lightweight tin sleeves from the academy", 
         WearFlags = 
         {
            [0] = "Take", 
            [8] = "Arms", 
         }, 
         Cost = 0, 
      }, 
      [10310] = 
      {
         ShortDescr = "an energy shield", 
         Vnum = 10310, 
         ItemType = "armor", 
         Weight = 5, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "shield crest", 
               Description = "This is your first shield, it will help keep you safe until you can\
\13find something better.\
\13", 
            }, 
         }, 
         Layers = 0, 
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         Name = "forceshield energyshield shields shield", 
         Description = "An energy shield was dropped here.", 
         WearFlags = 
         {
            [0] = "Take", 
            [9] = "Shield", 
         }, 
         Cost = 0, 
      }, 
      [10311] = 
      {
         ShortDescr = "a glowrod", 
         Vnum = 10311, 
         Affects = 
         {
            [1] = 
            {
               Modifier = -1, 
               Location = 24, 
            }, 
         }, 
         ActionDescription = "", 
         Weight = 1, 
         Flags = 
         {
            [0] = "Glow", 
            [13] = "Inventory", 
            [6] = "Magic", 
         }, 
         ItemType = "light", 
         ExtraDescriptions = 
         {
         }, 
         Layers = 0, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 50, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Name = "light glowrod glowstick", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Description = "A glowrod would make a good light source.", 
         Cost = 5, 
      }, 
      [10312] = 
      {
         ShortDescr = "a vibro-blade", 
         Vnum = 10312, 
         Affects = 
         {
            [1] = 
            {
               Modifier = -2, 
               Location = 18, 
            }, 
         }, 
         ActionDescription = "", 
         Weight = 3, 
         Flags = 
         {
            [6] = "Magic", 
         }, 
         ItemType = "weapon", 
         ExtraDescriptions = 
         {
         }, 
         Layers = 0, 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 4, 
            [3] = 2, 
            [4] = 1000, 
            [5] = 1000, 
            [0] = 12, 
         }, 
         Name = "academy vibro blade knife dagger vibro-blade", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Description = "You see a finely honed vibro-blade here.", 
         Cost = 250, 
      }, 
      [10313] = 
      {
         ShortDescr = "a packaged ration", 
         Vnum = 10313, 
         ActionDescription = "", 
         Weight = 2, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         ItemType = "food", 
         ExtraDescriptions = 
         {
         }, 
         Layers = 0, 
         ObjectValues = 
         {
            [1] = 50, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 50, 
         }, 
         Name = "ration standard packaged", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Description = "A packaged ration is here, waiting to be eaten.", 
         Cost = 5, 
      }, 
      [10314] = 
      {
         ShortDescr = "a canteen", 
         Vnum = 10314, 
         ItemType = "drink_container", 
         Weight = 1, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Layers = 0, 
         ObjectValues = 
         {
            [1] = 40, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 40, 
         }, 
         Name = "canteen water grey stock", 
         Description = "A small grey canteen has been drooped here.", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Cost = 10, 
      }, 
      [10315] = 
      {
         ShortDescr = "a fountain", 
         Vnum = 10315, 
         ItemType = "fountain", 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Layers = 0, 
         ObjectValues = 
         {
            [1] = 1000, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 1000, 
         }, 
         Name = "drinking fountain", 
         Weight = 1, 
         Description = "A drinking fountain rests against the wall.", 
         Cost = 0, 
      }, 
      [10316] = 
      {
         ShortDescr = "a pair of socks", 
         Vnum = 10316, 
         ActionDescription = "", 
         Weight = 1, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         ItemType = "armor", 
         ExtraDescriptions = 
         {
         }, 
         Layers = 1, 
         ObjectValues = 
         {
            [1] = 1, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Name = "socks", 
         WearFlags = 
         {
            [0] = "Take", 
            [6] = "Feet", 
         }, 
         Description = "A pair of socks is in a ball on the floor.", 
         Cost = 5, 
      }, 
      [10317] = 
      {
         ShortDescr = "a backpack", 
         Vnum = 10317, 
         ItemType = "container", 
         Affects = 
         {
            [1] = 
            {
               Modifier = -5, 
               Location = 17, 
            }, 
         }, 
         Weight = 1, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Layers = 64, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 20, 
         }, 
         Name = "academy backpack", 
         Description = "An academy backpack was carelessly misplaced here.", 
         WearFlags = 
         {
            [0] = "Take", 
            [10] = "About", 
         }, 
         Cost = 5, 
      }, 
      [10318] = 
      {
         ShortDescr = "a button", 
         Vnum = 10318, 
         ItemType = "button", 
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
         ActionDescription = "", 
         ExtraDescriptions = 
         {
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
         Name = "grey button", 
         Weight = 1, 
         Description = "A small grey button seems out of place on the wall here.", 
         Cost = 0, 
      }, 
      [10319] = 
      {
         ShortDescr = "a box", 
         Vnum = 10319, 
         ItemType = "container", 
         Weight = 1, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Layers = 0, 
         ObjectValues = 
         {
            [1] = 1, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         Name = "box", 
         Description = "A small box .. I wonder whats inside, maybe you should open it.", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Cost = 0, 
      }, 
      [10320] = 
      {
         ShortDescr = "a Luke Skywalker action figure", 
         Vnum = 10320, 
         ItemType = "trash", 
         Weight = 1, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
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
         Name = "luke toy action figure doll", 
         Description = "A Luke Skywalker action figure was misplaced here.", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Cost = 0, 
      }, 
      [10321] = 
      {
         ShortDescr = "a diploma", 
         Vnum = 10321, 
         ItemType = "paper", 
         Weight = 1, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
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
         Name = "diploma academy coruscant graduation", 
         Description = "Someone dropped their coruscant academy graduation diploma here.", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Cost = 0, 
      }, 
      [10322] = 
      {
         ShortDescr = "a shuttle", 
         Vnum = 10322, 
         ItemType = "trash", 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
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
         Name = "academy shuttle", 
         Weight = 1, 
         Description = "A small shuttle is docked here.", 
         Cost = 0, 
      }, 
      [10323] = 
      {
         ShortDescr = "a practice lightsaber", 
         Vnum = 10323, 
         ActionDescription = "", 
         Weight = 1, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         ItemType = "weapon", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "practice lightsaber", 
               Description = "Powered by a synthesized crystal, this weapon works like a real\
\13lightsaber, only significantly less powerful.\
\13", 
            }, 
            [2] = 
            {
               Keyword = "practice lightsaber", 
               Description = "Powered by a synthesized crystal, this weapon works like a real\
\13lightsaber, only significantly less powerful.\
\13", 
            }, 
         }, 
         Layers = 0, 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 4, 
            [3] = 3, 
            [4] = 1000, 
            [5] = 1000, 
            [0] = 12, 
         }, 
         Name = "practice lightsaber", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Description = "A practice lightsaber is here.", 
         Cost = 500, 
      }, 
      [10324] = 
      {
         ShortDescr = "a lightsaber battery", 
         Vnum = 10324, 
         ActionDescription = "", 
         Weight = 1, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         ItemType = "battery", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "lightsaber battery", 
               Description = "This power cell, the size of a fingertip, is\
\13well suited for powering a lightsaber.\
\13", 
            }, 
         }, 
         Layers = 0, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 1000, 
         }, 
         Name = "lightsaber battery", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Description = "A lightsaber battery is lying here.", 
         Cost = 50, 
      }, 
      [10499] = 
      {
         ShortDescr = "a newly created final object", 
         Vnum = 10499, 
         ItemType = "trash", 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
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
         Name = "final object", 
         Weight = 1, 
         Description = "Some god dropped a newly created final object here.", 
         Cost = 0, 
      }, 
      [10498] = 
      {
         ShortDescr = "a superconductor", 
         Vnum = 10498, 
         ItemType = "superconductor", 
         Weight = 1, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
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
         Name = "superconductor", 
         Description = "A superconductor is lying here.", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Cost = 0, 
      }, 
      [10497] = 
      {
         ShortDescr = "a circuit board", 
         Vnum = 10497, 
         ItemType = "circuit", 
         Weight = 1, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
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
         Name = "circuit board", 
         Description = "A circuit board was dropped here.", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Cost = 120, 
      }, 
      [10496] = 
      {
         ShortDescr = "a tiny, round mirror", 
         Vnum = 10496, 
         ItemType = "mirror", 
         Weight = 1, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
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
         Name = "mirror", 
         Description = "A tiny, round mirror is lying here.", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Cost = 0, 
      }, 
      [10495] = 
      {
         ShortDescr = "a non-adegan crystal", 
         Vnum = 10495, 
         ItemType = "crystal", 
         Weight = 1, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
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
         Name = "non-adegan crystal", 
         Description = "A non-adegan crystal is lying here.", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Cost = 0, 
      }, 
      [10494] = 
      {
         ShortDescr = "some scrap durasteel", 
         Vnum = 10494, 
         ActionDescription = "", 
         Weight = 1, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         ItemType = "durasteel", 
         ExtraDescriptions = 
         {
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
         Name = "some scrap durasteel", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Description = "A scrap of some material lies here.", 
         Cost = 50, 
      }, 
      [10493] = 
      {
         ShortDescr = "a portable oven", 
         Vnum = 10493, 
         ItemType = "oven", 
         Weight = 1, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
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
         Name = "portable oven", 
         Description = "A portable oven is here.", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Cost = 0, 
      }, 
      [10492] = 
      {
         ShortDescr = "a battery", 
         Vnum = 10492, 
         ItemType = "battery", 
         Weight = 1, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
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
         Name = "battery", 
         Description = "A battery is lying here.", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Cost = 0, 
      }, 
      [10491] = 
      {
         ShortDescr = "a durastaff", 
         Vnum = 10491, 
         ItemType = "staff", 
         Weight = 1, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
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
         Name = "staff durastaff", 
         Description = "A durastaff is lying here.", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Cost = 0, 
      }, 
      [10490] = 
      {
         ShortDescr = "a toolkit", 
         Vnum = 10490, 
         ItemType = "toolkit", 
         Weight = 1, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
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
         Name = "toolkit", 
         Description = "A toolkit is lying here.", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Cost = 0, 
      }, 
      [10489] = 
      {
         ShortDescr = "a small lens", 
         Vnum = 10489, 
         ItemType = "lens", 
         Weight = 1, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
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
         Name = "lens", 
         Description = "A small lens is lying here.", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Cost = 0, 
      }, 
      [10488] = 
      {
         ShortDescr = "an ammunition cell", 
         Vnum = 10488, 
         ActionDescription = "", 
         Weight = 1, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         ItemType = "ammo", 
         ExtraDescriptions = 
         {
         }, 
         Layers = 0, 
         ObjectValues = 
         {
            [1] = 500, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 500, 
         }, 
         Name = "ammo cell amunition cartridge", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Description = "An ammunition cell was carelessly left here.", 
         Cost = 10, 
      }, 
      [10487] = 
      {
         ShortDescr = "some poorly refined carsanum", 
         Vnum = 10487, 
         ItemType = "spice", 
         Weight = 1, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Layers = 0, 
         ObjectValues = 
         {
            [1] = 10, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 1, 
         }, 
         Name = "carsanum spice", 
         Description = "Some carsanum was dropped here.", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Cost = 200, 
      }, 
      [10435] = 
      {
         ShortDescr = "a prototype spice", 
         Vnum = 10435, 
         ItemType = "spice", 
         Weight = 1, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
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
         Name = "prototype spice", 
         Description = "A prototype spice is here.", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Cost = 0, 
      }, 
      [10434] = 
      {
         ShortDescr = "a prototype disguise", 
         Vnum = 10434, 
         ItemType = "disguise", 
         Weight = 1, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
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
         Name = "prototype disguise", 
         Description = "A prototype disguise is here.", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Cost = 0, 
      }, 
      [10433] = 
      {
         ShortDescr = "a prototype armor", 
         Vnum = 10433, 
         ItemType = "armor", 
         Weight = 1, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
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
         Name = "prototype armor", 
         Description = "A prototype armor is here.", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Cost = 100, 
      }, 
      [10414] = 
      {
         ShortDescr = "a student message terminal", 
         Vnum = 10414, 
         ItemType = "furniture", 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
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
         Name = "student message terminal", 
         Weight = 1, 
         Description = "A student message terminal is here for you to play with.", 
         Cost = 0, 
      }, 
      [10432] = 
      {
         ShortDescr = "a prototype container", 
         Vnum = 10432, 
         ItemType = "container", 
         Weight = 1, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
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
         Name = "prototype container", 
         Description = "A prototype container is here.", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Cost = 100, 
      }, 
      [10431] = 
      {
         ShortDescr = "prototype bowcaster", 
         Vnum = 10431, 
         ItemType = "weapon", 
         Weight = 1, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Layers = 0, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 9, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Name = "prototype bowcaster", 
         Description = "A proottype bowcaster is here", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Cost = 0, 
      }, 
      [10430] = 
      {
         ShortDescr = "a newly created prototype comlink", 
         Vnum = 10430, 
         ItemType = "comlink", 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
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
         Name = "prototype comlink", 
         Weight = 1, 
         Description = "Some god dropped a newly created prototype comlink here.", 
         Cost = 0, 
      }, 
      [10429] = 
      {
         ShortDescr = "a newly created prototype shield", 
         Vnum = 10429, 
         ItemType = "armor", 
         Weight = 1, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
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
         Name = "prototype shield", 
         Description = "Some god dropped a newly created prototype shield here.", 
         WearFlags = 
         {
            [0] = "Take", 
            [9] = "Shield", 
         }, 
         Cost = 0, 
      }, 
      [10428] = 
      {
         ShortDescr = "a newly created prototype light", 
         Vnum = 10428, 
         ItemType = "light", 
         Weight = 1, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
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
         Name = "prototype light", 
         Description = "Some god dropped a newly created prototype light here.", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Cost = 0, 
      }, 
      [10420] = 
      {
         ShortDescr = "prototype blaster", 
         Vnum = 10420, 
         ItemType = "weapon", 
         Weight = 1, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Layers = 0, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 6, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Name = "prototype blaster", 
         Description = "A prototype blaster is here", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Cost = 0, 
      }, 
      [10421] = 
      {
         ShortDescr = "a prototype lightsaber", 
         Vnum = 10421, 
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
         ActionDescription = "", 
         Weight = 1, 
         Flags = 
         {
            [4] = "Contraband", 
         }, 
         ItemType = "weapon", 
         ExtraDescriptions = 
         {
         }, 
         Layers = 128, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 3, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Name = "prototype saber lightsaber", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Description = "A prototype lightsaber shouldn't be here", 
         Cost = 0, 
      }, 
      [10422] = 
      {
         ShortDescr = "prototype vibro-blade", 
         Vnum = 10422, 
         ItemType = "weapon", 
         Weight = 1, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Layers = 0, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 2, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Name = "prototype vibro-blade", 
         Description = "A prototype vibro-blade shouldn't be here", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Cost = 0, 
      }, 
      [10423] = 
      {
         ShortDescr = "a key", 
         Vnum = 10423, 
         ItemType = "key", 
         Weight = 1, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
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
         Name = "key", 
         Description = "An old fashioned mechanical key was left on the ground here.", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Cost = 0, 
      }, 
      [10424] = 
      {
         ShortDescr = "a comlink", 
         Vnum = 10424, 
         ItemType = "comlink", 
         Weight = 1, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
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
         Name = "comlink radio communicator", 
         Description = "A small hand-held comlink.", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Cost = 50, 
      }, 
      [10425] = 
      {
         ShortDescr = "a newly created prototype grenade", 
         Vnum = 10425, 
         ItemType = "grenade", 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Layers = 0, 
         ObjectValues = 
         {
            [1] = 350, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 200, 
         }, 
         Name = "prototype grenade", 
         Weight = 1, 
         Description = "Some god dropped a newly created prototype grenade here.", 
         Cost = 0, 
      }, 
      [10426] = 
      {
         ShortDescr = "a newly created generic armor", 
         Vnum = 10426, 
         ActionDescription = "", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         ItemType = "trash", 
         ExtraDescriptions = 
         {
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
         Name = "generic armor", 
         Weight = 1, 
         Description = "Some god dropped a newly created generic armor here.", 
         Cost = 0, 
      }, 
      [10427] = 
      {
         ShortDescr = "a newly created protoype landmine", 
         Vnum = 10427, 
         ItemType = "landmine", 
         Weight = 1, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
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
         Name = "protoype landmine", 
         Description = "Some god dropped a newly created protoype landmine here.", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Cost = 0, 
      }, 
      [10300] = 
      {
         ShortDescr = "a charm bracelet", 
         Vnum = 10300, 
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
         Affects = 
         {
            [1] = 
            {
               Modifier = 1, 
               Location = 31, 
            }, 
         }, 
         Weight = 2, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "bracelet charm", 
               Description = "This is a bracelet that will bring you luck in your travels. It can\
\13be found at the Darkhaven Acamdemy\
\13", 
            }, 
         }, 
         Layers = 0, 
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         Name = "bracelet charm academy", 
         Description = "A charm bracelet from the academy lies here", 
         WearFlags = 
         {
            [0] = "Take", 
            [12] = "Wrist", 
         }, 
         Cost = 0, 
      }, 
      [10301] = 
      {
         ShortDescr = "a pair of black combat boots", 
         Vnum = 10301, 
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
         Affects = 
         {
            [1] = 
            {
               Modifier = 100, 
               Location = 14, 
            }, 
         }, 
         Weight = 3, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "combat boots", 
               Description = "This boots are so comfortable and light, you feel you can walk a lot\
\13farther. The can be found at the Darkhaven Academy.\
\13", 
            }, 
         }, 
         Layers = 126, 
         ObjectValues = 
         {
            [1] = 3, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 3, 
         }, 
         Name = "combat boots academy", 
         Description = "A pair of black combat boots from the Academy lies here", 
         WearFlags = 
         {
            [0] = "Take", 
            [6] = "Feet", 
         }, 
         Cost = 0, 
      }, 
      [10302] = 
      {
         ShortDescr = "a braided leather belt", 
         Vnum = 10302, 
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
         Affects = 
         {
            [1] = 
            {
               Modifier = 1, 
               Location = 5, 
            }, 
         }, 
         Weight = 2, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "belt leather", 
               Description = "This belt is made of a fine leather, braided for strength. You can get\
\13it at the Darkhaven Academy.\
\13", 
            }, 
         }, 
         Layers = 0, 
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         Name = "belt leather academy", 
         Description = "A braided leather belt from the Academy lies here", 
         WearFlags = 
         {
            [0] = "Take", 
            [11] = "Waist", 
         }, 
         Cost = 0, 
      }, 
      [10303] = 
      {
         ShortDescr = "some leggings", 
         Vnum = 10303, 
         ItemType = "armor", 
         Weight = 3, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "leggings", 
               Description = "These leggings will offer good protection until you can get better. They\
\13can be found at the Darkhaven Academy.\
\13", 
            }, 
         }, 
         Layers = 0, 
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         Name = "pants trousers slacks leggings", 
         Description = "A pair of academy leggings is here.", 
         WearFlags = 
         {
            [0] = "Take", 
            [5] = "Legs", 
         }, 
         Cost = 0, 
      }, 
   }, 
   LowEconomy = 496055510, 
   Name = "Coruscant Academy", 
   Filename = "newacad.lua", 
   VnumRanges = 
   {
      Room = 
      {
         Last = 10430, 
         First = 10300, 
      }, 
      Mob = 
      {
         Last = 10499, 
         First = 10340, 
      }, 
      Object = 
      {
         Last = 10499, 
         First = 10300, 
      }, 
   }, 
}
