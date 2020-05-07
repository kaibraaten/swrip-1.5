-- Hunters Guild
-- Last saved Thursday 07-May-2020 14:47:57

AreaEntry
{
   Filename = "hunters_guild.lua", 
   Name = "Hunters Guild", 
   Mobiles = 
   {
      [6600] = 
      {
         Description = "This bounty hunter is fairly young and doing his part to get into guild\
management. Offering to take care of the registraiton of new members.\
", 
         Name = "guild registerer", 
         Vnum = 6600, 
         Weight = 0, 
         Credits = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         ShortDescr = "Registerer", 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 300, 
            HitNoDice = 6, 
         }, 
         LongDescr = "A young bounty hunter stands here taking your applications.\
", 
         DefaultPosition = "standing", 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "work", 
               MudProgType = "speech_prog", 
               Code = "' your looking for work eh.\
peer $n\
' well you might have the makings of a hunter \
' lets see what jobs we have available right now.\
", 
            }, 
            [2] = 
            {
               Arguments = "jobs", 
               MudProgType = "speech_prog", 
               Code = ", gets a list from under the counter.\
' hmm right now we have the following contracts.\
, looks at list.\
' a disinegration contract for a small time smuggler.\
' Hmm got a bounty for some old guy thats been oggling girls on adari\
too.\
", 
            }, 
            [3] = 
            {
               Arguments = "smuggler", 
               MudProgType = "speech_prog", 
               Code = "' yup he's wanted dead by someone. \
' payment is 2000 credits upon proof of disinigration\
smile $n\
' interested?\
", 
            }, 
            [4] = 
            {
               Arguments = "yes", 
               MudProgType = "speech_prog", 
               Code = "' great , just bring me back proof of disinegration to collect your\
bounty.\
", 
            }, 
            [5] = 
            {
               Arguments = "smugglers ear", 
               MudProgType = "give_prog", 
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
            }, 
            [6] = 
            {
               Arguments = "old", 
               MudProgType = "speech_prog", 
               Code = "' yeah some dirty old man been looking up the wrong skirt.\
snicker $n\
' but hes worth 5k , and that almost buys my time too\
smile $n \
' need to bring back his \"privates\" as proof\
evil\
", 
            }, 
            [7] = 
            {
               Arguments = "privates", 
               MudProgType = "give_prog", 
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
            }, 
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
            DamSizeDice = 9, 
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
      [6601] = 
      {
         Description = "", 
         Name = "Record runner", 
         Vnum = 6601, 
         Weight = 0, 
         Credits = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         ShortDescr = "record runner", 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 200, 
            HitNoDice = 4, 
         }, 
         LongDescr = "A plebe is here running for records\
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
      [6602] = 
      {
         Description = "She looks as tough as nails but what do you expect she works here after\
all.\
", 
         Name = "receptionist", 
         Vnum = 6602, 
         Weight = 0, 
         Credits = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         ShortDescr = "the receptionist", 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 900, 
            HitNoDice = 18, 
         }, 
         LongDescr = "A receptionist is here accepting your bounty's.\
", 
         DefaultPosition = "standing", 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "gives", 
               MudProgType = "act_prog", 
               Code = "if ovnuminv(11101) >= 1\
Say Great! I've been waiting for this package for ages!\
mpwithdraw 2500\
give 2500 credits $n\
mpgain $n 5 100000\
mpat 10299 drop all\
mpat 10299 mppurge\
endif\
", 
            }, 
            [2] = 
            {
               Arguments = "Willard", 
               MudProgType = "act_prog", 
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
            }, 
            [3] = 
            {
               Arguments = "Zuggs", 
               MudProgType = "act_prog", 
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
            }, 
            [4] = 
            {
               Arguments = "Hasti", 
               MudProgType = "act_prog", 
               Code = "", 
            }, 
            [5] = 
            {
               Arguments = "Willard", 
               MudProgType = "act_prog", 
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
            }, 
            [6] = 
            {
               Arguments = "sleejat", 
               MudProgType = "act_prog", 
               Code = "if name($n) == Sleejat\
mpwithdraw 40000\
give $n 40000 credits\
drop 40000 credits\
say Excellent work!!\
mpgain $r 3 40000\
mppurge sleejat\
endif\
", 
            }, 
            [7] = 
            {
               Arguments = "gives", 
               MudProgType = "act_prog", 
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
         DamRoll = 18, 
         HitRoll = 18, 
         NumberOfAttacks = 0, 
         Height = 0, 
         Alignment = 0, 
         Race = "Human", 
         Level = 90, 
         Damage = 
         {
            DamNoDice = 9, 
            DamSizeDice = 10, 
            DamPlus = 2, 
         }, 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Constitution = 10, 
            Wisdom = 10, 
            Dexterity = 10, 
            Strength = 20, 
            Charisma = 10, 
            Intelligence = 10, 
         }, 
         ArmorClass = -125, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
         }, 
         Position = "standing", 
      }, 
      [6603] = 
      {
         Shop = 
         {
            BuyTypes = 
            {
               [1] = "weapon", 
               [2] = "_fireweapon", 
               [3] = "armor", 
               [4] = "grenade", 
               [0] = "medpac", 
            }, 
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
            ProfitSell = 90, 
            ProfitBuy = 100, 
            KeeperShortDescr = "salesman", 
         }, 
         Description = "As fast as new products become available to Bounty Hunters, this salesman\
somehow gets them. Of course they can be a little pricy. But that what you\
pay to get the best i guess. \
", 
         Name = "Salesman", 
         Vnum = 6603, 
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
            HitSizeDice = 10, 
            HitPlus = 1000, 
            HitNoDice = 20, 
         }, 
         LongDescr = "A Salesman is here selling his latest wares.\
", 
         DefaultPosition = "standing", 
         Immune = 
         {
            [20] = "magic", 
            [21] = "paralysis", 
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         RepairShop = 
         {
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
            ShopType = 1, 
            FixTypes = 
            {
               [1] = "weapon", 
               [2] = "none", 
               [0] = "armor", 
            }, 
            ProfitFix = 100, 
            KeeperShortDescr = "salesman", 
         }, 
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
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Breath = 0, 
         }, 
         Race = "Human", 
         DamRoll = 20, 
         HitRoll = 20, 
         Height = 0, 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         Level = 100, 
         Damage = 
         {
            DamNoDice = 10, 
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
            Strength = 20, 
            Charisma = 10, 
            Intelligence = 10, 
         }, 
         ArmorClass = -150, 
         Sex = "undistinguished", 
         Position = "standing", 
      }, 
      [6604] = 
      {
         Description = "This alien is glancing around watching his back. Obviously he is wanted by\
someone for something , just if you could figure out by who and for what,\
", 
         Name = "ophelia head nurse woman human", 
         Vnum = 6604, 
         Weight = 0, 
         Credits = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ShortDescr = "Head Nurse Ophelia", 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitPlus = 250, 
            HitNoDice = 5, 
         }, 
         LongDescr = "A slender nurse in a head nurse's slicks\
", 
         DefaultPosition = "standing", 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "p arrives", 
               MudProgType = "act_prog", 
               Code = "emote blushes furiously and stammers for a moment... \
say H-hello there, $n. Nice to see you. \
emote smiles like there's no tomorrow. \
say Can I do something for you, dear? \
emote stands up, brushing out her dress. \
emote crosses the room to stand before you, looking you over. \
", 
            }, 
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
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Breath = 0, 
         }, 
         Race = "Mon Calamari", 
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
      [6605] = 
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
            ProfitSell = 0, 
            ProfitBuy = 120, 
            KeeperShortDescr = "Armist", 
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
         Name = "Armist Ghesinn barkeep", 
         Vnum = 6605, 
         Weight = 0, 
         Credits = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         ShortDescr = "Armist", 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitPlus = 0, 
            HitNoDice = 0, 
         }, 
         LongDescr = "The barkeep, Armist Ghesinn.\
", 
         DefaultPosition = "standing", 
         Immune = 
         {
            [8] = "poison", 
            [3] = "energy", 
            [20] = "magic", 
            [13] = "nonmagic", 
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
   }, 
   Resets = 
   {
      [1] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 32050, 
         Arg3 = 6627, 
      }, 
      [2] = 
      {
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 32275, 
         Arg3 = 16, 
      }, 
      [3] = 
      {
         Command = "O", 
         MiscData = 0, 
         Arg2 = 2, 
         Arg1 = 6603, 
         Arg3 = 6614, 
      }, 
      [4] = 
      {
         Command = "O", 
         MiscData = 0, 
         Arg2 = 2, 
         Arg1 = 6603, 
         Arg3 = 6613, 
      }, 
      [5] = 
      {
         Command = "O", 
         MiscData = 0, 
         Arg2 = 1, 
         Arg1 = 6605, 
         Arg3 = 6613, 
      }, 
      [6] = 
      {
         Command = "O", 
         MiscData = 0, 
         Arg2 = 1, 
         Arg1 = 6606, 
         Arg3 = 6613, 
      }, 
      [7] = 
      {
         Command = "M", 
         MiscData = 0, 
         Arg2 = 1, 
         Arg1 = 6600, 
         Arg3 = 6616, 
      }, 
      [8] = 
      {
         Command = "M", 
         MiscData = 0, 
         Arg2 = 1, 
         Arg1 = 6601, 
         Arg3 = 6615, 
      }, 
      [9] = 
      {
         Command = "D", 
         MiscData = 0, 
         Arg2 = 2, 
         Arg1 = 6637, 
         Arg3 = 2, 
      }, 
      [10] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 60, 
         Arg1 = 204, 
         Arg3 = 6635, 
      }, 
      [11] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 60, 
         Arg1 = 204, 
         Arg3 = 6635, 
      }, 
      [12] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 60, 
         Arg1 = 204, 
         Arg3 = 6635, 
      }, 
      [13] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 60, 
         Arg1 = 204, 
         Arg3 = 6635, 
      }, 
      [14] = 
      {
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 6601, 
         Arg3 = 6612, 
      }, 
      [15] = 
      {
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 6602, 
         Arg3 = 6612, 
      }, 
      [16] = 
      {
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 6603, 
         Arg3 = 6612, 
      }, 
      [17] = 
      {
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 38, 
         Arg3 = 6612, 
      }, 
      [18] = 
      {
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 32201, 
         Arg3 = 6603, 
      }, 
      [19] = 
      {
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 6615, 
         Arg3 = 6624, 
      }, 
      [20] = 
      {
         Command = "D", 
         MiscData = 0, 
         Arg2 = 0, 
         Arg1 = 6624, 
         Arg3 = 1, 
      }, 
      [21] = 
      {
         Command = "D", 
         MiscData = 0, 
         Arg2 = 0, 
         Arg1 = 6638, 
         Arg3 = 2, 
      }, 
      [22] = 
      {
         Command = "D", 
         MiscData = 0, 
         Arg2 = 0, 
         Arg1 = 6639, 
         Arg3 = 1, 
      }, 
      [23] = 
      {
         Command = "D", 
         MiscData = 0, 
         Arg2 = 1, 
         Arg1 = 6639, 
         Arg3 = 1, 
      }, 
      [24] = 
      {
         Command = "D", 
         MiscData = 0, 
         Arg2 = 2, 
         Arg1 = 6639, 
         Arg3 = 2, 
      }, 
      [25] = 
      {
         Command = "D", 
         MiscData = 0, 
         Arg2 = 3, 
         Arg1 = 6639, 
         Arg3 = 1, 
      }, 
      [26] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 2, 
         Arg1 = 6603, 
         Arg3 = 6629, 
      }, 
      [27] = 
      {
         Command = "G", 
         Arg1 = 10313, 
         Arg2 = 1, 
         MiscData = 1, 
      }, 
      [28] = 
      {
         Command = "G", 
         Arg1 = 10314, 
         Arg2 = 1, 
         MiscData = 1, 
      }, 
      [29] = 
      {
         Command = "G", 
         Arg1 = 32254, 
         Arg2 = 1, 
         MiscData = 1, 
      }, 
      [30] = 
      {
         Command = "G", 
         Arg1 = 6610, 
         Arg2 = 1, 
         MiscData = 1, 
      }, 
      [31] = 
      {
         Command = "G", 
         Arg1 = 6612, 
         Arg2 = 1, 
         MiscData = 1, 
      }, 
      [32] = 
      {
         Command = "G", 
         Arg1 = 33, 
         Arg2 = 1, 
         MiscData = 1, 
      }, 
      [33] = 
      {
         Command = "G", 
         Arg1 = 6637, 
         Arg2 = 1, 
         MiscData = 1, 
      }, 
      [34] = 
      {
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 6616, 
         Arg3 = 6629, 
      }, 
      [35] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 6602, 
         Arg3 = 6604, 
      }, 
      [36] = 
      {
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 6617, 
         Arg3 = 6604, 
      }, 
      [37] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 6604, 
         Arg3 = 6631, 
      }, 
      [38] = 
      {
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 38, 
         Arg3 = 6626, 
      }, 
      [39] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 6605, 
         Arg3 = 6628, 
      }, 
   }, 
   Rooms = 
   {
      [6600] = 
      {
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
         TeleVnum = 0, 
         Vnum = 6600, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Security Door", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               DestinationVnum = 6601, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 31881, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [6601] = 
      {
         Description = "&pTwo standard weapon/biological scanners are implanted into the walls,\
scanning what few sentients and non-sentients decide to pass through this\
hall.  The ceiling and floor are lined with lime colored glow panels, some\
occassionally flickering. \
", 
         TeleVnum = 0, 
         Vnum = 6601, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Security Checkpoint", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 6602, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               DestinationVnum = 6600, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [6602] = 
      {
         Description = "&pThe room sprawls around in silence, pictures and plants scattered through\
the room as if a small tornado was allowed to decorate the room. \
", 
         TeleVnum = 0, 
         Vnum = 6602, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "First Floor Hallway", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 6606, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 6604, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 6601, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 6603, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [6603] = 
      {
         Description = "&pThe lounge of the Guild is lavishly furnished, no expenses spared. Large\
mosaics and statues surround the room, and soothing music in the way of\
some unidentifiable pipe plays lowly in the backround.  It seems obvious\
that the casual observer would guess this a relaxation pit for the rich\
and famous of the galaxy rather than a place to put an ignoble end to some\
sapient member of the galactic community. \
", 
         TeleVnum = 0, 
         Vnum = 6603, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Lounge", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 6602, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [6604] = 
      {
         Description = "&pIt is in this office that all bounty's must be placed. A small line up of\
all races is here each with a personal grudge against someone.  Hope you\
brought enough credit to get you bounty noticed.  \
", 
         TeleVnum = 0, 
         Vnum = 6604, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Bounty Placement Office", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 6602, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [6605] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 6605, 
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
         }, 
         Sector = "city", 
      }, 
      [6606] = 
      {
         Description = "&cThis turbolift is rediculously state-of-the-art. You can see that it's\
internal frame work is carved from zhicera wood: an expensive luxury\
woodwork job from the backwater world of Yharos most likely. The controls\
present you with four options, the ground floor, the Guild compound\
quarters on the second floor, the upper hallway, and the roof entrance.\
", 
         TeleVnum = 0, 
         Vnum = 6606, 
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
         Name = "&W&zCentral Turbolift&W", 
         Exits = 
         {
            [1] = 
            {
               Direction = "somewhere", 
               Key = -1, 
               Flags = 
               {
                  [19] = "Auto", 
               }, 
               DestinationVnum = 6602, 
               Distance = 0, 
               Keyword = "1st Floor", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "somewhere", 
               Key = -1, 
               Flags = 
               {
                  [19] = "Auto", 
               }, 
               DestinationVnum = 6607, 
               Distance = 0, 
               Keyword = "2nd Floor", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "somewhere", 
               Key = -1, 
               Flags = 
               {
                  [19] = "Auto", 
               }, 
               DestinationVnum = 6610, 
               Distance = 0, 
               Keyword = "3rd Floor", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "somewhere", 
               Key = -1, 
               Flags = 
               {
                  [19] = "Auto", 
                  [11] = "Hidden", 
               }, 
               DestinationVnum = 6638, 
               Distance = 0, 
               Keyword = "Prison", 
               Description = "", 
            }, 
            [5] = 
            {
               Direction = "somewhere", 
               Key = -1, 
               Flags = 
               {
                  [19] = "Auto", 
               }, 
               DestinationVnum = 6634, 
               Distance = 0, 
               Keyword = "Roof", 
               Description = "", 
            }, 
            [6] = 
            {
               Direction = "somewhere", 
               Key = -1, 
               Flags = 
               {
                  [19] = "Auto", 
                  [11] = "Hidden", 
               }, 
               DestinationVnum = 6624, 
               Distance = 0, 
               Keyword = "sanctuary", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [6607] = 
      {
         Description = "All the rooms along this hall are owned by various Hunters. being caught\
here and not being a hunter could be dangerous to your health\
", 
         TeleVnum = 0, 
         Vnum = 6607, 
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
         Name = "Quarter's Hallway", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 6608, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 6622, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 6606, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 6621, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [6608] = 
      {
         Description = "All the rooms along this hall are owned by various Hunters. being caught\
here and not being a hunter could be dangerous to your health\
", 
         TeleVnum = 0, 
         Vnum = 6608, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Quarter's Hallway", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 6609, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 6619, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 6607, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 6620, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [6609] = 
      {
         Description = "All the rooms along this hall are owned by various Hunters. being caught\
here and not being a hunter could be dangerous to your health\
", 
         TeleVnum = 0, 
         Vnum = 6609, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Quarter's Hallway", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 6617, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 6608, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 6618, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [6610] = 
      {
         Description = "The upper hall of this building is all offices, it is somewhere on this\
hall that all bounty hunters must register.  As well the offices of the\
leader,first and second are on this floor. \
", 
         TeleVnum = 0, 
         Vnum = 6610, 
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
         Name = "Upper Hallway", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 6611, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 6616, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 6606, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 6615, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [6611] = 
      {
         Description = "The upper hall of this building is all offices, it is somewhere on this\
hall that all bounty hunters must register.  As well the offices of the\
leader,first and second are on this floor. \
", 
         TeleVnum = 0, 
         Vnum = 6611, 
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
         Name = "Upper Hallway", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 6612, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 6614, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 6610, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 6613, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [6612] = 
      {
         Description = "This luxerious office is dominated by a large oak desk. A plush carpet\
lines the floor and  a giant window behind the desk offers a wonderfull\
view of tatooine. teo chairs sit before the desk and it is obvious by\
there placement that they are intended for guest of the guildmaster.\
", 
         TeleVnum = 0, 
         Vnum = 6612, 
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
         Name = "Master Hunter's Office", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 6611, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 6621, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [6613] = 
      {
         Description = "The office of the first is moderate in size, from the in and out box on his\
desk you see that he is always kept bust with day to day life of the\
guild.  A small interview chair sits to   one side of the desk so he may\
preform peliminary interviews for the guildmaster.\
", 
         TeleVnum = 0, 
         Vnum = 6613, 
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
         Name = "Hunter Varssk's Office", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 6611, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [6614] = 
      {
         Description = "/ l This somewhat cramped office is carpeted and has a small desk along the\
east wall. The desc is coverd in a pile of paper work that looks as if it\
hasn't been touched in months.  best to leave here before you disturb\
anything. \
", 
         TeleVnum = 0, 
         Vnum = 6614, 
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
         Name = "Hunter Zaver's Office", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 6611, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [6615] = 
      {
         Description = "this large room houses a complete listing of all the guilds curent and past\
hunters aswell as each of there acusitions. A young apprentice hunter is\
here running for each file that is requested as part of his training to\
undersand each hunters tecnique and abilties.\
", 
         TeleVnum = 0, 
         Vnum = 6615, 
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
         Name = "Hall of Records", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 6610, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [6616] = 
      {
         Description = "All hunters must be registerd with the guild to not be registerd makes you\
an outlaw of the guild aswell as a common murderer. Anyone hunting\
outsides the guild will be hunted and punished unless it was done with one\
of the guild leaders approval. \
", 
         TeleVnum = 0, 
         Vnum = 6616, 
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
         Name = "Registration Office", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 6610, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [6617] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 6617, 
         Flags = 
         {
            [23] = "Hotel", 
            [21] = "EmptyHome", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "An Empty Apartment", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 6609, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [6618] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 6618, 
         Flags = 
         {
            [23] = "Hotel", 
            [21] = "EmptyHome", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "An Empty Apartment", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 6609, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [6619] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 6619, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "&B7", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 6608, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [6620] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 6620, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [21] = "EmptyHome", 
            [2] = "NoMob", 
            [23] = "Hotel", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "&YVarssk's &Rplacid retreat&w", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 6608, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [6621] = 
      {
         Description = "&G&WThe room is completely uncluttered, featuring only a small chest, and a\
neatly kept bed. A small pot of what could be assumed to be some type of\
alchohol with rose-like petals in it, keeps the room smelling of wisteria.\
", 
         TeleVnum = 0, 
         Vnum = 6621, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "&pAn Assassin's Pad&R&W", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 6607, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 6612, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [6622] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 6622, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "&W&w&rJourneyman Protector Outpost &RD43Z&W-&RCF2A&W&w", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 6607, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [6623] = 
      {
         Description = "This hallway is know of only to the hunters guild members to tell anyone of\
this hall is to bring all the hunters down on your head. Remeber this and\
Hunt Well.\
", 
         TeleVnum = 0, 
         Vnum = 6623, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Deep Below Tatooine's Surface", 
         Exits = 
         {
         }, 
         Sector = "city", 
      }, 
      [6624] = 
      {
         Description = "&pThe main hallway of the guild, normally occassioned only to seasoned\
assassins and unpredictable apprentice assassins, this is one of the few\
places in the galaxy where one can wander near such creatures. This is the\
hallowed ground of the guild, where only the blood of traitors may fall to\
the ground. Bright glowpanels, doors, and numerous electronics line the\
walls of the hall. \
", 
         TeleVnum = 0, 
         Vnum = 6624, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               MudProgType = "entry_prog", 
               Code = "if clan($n) == The Assassins Guild\
else\
mpecho Someone yells, 'You don't belong here!'\
mpforce $n s\
endif\
", 
            }, 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Secret Hallway", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
                  [11] = "Hidden", 
               }, 
               DestinationVnum = 6625, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 6630, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 6606, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "somewhere", 
               Key = -1, 
               Flags = 
               {
                  [19] = "Auto", 
                  [11] = "Hidden", 
               }, 
               DestinationVnum = 6629, 
               Distance = 0, 
               Keyword = "Burn", 
               Description = "", 
            }, 
            [5] = 
            {
               Direction = "somewhere", 
               Key = -1, 
               Flags = 
               {
                  [19] = "Auto", 
                  [11] = "Hidden", 
               }, 
               DestinationVnum = 6627, 
               Distance = 0, 
               Keyword = "Freezer", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [6625] = 
      {
         Description = "&pThe hidden hall is known to few of the assassins, although for those that\
do know of it, it is a place of celebration. Both life and death are\
common jokes to those assassins that gather here, and lining the walls\
under light purple glowlining, are multiple skins and trophies, preserved\
for the amusement and awe of later assassins. \
", 
         TeleVnum = 0, 
         Vnum = 6625, 
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
         Name = "&cThe Hidden Hall&R&W", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 6628, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
                  [3] = "Secret", 
               }, 
               DestinationVnum = 6624, 
               Distance = 0, 
               Keyword = "door", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "somewhere", 
               Key = -1, 
               Flags = 
               {
                  [19] = "Auto", 
                  [11] = "Hidden", 
               }, 
               DestinationVnum = 6626, 
               Distance = 0, 
               Keyword = "Relay", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [6626] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 6626, 
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
         Name = "Communications Relay", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 6625, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [6627] = 
      {
         Description = "A large hall is here for the training of all hunters in both skill level\
and physical attributes. Various machines line the walls and all traing is\
regulated by an expirienced hunter. \
", 
         TeleVnum = 0, 
         Vnum = 6627, 
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
         Name = "Hall of Training", 
         Exits = 
         {
            [1] = 
            {
               Direction = "southeast", 
               Key = -1, 
               DestinationVnum = 6624, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [6628] = 
      {
         Description = "&OYou stand in a well sized and lit, unorthodoxly clean, bar. This is the\
gathering place of Hunters without a target, or are merely taking some\
time off. Armist Ghesinn, a former Imperial Commando Captain, stands\
behind the bar, his usual idiot grin evident on his face as he cleans mugs\
and swaps both brew and story with the few customers. \
", 
         TeleVnum = 0, 
         Vnum = 6628, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Ghesinn's Bar", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 6625, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [6629] = 
      {
         Description = "Although nothing is for sale now , we hope in the future to possess hunter\
speacial equipment. \
", 
         TeleVnum = 0, 
         Vnum = 6629, 
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
         Name = "Bounty Hunter Equipmet", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 6624, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [6630] = 
      {
         Description = "&G&WThe medical wing is brightly lit, featuring numerous medical droids and\
a sparse number of biological assistants. However, the staff of the\
medical wing of the guild is easily explanable; Most wounded guild members\
don't make it home. \
", 
         TeleVnum = 0, 
         Vnum = 6630, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Medical Wing", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 6631, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Flags = 
               {
                  [19] = "Auto", 
               }, 
               DestinationVnum = 6624, 
               Distance = 0, 
               Keyword = "west", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [6631] = 
      {
         Description = "&G&WThe head nurse's office is typically bland, smelling of solvents and\
bacta from the tank just to the east of it.  The room is dimly lit, in\
almost soothing blue tones. Obviously someone likes to do their business,\
whether it be in mind or body, here. \
", 
         TeleVnum = 0, 
         Vnum = 6631, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               MudProgType = "entry_prog", 
               Code = "mpecho &bThe lights in the room snap on abruptly...\
mpecho &OThere is a flurry of motion behind the desk as the chair turns..\
", 
            }, 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Head Nurse's Office", 
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
               DestinationVnum = 6632, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 6630, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [6632] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 6632, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               MudProgType = "rand_prog", 
               Code = "feel heal $n\
feel heal $n\
feel refresh $n\
feel refresh $n\
", 
            }, 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Bacta Tank", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Key = -1, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               DestinationVnum = 6631, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [6633] = 
      {
         Description = "This room monitor's the landing pad and those that walk through\
it.\
", 
         TeleVnum = 0, 
         Vnum = 6633, 
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
         Name = "Security box", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = 6637, 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
                  [5] = "PickProof", 
                  [23] = "BashProof", 
               }, 
               DestinationVnum = 6637, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               Flags = 
               {
                  [25] = "Window", 
               }, 
               DestinationVnum = 6635, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [6634] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 6634, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               MudProgType = "entry_prog", 
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
            }, 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Large Roof", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 6606, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 6635, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 6637, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [6635] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 6635, 
         Flags = 
         {
            [4] = "CanLand", 
            [5] = "CanFly", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               MudProgType = "entry_prog", 
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
            }, 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Guild Private Landing Pad", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Flags = 
               {
                  [24] = "NoMob", 
               }, 
               DestinationVnum = 6634, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [6636] = 
      {
         Description = "This room monitor's the landing pad and those that walk through it.\
", 
         TeleVnum = 0, 
         Vnum = 6636, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "Security Box", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Flags = 
               {
                  [25] = "Window", 
               }, 
               DestinationVnum = 6635, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [6637] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 6637, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Large Roof", 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 6634, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = 6637, 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
               }, 
               DestinationVnum = 6633, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [6638] = 
      {
         Description = "Pitted durasteel forms the walls and ceiling above.  Rough stone  is\
chiseled to make the floor, leaving the possibility of tripping  sentients\
unfamiliar with the hallway.  The corridor ends to the north  at 3 doors.\
Pitted durasteel forms the walls and ceiling above.  Rough stone  is\
chiseled to make the floor, leaving the possibility of tripping  sentients\
unfamiliar with the hallway.  A steel door leads north,  with a control\
pad to the right.\
", 
         TeleVnum = 0, 
         Vnum = 6638, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "5", 
               MudProgType = "entry_prog", 
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
            }, 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "A dark hallway", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = 6637, 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
               }, 
               DestinationVnum = 6639, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 6606, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [6639] = 
      {
         Description = "Pitted durasteel forms the walls and ceiling above.  Rough stone  is\
chiseled to make the floor, leaving the possibility of tripping  sentients\
unfamiliar with the hallway.  The corridor ends to the north  at 3 doors.\
", 
         TeleVnum = 0, 
         Vnum = 6639, 
         Flags = 
         {
            [30] = "Prototype", 
            [7] = "NoMagic", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "20", 
               MudProgType = "entry_prog", 
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
            }, 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "A dark hallway", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               DestinationVnum = 6642, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               DestinationVnum = 6640, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Key = 6637, 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
               }, 
               DestinationVnum = 6638, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Key = -1, 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               DestinationVnum = 6641, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [6640] = 
      {
         Description = "The dark cell was carved out of the stone forming the foundation of  the\
building above.  A ledge carved to form a stone bed lines one wall,  while\
a quarter metre hole, a hand deep, forms the privy. The dark cell was\
carved out of the stone forming the foundation of  the building above.  A\
ledge carved to form a stone bed lines one wall,  while a quarter metre\
hole, a hand deep, forms the privy. \
", 
         TeleVnum = 0, 
         Vnum = 6640, 
         Flags = 
         {
            [0] = "Dark", 
            [23] = "Hotel", 
            [30] = "Prototype", 
            [7] = "NoMagic", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "A dark cell", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Key = -1, 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
                  [5] = "PickProof", 
               }, 
               DestinationVnum = 6639, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [6641] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 6641, 
         Flags = 
         {
            [0] = "Dark", 
            [23] = "Hotel", 
            [30] = "Prototype", 
            [7] = "NoMagic", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "A dark cell", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
                  [5] = "PickProof", 
               }, 
               DestinationVnum = 6639, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [6642] = 
      {
         Description = "The dark cell was carved out of the stone forming the foundation of  the\
building above.  A ledge carved to form a stone bed lines one wall,  while\
a quarter metre hole, a hand deep, forms the privy.   \
", 
         TeleVnum = 0, 
         Vnum = 6642, 
         Flags = 
         {
            [0] = "Dark", 
            [23] = "Hotel", 
            [30] = "Prototype", 
            [7] = "NoMagic", 
         }, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Name = "A dark cell", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
                  [5] = "PickProof", 
               }, 
               DestinationVnum = 6639, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Sector = "city", 
      }, 
      [6643] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 6643, 
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
         }, 
         Sector = "city", 
      }, 
      [6650] = 
      {
         Description = "", 
         TeleVnum = 0, 
         Vnum = 6650, 
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
         }, 
         Sector = "city", 
      }, 
   }, 
   LevelRanges = 
   {
      Hard = 
      {
         Low = 0, 
         High = 103, 
      }, 
      Soft = 
      {
         Low = 0, 
         High = 0, 
      }, 
   }, 
   Objects = 
   {
      [6600] = 
      {
         ActionDescription = "", 
         Name = "terminal board message", 
         Vnum = 6600, 
         Weight = 1, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         ShortDescr = "a terminal", 
         Description = "A galactic net message terminal is installed on the wall here.", 
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
            [1] = 
            {
               Keyword = "terminal board message", 
               Description = "A small computer terminal is installed on the wall for passengers to\
\13leave comments to the operators. To learn more about its usage type\
\13'HELP MESSAGE'.\
\13", 
            }, 
         }, 
         Cost = 0, 
      }, 
      [6601] = 
      {
         ActionDescription = "", 
         Name = "guildmasters desk", 
         Vnum = 6601, 
         Weight = 1, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         ShortDescr = "guildmasters desk", 
         Description = "A giant wooden desk.", 
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
               Keyword = "guildmasters desk", 
               Description = "This desk is huge and made of the finest woods credits can find. Kept\
\13impecable by the guildmasters secratary you wonder if he even does any\
\13work.\
\13", 
            }, 
         }, 
         Cost = 0, 
      }, 
      [6602] = 
      {
         ActionDescription = "", 
         Name = "guildmasters chair", 
         Vnum = 6602, 
         Weight = 1, 
         ShortDescr = "guildmasters  chair", 
         Description = "A giant managers chair.", 
         ItemType = "trash", 
         Layers = 0, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 2, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "guildmasters chair", 
               Description = "this chair is so cushy its digusting.\
\13", 
            }, 
         }, 
         Cost = 0, 
      }, 
      [6603] = 
      {
         ActionDescription = "", 
         Name = "Guest chair", 
         Vnum = 6603, 
         Weight = 1, 
         ShortDescr = "guest chair", 
         Description = "A uncomfortable guests chair.", 
         ItemType = "furniture", 
         Layers = 0, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 2, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "Guest chair", 
               Description = "A chair four legs and a seat.\
\13", 
            }, 
         }, 
         Cost = 0, 
      }, 
      [6604] = 
      {
         ActionDescription = "", 
         Name = "small table", 
         Vnum = 6604, 
         Weight = 100, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         ShortDescr = "small table", 
         Description = "A small table is here acting as a desk.", 
         ItemType = "furniture", 
         Layers = 0, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 1, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 3, 
         }, 
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
         Cost = 0, 
      }, 
      [6605] = 
      {
         ActionDescription = "", 
         Name = "Small Desk", 
         Vnum = 6605, 
         Weight = 1, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         ShortDescr = "small desk", 
         Description = "A small desk sits here.", 
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
            [1] = 
            {
               Keyword = "Small Desk", 
               Description = "A small desk is here covered in paperwork , some of it looks like it might\
\13be important. \
\13", 
            }, 
            [2] = 
            {
               Keyword = "Paper", 
               Description = "This paper says a single word: Labria : wonder what it means\
\13", 
            }, 
         }, 
         Cost = 0, 
      }, 
      [6606] = 
      {
         ActionDescription = "", 
         Name = "Managers chair", 
         Vnum = 6606, 
         Weight = 100, 
         ShortDescr = "managers chair", 
         Description = "A small managers chair.", 
         ItemType = "furniture", 
         Layers = 0, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 2, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "Managers chair", 
               Description = "This chair looks well used by the poor sole that has to sit on it.\
\13", 
            }, 
         }, 
         Cost = 0, 
      }, 
      [6607] = 
      {
         ActionDescription = "", 
         Name = "thermal detonator", 
         Vnum = 6607, 
         Weight = 1, 
         Description = "A small silver ball lies here.", 
         ShortDescr = "thermal detonator", 
         Layers = 0, 
         ItemType = "grenade", 
         ObjectValues = 
         {
            [1] = 3000, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2000, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "thermal detonator", 
               Description = "once you arm this baby run for your life.\
\13", 
            }, 
         }, 
         Cost = 900000, 
      }, 
      [6608] = 
      {
         Affects = 
         {
            [1] = 
            {
               Location = 18, 
               Modifier = 1, 
            }, 
            [2] = 
            {
               Location = 19, 
               Modifier = 1, 
            }, 
         }, 
         ActionDescription = "", 
         Name = "Riot gun", 
         Vnum = 6608, 
         Weight = 15, 
         Description = "A riot gun is lying here", 
         ShortDescr = "a Riot Gun.", 
         Layers = 0, 
         ItemType = "weapon", 
         ObjectValues = 
         {
            [1] = 10, 
            [2] = 4, 
            [3] = 6, 
            [4] = 2000, 
            [5] = 2000, 
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
         Cost = 3000, 
      }, 
      [6609] = 
      {
         ActionDescription = "", 
         Name = "advanced ammunition cell", 
         Vnum = 6609, 
         Weight = 1, 
         Description = "An advanced ammunition cell was dropped here.", 
         ShortDescr = "an advanced ammunition cell", 
         Layers = 0, 
         ItemType = "ammo", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2000, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 100, 
      }, 
      [6610] = 
      {
         Affects = 
         {
            [1] = 
            {
               Location = 26, 
               Modifier = 16777216, 
            }, 
         }, 
         ActionDescription = "", 
         Name = "Creshaldyne Heavy Combat Helmet", 
         Vnum = 6610, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               MudProgType = "use_prog", 
               Code = "mpechoat $n &YYou feel as if your eyes can see further.\
", 
            }, 
         }, 
         Weight = 1, 
         Description = "A pale grey helmet lies here.", 
         Flags = 
         {
            [24] = "_24", 
            [17] = "_17", 
            [22] = "_22", 
            [15] = "_15", 
         }, 
         ShortDescr = "Creshaldyne Heavy Combat Helmet", 
         Layers = 0, 
         ItemType = "armor", 
         ObjectValues = 
         {
            [1] = 9, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [4] = "Head", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 2000, 
      }, 
      [6611] = 
      {
         ActionDescription = "", 
         Name = "Smugglers ear", 
         Vnum = 6611, 
         Weight = 1, 
         Description = "A bloodied ear lies in the dust here.", 
         ShortDescr = "smugglers ear", 
         Layers = 0, 
         ItemType = "trash", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 1, 
      }, 
      [6612] = 
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
         Name = "Locris ppl-3 wrist laser", 
         Vnum = 6612, 
         Weight = 1, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               MudProgType = "use_prog", 
               Code = "mpechoat $n &YThe laser seems perfect for your wrist.\
", 
            }, 
         }, 
         Description = "A wrist blaster lies here on the ground.", 
         ShortDescr = "Locris PPL-3 Wrist Laser", 
         Layers = 0, 
         ItemType = "armor", 
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
            [12] = "Wrist", 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "Locris ppl-3 wrist laser", 
               Description = "A small blaster that fits around your wrist.\
\13", 
            }, 
            [2] = 
            {
               Keyword = "Locris ppl-3 wrist laser", 
               Description = "", 
            }, 
         }, 
         Cost = 3000, 
      }, 
      [6613] = 
      {
         ActionDescription = "", 
         Name = "Third Body", 
         Vnum = 6613, 
         Weight = 1, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               MudProgType = "use_prog", 
               Code = "feel good $n\
mpechoat $n &YYou feel stronger.\
", 
            }, 
         }, 
         Description = "A &Y Third Body&R&W is here.", 
         ShortDescr = "&YThird Body&R&W", 
         Layers = 96, 
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
            [3] = "Body", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
      }, 
      [6614] = 
      {
         ActionDescription = "", 
         Name = "a plaque", 
         Vnum = 6614, 
         Weight = 1, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         ShortDescr = "a plaque", 
         Description = "A plaque is tacked to the wall.", 
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
            [1] = 
            {
               Keyword = "a plaque", 
               Description = "A list of bounty hunters to distinguish the guild, both a part of it and\
\13rogue hunters with great ability: Boba Fett, Borrsk, Kada the Ewok, and\
\13many others.\
\13", 
            }, 
         }, 
         Cost = 0, 
      }, 
      [6615] = 
      {
         ActionDescription = "", 
         Name = "Assassins Guild Board", 
         Vnum = 6615, 
         Weight = 1000, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         ShortDescr = "a Hunter's Guild Board", 
         Description = "The Assassins Guild Board", 
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
      [6616] = 
      {
         ActionDescription = "", 
         Name = "list", 
         Vnum = 6616, 
         Weight = 1, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         ShortDescr = "a list", 
         Description = "&z:|: A list of goods :|:", 
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
         Cost = 0, 
      }, 
      [6617] = 
      {
         ActionDescription = "", 
         Name = "list", 
         Vnum = 6617, 
         Weight = 1, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               MudProgType = "exa_prog", 
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
            }, 
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         ShortDescr = "a list", 
         Description = "A list of bounties", 
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
         Cost = 0, 
      }, 
      [6637] = 
      {
         ActionDescription = "", 
         Name = "a small key", 
         Vnum = 6637, 
         Weight = 1, 
         Description = "A small key was dropped here", 
         ShortDescr = "a small key", 
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
            [2] = "Neck", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 1, 
      }, 
   }, 
   HighEconomy = 0, 
   VnumRanges = 
   {
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
      Object = 
      {
         Last = 6637, 
         First = 6600, 
      }, 
   }, 
   ResetFrequency = 0, 
   ResetMessage = "A cleaning droid sweeps by, narrowly missing you.", 
   FileFormatVersion = 1, 
   LowEconomy = 14558642, 
   Author = "Bleeds", 
}
