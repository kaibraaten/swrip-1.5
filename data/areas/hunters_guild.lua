-- Hunters Guild
-- Last saved Sunday 31-May-2020 15:51:33

AreaEntry
{
   Mobiles = 
   {
      [6600] = 
      {
         Sex = "undistinguished", 
         Race = "Human", 
         Name = "guild registerer", 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 9, 
            DamNoDice = 3, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "' your looking for work eh.\
peer $n\
' well you might have the makings of a hunter \
' lets see what jobs we have available right now.\
", 
               MudProgType = "speech_prog", 
               Arguments = "work", 
            }, 
            [2] = 
            {
               Code = ", gets a list from under the counter.\
' hmm right now we have the following contracts.\
, looks at list.\
' a disinegration contract for a small time smuggler.\
' Hmm got a bounty for some old guy thats been oggling girls on adari\
too.\
", 
               MudProgType = "speech_prog", 
               Arguments = "jobs", 
            }, 
            [3] = 
            {
               Code = "' yup he's wanted dead by someone. \
' payment is 2000 credits upon proof of disinigration\
smile $n\
' interested?\
", 
               MudProgType = "speech_prog", 
               Arguments = "smuggler", 
            }, 
            [4] = 
            {
               Code = "' great , just bring me back proof of disinegration to collect your\
bounty.\
", 
               MudProgType = "speech_prog", 
               Arguments = "yes", 
            }, 
            [5] = 
            {
               Code = "if ovnuminv(6611) >= 1\
' ahh great, our employer will be happy\
smile $n\
mpgain $n 3 200\
mpwithdraw 2000\
give 2000 credits $n\
' our payment as agreed upon.\
else \
' Bah this is useless\
sneer $n\
' i hope you do better in the future\
endif\
mpat 10299 drop all\
mpat 10299 mppurge\
", 
               MudProgType = "give_prog", 
               Arguments = "smugglers ear", 
            }, 
            [6] = 
            {
               Code = "' yeah some dirty old man been looking up the wrong skirt.\
snicker $n\
' but hes worth 5k , and that almost buys my time too\
smile $n \
' need to bring back his \"privates\" as proof\
evil\
", 
               MudProgType = "speech_prog", 
               Arguments = "old", 
            }, 
            [7] = 
            {
               Code = "if ovnuminv(7316) >= 1\
'ewww , either way here's yer cash'\
chuckle\
mpwithdraw 5000\
give 5000 credits $n\
mpgain $n 3 10000\
' you might make a good Bounty hunter after all.\
smile $n\
pat $n\
else \
' bah can't even do a simple job\
frown $n\
' I hope you do better in the future\
endif\
mpat 10299 drop all\
mpat 10299 mppurge\
", 
               MudProgType = "give_prog", 
               Arguments = "privates", 
            }, 
         }, 
         Alignment = 0, 
         SaveVs = 
         {
            Breath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
         }, 
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
         Credits = 0, 
         ArmorClass = 25, 
         LongDescr = "A young bounty hunter stands here taking your applications.\
", 
         HitRoll = 6, 
         NumberOfAttacks = 0, 
         Position = "standing", 
         ShortDescr = "Registerer", 
         Weight = 0, 
         DefaultPosition = "standing", 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         Vnum = 6600, 
         Height = 0, 
         Level = 30, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitNoDice = 6, 
            HitPlus = 300, 
         }, 
         Description = "This bounty hunter is fairly young and doing his part to get into guild\
management. Offering to take care of the registraiton of new members.\
", 
         Stats = 
         {
            Force = 0, 
            Dexterity = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Wisdom = 0, 
         }, 
         DamRoll = 6, 
      }, 
      [6601] = 
      {
         Sex = "undistinguished", 
         Race = "Human", 
         Name = "Record runner", 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 2, 
         }, 
         Alignment = 0, 
         SaveVs = 
         {
            Breath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
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
         Credits = 0, 
         ArmorClass = 50, 
         LongDescr = "A plebe is here running for records\
", 
         HitRoll = 4, 
         NumberOfAttacks = 0, 
         Position = "standing", 
         ShortDescr = "record runner", 
         Weight = 0, 
         DefaultPosition = "standing", 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         Vnum = 6601, 
         Height = 0, 
         Level = 20, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitNoDice = 4, 
            HitPlus = 200, 
         }, 
         Description = "", 
         Stats = 
         {
            Force = 0, 
            Dexterity = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Wisdom = 0, 
         }, 
         DamRoll = 4, 
      }, 
      [6602] = 
      {
         Sex = "undistinguished", 
         Race = "Human", 
         MudProgs = 
         {
            [1] = 
            {
               Code = "if ovnuminv(11101) >= 1\
Say Great! I've been waiting for this package for ages!\
mpwithdraw 2500\
give 2500 credits $n\
mpgain $n 5 100000\
mpat 10299 drop all\
mpat 10299 mppurge\
endif\
", 
               MudProgType = "act_prog", 
               Arguments = "gives", 
            }, 
            [2] = 
            {
               Code = "if ovnuminv(11113) >= 1\
nod $n\
say This one has eluded us for a while now.  Thank you. \
mpwithdraw 10000\
give 10000 credits $n\
mpgain $n 3 5000\
drop 10000 credits\
else\
say That's not Commander Willard!\
endif\
mpat 10299 drop all\
mpat 10299 mppurge\
", 
               MudProgType = "act_prog", 
               Arguments = "Willard", 
            }, 
            [3] = 
            {
               Code = "if ovnuminv(21812) >= 1\
nod $n\
say This one has eluded us for a while now.  Thank you. \
mpwithdraw 20000\
give 20000 credits $n\
mpgain $n 3 25000\
drop 20000 credits\
else\
say That's not Commodor Zuggs!\
endif\
mpat 10299 drop all\
mpat 10299 mppurge\
", 
               MudProgType = "act_prog", 
               Arguments = "Zuggs", 
            }, 
            [4] = 
            {
               Code = "", 
               MudProgType = "act_prog", 
               Arguments = "Hasti", 
            }, 
            [5] = 
            {
               Code = "if name($n) == Willard\
mpwithdraw 15000\
give $n 15000 credits\
drop 15000 credits\
say Well, Commander Willard...\
mpecho Two guards escort Willard through a door.\
say Good job.\
mpgain $r 3 15000\
mppurge willard\
endif\
", 
               MudProgType = "act_prog", 
               Arguments = "Willard", 
            }, 
            [6] = 
            {
               Code = "if name($n) == Sleejat\
mpwithdraw 40000\
give $n 40000 credits\
drop 40000 credits\
say Excellent work!!\
mpgain $r 3 40000\
mppurge sleejat\
endif\
", 
               MudProgType = "act_prog", 
               Arguments = "sleejat", 
            }, 
            [7] = 
            {
               Code = "if ovnuminv(23150) >= 1\
nod $n\
say We are most pleased with\
your\
work.\
mpwithdraw 25000\
give 25000 credits $n\
drop 25000 credits\
mpgain $n 3 21500\
endif\
if ovnuminv(10216) >= 1\
mpwithdraw 20000\
give 20000 credits $n\
drop 20000 credits\
mpgain $n 3 30000\
endif\
if ovnuminv(28610) >= 1\
nod $n\
say This one has eluded us for a while now.  Thank you. \
mpwithdraw 20000\
give 20000 credits $n\
mpgain $n 3 20000\
drop 20000 credits\
endif\
if ovnuminv(3202) >= 1\
nod $n\
say This one has eluded us for a while now.  Thank you. \
mpwithdraw 15000\
give 15000 credits $n\
mpgain $n 3 16000\
drop 20000 credits\
endif\
mpat 10299 drop all\
mpat 10299 purge\
drop 100000000 credits\
", 
               MudProgType = "act_prog", 
               Arguments = "gives", 
            }, 
         }, 
         Name = "receptionist", 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 10, 
            DamNoDice = 9, 
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
         Alignment = 0, 
         SaveVs = 
         {
            Breath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
         }, 
         Level = 90, 
         LongDescr = "A receptionist is here accepting your bounty's.\
", 
         ArmorClass = -125, 
         HitRoll = 18, 
         NumberOfAttacks = 0, 
         Weight = 0, 
         Position = "standing", 
         ShortDescr = "the receptionist", 
         Height = 0, 
         DefaultPosition = "standing", 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         Vnum = 6602, 
         Credits = 0, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
         }, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitNoDice = 18, 
            HitPlus = 900, 
         }, 
         Description = "She looks as tough as nails but what do you expect she works here after\
all.\
", 
         Stats = 
         {
            Force = 0, 
            Dexterity = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Wisdom = 0, 
         }, 
         DamRoll = 18, 
      }, 
      [6603] = 
      {
         Sex = "undistinguished", 
         Race = "Human", 
         Languages = 
         {
            Speaking = 
            {
               [1] = "shyriiwook", 
               [0] = "basic", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [20] = "verpine", 
            }, 
         }, 
         RepairShop = 
         {
            ProfitFix = 100, 
            KeeperShortDescr = "salesman", 
            ShopType = 1, 
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            FixTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [0] = "none", 
            }, 
         }, 
         Name = "Salesman", 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 10, 
         }, 
         Shop = 
         {
            ProfitBuy = 100, 
            ProfitSell = 90, 
            KeeperShortDescr = "salesman", 
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
         }, 
         Alignment = 0, 
         SaveVs = 
         {
            Breath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
         }, 
         Credits = 0, 
         Immune = 
         {
            [20] = "magic", 
            [21] = "paralysis", 
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         ArmorClass = -150, 
         LongDescr = "A Salesman is here selling his latest wares.\
", 
         HitRoll = 20, 
         NumberOfAttacks = 0, 
         Position = "standing", 
         ShortDescr = "salesman", 
         Weight = 0, 
         DefaultPosition = "standing", 
         Flags = 
         {
            [0] = "Npc", 
            [25] = "NoKill", 
            [30] = "Prototype", 
         }, 
         Vnum = 6603, 
         Height = 0, 
         Level = 100, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitNoDice = 20, 
            HitPlus = 1000, 
         }, 
         Description = "As fast as new products become available to Bounty Hunters, this salesman\
somehow gets them. Of course they can be a little pricy. But that what you\
pay to get the best i guess. \
", 
         Stats = 
         {
            Force = 0, 
            Dexterity = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Wisdom = 0, 
         }, 
         DamRoll = 20, 
      }, 
      [6604] = 
      {
         Sex = "undistinguished", 
         Race = "Mon Calamari", 
         Name = "ophelia head nurse woman human", 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 2, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "emote blushes furiously and stammers for a moment... \
say H-hello there, $n. Nice to see you. \
emote smiles like there's no tomorrow. \
say Can I do something for you, dear? \
emote stands up, brushing out her dress. \
emote crosses the room to stand before you, looking you over. \
", 
               MudProgType = "act_prog", 
               Arguments = "p arrives", 
            }, 
         }, 
         Alignment = 0, 
         SaveVs = 
         {
            Breath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [5] = "mon calamarian", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [5] = "mon calamarian", 
            }, 
         }, 
         Credits = 0, 
         ArmorClass = 37, 
         LongDescr = "A slender nurse in a head nurse's slicks\
", 
         HitRoll = 5, 
         NumberOfAttacks = 0, 
         Position = "standing", 
         ShortDescr = "Head Nurse Ophelia", 
         Weight = 0, 
         DefaultPosition = "standing", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Vnum = 6604, 
         Height = 0, 
         Level = 25, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitNoDice = 5, 
            HitPlus = 250, 
         }, 
         Description = "This alien is glancing around watching his back. Obviously he is wanted by\
someone for something , just if you could figure out by who and for what,\
", 
         Stats = 
         {
            Force = 0, 
            Dexterity = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Wisdom = 0, 
         }, 
         DamRoll = 5, 
      }, 
      [6605] = 
      {
         Sex = "undistinguished", 
         Race = "Human", 
         Languages = 
         {
            Speaking = 
            {
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
         }, 
         Name = "Armist Ghesinn barkeep", 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Shop = 
         {
            ProfitBuy = 120, 
            ProfitSell = 0, 
            KeeperShortDescr = "Armist", 
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
         }, 
         Alignment = 0, 
         SaveVs = 
         {
            Breath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
         }, 
         Credits = 0, 
         Immune = 
         {
            [8] = "poison", 
            [3] = "energy", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [11] = "charm", 
         }, 
         ArmorClass = 0, 
         LongDescr = "The barkeep, Armist Ghesinn.\
", 
         HitRoll = 0, 
         NumberOfAttacks = 0, 
         Position = "standing", 
         ShortDescr = "Armist", 
         Weight = 0, 
         DefaultPosition = "standing", 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         Vnum = 6605, 
         Height = 0, 
         Level = 1, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         Description = "Standing nearly two meters in height, and brawny as a gundark, Ghesinn is\
an imposing figure. Or, he would be, if he could keep the self-contented\
grin off his face. Like a great-uncle, Armist has trained several of the\
younger hunters in tracking and other areas. He is looked upon kindly by\
the majority of the guild, and is known for breaking up ill-advised fights\
between the often egotistical hunters. Armist was once a reknowned\
Imperial Commando leader, having more than a hundred successful missions\
under his belt, and only a handful of failures.\
", 
         Stats = 
         {
            Force = 0, 
            Dexterity = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Wisdom = 0, 
         }, 
         DamRoll = 0, 
      }, 
   }, 
   LowEconomy = 14558142, 
   ResetFrequency = 0, 
   VnumRanges = 
   {
      Object = 
      {
         Last = 6637, 
         First = 6600, 
      }, 
      Mob = 
      {
         Last = 6605, 
         First = 6600, 
      }, 
      Room = 
      {
         Last = 6650, 
         First = 6600, 
      }, 
   }, 
   Filename = "hunters_guild.lua", 
   Resets = 
   {
      [1] = 
      {
         Arg2 = 1, 
         Arg3 = 6627, 
         Arg1 = 32050, 
         MiscData = 1, 
         Command = "M", 
      }, 
      [2] = 
      {
         Arg2 = 1, 
         Arg3 = 16, 
         Arg1 = 32275, 
         MiscData = 1, 
         Command = "E", 
      }, 
      [3] = 
      {
         Arg2 = 2, 
         Arg3 = 6614, 
         Arg1 = 6603, 
         MiscData = 0, 
         Command = "O", 
      }, 
      [4] = 
      {
         Arg2 = 2, 
         Arg3 = 6613, 
         Arg1 = 6603, 
         MiscData = 0, 
         Command = "O", 
      }, 
      [5] = 
      {
         Arg2 = 1, 
         Arg3 = 6613, 
         Arg1 = 6605, 
         MiscData = 0, 
         Command = "O", 
      }, 
      [6] = 
      {
         Arg2 = 1, 
         Arg3 = 6613, 
         Arg1 = 6606, 
         MiscData = 0, 
         Command = "O", 
      }, 
      [7] = 
      {
         Arg2 = 1, 
         Arg3 = 6616, 
         Arg1 = 6600, 
         MiscData = 0, 
         Command = "M", 
      }, 
      [8] = 
      {
         Arg2 = 1, 
         Arg3 = 6615, 
         Arg1 = 6601, 
         MiscData = 0, 
         Command = "M", 
      }, 
      [9] = 
      {
         Arg2 = 2, 
         Arg3 = 2, 
         Arg1 = 6637, 
         MiscData = 0, 
         Command = "D", 
      }, 
      [10] = 
      {
         Arg2 = 60, 
         Arg3 = 6635, 
         Arg1 = 204, 
         MiscData = 1, 
         Command = "M", 
      }, 
      [11] = 
      {
         Arg2 = 60, 
         Arg3 = 6635, 
         Arg1 = 204, 
         MiscData = 1, 
         Command = "M", 
      }, 
      [12] = 
      {
         Arg2 = 60, 
         Arg3 = 6635, 
         Arg1 = 204, 
         MiscData = 1, 
         Command = "M", 
      }, 
      [13] = 
      {
         Arg2 = 60, 
         Arg3 = 6635, 
         Arg1 = 204, 
         MiscData = 1, 
         Command = "M", 
      }, 
      [14] = 
      {
         Arg2 = 1, 
         Arg3 = 6612, 
         Arg1 = 6601, 
         MiscData = 1, 
         Command = "O", 
      }, 
      [15] = 
      {
         Arg2 = 1, 
         Arg3 = 6612, 
         Arg1 = 6602, 
         MiscData = 1, 
         Command = "O", 
      }, 
      [16] = 
      {
         Arg2 = 1, 
         Arg3 = 6612, 
         Arg1 = 6603, 
         MiscData = 1, 
         Command = "O", 
      }, 
      [17] = 
      {
         Arg2 = 1, 
         Arg3 = 6612, 
         Arg1 = 38, 
         MiscData = 1, 
         Command = "O", 
      }, 
      [18] = 
      {
         Arg2 = 1, 
         Arg3 = 6603, 
         Arg1 = 32201, 
         MiscData = 1, 
         Command = "O", 
      }, 
      [19] = 
      {
         Arg2 = 1, 
         Arg3 = 6624, 
         Arg1 = 6615, 
         MiscData = 1, 
         Command = "O", 
      }, 
      [20] = 
      {
         Arg2 = 0, 
         Arg3 = 1, 
         Arg1 = 6624, 
         MiscData = 0, 
         Command = "D", 
      }, 
      [21] = 
      {
         Arg2 = 0, 
         Arg3 = 2, 
         Arg1 = 6638, 
         MiscData = 0, 
         Command = "D", 
      }, 
      [22] = 
      {
         Arg2 = 0, 
         Arg3 = 1, 
         Arg1 = 6639, 
         MiscData = 0, 
         Command = "D", 
      }, 
      [23] = 
      {
         Arg2 = 1, 
         Arg3 = 1, 
         Arg1 = 6639, 
         MiscData = 0, 
         Command = "D", 
      }, 
      [24] = 
      {
         Arg2 = 2, 
         Arg3 = 2, 
         Arg1 = 6639, 
         MiscData = 0, 
         Command = "D", 
      }, 
      [25] = 
      {
         Arg2 = 3, 
         Arg3 = 1, 
         Arg1 = 6639, 
         MiscData = 0, 
         Command = "D", 
      }, 
      [26] = 
      {
         Arg2 = 2, 
         Arg3 = 6629, 
         Arg1 = 6603, 
         MiscData = 1, 
         Command = "M", 
      }, 
      [27] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 10313, 
      }, 
      [28] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 10314, 
      }, 
      [29] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 32254, 
      }, 
      [30] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 6610, 
      }, 
      [31] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 6612, 
      }, 
      [32] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 33, 
      }, 
      [33] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 6637, 
      }, 
      [34] = 
      {
         Arg2 = 1, 
         Arg3 = 6629, 
         Arg1 = 6616, 
         MiscData = 1, 
         Command = "O", 
      }, 
      [35] = 
      {
         Arg2 = 1, 
         Arg3 = 6604, 
         Arg1 = 6602, 
         MiscData = 1, 
         Command = "M", 
      }, 
      [36] = 
      {
         Arg2 = 1, 
         Arg3 = 6604, 
         Arg1 = 6617, 
         MiscData = 1, 
         Command = "O", 
      }, 
      [37] = 
      {
         Arg2 = 1, 
         Arg3 = 6631, 
         Arg1 = 6604, 
         MiscData = 1, 
         Command = "M", 
      }, 
      [38] = 
      {
         Arg2 = 1, 
         Arg3 = 6626, 
         Arg1 = 38, 
         MiscData = 1, 
         Command = "O", 
      }, 
      [39] = 
      {
         Arg2 = 1, 
         Arg3 = 6628, 
         Arg1 = 6605, 
         MiscData = 1, 
         Command = "M", 
      }, 
   }, 
   ResetMessage = "A cleaning droid sweeps by, narrowly missing you.", 
   Name = "Hunters Guild", 
   FileFormatVersion = 1, 
   HighEconomy = 0, 
   Rooms = 
   {
      [6600] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Direction = "north", 
               DestinationVnum = 6601, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "south", 
               DestinationVnum = 31881, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Vnum = 6600, 
         Sector = "city", 
         Description = "&pA great entryway looms over one corner of the small pathway, it's twin\
doors carved in strange tongues, or seemingly so. Designs seem to flow\
through the text like a sea around a continent.  The designs all seem to\
bask in the subject of death, from Carkassian Thumpers tearing each others\
throats out, to a man hanging from the bottom of an L shaped character of\
the text. All of the designs are brought into starke contrast, as each\
carving has been filled with some semi-transperant silver or red metal\
that makes the entire grotesque doorway all the more striking against it's\
obsidian dark surface. The door itself appears to be exuding the sharp\
stench of some unidentifiable spice.     \
", 
         Tunnel = 0, 
         Name = "Security Door", 
      }, 
      [6601] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               DestinationVnum = 6602, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Direction = "south", 
               DestinationVnum = 6600, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Vnum = 6601, 
         Sector = "city", 
         Description = "&pTwo standard weapon/biological scanners are implanted into the walls,\
scanning what few sentients and non-sentients decide to pass through this\
hall.  The ceiling and floor are lined with lime colored glow panels, some\
occassionally flickering. \
", 
         Tunnel = 0, 
         Name = "Security Checkpoint", 
      }, 
      [6602] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               DestinationVnum = 6606, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "east", 
               DestinationVnum = 6604, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Direction = "south", 
               DestinationVnum = 6601, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Direction = "west", 
               DestinationVnum = 6603, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Vnum = 6602, 
         Sector = "city", 
         Description = "&pThe room sprawls around in silence, pictures and plants scattered through\
the room as if a small tornado was allowed to decorate the room. \
", 
         Tunnel = 0, 
         Name = "First Floor Hallway", 
      }, 
      [6603] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               DestinationVnum = 6602, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6603, 
         Sector = "city", 
         Description = "&pThe lounge of the Guild is lavishly furnished, no expenses spared. Large\
mosaics and statues surround the room, and soothing music in the way of\
some unidentifiable pipe plays lowly in the backround.  It seems obvious\
that the casual observer would guess this a relaxation pit for the rich\
and famous of the galaxy rather than a place to put an ignoble end to some\
sapient member of the galactic community. \
", 
         Tunnel = 0, 
         Name = "Lounge", 
      }, 
      [6604] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               DestinationVnum = 6602, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Vnum = 6604, 
         Sector = "city", 
         Description = "&pIt is in this office that all bounty's must be placed. A small line up of\
all races is here each with a personal grudge against someone.  Hope you\
brought enough credit to get you bounty noticed.  \
", 
         Tunnel = 0, 
         Name = "Bounty Placement Office", 
      }, 
      [6605] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Exits = 
         {
         }, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 6605, 
         Sector = "city", 
         Description = "", 
         Tunnel = 0, 
         Name = "Floating in a void", 
      }, 
      [6606] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [19] = "Auto", 
               }, 
               Direction = "somewhere", 
               DestinationVnum = 6602, 
               Key = -1, 
               Keyword = "1st Floor", 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Flags = 
               {
                  [19] = "Auto", 
               }, 
               Direction = "somewhere", 
               DestinationVnum = 6607, 
               Key = -1, 
               Keyword = "2nd Floor", 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Flags = 
               {
                  [19] = "Auto", 
               }, 
               Direction = "somewhere", 
               DestinationVnum = 6610, 
               Key = -1, 
               Keyword = "3rd Floor", 
               Description = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Flags = 
               {
                  [19] = "Auto", 
                  [11] = "Hidden", 
               }, 
               Direction = "somewhere", 
               DestinationVnum = 6638, 
               Key = -1, 
               Keyword = "Prison", 
               Description = "", 
               Distance = 0, 
            }, 
            [5] = 
            {
               Flags = 
               {
                  [19] = "Auto", 
               }, 
               Direction = "somewhere", 
               DestinationVnum = 6634, 
               Key = -1, 
               Keyword = "Roof", 
               Description = "", 
               Distance = 0, 
            }, 
            [6] = 
            {
               Flags = 
               {
                  [19] = "Auto", 
                  [11] = "Hidden", 
               }, 
               Direction = "somewhere", 
               DestinationVnum = 6624, 
               Key = -1, 
               Keyword = "sanctuary", 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 6606, 
         Sector = "city", 
         Description = "&cThis turbolift is rediculously state-of-the-art. You can see that it's\
internal frame work is carved from zhicera wood: an expensive luxury\
woodwork job from the backwater world of Yharos most likely. The controls\
present you with four options, the ground floor, the Guild compound\
quarters on the second floor, the upper hallway, and the roof entrance.\
", 
         Tunnel = 0, 
         Name = "&W&zCentral Turbolift&W", 
      }, 
      [6607] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               DestinationVnum = 6608, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "east", 
               DestinationVnum = 6622, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Direction = "south", 
               DestinationVnum = 6606, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Direction = "west", 
               DestinationVnum = 6621, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 6607, 
         Sector = "city", 
         Description = "All the rooms along this hall are owned by various Hunters. being caught\
here and not being a hunter could be dangerous to your health\
", 
         Tunnel = 0, 
         Name = "Quarter's Hallway", 
      }, 
      [6608] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               DestinationVnum = 6609, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "east", 
               DestinationVnum = 6619, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Direction = "south", 
               DestinationVnum = 6607, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Direction = "west", 
               DestinationVnum = 6620, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Vnum = 6608, 
         Sector = "city", 
         Description = "All the rooms along this hall are owned by various Hunters. being caught\
here and not being a hunter could be dangerous to your health\
", 
         Tunnel = 0, 
         Name = "Quarter's Hallway", 
      }, 
      [6609] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               DestinationVnum = 6617, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "south", 
               DestinationVnum = 6608, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Direction = "west", 
               DestinationVnum = 6618, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Vnum = 6609, 
         Sector = "city", 
         Description = "All the rooms along this hall are owned by various Hunters. being caught\
here and not being a hunter could be dangerous to your health\
", 
         Tunnel = 0, 
         Name = "Quarter's Hallway", 
      }, 
      [6610] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               DestinationVnum = 6611, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "east", 
               DestinationVnum = 6616, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Direction = "south", 
               DestinationVnum = 6606, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Direction = "west", 
               DestinationVnum = 6615, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 6610, 
         Sector = "city", 
         Description = "The upper hall of this building is all offices, it is somewhere on this\
hall that all bounty hunters must register.  As well the offices of the\
leader,first and second are on this floor. \
", 
         Tunnel = 0, 
         Name = "Upper Hallway", 
      }, 
      [6611] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               DestinationVnum = 6612, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "east", 
               DestinationVnum = 6614, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Direction = "south", 
               DestinationVnum = 6610, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Direction = "west", 
               DestinationVnum = 6613, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 6611, 
         Sector = "city", 
         Description = "The upper hall of this building is all offices, it is somewhere on this\
hall that all bounty hunters must register.  As well the offices of the\
leader,first and second are on this floor. \
", 
         Tunnel = 0, 
         Name = "Upper Hallway", 
      }, 
      [6612] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               DestinationVnum = 6611, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "down", 
               DestinationVnum = 6621, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 6612, 
         Sector = "city", 
         Description = "This luxerious office is dominated by a large oak desk. A plush carpet\
lines the floor and  a giant window behind the desk offers a wonderfull\
view of tatooine. teo chairs sit before the desk and it is obvious by\
there placement that they are intended for guest of the guildmaster.\
", 
         Tunnel = 0, 
         Name = "Master Hunter's Office", 
      }, 
      [6613] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               DestinationVnum = 6611, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 6613, 
         Sector = "city", 
         Description = "The office of the first is moderate in size, from the in and out box on his\
desk you see that he is always kept bust with day to day life of the\
guild.  A small interview chair sits to   one side of the desk so he may\
preform peliminary interviews for the guildmaster.\
", 
         Tunnel = 0, 
         Name = "Hunter Varssk's Office", 
      }, 
      [6614] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               DestinationVnum = 6611, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 6614, 
         Sector = "city", 
         Description = "/ l This somewhat cramped office is carpeted and has a small desk along the\
east wall. The desc is coverd in a pile of paper work that looks as if it\
hasn't been touched in months.  best to leave here before you disturb\
anything. \
", 
         Tunnel = 0, 
         Name = "Hunter Zaver's Office", 
      }, 
      [6615] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               DestinationVnum = 6610, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 6615, 
         Sector = "city", 
         Description = "this large room houses a complete listing of all the guilds curent and past\
hunters aswell as each of there acusitions. A young apprentice hunter is\
here running for each file that is requested as part of his training to\
undersand each hunters tecnique and abilties.\
", 
         Tunnel = 0, 
         Name = "Hall of Records", 
      }, 
      [6616] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               DestinationVnum = 6610, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 6616, 
         Sector = "city", 
         Description = "All hunters must be registerd with the guild to not be registerd makes you\
an outlaw of the guild aswell as a common murderer. Anyone hunting\
outsides the guild will be hunted and punished unless it was done with one\
of the guild leaders approval. \
", 
         Tunnel = 0, 
         Name = "Registration Office", 
      }, 
      [6617] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               DestinationVnum = 6609, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         Vnum = 6617, 
         Sector = "inside", 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Tunnel = 0, 
         Name = "An Empty Home", 
      }, 
      [6618] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               DestinationVnum = 6609, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         Vnum = 6618, 
         Sector = "inside", 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Tunnel = 0, 
         Name = "An Empty Home", 
      }, 
      [6619] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               DestinationVnum = 6608, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         Vnum = 6619, 
         Sector = "inside", 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Tunnel = 0, 
         Name = "An Empty Home", 
      }, 
      [6620] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               DestinationVnum = 6608, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         Vnum = 6620, 
         Sector = "inside", 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Tunnel = 0, 
         Name = "An Empty Home", 
      }, 
      [6621] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               DestinationVnum = 6607, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "up", 
               DestinationVnum = 6612, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         Vnum = 6621, 
         Sector = "inside", 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Tunnel = 0, 
         Name = "An Empty Home", 
      }, 
      [6622] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               DestinationVnum = 6607, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         Vnum = 6622, 
         Sector = "inside", 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Tunnel = 0, 
         Name = "An Empty Home", 
      }, 
      [6623] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Exits = 
         {
         }, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Vnum = 6623, 
         Sector = "city", 
         Description = "This hallway is know of only to the hunters guild members to tell anyone of\
this hall is to bring all the hunters down on your head. Remeber this and\
Hunt Well.\
", 
         Tunnel = 0, 
         Name = "Deep Below Tatooine's Surface", 
      }, 
      [6624] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
                  [11] = "Hidden", 
               }, 
               Direction = "north", 
               DestinationVnum = 6625, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "east", 
               DestinationVnum = 6630, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Direction = "south", 
               DestinationVnum = 6606, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Flags = 
               {
                  [19] = "Auto", 
                  [11] = "Hidden", 
               }, 
               Direction = "somewhere", 
               DestinationVnum = 6629, 
               Key = -1, 
               Keyword = "Burn", 
               Description = "", 
               Distance = 0, 
            }, 
            [5] = 
            {
               Flags = 
               {
                  [19] = "Auto", 
                  [11] = "Hidden", 
               }, 
               Direction = "somewhere", 
               DestinationVnum = 6627, 
               Key = -1, 
               Keyword = "Freezer", 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 6624, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "if clan($n) == The Assassins Guild\
else\
mpecho Someone yells, 'You don't belong here!'\
mpforce $n s\
endif\
", 
               MudProgType = "entry_prog", 
               Arguments = "100", 
            }, 
         }, 
         Sector = "city", 
         Description = "&pThe main hallway of the guild, normally occassioned only to seasoned\
assassins and unpredictable apprentice assassins, this is one of the few\
places in the galaxy where one can wander near such creatures. This is the\
hallowed ground of the guild, where only the blood of traitors may fall to\
the ground. Bright glowpanels, doors, and numerous electronics line the\
walls of the hall. \
", 
         Tunnel = 0, 
         Name = "Secret Hallway", 
      }, 
      [6625] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               DestinationVnum = 6628, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
                  [3] = "Secret", 
               }, 
               Direction = "south", 
               DestinationVnum = 6624, 
               Key = -1, 
               Keyword = "door", 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Flags = 
               {
                  [19] = "Auto", 
                  [11] = "Hidden", 
               }, 
               Direction = "somewhere", 
               DestinationVnum = 6626, 
               Key = -1, 
               Keyword = "Relay", 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 6625, 
         Sector = "city", 
         Description = "&pThe hidden hall is known to few of the assassins, although for those that\
do know of it, it is a place of celebration. Both life and death are\
common jokes to those assassins that gather here, and lining the walls\
under light purple glowlining, are multiple skins and trophies, preserved\
for the amusement and awe of later assassins. \
", 
         Tunnel = 0, 
         Name = "&cThe Hidden Hall&R&W", 
      }, 
      [6626] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               DestinationVnum = 6625, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 6626, 
         Sector = "city", 
         Description = "", 
         Tunnel = 0, 
         Name = "Communications Relay", 
      }, 
      [6627] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "southeast", 
               DestinationVnum = 6624, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 6627, 
         Sector = "city", 
         Description = "A large hall is here for the training of all hunters in both skill level\
and physical attributes. Various machines line the walls and all traing is\
regulated by an expirienced hunter. \
", 
         Tunnel = 0, 
         Name = "Hall of Training", 
      }, 
      [6628] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               DestinationVnum = 6625, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Vnum = 6628, 
         Sector = "city", 
         Description = "&OYou stand in a well sized and lit, unorthodoxly clean, bar. This is the\
gathering place of Hunters without a target, or are merely taking some\
time off. Armist Ghesinn, a former Imperial Commando Captain, stands\
behind the bar, his usual idiot grin evident on his face as he cleans mugs\
and swaps both brew and story with the few customers. \
", 
         Tunnel = 0, 
         Name = "Ghesinn's Bar", 
      }, 
      [6629] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               DestinationVnum = 6624, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 6629, 
         Sector = "city", 
         Description = "Although nothing is for sale now , we hope in the future to possess hunter\
speacial equipment. \
", 
         Tunnel = 0, 
         Name = "Bounty Hunter Equipmet", 
      }, 
      [6630] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               DestinationVnum = 6631, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Flags = 
               {
                  [19] = "Auto", 
               }, 
               Direction = "west", 
               DestinationVnum = 6624, 
               Key = -1, 
               Keyword = "west", 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Vnum = 6630, 
         Sector = "city", 
         Description = "&G&WThe medical wing is brightly lit, featuring numerous medical droids and\
a sparse number of biological assistants. However, the staff of the\
medical wing of the guild is easily explanable; Most wounded guild members\
don't make it home. \
", 
         Tunnel = 0, 
         Name = "Medical Wing", 
      }, 
      [6631] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Direction = "east", 
               DestinationVnum = 6632, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "west", 
               DestinationVnum = 6630, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 6631, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpecho &bThe lights in the room snap on abruptly...\
mpecho &OThere is a flurry of motion behind the desk as the chair turns..\
", 
               MudProgType = "entry_prog", 
               Arguments = "100", 
            }, 
         }, 
         Sector = "city", 
         Description = "&G&WThe head nurse's office is typically bland, smelling of solvents and\
bacta from the tank just to the east of it.  The room is dimly lit, in\
almost soothing blue tones. Obviously someone likes to do their business,\
whether it be in mind or body, here. \
", 
         Tunnel = 0, 
         Name = "Head Nurse's Office", 
      }, 
      [6632] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Direction = "west", 
               DestinationVnum = 6631, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 6632, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "feel heal $n\
feel heal $n\
feel refresh $n\
feel refresh $n\
", 
               MudProgType = "rand_prog", 
               Arguments = "100", 
            }, 
         }, 
         Sector = "city", 
         Description = "", 
         Tunnel = 0, 
         Name = "Bacta Tank", 
      }, 
      [6633] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
                  [5] = "PickProof", 
                  [23] = "BashProof", 
               }, 
               Direction = "north", 
               DestinationVnum = 6637, 
               Key = 6637, 
               Keyword = "", 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Flags = 
               {
                  [25] = "Window", 
               }, 
               Direction = "east", 
               DestinationVnum = 6635, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 6633, 
         Sector = "city", 
         Description = "This room monitor's the landing pad and those that walk through\
it.\
", 
         Tunnel = 0, 
         Name = "Security box", 
      }, 
      [6634] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               DestinationVnum = 6606, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "south", 
               DestinationVnum = 6635, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Direction = "west", 
               DestinationVnum = 6637, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6634, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "if clan($n) == The Hunters Guild\
mpat 6636 mpecho Hunter $n just entered the landing pad area. \
else\
if clan($n) == The Empire\
mpat 6636 mpecho Imperial $n just entered the landing pad area.\
else\
if clan($n) == The Rebel Alliance\
mpat 6636 mpecho Rebel $n just entered the landing pad area. \
else\
mpat 6636 mpecho $n just entered the landing pad area. \
endif\
endif\
endif\
", 
               MudProgType = "entry_prog", 
               Arguments = "100", 
            }, 
         }, 
         Sector = "city", 
         Description = "", 
         Tunnel = 0, 
         Name = "Large Roof", 
      }, 
      [6635] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [24] = "NoMob", 
               }, 
               Direction = "north", 
               DestinationVnum = 6634, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [4] = "CanLand", 
            [5] = "CanFly", 
         }, 
         Vnum = 6635, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "if clan($n) == The Hunters Guild\
mpat 6633 mpecho Hunter $n just entered the landing pad\
area.\
if clan($n) == The Empire\
mpat 6633 mpecho Imperial $n just entered the landing pad area.\
else\
if clan($n) == The Rebel Alliance\
mpat 6633 mpecho Rebel $n just entered the landing pad area.\
else\
mpat 6633 mpecho $n just entered the landing pad area.\
endif\
endif\
endif\
", 
               MudProgType = "entry_prog", 
               Arguments = "100", 
            }, 
         }, 
         Sector = "city", 
         Description = "", 
         Tunnel = 0, 
         Name = "Guild Private Landing Pad", 
      }, 
      [6636] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [25] = "Window", 
               }, 
               Direction = "east", 
               DestinationVnum = 6635, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Vnum = 6636, 
         Sector = "city", 
         Description = "This room monitor's the landing pad and those that walk through it.\
", 
         Tunnel = 0, 
         Name = "Security Box", 
      }, 
      [6637] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               DestinationVnum = 6634, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
               }, 
               Direction = "south", 
               DestinationVnum = 6633, 
               Key = 6637, 
               Keyword = "", 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6637, 
         Sector = "city", 
         Description = "", 
         Tunnel = 0, 
         Name = "Large Roof", 
      }, 
      [6638] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
               }, 
               Direction = "north", 
               DestinationVnum = 6639, 
               Key = 6637, 
               Keyword = "", 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Direction = "up", 
               DestinationVnum = 6606, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Vnum = 6638, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "if clan($n) == The Hunters Guild\
else\
mpechoat $n You trip on the uneven ground.\
if rand(50)\
mpforce $n sit\
else\
mpforce $n rest\
endif\
endif\
", 
               MudProgType = "entry_prog", 
               Arguments = "5", 
            }, 
         }, 
         Sector = "city", 
         Description = "Pitted durasteel forms the walls and ceiling above.  Rough stone  is\
chiseled to make the floor, leaving the possibility of tripping  sentients\
unfamiliar with the hallway.  The corridor ends to the north  at 3 doors.\
Pitted durasteel forms the walls and ceiling above.  Rough stone  is\
chiseled to make the floor, leaving the possibility of tripping  sentients\
unfamiliar with the hallway.  A steel door leads north,  with a control\
pad to the right.\
", 
         Tunnel = 0, 
         Name = "A dark hallway", 
      }, 
      [6639] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Direction = "north", 
               DestinationVnum = 6642, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Direction = "east", 
               DestinationVnum = 6640, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
               }, 
               Direction = "south", 
               DestinationVnum = 6638, 
               Key = 6637, 
               Keyword = "", 
               Description = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Direction = "west", 
               DestinationVnum = 6641, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
            [7] = "NoMagic", 
         }, 
         Vnum = 6639, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "if clan($n) == The Hunters Guild\
else\
mpechoat $n You trip on the uneven ground.\
if rand(50)\
mpforce $n sit\
else\
mpforce $n rest\
endif\
endif\
", 
               MudProgType = "entry_prog", 
               Arguments = "20", 
            }, 
         }, 
         Sector = "city", 
         Description = "Pitted durasteel forms the walls and ceiling above.  Rough stone  is\
chiseled to make the floor, leaving the possibility of tripping  sentients\
unfamiliar with the hallway.  The corridor ends to the north  at 3 doors.\
", 
         Tunnel = 0, 
         Name = "A dark hallway", 
      }, 
      [6640] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
                  [5] = "PickProof", 
               }, 
               Direction = "west", 
               DestinationVnum = 6639, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [0] = "Dark", 
            [23] = "Hotel", 
            [30] = "Prototype", 
            [7] = "NoMagic", 
         }, 
         Vnum = 6640, 
         Sector = "city", 
         Description = "The dark cell was carved out of the stone forming the foundation of  the\
building above.  A ledge carved to form a stone bed lines one wall,  while\
a quarter metre hole, a hand deep, forms the privy. The dark cell was\
carved out of the stone forming the foundation of  the building above.  A\
ledge carved to form a stone bed lines one wall,  while a quarter metre\
hole, a hand deep, forms the privy. \
", 
         Tunnel = 0, 
         Name = "A dark cell", 
      }, 
      [6641] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
                  [5] = "PickProof", 
               }, 
               Direction = "east", 
               DestinationVnum = 6639, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [0] = "Dark", 
            [23] = "Hotel", 
            [30] = "Prototype", 
            [7] = "NoMagic", 
         }, 
         Vnum = 6641, 
         Sector = "city", 
         Description = "", 
         Tunnel = 0, 
         Name = "A dark cell", 
      }, 
      [6642] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
                  [5] = "PickProof", 
               }, 
               Direction = "south", 
               DestinationVnum = 6639, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
               Distance = 0, 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [0] = "Dark", 
            [23] = "Hotel", 
            [30] = "Prototype", 
            [7] = "NoMagic", 
         }, 
         Vnum = 6642, 
         Sector = "city", 
         Description = "The dark cell was carved out of the stone forming the foundation of  the\
building above.  A ledge carved to form a stone bed lines one wall,  while\
a quarter metre hole, a hand deep, forms the privy.   \
", 
         Tunnel = 0, 
         Name = "A dark cell", 
      }, 
      [6643] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Exits = 
         {
         }, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 6643, 
         Sector = "city", 
         Description = "", 
         Tunnel = 0, 
         Name = "Floating in a void", 
      }, 
      [6650] = 
      {
         TeleVnum = 0, 
         TeleDelay = 0, 
         Exits = 
         {
         }, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 6650, 
         Sector = "city", 
         Description = "", 
         Tunnel = 0, 
         Name = "Floating in a void", 
      }, 
   }, 
   Objects = 
   {
      [6600] = 
      {
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
         ShortDescr = "a terminal", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "terminal board message", 
               Description = "A small computer terminal is installed on the wall for passengers to\
\13leave comments to the operators. To learn more about its usage type\
\13'HELP MESSAGE'.\
\13", 
            }, 
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Vnum = 6600, 
         Weight = 1, 
         Cost = 0, 
         Name = "terminal board message", 
         Description = "A galactic net message terminal is installed on the wall here.", 
         Layers = 0, 
         ItemType = "furniture", 
      }, 
      [6601] = 
      {
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
         ShortDescr = "guildmasters desk", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "guildmasters desk", 
               Description = "This desk is huge and made of the finest woods credits can find. Kept\
\13impecable by the guildmasters secratary you wonder if he even does any\
\13work.\
\13", 
            }, 
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Vnum = 6601, 
         Weight = 1, 
         Cost = 0, 
         Name = "guildmasters desk", 
         Description = "A giant wooden desk.", 
         Layers = 0, 
         ItemType = "trash", 
      }, 
      [6602] = 
      {
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 2, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         ShortDescr = "guildmasters  chair", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "guildmasters chair", 
               Description = "this chair is so cushy its digusting.\
\13", 
            }, 
         }, 
         Vnum = 6602, 
         Weight = 1, 
         Cost = 0, 
         ItemType = "trash", 
         Description = "A giant managers chair.", 
         Name = "guildmasters chair", 
         Layers = 0, 
      }, 
      [6603] = 
      {
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 2, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         ShortDescr = "guest chair", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "Guest chair", 
               Description = "A chair four legs and a seat.\
\13", 
            }, 
         }, 
         Vnum = 6603, 
         Weight = 1, 
         Cost = 0, 
         ItemType = "furniture", 
         Description = "A uncomfortable guests chair.", 
         Name = "Guest chair", 
         Layers = 0, 
      }, 
      [6604] = 
      {
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 1, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 3, 
         }, 
         ShortDescr = "small table", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "small table", 
               Description = "This table is coverd in paper work , It's obvious who is low man on the\
\13totem pole here.\
\13", 
            }, 
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Vnum = 6604, 
         Weight = 100, 
         Cost = 0, 
         Name = "small table", 
         Description = "A small table is here acting as a desk.", 
         Layers = 0, 
         ItemType = "furniture", 
      }, 
      [6605] = 
      {
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
         ShortDescr = "small desk", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "Paper", 
               Description = "This paper says a single word: Labria : wonder what it means\
\13", 
            }, 
            [2] = 
            {
               Keyword = "Small Desk", 
               Description = "A small desk is here covered in paperwork , some of it looks like it might\
\13be important. \
\13", 
            }, 
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Vnum = 6605, 
         Weight = 1, 
         Cost = 0, 
         Name = "Small Desk", 
         Description = "A small desk sits here.", 
         Layers = 0, 
         ItemType = "furniture", 
      }, 
      [6606] = 
      {
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 2, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         ShortDescr = "managers chair", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "Managers chair", 
               Description = "This chair looks well used by the poor sole that has to sit on it.\
\13", 
            }, 
         }, 
         Vnum = 6606, 
         Weight = 100, 
         Cost = 0, 
         ItemType = "furniture", 
         Description = "A small managers chair.", 
         Name = "Managers chair", 
         Layers = 0, 
      }, 
      [6607] = 
      {
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ObjectValues = 
         {
            [1] = 3000, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2000, 
         }, 
         ShortDescr = "thermal detonator", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "thermal detonator", 
               Description = "once you arm this baby run for your life.\
\13", 
            }, 
         }, 
         Vnum = 6607, 
         Weight = 1, 
         Cost = 900000, 
         Layers = 0, 
         Description = "A small silver ball lies here.", 
         Name = "thermal detonator", 
         ItemType = "grenade", 
      }, 
      [6608] = 
      {
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         ObjectValues = 
         {
            [1] = 10, 
            [2] = 4, 
            [3] = 6, 
            [4] = 2000, 
            [5] = 2000, 
            [0] = 0, 
         }, 
         ShortDescr = "a Riot Gun.", 
         ExtraDescriptions = 
         {
         }, 
         Affects = 
         {
            [1] = 
            {
               Modifier = 1, 
               Location = 19, 
            }, 
            [2] = 
            {
               Modifier = 1, 
               Location = 18, 
            }, 
         }, 
         Vnum = 6608, 
         Weight = 15, 
         Cost = 3000, 
         Layers = 0, 
         Description = "A riot gun is lying here", 
         Name = "Riot gun", 
         ItemType = "weapon", 
      }, 
      [6609] = 
      {
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2000, 
         }, 
         ShortDescr = "an advanced ammunition cell", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6609, 
         Weight = 1, 
         Cost = 100, 
         Layers = 0, 
         Description = "An advanced ammunition cell was dropped here.", 
         Name = "advanced ammunition cell", 
         ItemType = "ammo", 
      }, 
      [6610] = 
      {
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
            [4] = "Head", 
         }, 
         ObjectValues = 
         {
            [1] = 9, 
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
               Code = "mpechoat $n &YYou feel as if your eyes can see further.\
", 
               MudProgType = "use_prog", 
               Arguments = "100", 
            }, 
         }, 
         ShortDescr = "Creshaldyne Heavy Combat Helmet", 
         Affects = 
         {
            [1] = 
            {
               Modifier = 16777216, 
               Location = 26, 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [24] = "_24", 
            [17] = "_17", 
            [22] = "_22", 
            [15] = "_15", 
         }, 
         Vnum = 6610, 
         Weight = 1, 
         Cost = 2000, 
         Name = "Creshaldyne Heavy Combat Helmet", 
         Description = "A pale grey helmet lies here.", 
         Layers = 0, 
         ItemType = "armor", 
      }, 
      [6611] = 
      {
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         ShortDescr = "smugglers ear", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6611, 
         Weight = 1, 
         Cost = 1, 
         Layers = 0, 
         Description = "A bloodied ear lies in the dust here.", 
         Name = "Smugglers ear", 
         ItemType = "trash", 
      }, 
      [6612] = 
      {
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
            [12] = "Wrist", 
         }, 
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "Locris PPL-3 Wrist Laser", 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpechoat $n &YThe laser seems perfect for your wrist.\
", 
               MudProgType = "use_prog", 
               Arguments = "100", 
            }, 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "Locris ppl-3 wrist laser", 
               Description = "", 
            }, 
            [2] = 
            {
               Keyword = "Locris ppl-3 wrist laser", 
               Description = "A small blaster that fits around your wrist.\
\13", 
            }, 
         }, 
         Affects = 
         {
            [1] = 
            {
               Modifier = 3, 
               Location = 19, 
            }, 
            [2] = 
            {
               Modifier = 3, 
               Location = 18, 
            }, 
         }, 
         Vnum = 6612, 
         Weight = 1, 
         Cost = 3000, 
         Layers = 0, 
         Description = "A wrist blaster lies here on the ground.", 
         Name = "Locris ppl-3 wrist laser", 
         ItemType = "armor", 
      }, 
      [6613] = 
      {
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
            [3] = "Body", 
         }, 
         ObjectValues = 
         {
            [1] = 10, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         ShortDescr = "&YThird Body&R&W", 
         ExtraDescriptions = 
         {
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "feel good $n\
mpechoat $n &YYou feel stronger.\
", 
               MudProgType = "use_prog", 
               Arguments = "100", 
            }, 
         }, 
         Vnum = 6613, 
         Weight = 1, 
         Cost = 0, 
         Layers = 96, 
         Description = "A &Y Third Body&R&W is here.", 
         Name = "Third Body", 
         ItemType = "armor", 
      }, 
      [6614] = 
      {
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
         ShortDescr = "a plaque", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "a plaque", 
               Description = "A list of bounty hunters to distinguish the guild, both a part of it and\
\13rogue hunters with great ability: Boba Fett, Borrsk, Kada the Ewok, and\
\13many others.\
\13", 
            }, 
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Vnum = 6614, 
         Weight = 1, 
         Cost = 0, 
         Name = "a plaque", 
         Description = "A plaque is tacked to the wall.", 
         Layers = 0, 
         ItemType = "furniture", 
      }, 
      [6615] = 
      {
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
         ShortDescr = "a Hunter's Guild Board", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Vnum = 6615, 
         Weight = 1000, 
         Cost = 0, 
         Name = "Assassins Guild Board", 
         Description = "The Assassins Guild Board", 
         Layers = 0, 
         ItemType = "furniture", 
      }, 
      [6616] = 
      {
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
         ShortDescr = "a list", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "list", 
               Description = "1) A key to the guild facilities.\
\0132) Poisoning power from Kintyre\
\0133) Locris corporation's latest wrist laser.\
\0134) Creshaldyne's 360 degree combat helm.\
\0135) Sorosuub's common Medpack\
\0136) Northern Sun's canteen\
\0137) Northern Sun's combat rations\
\0138) Surronian Bioware shield (defel only)\
\13", 
            }, 
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Vnum = 6616, 
         Weight = 1, 
         Cost = 0, 
         Name = "list", 
         Description = "&z:|: A list of goods :|:", 
         Layers = 0, 
         ItemType = "trash", 
      }, 
      [6617] = 
      {
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
         ShortDescr = "a list", 
         MudProgs = 
         {
            [1] = 
            {
               Code = "if clan($n) == the hunters guild\
mpecho The list clicks as it checks your ID\
mpechoat $n &rPermission granted&w\
else\
mpecho The list clicks as it checks your ID\
mpechoat $n &rPermission Denied&w\
mpforce rece say $n, you fool.\
mpforce rece 'You must be a Hunter.\
mpforce rece punch $n\
endif\
", 
               MudProgType = "exa_prog", 
               Arguments = "100", 
            }, 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "list", 
               Description = "&Y Wanted: Dead \
\13&CCommander Zuggs - Imperial Traitor\
\13Ishi Tib - Jabba Remnant\
\13Kendalina - Escaped Prisoner\
\13Wulgren - Renegade Pirate\
\13 \
\13 &rWanted: Dead or Alive\
\13&zHasti Troujow - Corporate Sector\
\13Commander Willard - Rebel Agent\
\13Nilz Yomm - Rebel Agent\
\13", 
            }, 
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Vnum = 6617, 
         Weight = 1, 
         Cost = 0, 
         Name = "list", 
         Description = "A list of bounties", 
         Layers = 0, 
         ItemType = "trash", 
      }, 
      [6637] = 
      {
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
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
         ShortDescr = "a small key", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 6637, 
         Weight = 1, 
         Cost = 1, 
         Layers = 0, 
         Description = "A small key was dropped here", 
         Name = "a small key", 
         ItemType = "trash", 
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
         High = 103, 
         Low = 0, 
      }, 
   }, 
   Author = "Bleeds", 
}
