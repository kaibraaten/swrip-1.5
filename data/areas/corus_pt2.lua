-- Coruscant - More of Government City
-- Last saved Monday 01-Jun-2020 11:08:46

AreaEntry
{
   Name = "Coruscant - More of Government City", 
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
      [10208] = 
      {
         Name = "retail droid", 
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
         Vnum = 10208, 
         Immune = 
         {
            [20] = "magic", 
            [11] = "charm", 
         }, 
         LongDescr = "A retail droid is here to assist you with your purchaces.\
", 
         NumberOfAttacks = 0, 
         Level = 10, 
         Description = "The retail droid is similar in apearance to a standard proticol droid.\
It is fittened however with a crdit exchange terminal in its hip and\
is programmed to be an expert salesperson.\
", 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         ShortDescr = "a retail droid", 
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
            KeeperShortDescr = "a retail droid", 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [26] = "Droid", 
            [30] = "Prototype", 
         }, 
      }, 
      [10209] = 
      {
         Name = "a clerk", 
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
            HitNoDice = 2, 
            HitSizeDice = 10, 
            HitPlus = 100, 
         }, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
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
         Vnum = 10209, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         LongDescr = "A clerk sits at his desk.\
", 
         NumberOfAttacks = 0, 
         Level = 10, 
         Description = "", 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         ShortDescr = "a clerk", 
         DamRoll = 0, 
         Height = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "gives", 
               Code = "if ovnumcarry(28610) >= 1\
 grin $n\
say Excellent work!\
mpwithdraw 10000 credits\
give 10000 credits $n\
mpgain $n 3 20000\
 endif\
if ovnuminv(23150) >= 1\
nod $n\
say We are most pleased with your work. \
mpwithdraw 25000\
give 25000 credits $n\
drop 25000 credits\
mpgain $n 3 21500\
endif\
mpat 10299 drop all\
mpat 10299 mppurge\
", 
               MudProgType = "act_prog", 
            }, 
            [2] = 
            {
               Arguments = "Locke.", 
               Code = "if ovnuminv(24611) >= 1\
nod $n\
say This one has eluded us for a while now.  Thank you. \
mpwithdraw 5000\
give 5000 credits $n\
mpgain $n 3 5000\
else\
say That's not the corpse of Locke!\
endif\
mpat 10299 drop all\
mpat 10299 mppurge\
", 
               MudProgType = "act_prog", 
            }, 
            [3] = 
            {
               Arguments = "Toodan.", 
               Code = "if ovnuminv(10212) >= 1\
nod $n\
say Good work. The syndicate will be most pleased.\
mpwithdraw 1000\
give 1000 credits $n\
mpgain $n 3 1000\
else\
say Thats not the corpse of Toodan!\
endif\
mpat 10299 drop all\
mpat 10299 mppurge\
", 
               MudProgType = "act_prog", 
            }, 
            [4] = 
            {
               Arguments = "Noktok.", 
               Code = "if ovnuminv(10213) >= 1\
nod $n\
say We are most pleased with your work.\
mpwithdraw 2000\
give 2000 credits $n\
mpgain $n 3 2000\
else\
say Thats not the corpse of Noktok!\
endif\
mpat 10299 drop all\
mpat 10299 mppurge\
", 
               MudProgType = "act_prog", 
            }, 
            [5] = 
            {
               Arguments = "Sleejat.", 
               Code = "if ovnuminv(10216) >= 1\
say Would have been worth much more alive than\
dead.\
say Take your credits and get lost.\
mpwithdraw 20000\
give 20000 credits $n\
mpgain $n 3 25000\
else\
say What do you take me for a fool!\
endif\
mpat 10299 drop all\
mpat 10299 mppurge\
", 
               MudProgType = "act_prog", 
            }, 
            [6] = 
            {
               Arguments = "Pleebo.", 
               Code = "if ovnumcarry(10214)\
say This one was wanted alive not dead!\
chuckle\
mpat 10299 drop all\
mpat 10299 mppurge\
endif\
", 
               MudProgType = "act_prog", 
            }, 
            [7] = 
            {
               Arguments = "Pleebo", 
               Code = "if name($n) == Pleebo\
mpwithdraw 5000\
drop 5000 credits\
say Excellent work!!\
mpgain $r 3 5000\
mppurge pleebo\
endif\
", 
               MudProgType = "act_prog", 
            }, 
            [8] = 
            {
               Arguments = "Sleejat", 
               Code = "if name($n) == Sleejat\
mpwithdraw 40000\
drop 40000 credits\
say Excellent work!!\
mpgain $r 3 35000\
mppurge sleejat\
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
            [25] = "NoKill", 
            [30] = "Prototype", 
         }, 
         Credits = 0, 
         ArmorClass = 75, 
      }, 
      [10210] = 
      {
         Name = "the day clerk albert clinworth", 
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
         Immune = 
         {
            [22] = "steal", 
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
         Vnum = 10210, 
         Resistant = 
         {
            [13] = "nonmagic", 
         }, 
         LongDescr = "The day clerk waits here.\
", 
         NumberOfAttacks = 0, 
         Level = 50, 
         Description = "This human has black hair, left long and combed over from one side to the\
other. The bare forehead hints at balding. Middle-aged, slightly glazed\
grey eyes stare out over a flat nose and a double-chin.  His elbow joints\
are overlapped with fat, and the seems of his shirt are stretching.  \
", 
         Damage = 
         {
            DamNoDice = 5, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         ShortDescr = "the clerk", 
         DamRoll = 10, 
         Height = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "9", 
               Code = "mpgoto 10241 \
mpecho The day clerk arrives from the north. \
mpecho He takes up position. \
", 
               MudProgType = "time_prog", 
            }, 
            [2] = 
            {
               Arguments = "21", 
               Code = "mpecho The day clerk waddles out of the room. \
mpgoto 10253 \
", 
               MudProgType = "time_prog", 
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
      [10211] = 
      {
         Name = "the night clerk nathan pennington", 
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
         Vnum = 10211, 
         Race = "Human", 
         LongDescr = "The night clerk waits here.\
", 
         NumberOfAttacks = 0, 
         Level = 1, 
         Description = "Brown hair has been cropped short over a clean forehead. Brown eyes stare\
out over a clean, edged chin. tall, thin and strong, he looks like he is\
from a military recruitment poster.  \
", 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         ShortDescr = "the night clerk", 
         DamRoll = 0, 
         Height = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "21", 
               Code = "mpgoto 10241 \
mpecho An employee arrives from the south. \
mpecho The night clerk takes up position in the warehouse. \
", 
               MudProgType = "time_prog", 
            }, 
            [2] = 
            {
               Arguments = "9 ", 
               Code = "mpecho The night clerk leaves north. \
mpgoto 10253 \
", 
               MudProgType = "time_prog", 
            }, 
         }, 
         Position = "standing", 
         Credits = 0, 
         ArmorClass = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
      }, 
      [10299] = 
      {
         Name = "dud", 
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
         Vnum = 10299, 
         LongDescr = "Some god abandoned a newly created dud here.\
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
         ShortDescr = "a newly created dud", 
         DamRoll = 0, 
         Height = 0, 
         Race = "Human", 
         Position = "standing", 
         Credits = 0, 
         ArmorClass = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
      }, 
      [10245] = 
      {
         Name = "mr obliki mister", 
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
            HitNoDice = 2, 
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
         HitRoll = 2, 
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
         Vnum = 10245, 
         Race = "Human", 
         LongDescr = "Mr Obliki is standing here, waiting for a bodyguard.\
", 
         NumberOfAttacks = 0, 
         Level = 10, 
         Description = "", 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         ShortDescr = "Mr Obliki", 
         DamRoll = 2, 
         Height = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               Code = "if ovnumhere(26064) >= 1\
Say Thank you $r! I can't thank you enough!\
mpwithdraw 2000\
give 2000 credits $r\
mpgain $r 5 1000\
follow self\
mpecho Mr Obliki completes his buisness and leaves the room.\
mpgoto 10245\
endif\
", 
               MudProgType = "entry_prog", 
            }, 
            [2] = 
            {
               Arguments = "turnstile", 
               Code = "mpwithdraw 5\
give 5 credits droid\
", 
               MudProgType = "act_prog", 
            }, 
            [3] = 
            {
               Arguments = "turbocar", 
               Code = "board turbocar\
", 
               MudProgType = "act_prog", 
            }, 
            [4] = 
            {
               Arguments = "exits", 
               Code = "leave\
", 
               MudProgType = "act_prog", 
            }, 
            [5] = 
            {
               Arguments = "yes", 
               Code = "say Thank you! There are many people who hate me \
say in this city, so you may need to rescue me from\
say time to time.\
follow $n\
", 
               MudProgType = "speech_prog", 
            }, 
            [6] = 
            {
               Arguments = "hello hi", 
               Code = "say Could you take me to the Hutt inside the\
say Plaza Reception Building in the Southwest\
say Corner of Monument Plaza?\
", 
               MudProgType = "speech_prog", 
            }, 
         }, 
         Position = "standing", 
         Credits = 0, 
         ArmorClass = 75, 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
      }, 
      [10248] = 
      {
         Name = "Riiice Representative", 
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
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [3] = "DetectInvis", 
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
         Vnum = 10248, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         LongDescr = "A riiice representative is here, looking for help.\
", 
         NumberOfAttacks = 0, 
         Level = 1, 
         Description = "A small man, he stands here with his hands in his pockets, inquiring\
everyone who enters the Service shop if they would like to help him out in\
his duties. He has lists to offer anyone that would like it. \
", 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         ShortDescr = "a riiice representative", 
         DamRoll = 0, 
         Height = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "no", 
               Code = "say Then someone else will.\
shrug\
", 
               MudProgType = "speech_prog", 
            }, 
            [2] = 
            {
               Arguments = "diskstolen", 
               Code = "if ovnuminv(10598) >= 1\
grin\
thank $n\
mpwithdraw 3000\
give 3000 credits $n\
mpgain $n 4 1000000\
else\
say This isn't what I was looking for, but thanks.\
endif\
mpat 10299 drop all\
mpat 10299 mppurge\
", 
               MudProgType = "give_prog", 
            }, 
            [3] = 
            {
               Arguments = "100", 
               Code = "say Would you be willing to help me?\
", 
               MudProgType = "greet_prog", 
            }, 
            [4] = 
            {
               Arguments = "yes", 
               Code = "mpoload 10248 1\
give list $n\
smile\
", 
               MudProgType = "speech_prog", 
            }, 
         }, 
         Position = "standing", 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         Credits = 0, 
         ArmorClass = 0, 
      }, 
      [10247] = 
      {
         Name = "female accountant", 
         Sex = "undistinguished", 
         Weight = 0, 
         Alignment = 20, 
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
         Vnum = 10247, 
         Race = "Human", 
         LongDescr = "A female accountant is here, trying to figure out what she lost.\
", 
         NumberOfAttacks = 0, 
         Level = 20, 
         Description = "This small lady is here, frantically looking through her briefcase and\
other containers for some investment reports that she had lost. Helping\
her out would be a nice thing to do. \
", 
         Damage = 
         {
            DamNoDice = 2, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         ShortDescr = "a female accountant", 
         DamRoll = 4, 
         Height = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               Code = "say Damnit! I left my employer's investment reports\
say at the Hardware shop on Kuat after I purchased his\
say new parts for his ship!\
curse\
say I'd pay tons to whomever brought those back...\
", 
               MudProgType = "greet_prog", 
            }, 
            [2] = 
            {
               Arguments = "reportinvestment", 
               Code = "if ovnuminv(23098) >= 1\
giggle\
hug $n\
mpwithdraw 3000\
give 3000 credits $n\
mpgain $n 5 100000\
mpat 10299 drop all\
mpat 10299 mppurge\
", 
               MudProgType = "give_prog", 
            }, 
         }, 
         Position = "standing", 
         Credits = 0, 
         ArmorClass = 50, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
      }, 
      [10200] = 
      {
         Name = "dud", 
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
         Vnum = 10200, 
         LongDescr = "Some god abandoned a newly created dud here.\
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
         ShortDescr = "a newly created dud", 
         DamRoll = 0, 
         Height = 0, 
         Race = "Human", 
         Position = "standing", 
         Credits = 0, 
         ArmorClass = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
      }, 
      [10201] = 
      {
         Name = "clerk", 
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
            HitNoDice = 2, 
            HitSizeDice = 10, 
            HitPlus = 100, 
         }, 
         AffectedBy = 
         {
            [3] = "DetectInvis", 
         }, 
         HitRoll = 2, 
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
         Vnum = 10201, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         LongDescr = "A clerk sits at his desk.\
", 
         NumberOfAttacks = 0, 
         Level = 10, 
         Description = "", 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         ShortDescr = "a clerk", 
         DamRoll = 2, 
         Height = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "holovid", 
               Code = "if ovnuminv(10201) >= 1\
say Thank you, good work $n.\
mpwithdraw 100\
give 100 credits $n\
mpgain $n 4 1000\
else\
say hmm.. Thanks, but that wasn't quite what i was looking for.\
endif\
mpat 10299 drop all\
mpat 10299 mppurge\
", 
               MudProgType = "act_prog", 
            }, 
            [2] = 
            {
               Arguments = "engagement", 
               Code = "if ovnuminv(10203) >= 1\
say Thank you, good work $n.\
mpwithdraw 100\
give 100 credits $n\
mpgain $n 4 1000\
else\
say hmm.. Thanks, but that wasn't quite what i was looking for.\
endif\
mpat 10299 drop all\
mpat 10299 mppurge\
", 
               MudProgType = "act_prog", 
            }, 
         }, 
         Position = "standing", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [30] = "Prototype", 
         }, 
         Credits = 0, 
         ArmorClass = 75, 
      }, 
      [10202] = 
      {
         Name = "Loba Slo Ti", 
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
         Vnum = 10202, 
         LongDescr = "Loba Slo Ti is a middle aged verine woman.\
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
         ShortDescr = "Loba Slo Ti", 
         DamRoll = 1, 
         Height = 0, 
         Race = "Human", 
         Position = "standing", 
         Credits = 0, 
         ArmorClass = 87, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
      }, 
      [10203] = 
      {
         Name = "child kid", 
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
         Vnum = 10203, 
         Race = "Human", 
         LongDescr = "A child is upset about something.\
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
         ShortDescr = "a child", 
         DamRoll = 0, 
         Height = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "lucky ", 
               Code = "get lucky\
if ovnuminv(10205) >= 1\
say Thank You!\
hug $n\
mpgain $n 5 50000\
else\
say I lost my luck penny in the pool\
endif\
mpat 10299 drop all\
mpat 10299 mppurge\
", 
               MudProgType = "act_prog", 
            }, 
            [2] = 
            {
               Arguments = "50", 
               Code = "snif\
say I drooped my lucky penny in the pool\
look $n\
say Could you get it for me?\
", 
               MudProgType = "all_greet_prog", 
            }, 
         }, 
         Position = "standing", 
         Credits = 0, 
         ArmorClass = 95, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
      }, 
      [10204] = 
      {
         Name = "quarren life guard", 
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
         AffectedBy = 
         {
            [22] = "TrueSight", 
         }, 
         HitRoll = 4, 
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
         Vnum = 10204, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         LongDescr = "A quarren life guard patrols the pool.\
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
         ShortDescr = "a quarren lifeguard", 
         DamRoll = 4, 
         Height = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "stunned,", 
               Code = "aid $n\
mprestore $n 200\
aid $n\
mpechoat $n A life guard gives you CPR and pulls you out of the water.\
mpechoaround $n A life guard gives $n CPR and pulls them out of the water.\
mptransfer $n 10229\
", 
               MudProgType = "act_prog", 
            }, 
         }, 
         Position = "standing", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Credits = 0, 
         ArmorClass = 50, 
      }, 
      [10205] = 
      {
         Name = "weight trainer", 
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
         Vnum = 10205, 
         LongDescr = "A weight trainer offers advice on training.\
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
         ShortDescr = "the weight trainer", 
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
            [9] = "Train", 
            [30] = "Prototype", 
         }, 
      }, 
      [10206] = 
      {
         Name = "aerobics trainer", 
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
         Vnum = 10206, 
         LongDescr = "A wisened old woman stands here waiting to teach you. \
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
         ShortDescr = "An aerobics trainer", 
         DamRoll = 0, 
         Height = 0, 
         Race = "Human", 
         Position = "standing", 
         Credits = 0, 
         ArmorClass = 50, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [9] = "Train", 
            [30] = "Prototype", 
         }, 
      }, 
      [10207] = 
      {
         Name = "Mrs Kooos", 
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
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [3] = "DetectInvis", 
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
         Vnum = 10207, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         LongDescr = "Mrs Kooos is looking for assistance.\
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
         ShortDescr = "Mrs Kooos", 
         DamRoll = 0, 
         Height = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "add hello hi", 
               Code = "say Hello, would you take me to the botanical gardens please?\
", 
               MudProgType = "speech_prog", 
            }, 
            [2] = 
            {
               Arguments = "add yes sure", 
               Code = "say Are you talking to me?\
say My name is Mrs Kooos\
", 
               MudProgType = "speech_prog", 
            }, 
            [3] = 
            {
               Arguments = "add kooos kooos.", 
               Code = "say You will take me to the Gardens?\
say Oh, Thank You $n!\
follow $n\
", 
               MudProgType = "speech_prog", 
            }, 
            [4] = 
            {
               Arguments = "turnstile.", 
               Code = "mpwithdraw 5\
give 5 credits droid\
", 
               MudProgType = "act_prog", 
            }, 
            [5] = 
            {
               Arguments = "turbocar.", 
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
               Code = "if ovnumhere(10207) >= 1\
Say Thank you $r. I really apreciate your help.\
mpwithdraw 1000\
give 1000 credits $r\
mpgain $r 5 2000\
follow self\
mpecho Mrs Kooos enters the gardens.\
mpgoto 10239\
endif\
", 
               MudProgType = "entry_prog", 
            }, 
         }, 
         Position = "standing", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         Credits = 0, 
         ArmorClass = 90, 
      }, 
   }, 
   ResetMessage = "", 
   Resets = 
   {
      [1] = 
      {
         Command = "O", 
         MiscData = 1, 
         Arg3 = 10217, 
         Arg1 = 10201, 
         Arg2 = 1, 
      }, 
      [2] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10210, 
         Arg1 = 10201, 
         Arg2 = 1, 
      }, 
      [3] = 
      {
         Command = "O", 
         MiscData = 1, 
         Arg3 = 10210, 
         Arg1 = 10202, 
         Arg2 = 1, 
      }, 
      [4] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10218, 
         Arg1 = 10202, 
         Arg2 = 1, 
      }, 
      [5] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 1, 
         Arg1 = 10203, 
         Arg2 = 1, 
      }, 
      [6] = 
      {
         Command = "O", 
         MiscData = 1, 
         Arg3 = 10238, 
         Arg1 = 10205, 
         Arg2 = 1, 
      }, 
      [7] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10230, 
         Arg1 = 10203, 
         Arg2 = 1, 
      }, 
      [8] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10233, 
         Arg1 = 10204, 
         Arg2 = 3, 
      }, 
      [9] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10233, 
         Arg1 = 10204, 
         Arg2 = 3, 
      }, 
      [10] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10233, 
         Arg1 = 10204, 
         Arg2 = 3, 
      }, 
      [11] = 
      {
         Command = "O", 
         MiscData = 1, 
         Arg3 = 10229, 
         Arg1 = 10206, 
         Arg2 = 1, 
      }, 
      [12] = 
      {
         Command = "O", 
         MiscData = 1, 
         Arg3 = 10229, 
         Arg1 = 10204, 
         Arg2 = 1, 
      }, 
      [13] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10227, 
         Arg1 = 10205, 
         Arg2 = 1, 
      }, 
      [14] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10239, 
         Arg1 = 10207, 
         Arg2 = 1, 
      }, 
      [15] = 
      {
         Command = "O", 
         MiscData = 1, 
         Arg3 = 10250, 
         Arg1 = 10207, 
         Arg2 = 1, 
      }, 
      [16] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10221, 
         Arg1 = 10208, 
         Arg2 = 1, 
      }, 
      [17] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg1 = 10209, 
         Arg2 = 1, 
      }, 
      [18] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 13, 
         Arg1 = 10204, 
         Arg2 = 1, 
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
         Command = "G", 
         MiscData = 1, 
         Arg1 = 32280, 
         Arg2 = 1, 
      }, 
      [21] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg1 = 32234, 
         Arg2 = 1, 
      }, 
      [22] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10228, 
         Arg1 = 10206, 
         Arg2 = 1, 
      }, 
      [23] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg1 = 10217, 
         Arg2 = 1, 
      }, 
      [24] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10244, 
         Arg1 = 10209, 
         Arg2 = 1, 
      }, 
      [25] = 
      {
         Command = "O", 
         MiscData = 1, 
         Arg3 = 10244, 
         Arg1 = 10211, 
         Arg2 = 1, 
      }, 
      [26] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10240, 
         Arg1 = 11109, 
         Arg2 = 1, 
      }, 
      [27] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10253, 
         Arg1 = 10211, 
         Arg2 = 1, 
      }, 
      [28] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 3, 
         Arg1 = 10222, 
         Arg2 = 1, 
      }, 
      [29] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 5, 
         Arg1 = 10221, 
         Arg2 = 1, 
      }, 
      [30] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10241, 
         Arg1 = 10210, 
         Arg2 = 1, 
      }, 
      [31] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 3, 
         Arg1 = 10220, 
         Arg2 = 1, 
      }, 
      [32] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg3 = 5, 
         Arg1 = 10221, 
         Arg2 = 1, 
      }, 
      [33] = 
      {
         Command = "O", 
         MiscData = 1, 
         Arg3 = 10241, 
         Arg1 = 10208, 
         Arg2 = 1, 
      }, 
      [34] = 
      {
         Command = "O", 
         MiscData = 1, 
         Arg3 = 10203, 
         Arg1 = 10248, 
         Arg2 = 1, 
      }, 
      [35] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10245, 
         Arg1 = 10245, 
         Arg2 = 1, 
      }, 
      [36] = 
      {
         Command = "O", 
         MiscData = 1, 
         Arg3 = 10207, 
         Arg1 = 10248, 
         Arg2 = 1, 
      }, 
      [37] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10247, 
         Arg1 = 10247, 
         Arg2 = 1, 
      }, 
      [38] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10248, 
         Arg1 = 10248, 
         Arg2 = 1, 
      }, 
      [39] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg1 = 10248, 
         Arg2 = 1, 
      }, 
   }, 
   Author = "Durga", 
   VnumRanges = 
   {
      Mob = 
      {
         Last = 10299, 
         First = 10200, 
      }, 
      Room = 
      {
         Last = 10299, 
         First = 10200, 
      }, 
      Object = 
      {
         Last = 10299, 
         First = 10200, 
      }, 
   }, 
   Objects = 
   {
      [10208] = 
      {
         Name = "package to diktat on corellia", 
         Vnum = 10208, 
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
         Description = "This package is addressed to the Diktat on Corellia", 
         ShortDescr = "a package addressed to the Diktat on Corellia", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         Weight = 1, 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ItemType = "container", 
      }, 
      [10209] = 
      {
         Name = "scuba mask", 
         Vnum = 10209, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 10, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Layers = 0, 
         Description = "A scuba mask could help out in the ocean or a pool.", 
         Weight = 1, 
         ShortDescr = "a scuba mask", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 200, 
         Affects = 
         {
            [1] = 
            {
               Location = 26, 
               Modifier = -2147483648, 
            }, 
         }, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
            [4] = "Head", 
         }, 
         ItemType = "armor", 
      }, 
      [10210] = 
      {
         Name = "package to captain harlef", 
         Vnum = 10210, 
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
         Description = "This package is addressed to Captain Harlef.", 
         ShortDescr = "a package to captain harlef", 
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
         ItemType = "container", 
      }, 
      [10211] = 
      {
         Name = "list of local bounties", 
         Vnum = 10211, 
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
         Description = "A list of local bounties is here.", 
         ShortDescr = "a list of local bounties", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "l li lis list", 
               Description = "Toodan      1000 credits\
\13Noktok      2000 credits\
\13Pleebo      5000 credits - no disintigrations\
\13Sleejat    10000 credits alive, 1000 dead\
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
      [10212] = 
      {
         Name = "the body of Toodan", 
         Vnum = 10212, 
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
         Description = "The body of todan lies here.", 
         ShortDescr = "the corpse of Toodan", 
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
      [10213] = 
      {
         Name = "the body of Noktok", 
         Vnum = 10213, 
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
         Description = "A the body of Noktok is here.", 
         ShortDescr = "the corpse of Noktok", 
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
      [10214] = 
      {
         Name = "the corpse of Pleebo", 
         Vnum = 10214, 
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
         Description = "A the corpse of Pleebo is here.", 
         ShortDescr = "the corpse of Pleebo", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         Weight = 400, 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ItemType = "trash", 
      }, 
      [10215] = 
      {
         Name = "the corpse of Pleebo", 
         Vnum = 10215, 
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
         Description = "A the corpse of Pleebo is here.", 
         ShortDescr = "ooops", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         Weight = 1, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ItemType = "trash", 
      }, 
      [10216] = 
      {
         Name = "the corpse of Sleejat", 
         Vnum = 10216, 
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
         Description = "A the corpse of Sleejat is here.", 
         ShortDescr = "the corpse of Sleejat", 
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
      [10217] = 
      {
         Name = "film", 
         Vnum = 10217, 
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
         Description = "Undeveloped film has been dropped here", 
         ShortDescr = "undeveloped film", 
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
      [10218] = 
      {
         Name = "pictures", 
         Vnum = 10218, 
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
         Description = "A bunch of pictures have been dropped here", 
         ShortDescr = "pictures", 
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
      [10220] = 
      {
         Name = "nametag", 
         Vnum = 10220, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Layers = 128, 
         Description = "A nametag with 'Albert Clinworth'", 
         ShortDescr = "a nametag saying 'Albert Clinworth' ", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         Weight = 1, 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
         }, 
         ItemType = "armor", 
      }, 
      [10221] = 
      {
         Name = "the standard lightspeed uniform", 
         Vnum = 10221, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         Layers = 0, 
         Description = "A standard lightspeed uniform", 
         ShortDescr = "a standard lightspeed uniform", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         Weight = 1, 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
            [3] = "Body", 
         }, 
         ItemType = "armor", 
      }, 
      [10222] = 
      {
         Name = "a nametag saying 'nathan pennington'", 
         Vnum = 10222, 
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
         Description = "A nametag labeled 'Nathan Pennington'", 
         ShortDescr = "A nametag labeled 'Nathan Pennington'", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         Weight = 1, 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
         }, 
         ItemType = "armor", 
      }, 
      [10299] = 
      {
         Name = "dud", 
         Vnum = 10299, 
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
         Description = "Mordecai is looking really hard for this broken lightsaber.", 
         ShortDescr = "a broken lightsaber", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
            [25] = "Hidden", 
         }, 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
         ItemType = "trash", 
      }, 
      [10248] = 
      {
         Name = "list", 
         Vnum = 10248, 
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
         Description = "A list is here, with some writing on it.", 
         ShortDescr = "the job's list", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "list", 
               Description = "Riiice Spy Service Jobs: \
\13 \
\13    Deliver the Spy Reports to Dundil on Tatooine\
\13    Obtain the stolen disk from the bandits on Corellia\
\13", 
            }, 
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
      [10200] = 
      {
         Name = "dud", 
         Vnum = 10200, 
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
         Description = "Some god dropped a newly created dud here.", 
         ShortDescr = "a newly created dud", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
         ItemType = "trash", 
      }, 
      [10201] = 
      {
         Name = "holovid projector", 
         Vnum = 10201, 
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
         Description = "A holovid projector is sitting on the floor.", 
         ShortDescr = "a holovid projector", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 200, 
         Weight = 5, 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ItemType = "furniture", 
      }, 
      [10202] = 
      {
         Name = "list", 
         Vnum = 10202, 
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
         Description = "A list of repo jobs hangs on the wall.", 
         ShortDescr = "a newly created list", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "l li lis list", 
               Description = "Currently wanted for reposession:\
\13 \
\0131. A holovid projector (from: Drugaax Newhon who lives in an apartment one\
\13level down from here)\
\13 \
\0132. An engagement ring (from Loba Slo Ti who lives in the same building as\
\13Drugaax)\
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
         ItemType = "furniture", 
      }, 
      [10203] = 
      {
         Name = "egagement ring", 
         Vnum = 10203, 
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
         Description = "Theres something shiney here.", 
         ShortDescr = "an engagement ring", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 200, 
         Weight = 1, 
         ActionDescription = "", 
         WearFlags = 
         {
            [1] = "Finger", 
            [0] = "Take", 
         }, 
         ItemType = "armor", 
      }, 
      [10204] = 
      {
         Name = "Personal Floatation Device", 
         Vnum = 10204, 
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
         Description = "A Personal Floatation Device could save you from drowning.", 
         ShortDescr = "a Personal Floatation Device", 
         Cost = 0, 
         ExtraDescriptions = 
         {
         }, 
         Affects = 
         {
            [1] = 
            {
               Location = 26, 
               Modifier = 2097152, 
            }, 
         }, 
         Weight = 1, 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
            [11] = "Waist", 
         }, 
         ItemType = "armor", 
      }, 
      [10205] = 
      {
         Name = "lucky coin", 
         Vnum = 10205, 
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
         Description = "Someone dropped their lucky coin here.", 
         Weight = 1, 
         ShortDescr = "lucky coin", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 1, 
         Affects = 
         {
            [1] = 
            {
               Location = 31, 
               Modifier = 1, 
            }, 
         }, 
         Flags = 
         {
            [25] = "Hidden", 
         }, 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ItemType = "treasure", 
      }, 
      [10206] = 
      {
         Name = "sign", 
         Vnum = 10206, 
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
         Description = "&RA sign hangs on the wall&w", 
         ShortDescr = "a sign", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "s si sig sign", 
               Description = "Unless you are a very strong swimmer or have the proper gear stay out of\
\13the water. Drowning is a horrible way to die.\
\13", 
            }, 
         }, 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
         ItemType = "furniture", 
      }, 
      [10207] = 
      {
         Name = "climate control monitor", 
         Vnum = 10207, 
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
         Description = "A climate control monitor is mounted on the wall here.", 
         ShortDescr = "a monitor", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
         ItemType = "furniture", 
      }, 
   }, 
   Filename = "corus_pt2.lua", 
   Rooms = 
   {
      [10240] = 
      {
         Name = "Loooen Escort Service", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "Clients come here to look for an escort. Often to show them around the city\
or take them somewhere specific. If you wish to to help one of them out\
talk to them and see what it is exactly they are asking for and then offer\
your help.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10239, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10240, 
         TeleDelay = 0, 
      }, 
      [10241] = 
      {
         Name = "Lightspeed Courier", 
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
         Description = "This courier service hires pilots to deliver packages for a fee. They are\
all COD so that any packages you take will be paid for on their successful\
delivery. \
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10205, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10241, 
         TeleDelay = 0, 
      }, 
      [10242] = 
      {
         Name = "Step One Transportation", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "This is another Transportation service on the Menari Spaceport. These\
packages have been left over from the normal shipments because of their\
out of the way delivery locations. Many different people come to these\
transportation services looking for odd jobs to fulfill, such as these. \
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10209, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10242, 
         TeleDelay = 0, 
      }, 
      [10243] = 
      {
         Name = "Rooodan Recovery Service", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10209, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10243, 
         TeleDelay = 0, 
      }, 
      [10244] = 
      {
         Name = "Coruscant Office of the Hunters Guild", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [26] = "Factory", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "This small office offers local hunting jobs. To collect the bounty bring\
the offender back to the office or his corpse. If you wish to post a\
bounty you'll have to do so at the bounty hunters guild. (on Tatooine)\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 303, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10244, 
         TeleDelay = 0, 
      }, 
      [10245] = 
      {
         Name = "Bigger Bodyguards", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "This is the Bigger Bodyguard's Employment Center located in the Menari\
Spaceport. There are a few people sitting here, on benches or in chairs,\
for they are all waiting for some brave soul to escort them to their\
desired location, unharmed if possible. \
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10206, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10245, 
         TeleDelay = 0, 
      }, 
      [10246] = 
      {
         Name = "Freelance Technicians Cooperative", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
            [3] = "Indoors", 
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
               DestinationVnum = 10207, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10246, 
         TeleDelay = 0, 
      }, 
      [10247] = 
      {
         Name = "Accounting Solutions", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "This is the Accounting Solutions organization on the Menari Spaceport. A\
single lady sits here at her desk, punching some buttons on a calculator\
and trying to figure out some mathematics. This room is much smaller than\
the other rooms on this hallway, and you figure that this business isn't\
very profitable.  \
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10207, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10247, 
         TeleDelay = 0, 
      }, 
      [10248] = 
      {
         Name = "Riiice Spy Service", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "This is the Riiice Spy Service corperation on the Menari Spaceport\
Employment Center. There is a single man here, wearing some dark garb and\
a black hood. He is asking men and women if they would please deliver the\
espionage reports to his friends or if they would recover the stolen disk\
from his enemies. \
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10208, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10248, 
         TeleDelay = 0, 
      }, 
      [10249] = 
      {
         Name = "Millenium Messenger Service", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
            [3] = "Indoors", 
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
               DestinationVnum = 10208, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10249, 
         TeleDelay = 0, 
      }, 
      [10250] = 
      {
         Name = "Entrance To SkYdome Botanical Gardens", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Tunnel = 2, 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 315, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10250, 
         TeleDelay = 0, 
      }, 
      [10251] = 
      {
         Name = "Automated Bank Teller", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [8] = "Bank", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "This small corner houses a couple wall mounted instant banking machines.\
They are hooked up via a semi-secure network to most of the galaxy's major\
banks. To use them use the \"bank\" command. \
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 304, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10251, 
         TeleDelay = 0, 
      }, 
      [10252] = 
      {
         Name = "A Public Landing Pad", 
         Vnum = 10252, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "A simple open space, this space port provides none of the glamour of the\
Manarai one. Any public ship is free to land, but taxes are still taken\
once you leave your ship. The ugly backsides of buildings enclose the area\
and almost give a sensation of claustrophobia.  The Imperial City is to\
the south. \
", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10200, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [10253] = 
      {
         Name = "Courier waiting room", 
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
         Vnum = 10253, 
         TeleDelay = 0, 
      }, 
      [10254] = 
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
         Vnum = 10254, 
         TeleDelay = 0, 
      }, 
      [10255] = 
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
         Vnum = 10255, 
         TeleDelay = 0, 
      }, 
      [10256] = 
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
         Vnum = 10256, 
         TeleDelay = 0, 
      }, 
      [10257] = 
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
         Vnum = 10257, 
         TeleDelay = 0, 
      }, 
      [10258] = 
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
         Vnum = 10258, 
         TeleDelay = 0, 
      }, 
      [10259] = 
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
         Vnum = 10259, 
         TeleDelay = 0, 
      }, 
      [10260] = 
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
         Vnum = 10260, 
         TeleDelay = 0, 
      }, 
      [10299] = 
      {
         Name = "THIS ROOM IS USED BY A MOB PROG DO NOT REMOVE", 
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
               Arguments = "purge", 
               Code = "mppurge $n\
", 
               MudProgType = "speech_prog", 
            }, 
         }, 
         Exits = 
         {
         }, 
         Vnum = 10299, 
         TeleDelay = 0, 
      }, 
      [10200] = 
      {
         Name = "Spaceport Speeder Rentals", 
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
         Description = "This small speeder rental lot looks like it loses a lot more money than it\
makes. The security here is terrible. You could probably just hop into one\
of the speeders and drive off without anyone even noticing.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 308, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10200, 
         TeleDelay = 0, 
      }, 
      [10201] = 
      {
         Name = "Employment Opportunities", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "This is the main entrance to the employment opportunities building. Inside\
many temp jobs are available for anyone who is willing to take them. They\
are all based solely on commission and paid when the work is completed.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 304, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10202, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10201, 
         TeleDelay = 0, 
      }, 
      [10202] = 
      {
         Name = "Lobby", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "The lobby of the building is relatively plain. There are several chairs and\
a few magazine racks at one side. An information desk is at the other. The\
computer terminal in the center of the room is a galactic employment\
terminal that allows job posting for positions in other locations. It also\
provides opportunity for prospective employees to post resumes.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10201, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10203, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10202, 
         TeleDelay = 0, 
      }, 
      [10203] = 
      {
         Name = "A Hallway", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "This hallway is plain, consisting of a dull tiled floor and simple\
patterened wallpaper. The glow panels on the ceiling are a little too\
bright, causing you to feel a little on edge.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10202, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10204, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10206, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10203, 
         TeleDelay = 0, 
      }, 
      [10204] = 
      {
         Name = "A Hallway", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "This hallway is plain, consisting of a dull tiled floor and simple\
patterened wallpaper. The glow panels on the ceiling are a little too\
bright, causing you to feel a little on edge.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10239, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10205, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10203, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10204, 
         TeleDelay = 0, 
      }, 
      [10205] = 
      {
         Name = "A Hallway", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "This hallway is plain, consisting of a dull tiled floor and simple\
patterened wallpaper. The glow panels on the ceiling are a little too\
bright, causing you to feel a little on edge.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10209, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10241, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10204, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10205, 
         TeleDelay = 0, 
      }, 
      [10206] = 
      {
         Name = "A Hallway", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "This hallway is plain, consisting of a dull tiled floor and simple\
patterened wallpaper. The glow panels on the ceiling are a little too\
bright, causing you to feel a little on edge.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10203, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10245, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10207, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10206, 
         TeleDelay = 0, 
      }, 
      [10207] = 
      {
         Name = "A Hallway", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "This hallway is plain, consisting of a dull tiled floor and simple\
patterened wallpaper. The glow panels on the ceiling are a little too\
bright, causing you to feel a little on edge.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10247, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10206, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10246, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10208, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10207, 
         TeleDelay = 0, 
      }, 
      [10208] = 
      {
         Name = "A Hallway", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "This hallway is plain, consisting of a dull tiled floor and simple\
patterened wallpaper. The glow panels on the ceiling are a little too\
bright, causing you to feel a little on edge.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10248, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10207, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10249, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10208, 
         TeleDelay = 0, 
      }, 
      [10209] = 
      {
         Name = "A Hallway", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "This hallway is plain, consisting of a dull tiled floor and simple\
patterened wallpaper. The glow panels on the ceiling are a little too\
bright, causing you to feel a little on edge.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10243, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10242, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10205, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10209, 
         TeleDelay = 0, 
      }, 
      [10210] = 
      {
         Name = "Ruuahros Reposessions Inc", 
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
         Description = "This office is a small contract repo company. The company hires freelance\
citizens to reposses items for their clients. If you don't have a job you\
might be able to make a few credits here. Look at the list to see what\
jobs are available. \
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 329, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10210, 
         TeleDelay = 0, 
      }, 
      [10211] = 
      {
         Name = "An Apartment Building", 
         Sector = "city", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "l li lis list", 
               Description = "1. Druugaax Newhon\
\0132. Beena Todddd\
\0133. Treeg Treeg\
\0134. Loraaaaf\
\0135. Noon Im Nooga Lol\
\0136. Plubo Nu\
\0137.\
\0138. Loba Slo Ti\
\13", 
            }, 
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "The apartment building lobby is small and smells of tobacco and booze. The\
paint on the walls is slowly peeling off and the floor is stained. A\
tenant \"list\" on the wall shows who lives here.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 335, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "northwest", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10212, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10211, 
         TeleDelay = 0, 
      }, 
      [10212] = 
      {
         Name = "A Hallway", 
         Vnum = 10212, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "This run-down apartment building is dirty and is filled with a foul stench.\
The walls are covered in grafitti. You can think of many nicer places to\
live. \
", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10213, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10214, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "southeast", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10211, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [10213] = 
      {
         Name = "A Hallway", 
         Vnum = 10213, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "This run-down apartment building is dirty and is filled with a foul stench.\
The walls are covered in grafitti. You can think of many nicer places to\
live. \
", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10216, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10212, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10218, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [10214] = 
      {
         Name = "A Hallway", 
         Vnum = 10214, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "This run-down apartment building is dirty and is filled with a foul stench.\
The walls are covered in grafitti. You can think of many nicer places to\
live.\
", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10212, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10215, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [10215] = 
      {
         Name = "A Hallway", 
         Vnum = 10215, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "This run-down apartment building is dirty and is filled with a foul stench.\
The walls are covered in grafitti. You can think of many nicer places to\
live.\
", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10214, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10217, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [10216] = 
      {
         Name = "A Hallway", 
         Vnum = 10216, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "This run-down apartment building is dirty and is filled with a foul stench.\
The walls are covered in grafitti. You can think of many nicer places to\
live. \
", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10213, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [10217] = 
      {
         Name = "A Small Apartment", 
         Vnum = 10217, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "This small messy apartment smells strongly of spice. It is cluttered with\
boxes and empty cartons. A large stack of unwashed dishes sits by the\
sink.\
", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10215, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [10218] = 
      {
         Name = "An Apartment", 
         Vnum = 10218, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "This small apartment is relatively well kept in contrast with the rest of\
the building. There is a faint smell of incense.\
", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10213, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [10219] = 
      {
         Name = "Gamaak Fitness Center", 
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
         Description = "The Gamaak Fitness Center is a nice building, with a high ceiling and large\
windows.  The lobby is brightly lit and several plants decorate it.\
However, the distinct smell of sweat and the mixed body odors of a hundred\
different races distracts greatly from the buildings aesthetics; unless,\
of course, you are one of the many Plutinaax, who come here because they\
enjoy that sort of thing. \
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 302, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10220, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "down", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10223, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10219, 
         TeleDelay = 0, 
      }, 
      [10220] = 
      {
         Name = "Lounge", 
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
         Description = "The lounge consists of several comfortable chairs and tables. There is a\
large window overlooking the pool below. \
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10219, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10221, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10229, 
               Flags = 
               {
                  [25] = "Window", 
               }, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10222, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10220, 
         TeleDelay = 0, 
      }, 
      [10221] = 
      {
         Name = "Pro-Shop", 
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
         Description = "The pro shop is stocked with a good assortment of sporting and fitness\
equipment. The room is arranged logically by the season and main elements\
of the sport. There are also a few fitness books and magazines for sale.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10220, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10221, 
         TeleDelay = 0, 
      }, 
      [10222] = 
      {
         Name = "Health Bar", 
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
         Description = "This small cafeteria, as the name would suggest, sells healthy and\
nutritious food for humans and several other species. A few of the food\
and drink items also boost performance.  As to whether they actually work\
or not, the proprietors have no comment.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10220, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10222, 
         TeleDelay = 0, 
      }, 
      [10223] = 
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
         Description = "The air down here smells strongly of sweat.  It is very moist from the pool\
and showers.  The sounds of exercise equipment and the clanging of weights\
fill the hallway. \
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 481, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 482, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10226, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10225, 
               Keyword = "", 
               Description = "", 
            }, 
            [5] = 
            {
               Direction = "up", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10219, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10223, 
         TeleDelay = 0, 
      }, 
      [10224] = 
      {
         Name = "Mens Locker Room", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "The locker room is pretty standard fare for gyms on mostly human planets.\
Rows of lockers fill the walls while benches fill the center of the room.\
Public and private showers are located at the very end of the room as well\
as a small toilet room.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10223, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10224, 
         TeleDelay = 0, 
      }, 
      [10225] = 
      {
         Name = "Women's Locker Room", 
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
         Description = "The locker room is pretty standard fare for gyms on mostly human planets.\
Rows of lockers fill the walls while benches fill the center of the room.\
Public and private showers are located at the very end of the room as well\
as a small toilet room. \
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10223, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10225, 
         TeleDelay = 0, 
      }, 
      [10226] = 
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
         Description = "The air down here smells strongly of sweat and is very moist from the pool\
and showers. The sound of exercise equipment and clanging weights echoes\
along the hallway.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10223, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10227, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10229, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10228, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10226, 
         TeleDelay = 0, 
      }, 
      [10227] = 
      {
         Name = "Weight Training Room", 
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
         Description = "This room is filled with weight training devices of all shapes and sizes. \
Most look pretty straightforward, but a few baffle the mind.  A few others\
just look frightening.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10226, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10227, 
         TeleDelay = 0, 
      }, 
      [10228] = 
      {
         Name = "A Small Library", 
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
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10226, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10228, 
         TeleDelay = 0, 
      }, 
      [10229] = 
      {
         Name = "Swimming Pool Deck", 
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
         Description = "What could be more refreshing and fun than a nice swim?  Be careful though,\
as swimming can be very tiring. If you arent a good floater, it would be\
advisable to stay in the shallow end of the pool or use a flotation\
device. If you wish to dive under the water, you might wish to invest in\
some scuba gear.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10226, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "southeast", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10232, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "southwest", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10230, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "somewhere", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10233, 
               Flags = 
               {
                  [19] = "Auto", 
                  [17] = "CanEnter", 
               }, 
               Keyword = "pool", 
               Description = "", 
            }, 
         }, 
         Vnum = 10229, 
         TeleDelay = 0, 
      }, 
      [10230] = 
      {
         Name = "Swimming Pool Deck", 
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
         Description = "What could be more refreshing and fun than a nice swim?  Be careful though,\
as swimming can be very tiring. If you arent a good floater, it would be\
advisable to stay in the shallow end of the pool or use a flotation\
device. If you wish to dive under the water, you might wish to invest in\
some scuba gear. \
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "northeast", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10229, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "southeast", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10231, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "somewhere", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10236, 
               Flags = 
               {
                  [19] = "Auto", 
                  [17] = "CanEnter", 
               }, 
               Keyword = "pool", 
               Description = "", 
            }, 
         }, 
         Vnum = 10230, 
         TeleDelay = 0, 
      }, 
      [10231] = 
      {
         Name = "Swimming Pool Deck", 
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
         Description = "What could be more refreshing and fun than a nice swim?  Be careful though,\
as swimming can be very tiring. If you arent a good floater, it would be\
advisable to stay in the shallow end of the pool or use a flotation\
device. If you wish to dive under the water, you might wish to invest in\
some scuba gear.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "northeast", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10232, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "northwest", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10230, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "somewhere", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10234, 
               Flags = 
               {
                  [19] = "Auto", 
                  [17] = "CanEnter", 
               }, 
               Keyword = "pool", 
               Description = "", 
            }, 
         }, 
         Vnum = 10231, 
         TeleDelay = 0, 
      }, 
      [10232] = 
      {
         Name = "Swimming Pool Deck", 
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
         Description = "What could be more refreshing and fun than a nice swim?  Be careful though,\
as swimming can be very tiring. If you arent a good floater, it would be\
advisable to stay in the shallow end of the pool or use a flotation\
device. If you wish to dive under the water, you might wish to invest in\
some scuba gear.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "northwest", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10229, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "southwest", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10231, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "somewhere", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10236, 
               Flags = 
               {
                  [19] = "Auto", 
                  [17] = "CanEnter", 
               }, 
               Keyword = "pool", 
               Description = "", 
            }, 
         }, 
         Vnum = 10232, 
         TeleDelay = 0, 
      }, 
      [10233] = 
      {
         Name = "Shallow End of the Pool", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "This is the only part of the swimming pool where you can stand on the\
bottom with your head above water. Unless you are a very strong swimmer,\
or have a flotation device, it would be foolish to go further.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10236, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "somewhere", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10229, 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [19] = "Auto", 
               }, 
               Keyword = "deck", 
               Description = "", 
            }, 
         }, 
         Vnum = 10233, 
         TeleDelay = 0, 
      }, 
      [10234] = 
      {
         Name = "Really Deep End Of The Pool", 
         Sector = "water_swim", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "Swimming can be very tiring.  Be careful! If you wish to dive, it is\
advised that you get a diving mask before you do so.  If you feel yourself\
getting tired, exit the pool quickly.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10236, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "down", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10235, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "somewhere", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10231, 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [19] = "Auto", 
               }, 
               Keyword = "deck", 
               Description = "", 
            }, 
         }, 
         Vnum = 10234, 
         TeleDelay = 0, 
      }, 
      [10235] = 
      {
         Name = "Under Water", 
         Sector = "underwater", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "&BBeing underwater is a wonderful thing (unless of course your drowning).&w\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10237, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "up", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10234, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "down", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10238, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10235, 
         TeleDelay = 0, 
      }, 
      [10236] = 
      {
         Name = "Deep Part Of The Pool", 
         Sector = "water_swim", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "Swimming can be very tiring.  Be careful! If you wish to dive, it is\
advised that you get a diving mask before you do so.  If you feel yourself\
getting tired, exit the pool quickly.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10233, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10234, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "down", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10237, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "somewhere", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10230, 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [19] = "Auto", 
               }, 
               Keyword = "deck", 
               Description = "", 
            }, 
         }, 
         Vnum = 10236, 
         TeleDelay = 0, 
      }, 
      [10237] = 
      {
         Name = "Under Water", 
         Sector = "underwater", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "&BBeing underwater is a wonderful thing (unless of course your drowning).&w\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10235, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "up", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10236, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10237, 
         TeleDelay = 0, 
      }, 
      [10238] = 
      {
         Name = "Under Water", 
         Sector = "underwater", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "&BBeing underwater is a wonderful thing (unless of course your drowning).&w\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "up", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10235, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10238, 
         TeleDelay = 0, 
      }, 
      [10239] = 
      {
         Name = "Loooen Escort Service", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "Clients come here to look for an escort. Often to show them around the city\
or take them somewhere specific. If you wish to to help one of them out\
talk to them and see what it is exactly they are asking for and then offer\
your help.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 305, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10240, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10204, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10239, 
         TeleDelay = 0, 
      }, 
   }, 
   LowEconomy = 94359332, 
}
