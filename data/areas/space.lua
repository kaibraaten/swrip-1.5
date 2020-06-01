-- Spacecraft and Orbiting Shipyards
-- Last saved Monday 01-Jun-2020 11:08:47

AreaEntry
{
   Filename = "space.lua", 
   VnumRanges = 
   {
      Room = 
      {
         First = 32000, 
         Last = 32499, 
      }, 
      Mob = 
      {
         First = 32000, 
         Last = 32499, 
      }, 
      Object = 
      {
         First = 32000, 
         Last = 32499, 
      }, 
   }, 
   FileFormatVersion = 1, 
   Mobiles = 
   {
      [32000] = 
      {
         LongDescr = "Some god abandoned a newly created firstmob here.\
", 
         Level = 1, 
         Height = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
         Credits = 0, 
         Name = "firstmob", 
         ShortDescr = "a newly created firstmob", 
         Race = "Human", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
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
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Wisdom = 0, 
         }, 
         DamRoll = 0, 
         Sex = "undistinguished", 
         HitRoll = 0, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         Position = "standing", 
         ArmorClass = 0, 
         Description = "", 
         Vnum = 32000, 
         Alignment = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         DefaultPosition = "standing", 
      }, 
      [32001] = 
      {
         LongDescr = "An imperial guard stands at attention.\
", 
         Level = 15, 
         Height = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 1, 
            DamSizeDice = 10, 
         }, 
         Credits = 15, 
         Name = "imperial trooper guard", 
         ShortDescr = "an imperial guard", 
         SpecFuns = 
         {
            [0] = "spec_stormtrooper", 
         }, 
         Race = "Human", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
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
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Wisdom = 0, 
         }, 
         DamRoll = 3, 
         Sex = "undistinguished", 
         HitRoll = 3, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         Position = "standing", 
         ArmorClass = 62, 
         Description = "The imperial guard stands at an unwaivering alert attention. He is\
dressed in the standard black imperial military uniform common to\
many imperial naval troopers. \
", 
         Vnum = 32001, 
         Alignment = -500, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         DefaultPosition = "standing", 
      }, 
      [32002] = 
      {
         LongDescr = "Brennik, the pluogus bartender is here selling drinks.\
", 
         Level = 50, 
         Height = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 6, 
            DamSizeDice = 4, 
         }, 
         Credits = 0, 
         Shop = 
         {
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
            KeeperShortDescr = "Brennik", 
            ProfitBuy = 120, 
            ProfitSell = 90, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
         }, 
         Name = "Brennik Torien", 
         ShortDescr = "Brennik", 
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
         Race = "Human", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         Immune = 
         {
            [20] = "magic", 
            [11] = "charm", 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Wisdom = 0, 
         }, 
         DamRoll = 10, 
         Sex = "male", 
         HitRoll = 10, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         Position = "standing", 
         ArmorClass = 0, 
         Description = "Brennik Torien is not the most attractive correlien you've ever seen\
but he is by no means ugly either. His apearance does however suffer\
somewhat from the dark bags under his eyes that suggest long hours of\
work. He is slim and agile and moves quickly and gracefully between\
customers. His voice is strong and caries well across the crowded bar\
room yet is comforting at the same time. You feel that many people\
would find it quite easy to talk of just about anything to this man.\
", 
         Vnum = 32002, 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [24] = "NoAssist", 
            [25] = "NoKill", 
            [0] = "Npc", 
         }, 
         DefaultPosition = "standing", 
      }, 
      [32003] = 
      {
         LongDescr = "An imperial customs officer is here checking for illegal weapons.\
", 
         Level = 30, 
         Height = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 4, 
            DamSizeDice = 4, 
         }, 
         Credits = 86, 
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
         DamRoll = 5, 
         Name = "imperial customs officer", 
         ShortDescr = "an imperial customs officer", 
         SpecFuns = 
         {
            [1] = "spec_customs_weapons", 
            [0] = "spec_police_fine", 
         }, 
         Race = "Human", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         VipFlags = 
         {
            [10] = "Byss", 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Wisdom = 0, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpecho A customs officer drops something into a small chute.\
mpat 32083 drop all\
", 
               MudProgType = "rand_prog", 
               Arguments = "1", 
            }, 
            [2] = 
            {
               Code = "if clan($n) == The Empire\
drop all\
else\
if clan($n) == The Death Commandos\
drop all\
endif\
endif\
", 
               MudProgType = "speech_prog", 
               Arguments = "dropem", 
            }, 
            [3] = 
            {
               Code = "if clan($n) == The Empire\
drop all\
else\
if clan($n) == The Death Commandos\
drop all\
endif\
endif\
", 
               MudProgType = "speech_prog", 
               Arguments = "dropem", 
            }, 
         }, 
         Sex = "undistinguished", 
         HitRoll = 5, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         Position = "standing", 
         ArmorClass = 25, 
         Description = "This is an older officer dressed in a dull black uniform. As each\
person passes by he looks them over and briefly scans them.\
", 
         Vnum = 32003, 
         Alignment = -500, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         DefaultPosition = "standing", 
      }, 
      [32004] = 
      {
         LongDescr = "A rebel alliance trooper is ready for battle.\
", 
         Level = 25, 
         Height = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 3, 
            DamSizeDice = 4, 
         }, 
         Credits = 0, 
         Name = "rebel alliance trooper soldier", 
         ShortDescr = "a rebel alliance trooper", 
         SpecFuns = 
         {
            [0] = "spec_rebel_trooper", 
         }, 
         Race = "Human", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
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
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Wisdom = 0, 
         }, 
         DamRoll = 4, 
         Sex = "undistinguished", 
         HitRoll = 4, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         Position = "standing", 
         ArmorClass = 38, 
         Description = "The rebel alliance trooper has a cold look of determination in his eyes.\
With the war between the rebel alliance and the old empire escalating\
again all the troopers are doing extra training. He is well prepared\
for battle. \
", 
         Vnum = 32004, 
         Alignment = 200, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         DefaultPosition = "standing", 
      }, 
      [32005] = 
      {
         LongDescr = "A drunk Bith is slumped over the bar muttering to himself.\
", 
         Level = 2, 
         Height = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
         Credits = 7, 
         Name = "drunk Bith passenger", 
         ShortDescr = "a drunk Bith", 
         Race = "Human", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
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
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Wisdom = 0, 
         }, 
         DamRoll = 0, 
         Sex = "undistinguished", 
         HitRoll = 0, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         Position = "standing", 
         ArmorClass = 100, 
         Description = "The only thing keeping this Bith from falling over backwards is the\
size of his head leaned over the bar. Biths have large greyish white\
heads that are almost featureless save their large black eyes. They\
are a highly eveloved race, well known for their advanced\
intellegence.... at least when they're sober.\
", 
         Vnum = 32005, 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [24] = "NoAssist", 
         }, 
         DefaultPosition = "standing", 
      }, 
      [32006] = 
      {
         LongDescr = "An old man stands contemplating the stars.\
", 
         Level = 103, 
         Height = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
         Credits = 0, 
         Name = "old teacher master man human scholar", 
         ShortDescr = "an old man", 
         Race = "Human", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
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
               [26] = "falleen", 
               [27] = "binary", 
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
               [7] = "ewokese", 
               [8] = "ithorese", 
               [9] = "antarian", 
               [10] = "devaronese", 
               [14] = "gamorrese", 
               [17] = "jawaese", 
               [18] = "_clan", 
               [19] = "adarese", 
               [20] = "verpine", 
               [21] = "defel", 
               [22] = "dosh", 
               [23] = "chadra-fan", 
               [24] = "quarrenese", 
               [25] = "sullustese", 
               [28] = "yevethan", 
               [0] = "basic", 
            }, 
         }, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Wisdom = 0, 
         }, 
         DamRoll = 0, 
         Sex = "undistinguished", 
         HitRoll = 0, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         Position = "standing", 
         ArmorClass = 0, 
         Description = "This old human man seems to be content just gazing at the stars. He is\
dressed in a long hooded cloak and old brown boots. from the scars on\
his face you think that this man has seen a fair share of action in\
his days.\
Maybe he could teach you a thing or two....\
", 
         Vnum = 32006, 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [10] = "Practice", 
            [20] = "Scholar", 
         }, 
         DefaultPosition = "standing", 
      }, 
      [32007] = 
      {
         LongDescr = "An Imperial flight instructor is here waiting for his students.\
", 
         Level = 100, 
         Height = 0, 
         Damage = 
         {
            DamPlus = 2, 
            DamNoDice = 10, 
            DamSizeDice = 4, 
         }, 
         Credits = 100, 
         Name = "imperial flight officer", 
         ShortDescr = "a flight officer", 
         DamRoll = 20, 
         Race = "Human", 
         HitChance = 
         {
            HitPlus = 1000, 
            HitSizeDice = 10, 
            HitNoDice = 20, 
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
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Wisdom = 0, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "say <ooc> Read help identify before taking a ship out please! Be\
say cautious\
", 
               MudProgType = "rand_prog", 
               Arguments = "100", 
            }, 
         }, 
         Sex = "undistinguished", 
         HitRoll = 20, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         Position = "standing", 
         ArmorClass = -150, 
         Description = "The imperial flight instructer is dressed in a navy blue uniform. It\
is decorated with his rank insignia and several medals. He would be\
an excellent teacher for pilots. \
", 
         Vnum = 32007, 
         Alignment = -500, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [10] = "Practice", 
            [30] = "Prototype", 
         }, 
         DefaultPosition = "standing", 
      }, 
      [32008] = 
      {
         LongDescr = "A flight instructor is waiting for her student.\
", 
         Level = 100, 
         Height = 0, 
         Damage = 
         {
            DamPlus = 2, 
            DamNoDice = 10, 
            DamSizeDice = 4, 
         }, 
         Credits = 130, 
         Name = "Rebel Alliance flight instructor", 
         ShortDescr = "a flight instructor", 
         DamRoll = 20, 
         Race = "Human", 
         HitChance = 
         {
            HitPlus = 1000, 
            HitSizeDice = 10, 
            HitNoDice = 20, 
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
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Wisdom = 0, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "say <ooc> Read help identify before taking a ship out please!  Be cautious.\
", 
               MudProgType = "rand_prog", 
               Arguments = "10", 
            }, 
         }, 
         Sex = "female", 
         HitRoll = 20, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         Position = "standing", 
         ArmorClass = -150, 
         Description = "The flight instructor is a human woman, probably in her late 30's. She\
is wearing several decorations on her flight suit indicating her\
expertise as a pilot. She would probably make an excellent teacher -\
maybe she'll give you a few lessons. \
", 
         Vnum = 32008, 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [10] = "Practice", 
         }, 
         DefaultPosition = "standing", 
      }, 
      [32009] = 
      {
         LongDescr = "A suspicious looking fellow sits in a corner booth.\
", 
         Level = 100, 
         Height = 0, 
         Damage = 
         {
            DamPlus = 2, 
            DamNoDice = 10, 
            DamSizeDice = 4, 
         }, 
         Credits = 200, 
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
         Name = "suspicious fellow", 
         ShortDescr = "a smuggler", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         Race = "Human", 
         HitChance = 
         {
            HitPlus = 1000, 
            HitSizeDice = 10, 
            HitNoDice = 20, 
         }, 
         AttackFlags = 
         {
            [10] = "_10", 
            [18] = "_18", 
         }, 
         DefaultPosition = "standing", 
         Stats = 
         {
            Dexterity = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Wisdom = 0, 
         }, 
         DamRoll = 20, 
         Sex = "undistinguished", 
         HitRoll = 20, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         Position = "standing", 
         ArmorClass = -150, 
         Description = "This human is in his mid to late thirties. He is wearing some old\
flight pants with a t-shirt and a grey hide jacket. From the look in\
his eye you can tell he is very alert to his surroundings suggesting\
that he is very skilled at whatever it is he does... Maybe he could\
give you some lessons.\
", 
         Vnum = 32009, 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [10] = "Practice", 
         }, 
         DefenseFlags = 
         {
            [19] = "disarm", 
         }, 
      }, 
      [32010] = 
      {
         LongDescr = "A Twi'lek craftswoman is here selling her crafts.\
", 
         Level = 100, 
         Height = 0, 
         Damage = 
         {
            DamPlus = 2, 
            DamNoDice = 10, 
            DamSizeDice = 4, 
         }, 
         Credits = 20, 
         Name = "Twilek craftswoman woman", 
         ShortDescr = "a Twi'lek craftswoman", 
         Race = "Twi'lek", 
         HitChance = 
         {
            HitPlus = 1000, 
            HitSizeDice = 10, 
            HitNoDice = 20, 
         }, 
         Languages = 
         {
            Speaks = 
            {
               [2] = "twileki", 
            }, 
            Speaking = 
            {
               [2] = "twileki", 
            }, 
         }, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Wisdom = 0, 
         }, 
         DamRoll = 20, 
         Sex = "female", 
         HitRoll = 20, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         Position = "standing", 
         ArmorClass = -150, 
         Description = "This old twilek woman has a booth with some incredably beautiful\
items. She is very skilled in her craft. Maybe she could teach you a\
few things.\
", 
         Vnum = 32010, 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [10] = "Practice", 
         }, 
         DefaultPosition = "standing", 
      }, 
      [32011] = 
      {
         LongDescr = "An Imperial training officer is off duty.\
", 
         Level = 100, 
         Height = 0, 
         Damage = 
         {
            DamPlus = 2, 
            DamNoDice = 10, 
            DamSizeDice = 4, 
         }, 
         Credits = 0, 
         Name = "new repulic training officer", 
         ShortDescr = "a training officer", 
         Race = "Human", 
         HitChance = 
         {
            HitPlus = 1000, 
            HitSizeDice = 10, 
            HitNoDice = 20, 
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
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Wisdom = 0, 
         }, 
         DamRoll = 20, 
         Sex = "male", 
         HitRoll = 20, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         Position = "standing", 
         ArmorClass = -150, 
         Description = "The training officer is dressed in a light beigh uniform. He is an\
older man who has probably seen years of service. Rumor has it he\
fought in the battle of Hoth. \
", 
         Vnum = 32011, 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [9] = "Train", 
            [10] = "Practice", 
            [30] = "Prototype", 
         }, 
         DefaultPosition = "standing", 
      }, 
      [32012] = 
      {
         LongDescr = "A drill seargent is here training troops.\
", 
         Level = 100, 
         Height = 0, 
         Damage = 
         {
            DamPlus = 2, 
            DamNoDice = 10, 
            DamSizeDice = 4, 
         }, 
         Credits = 12, 
         Name = "imperial trooper drill seargent", 
         ShortDescr = "a drill seargent", 
         Race = "Human", 
         HitChance = 
         {
            HitPlus = 1000, 
            HitSizeDice = 10, 
            HitNoDice = 20, 
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
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Wisdom = 0, 
         }, 
         DamRoll = 20, 
         Sex = "male", 
         HitRoll = 20, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         Position = "standing", 
         ArmorClass = -150, 
         Description = "He has the cold stern look of a hardened soldier. Maybe he could teach\
you a thing or two about what being in the military is all about. \
", 
         Vnum = 32012, 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [10] = "Practice", 
         }, 
         DefaultPosition = "standing", 
      }, 
      [32013] = 
      {
         LongDescr = "A young pilot is here preparing for flight.\
", 
         Level = 10, 
         Height = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 1, 
            DamSizeDice = 4, 
         }, 
         Credits = 43, 
         Name = "young pilot rebel alliance pilot", 
         ShortDescr = "a young pilot", 
         Race = "Human", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
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
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Wisdom = 0, 
         }, 
         DamRoll = 2, 
         Sex = "undistinguished", 
         HitRoll = 2, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         Position = "standing", 
         ArmorClass = 75, 
         Description = "The pilot is a young human in is late teens. He wears a big smile on\
his face as he watches the ships launch from the platform ahead. He\
is dressed in a orange Rebel Alliance flight suit.\
", 
         Vnum = 32013, 
         Alignment = 300, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         DefaultPosition = "standing", 
      }, 
      [32014] = 
      {
         LongDescr = "A technician is readying ships for launch.\
", 
         Level = 9, 
         Height = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
         Credits = 0, 
         Name = "technician", 
         ShortDescr = "a technician", 
         Race = "Human", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
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
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Wisdom = 0, 
         }, 
         DamRoll = 1, 
         Sex = "male", 
         HitRoll = 1, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         Position = "standing", 
         ArmorClass = 80, 
         Description = "This is a young human tecnician. He is dressed in a grey worksuit that\
is smuged with greasea. Several tools hang from a belt around his\
waist.\
", 
         Vnum = 32014, 
         Alignment = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [24] = "NoAssist", 
         }, 
         DefaultPosition = "standing", 
      }, 
      [32015] = 
      {
         LongDescr = "A retail droid is here to assist you with your purchaces.\
", 
         Level = 10, 
         Height = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
         Credits = 0, 
         Shop = 
         {
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
            KeeperShortDescr = "a retail droid", 
            ProfitBuy = 120, 
            ProfitSell = 90, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
         }, 
         Name = "retail droid", 
         ShortDescr = "a retail droid", 
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
            Speaking = 
            {
               [1] = "shyriiwook", 
               [2] = "twileki", 
               [3] = "rodese", 
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
         Race = "Human", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         Immune = 
         {
            [20] = "magic", 
            [11] = "charm", 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Wisdom = 0, 
         }, 
         DamRoll = 0, 
         Sex = "undistinguished", 
         HitRoll = 0, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         Position = "standing", 
         ArmorClass = 0, 
         Description = "The retail droid is similar in apearance to a standard proticol droid.\
It is fittened however with a crdit exchange terminal in its hip and\
is programmed to be an expert salesperson.\
", 
         Vnum = 32015, 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [26] = "Droid", 
         }, 
         DefaultPosition = "standing", 
      }, 
      [32016] = 
      {
         LongDescr = "A new rebublic trooper is off duty.\
", 
         Level = 12, 
         Height = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 1, 
            DamSizeDice = 6, 
         }, 
         Credits = 0, 
         Name = "rebel alliance trooper", 
         ShortDescr = "a rebel alliance trooper", 
         SpecFuns = 
         {
            [0] = "spec_rebel_trooper", 
         }, 
         Race = "Human", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
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
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Wisdom = 0, 
         }, 
         DamRoll = 2, 
         Sex = "undistinguished", 
         HitRoll = 2, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         Position = "standing", 
         ArmorClass = 75, 
         Description = "", 
         Vnum = 32016, 
         Alignment = 300, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         DefaultPosition = "standing", 
      }, 
      [32017] = 
      {
         LongDescr = "A rebel alliance pilot is here.\
", 
         Level = 12, 
         Height = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 1, 
            DamSizeDice = 6, 
         }, 
         Credits = 22, 
         Name = "rebel alliance pilot nrp00", 
         ShortDescr = "a rebel alliance pilot", 
         Race = "Human", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
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
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Wisdom = 0, 
         }, 
         DamRoll = 2, 
         Sex = "male", 
         HitRoll = 2, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         Position = "standing", 
         ArmorClass = 50, 
         Description = "The pilot is dressed in a light grey rebel alliance flight suit. He\
walks with a slight smile on his face as he checks the pressure\
controls on his chestplate.\
", 
         Vnum = 32017, 
         Alignment = 200, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         DefaultPosition = "standing", 
      }, 
      [32018] = 
      {
         LongDescr = "A binary load lifter methodicly goes about its work.\
", 
         Level = 20, 
         Height = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
         Credits = 0, 
         Name = "binary load lifter droid", 
         ShortDescr = "a binary load lifter", 
         Race = "Human", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         Languages = 
         {
            Speaks = 
            {
               [11] = "barabel", 
            }, 
            Speaking = 
            {
               [11] = "barabel", 
            }, 
         }, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Wisdom = 0, 
         }, 
         DamRoll = 4, 
         Sex = "undistinguished", 
         HitRoll = 4, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         Position = "standing", 
         ArmorClass = 50, 
         Description = "The binary load lifter is a big droid used mainly for lifting and\
moving large objects. Its very simple processing unit can only handle\
very simple commands as there is very little need for an intelligent\
droid laborer.\
", 
         Vnum = 32018, 
         Alignment = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [26] = "Droid", 
            [18] = "Mountable", 
            [24] = "NoAssist", 
         }, 
         DefaultPosition = "standing", 
      }, 
      [32019] = 
      {
         LongDescr = "An experienced pilot has seen many years of flight.\
", 
         Level = 30, 
         Height = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 4, 
            DamSizeDice = 4, 
         }, 
         Credits = 200, 
         Name = "pilot", 
         ShortDescr = "a wookiee pilot", 
         Race = "Wookiee", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         Languages = 
         {
            Speaks = 
            {
               [1] = "shyriiwook", 
            }, 
            Speaking = 
            {
               [1] = "shyriiwook", 
            }, 
         }, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Wisdom = 0, 
         }, 
         DamRoll = 6, 
         Sex = "undistinguished", 
         HitRoll = 6, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         Position = "standing", 
         ArmorClass = 25, 
         Description = "This tall wookiee has dark fur that is almost black. He wears a large\
ammunition strap and a haversack. He is armed with a bowcaster.\
", 
         Vnum = 32019, 
         Alignment = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [10] = "Practice", 
            [24] = "NoAssist", 
         }, 
         DefaultPosition = "standing", 
      }, 
      [32020] = 
      {
         LongDescr = "A Quarren is daydreaming about the ocean.\
", 
         Level = 8, 
         Height = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 1, 
            DamSizeDice = 4, 
         }, 
         Credits = 0, 
         Name = "Quarren", 
         ShortDescr = "a Quarren", 
         DamRoll = 2, 
         Race = "Human", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         Languages = 
         {
            Speaks = 
            {
               [24] = "quarrenese", 
               [5] = "mon calamarian", 
            }, 
            Speaking = 
            {
               [24] = "quarrenese", 
               [5] = "mon calamarian", 
            }, 
         }, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Wisdom = 0, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "sigh\
say Damn those fellows, playing that deadly game every\
night.\
say I should just close down, but then they'll just find another\
place.\
grumble\
", 
               MudProgType = "rand_prog", 
               Arguments = "5", 
            }, 
            [2] = 
            {
               Code = "emote glances towards you.\
say Let me give you some advice... if you ever play that game of\
theirs...\
say always be sure to be at full health.\
say I've heard that the poison is pretty powerful.\
say Rumor has it that the poison is especially strong against members\
say of the Bounty Hunter's Guild.\
shake\
say But even if you survive, they'll steal everything you got.\
say Why would you wanna play that game, anyway?\
", 
               MudProgType = "rand_prog", 
               Arguments = "5", 
            }, 
         }, 
         Sex = "male", 
         HitRoll = 2, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         Position = "standing", 
         ArmorClass = 88, 
         Description = "The Quarren are more commonly know as squidheads throughout the galaxy\
due to the shape of their heads. The come from the ocean world of Mon\
Calamari.\
", 
         Vnum = 32020, 
         Alignment = 0, 
         Flags = 
         {
            [24] = "NoAssist", 
            [30] = "Prototype", 
            [0] = "Npc", 
         }, 
         DefaultPosition = "standing", 
      }, 
      [32021] = 
      {
         LongDescr = "An MSE droid wheels around the floor.\
", 
         Level = 1, 
         Height = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 1, 
            DamSizeDice = 2, 
         }, 
         Credits = 0, 
         Name = "mouse droid", 
         ShortDescr = "a mouse droid", 
         Race = "Human", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         Languages = 
         {
            Speaks = 
            {
               [11] = "barabel", 
            }, 
            Speaking = 
            {
               [11] = "barabel", 
            }, 
         }, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Wisdom = 0, 
         }, 
         DamRoll = 0, 
         Sex = "undistinguished", 
         HitRoll = 0, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         Position = "standing", 
         ArmorClass = 100, 
         Description = "The MSE droid is a small black droid less than a foot in hight. It\
wheels around the floor rapidly and comunicates in high pitched\
beeps. This behavior along with the sound of its initials have easily\
led it to being more commonly known as a \"mouse droid\
", 
         Vnum = 32021, 
         Alignment = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [24] = "NoAssist", 
            [26] = "Droid", 
            [7] = "Wimpy", 
         }, 
         DefaultPosition = "standing", 
      }, 
      [32022] = 
      {
         LongDescr = "A tired scruffy looking Kitonak sits at the table here.\
", 
         Level = 8, 
         Height = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 1, 
            DamSizeDice = 4, 
         }, 
         Credits = 3, 
         Name = "scruffy Kitonak", 
         ShortDescr = "a Kitonak", 
         Race = "Human", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
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
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Wisdom = 0, 
         }, 
         DamRoll = 1, 
         Sex = "undistinguished", 
         HitRoll = 1, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         Position = "standing", 
         ArmorClass = 88, 
         Description = "", 
         Vnum = 32022, 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [24] = "NoAssist", 
         }, 
         DefaultPosition = "standing", 
      }, 
      [32023] = 
      {
         LongDescr = "A short human wants to sell you something.\
", 
         Level = 80, 
         Height = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 5, 
            DamSizeDice = 4, 
         }, 
         Credits = 10000, 
         Shop = 
         {
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
            KeeperShortDescr = "a dealer", 
            ProfitBuy = 150, 
            ProfitSell = 50, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
         }, 
         Name = "small human weapons dealer", 
         ShortDescr = "a dealer", 
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
         Race = "Human", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         Immune = 
         {
            [20] = "magic", 
            [22] = "steal", 
            [11] = "charm", 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Wisdom = 0, 
         }, 
         DamRoll = 16, 
         Sex = "undistinguished", 
         HitRoll = 16, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         Position = "standing", 
         ArmorClass = -100, 
         Description = "The deep bags under this guys eyes and tight brow show many sleepless\
tormented nights. Its a risky profession dealing weapons right under\
the empires nose. \
", 
         Vnum = 32023, 
         Alignment = -500, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
         }, 
         DefaultPosition = "standing", 
      }, 
      [32024] = 
      {
         LongDescr = "An imperial gunner is here.\
", 
         Level = 25, 
         Height = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 2, 
            DamSizeDice = 4, 
         }, 
         Credits = 50, 
         Name = "imperial gunner", 
         ShortDescr = "an imperial gunner", 
         Race = "Human", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
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
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Wisdom = 0, 
         }, 
         DamRoll = 5, 
         Sex = "undistinguished", 
         HitRoll = 5, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         Position = "standing", 
         ArmorClass = 38, 
         Description = "The imperial gunner is dressed head to toe in black. His helmet\
includes special scanners to assist in targetting as well as\
providing protection from bright blasts. \
", 
         Vnum = 32024, 
         Alignment = -500, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         DefaultPosition = "standing", 
      }, 
      [32025] = 
      {
         LongDescr = "A droid is here scanning your purchaces.\
", 
         Level = 50, 
         Height = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
         Credits = 0, 
         Shop = 
         {
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
            KeeperShortDescr = "a shopkeeper droid", 
            ProfitBuy = 120, 
            ProfitSell = 90, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
         }, 
         Name = "storekeeper shop droid", 
         ShortDescr = "a shopkeeper droid", 
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
            Speaking = 
            {
               [1] = "shyriiwook", 
               [2] = "twileki", 
               [3] = "rodese", 
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
         Race = "Human", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         Immune = 
         {
            [20] = "magic", 
            [11] = "charm", 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Wisdom = 0, 
         }, 
         DamRoll = 10, 
         Sex = "undistinguished", 
         HitRoll = 10, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         Position = "standing", 
         ArmorClass = -25, 
         Description = "This droid is a very rudimentry humanoid shape. Its voice synthesyser is\
worn out and makes a slight hissing sound when it speaks.\
", 
         Vnum = 32025, 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [26] = "Droid", 
         }, 
         DefaultPosition = "standing", 
      }, 
      [32026] = 
      {
         LongDescr = "A TIE Fighter pilot is preparing for flight.\
", 
         Level = 23, 
         Height = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 1, 
            DamSizeDice = 10, 
         }, 
         Credits = 30, 
         Name = "imperial tie fighter pilot", 
         ShortDescr = "a TIE Fighter pilot", 
         Race = "Human", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
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
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Wisdom = 0, 
         }, 
         DamRoll = 4, 
         Sex = "undistinguished", 
         HitRoll = 4, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         Position = "standing", 
         ArmorClass = 50, 
         Description = "", 
         Vnum = 32026, 
         Alignment = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         DefaultPosition = "standing", 
      }, 
      [32027] = 
      {
         LongDescr = "An imperial stormtrooper patrols the shipyard.\
", 
         Level = 33, 
         Height = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 4, 
            DamSizeDice = 4, 
         }, 
         Credits = 0, 
         Name = "imperial stormtrooper", 
         ShortDescr = "a stormtrooper", 
         SpecFuns = 
         {
            [0] = "spec_stormtrooper", 
         }, 
         Race = "Human", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
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
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Wisdom = 0, 
         }, 
         DamRoll = 6, 
         Sex = "undistinguished", 
         HitRoll = 6, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         Position = "standing", 
         ArmorClass = 25, 
         Description = "Dressed in white armored space suits over black body gloves the storm\
trooper is a sight well recognized throughout the galaxy. Known and\
feared. They are the Empires elite troopers. They are well trained\
and fearless. They have been conditioned with unquestioning loyalty\
to their superiors and will always execute their orders precisly and\
without question.\
", 
         Vnum = 32027, 
         Alignment = -500, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         DefaultPosition = "standing", 
      }, 
      [32028] = 
      {
         LongDescr = "A technician is readying ships for launch.\
", 
         Level = 9, 
         Height = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
         Credits = 0, 
         Name = "imperial techician", 
         ShortDescr = "an imperial technician", 
         Race = "Human", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
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
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Wisdom = 0, 
         }, 
         DamRoll = 0, 
         Sex = "male", 
         HitRoll = 0, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         Position = "standing", 
         ArmorClass = 80, 
         Description = "This is a young human tecnician. He is dressed in a grey worksuit that\
is smuged with greasea. Several tools hang from a belt around his\
waist.\
", 
         Vnum = 32028, 
         Alignment = -500, 
         Flags = 
         {
            [0] = "Npc", 
            [24] = "NoAssist", 
         }, 
         DefaultPosition = "standing", 
      }, 
      [32029] = 
      {
         LongDescr = "A hutt waits impatiently while his barge is repaired.\
", 
         Level = 100, 
         Height = 0, 
         Damage = 
         {
            DamPlus = 2, 
            DamNoDice = 10, 
            DamSizeDice = 4, 
         }, 
         Credits = 0, 
         Name = "hutt crimelord", 
         ShortDescr = "a hutt", 
         Race = "Hutt", 
         HitChance = 
         {
            HitPlus = 1000, 
            HitSizeDice = 10, 
            HitNoDice = 20, 
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
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Wisdom = 0, 
         }, 
         DamRoll = 20, 
         Sex = "undistinguished", 
         HitRoll = 20, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         Position = "standing", 
         ArmorClass = -150, 
         Description = "The Hutts beautiful large size speaks well of his long full life. The\
exalted one seems a bit agitated however. Maybe fidgity from having to\
wait for repairs.\
", 
         Vnum = 32029, 
         Alignment = -500, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [10] = "Practice", 
         }, 
         DefaultPosition = "standing", 
      }, 
      [32030] = 
      {
         LongDescr = "A Defel bodyguard is here protecting his employer.\
", 
         Level = 30, 
         AffectedBy = 
         {
            [16] = "Hide", 
         }, 
         Height = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 4, 
            DamSizeDice = 4, 
         }, 
         Credits = 50, 
         Name = "defel bodyguard", 
         ShortDescr = "a bodyguard", 
         Race = "Defel", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
               [21] = "defel", 
            }, 
            Speaking = 
            {
               [21] = "defel", 
            }, 
         }, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Wisdom = 0, 
         }, 
         DamRoll = 6, 
         Sex = "undistinguished", 
         HitRoll = 6, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         Position = "standing", 
         ArmorClass = 25, 
         Description = "The defel is imolst impossible to make out apearing only as a shadow with\
red eyes.\
", 
         Vnum = 32030, 
         Alignment = -500, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [15] = "Guardian", 
         }, 
         DefaultPosition = "standing", 
      }, 
      [32031] = 
      {
         LongDescr = "A stormtrooper holograph is poised for attack.\
", 
         Level = 3, 
         Height = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 1, 
            DamSizeDice = 1, 
         }, 
         Credits = 0, 
         Name = "holographic stormtrooper", 
         ShortDescr = "a hologram", 
         Race = "Human", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
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
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Wisdom = 0, 
         }, 
         DamRoll = 0, 
         Sex = "undistinguished", 
         HitRoll = 0, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         Position = "standing", 
         ArmorClass = 100, 
         Description = "", 
         Vnum = 32031, 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [24] = "NoAssist", 
         }, 
         DefaultPosition = "standing", 
      }, 
      [32032] = 
      {
         LongDescr = "A holograph of a Rebel Alliance trooper is here poised for attack.\
", 
         Level = 2, 
         Height = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 1, 
            DamSizeDice = 1, 
         }, 
         Credits = 0, 
         Name = "holographic rebel alliance trooper", 
         ShortDescr = "a hologram", 
         Race = "Human", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
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
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Wisdom = 0, 
         }, 
         DamRoll = 0, 
         Sex = "undistinguished", 
         HitRoll = 0, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         Position = "standing", 
         ArmorClass = 100, 
         Description = "", 
         Vnum = 32032, 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [24] = "NoAssist", 
         }, 
         DefaultPosition = "standing", 
      }, 
      [32033] = 
      {
         LongDescr = "A common mammalian rat is sniffing around for food.\
", 
         Level = 2, 
         Height = 0, 
         Damage = 
         {
            DamPlus = 1, 
            DamNoDice = 1, 
            DamSizeDice = 1, 
         }, 
         Credits = 0, 
         Name = "rat", 
         ShortDescr = "a rat", 
         Race = "Human", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
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
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Wisdom = 0, 
         }, 
         DamRoll = 0, 
         Sex = "undistinguished", 
         HitRoll = 0, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         Position = "standing", 
         ArmorClass = 100, 
         Description = "", 
         Vnum = 32033, 
         Alignment = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [24] = "NoAssist", 
         }, 
         DefaultPosition = "standing", 
      }, 
      [32034] = 
      {
         LongDescr = "A scruffy looking thug points a holographic blaster at you.\
", 
         Level = 1, 
         Height = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 1, 
            DamSizeDice = 1, 
         }, 
         Credits = 0, 
         Name = "holographic scruffy thug", 
         ShortDescr = "a hologram", 
         Race = "Human", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
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
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Wisdom = 0, 
         }, 
         DamRoll = 0, 
         Sex = "undistinguished", 
         HitRoll = 0, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         Position = "standing", 
         ArmorClass = 100, 
         Description = "", 
         Vnum = 32034, 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [24] = "NoAssist", 
         }, 
         DefaultPosition = "standing", 
      }, 
      [32035] = 
      {
         LongDescr = "An astromech droid is monitoring the engines.\
", 
         Level = 4, 
         Height = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 1, 
            DamSizeDice = 2, 
         }, 
         Credits = 0, 
         Name = "astromech unit r2 droid", 
         ShortDescr = "an astromech droid", 
         Race = "Human", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         Languages = 
         {
            Speaks = 
            {
               [11] = "barabel", 
            }, 
            Speaking = 
            {
               [11] = "barabel", 
            }, 
         }, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Wisdom = 0, 
         }, 
         DamRoll = 0, 
         Sex = "undistinguished", 
         HitRoll = 0, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         Position = "standing", 
         ArmorClass = 88, 
         Description = "This common make of astromech droid is also known as an R2 unit. It is\
a small wheeled droid designed primarily for ship maintenence and\
repair. It has an interface apendage to plug into a ships computer as\
well as several other tools hidden within its domed frame that it\
uses to preform various functions.\
", 
         Vnum = 32035, 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [24] = "NoAssist", 
            [26] = "Droid", 
            [0] = "Npc", 
         }, 
         DefaultPosition = "standing", 
      }, 
      [32036] = 
      {
         LongDescr = "A young Chadra-Fan woman is here.\
", 
         Level = 5, 
         Height = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 1, 
            DamSizeDice = 4, 
         }, 
         Credits = 0, 
         Name = "chadra-fan woman citizen", 
         ShortDescr = "a Chadra-Fan", 
         Race = "Chadra-Fan", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         Languages = 
         {
            Speaks = 
            {
               [23] = "chadra-fan", 
            }, 
            Speaking = 
            {
               [23] = "chadra-fan", 
            }, 
         }, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Wisdom = 0, 
         }, 
         DamRoll = 0, 
         Sex = "female", 
         HitRoll = 0, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         Position = "standing", 
         ArmorClass = 90, 
         Description = "Chadra-fan area race of small rodent like humanoids coming from the planet\
Chad. This one smiles at you as she walks by. \
", 
         Vnum = 32036, 
         Alignment = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [24] = "NoAssist", 
         }, 
         DefaultPosition = "standing", 
      }, 
      [32037] = 
      {
         LongDescr = "A young Verpine man is here.\
", 
         Level = 5, 
         Height = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 1, 
            DamSizeDice = 4, 
         }, 
         Credits = 0, 
         Name = "verpine male citizen", 
         ShortDescr = "a Verpine", 
         Race = "Verpine", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         Languages = 
         {
            Speaks = 
            {
               [20] = "verpine", 
            }, 
            Speaking = 
            {
               [20] = "verpine", 
            }, 
         }, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Wisdom = 0, 
         }, 
         DamRoll = 0, 
         Sex = "male", 
         HitRoll = 0, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         Position = "standing", 
         ArmorClass = 90, 
         Description = "The verpine are a very intelligent race of bipedal insectoids. The have\
large eyes short snouts and 2 antennea coming out of the sides of their\
heads. Their bodies are thin and stick like.\
", 
         Vnum = 32037, 
         Alignment = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [24] = "NoAssist", 
         }, 
         DefaultPosition = "standing", 
      }, 
      [32038] = 
      {
         LongDescr = "An FX-7 medical assistant droid is on its way back from a house call.\
", 
         Level = 10, 
         AffectedBy = 
         {
            [21] = "Floating", 
         }, 
         Height = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
         Credits = 0, 
         Name = "FX-7 medical assistant droid", 
         ShortDescr = "an FX-7 droid", 
         DamRoll = 0, 
         Race = "Human", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
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
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Wisdom = 0, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpecharound $n The FX-7 tends to $n's wounds.\
feel 'cure light' $n\
mpechoat $n The FX-7 tends to your wounds.\
", 
               MudProgType = "bribe_prog", 
               Arguments = "25", 
            }, 
         }, 
         Sex = "undistinguished", 
         HitRoll = 0, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         Position = "standing", 
         ArmorClass = 80, 
         Description = "The FX-7 medical assistant droid is a hovering cylindrical droid. It\
has many arms containing various medical insturments for assisting in\
sugical operations. It is also equiped to deal with minor medical\
tasks in addition to being a surgical assistant.\
 \
For a small fee of 25 credits the medical assistant can help cure some\
of your wounds.\
", 
         Vnum = 32038, 
         Alignment = 0, 
         Flags = 
         {
            [24] = "NoAssist", 
            [26] = "Droid", 
            [21] = "Secretive", 
            [0] = "Npc", 
            [7] = "Wimpy", 
         }, 
         DefaultPosition = "standing", 
      }, 
      [32039] = 
      {
         LongDescr = "A technician is readying ships for launch.\
", 
         Level = 9, 
         Height = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
         Credits = 0, 
         Name = "technician", 
         ShortDescr = "a technician", 
         Race = "Human", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
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
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Wisdom = 0, 
         }, 
         DamRoll = 0, 
         Sex = "male", 
         HitRoll = 0, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         Position = "standing", 
         ArmorClass = 80, 
         Description = "This is a young human tecnician. He is dressed in a grey worksuit that\
is smuged with greasea. Several tools hang from a belt around his\
waist.\
", 
         Vnum = 32039, 
         Alignment = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [24] = "NoAssist", 
         }, 
         DefaultPosition = "standing", 
      }, 
      [32040] = 
      {
         LongDescr = "An imperial flight lieutenant is looking over the ships.\
", 
         Level = 45, 
         Height = 0, 
         Damage = 
         {
            DamPlus = 2, 
            DamNoDice = 4, 
            DamSizeDice = 4, 
         }, 
         Credits = 0, 
         Name = "imperial flight lieutenant", 
         ShortDescr = "a flight lieutenant", 
         Race = "Human", 
         HitChance = 
         {
            HitPlus = 450, 
            HitSizeDice = 10, 
            HitNoDice = 9, 
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
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Wisdom = 0, 
         }, 
         DamRoll = 9, 
         Sex = "undistinguished", 
         HitRoll = 9, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         Position = "standing", 
         ArmorClass = -12, 
         Description = "The flight lieutenant is dreed in a black naval uniform with a black cap.\
He has corellian bloodstripes on the side of his pants which signify\
bravery above and beyond the call of ordinary dutey. He must be a very\
formidable pilot. \
", 
         Vnum = 32040, 
         Alignment = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         DefaultPosition = "standing", 
      }, 
      [32041] = 
      {
         LongDescr = "A man wearing an old flight jacket is a freighter captain.\
", 
         Level = 50, 
         Height = 0, 
         Damage = 
         {
            DamPlus = 2, 
            DamNoDice = 5, 
            DamSizeDice = 4, 
         }, 
         Credits = 0, 
         Name = "freighter captain", 
         ShortDescr = "a freighter captain", 
         Race = "Human", 
         HitChance = 
         {
            HitPlus = 500, 
            HitSizeDice = 10, 
            HitNoDice = 10, 
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
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Wisdom = 0, 
         }, 
         DamRoll = 10, 
         Sex = "undistinguished", 
         HitRoll = 10, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         Position = "standing", 
         ArmorClass = -25, 
         Description = "This old guy looks to be near the end of his career. He has a grey beard\
and short messy grey hair. He wears captains wings proudly on his flight\
jacket\
", 
         Vnum = 32041, 
         Alignment = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         DefaultPosition = "standing", 
      }, 
      [32042] = 
      {
         LongDescr = "A medical officer will take 100 credits for bacta rentals.\
", 
         Level = 50, 
         Height = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
         Credits = 0, 
         Name = "medical officer", 
         ShortDescr = "a medical officer", 
         DamRoll = 0, 
         Race = "Human", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
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
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Wisdom = 0, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "say Thank you.\
mpechoat $n The officer escorts you to the bacta tanks.\
mpechoaround $n The officer escorts $n to the bacta tanks.\
mptransfer $n 32090\
mpat 10399 drop all\
mpat 10399 mppurge\
", 
               MudProgType = "bribe_prog", 
               Arguments = "100", 
            }, 
         }, 
         Sex = "undistinguished", 
         HitRoll = 0, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         Position = "standing", 
         ArmorClass = 0, 
         Description = "This young officer wears a blue imperial uniform. He will rent you a bacta\
tank if you give him 100 credits.\
", 
         Vnum = 32042, 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         DefaultPosition = "standing", 
      }, 
      [32043] = 
      {
         LongDescr = "A droid is here scanning your purchaces.\
", 
         Level = 50, 
         Height = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
         Credits = 0, 
         Shop = 
         {
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
            KeeperShortDescr = "a shopkeeper droid", 
            ProfitBuy = 120, 
            ProfitSell = 90, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
         }, 
         Name = "shope storekeeper droid", 
         ShortDescr = "a shopkeeper droid", 
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
         Race = "Human", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         Immune = 
         {
            [20] = "magic", 
            [11] = "charm", 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Wisdom = 0, 
         }, 
         DamRoll = 0, 
         Sex = "undistinguished", 
         HitRoll = 0, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         Position = "standing", 
         ArmorClass = -25, 
         Description = "", 
         Vnum = 32043, 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [26] = "Droid", 
         }, 
         DefaultPosition = "standing", 
      }, 
      [32044] = 
      {
         LongDescr = "A dark cloaked figure supervises station operations.\
", 
         Level = 50, 
         Height = 0, 
         Damage = 
         {
            DamPlus = 2, 
            DamNoDice = 5, 
            DamSizeDice = 4, 
         }, 
         Credits = 0, 
         Name = "dark cloaked figure", 
         ShortDescr = "a dark deciple", 
         SpecFuns = 
         {
            [0] = "spec_dark_jedi", 
         }, 
         Race = "Human", 
         HitChance = 
         {
            HitPlus = 500, 
            HitSizeDice = 10, 
            HitNoDice = 10, 
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
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Wisdom = 0, 
         }, 
         DamRoll = 10, 
         Sex = "undistinguished", 
         HitRoll = 10, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         Position = "standing", 
         ArmorClass = -25, 
         Description = "", 
         Vnum = 32044, 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [10] = "Practice", 
         }, 
         DefaultPosition = "standing", 
      }, 
      [32429] = 
      {
         LongDescr = "&B A slot machine is positioned here.&w\
", 
         Level = 1, 
         Height = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
         Credits = 0, 
         Name = "slot", 
         ShortDescr = "&B Slot Machine&w", 
         DamRoll = 0, 
         Race = "Human", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
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
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Wisdom = 0, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "if rand(20)\
mpechoat $n The dials spin round and round\
mpechoat $n &B3 SABERS !!&G  A MATCH !&R YOU WIN !&w\
mpwithdraw 2000\
give 2000 credits $n\
else\
mpechoat $n The dials spin round and round\
mpechoat $n &R No match - Try again &w\
endif\
", 
               MudProgType = "bribe_prog", 
               Arguments = "500", 
            }, 
            [2] = 
            {
               Code = "emote BEEPS loudly\
mpecho Bouncers run in from the adjoining room\
mpechoat $n The bouncers grab you and severely batter you\
mpechoaround $n $n is set upon by bouncers.\
mpdamage $n 400\
mpechoaround $n $n is beaten and dragged away by bouncers.\
mpechoat $n Bouncers drag your battered body to a back room\
mptransfer $n 32433\
", 
               MudProgType = "fight_prog", 
               Arguments = "100", 
            }, 
         }, 
         Sex = "undistinguished", 
         HitRoll = 0, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         Position = "standing", 
         ArmorClass = 0, 
         Description = "", 
         Vnum = 32429, 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
         }, 
         DefaultPosition = "standing", 
      }, 
      [32112] = 
      {
         LongDescr = "Astromech droid wheels around the floor.\
", 
         Level = 5, 
         Height = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 1, 
            DamSizeDice = 4, 
         }, 
         Credits = 0, 
         Name = "astromech droid r2 unit", 
         ShortDescr = "an astromech droid", 
         Race = "Human", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         Languages = 
         {
            Speaks = 
            {
               [11] = "barabel", 
            }, 
            Speaking = 
            {
               [11] = "barabel", 
            }, 
         }, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Wisdom = 0, 
         }, 
         DamRoll = 0, 
         Sex = "undistinguished", 
         HitRoll = 0, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         Position = "standing", 
         ArmorClass = 88, 
         Description = "This common make of astromech droid is also known as an R2 unit. It is\
a small wheeled droid designed primarily for ship maintenence and\
repair. It has an interface apendage to plug into a ships computer as\
well as several other tools hidden within its domed frame that it\
uses to preform various functions.\
", 
         Vnum = 32112, 
         Alignment = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [24] = "NoAssist", 
            [26] = "Droid", 
            [7] = "Wimpy", 
         }, 
         DefaultPosition = "standing", 
      }, 
      [32050] = 
      {
         LongDescr = "An almost ancient looking bounty hunter stands here.\
", 
         Level = 100, 
         Height = 0, 
         Damage = 
         {
            DamPlus = 2, 
            DamNoDice = 10, 
            DamSizeDice = 4, 
         }, 
         Credits = 500, 
         Name = "rodian hunter bounty mercenary", 
         ShortDescr = "Nuos", 
         Race = "Gotal", 
         HitChance = 
         {
            HitPlus = 1000, 
            HitSizeDice = 10, 
            HitNoDice = 20, 
         }, 
         Languages = 
         {
            Speaks = 
            {
               [3] = "rodese", 
            }, 
            Speaking = 
            {
               [3] = "rodese", 
            }, 
         }, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Wisdom = 0, 
         }, 
         DamRoll = 20, 
         Sex = "male", 
         HitRoll = 20, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         Position = "standing", 
         ArmorClass = -150, 
         Description = "Rodians are well known throughout the galaxy as deadly bounty hunters. They\
are easily disdinguished by their tapered snouts, large eyes, green skin,\
crested heads and suction copped fingers. This one looks very experienced.\
Maybe he could afford the time to give you a few lessons. \
", 
         Vnum = 32050, 
         Alignment = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [10] = "Practice", 
            [24] = "NoAssist", 
         }, 
         DefaultPosition = "standing", 
      }, 
      [32051] = 
      {
         LongDescr = "A retail droid is here to assist you with your purchaces.\
", 
         Level = 10, 
         Height = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
         Credits = 0, 
         Shop = 
         {
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
            KeeperShortDescr = "a retail droid", 
            ProfitBuy = 120, 
            ProfitSell = 90, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
         }, 
         Name = "retail droid", 
         ShortDescr = "a retail droid", 
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
         Race = "Human", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         Immune = 
         {
            [10] = "sleep", 
            [20] = "magic", 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Wisdom = 0, 
         }, 
         DamRoll = 0, 
         Sex = "undistinguished", 
         HitRoll = 0, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         Position = "standing", 
         ArmorClass = 0, 
         Description = "The retail droid is similar in apearance to a standard proticol droid.\
It is fittened however with a crdit exchange terminal in its hip and\
is programmed to be an expert salesperson.\
", 
         Vnum = 32051, 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [26] = "Droid", 
         }, 
         DefaultPosition = "standing", 
      }, 
      [32052] = 
      {
         LongDescr = "A waitress is waiting to take your order.\
", 
         Level = 1, 
         Height = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
         Credits = 0, 
         Shop = 
         {
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
            KeeperShortDescr = "the waitress", 
            ProfitBuy = 120, 
            ProfitSell = 90, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
         }, 
         Name = "waitress", 
         ShortDescr = "the waitress", 
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
         Race = "Human", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         Immune = 
         {
            [20] = "magic", 
            [11] = "charm", 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Wisdom = 0, 
         }, 
         DamRoll = 0, 
         Sex = "undistinguished", 
         HitRoll = 0, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         Position = "standing", 
         ArmorClass = 0, 
         Description = "The waitress is an older human woman who doesn't look overly impressed with\
the thought of having to serve you. You imagine that she probably doesn't\
enjoy her job. \
", 
         Vnum = 32052, 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
         }, 
         DefaultPosition = "standing", 
      }, 
      [32499] = 
      {
         LongDescr = "Some god abandoned a newly created lastmob here.\
", 
         Level = 1, 
         Height = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
         Credits = 0, 
         Name = "lastmob", 
         ShortDescr = "a newly created lastmob", 
         Race = "Human", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
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
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Wisdom = 0, 
         }, 
         DamRoll = 0, 
         Sex = "undistinguished", 
         HitRoll = 0, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         Position = "standing", 
         ArmorClass = 0, 
         Description = "", 
         Vnum = 32499, 
         Alignment = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         DefaultPosition = "standing", 
      }, 
      [32432] = 
      {
         LongDescr = "The Cassias' store hand is here to help you.\
", 
         Level = 1, 
         Height = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
         Credits = 0, 
         Shop = 
         {
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
            KeeperShortDescr = "a newly created StoreKeeper", 
            ProfitBuy = 120, 
            ProfitSell = 90, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
         }, 
         Name = "StoreKeeper", 
         ShortDescr = "a newly created StoreKeeper", 
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
         Race = "Human", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         Immune = 
         {
            [20] = "magic", 
            [11] = "charm", 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Wisdom = 0, 
         }, 
         DamRoll = 0, 
         Sex = "undistinguished", 
         HitRoll = 0, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         Position = "standing", 
         ArmorClass = 0, 
         Description = "", 
         Vnum = 32432, 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
         }, 
         DefaultPosition = "standing", 
      }, 
      [32428] = 
      {
         LongDescr = "The Cassia' Barman stands behind his bar\
", 
         Level = 100, 
         Height = 0, 
         Damage = 
         {
            DamPlus = 2, 
            DamNoDice = 10, 
            DamSizeDice = 4, 
         }, 
         Credits = 0, 
         Shop = 
         {
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
            KeeperShortDescr = "Barman", 
            ProfitBuy = 120, 
            ProfitSell = 90, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
         }, 
         Name = "Barman", 
         ShortDescr = "Barman", 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
               [3] = "rodese", 
            }, 
            Speaking = 
            {
               [3] = "rodese", 
            }, 
         }, 
         Race = "Rodian", 
         HitChance = 
         {
            HitPlus = 1000, 
            HitSizeDice = 10, 
            HitNoDice = 20, 
         }, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         Immune = 
         {
            [20] = "magic", 
            [11] = "charm", 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Wisdom = 0, 
         }, 
         DamRoll = 20, 
         Sex = "male", 
         HitRoll = 20, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         Position = "standing", 
         ArmorClass = -150, 
         Description = "", 
         Vnum = 32428, 
         Alignment = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [25] = "NoKill", 
         }, 
         DefaultPosition = "standing", 
      }, 
      [32299] = 
      {
         LongDescr = "Some god abandoned a newly created lastmob here.\
", 
         Level = 1, 
         Height = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
         Credits = 0, 
         Name = "lastmob", 
         ShortDescr = "a newly created lastmob", 
         Race = "Human", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
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
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Wisdom = 0, 
         }, 
         DamRoll = 0, 
         Sex = "undistinguished", 
         HitRoll = 0, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         Position = "standing", 
         ArmorClass = 0, 
         Description = "", 
         Vnum = 32299, 
         Alignment = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         DefaultPosition = "standing", 
      }, 
      [32298] = 
      {
         LongDescr = "Some god abandoned a newly created pilot here.\
", 
         Level = 1, 
         Height = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
         Credits = 0, 
         Name = "pilot", 
         ShortDescr = "a newly created pilot", 
         SpecFuns = 
         {
            [0] = "spec_newbie_pilot", 
         }, 
         Race = "Human", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
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
         SaveVs = 
         {
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Dexterity = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Force = 0, 
            Luck = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Wisdom = 0, 
         }, 
         DamRoll = 0, 
         Sex = "undistinguished", 
         HitRoll = 0, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         Position = "standing", 
         ArmorClass = 0, 
         Description = "", 
         Vnum = 32298, 
         Alignment = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         DefaultPosition = "standing", 
      }, 
   }, 
   Resets = 
   {
      [1] = 
      {
         Arg1 = 20, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 22, 
         Arg3 = 32000, 
      }, 
      [2] = 
      {
         Arg1 = 20, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 22, 
         Arg3 = 32000, 
      }, 
      [3] = 
      {
         Arg1 = 20, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 22, 
         Arg3 = 32000, 
      }, 
      [4] = 
      {
         Arg1 = 20, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 22, 
         Arg3 = 32000, 
      }, 
      [5] = 
      {
         Arg1 = 20, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 22, 
         Arg3 = 32000, 
      }, 
      [6] = 
      {
         Arg1 = 20, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 22, 
         Arg3 = 32000, 
      }, 
      [7] = 
      {
         Arg1 = 20, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 22, 
         Arg3 = 32000, 
      }, 
      [8] = 
      {
         Arg1 = 20, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 22, 
         Arg3 = 32000, 
      }, 
      [9] = 
      {
         Arg1 = 20, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 22, 
         Arg3 = 32000, 
      }, 
      [10] = 
      {
         Arg1 = 20, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 22, 
         Arg3 = 32000, 
      }, 
      [11] = 
      {
         Arg1 = 20, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 22, 
         Arg3 = 32000, 
      }, 
      [12] = 
      {
         Arg1 = 32003, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 2, 
         Arg3 = 32000, 
      }, 
      [13] = 
      {
         Arg1 = 32003, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 2, 
         Arg3 = 32000, 
      }, 
      [14] = 
      {
         Arg1 = 32014, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 2, 
         Arg3 = 32000, 
      }, 
      [15] = 
      {
         Arg1 = 32211, 
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 5, 
      }, 
      [16] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 32210, 
      }, 
      [17] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 32209, 
      }, 
      [18] = 
      {
         Arg1 = 32112, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 10, 
         Arg3 = 32001, 
      }, 
      [19] = 
      {
         Arg1 = 32112, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 10, 
         Arg3 = 32003, 
      }, 
      [20] = 
      {
         Arg1 = 32013, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 32004, 
      }, 
      [21] = 
      {
         Arg1 = 32027, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 8, 
         Arg3 = 32006, 
      }, 
      [22] = 
      {
         Arg1 = 32027, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 8, 
         Arg3 = 32007, 
      }, 
      [23] = 
      {
         Arg1 = 32027, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 8, 
         Arg3 = 32007, 
      }, 
      [24] = 
      {
         Arg1 = 32112, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 10, 
         Arg3 = 32008, 
      }, 
      [25] = 
      {
         Arg1 = 32112, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 10, 
         Arg3 = 32009, 
      }, 
      [26] = 
      {
         Arg1 = 32039, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 2, 
         Arg3 = 32010, 
      }, 
      [27] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 32209, 
      }, 
      [28] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 32210, 
      }, 
      [29] = 
      {
         Arg1 = 32211, 
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 5, 
      }, 
      [30] = 
      {
         Arg1 = 32039, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 2, 
         Arg3 = 32011, 
      }, 
      [31] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 32209, 
      }, 
      [32] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 32210, 
      }, 
      [33] = 
      {
         Arg1 = 32211, 
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 5, 
      }, 
      [34] = 
      {
         Arg1 = 32027, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 8, 
         Arg3 = 32013, 
      }, 
      [35] = 
      {
         Arg1 = 32112, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 10, 
         Arg3 = 32014, 
      }, 
      [36] = 
      {
         Arg1 = 20, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 22, 
         Arg3 = 32015, 
      }, 
      [37] = 
      {
         Arg1 = 20, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 22, 
         Arg3 = 32015, 
      }, 
      [38] = 
      {
         Arg1 = 20, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 22, 
         Arg3 = 32015, 
      }, 
      [39] = 
      {
         Arg1 = 20, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 22, 
         Arg3 = 32015, 
      }, 
      [40] = 
      {
         Arg1 = 20, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 22, 
         Arg3 = 32015, 
      }, 
      [41] = 
      {
         Arg1 = 20, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 22, 
         Arg3 = 32015, 
      }, 
      [42] = 
      {
         Arg1 = 20, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 22, 
         Arg3 = 32015, 
      }, 
      [43] = 
      {
         Arg1 = 20, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 22, 
         Arg3 = 32015, 
      }, 
      [44] = 
      {
         Arg1 = 32112, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 10, 
         Arg3 = 32015, 
      }, 
      [45] = 
      {
         Arg1 = 32018, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 2, 
         Arg3 = 32016, 
      }, 
      [46] = 
      {
         Arg1 = 32112, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 10, 
         Arg3 = 32017, 
      }, 
      [47] = 
      {
         Arg1 = 32019, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 32017, 
      }, 
      [48] = 
      {
         Arg1 = 32268, 
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 16, 
      }, 
      [49] = 
      {
         Arg1 = 32269, 
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 12, 
      }, 
      [50] = 
      {
         Arg1 = 32271, 
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 12, 
      }, 
      [51] = 
      {
         Arg1 = 32112, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 10, 
         Arg3 = 32018, 
      }, 
      [52] = 
      {
         Arg1 = 32018, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 2, 
         Arg3 = 32018, 
      }, 
      [53] = 
      {
         Arg1 = 32112, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 10, 
         Arg3 = 32020, 
      }, 
      [54] = 
      {
         Arg1 = 32112, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 10, 
         Arg3 = 32023, 
      }, 
      [55] = 
      {
         Arg1 = 53, 
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 16, 
      }, 
      [56] = 
      {
         Arg1 = 32036, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 32035, 
      }, 
      [57] = 
      {
         Arg1 = 53, 
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 16, 
      }, 
      [58] = 
      {
         Arg1 = 32037, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 2, 
         Arg3 = 32037, 
      }, 
      [59] = 
      {
         Arg1 = 53, 
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 16, 
      }, 
      [60] = 
      {
         Arg1 = 32037, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 2, 
         Arg3 = 32037, 
      }, 
      [61] = 
      {
         Arg1 = 53, 
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 16, 
      }, 
      [62] = 
      {
         Arg1 = 32010, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 32039, 
      }, 
      [63] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 32281, 
      }, 
      [64] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 32280, 
      }, 
      [65] = 
      {
         Arg1 = 32022, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 32041, 
      }, 
      [66] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 32230, 
      }, 
      [67] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 56, 
      }, 
      [68] = 
      {
         Arg1 = 32020, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 32042, 
      }, 
      [69] = 
      {
         Arg1 = 32218, 
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 12, 
      }, 
      [70] = 
      {
         Arg1 = 32219, 
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 5, 
      }, 
      [71] = 
      {
         Arg1 = 32220, 
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 7, 
      }, 
      [72] = 
      {
         Arg1 = 32025, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 32043, 
      }, 
      [73] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 32237, 
      }, 
      [74] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 32234, 
      }, 
      [75] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 32232, 
      }, 
      [76] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 32238, 
      }, 
      [77] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 32261, 
      }, 
      [78] = 
      {
         Arg1 = 32272, 
         MiscData = 1, 
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 32044, 
      }, 
      [79] = 
      {
         Arg1 = 32027, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 8, 
         Arg3 = 32046, 
      }, 
      [80] = 
      {
         Arg1 = 32027, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 8, 
         Arg3 = 32046, 
      }, 
      [81] = 
      {
         Arg1 = 32011, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 32048, 
      }, 
      [82] = 
      {
         Arg1 = 32027, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 8, 
         Arg3 = 32048, 
      }, 
      [83] = 
      {
         Arg1 = 32021, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 9, 
         Arg3 = 32050, 
      }, 
      [84] = 
      {
         Arg1 = 32027, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 8, 
         Arg3 = 32050, 
      }, 
      [85] = 
      {
         Arg1 = 32239, 
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 5, 
      }, 
      [86] = 
      {
         Arg1 = 32240, 
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 7, 
      }, 
      [87] = 
      {
         Arg1 = 50, 
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 16, 
      }, 
      [88] = 
      {
         Arg1 = 32241, 
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 6, 
      }, 
      [89] = 
      {
         Arg1 = 32248, 
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 7, 
      }, 
      [90] = 
      {
         Arg1 = 32246, 
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 5, 
      }, 
      [91] = 
      {
         Arg1 = 32245, 
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 14, 
      }, 
      [92] = 
      {
         Arg1 = 32244, 
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 3, 
      }, 
      [93] = 
      {
         Arg1 = 32249, 
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 8, 
      }, 
      [94] = 
      {
         Arg1 = 32242, 
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 9, 
      }, 
      [95] = 
      {
         Arg1 = 32243, 
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 10, 
      }, 
      [96] = 
      {
         Arg1 = 32247, 
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 13, 
      }, 
      [97] = 
      {
         Arg1 = 32250, 
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 13, 
      }, 
      [98] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 32254, 
      }, 
      [99] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 10488, 
      }, 
      [100] = 
      {
         Arg1 = 32021, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 9, 
         Arg3 = 32051, 
      }, 
      [101] = 
      {
         Arg1 = 32021, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 9, 
         Arg3 = 32052, 
      }, 
      [102] = 
      {
         Arg1 = 32007, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 32053, 
      }, 
      [103] = 
      {
         Arg1 = 32263, 
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 7, 
      }, 
      [104] = 
      {
         Arg1 = 32262, 
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 5, 
      }, 
      [105] = 
      {
         Arg1 = 32204, 
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 13, 
      }, 
      [106] = 
      {
         Arg1 = 32205, 
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 8, 
      }, 
      [107] = 
      {
         Arg1 = 51, 
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 16, 
      }, 
      [108] = 
      {
         Arg1 = 32028, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 2, 
         Arg3 = 32053, 
      }, 
      [109] = 
      {
         Arg1 = 32026, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 2, 
         Arg3 = 32053, 
      }, 
      [110] = 
      {
         Arg1 = 32040, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 32055, 
      }, 
      [111] = 
      {
         Arg1 = 32041, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 32057, 
      }, 
      [112] = 
      {
         Arg1 = 32026, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 2, 
         Arg3 = 32059, 
      }, 
      [113] = 
      {
         Arg1 = 32028, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 2, 
         Arg3 = 32060, 
      }, 
      [114] = 
      {
         Arg1 = 32254, 
         MiscData = 1, 
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 32070, 
      }, 
      [115] = 
      {
         Arg1 = 32024, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 2, 
         Arg3 = 32071, 
      }, 
      [116] = 
      {
         Arg1 = 32202, 
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 5, 
      }, 
      [117] = 
      {
         Arg1 = 32235, 
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 6, 
      }, 
      [118] = 
      {
         Arg1 = 32236, 
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 9, 
      }, 
      [119] = 
      {
         Arg1 = 32203, 
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 7, 
      }, 
      [120] = 
      {
         Arg1 = 32204, 
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 13, 
      }, 
      [121] = 
      {
         Arg1 = 32205, 
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 8, 
      }, 
      [122] = 
      {
         Arg1 = 32228, 
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 13, 
      }, 
      [123] = 
      {
         Arg1 = 51, 
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 16, 
      }, 
      [124] = 
      {
         Arg1 = 32024, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 2, 
         Arg3 = 32071, 
      }, 
      [125] = 
      {
         Arg1 = 32202, 
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 5, 
      }, 
      [126] = 
      {
         Arg1 = 32235, 
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 6, 
      }, 
      [127] = 
      {
         Arg1 = 32236, 
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 9, 
      }, 
      [128] = 
      {
         Arg1 = 32203, 
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 7, 
      }, 
      [129] = 
      {
         Arg1 = 32204, 
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 13, 
      }, 
      [130] = 
      {
         Arg1 = 32205, 
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 8, 
      }, 
      [131] = 
      {
         Arg1 = 32228, 
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 13, 
      }, 
      [132] = 
      {
         Arg1 = 51, 
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 16, 
      }, 
      [133] = 
      {
         Arg1 = 32021, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 9, 
         Arg3 = 32073, 
      }, 
      [134] = 
      {
         Arg1 = 32021, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 9, 
         Arg3 = 32074, 
      }, 
      [135] = 
      {
         Arg1 = 32021, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 9, 
         Arg3 = 32075, 
      }, 
      [136] = 
      {
         Arg1 = 32021, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 9, 
         Arg3 = 32077, 
      }, 
      [137] = 
      {
         Arg1 = 32021, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 9, 
         Arg3 = 32078, 
      }, 
      [138] = 
      {
         Arg1 = 32021, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 9, 
         Arg3 = 32078, 
      }, 
      [139] = 
      {
         Arg1 = 45, 
         MiscData = 1, 
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 32083, 
      }, 
      [140] = 
      {
         Arg1 = 46, 
         MiscData = 1, 
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 32083, 
      }, 
      [141] = 
      {
         Arg1 = 32083, 
         MiscData = 0, 
         Command = "D", 
         Arg2 = 2, 
         Arg3 = 1, 
      }, 
      [142] = 
      {
         Arg1 = 32012, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 32084, 
      }, 
      [143] = 
      {
         Arg1 = 32217, 
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 6, 
      }, 
      [144] = 
      {
         Arg1 = 32215, 
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 5, 
      }, 
      [145] = 
      {
         Arg1 = 32216, 
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 7, 
      }, 
      [146] = 
      {
         Arg1 = 32204, 
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 13, 
      }, 
      [147] = 
      {
         Arg1 = 32205, 
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 8, 
      }, 
      [148] = 
      {
         Arg1 = 32001, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 9, 
         Arg3 = 32091, 
      }, 
      [149] = 
      {
         Arg1 = 32200, 
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 16, 
      }, 
      [150] = 
      {
         Arg1 = 32206, 
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 6, 
      }, 
      [151] = 
      {
         Arg1 = 32205, 
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 8, 
      }, 
      [152] = 
      {
         Arg1 = 32204, 
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 13, 
      }, 
      [153] = 
      {
         Arg1 = 32203, 
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 7, 
      }, 
      [154] = 
      {
         Arg1 = 32202, 
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 5, 
      }, 
      [155] = 
      {
         Arg1 = 32259, 
         MiscData = 1, 
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 32091, 
      }, 
      [156] = 
      {
         Arg1 = 32023, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 2, 
         Arg3 = 32094, 
      }, 
      [157] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 57, 
      }, 
      [158] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 58, 
      }, 
      [159] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 10487, 
      }, 
      [160] = 
      {
         Arg1 = 32043, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 32095, 
      }, 
      [161] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 32261, 
      }, 
      [162] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 32260, 
      }, 
      [163] = 
      {
         Arg1 = 32001, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 9, 
         Arg3 = 32096, 
      }, 
      [164] = 
      {
         Arg1 = 32200, 
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 16, 
      }, 
      [165] = 
      {
         Arg1 = 32206, 
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 6, 
      }, 
      [166] = 
      {
         Arg1 = 32205, 
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 8, 
      }, 
      [167] = 
      {
         Arg1 = 32204, 
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 13, 
      }, 
      [168] = 
      {
         Arg1 = 32203, 
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 7, 
      }, 
      [169] = 
      {
         Arg1 = 32202, 
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 5, 
      }, 
      [170] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 32221, 
      }, 
      [171] = 
      {
         Arg1 = 32272, 
         MiscData = 1, 
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 32096, 
      }, 
      [172] = 
      {
         Arg1 = 32096, 
         MiscData = 0, 
         Command = "D", 
         Arg2 = 0, 
         Arg3 = 2, 
      }, 
      [173] = 
      {
         Arg1 = 32042, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 32097, 
      }, 
      [174] = 
      {
         Arg1 = 32044, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 32099, 
      }, 
      [175] = 
      {
         Arg1 = 38, 
         MiscData = 1, 
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 32141, 
      }, 
      [176] = 
      {
         Arg1 = 10321, 
         MiscData = 1, 
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 32141, 
      }, 
      [177] = 
      {
         Arg1 = 32015, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 32142, 
      }, 
      [178] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 32234, 
      }, 
      [179] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 32233, 
      }, 
      [180] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 10314, 
      }, 
      [181] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 32232, 
      }, 
      [182] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 10424, 
      }, 
      [183] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 25, 
      }, 
      [184] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 10488, 
      }, 
      [185] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 10311, 
      }, 
      [186] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 10313, 
      }, 
      [187] = 
      {
         Arg1 = 32002, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 32143, 
      }, 
      [188] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 32207, 
      }, 
      [189] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 32214, 
      }, 
      [190] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 32213, 
      }, 
      [191] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 32212, 
      }, 
      [192] = 
      {
         Arg1 = 32005, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 32143, 
      }, 
      [193] = 
      {
         Arg1 = 32201, 
         MiscData = 1, 
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 32144, 
      }, 
      [194] = 
      {
         Arg1 = 32144, 
         MiscData = 0, 
         Command = "D", 
         Arg2 = 8, 
         Arg3 = 1, 
      }, 
      [195] = 
      {
         Arg1 = 32144, 
         MiscData = 0, 
         Command = "D", 
         Arg2 = 9, 
         Arg3 = 1, 
      }, 
      [196] = 
      {
         Arg1 = 32208, 
         MiscData = 1, 
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 32145, 
      }, 
      [197] = 
      {
         Arg1 = 98, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 2, 
         Arg3 = 32146, 
      }, 
      [198] = 
      {
         Arg1 = 98, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 2, 
         Arg3 = 32146, 
      }, 
      [199] = 
      {
         Arg1 = 32273, 
         MiscData = 1, 
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 32146, 
      }, 
      [200] = 
      {
         Arg1 = 32231, 
         MiscData = 1, 
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 32148, 
      }, 
      [201] = 
      {
         Arg1 = 32149, 
         MiscData = 0, 
         Command = "D", 
         Arg2 = 1, 
         Arg3 = 1, 
      }, 
      [202] = 
      {
         Arg1 = 32034, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 3, 
         Arg3 = 32174, 
      }, 
      [203] = 
      {
         Arg1 = 32034, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 3, 
         Arg3 = 32174, 
      }, 
      [204] = 
      {
         Arg1 = 32034, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 3, 
         Arg3 = 32174, 
      }, 
      [205] = 
      {
         Arg1 = 32032, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 2, 
         Arg3 = 32175, 
      }, 
      [206] = 
      {
         Arg1 = 32032, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 2, 
         Arg3 = 32175, 
      }, 
      [207] = 
      {
         Arg1 = 32031, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 2, 
         Arg3 = 32175, 
      }, 
      [208] = 
      {
         Arg1 = 32031, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 2, 
         Arg3 = 32175, 
      }, 
      [209] = 
      {
         Arg1 = 32033, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 3, 
         Arg3 = 32176, 
      }, 
      [210] = 
      {
         Arg1 = 32176, 
         MiscData = 0, 
         Command = "D", 
         Arg2 = 6, 
         Arg3 = 1, 
      }, 
      [211] = 
      {
         Arg1 = 32177, 
         MiscData = 0, 
         Command = "D", 
         Arg2 = 7, 
         Arg3 = 1, 
      }, 
      [212] = 
      {
         Arg1 = 32035, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 32178, 
      }, 
      [213] = 
      {
         Arg1 = 32033, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 3, 
         Arg3 = 32178, 
      }, 
      [214] = 
      {
         Arg1 = 32033, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 3, 
         Arg3 = 32178, 
      }, 
      [215] = 
      {
         Arg1 = 32274, 
         MiscData = 1, 
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 32179, 
      }, 
      [216] = 
      {
         Arg1 = 32282, 
         MiscData = 1, 
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 32296, 
      }, 
      [217] = 
      {
         Arg1 = 32296, 
         MiscData = 0, 
         Command = "D", 
         Arg2 = 3, 
         Arg3 = 0, 
      }, 
      [218] = 
      {
         Arg1 = 10313, 
         MiscData = 1, 
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 32387, 
      }, 
      [219] = 
      {
         Arg1 = 32201, 
         MiscData = 1, 
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 32412, 
      }, 
      [220] = 
      {
         Arg1 = 32051, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 32413, 
      }, 
      [221] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 10311, 
      }, 
      [222] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 10488, 
      }, 
      [223] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 32234, 
      }, 
      [224] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 32232, 
      }, 
      [225] = 
      {
         Arg1 = 32052, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 32415, 
      }, 
      [226] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 32283, 
      }, 
      [227] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 32207, 
      }, 
      [228] = 
      {
         Arg1 = 32423, 
         MiscData = 0, 
         Command = "D", 
         Arg2 = 2, 
         Arg3 = 0, 
      }, 
      [229] = 
      {
         Arg1 = 32428, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 32428, 
      }, 
      [230] = 
      {
         Arg1 = 32208, 
         MiscData = 1, 
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 32439, 
      }, 
      [231] = 
      {
         Arg1 = 10321, 
         MiscData = 1, 
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 32465, 
      }, 
      [232] = 
      {
         Arg1 = 10314, 
         MiscData = 1, 
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 32465, 
      }, 
      [233] = 
      {
         Arg1 = 10370, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 2, 
         Arg3 = 32438, 
      }, 
      [234] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 32252, 
      }, 
      [235] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 60, 
      }, 
      [236] = 
      {
         Arg1 = 32429, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 32429, 
      }, 
      [237] = 
      {
         Arg1 = 32432, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 32432, 
      }, 
      [238] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 10314, 
      }, 
      [239] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 10313, 
      }, 
      [240] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 10317, 
      }, 
      [241] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 10424, 
      }, 
      [242] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 32280, 
      }, 
      [243] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 59, 
      }, 
      [244] = 
      {
         Arg1 = 32014, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 2, 
         Arg3 = 32002, 
      }, 
      [245] = 
      {
         Arg1 = 32211, 
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 5, 
      }, 
      [246] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 32210, 
      }, 
      [247] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 32209, 
      }, 
      [248] = 
      {
         Arg1 = 32007, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 2, 
         Arg3 = 32002, 
      }, 
      [249] = 
      {
         Arg1 = 32009, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 3, 
         Arg3 = 32092, 
      }, 
      [250] = 
      {
         Arg1 = 32006, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 3, 
         Arg3 = 32147, 
      }, 
      [251] = 
      {
         Arg1 = 32004, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 10, 
         Arg3 = 32420, 
      }, 
      [252] = 
      {
         Arg1 = 54, 
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 16, 
      }, 
      [253] = 
      {
         Arg1 = 32004, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 10, 
         Arg3 = 32420, 
      }, 
      [254] = 
      {
         Arg1 = 54, 
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 16, 
      }, 
      [255] = 
      {
         Arg1 = 32004, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 10, 
         Arg3 = 32420, 
      }, 
      [256] = 
      {
         Arg1 = 54, 
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 16, 
      }, 
      [257] = 
      {
         Arg1 = 32004, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 10, 
         Arg3 = 32420, 
      }, 
      [258] = 
      {
         Arg1 = 54, 
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 16, 
      }, 
      [259] = 
      {
         Arg1 = 32004, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 10, 
         Arg3 = 32420, 
      }, 
      [260] = 
      {
         Arg1 = 54, 
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 16, 
      }, 
      [261] = 
      {
         Arg1 = 32004, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 10, 
         Arg3 = 32420, 
      }, 
      [262] = 
      {
         Arg1 = 54, 
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 16, 
      }, 
      [263] = 
      {
         Arg1 = 32004, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 10, 
         Arg3 = 32420, 
      }, 
      [264] = 
      {
         Arg1 = 54, 
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 16, 
      }, 
      [265] = 
      {
         Arg1 = 32004, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 10, 
         Arg3 = 32420, 
      }, 
      [266] = 
      {
         Arg1 = 54, 
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 16, 
      }, 
      [267] = 
      {
         Arg1 = 32004, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 10, 
         Arg3 = 32420, 
      }, 
      [268] = 
      {
         Arg1 = 54, 
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 16, 
      }, 
      [269] = 
      {
         Arg1 = 32004, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 10, 
         Arg3 = 32420, 
      }, 
      [270] = 
      {
         Arg1 = 54, 
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 16, 
      }, 
      [271] = 
      {
         Arg1 = 32420, 
         MiscData = 0, 
         Command = "D", 
         Arg2 = 0, 
         Arg3 = 1, 
      }, 
      [272] = 
      {
         Arg1 = 32029, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 32021, 
      }, 
      [273] = 
      {
         Arg1 = 32256, 
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 11, 
      }, 
      [274] = 
      {
         Arg1 = 32257, 
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 1, 
      }, 
      [275] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
         Arg1 = 32276, 
      }, 
      [276] = 
      {
         Arg1 = 32258, 
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 22, 
      }, 
      [277] = 
      {
         Arg1 = 32030, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 32021, 
      }, 
      [278] = 
      {
         Arg1 = 32112, 
         MiscData = 1, 
         Command = "M", 
         Arg2 = 10, 
         Arg3 = 32021, 
      }, 
      [279] = 
      {
         Arg1 = 53, 
         MiscData = 1, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 16, 
      }, 
      [280] = 
      {
         Arg1 = 38, 
         MiscData = 1, 
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 32224, 
      }, 
      [281] = 
      {
         Arg1 = 32224, 
         MiscData = 0, 
         Command = "D", 
         Arg2 = 0, 
         Arg3 = 0, 
      }, 
      [282] = 
      {
         Arg1 = 38, 
         MiscData = 1, 
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 32111, 
      }, 
   }, 
   Rooms = 
   {
      [32256] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Front Cargo Hold", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32252, 
               Direction = "east", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32258, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32256, 
      }, 
      [32257] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [26] = "Factory", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Fast Attack Engine room", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32252, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32257, 
      }, 
      [32258] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [26] = "Factory", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Rear Cargo Hold", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32256, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32258, 
      }, 
      [32259] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Bunk Room", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32255, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32259, 
      }, 
      [32260] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Fast Attack Cockpit", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32261, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32260, 
      }, 
      [32261] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Corridor in a Noghri Fast Attack Ship", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32260, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32263, 
               Direction = "east", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32262, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               DestinationVnum = 32264, 
               Direction = "west", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32261, 
      }, 
      [32262] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Corridor in a Noghri Fast Attack Ship", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32261, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32265, 
               Direction = "east", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32267, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               DestinationVnum = 32266, 
               Direction = "west", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32262, 
      }, 
      [32263] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Captains Room", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32261, 
               Direction = "west", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32263, 
      }, 
      [32264] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Fast Attack Entrance Ramp", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32261, 
               Direction = "east", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32264, 
      }, 
      [32265] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Passenger Lounge", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32269, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32262, 
               Direction = "west", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32265, 
      }, 
      [32266] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [26] = "Factory", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Front Cargo Hold", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32262, 
               Direction = "east", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32268, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32266, 
      }, 
      [32267] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Fast Attack Engine room", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32262, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32267, 
      }, 
      [32268] = 
      {
         Flags = 
         {
            [25] = "Refinery", 
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Rear Cargo Hold", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32266, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32268, 
      }, 
      [32269] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Bunk Room", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32265, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32269, 
      }, 
      [32270] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Fast Attack Cockpit", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32271, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32270, 
      }, 
      [32271] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Corridor in a Noghri Fast Attack Ship", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32270, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32273, 
               Direction = "east", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32272, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               DestinationVnum = 32274, 
               Direction = "west", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32271, 
      }, 
      [32272] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Corridor in a Noghri Fast Attack Ship", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32271, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32275, 
               Direction = "east", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32277, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               DestinationVnum = 32276, 
               Direction = "west", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32272, 
      }, 
      [32273] = 
      {
         MudProgs = 
         {
            [1] = 
            {
               Code = "feel heal $n\
", 
               MudProgType = "rand_prog", 
               Arguments = "100", 
            }, 
         }, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "inside", 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32271, 
               Direction = "west", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32273, 
      }, 
      [32274] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Fast Attack Entrance Ramp", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32271, 
               Direction = "east", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32274, 
      }, 
      [32275] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Passenger Lounge", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32279, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32272, 
               Direction = "west", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32275, 
      }, 
      [32276] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Front Cargo Hold", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32272, 
               Direction = "east", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32278, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32276, 
      }, 
      [32277] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Fast Attack Engine room", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32272, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32277, 
      }, 
      [32278] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Rear Cargo Hold", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32276, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32278, 
      }, 
      [32279] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Bunk Room", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32275, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32279, 
      }, 
      [32280] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Fast Attack Cockpit", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32281, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32280, 
      }, 
      [32281] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Corridor in a Noghri Fast Attack Ship", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32280, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32283, 
               Direction = "east", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32282, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               DestinationVnum = 32284, 
               Direction = "west", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32281, 
      }, 
      [32282] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Corridor in a Noghri Fast Attack Ship", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32281, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32285, 
               Direction = "east", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32287, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               DestinationVnum = 32286, 
               Direction = "west", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32282, 
      }, 
      [32283] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Captains Room", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32281, 
               Direction = "west", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32283, 
      }, 
      [32284] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Fast Attack Entrance Ramp", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32281, 
               Direction = "east", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32284, 
      }, 
      [32285] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Passenger Lounge", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32289, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32282, 
               Direction = "west", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32285, 
      }, 
      [32286] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Front Cargo Hold", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32282, 
               Direction = "east", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32288, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32286, 
      }, 
      [32287] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Fast Attack Engine room", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32282, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32287, 
      }, 
      [32288] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Rear Cargo Hold", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32286, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32288, 
      }, 
      [32289] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Bunk Room", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32285, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32289, 
      }, 
      [32292] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Floating in a void", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32292, 
      }, 
      [32295] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "&Rthis room is used by a mob prog do not change it", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32295, 
      }, 
      [32296] = 
      {
         Flags = 
         {
            [10] = "Safe", 
            [16] = "Silence", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "It is not a very wise thing to play in the airlock. A button on the wall is\
used to decompress the airlock. If you push it it will most likely kill\
you instantly. It would be best to leave and exit the ship in a more\
traditional way like using the exit ramp.\
", 
         Name = "An Airlock", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32149, 
               Direction = "west", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32296, 
      }, 
      [32297] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "You stand upon a small landing pad on a relatively unknown planet somewhere\
in the core worlds. The planet is mostly covered in jungle. It apears the\
only artificial structure is a small building to the north of here.  \
", 
         Name = "A Shuttle Platform", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32297, 
      }, 
      [32298] = 
      {
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpat 32149 mpecho $n steps through the airlock.\
mpechoat $n &YAfter A quick shuttle ride you dock with the pluogus.\
mptransfer $n 32149\
", 
               MudProgType = "entry_prog", 
               Arguments = "100", 
            }, 
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "A Small Shuttle", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32297, 
               Direction = "somewhere", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [11] = "Hidden", 
               }, 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32298, 
      }, 
      [32299] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "Looking at the planet around you it apears ... well ... er ...\
unfinished. Looks like some of the Omipresent beings that are in\
charge of such things have been slacking off...\
 \
Going down will take you to a slightly more playable planet ( even if\
not entirely finished itself ;)\
 \
", 
         Name = "Oops....", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32299, 
      }, 
      [32300] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Pilots Chair", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32301, 
               Direction = "east", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32302, 
               Direction = "southeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32300, 
      }, 
      [32301] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Side-mounted Turret", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32300, 
               Direction = "west", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32302, 
               Direction = "southwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32301, 
      }, 
      [32302] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Entrance Ramp", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32303, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32301, 
               Direction = "northeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32300, 
               Direction = "northwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32302, 
      }, 
      [32303] = 
      {
         Flags = 
         {
            [23] = "Hotel", 
            [29] = "Spacecraft", 
            [26] = "Factory", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Tiny Hangar", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32302, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32304, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32303, 
      }, 
      [32304] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Rear Turret", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32303, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32304, 
      }, 
      [32305] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Pilots Chair", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32307, 
               Direction = "southeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32305, 
      }, 
      [32306] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Co-Pilots Chair", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32307, 
               Direction = "southwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32306, 
      }, 
      [32307] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Entrance Ramp", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32308, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32306, 
               Direction = "northeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32305, 
               Direction = "northwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32307, 
      }, 
      [32308] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Passenger Lounge", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32307, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32309, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32308, 
      }, 
      [32309] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Rear Turret", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32308, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32309, 
      }, 
      [32310] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Pilots Chair", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32312, 
               Direction = "southeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32310, 
      }, 
      [32311] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Co-Pilots Chair", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32312, 
               Direction = "southwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32311, 
      }, 
      [32312] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Entrance Ramp", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32313, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32311, 
               Direction = "northeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32310, 
               Direction = "northwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32312, 
      }, 
      [32313] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Passenger Lounge", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32312, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32314, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32313, 
      }, 
      [32314] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Rear Turret", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32313, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32314, 
      }, 
      [32315] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Pilots Chair", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32317, 
               Direction = "southeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32315, 
      }, 
      [32316] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Co-Pilots Chair", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32317, 
               Direction = "southwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32316, 
      }, 
      [32317] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Entrance Ramp", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32318, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32316, 
               Direction = "northeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32315, 
               Direction = "northwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32317, 
      }, 
      [32318] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Passenger Lounge", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32317, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32319, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32318, 
      }, 
      [32319] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Rear Turret", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32318, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32319, 
      }, 
      [32320] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Pilots Chair", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32322, 
               Direction = "southeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32320, 
      }, 
      [32321] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Co-Pilots Chair", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32322, 
               Direction = "southwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32321, 
      }, 
      [32322] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Entrance Ramp", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32323, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32321, 
               Direction = "northeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32320, 
               Direction = "northwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32322, 
      }, 
      [32323] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Passenger Lounge", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32322, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32324, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32323, 
      }, 
      [32324] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Rear Turret", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32323, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32324, 
      }, 
      [32325] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Pilots Chair", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32327, 
               Direction = "southeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32325, 
      }, 
      [32326] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Co-Pilots Chair", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32327, 
               Direction = "southwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32326, 
      }, 
      [32327] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Entrance Ramp", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32328, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32326, 
               Direction = "northeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32325, 
               Direction = "northwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32327, 
      }, 
      [32328] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Passenger Lounge", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32327, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32329, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32328, 
      }, 
      [32329] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Rear Turret", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32328, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32329, 
      }, 
      [32330] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Pilots Chair", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32332, 
               Direction = "southeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32330, 
      }, 
      [32331] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Co-Pilots Chair", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32332, 
               Direction = "southwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32331, 
      }, 
      [32332] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Entrance Ramp", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32333, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32331, 
               Direction = "northeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32330, 
               Direction = "northwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32332, 
      }, 
      [32333] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Passenger Lounge", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32332, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32334, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32333, 
      }, 
      [32334] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Rear Turret", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32333, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32334, 
      }, 
      [32335] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Pilots Chair", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32337, 
               Direction = "southeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32335, 
      }, 
      [32336] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Co-Pilots Chair", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32337, 
               Direction = "southwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32336, 
      }, 
      [32337] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Entrance Ramp", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32338, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32336, 
               Direction = "northeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32335, 
               Direction = "northwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32337, 
      }, 
      [32338] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Passenger Lounge", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32337, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32339, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32338, 
      }, 
      [32339] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Rear Turret", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32338, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32339, 
      }, 
      [32340] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Cockpit", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32341, 
               Direction = "east", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32342, 
               Direction = "southeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32340, 
      }, 
      [32341] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Side-Mounted Turret", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32340, 
               Direction = "west", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32342, 
               Direction = "southwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32341, 
      }, 
      [32342] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Entrance Ramp", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32343, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32344, 
               Direction = "down", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32341, 
               Direction = "northeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               DestinationVnum = 32340, 
               Direction = "northwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32342, 
      }, 
      [32343] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "A small hangar", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32342, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32343, 
      }, 
      [32344] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Ventral turret", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32342, 
               Direction = "up", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32344, 
      }, 
      [32345] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Pilots Chair", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32347, 
               Direction = "southeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32345, 
      }, 
      [32346] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Co-Pilots Chair", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32347, 
               Direction = "southwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32346, 
      }, 
      [32347] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Entrance Ramp", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32348, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32346, 
               Direction = "northeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32345, 
               Direction = "northwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32347, 
      }, 
      [32348] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Passenger Lounge", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32347, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32349, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32348, 
      }, 
      [32349] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Rear Turret", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32348, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32349, 
      }, 
      [32350] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Pilots Chair", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32352, 
               Direction = "southeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32350, 
      }, 
      [32351] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Co-Pilots Chair", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32352, 
               Direction = "southwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32351, 
      }, 
      [32352] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Entrance Ramp", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32353, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32351, 
               Direction = "northeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32350, 
               Direction = "northwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32352, 
      }, 
      [32353] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Passenger Lounge", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32352, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32354, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32353, 
      }, 
      [32354] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Rear Turret", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32353, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32354, 
      }, 
      [32355] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Pilots Chair", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32357, 
               Direction = "southeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32355, 
      }, 
      [32356] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Co-Pilots Chair", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32357, 
               Direction = "southwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32356, 
      }, 
      [32357] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Entrance Ramp", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32358, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32356, 
               Direction = "northeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32355, 
               Direction = "northwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32357, 
      }, 
      [32358] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Passenger Lounge", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32357, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32359, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32358, 
      }, 
      [32359] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Rear Turret", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32358, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32359, 
      }, 
      [32360] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Pilots Chair", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32362, 
               Direction = "southeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32360, 
      }, 
      [32361] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Co-Pilots Chair", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32362, 
               Direction = "southwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32361, 
      }, 
      [32362] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Entrance Ramp", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32363, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32361, 
               Direction = "northeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32360, 
               Direction = "northwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32362, 
      }, 
      [32363] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Passenger Lounge", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32362, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32364, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32363, 
      }, 
      [32364] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Rear Turret", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32363, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32364, 
      }, 
      [32365] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Pilots Chair", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32367, 
               Direction = "southeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32365, 
      }, 
      [32366] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Co-Pilots Chair", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32367, 
               Direction = "southwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32366, 
      }, 
      [32367] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Entrance Ramp", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32368, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32366, 
               Direction = "northeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32365, 
               Direction = "northwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32367, 
      }, 
      [32368] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Passenger Lounge", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32367, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32369, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32368, 
      }, 
      [32369] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Rear Turret", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32368, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32369, 
      }, 
      [32370] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Pilots Chair", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32372, 
               Direction = "southeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32370, 
      }, 
      [32371] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Co-Pilots Chair", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32372, 
               Direction = "southwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32371, 
      }, 
      [32372] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Entrance Ramp", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32373, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32371, 
               Direction = "northeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32370, 
               Direction = "northwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32372, 
      }, 
      [32373] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Passenger Lounge", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32372, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32374, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32373, 
      }, 
      [32374] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Rear Turret", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32373, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32374, 
      }, 
      [32375] = 
      {
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpechoat $n You grab a seat in front of the\
controls\
mpechoaround $n $n grabs a seat at the controls\
", 
               MudProgType = "act_prog", 
               Arguments = "p sits", 
            }, 
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "&C You stand in the cockpit of a highly modified\
Assault Shuttle. The control panels in front of\
you blink wildly in various colors and upon the\
ceiling sits a red light bulb illuminating the\
cockpit in red. To the south a corridor leads\
to the rest of the ship. &W\
", 
         Name = "&R Cockpit &R&W", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32377, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32375, 
      }, 
      [32376] = 
      {
         Flags = 
         {
            [4] = "CanLand", 
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "&C You stand in a large hangar where ships dock. Machines\
that fill this belly of the ship work around the clock\
in repairing and refueling each ship before it launchs\
and small labor droids aid the larger machines in their\
work by looking over each ship. &W\
", 
         Name = "&B Hangar &B&W", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32377, 
               Direction = "up", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32376, 
      }, 
      [32377] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "&P Entrance Ramp &W", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32375, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32378, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32376, 
               Direction = "down", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32377, 
      }, 
      [32378] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "&C Several chairs and couchs have been set out\
in this room adding comfort for the passengers\
that ride in this modified assault shuttle. In\
one of the corners of the room a small\
holoprojector has been set up for entertainment\
purposes. &W\
", 
         Name = "&P Lounge &W", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32377, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32379, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32378, 
      }, 
      [32379] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "&C A glass bubble creates the walls of this small\
compartment where a seat and a laser cannon have\
been placed for rear defense of the assault shuttle. &W\
", 
         Name = "Rear Turret", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32378, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32379, 
      }, 
      [32380] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Pilots Chair", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32382, 
               Direction = "southeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32380, 
      }, 
      [32381] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Co-Pilots Chair", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32382, 
               Direction = "southwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32381, 
      }, 
      [32382] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Entrance Ramp", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32383, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32381, 
               Direction = "northeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32380, 
               Direction = "northwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32382, 
      }, 
      [32383] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Passenger Lounge", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32382, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32384, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32383, 
      }, 
      [32384] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Rear Turret", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32383, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32384, 
      }, 
      [32385] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Cockpit", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32386, 
               Direction = "east", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32387, 
               Direction = "southeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32385, 
      }, 
      [32386] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Turret", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32385, 
               Direction = "west", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32387, 
               Direction = "southwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32386, 
      }, 
      [32387] = 
      {
         MudProgs = 
         {
            [1] = 
            {
               Code = "feel heal $n\
", 
               MudProgType = "rand_prog", 
               Arguments = "100", 
            }, 
         }, 
         Flags = 
         {
            [23] = "Hotel", 
            [29] = "Spacecraft", 
            [26] = "Factory", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "Usually the passenger lounge, this part of the shuttle has been modified to\
hold Musketahquid Lodg's personal quarters. A small bed, a kitchenette,\
and a table lie in their respective corners.\
", 
         Name = "Sleeping Quarters", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32388, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32389, 
               Direction = "down", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32386, 
               Direction = "northeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               DestinationVnum = 32385, 
               Direction = "northwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32387, 
      }, 
      [32388] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "A small hangar", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32387, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32388, 
      }, 
      [32389] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Ventral Turret", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32387, 
               Direction = "up", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32389, 
      }, 
      [32390] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Pilots Chair", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32392, 
               Direction = "southeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32390, 
      }, 
      [32391] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Co-Pilots Chair", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32392, 
               Direction = "southwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32391, 
      }, 
      [32392] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Entrance Ramp", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32393, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32391, 
               Direction = "northeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32390, 
               Direction = "northwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32392, 
      }, 
      [32393] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Passenger Lounge", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32392, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32394, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32393, 
      }, 
      [32394] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Rear Turret", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32398, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32394, 
      }, 
      [32395] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Pilots Chair", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32397, 
               Direction = "southeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32395, 
      }, 
      [32396] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Co-Pilots Chair", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32397, 
               Direction = "southwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32396, 
      }, 
      [32397] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Entrance Ramp", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32398, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32396, 
               Direction = "northeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32395, 
               Direction = "northwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32397, 
      }, 
      [32398] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Passenger Lounge", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32397, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32394, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32398, 
      }, 
      [32399] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Rear Turret", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32398, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32399, 
      }, 
      [32400] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 2, 
         Sector = "city", 
         Description = "", 
         Name = "A Cockpit", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32400, 
      }, 
      [32401] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 2, 
         Sector = "city", 
         Description = "", 
         Name = "A Cockpit", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32401, 
      }, 
      [32402] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 2, 
         Sector = "city", 
         Description = "", 
         Name = "A Cockpit", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32402, 
      }, 
      [32403] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 2, 
         Sector = "city", 
         Description = "", 
         Name = "A Cockpit", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32403, 
      }, 
      [32404] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 2, 
         Sector = "city", 
         Description = "", 
         Name = "A Cockpit", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32404, 
      }, 
      [32405] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 2, 
         Sector = "city", 
         Description = "", 
         Name = "A Cockpit", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32405, 
      }, 
      [32406] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 2, 
         Sector = "city", 
         Description = "", 
         Name = "A Cockpit", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32406, 
      }, 
      [32407] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 2, 
         Sector = "city", 
         Description = "", 
         Name = "A Cockpit", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32407, 
      }, 
      [32408] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 2, 
         Sector = "city", 
         Description = "", 
         Name = "A Cockpit", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32408, 
      }, 
      [32409] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 2, 
         Sector = "city", 
         Description = "", 
         Name = "A Cockpit", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32409, 
      }, 
      [32410] = 
      {
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "inside", 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Name = "An Empty Home", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32410, 
      }, 
      [32411] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "This room is the main entrance and exit from the Serin Tocca. It consists\
of two airlocks and a large hydrollic belly ramp that lowers down out of\
the ship when docked. A large turbo-lift leads up to the rest of the ship\
from here. It is a amaller ship then the Serin Pluogus built to accomadate\
the larger crowds generated after the imperial planets were removed from\
the pluogus route.\
To leave the ship type LEAVE.\
to get back on type BOARD TOCCA.\
To find out where it is type TOCCA.\
", 
         Name = "Entrance Ramp", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32412, 
               Direction = "up", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32411, 
      }, 
      [32412] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The main loung of the Serin Tocca is very similar to the pluogus even\
though the ships are quite different. The large central hallway is flanked\
by couches and chairs of various dimensions in an attempt to accomodate\
passengers of all shapes and sizes. Some are even designed to be\
adjustable although only manually. There apears to be no automatic\
form-chairs at least in this room.\
", 
         Name = "Passenger Lounge", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32413, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32414, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32411, 
               Direction = "down", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32412, 
      }, 
      [32413] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "This large room is a smorgasboard of displays. Most of them seem to contain\
useless junk but a few items might be usefull to you. A small cash counter\
is in one corner of the room but it is rarely used as a retail service\
droid handles most transactions directly. There are several vending\
machines along one wall offering many different varieties of packaged food\
and drink.  There are however only a couple of tables in this part of ship\
to sit down and eat.  \
", 
         Name = "The Gift Shop", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32415, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32412, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32413, 
      }, 
      [32414] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [2] = "NoMob", 
            [23] = "Hotel", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "This large room   is sectioned off into enclosed bunks stacked along the\
walls. There are several different sized chambers but most of them seem\
designed to fit one or two humans comfortably. All the beds have get ammo\
back ammo somewhat soundproof door and are lockable from the inside.     \
This would be a good place to rest for awhile. You may safely leave and\
re-enter the game from here.\
", 
         Name = "Sleeping Compartment", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32412, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32414, 
      }, 
      [32415] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "This large sectoin near the fron of the ship has many tables and chairs of\
various sizes. The lighting is dim and soft string music fills the room.\
However, it is hard to hear of the noise of the ship and the chatter of\
the room. \
", 
         Name = "Tocca Restaurant and Pub", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32413, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32415, 
      }, 
      [32416] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The grid is tatooine's main defense against invasion.  It's two turrets\
and several missile launchers make it a good match for many capitol shipsa\
", 
         Name = "Tatooine Defense Grid", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32416, 
      }, 
      [32417] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Floating in a void", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32417, 
      }, 
      [32418] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Floating in a void", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32418, 
      }, 
      [32419] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Floating in a void", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32419, 
      }, 
      [32420] = 
      {
         Flags = 
         {
            [30] = "Prototype", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The grid is tatooine's main defense against invasion.  It's two turrets and\
several missile launchers make it a good match for many capitol ships\
", 
         Name = "Tatooine Defense Grid", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32423, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "gate", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32421, 
               Direction = "east", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32422, 
               Direction = "west", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32420, 
      }, 
      [32421] = 
      {
         Flags = 
         {
            [30] = "Prototype", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The power you feel as you hold the controls of this quad-laser turret flows\
over you. \
", 
         Name = "East Turret", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32420, 
               Direction = "west", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32421, 
      }, 
      [32422] = 
      {
         Flags = 
         {
            [30] = "Prototype", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The power you feel as you hold the controls of this quad-laser turret flows\
over you. \
", 
         Name = "West Turret", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32420, 
               Direction = "east", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32422, 
      }, 
      [32423] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [30] = "Prototype", 
            [23] = "Hotel", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "This bay is where the defense grid puts any contenders it can get a tractor\
beam on to.  With no exit but a detension cell, they are stuck here until\
someone comes to free them.\
", 
         Name = "Grid Holding Bay", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32420, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Flags = 
               {
                  [0] = "IsDoor", 
                  [5] = "PickProof", 
               }, 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32423, 
      }, 
      [32425] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Dont Blinking Fly This! Its The Blinking Cassia!!!", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32425, 
      }, 
      [32426] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "You stand on the entrance ramp of the Serin Cassia. There are seats here so\
that you and the rest of the passengers do not have to stand for what may\
be a long trip. The Serin Cassia is equipped with facilities that make the\
ride more comfortable for all the galactic citizens that board her. The\
rest of the ship lies to the north and south of you. \
", 
         Name = "Entrance to the Cassia", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32430, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32427, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32426, 
      }, 
      [32427] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "You stand in the southern hallway of the Serin Cassia. She is a very fast\
and economical ship to fly. The hallway extends from the front of the ship\
to the rear. To the east is a gambling area and to the west is a bar room.\
", 
         Name = "Cassias' Southern Hall", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32426, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32429, 
               Direction = "east", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32428, 
               Direction = "west", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32427, 
      }, 
      [32428] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The Serin Cassias' barman stands behind his bar waiting for you to order.\
He has an assortment of cocktails on his shelves. The bar is made of wood\
from the worshyr tree of Kashyyyk. The tree is extremely tall, which makes\
it very suitable for a bar. Most of the over-aged passengers aboard the\
Cassia come here to have a drink and speak of their destinations.\
", 
         Name = "Caissas' Bar", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32427, 
               Direction = "east", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32428, 
      }, 
      [32429] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The gambling center of the Serin Cassia make is a more  popular stellar bus\
to fly on. Beings of all races try their hand at many games here, in\
particular the slot machines. Make sure you examine the slot machines\
before you use them. \
", 
         Name = "Cassia's Slot Machine", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32427, 
               Direction = "west", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32429, 
      }, 
      [32430] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "You stand in the northern hallway of the Serin Cassia. She is a very fast\
and economical ship to fly.  The hallway extends from the front of the\
ship to the rear. To the east is a store and to the west is a common room.\
", 
         Name = "Cassias' Northern Hall", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32432, 
               Direction = "east", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32426, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32431, 
               Direction = "west", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32430, 
      }, 
      [32431] = 
      {
         Flags = 
         {
            [23] = "Hotel", 
            [29] = "Spacecraft", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "Here is the common room of the Serin Cassia.  People stand around or sit\
here in on of the comfortable lounge seats that have been provided. Many\
topics of conversation are being debated here. You may quit from the game\
here.\
", 
         Name = "Cassias' Common Room", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32430, 
               Direction = "east", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32431, 
      }, 
      [32432] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The Cassias' General Store is full of useful things for you to buy. There\
is a counter up front with an attendant read to serve you. The Attendant\
will sell you anything that is on his 'list'. To the west is the northern\
hall which leads to the rest of the ship.\
", 
         Name = "Cassias' General Store", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32430, 
               Direction = "west", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32432, 
      }, 
      [32433] = 
      {
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpecho The bouncers show mercy on you, and let you out.\
mptransfer $n 32426\
", 
               MudProgType = "rand_prog", 
               Arguments = "100", 
            }, 
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "You stand in a dark room that is very cold and damp. to have been put here\
you must have dont something wrong. You are starting to wish you had done\
what you were told. \
", 
         Name = "Backroom", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32433, 
      }, 
      [32434] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Floating in a void", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32434, 
      }, 
      [32435] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "DONT LAUNCH THIS SHIP!! ITS THE BLINKING SERIN SIEGO!!!", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32435, 
      }, 
      [32436] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "One of the buses that transport people around the galaxies, the Serin Siego\
is a bare bones ship. It has little in terms of comfort and its entrance\
reflects this.  The walls are bare and weldings can easily be seen. Since\
it is publicly funded, it is not as stable as those privately owned.  \
Ride at your own risk! \
", 
         Name = "Siego Entrance", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32437, 
               Direction = "up", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32436, 
      }, 
      [32437] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "Shoddily placed metal barely covers the circuitry of this hallway.  The way\
is narrow, too narrow for many species, but it leads north to a small\
store and south to a restroom.\
", 
         Name = "A small, narrow passageway", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32438, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32439, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32436, 
               Direction = "down", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32437, 
      }, 
      [32438] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "A droid stands here, selling some basic necessities.  Don't bother trying\
to communicate with it, its the low end product, and only barely is\
capable of its duties.\
", 
         Name = "A small store", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32437, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32438, 
      }, 
      [32439] = 
      {
         Flags = 
         {
            [23] = "Hotel", 
            [29] = "Spacecraft", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "A hard bed is bolted to the wall here.  A simple fountain provides\
refreshing water.   You may rest and quit here.\
", 
         Name = "A rest area", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32437, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32439, 
      }, 
      [32440] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "DONT LAUNCH THIS SHIP! ITS THE BLINKING EDENA", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32440, 
      }, 
      [32441] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Serin Edena's entrance", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32441, 
      }, 
      [32442] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Floating in a void", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32442, 
      }, 
      [32443] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Floating in a void", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32443, 
      }, 
      [32444] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Floating in a void", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32444, 
      }, 
      [32445] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "DONT LAUNCH THIS BLINKING SHIP!! ITS THE BLOODY OMASA", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32445, 
      }, 
      [32446] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Serin Amose's Entrance", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32446, 
      }, 
      [32447] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Floating in a void", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32447, 
      }, 
      [32448] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Floating in a void", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32448, 
      }, 
      [32449] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Floating in a void", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32449, 
      }, 
      [32450] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "DONT LAUNCH THIS SHIP!! ITS THE BLINKING ODANI!!!", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32450, 
      }, 
      [32451] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "DONT DO ANYTHING WITH THIS ROOM! ITS USED BY MOBSHIPS!", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32451, 
      }, 
      [32452] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Serin Odani's entrance", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32452, 
      }, 
      [32454] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Floating in a void", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32454, 
      }, 
      [32455] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Floating in a void", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32455, 
      }, 
      [32456] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Floating in a void", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32456, 
      }, 
      [32458] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Floating in a void", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32458, 
      }, 
      [32459] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Floating in a void", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32459, 
      }, 
      [32460] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Z-100 TZ32460", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32460, 
      }, 
      [32461] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Z-100 TZ32461", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32461, 
      }, 
      [32462] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Z-100 TZ32462", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32462, 
      }, 
      [32463] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Z-100 TZ32463", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32463, 
      }, 
      [32464] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Floating in a void", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32464, 
      }, 
      [32465] = 
      {
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "AS32465 - Trainer", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32466, 
               Direction = "east", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32467, 
               Direction = "southeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32465, 
      }, 
      [32466] = 
      {
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Co-pilot's Seat", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32465, 
               Direction = "west", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32467, 
               Direction = "southwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32466, 
      }, 
      [32467] = 
      {
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Turret", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32466, 
               Direction = "northeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32465, 
               Direction = "northwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32467, 
      }, 
      [32468] = 
      {
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "AS32468 : Trainer", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32469, 
               Direction = "east", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32470, 
               Direction = "southeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32468, 
      }, 
      [32469] = 
      {
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Co-pilot's Seat", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32468, 
               Direction = "west", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32470, 
               Direction = "southwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32469, 
      }, 
      [32470] = 
      {
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Turret", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32469, 
               Direction = "northeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32468, 
               Direction = "northwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32470, 
      }, 
      [32471] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Floating in a void", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32471, 
      }, 
      [32472] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Floating in a void", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32472, 
      }, 
      [32473] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Floating in a void", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32473, 
      }, 
      [32474] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Floating in a void", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32474, 
      }, 
      [32475] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Floating in a void", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32475, 
      }, 
      [32476] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Floating in a void", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32476, 
      }, 
      [32477] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Floating in a void", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32477, 
      }, 
      [32478] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Floating in a void", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32478, 
      }, 
      [32479] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Floating in a void", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32479, 
      }, 
      [32480] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Floating in a void", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32480, 
      }, 
      [32481] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Floating in a void", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32481, 
      }, 
      [32482] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Floating in a void", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32482, 
      }, 
      [32483] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Floating in a void", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32483, 
      }, 
      [32484] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Floating in a void", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32484, 
      }, 
      [32485] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Floating in a void", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32485, 
      }, 
      [32486] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Floating in a void", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32486, 
      }, 
      [32487] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Floating in a void", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32487, 
      }, 
      [32488] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Floating in a void", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32488, 
      }, 
      [32489] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Floating in a void", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32489, 
      }, 
      [32490] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Floating in a void", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32490, 
      }, 
      [32497] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Imperial Defense Platform, Honoghr. COckpit", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32497, 
      }, 
      [32498] = 
      {
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "A defense platform turret", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32499, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32498, 
      }, 
      [32499] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "A Defense Platform Hangar", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32498, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32499, 
      }, 
      [32000] = 
      {
         MudProgs = 
         {
            [1] = 
            {
               Code = "if isimmort($n)\
else\
if clan($n) == The Empire\
mpechoat $n You pass by the hidden guards.\
else\
if name($n) == Laukshii\
mpechoat $n You pass by the hidden guards.\
else\
if clan($n) == The Death Commandos\
mpechoat $n You pass by the hidden guards.\
else\
mpechoat $n Someone says, 'Hey, you don't belong here!'\
mptransfer $n 32003\
mpat $n mpforce $n look\
endif\
endif\
endif\
endif\
", 
               MudProgType = "entry_prog", 
               Arguments = "100", 
            }, 
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "You are on the main platform of the shipyard orbiting Coruscant. Because\
it is an off planet shipyard, larger capital ships maybe built and launched\
from here as well as the more standard planetary ones.\
All of the ships in this part of the shipyard are ready for flight.\
Many of them are owned by the rebel alliance but there are often several\
private ones docked here as well as some available to rent\
", 
         Name = "Coruscant Shipyard: Docking Platform Alpha", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32001, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32002, 
               Direction = "east", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32003, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               DestinationVnum = 32004, 
               Direction = "west", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32000, 
      }, 
      [32001] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "You are standing near the shield wall Of docking platform-alpha.\
The large bay is open at all ends. The atmosphere and pressure is contained\
by an energy field that stretches all around its perimiter. The ceiling\
is high enough for lorger ships although the biggest ones dock underneath\
or on the roof of the platform and are accessed through air tubes.\
This part of the station is not used at all for construction. All of\
the equipment here is geared towards refueling and repairing ships.\
", 
         Name = "Coruscant Shipyard: Docking Platform Alpha-N", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32000, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32002, 
               Direction = "southeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32004, 
               Direction = "southwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32001, 
      }, 
      [32002] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "You are standing near the shield wall Of docking platform-alpha.\
The large bay is open at all ends. The atmosphere and pressure is contained\
by an energy field that stretches all around its perimiter. The ceiling\
is high enough for lorger ships although the biggest ones dock underneath\
or on the roof of the platform and are accessed through air tubes.\
This part of the station is not used at all for construction. All of\
the equipment here is geared towards refueling and repairing ships.\
", 
         Name = "Coruscant Shipyard: Docking Platform Alpha-E", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32000, 
               Direction = "west", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32001, 
               Direction = "northwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32003, 
               Direction = "southwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32002, 
      }, 
      [32003] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "You are standing near the shield wall Of docking platform-alpha.\
The large bay is open at all ends. The atmosphere and pressure is contained\
by an energy field that stretches all around its perimiter. The ceiling\
is high enough for lorger ships although the biggest ones dock underneath\
or on the roof of the platform and are accessed through air tubes.\
This part of the station is not used at all for construction. All of\
the equipment here is geared towards refueling and repairing ships.\
", 
         Name = "Coruscant Shipyard: Docking Platform Alpha-S", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32000, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32002, 
               Direction = "northeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32004, 
               Direction = "northwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32003, 
      }, 
      [32004] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "You are standing by the inside wall of platform alpha. The enormous\
shipyard ahead of you is open all all sides except for this one.\
The dock is filled with spacecraft of many shapes and sizes. Several\
technicians can be seen refueling and making adjustments to some of the\
spacecraft as well as many astromech droids wheeling in and out around\
the many tubes and equipment lining the floors.\
There is a small lift platform as well as stairs leading up to the catwalk\
above as well as to the rest of the station.\
", 
         Name = "Coruscant Shipyard: Docking Platform Alpha-W", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32000, 
               Direction = "east", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32026, 
               Direction = "up", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32001, 
               Direction = "northeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               DestinationVnum = 32003, 
               Direction = "southeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32004, 
      }, 
      [32005] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "This turbo car runs across the space station connecting platforms alpha\
and gamma to the hub of the station.\
The floor is covered in a dark rubber that provides good traction at the\
same time as being easy to clean. There are cushioned benches along the\
walls of the car although most passengers prefer to stand as the trip is\
very short. Looking out the window you see the tunnel lights rush by\
becoming a long blur and then coming to focus again as you reach your\
destination.\
", 
         Name = "A Turbocar", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32026, 
               Direction = "east", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32006, 
               Direction = "west", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32005, 
      }, 
      [32006] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "You stand at a crossroads of turbocars. There is one leading from here\
in each of four directions to the four large platforms that extend\
from the stations hub. This area in between is a large open foyer. To\
the northeast a turbolift leads up and down to the rest of the\
stations main levels. \
", 
         Name = "The Central Hub", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32013, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32005, 
               Direction = "east", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32019, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               DestinationVnum = 32007, 
               Direction = "west", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [5] = 
            {
               DestinationVnum = 32029, 
               Direction = "northeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32006, 
      }, 
      [32007] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "This turbo car runs across the space station connecting platforms alpha\
and gamma to the hub of the station.\
The floor is covered in a dark rubber that provides good traction at the\
same time as being easy to clean. There are cushioned benches along the\
walls of the car although most passengers prefer to stand as the trip is\
very short. Looking out the window you see the tunnel lights rush by\
becoming a long blur and then coming to focus again as you reach your\
destination.\
", 
         Name = "A Turbocar", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32006, 
               Direction = "east", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32025, 
               Direction = "west", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32007, 
      }, 
      [32008] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "This platform is filled with of many shapes and sizes in various\
stages of construction. The floor is littered with ship parts, tools,\
pipes and tubes of all sorts. Droids of all shapes and sizes\
including a couple of large cranes help the technicians with the ship\
construction. There are lift tubes rising from the floor and\
extending to the ceiling in various places. These are connected to\
larger capital ships under construction that are moored to the\
outside of the station. A shield wall extends most of the way around\
the platform containing the atmosphere and allowing the crew to work\
without space suits.\
", 
         Name = "Coruscant Shipyard: Docking Platform Gamma-E", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32009, 
               Direction = "west", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32025, 
               Direction = "up", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32011, 
               Direction = "northwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               DestinationVnum = 32012, 
               Direction = "southwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32008, 
      }, 
      [32009] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "This platform is filled with of many shapes and sizes in various\
stages of construction. The floor is littered with ship parts, tools,\
pipes and tubes of all sorts. Droids of all shapes and sizes\
including a couple of large cranes help the technicians with the ship\
construction. There are lift tubes rising from the floor and\
extending to the ceiling in various places. These are connected to\
larger capital ships under construction that are moored to the\
outside of the station. A shield wall extends most of the way around\
the platform containing the atmosphere and allowing the crew to work\
without space suits.\
", 
         Name = "Coruscant Shipyard: Docking Platform Gamma", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32011, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32008, 
               Direction = "east", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32012, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               DestinationVnum = 32010, 
               Direction = "west", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32009, 
      }, 
      [32010] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "This platform is filled with of many shapes and sizes in various\
stages of construction. The floor is littered with ship parts, tools,\
pipes and tubes of all sorts. Droids of all shapes and sizes\
including a couple of large cranes help the technicians with the ship\
construction. There are lift tubes rising from the floor and\
extending to the ceiling in various places. These are connected to\
larger capital ships under construction that are moored to the\
outside of the station. A shield wall extends most of the way around\
the platform containing the atmosphere and allowing the crew to work\
without space suits.\
", 
         Name = "Coruscant Shipyard: Docking Platform Gamma-W", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32009, 
               Direction = "east", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32011, 
               Direction = "northeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32012, 
               Direction = "southeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32010, 
      }, 
      [32011] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "This platform is filled with of many shapes and sizes in various\
stages of construction. The floor is littered with ship parts, tools,\
pipes and tubes of all sorts. Droids of all shapes and sizes\
including a couple of large cranes help the technicians with the ship\
construction. There are lift tubes rising from the floor and\
extending to the ceiling in various places. These are connected to\
larger capital ships under construction that are moored to the\
outside of the station. A shield wall extends most of the way around\
the platform containing the atmosphere and allowing the crew to work\
without space suits.\
", 
         Name = "Coruscant Shipyard: Docking Platform Gamma-N", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32009, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32008, 
               Direction = "southeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32010, 
               Direction = "southwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32011, 
      }, 
      [32012] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "This platform is filled with of many shapes and sizes in various\
stages of construction. The floor is littered with ship parts, tools,\
pipes and tubes of all sorts. Droids of all shapes and sizes\
including a couple of large cranes help the technicians with the ship\
construction. There are lift tubes rising from the floor and\
extending to the ceiling in various places. These are connected to\
larger capital ships under construction that are moored to the\
outside of the station. A shield wall extends most of the way around\
the platform containing the atmosphere and allowing the crew to work\
without space suits.\
", 
         Name = "Coruscant Shipyard: Docking Platform Gamma-S", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32009, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32008, 
               Direction = "northeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32010, 
               Direction = "northwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32012, 
      }, 
      [32013] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "This turbo car runs across the space station connecting platforms delta\
and beta to the hub of the station.\
The floor is covered in a dark rubber that provides good traction at the\
same time as being easy to clean. There are cushioned benches along the\
walls of the car although most passengers prefer to stand as the trip is\
very short. Looking out the window you see the tunnel lights rush by\
becoming a long blur and then coming to focus again as you reach your\
destination.\
", 
         Name = "A Turbocar", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32027, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32006, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Flags = 
               {
                  [12] = "Passage", 
               }, 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32013, 
      }, 
      [32014] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "This enormous platform is relatively empty except for a few shuttles\
and transports , some droids, and a few shipyard staff. This platform\
is mainly used for public and commercial transports carrying\
passengers or supplies. The floor is clean and well polished. Small\
docking lights outline individual landing pads. The outside walls are\
open in several places protected from the outside by shield walls\
that let ships to pass through but don't allow any atmosphere to\
escape. \
", 
         Name = "Coruscant Shipyard: Docking Platform Delta-S", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32015, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32027, 
               Direction = "up", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32018, 
               Direction = "northeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               DestinationVnum = 32017, 
               Direction = "northwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32014, 
      }, 
      [32015] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "This enormous platform is relatively empty except for a few shuttles\
and transports , some droids, and a few shipyard staff. This platform\
is mainly used for public and commercial transports carrying\
passengers or supplies. The floor is clean and well polished. Small\
docking lights outline individual landing pads. The outside walls are\
open in several places protected from the outside by shield walls\
that let ships to pass through but don't allow any atmosphere to\
escape. A shuttle lands here regularly travelling back and forth from\
the planet.\
", 
         Name = "Coruscant Shipyard: Planetary Shuttle Stop", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32016, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32018, 
               Direction = "east", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32014, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               DestinationVnum = 32017, 
               Direction = "west", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32015, 
      }, 
      [32016] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "This enormous platform is relatively empty except for a few shuttles\
and transports , some droids, and a few shipyard staff. This platform\
is mainly used for public and commercial transports carrying\
passengers or supplies. The floor is clean and well polished. Small\
docking lights outline individual landing pads. The outside walls are\
open in several places protected from the outside by shield walls\
that let ships to pass through but don't allow any atmosphere to\
escape.\
", 
         Name = "Coruscant Shipyard: Docking Platform Delta-N", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32015, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32018, 
               Direction = "southeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32017, 
               Direction = "southwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32016, 
      }, 
      [32017] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "This enormous platform is relatively empty except for a few shuttles\
and transports , some droids, and a few shipyard staff. This platform\
is mainly used for public and commercial transports carrying\
passengers or supplies. The floor is clean and well polished. Small\
docking lights outline individual landing pads. The outside walls are\
open in several places protected from the outside by shield walls\
that let ships to pass through but don't allow any atmosphere to\
escape.\
", 
         Name = "Coruscant Shipyard: Docking Platform Delta-W", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32015, 
               Direction = "east", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32016, 
               Direction = "northeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32014, 
               Direction = "southeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32017, 
      }, 
      [32018] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "This enormous platform is relatively empty except for a few shuttles\
and transports , some droids, and a few shipyard staff. This platform\
is mainly used for public and commercial transports carrying\
passengers or supplies. The floor is clean and well polished. Small\
docking lights outline individual landing pads. The outside walls are\
open in several places protected from the outside by shield walls\
that let ships to pass through but don't allow any atmosphere to\
escape.\
", 
         Name = "Coruscant Shipyard: Docking Platform Delta-E", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32015, 
               Direction = "west", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32016, 
               Direction = "northwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32014, 
               Direction = "southwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32018, 
      }, 
      [32019] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "This turbo car runs across the space station connecting platforms delta\
and beta to the hub of the station.\
The floor is covered in a dark rubber that provides good traction at the\
same time as being easy to clean. There are cushioned benches along the\
walls of the car although most passengers prefer to stand as the trip is\
very short. Looking out the window you see the tunnel lights rush by \
becoming a long blur and then coming to focus again as you reach your\
destination.\
", 
         Name = "A Turbocar", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32006, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32028, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32019, 
      }, 
      [32020] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The ships in this part of the shipyard seem to in most cases be in the\
state of being repaired. Some have open plates revealing electrical\
ship components while others are missing doors or airfoils. One\
larger ship even has an enormous hole in the side clear through to\
what apears to be a passenger hold. The room is noisy with the sounds\
of torches and other tools. The occasional small explosion can\
sometimes be heard as well as an engine firing briefly for a few\
seconds now and again. \
", 
         Name = "Coruscant Shipyard: Docking Platform Beta-N", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32021, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32028, 
               Direction = "up", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32024, 
               Direction = "southeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               DestinationVnum = 32023, 
               Direction = "southwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32020, 
      }, 
      [32021] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The ships in this part of the shipyard seem to in most cases be in the\
state of being repaired. Some have open plates revealing electrical\
ship components while others are missing doors or airfoils. One\
larger ship even has an enormous hole in the side clear through to\
what apears to be a passenger hold. The room is noisy with the sounds\
of torches and other tools. The occasional small explosion can\
sometimes be heard as well as an engine firing briefly for a few\
seconds now and again. \
", 
         Name = "Coruscant Shipyard: Docking Platform Beta", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32020, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32024, 
               Direction = "east", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32022, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               DestinationVnum = 32023, 
               Direction = "west", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32021, 
      }, 
      [32022] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The ships in this part of the shipyard seem to in most cases be in the\
state of being repaired. Some have open plates revealing electrical\
ship components while others are missing doors or airfoils. One\
larger ship even has an enormous hole in the side clear through to\
what apears to be a passenger hold. The room is noisy with the sounds\
of torches and other tools. The occasional small explosion can\
sometimes be heard as well as an engine firing briefly for a few\
seconds now and again.\
", 
         Name = "Coruscant Shipyard: Docking Platform Beta-S", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32021, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32024, 
               Direction = "northeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32023, 
               Direction = "northwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32022, 
      }, 
      [32023] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The ships in this part of the shipyard seem to in most cases be in the\
state of being repaired. Some have open plates revealing electrical\
ship components while others are missing doors or airfoils. One\
larger ship even has an enormous hole in the side clear through to\
what apears to be a passenger hold. The room is noisy with the sounds\
of torches and other tools. The occasional small explosion can\
sometimes be heard as well as an engine firing briefly for a few\
seconds now and again. \
", 
         Name = "Coruscant Shipyard: Docking Platform Beta-W", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32021, 
               Direction = "east", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32020, 
               Direction = "northeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32022, 
               Direction = "southeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32023, 
      }, 
      [32024] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The ships in this part of the shipyard seem to in most cases be in the\
state of being repaired. Some have open plates revealing electrical\
ship components while others are missing doors or airfoils. One\
larger ship even has an enormous hole in the side clear through to\
what apears to be a passenger hold. The room is noisy with the sounds\
of torches and other tools. The occasional small explosion can\
sometimes be heard as well as an engine firing briefly for a few\
seconds now and again. \
", 
         Name = "Coruscant Shipyard: Docking Platform Beta-E", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32021, 
               Direction = "west", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32020, 
               Direction = "northwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32022, 
               Direction = "southwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32024, 
      }, 
      [32025] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "This platform is filled with of many shapes and sizes in various\
stages of construction. The floor is littered with ship parts, tools,\
pipes and tubes of all sorts. Droids of all shapes and sizes\
including a couple of large cranes help the technicians with the ship\
construction. There are lift tubes rising from the floor and\
extending to the ceiling in various places. These are connected to\
larger capital ships under construction that are moored to the\
outside of the station. A shield wall extends most of the way around\
the platform containing the atmosphere and allowing the crew to work\
without space suits.\
", 
         Name = "Catwalk Overlooking Docking Platform Gamma", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32007, 
               Direction = "east", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32008, 
               Direction = "down", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32025, 
      }, 
      [32026] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "You stand on a catwalk overlooking a large docking bay. From here\
you see mostly starfighters docked on the platform bellow but there\
are also many shuttles as well as a couple of larger ships.\
All of the ships here look to be space ready. You see no cranes or other\
shipbuilding equipment.\
There is a small lift that leads down onto the platform here. To the west\
a turbocar can take you to the main part of the station.\
", 
         Name = "Catwalk Overlooking Docking Platform Alpha", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32005, 
               Direction = "west", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32004, 
               Direction = "down", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32026, 
      }, 
      [32027] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "This enormous platform is relatively empty except for a few shuttles\
and transports , some droids, and a few shipyard staff. This platform\
is mainly used for public and commercial transports carrying\
passengers or supplies. The floor is clean and well polished. Small\
docking lights outline individual landing pads. The outside walls are\
open in several places protected from the outside by shield walls\
that let ships to pass through but don't allow any atmosphere to\
escape. \
", 
         Name = "Catwalk Overlooking Docking Platform Delta", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32013, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32014, 
               Direction = "down", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32027, 
      }, 
      [32028] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The ships in this part of the shipyard seem to in most cases be in the\
state of being repaired. Some have open plates revealing electrical\
ship components while others are missing doors or airfoils. One\
larger ship even has an enormous hole in the side clear through to\
what apears to be a passenger hold. The room is noisy with the sounds\
of torches and other tools. The occasional small explosion can\
sometimes be heard as well as an engine firing briefly for a few\
seconds now and again. \
", 
         Name = "Catwalk Overlooking Docking Platform Beta", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32019, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32020, 
               Direction = "down", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32028, 
      }, 
      [32029] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The turbolift runs up and down through the hub of the shipyard\
connecting all of the main levels. It moves quickly yet you feel very\
little motion as it travels. It has an off white interior and is\
large enough to accomadate a dozon or so humanoid people. A control\
panel on the wall accepts both keypad and voice commands. \
", 
         Name = "Turbolift: Shipyard Level", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32030, 
               Direction = "up", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32031, 
               Direction = "down", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32006, 
               Direction = "southwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32029, 
      }, 
      [32030] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The turbolift runs up and down through the hub of the shipyard\
connecting all of the main levels. It moves quickly yet you feel very\
little motion as it travels. It has an off white interior and is\
large enough to accomadate a dozon or so humanoid people. A control\
panel on the wall accepts both keypad and voice commands. \
", 
         Name = "Turbolift: Residential Level", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32032, 
               Direction = "up", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32029, 
               Direction = "down", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32034, 
               Direction = "southwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32030, 
      }, 
      [32031] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The turbolift runs up and down through the hub of the shipyard\
connecting all of the main levels. It moves quickly yet you feel very\
little motion as it travels. It has an off white interior and is\
large enough to accomadate a dozon or so humanoid people. A control\
panel on the wall accepts both keypad and voice commands. \
", 
         Name = "Turbolift: Commercial Level", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32029, 
               Direction = "up", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32033, 
               Direction = "down", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32039, 
               Direction = "southwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32031, 
      }, 
      [32032] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The turbolift runs up and down through the hub of the shipyard\
connecting all of the main levels. It moves quickly yet you feel very\
little motion as it travels. It has an off white interior and is\
large enough to accomadate a dozon or so humanoid people. A control\
panel on the wall accepts both keypad and voice commands. \
", 
         Name = "Turbolift: Command Level", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32030, 
               Direction = "down", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32049, 
               Direction = "southwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32032, 
      }, 
      [32033] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The turbolift runs up and down through the hub of the shipyard\
connecting all of the main levels. It moves quickly yet you feel very\
little motion as it travels. It has an off white interior and is\
large enough to accomadate a dozon or so humanoid people. A control\
panel on the wall accepts both keypad and voice commands. \
", 
         Name = "Turbolift: Military Level", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32031, 
               Direction = "up", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32044, 
               Direction = "southwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32033, 
      }, 
      [32034] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The residential level is one of its more pleaseant areas. The halls\
are wide with high ceilings and plush carpets. White glowpanels are\
spaced strategicly around the walls and ceilings giving the halls a\
sunlit apearance. Plants from varios planets are placed throughout\
the area - resting on the floor or hanging from the ceiling. \
", 
         Name = "Residential Lobby", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32035, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32038, 
               Direction = "east", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32036, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               DestinationVnum = 32037, 
               Direction = "west", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [5] = 
            {
               DestinationVnum = 32030, 
               Direction = "northeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Flags = 
               {
                  [24] = "NoMob", 
               }, 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32034, 
      }, 
      [32035] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The residential level is one of its more pleaseant areas. The halls\
are wide with high ceilings and plush carpets. White glowpanels are\
spaced strategicly around the walls and ceilings giving the halls a\
sunlit apearance. Plants from varios planets are placed throughout\
the area - resting on the floor or hanging from the ceiling. There\
are many numbered doors allong the walls leading you would assume to\
private appartments.\
", 
         Name = "Residential North Wing", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32034, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32035, 
      }, 
      [32036] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The residential level is one of its more pleaseant areas. The halls\
are wide with high ceilings and plush carpets. White glowpanels are\
spaced strategicly around the walls and ceilings giving the halls a\
sunlit apearance. Plants from varios planets are placed throughout\
the area - resting on the floor or hanging from the ceiling. There\
are many numbered doors allong the walls leading you would assume to\
private appartments.\
", 
         Name = "Residential South Wing", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32034, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32036, 
      }, 
      [32037] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The residential level is one of its more pleaseant areas. The halls\
are wide with high ceilings and plush carpets. White glowpanels are\
spaced strategicly around the walls and ceilings giving the halls a\
sunlit apearance. Plants from varios planets are placed throughout\
the area - resting on the floor or hanging from the ceiling. There\
are many numbered doors allong the walls leading you would assume to\
private appartments.\
", 
         Name = "Residential West Wing", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32034, 
               Direction = "east", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32037, 
      }, 
      [32038] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The residential level is one of its more pleaseant areas. The halls\
are wide with high ceilings and plush carpets. White glowpanels are\
spaced strategicly around the walls and ceilings giving the halls a\
sunlit apearance. Plants from varios planets are placed throughout\
the area - resting on the floor or hanging from the ceiling. There\
are many numbered doors allong the walls leading you would assume to\
private appartments.\
", 
         Name = "Residential East Wing", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32034, 
               Direction = "west", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32038, 
      }, 
      [32039] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The station marketplace is a wide open deck. It is filled with several\
booths where merchants can set up and sell their goods for a small\
fee. Large fans cover the ceiling constantly recycling the air,\
giving it a much fresher smell than most planetary markets even thouh\
it is in an enclosed space. Amidst the booths there are also several\
benches and a few tables for shoppers to sit and take a break.\
", 
         Name = "The Station Marketplace", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32031, 
               Direction = "northeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32040, 
               Direction = "northwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32043, 
               Direction = "southeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               DestinationVnum = 32045, 
               Direction = "southwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32039, 
      }, 
      [32040] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The cantina is mostly open towards the center with booths around the\
perimeter. The room is dimly lit throughout. There is no live\
entertainment - instead a popular corellian music station is playing\
over the soundsystem. The room feels pretty tame for a canteena but\
you feel things could get pretty roundy every once in a while. \
", 
         Name = "Spaceport Cantina", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32042, 
               Direction = "east", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32041, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32039, 
               Direction = "southeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32040, 
      }, 
      [32041] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "This booth like most here is somewhat enclosed. A single dim glowlamp\
hangs from the ceiling over the center of the table. The table itself\
is littered with a couple of empty glasses and a waste tray for ashes\
and for the remains of other disposable addictive substances.\
", 
         Name = "A Booth", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32040, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32041, 
      }, 
      [32042] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "This long bar is littered wit hempty glasses and bottles. You see what\
apears to be a couple of spice containers as well. Behind the bar are\
bottles of every imaginable shape size and color. One of the more\
interseting is a bottle shaped like a blue lightsaber which is almost\
as big as one. A credit machine is on the other side of the bar as\
well. A small opening seems to lead to the kitchen.\
", 
         Name = "The Bar", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32040, 
               Direction = "west", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32042, 
      }, 
      [32043] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The station store is alot more orderly than the rest of the market.\
Things are arranged in small eisles by product type. The store seems\
to carry a wide assortment of goods - food, clothing, hardware and\
supplies. A droid activates a scanner by the door automaticly\
recording your purchaces.\
", 
         Name = "Shipyard Store", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32039, 
               Direction = "northwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32043, 
      }, 
      [32044] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [27] = "Recruit", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "To join the Rebel Alliance type ENLIST\
\13", 
               Keyword = "recruiting recruit desk", 
            }, 
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The military level is mostly a large empty space. The floor is thinly\
matted with a black rubbery surface. The walls are a dull non\
reflective light grey. A wide track is marked around the perimiter.\
This is very obviously used for training excersizes and drills. Large\
doors lead out of here to the barraks as well as the officers room.\
", 
         Name = "Military Level Foyer", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32048, 
               Direction = "east", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32047, 
               Direction = "west", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32033, 
               Direction = "northeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32044, 
      }, 
      [32045] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The lobby of the station hotel is small and relatively simple. The\
floor is white marble and the walls appear to be a similar looking\
although lighter material. A small desk is at the back of the room\
flanked by a couple of large plants. Corridors exit out the sides of\
the lobby leading to the hotel rooms.  \
 \
This would be a good place to rest for awhile. You may\
safely leave and re-enter the game from here.\
 \
", 
         Name = "The Station Hotel", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32039, 
               Direction = "northeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32045, 
      }, 
      [32046] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "This is a standard looking miitary bunkroom. Rows of stacked beds line\
the walls. At the end of each bed is a foot locker. Small closets are\
on the walls inbetween the beds. The room is clean and very orderly.\
", 
         Name = "Barraks Bunkroom", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32047, 
               Direction = "southwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32046, 
      }, 
      [32047] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The barraks lounge is a pretty functional room. There are several\
chairs and couches scattered around the rooms perimiter. There are\
two tables with chairs as well as a smaller game table located in the\
center of the room. The walls have several pictures taped to them. A\
large buletin board hangs on one side of the room. The off duty\
trooper is dressed in khaki's and an udershirt. He looks tired but a\
bit of excitement can be seen in his eye.\
", 
         Name = "Barraks Lounge", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32044, 
               Direction = "east", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32046, 
               Direction = "northeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32047, 
      }, 
      [32048] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "Thi coomon room is shared by all of the stations officers. There are\
several couches and chairs arond the room for sitting and reading or\
even watching the holovid. A one end of the room is a large table and\
chairs. The room is nicely decorated with several painings and a\
statuette of an Old Republic war hero. There are a few of doors that\
lead to the officers private rooms. \
", 
         Name = "Officers Quarters", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32044, 
               Direction = "west", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32048, 
      }, 
      [32049] = 
      {
         MudProgs = 
         {
            [1] = 
            {
               Code = "if isimmort($n)\
else\
if clan($n) == The Empire\
mpechoat $n You pass by the hidden guards.\
else\
if clan($n) == The Death Commandos\
mpechoat $n You pass by the hidden guards.\
else\
mpechoat $n Someone says, 'Hey, you don't belong here!'\
mpforce $n ne\
endif\
endif\
endif\
", 
               MudProgType = "entry_prog", 
               Arguments = "100", 
            }, 
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The stations command room is a large round room overlooking the rest\
of the station. Controll panels all around the perimiter of the room\
are topped with large windows giving a panoramic view of the four\
shipyard spokes. Dozens of chairs are set up infront of the panels,\
many of them containing shipyard personel. A smaller ring of control\
panels forms an island in the center of the room with a second set of\
chairs and workers within. A turbolift leading down to the rest of\
the station is the only exit. \
", 
         Name = "Command Tower", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32032, 
               Direction = "northeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32049, 
      }, 
      [32050] = 
      {
         MudProgs = 
         {
            [1] = 
            {
               Code = "openbay\
", 
               MudProgType = "rand_prog", 
               Arguments = "100", 
            }, 
            [2] = 
            {
               Code = "openbay\
", 
               MudProgType = "speech_prog", 
               Arguments = "openbay", 
            }, 
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The shipyard level of the station is one enormous hangar. Hundreds of\
ships are docked throughout it. Some are situated on raised\
platforms while others which are under construction are in building\
pits. The ceiling is high enough for ships to comfortably navigate\
the shipyard. The entire shipyard deck is incredibly clean\
considering the work done. The floor is a smooth polished black\
surface. Along the perimiters of the station shield protected\
openings allow spacecraft to leave the shipyard into the surrounding\
starsystem.\
", 
         Name = "Kuat Shipyard, North Platform", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32051, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32052, 
               Direction = "southeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32058, 
               Direction = "southwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32050, 
      }, 
      [32051] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The shipyard level of the station is one enormous hangar. Hundreds of\
ships are docked throughout it. Some are situated on raised\
platforms while others which are under construction are in building\
pits. The ceiling is high enough for ships to comfortably navigate \
the shipyard. The entire shipyard deck is incredibly clean\
considering the work done. The floor is a smooth polished black\
surface. Along the perimiters of the station shield protected\
openings allow spacecraft to leave the shipyard into the surrounding\
starsystem.\
", 
         Name = "Kuat Shipyard, Main Hangar N", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32050, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32052, 
               Direction = "east", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32062, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               DestinationVnum = 32058, 
               Direction = "west", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [5] = 
            {
               DestinationVnum = 32053, 
               Direction = "southeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [6] = 
            {
               DestinationVnum = 32057, 
               Direction = "southwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32051, 
      }, 
      [32052] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The shipyard level of the station is one enormous hangar. Hundreds of\
ships are docked throughout it. Some are situated on raised\
platforms while others which are under construction are in building\
pits. The ceiling is high enough for ships to comfortably navigate\
the shipyard. The entire shipyard deck is incredibly clean\
considering the work done. The floor is a smooth polished black\
surface. Along the perimiters of the station shield protected\
openings allow spacecraft to leave the shipyard into the surrounding\
starsystem.\
", 
         Name = "Kuat Shipyard, Main Hangar NE", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32053, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32051, 
               Direction = "west", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32050, 
               Direction = "northwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               DestinationVnum = 32059, 
               Direction = "southeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32052, 
      }, 
      [32053] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The shipyard level of the station is one enormous hangar. Hundreds of\
ships are docked throughout it. Some are situated on raised\
platforms while others which are under construction are in building\
pits. The ceiling is high enough for ships to comfortably navigate\
the shipyard. The entire shipyard deck is incredibly clean\
considering the work done. The floor is a smooth polished black\
surface. Along the perimiters of the station shield protected\
openings allow spacecraft to leave the shipyard into the surrounding\
starsystem.\
", 
         Name = "Kuat Shipyard, Main Hangar E", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32052, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32059, 
               Direction = "east", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32054, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               DestinationVnum = 32051, 
               Direction = "northwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [5] = 
            {
               DestinationVnum = 32055, 
               Direction = "southwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32053, 
      }, 
      [32054] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The shipyard level of the station is one enormous hangar. Hundreds of\
ships are docked throughout it. Some are situated on raised\
platforms while others which are under construction are in building\
pits. The ceiling is high enough for ships to comfortably navigate\
the shipyard. The entire shipyard deck is incredibly clean\
considering the work done. The floor is a smooth polished black\
surface. Along the perimiters of the station shield protected\
openings allow spacecraft to leave the shipyard into the surrounding\
starsystem.\
", 
         Name = "Kuat Shipyard, Main Hangar SE", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32053, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32055, 
               Direction = "west", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32059, 
               Direction = "northeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               DestinationVnum = 32060, 
               Direction = "southwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32054, 
      }, 
      [32055] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The shipyard level of the station is one enormous hangar. Hundreds of\
ships are docked throughout it. Some are situated on raised\
platforms while others which are under construction are in building\
pits. The ceiling is high enough for ships to comfortably navigate\
the shipyard. The entire shipyard deck is incredibly clean\
considering the work done. The floor is a smooth polished black\
surface. Along the perimiters of the station shield protected\
openings allow spacecraft to leave the shipyard into the surrounding\
starsystem.\
", 
         Name = "Kuat Shipyard, Main Hangar S", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32062, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32054, 
               Direction = "east", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32060, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               DestinationVnum = 32056, 
               Direction = "west", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [5] = 
            {
               DestinationVnum = 32053, 
               Direction = "northeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [6] = 
            {
               DestinationVnum = 32057, 
               Direction = "northwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32055, 
      }, 
      [32056] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The shipyard level of the station is one enormous hangar. Hundreds of\
ships are docked throughout it. Some are situated on raised\
platforms while others which are under construction are in building\
pits. The ceiling is high enough for ships to comfortably navigate\
the shipyard. The entire shipyard deck is incredibly clean\
considering the work done. The floor is a smooth polished black\
surface. Along the perimiters of the station shield protected\
openings allow spacecraft to leave the shipyard into the surrounding\
starsystem.\
", 
         Name = "Kuat Shipyard, Main Hangar SW", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32057, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32055, 
               Direction = "east", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32061, 
               Direction = "northwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               DestinationVnum = 32060, 
               Direction = "southeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32056, 
      }, 
      [32057] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The shipyard level of the station is one enormous hangar. Hundreds of\
ships are docked throughout it. Some are situated on raised\
platforms while others which are under construction are in building\
pits. The ceiling is high enough for ships to comfortably navigate\
the shipyard. The entire shipyard deck is incredibly clean\
considering the work done. The floor is a smooth polished black\
surface. Along the perimiters of the station shield protected\
openings allow spacecraft to leave the shipyard into the surrounding\
starsystem.\
", 
         Name = "Kuat Shipyard, Main Hangar W", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32058, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32056, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32061, 
               Direction = "west", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               DestinationVnum = 32051, 
               Direction = "northeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [5] = 
            {
               DestinationVnum = 32055, 
               Direction = "southeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32057, 
      }, 
      [32058] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Kuat Shipyard, Main Hangar NW", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32051, 
               Direction = "east", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32057, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32050, 
               Direction = "northeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               DestinationVnum = 32061, 
               Direction = "southwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32058, 
      }, 
      [32059] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The shipyard level of the station is one enormous hangar. Hundreds of\
ships are docked throughout it. Some are situated on raised\
platforms while others which are under construction are in building\
pits. The ceiling is high enough for ships to comfortably navigate\
the shipyard. The entire shipyard deck is incredibly clean\
considering the work done. The floor is a smooth polished black\
surface. Along the perimiters of the station shield protected\
openings allow spacecraft to leave the shipyard into the surrounding\
starsystem.\
", 
         Name = "Kuat Shipyard, East Platform", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32053, 
               Direction = "west", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32071, 
               Direction = "down", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32052, 
               Direction = "northwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               DestinationVnum = 32054, 
               Direction = "southwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32059, 
      }, 
      [32060] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The shipyard level of the station is one enormous hangar. Hundreds of\
ships are docked throughout it. Some are situated on raised\
platforms while others which are under construction are in building\
pits. The ceiling is high enough for ships to comfortably navigate\
the shipyard. The entire shipyard deck is incredibly clean\
considering the work done. The floor is a smooth polished black\
surface. Along the perimiters of the station shield protected\
openings allow spacecraft to leave the shipyard into the surrounding\
starsystem.\
", 
         Name = "Kuat Shipyard, South Platform", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32055, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32054, 
               Direction = "northeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32056, 
               Direction = "northwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32060, 
      }, 
      [32061] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The shipyard level of the station is one enormous hangar. Hundreds of\
ships are docked throughout it. Some are situated on raised\
platforms while others which are under construction are in building\
pits. The ceiling is high enough for ships to comfortably navigate\
the shipyard. The entire shipyard deck is incredibly clean\
considering the work done. The floor is a smooth polished black\
surface. Along the perimiters of the station shield protected\
openings allow spacecraft to leave the shipyard into the surrounding\
starsystem.\
", 
         Name = "Kuat Shipyard, West Platform", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32057, 
               Direction = "east", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32070, 
               Direction = "down", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32058, 
               Direction = "northeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               DestinationVnum = 32056, 
               Direction = "southeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32061, 
      }, 
      [32062] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "This large turbolift runs up adnd down through the main levels of the Kuat\
shipyard. The lift is octagonal in shape and is large enough to hold a\
couple of dozen people quit comfortably. The walls and ceiling like most\
of the station are a deep grey colour. The floor is metalic and covered in\
small bumps that seem to be designed to provide someone good traction on\
the floor. It would also come in handy in keeping large objects from\
sliding around on the floor. \
", 
         Name = "Turbolift: Platform Level", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32051, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32055, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32063, 
               Direction = "up", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               DestinationVnum = 32064, 
               Direction = "down", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32062, 
      }, 
      [32063] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "This large turbolift runs up adnd down through the main levels of the Kuat\
shipyard. The lift is octagonal in shape and is large enough to hold a\
couple of dozen people quit comfortably. The walls and ceiling like most\
of the station are a deep grey colour. The floor is metalic and covered in\
small bumps that seem to be designed to provide someone good traction on\
the floor. It would also come in handy in keeping large objects from\
sliding around on the floor. \
", 
         Name = "Turbolift: Command Level", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32099, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32062, 
               Direction = "down", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32063, 
      }, 
      [32064] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "This large turbolift runs up adnd down through the main levels of the Kuat\
shipyard. The lift is octagonal in shape and is large enough to hold a\
couple of dozen people quit comfortably. The walls and ceiling like most\
of the station are a deep grey colour. The floor is metalic and covered in\
small bumps that seem to be designed to provide someone good traction on\
the floor. It would also come in handy in keeping large objects from\
sliding around on the floor. \
", 
         Name = "Turbolift: Engineering Level", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32072, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32062, 
               Direction = "up", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32065, 
               Direction = "down", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32064, 
      }, 
      [32065] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "This large turbolift runs up adnd down through the main levels of the Kuat\
shipyard. The lift is octagonal in shape and is large enough to hold a\
couple of dozen people quit comfortably. The walls and ceiling like most\
of the station are a deep grey colour. The floor is metalic and covered in\
small bumps that seem to be designed to provide someone good traction on\
the floor. It would also come in handy in keeping large objects from\
sliding around on the floor. \
", 
         Name = "Turbolift: Comercial Level", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32091, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32064, 
               Direction = "up", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32066, 
               Direction = "down", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32065, 
      }, 
      [32066] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "This large turbolift runs up adnd down through the main levels of the Kuat\
shipyard. The lift is octagonal in shape and is large enough to hold a\
couple of dozen people quit comfortably. The walls and ceiling like most\
of the station are a deep grey colour. The floor is metalic and covered in\
small bumps that seem to be designed to provide someone good traction on\
the floor. It would also come in handy in keeping large objects from\
sliding around on the floor.\
", 
         Name = "Turbolift: Residential Level", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32076, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32065, 
               Direction = "up", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32067, 
               Direction = "down", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32066, 
      }, 
      [32067] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "This large turbolift runs up adnd down through the main levels of the Kuat\
shipyard. The lift is octagonal in shape and is large enough to hold a\
couple of dozen people quit comfortably. The walls and ceiling like most\
of the station are a deep grey colour. The floor is metalic and covered in\
small bumps that seem to be designed to provide someone good traction on\
the floor. It would also come in handy in keeping large objects from\
sliding around on the floor.\
", 
         Name = "Turbolift: Upper Military Level", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32096, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32066, 
               Direction = "up", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32068, 
               Direction = "down", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32067, 
      }, 
      [32068] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "This large turbolift runs up adnd down through the main levels of the Kuat\
shipyard. The lift is octagonal in shape and is large enough to hold a\
couple of dozen people quit comfortably. The walls and ceiling like most\
of the station are a deep grey colour. The floor is metalic and covered in\
small bumps that seem to be designed to provide someone good traction on\
the floor. It would also come in handy in keeping large objects from\
sliding around on the floor.\
", 
         Name = "Turbolift: Lower Military Level", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32084, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32067, 
               Direction = "up", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32069, 
               Direction = "down", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32068, 
      }, 
      [32069] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "This large turbolift runs up adnd down through the main levels of the Kuat\
shipyard. The lift is octagonal in shape and is large enough to hold a\
couple of dozen people quit comfortably. The walls and ceiling like most\
of the station are a deep grey colour. The floor is metalic and covered in\
small bumps that seem to be designed to provide someone good traction on\
the floor. It would also come in handy in keeping large objects from\
sliding around on the floor.\
", 
         Name = "Turbolift: Slave Level", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32080, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32068, 
               Direction = "up", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32069, 
      }, 
      [32070] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 2, 
         Sector = "city", 
         Description = "The gun turret extends out bellow the edge of the space platform. It\
is gyroscopicly mounted to swivil in all directions giving you an\
excellent field of fire.  \
", 
         Name = "Station Defence Turret", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32061, 
               Direction = "up", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32070, 
      }, 
      [32071] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 2, 
         Sector = "city", 
         Description = "The gun turret extends out bellow the edge of the space platform. It\
is gyroscopicly mounted to swivil in all directions giving you an\
excellent field of fire. \
", 
         Name = "Station Defence Turret", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32059, 
               Direction = "up", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32071, 
      }, 
      [32072] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The enginering deck is shaped like a giant ring overlooking a narrow\
chasm that starts at the ceiling and stretches down many stories\
presumably to the bottom of the station. A large piece of machinery\
stretches down from the ceiling into the chasm. I bright beem of\
light stretches from its tip downwards. A large round turbolift\
passes throught the deck on the north side of the chasm. The rest of\
the deck surrounding the chasm and turbolift  is filled with computer\
terminals and various sizes and shapes of machinery  of machinery.\
The high ceiling is covered with overlapping pipes and tubing. Next\
to the platform level, this is the second largest deck on the\
station.\
", 
         Name = "North Side of the Engineering Deck", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32064, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32074, 
               Direction = "southeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32073, 
               Direction = "southwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32072, 
      }, 
      [32073] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The enginering deck is shaped like a giant ring overlooking a narrow\
chasm that starts at the ceiling and stretches down many stories\
presumably to the bottom of the station. A large piece of machinery\
stretches down from the ceiling into the chasm. I bright beem of\
light stretches from its tip downwards. A large round turbolift\
passes throught the deck on the north side of the chasm. The rest of\
the deck surrounding the chasm and turbolift  is filled with computer\
terminals and various sizes and shapes of machinery  of machinery.\
The high ceiling is covered with overlapping pipes and tubing. Next\
to the platform level, this is the second largest deck on the\
station.\
", 
         Name = "West End of the Engineering Deck", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32072, 
               Direction = "northeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32075, 
               Direction = "southeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32073, 
      }, 
      [32074] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The enginering deck is shaped like a giant ring overlooking a narrow\
chasm that starts at the ceiling and stretches down many stories\
presumably to the bottom of the station. A large piece of machinery\
stretches down from the ceiling into the chasm. I bright beem of\
light stretches from its tip downwards. A large round turbolift\
passes throught the deck on the north side of the chasm. The rest of\
the deck surrounding the chasm and turbolift  is filled with computer\
terminals and various sizes and shapes of machinery  of machinery.\
The high ceiling is covered with overlapping pipes and tubing. Next\
to the platform level, this is the second largest deck on the\
station.\
", 
         Name = "East End of the Engineering Deck", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32072, 
               Direction = "northwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32075, 
               Direction = "southwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32074, 
      }, 
      [32075] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The enginering deck is shaped like a giant ring overlooking a narrow\
chasm that starts at the ceiling and stretches down many stories\
presumably to the bottom of the station. A large piece of machinery\
stretches down from the ceiling into the chasm. I bright beem of\
light stretches from its tip downwards. A large round turbolift\
passes throught the deck on the north side of the chasm. The rest of\
the deck surrounding the chasm and turbolift  is filled with computer\
terminals and various sizes and shapes of machinery  of machinery.\
The high ceiling is covered with overlapping pipes and tubing. Next\
to the platform level, this is the second largest deck on the\
station.\
", 
         Name = "South End of the Engineering Deck", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32074, 
               Direction = "northeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32073, 
               Direction = "northwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32075, 
      }, 
      [32076] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The residential loop is a ring of housing units encircling this level\
of the orbiting byss shipyard. The doors are evenly spaced out along\
the hall and are all numbered and identical.  The walls of the\
hallway are a dull grey and the floor is polished black like the rest\
of the shipyard.\
", 
         Name = "The Residential Loop", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32066, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32077, 
               Direction = "southeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32079, 
               Direction = "southwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32076, 
      }, 
      [32077] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The residential loop is a ring of housing units encircling this level\
of the orbiting byss shipyard. The doors are evenly spaced out along\
the hall and are all numbered and identical.  The walls of the\
hallway are a dull grey and the floor is polished black like the rest\
of the shipyard.\
", 
         Name = "The Residential Loop", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32076, 
               Direction = "northwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32078, 
               Direction = "southwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32077, 
      }, 
      [32078] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The residential loop is a ring of housing units encircling this level\
of the orbiting byss shipyard. The doors are evenly spaced out along\
the hall and are all numbered and identical.  The walls of the\
hallway are a dull grey and the floor is polished black like the rest\
of the shipyard.\
", 
         Name = "The Residential Loop", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32077, 
               Direction = "northeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32079, 
               Direction = "northwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32078, 
      }, 
      [32079] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The residential loop is a ring of housing units encircling this level\
of the orbiting byss shipyard. The doors are evenly spaced out along\
the hall and are all numbered and identical.  The walls of the\
hallway are a dull grey and the floor is polished black like the rest\
of the shipyard.\
", 
         Name = "The Residential Loop", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32076, 
               Direction = "northeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32078, 
               Direction = "southeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32079, 
      }, 
      [32080] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The area around the turbolift is relatively open but as the corridor\
stretches out between the cells it becomes very narrow providing room\
for only one or two people at a time. The cell doors are all\
electronicly controlled and reinforced with heavy blast shielding.\
", 
         Name = "Slave Corridor", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32081, 
               Direction = "east", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32069, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32082, 
               Direction = "west", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32080, 
      }, 
      [32081] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The cell is small and very uncomfortable. There is no furniture or\
distinguishing marks at all other that a bed that is partially set\
into the wall. The walls and ceiling are a all the same dull grey\
color. Anyone spending any extended period of time here would\
probably loose their mind.\
", 
         Name = "A Cell", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32080, 
               Direction = "west", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32081, 
      }, 
      [32082] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The cell is small and very uncomfortable. There is no furniture or\
distinguishing marks at all other that a bed that is partially set\
into the wall. The walls and ceiling are a all the same dull grey\
color. Anyone spending any extended period of time here would\
probably loose their mind.\
", 
         Name = "A Cell", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32080, 
               Direction = "east", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32082, 
      }, 
      [32083] = 
      {
         Flags = 
         {
            [14] = "Donation", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "This room is an entirely featureless storage locker. The walls are all\
blast shielded. Two small chutes are situated on one wall, leading\
from somewhere above. \
", 
         Name = "A Storage Locker", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32096, 
               Direction = "south", 
               Description = "", 
               Key = 32221, 
               Keyword = "door", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32083, 
      }, 
      [32084] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The lower military deck is a large empty platform with barraks running\
down both sides. The area is large enough for a couple of squads to\
perform drills simultaniously. The floor is scuffed here more than in\
the rest of the shipyard but otherwise it still appears remarkably\
clean and well kept.\
", 
         Name = "Drill Hall", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32088, 
               Direction = "east", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32068, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32085, 
               Direction = "west", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32084, 
      }, 
      [32085] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The imperial barracks are not very apealing to look at unless you\
aren't interested in anything but order discipline and cleanliness.\
Bunks are set out from the walls, each stacked three high. Beside\
each bunk set into the wall is a large storage locker.\
", 
         Name = "Stormtrooper Barraks", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32084, 
               Direction = "east", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32086, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32085, 
      }, 
      [32086] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The imperial barracks are not very apealing to look at unless you\
aren't interested in anything but order discipline and cleanliness.\
Bunks are set out from the walls, each stacked three high. Beside\
each bunk set into the wall is a large storage locker.\
", 
         Name = "Stormtrooper Barraks", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32085, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32086, 
      }, 
      [32087] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The lobby of the shipyard hotel is basicly an extention of the\
courtyard. There are no doors separating the two areas. The only\
furnishing here is a round counter and a few chairs. The counter is\
large enough to house two  hotel clerks within its curvature quite\
comfortably. At the end of the room two corridors stretch out around\
the perimeter of the station. Hotel rooms  are located along these\
corridors circling the entire commercial deck - tucked in behind the\
cantina and department store. \
\
This would be a good safe place to rest for a while. You may leave and\
enter the game from here.\
", 
         Name = "Shipyard Hotel", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32091, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32087, 
      }, 
      [32088] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The imperial barracks are not very apealing to look at unless you\
aren't interested in anything but order discipline and cleanliness.\
Bunks are set out from the walls, each stacked three high. Beside\
each bunk set into the wall is a large storage locker.\
", 
         Name = "Navy Barraks", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32089, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32084, 
               Direction = "west", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32088, 
      }, 
      [32089] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The imperial barracks are not very apealing to look at unless you\
aren't interested in anything but order discipline and cleanliness.\
Bunks are set out from the walls, each stacked three high. Beside\
each bunk set into the wall is a large storage locker.\
", 
         Name = "Navy Barraks", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32088, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32089, 
      }, 
      [32090] = 
      {
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpechoat $n The healing warmth of the bacta spreads over your body.\
feel heal $n\
", 
               MudProgType = "rand_prog", 
               Arguments = "100", 
            }, 
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "You are floating in a tank gelatnous red liquid. A small air hose is\
and mask available for you to breath through. There is not much to do\
here but rest and heal.    When you are done healing type LEAVE and\
let someone else have a turn.\
", 
         Name = "Inside A Bacta Tank", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32097, 
               Direction = "somewhere", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [11] = "Hidden", 
               }, 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32090, 
      }, 
      [32091] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The commercial deck of the Kuat orbital shipyard only of a relatively empty\
courtyard, a large store and a cantina. The courtyard is a wide and very\
clean. The floor here is a polished black synthetic marble and the walls\
are a deep grey as they are in most of the rest of the station. However\
hanging over the courtayrd is a large hanging crystal structure. It\
reflects the light casting reflective light and dark spots around the area\
giving the courtyard a rather pleasant look for an imperial instalation. A\
large fountain is set into a lowered region in the center of the courtyard\
directly bellow the chandelier structure.\
", 
         Name = "Commercial Deck", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32087, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32092, 
               Direction = "east", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32065, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               DestinationVnum = 32095, 
               Direction = "west", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32091, 
      }, 
      [32092] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The Kuat cantina is clean and orderly much like the rest of the shipyard.\
The floor is polished and all the tables that aren't in used are spotless\
and properly set. The bar is clean of empty glasses and and any waste\
trays that aren't being used are freshly polished. The lighting is dim\
here. A gentle musak can be heard over the quiet chatter of the customers.\
", 
         Name = "The Shipyard Cantina", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32094, 
               Direction = "east", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32093, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32091, 
               Direction = "west", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32092, 
      }, 
      [32093] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The Kuat cantina is clean and orderly much like the rest of the shipyard.\
The floor is polished and all the tables that aren't in used are spotless\
and properly set. The bar is clean of empty glasses and and any waste\
trays that aren't being used are freshly polished. The lighting is dim\
here. A gentle musak can be heard over the quiet chatter of the customers.\
", 
         Name = "The Cantina Bar", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32092, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32093, 
      }, 
      [32094] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The Kuat cantina is clean and orderly much like the rest of the shipyard.\
The floor is polished and all the tables that aren't in used are spotless\
and properly set. The bar is clean of empty glasses and and any waste\
trays that aren't being used are freshly polished. The lighting is dim\
here. A gentle musak can be heard over the quiet chatter of the customers.\
", 
         Name = "Back of Shipyard Cantina", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32092, 
               Direction = "west", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32094, 
      }, 
      [32095] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The station store is aranged much like any other department store.\
Aisles running from the front to the back of the store are organised\
into groups of similar items. Droid scanners check your purchaces at\
the front of the store and prevent anyone from shoplifting.\
", 
         Name = "The Station Store", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32091, 
               Direction = "east", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32095, 
      }, 
      [32096] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "To join the empire type ENLIST.\
\13", 
               Keyword = "recruit recruiting desk", 
            }, 
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The foyer of the upper military level is smaller than the lower one\
and better decorated. The floor is the same polished black as the\
rest of the station but the walls are carved in several places\
depicting images of the empires rise to power fifty years ago. There\
is a large monitor here and terminal containing a duty roster and\
other posted information. There are a couple desks situated on one\
side of the foyer. One of them has recruiting information available\
for those wishing to join the ranks of the galactic Empire. \
", 
         Name = "The Military Deck", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32083, 
               Direction = "north", 
               Description = "", 
               Key = 0, 
               Keyword = "door", 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [23] = "BashProof", 
               }, 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32067, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32097, 
               Direction = "west", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               DestinationVnum = 32098, 
               Direction = "southeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32096, 
      }, 
      [32097] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "While most of the Kuat Orbitting Shipyard looks clean, this room looks and\
smells clean. The faint smell of bacta is overpowered by the odour of\
disinfectants. The room is lined along the walls with several beds. Each\
bed has a devider inbetween offering some limmitted privacy. Beside each\
bed are several medical insturments and a terminal used to monitor the\
patients.    \
 \
 \
A door at the back of the room leads to the bacta tanks. It is\
locked\
from non-paying customers.\
", 
         Name = "The Infirmiry", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32096, 
               Direction = "east", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32097, 
      }, 
      [32098] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The officers loung is neat and orderly. There is a big round table\
with may chairs at one end of the room. At the other end are several\
couches some games tables and a holovid. A door at the back leads to\
the officers private chambers.\
", 
         Name = "Officers Lounge", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32096, 
               Direction = "northwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32098, 
      }, 
      [32099] = 
      {
         MudProgs = 
         {
            [1] = 
            {
               Code = "openbay\
", 
               MudProgType = "rand_prog", 
               Arguments = "100", 
            }, 
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The control tower is a large round room overlooking the outside of the\
platform. The outside walls are all transparent giving you a\
panoramic view of the starsystem outside the station. A ring of\
control consoles encircles the room about 10 feet back from the\
windows. In the center of the room is a raised formchair throne\
overlooking everything. The floor is polished black like most of the\
station. An elevator to the south leads down to the rest of the\
shipyard.\
", 
         Name = "Comand Tower", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32063, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32099, 
      }, 
      [32100] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 1, 
         Sector = "city", 
         Description = "The Z-95 headhunter is an older model starfighter but still used\
widely throughout the galaxy. The cramped cockpit is just big enough\
for one person. The canopy does open up nearly 180 degrees though,\
allowing for excellent visiblity, and probably is the only reason\
Z-95's are still used.    \
", 
         Name = "Inside A Z-95 Headhunter", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32100, 
      }, 
      [32101] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "You are in the cockpit of a standard Lambda-class shuttle. It is a\
popular lightly armed shuttle used by the Empire for transporting\
small groups of people. The cockpit is equipped with chairs for both\
a pilot and a co-pilot. There is room enough behind the chairs for a\
few passengers or a flight officer who might wish to oversee the\
flight operation, however most of the passenger seating is towards\
the back of the spacecraft.\
", 
         Name = "Shuttle Cockpit", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32102, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32101, 
      }, 
      [32102] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The entrance ramp is located just behind the cockpit of the shuttle\
and extends down underneath it when open. This almost gives the\
apearance of the shuttle opening its 'mouth' to let out passengers.\
The ramp is covered in a dark carpet suitable for formal apearances.\
A hallway extends around the ramp heading up towards the cockpit and\
back towards the passenger compartment.\
", 
         Name = "Entrance", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32101, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32103, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32102, 
      }, 
      [32103] = 
      {
         Flags = 
         {
            [26] = "Factory", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The passenger lounge was designed to be quite comfortable for human\
passengers. A dark rich carpet covers the entire floor. The chairs\
flank small tables that are spread along the walls of the\
compartment. Adjustable glow panels are strategicly positioned by\
each table providing directional light for reading and working or a\
more difused light for social rides. \
", 
         Name = "Passenger lounge", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32102, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32103, 
      }, 
      [32104] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 1, 
         Sector = "city", 
         Description = "The snub fighter or X-wing is the main starfighter used by the Rebel\
Alliance. They are short ships measuring 12.5 meters from head to\
tail. The X-Wing's main recognizing feature is their wing assembly.\
The layered wings, or S-Foil split apart during combat to give its\
four wingtip mounted guns the best firing configuration. During\
atmospheric and hyperspace flight they are flattened together giving\
the X-wing a more streamlined form.\
", 
         Name = "Inside an X-wing Cockpit", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32104, 
      }, 
      [32105] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The assault shuttle is designed to carry stormtroopers and zero-g\
stormtroopers rather than small groups of passengers. Because of this\
it is designed more for combat and durability than the lambda class\
shuttles. The cockpit is spacious and contains seating for 5\
crewmembers including a senoir officer, two pilots, a navigator, and\
a gunner. \
", 
         Name = "Cockpit", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32106, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32105, 
      }, 
      [32106] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The entrance ramp of the assault shuttle lowers to the side of the\
ship allowing several troopers to exit at once. On the other side of\
the ramp an airlock alows troopers to exit into harmfull atmospheres\
as well as into space. The cockpit of the shuttle is to the north and\
trooper bay to the south. A ladder leads up to a laser turret.\
", 
         Name = "Entrance Foyer", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32105, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32108, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32107, 
               Direction = "up", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32106, 
      }, 
      [32107] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 1, 
         Sector = "city", 
         Description = "This roof mounted turret along with the ships main lasers allow the\
assault shuttle to fire in almost any direction. The gunners chair is\
gyroscopically mounted to swivel freely with the cannons enabling the\
gunner to follow moving targets easily.\
", 
         Name = "Laser Turret", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32106, 
               Direction = "down", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32107, 
      }, 
      [32108] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "Rather than a the passenger hold standard to most shuttlecraft the\
assault shuttle houses a large bay for zero-g stormtroopers to\
prepair for battle. There are a several rows of chairs for regular\
troopers and unsuited space troopers along one wall. The other side\
of the hold contains restraint harnesses for suited zero-g\
stormtroopers. Large storage lockers fill the back of the room.\
", 
         Name = "Spacetrooper Hold", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32106, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32108, 
      }, 
      [32109] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "You are in the cockpit of a standard Lambda-class shuttle. It is a\
popular lightly armed shuttle used by the Empire for transporting\
small groups of people. The cockpit is equipped with chairs for both\
a pilot and a co-pilot. There is room enough behind the chairs for a\
few passengers or a flight officer who might wish to oversee the flight\
operation, however most of the passenger seating is towards the back of\
the spacecraft.\
", 
         Name = "Cockpit", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32110, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32109, 
      }, 
      [32110] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The entrance ramp is located just behind the cockpit of the shuttle\
and extends down underneath it when open. This almost gives the\
apearance of the shuttle opening its 'mouth' to let out passengers.\
The ramp is covered in a dark carpet suitable for formal apearances.\
A hallway extends around the ramp heading up towards the cockpit and\
back towards the passenger compartment.\
", 
         Name = "Entrance Ramp", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32109, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32111, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32110, 
      }, 
      [32111] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [26] = "Factory", 
            [23] = "Hotel", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The passenger lounge was designed to be quite comfortable for human\
passengers. A dark rich carpet covers the entire floor. The chairs\
flank small tables that are spread along the walls of the\
compartment. Adjustable glow panels are strategicly positioned by\
each table providing directional light for reading and working or a\
more difused light for social rides.  \
", 
         Name = "Passenger Lounge", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32110, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32111, 
      }, 
      [32112] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 2, 
         Sector = "city", 
         Description = "You are surrounded by the antiquated instruments and control panels of\
a Y-Wing snub fighter.  For the most part, the cockpit is servicable,\
panel, and an instrument glowlight that doesn't work anymore.  The\
well-worn flight seat is a welcome comfort though: compared to newer\
ship's firm, uncomfortable ones, it has obviously been worn down to a\
comfortable level by use over hundreds of flight hours. Your external\
view is partially blocked by the classic durasteel reinforcement\
struts lining the sides of the front plastisteel view plate.  This\
flaw, which has been remedied in newer ships, is one of the main\
reasons the Y-Wing never became a popular snub fighter and was often\
used as a bomber instead.\
", 
         Name = "Inside a Y-Wing's Cockpit", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32112, 
      }, 
      [32113] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 1, 
         Sector = "city", 
         Description = "The command pod of the B-wing starfighter is roomy and provides a very\
comfortable ride. It is suspended by a gyroscopically stabalized\
suspension system alowinng it to remain stable while the airfoil\
rotates around it. The main airfoil of the ship stretches out in one\
direction from the command pod. Two movable secondary airfoils cross\
the main one halfway down during combat and tuck in along the length\
during regular flight. Although the B-wing is one of the slower\
starfighters still used it makes up in firepower and durability what\
it lacks in thrust.The B-wing is one of the most durable and heavily\
armed Rebel Alliance starfighters.\
", 
         Name = "Inside a Rebel Alliance B-Wing Starfighter", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32113, 
      }, 
      [32114] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 1, 
         Sector = "city", 
         Description = "The cramped cockpit of this A-Wing fighter doesn't seem so\
uncomfortable when you realize that the space taken away from the\
pilot's area has been used to afford faster engines and stronger\
shields. The instruments available to you tell that this craft's \
maximum velocity is well above many of the other ships you have\
piloted. A ship this powerful it almost seems rediculous to get in\
with a ladder. \
", 
         Name = "Inside an A-Wing Starfighter", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32114, 
      }, 
      [32115] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "You sit in one of the now rare Sienar Technologies Twin Ion Engine\
starfighters. During the height of the Emporer's reign when there was\
money and pilots to throw away on cheap mass-produced starfighters\
these ships built in surplus. Now they they have been almost all\
replaced by the longer lasting, shielded TIE Advanced starfighters.\
The cockpit is cramped with many controlls and the view window only\
faces forward giving the pilot a very restricted field of view.  Even\
if you could see out the sides of the cockpit however your view would\
still be blocked by the two hexagonal solar-panels mounted on the\
sides of TIE fighters, giving them their very unique look.\
 \
&rThis ship is NOT upgradeable&R&w\
", 
         Name = "Inside an Imperial TIE Fighter", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32115, 
      }, 
      [32116] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The TIE Interceptor was an early improvement over the original TIE\
Fighter. It was faster more manueverable and had greater firepower\
than its predecessor. It was still however lacking in shields and\
thus dangerous to fly for the unskilled. TIE Interceptors are easy to\
spot among regular TIEs due to their bent wing shape.\
", 
         Name = "Inside A TIE Interceptor", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32116, 
      }, 
      [32117] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "Although slower and less manuevaerable than the TIE fighter it carries\
quite an offensive arsonel. As they  can carry many missiles and\
bombs a group of them could provide a serious threat to a capital\
ship or space station. They are however pretty useless in dog fights.\
The TIE Bomber is easily distinguishable from the TIE Fighters due to\
its twin pods and bent / stretched solar panels.\
", 
         Name = "The Cockpit of a TIE Bomber", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32117, 
      }, 
      [32118] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The TIE Advanced starfighter is similar to the TIE Interceptor in many\
aspects. It is slightly large and faster and provides more manueverbility\
than the older TIE models, and allows easier customization. This\
particular TIE Advanced was once modified for atmospheric combat, and\
features high-sensitivity solar panels on each wing. It's apparent this\
TIE Advanced has been modified greatly, with aftermarket non-standard\
Imperial issue electronics and targetting capabilities.\
", 
         Name = "Inside a TIE Advanced Starfighter", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32118, 
      }, 
      [32119] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "Of the all the Sienar Systems TIE starcraft the TIE Defender is the\
most unique and the most technologicly superior. The TIE Defender has\
three sets of solar panals encircling it at equal distances from the\
cockpit. Its cockpit extends forward more than the other TIE models\
and provides superior visability due to the almost complete ring of\
transparasteel around the top and sides of the pilot. The TIE\
defender is equiped with shields, a hyperdrive, and a full array of\
weaponry making it a very dangerous opponent.\
", 
         Name = "The Cockpit of Imperial TIE Defender TF-0001", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32119, 
      }, 
      [32120] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 2, 
         Sector = "city", 
         Description = "The Cygnus Spaceworks XG-1 Star Wing or Assault Gunboat, was the first\
imperial starfighter to carry shields. It is a powerful and versatile\
attack vessel and is a favourite of many pilots in the imperial navy.\
It is equiped with a hyperdrive and a large payload of concussion\
missions making it a good choice for extended missions. \
", 
         Name = "Inside an Assault Gunboat", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32120, 
      }, 
      [32121] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 2, 
         Sector = "city", 
         Description = "The Cygnus Spaceworks XM-1 Missile Boat is an improved version of\
their earlier XG-1 Starwing. It is faster and more manueverable and\
has slightly stronger shielding. In an effort to conserve space and\
cost it is only equiped however with a single laser cannon making it\
more useful for bombing runs. It is still however one of the best all\
around starfighters on the market today.\
", 
         Name = "The Cockpit of an Imperial Missile Boat", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32122, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32121, 
      }, 
      [32122] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 1, 
         Sector = "city", 
         Description = "The Cygnus Spaceworks XM-1 Missile Boat is an improved version of their\
earlier XG-1 Starwing. It is faster and more manueverable and has slightly\
stronger shielding. In an effort to conserve space and cost it is only\
equiped however with a single laser cannon making it more useful for\
bombing runs. It is still however one of the best all around starfighters\
on the market today. \
", 
         Name = "Gunners Seat", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32121, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32122, 
      }, 
      [32123] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "The Cockpit", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32124, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32123, 
      }, 
      [32124] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Entrance Ramp", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32123, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32126, 
               Direction = "east", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32128, 
               Direction = "northeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               DestinationVnum = 32125, 
               Direction = "southeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32124, 
      }, 
      [32125] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Engine Room", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32126, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32127, 
               Direction = "northeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32124, 
               Direction = "northwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32125, 
      }, 
      [32126] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Main Cabin", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32128, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32127, 
               Direction = "east", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32125, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               DestinationVnum = 32124, 
               Direction = "west", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [5] = 
            {
               DestinationVnum = 32129, 
               Direction = "down", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32126, 
      }, 
      [32127] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Second Cargo Hold", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32126, 
               Direction = "west", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32128, 
               Direction = "northwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32125, 
               Direction = "southwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32127, 
      }, 
      [32128] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Front Cargo Hold", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32126, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32127, 
               Direction = "southeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32124, 
               Direction = "southwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32128, 
      }, 
      [32129] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Belly Gun", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32126, 
               Direction = "up", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32129, 
      }, 
      [32130] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Floating in a void", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32130, 
      }, 
      [32131] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Floating in a void", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32131, 
      }, 
      [32132] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Floating in a void", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32132, 
      }, 
      [32133] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Floating in a void", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32133, 
      }, 
      [32134] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Floating in a void", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32134, 
      }, 
      [32135] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Floating in a void", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32135, 
      }, 
      [32136] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Floating in a void", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32136, 
      }, 
      [32137] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Floating in a void", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32137, 
      }, 
      [32138] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Floating in a void", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32138, 
      }, 
      [32139] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Floating in a void", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32139, 
      }, 
      [32140] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "This is the cockpit of the shuttle buss that flys from planet to planet.\
Its flight path is hard coded.\
Attempting to fly it manually could result in bad things happening.\
", 
         Name = "&RDO NOT FLY THIS SHIP", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32140, 
      }, 
      [32141] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "This is the main lounge of the Serin Pluogus and is quite large. The\
large central hallway is flanked by couches and chairs of various\
dimensions in an attempt to accomodate passengers of all shapes\
and sizes. Some are even designed to be adjustable although only\
manually. There apears to be no automatic form-chairs at least in\
this room. There is a large lift leading down to the main exit ramp\
as well as a smaller one leading upstairs. A mail terminal is\
installed here as well.\
", 
         Name = "The Front Lounge", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32142, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32144, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32146, 
               Direction = "up", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               DestinationVnum = 32149, 
               Direction = "down", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32141, 
      }, 
      [32142] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "This large room is a smorgasboard of displays. Most of them seem to\
contain useless junk but a few items might be usefull to you. A small\
cash counter is in one corner of the room but it is rarely used as a\
retail service droid handles most transactions directly. There are\
several vending machines along one wall offering many different\
varieties of packaged food and drink.  There are however only a\
couple of tables in this part of ship to sit down and eat.\
", 
         Name = "Gift Shop and Snack Bar", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32143, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32141, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32142, 
      }, 
      [32143] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "Welcome to the hub of pluogus activity. This room seems to always be\
busy. THe main bar stretches across the back wall. A humaniod bar\
keeper moves quickly from customer to customer with the efficiency\
that only comes with years of experience. Behind him are shelves of\
bottles in every conceivable shape color and size. Enough to keep\
anyone busy for a very long voyage. The front of the bar is devoid of\
chairs. But the rest of the room is quite full of them. In fact, the\
ship designers seem to have given up the wide hallway aproach seen in\
the rest of the vessle in favor of trying to cram in as many booths\
as possible into this part of the ship.   Because of this a smaller\
bar is installed next to the door offering a minimal selection of\
drinks for those who don't wish to fight their way to the back.\
", 
         Name = "The Bar", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32142, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32143, 
      }, 
      [32144] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "This room consists mostly of a large wide corridor that stretches from\
the front lounge to a set of doors at the rear of the room.  The\
corridor is flanked on each side by large cusions separated by thin\
tables. Each table has a set of controlls for adjusting the height of\
the table. This compartment was obviously made to accomedate some of\
the larger passengers who would find it difficult to manuever around\
other parts of the ship. There are no windows but small ceiling\
mounted viewscreens can either be tuned to the ship mounted cameras\
or to one of several galactic network channels.   A passenger\
terminal is installed on one of the walls here for you to leave\
comments to the management or leave general posts for the other\
passengers. To the south a set of large doors leads to the ships\
bathroom facilities. \
", 
         Name = "The Rear Lounge", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32141, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32145, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32174, 
               Direction = "down", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               DestinationVnum = 32177, 
               Direction = "southeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
            }, 
            [5] = 
            {
               DestinationVnum = 32176, 
               Direction = "southwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32144, 
      }, 
      [32145] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "You notice a strong antiseptic smell as you walk into this room. The\
floor is smooth and has been recently cleaned and polished.  Th wall\
opposite the entrance is furnished with several stalls of various\
shapes and sizes. Each of them is an attempt to provide a comfortable\
toilet for each of the more common travelling galactic races. Looking\
from stall to stall you might find it amusing to see what some\
species call toilets. On the door side of the room stretches a large\
counter top from wall to wall. It is fitted with several sinks, spray\
hoses and other disinfectant and deionizing devices. At the farthest\
end of the room between the stalls and sinks are two large waste\
disposal units. One is an incineration device for solids and the\
other a disposable tank for combustable liquids such as the grease\
used by some older model droids. \
", 
         Name = "The Rest Room", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32144, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32145, 
      }, 
      [32146] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The upper lounge is designed somewhat differently than the lower ones.\
It drifts away from the wide hallway aproach to resemble more of a\
corellian club. The couches and chairs are spread throughout the room\
in an almost random fashion, each of them centerd around one of many\
low tables. The furniture all apears quite comfortable and obviously\
are designed for humaniod forms. The lighting is relatively dim but\
directional lights by each table can be brightened to suit each\
passengers tastes. To the north a gimps of the stars can be seen\
through the observation lounge. To the south is the sleeping\
compartments. A turbolift leads down to the main deck.\
", 
         Name = "The Upper Lounge", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32147, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32148, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32141, 
               Direction = "down", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               DestinationVnum = 32179, 
               Direction = "somewhere", 
               Description = "", 
               Key = -1, 
               Keyword = "lost and found box", 
               Flags = 
               {
                  [17] = "CanEnter", 
                  [11] = "Hidden", 
               }, 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32146, 
      }, 
      [32147] = 
      {
         Flags = 
         {
            [8] = "Bank", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "Except for the floor and south wall this room is surrounded by\
transparent duraplast giving you an excelent view of the stars around\
you. The floor is bare except for a round island in the middle that\
is encircled by a long cushioned bench. The only artificial lighting\
in the room comes from a few small glow rods situated around the\
island and two by the doors on the south wall. The rest of the room\
is lit only by the scene outside of the spacecraft.\
", 
         Name = "The Observation Lounge", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32146, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32147, 
      }, 
      [32148] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "You are in the bed chambers of the public tour bus the Serin Pluogus.\
In an attempt to promote galactic trade and tourism, several large\
corperations and planets teamed together to fund this completely free\
tour bus. This room was a late add on to the Pluogus for those\
passengers wishing for private sleeping quarters on long tours. The\
large room   is sectioned off into enclosed bunks stacked along the\
walls. There are several different sized chambers but most of them\
seem designed to fit one or two humans comfortably. All the beds have\
a somewhat soundproof door and are lockable from the inside.     \
 \
This would be a good place to rest for awhile. You may safely\
leave and re-enter the game from here.\
 \
", 
         Name = "The Sleeping Compartment", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32146, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "?", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32150, 
               Direction = "somewhere", 
               Description = "The bacta tank\
", 
               Key = 0, 
               Keyword = "bacta", 
               Flags = 
               {
                  [17] = "CanEnter", 
                  [11] = "Hidden", 
               }, 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32148, 
      }, 
      [32149] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "This room is the main entrance and exit from the Serin Pluogus. It\
consists of two airlocks and a large hydrollic belly ramp that lowers\
down out of the ship when docked. A large turbo-lift leads up to the\
rest of the ship from here.\
 \
&WBefore leaving make sure to explore the ship in full ... theres a\
small newbie area on board to help you get started.&w\
&w\
To leave the ship just type LEAVE.\
To get back on after type BOARD PLUOGUS.\
For Schedule information type PLUOGUS.\
", 
         Name = "The Exit Ramp", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32296, 
               Direction = "east", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32141, 
               Direction = "up", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32149, 
      }, 
      [32150] = 
      {
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpechoat $n The healing warmth of the bacta spreads over your body.\
feel heal $n\
", 
               MudProgType = "rand_prog", 
               Arguments = "100", 
            }, 
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 1, 
         Sector = "city", 
         Description = "You are floating in a tank of gelatinous red liquid.  A small air hose is\
attached to the wall, and a mask is available for you to breath through.\
There is not much to do here but rest and heal.  When you are done\
healing, type LEAVE and let someone else have a turn.\
", 
         Name = "Inside the Bacta Tank", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32148, 
               Direction = "somewhere", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [11] = "Hidden", 
               }, 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32150, 
      }, 
      [32151] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 1, 
         Sector = "city", 
         Description = "The snub fighter or X-wing is the main starfighter used by the Rebel\
Alliance. They are short ships measuring 12.5 meters from head to\
tail. The X-Wing's main recognizing feature is their wing assembly.\
The layered wings, or S-Foil split apart during combat to give its\
four wingtip mounted guns the best firing configuration. During\
atmospheric and hyperspace flight they are flattened together giving\
the X-wing a more streamlined form. \
", 
         Name = "X-Wing xw02", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32151, 
      }, 
      [32152] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 1, 
         Sector = "city", 
         Description = "The sorosuub system hopper is a small shuttle designed for short voyages.\
It is equiped with a hyperdrive but long journeys could get tiresome in\
such a confined space. The hoppers only defence is some weak shielding\
suitable for protection against small bits of debris but pretty much\
useless in combat.\
", 
         Name = "Sorosuub System Hopper", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32152, 
      }, 
      [32153] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 1, 
         Sector = "city", 
         Description = "The sorosuub system hopper is a small shuttle designed for short voyages.\
It is equiped with a hyperdrive but long journeys could get tiresome in\
such a confined space. The hoppers only defence is some weak shielding\
suitable for protection against small bits of debris but pretty much\
useless in combat.\
", 
         Name = "Sorosuub System Hopper", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32153, 
      }, 
      [32154] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 1, 
         Sector = "city", 
         Description = "The sorosuub system hopper is a small shuttle designed for short voyages.\
It is equiped with a hyperdrive but long journeys could get tiresome in\
such a confined space. The hoppers only defence is some weak shielding\
suitable for protection against small bits of debris but pretty much\
useless in combat.\
", 
         Name = "Sorosuub System Hopper", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32154, 
      }, 
      [32155] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 1, 
         Sector = "city", 
         Description = "The sorosuub system hopper is a small shuttle designed for short voyages.\
It is equiped with a hyperdrive but long journeys could get tiresome in\
such a confined space. The hoppers only defence is some weak shielding\
suitable for protection against small bits of debris but pretty much\
useless in combat.\
", 
         Name = "Sorosuub System Hopper", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32155, 
      }, 
      [32156] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 1, 
         Sector = "city", 
         Description = "The sorosuub system hopper is a small shuttle designed for short voyages.\
It is equiped with a hyperdrive but long journeys could get tiresome in\
such a confined space. The hoppers only defence is some weak shielding\
suitable for protection against small bits of debris but pretty much\
useless in combat.\
", 
         Name = "Sorosuub System Hopper", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32156, 
      }, 
      [32157] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 1, 
         Sector = "city", 
         Description = "The sorosuub system hopper is a small shuttle designed for short voyages.\
It is equiped with a hyperdrive but long journeys could get tiresome in\
such a confined space. The hoppers only defence is some weak shielding\
suitable for protection against small bits of debris but pretty much\
useless in combat.\
", 
         Name = "Sorosuub System Hopper", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32157, 
      }, 
      [32158] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 1, 
         Sector = "city", 
         Description = "The sorosuub system hopper is a small shuttle designed for short voyages.\
It is equiped with a hyperdrive but long journeys could get tiresome in\
such a confined space. The hoppers only defence is some weak shielding\
suitable for protection against small bits of debris but pretty much\
useless in combat.\
", 
         Name = "Sorosuub System Hopper", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32158, 
      }, 
      [32159] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 1, 
         Sector = "city", 
         Description = "The sorosuub system hopper is a small shuttle designed for short voyages.\
It is equiped with a hyperdrive but long journeys could get tiresome in\
such a confined space. The hoppers only defence is some weak shielding\
suitable for protection against small bits of debris but pretty much\
useless in combat.\
", 
         Name = "Sorosuub System Hopper", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32159, 
      }, 
      [32160] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 1, 
         Sector = "city", 
         Description = "The sorosuub system hopper is a small shuttle designed for short voyages.\
It is equiped with a hyperdrive but long journeys could get tiresome in\
such a confined space. The hoppers only defence is some weak shielding\
suitable for protection against small bits of debris but pretty much\
useless in combat.\
", 
         Name = "Sorosuub System Hopper", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32160, 
      }, 
      [32161] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 1, 
         Sector = "city", 
         Description = "The sorosuub system hopper is a small shuttle designed for short voyages.\
It is equiped with a hyperdrive but long journeys could get tiresome in\
such a confined space. The hoppers only defence is some weak shielding\
suitable for protection against small bits of debris but pretty much\
useless in combat.\
", 
         Name = "Sorosuub System Hopper", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32161, 
      }, 
      [32162] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 1, 
         Sector = "city", 
         Description = "The sorosuub system hopper is a small shuttle designed for short voyages.\
It is equiped with a hyperdrive but long journeys could get tiresome in\
such a confined space. The hoppers only defence is some weak shielding\
suitable for protection against small bits of debris but pretty much\
useless in combat.\
", 
         Name = "Sorosuub System Hopper", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32162, 
      }, 
      [32163] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 1, 
         Sector = "city", 
         Description = "The sorosuub system hopper is a small shuttle designed for short voyages.\
It is equiped with a hyperdrive but long journeys could get tiresome in\
such a confined space. The hoppers only defence is some weak shielding\
suitable for protection against small bits of debris but pretty much\
useless in combat.\
", 
         Name = "Sorosuub System Hopper", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32163, 
      }, 
      [32164] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 1, 
         Sector = "city", 
         Description = "The sorosuub system hopper is a small shuttle designed for short voyages.\
It is equiped with a hyperdrive but long journeys could get tiresome in\
such a confined space. The hoppers only defence is some weak shielding\
suitable for protection against small bits of debris but pretty much\
useless in combat.\
", 
         Name = "Sorosuub System Hopper", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32164, 
      }, 
      [32165] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 2, 
         Sector = "city", 
         Description = "The sorosuub system hopper is a small shuttle designed for short voyages.\
It is equiped with a hyperdrive but long journeys could get tiresome in\
such a confined space. The hoppers only defence is some weak shielding\
suitable for protection against small bits of debris but pretty much\
useless in combat.\
", 
         Name = "Sorosuub System Hopper", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32165, 
      }, 
      [32166] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 1, 
         Sector = "city", 
         Description = "The sorosuub system hopper is a small shuttle designed for short voyages.\
It is equiped with a hyperdrive but long journeys could get tiresome in\
such a confined space. The hoppers only defence is some weak shielding\
suitable for protection against small bits of debris but pretty much\
useless in combat.\
", 
         Name = "Sorosuub System Hopper", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32166, 
      }, 
      [32167] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 1, 
         Sector = "city", 
         Description = "The sorosuub system hopper is a small shuttle designed for short voyages.\
It is equiped with a hyperdrive but long journeys could get tiresome in\
such a confined space. The hoppers only defence is some weak shielding\
suitable for protection against small bits of debris but pretty much\
useless in combat.\
", 
         Name = "Sorosuub System Hopper", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32167, 
      }, 
      [32168] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 1, 
         Sector = "city", 
         Description = "The sorosuub system hopper is a small shuttle designed for short voyages.\
It is equiped with a hyperdrive but long journeys could get tiresome in\
such a confined space. The hoppers only defence is some weak shielding\
suitable for protection against small bits of debris but pretty much\
useless in combat.\
", 
         Name = "Sorosuub System Hopper", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32168, 
      }, 
      [32169] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 1, 
         Sector = "city", 
         Description = "The sorosuub system hopper is a small shuttle designed for short voyages.\
It is equiped with a hyperdrive but long journeys could get tiresome in\
such a confined space. The hoppers only defence is some weak shielding\
suitable for protection against small bits of debris but pretty much\
useless in combat.\
", 
         Name = "Sorosuub System Hopper", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32169, 
      }, 
      [32170] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 1, 
         Sector = "city", 
         Description = "The sorosuub system hopper is a small shuttle designed for short voyages.\
It is equiped with a hyperdrive but long journeys could get tiresome in\
such a confined space. The hoppers only defence is some weak shielding\
suitable for protection against small bits of debris but pretty much\
useless in combat.\
", 
         Name = "Sorosuub System Hopper", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32170, 
      }, 
      [32171] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 1, 
         Sector = "city", 
         Description = "The command pod of the B-wing starfighter is roomy and provides a very\
comfortable ride. It is suspended by a gyroscopically stabalized\
suspension system alowinng it to remain stable while the airfoil\
rotates around it. The main airfoil of the ship stretches out in one\
direction from the command pod. Two movable secondary airfoils cross\
the main one halfway down during combat and tuck in along the length\
during regular flight. Although the B-wing is one of the slower\
starfighters still used it makes up in firepower and durability what\
it lacks in thrust.The B-wing is one of the most durable and heavily\
armed Rebel Alliance starfighters.\
", 
         Name = "B-Wing Starfighter bw08", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32171, 
      }, 
      [32172] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 1, 
         Sector = "city", 
         Description = "The snub fighter or X-wing is the main fighter utilised by the Rebel\
Alliance. This particular model bears the insignia of &RRogue Squadron&w.\
The main recognizable feature of the Z-wing is the wing assembly, which\
split apart during combat to give the best firing configuration. The\
Wings flatten during hyperspace creating a more streamlined form.\
", 
         Name = "Rogue One Cockpit", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32172, 
      }, 
      [32173] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 1, 
         Sector = "city", 
         Description = "The command pod of the B-wing starfighter is roomy and provides a very\
comfortable ride. It is suspended by a gyroscopically stabalized\
suspension system alowinng it to remain stable while the airfoil\
rotates around it. The main airfoil of the ship stretches out in one\
direction from the command pod. Two movable secondary airfoils cross\
the main one halfway down during combat and tuck in along the length\
during regular flight. Although the B-wing is one of the slower\
starfighters still used it makes up in firepower and durability what\
it lacks in thrust.The B-wing is one of the most durable and heavily\
armed Rebel Alliance starfighters.\
", 
         Name = "B-Wing Starfighter bw10", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32173, 
      }, 
      [32174] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "This room is a programmable interactive holoshow. It is currently set\
up as a combat simulator although it can run several different\
programs. The sound from the rest of the ship is cut off by the use\
of a sound shield giving the holoshow a very realistic feel.\
", 
         Name = "The Holochamber", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32175, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32144, 
               Direction = "up", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32174, 
      }, 
      [32175] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "This room is a programmable interactive holoshow. It is currently set\
up as a combat simulator although it can run several different\
programs. The sound from the rest of the ship is cut off by the use\
of a sound shield giving the holoshow a very realistic feel.\
", 
         Name = "Back of the Holochamber", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32174, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32175, 
      }, 
      [32176] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The cargo holds on the Serin Pluogus are relatively narrow. The run\
lengthwise on either side of the main level towards the back of the\
ship. There are several sealed chests as well as a few crates, some\
parcels an alot of luggage. Because of the close proximity to the\
engine room the noise and vibrations drown out the sounds and\
electronic voice thats heard throughout the rest of the ship.\
", 
         Name = "A Cargo Hold", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32144, 
               Direction = "northeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32178, 
               Direction = "southeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32176, 
      }, 
      [32177] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The cargo holds on the Serin Pluogus are relatively narrow. The run\
lengthwise on either side of the main level towards the back of the\
ship. There are several sealed chests as well as a few crates, some\
parcels an alot of luggage. Because of the close proximity to the\
engine room the noise and vibrations drown out the sounds and\
electronic voice thats heard throughout the rest of the ship.\
", 
         Name = "A Cargo Hold", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32144, 
               Direction = "northwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32178, 
               Direction = "southwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32177, 
      }, 
      [32178] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The Serin Pluogus engine room is small and relatively simple. Most of\
the accessible engine parts are concealed behind removable pannels.\
There is a large computer terminal on one wall with many controls and\
gages for monitoring the ships engines. It is also equiped with a\
couple of standard interface sockets for droids. This room is\
extreemly noisy being right beside the engine which seems to rattle\
excessively.\
", 
         Name = "Serin Pluogus Engine Room", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32177, 
               Direction = "northeast", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32176, 
               Direction = "northwest", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32178, 
      }, 
      [32179] = 
      {
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
            [29] = "Spacecraft", 
            [14] = "Donation", 
            [19] = "ClanStoreroom", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The lost and found box seems bigger inside than on the outside. It also\
appears than anything here is available for the taking. Just make sure you\
leave anything extra you might find here as well.\
", 
         Name = "Inside the Lost and Found", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32146, 
               Direction = "somewhere", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [11] = "Hidden", 
               }, 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32179, 
      }, 
      [32180] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 1, 
         Sector = "city", 
         Description = "The Z-95 headhunter is an older model starfighter but still used\
widely throughout the galaxy. The cramped cockpit is just big enough\
for one person. The canopy does open up nearly 180 degrees though,\
allowing for excellent visiblity, and probably is the only reason\
Z-95's are still used.    \
", 
         Name = "Z-95 Headhunter z95csa0", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32180, 
      }, 
      [32181] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 1, 
         Sector = "city", 
         Description = "The Z-95 headhunter is an older model starfighter but still used\
widely throughout the galaxy. The cramped cockpit is just big enough\
for one person. The canopy does open up nearly 180 degrees though,\
allowing for excellent visiblity, and probably is the only reason\
Z-95's are still used.    \
", 
         Name = "Z-95 Headhunter z95csa1", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32181, 
      }, 
      [32182] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 1, 
         Sector = "city", 
         Description = "The Z-95 headhunter is an older model starfighter but still used\
widely throughout the galaxy. The cramped cockpit is just big enough\
for one person. The canopy does open up nearly 180 degrees though,\
allowing for excellent visiblity, and probably is the only reason\
Z-95's are still used.    \
", 
         Name = "Z-95 Headhunter z95csa2", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32182, 
      }, 
      [32183] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 1, 
         Sector = "city", 
         Description = "The Z-95 headhunter is an older model starfighter but still used\
widely throughout the galaxy. The cramped cockpit is just big enough\
for one person. The canopy does open up nearly 180 degrees though,\
allowing for excellent visiblity, and probably is the only reason\
Z-95's are still used.    \
", 
         Name = "Z-95 Headhunter z95csa3", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32183, 
      }, 
      [32184] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 1, 
         Sector = "city", 
         Description = "The Z-95 headhunter is an older model starfighter but still used\
widely throughout the galaxy. The cramped cockpit is just big enough\
for one person. The canopy does open up nearly 180 degrees though,\
allowing for excellent visiblity, and probably is the only reason\
Z-95's are still used.    \
", 
         Name = "Z-95 Headhunter z95csa4", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32184, 
      }, 
      [32185] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 1, 
         Sector = "city", 
         Description = "The Z-95 headhunter is an older model starfighter but still used\
widely throughout the galaxy. The cramped cockpit is just big enough\
for one person. The canopy does open up nearly 180 degrees though,\
allowing for excellent visiblity, and probably is the only reason\
Z-95's are still used.    \
", 
         Name = "Z-95 Headhunter z95csa5", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32185, 
      }, 
      [32186] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 1, 
         Sector = "city", 
         Description = "The Z-95 headhunter is an older model starfighter but still used\
widely throughout the galaxy. The cramped cockpit is just big enough\
for one person. The canopy does open up nearly 180 degrees though,\
allowing for excellent visiblity, and probably is the only reason\
Z-95's are still used.    \
", 
         Name = "Z-95 Headhunter z95csa6", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32186, 
      }, 
      [32187] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 1, 
         Sector = "city", 
         Description = "The Z-95 headhunter is an older model starfighter but still used\
widely throughout the galaxy. The cramped cockpit is just big enough\
for one person. The canopy does open up nearly 180 degrees though,\
allowing for excellent visiblity, and probably is the only reason\
Z-95's are still used.    \
", 
         Name = "Z-95 Headhunter z95csa7", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32187, 
      }, 
      [32188] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 1, 
         Sector = "city", 
         Description = "The Z-95 headhunter is an older model starfighter but still used\
widely throughout the galaxy. The cramped cockpit is just big enough\
for one person. The canopy does open up nearly 180 degrees though,\
allowing for excellent visiblity, and probably is the only reason\
Z-95's are still used.    \
", 
         Name = "Z-95 Headhunter z95csa8", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32188, 
      }, 
      [32189] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 1, 
         Sector = "city", 
         Description = "The Z-95 headhunter is an older model starfighter but still used\
widely throughout the galaxy. The cramped cockpit is just big enough\
for one person. The canopy does open up nearly 180 degrees though,\
allowing for excellent visiblity, and probably is the only reason\
Z-95's are still used.    \
", 
         Name = "Z-95 Headhunter z95csa9", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32189, 
      }, 
      [32190] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 2, 
         Sector = "city", 
         Description = "The Hoersh-Kessel Drive Co. R-41 Starchaser is in use mostly by small\
governments as well as pirates and smugglers as they are easy and\
relatively inexpensive to maintain. In heavy combat they are however\
at a bit of a disadvantage although a good pilot could still come out\
on top. They also have the advantage of a roomy cockpit big enough\
for a copilot or passenger.\
", 
         Name = "R-41 Starchaser r41aa0", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32190, 
      }, 
      [32191] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 2, 
         Sector = "city", 
         Description = "The Hoersh-Kessel Drive Co. R-41 Starchaser is in use mostly by small\
governments as well as pirates and smugglers as they are easy and\
relatively inexpensive to maintain. In heavy combat they are however\
at a bit of a disadvantage although a good pilot could still come out\
on top. They also have the advantage of a roomy cockpit big enough\
for a copilot or passenger.\
", 
         Name = "R-41 Starchaser r41aa1", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32191, 
      }, 
      [32192] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 2, 
         Sector = "city", 
         Description = "The Hoersh-Kessel Drive Co. R-41 Starchaser is in use mostly by small\
governments as well as pirates and smugglers as they are easy and\
relatively inexpensive to maintain. In heavy combat they are however\
at a bit of a disadvantage although a good pilot could still come out\
on top. They also have the advantage of a roomy cockpit big enough\
for a copilot or passenger.\
", 
         Name = "R-41 Starchaser r41aa2", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32192, 
      }, 
      [32193] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 2, 
         Sector = "city", 
         Description = "The Hoersh-Kessel Drive Co. R-41 Starchaser is in use mostly by small\
governments as well as pirates and smugglers as they are easy and\
relatively inexpensive to maintain. In heavy combat they are however\
at a bit of a disadvantage although a good pilot could still come out\
on top. They also have the advantage of a roomy cockpit big enough\
for a copilot or passenger.\
", 
         Name = "R-41 Starchaser r41aa3", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32193, 
      }, 
      [32194] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 2, 
         Sector = "city", 
         Description = "The Hoersh-Kessel Drive Co. R-41 Starchaser is in use mostly by small\
governments as well as pirates and smugglers as they are easy and\
relatively inexpensive to maintain. In heavy combat they are however\
at a bit of a disadvantage although a good pilot could still come out\
on top. They also have the advantage of a roomy cockpit big enough\
for a copilot or passenger.\
", 
         Name = "R-41 Starchaser r41aa4", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32194, 
      }, 
      [32195] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 2, 
         Sector = "city", 
         Description = "The Hoersh-Kessel Drive Co. R-41 Starchaser is in use mostly by small\
governments as well as pirates and smugglers as they are easy and\
relatively inexpensive to maintain. In heavy combat they are however\
at a bit of a disadvantage although a good pilot could still come out\
on top. They also have the advantage of a roomy cockpit big enough\
for a copilot or passenger.\
", 
         Name = "R-41 Starchaser r41aa5", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32195, 
      }, 
      [32196] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 2, 
         Sector = "city", 
         Description = "The Hoersh-Kessel Drive Co. R-41 Starchaser is in use mostly by small\
governments as well as pirates and smugglers as they are easy and\
relatively inexpensive to maintain. In heavy combat they are however\
at a bit of a disadvantage although a good pilot could still come out\
on top. They also have the advantage of a roomy cockpit big enough\
for a copilot or passenger.\
", 
         Name = "R-41 Starchaser r41aa6", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32196, 
      }, 
      [32197] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 2, 
         Sector = "city", 
         Description = "The Hoersh-Kessel Drive Co. R-41 Starchaser is in use mostly by small\
governments as well as pirates and smugglers as they are easy and\
relatively inexpensive to maintain. In heavy combat they are however\
at a bit of a disadvantage although a good pilot could still come out\
on top. They also have the advantage of a roomy cockpit big enough\
for a copilot or passenger.\
", 
         Name = "R-41 Starchaser r41aa7", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32197, 
      }, 
      [32198] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 2, 
         Sector = "city", 
         Description = "The Hoersh-Kessel Drive Co. R-41 Starchaser is in use mostly by small\
governments as well as pirates and smugglers as they are easy and\
relatively inexpensive to maintain. In heavy combat they are however\
at a bit of a disadvantage although a good pilot could still come out\
on top. They also have the advantage of a roomy cockpit big enough\
for a copilot or passenger.\
", 
         Name = "R-41 Starchaser r41aa8", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32198, 
      }, 
      [32199] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 2, 
         Sector = "city", 
         Description = "The Hoersh-Kessel Drive Co. R-41 Starchaser is in use mostly by small\
governments as well as pirates and smugglers as they are easy and\
relatively inexpensive to maintain. In heavy combat they are however\
at a bit of a disadvantage although a good pilot could still come out\
on top. They also have the advantage of a roomy cockpit big enough\
for a copilot or passenger.\
", 
         Name = "R-41 Starchaser r41aa9", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32199, 
      }, 
      [32200] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 1, 
         Sector = "city", 
         Description = "The Hoersh-Kessel Drive, Incorperated, T-Wing Starfighter is an older\
vessel but still used widely. Its small size and quick speed make it\
a favourite among pirates. As it is relatively cheap compared to the\
newer starfighters it is also used alot in the outer rim territories\
and by poorer organizations. It weak shielding and limited fire-power\
make it a poor choice as a front line attack ship despite its speed\
advantage.\
", 
         Name = "T-Wing tw00", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32200, 
      }, 
      [32201] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 1, 
         Sector = "city", 
         Description = "The Hoersh-Kessel Drive, Incorperated, T-Wing Starfighter is an older\
vessel but still used widely. Its small size and quick speed make it\
a favourite among pirates. As it is relatively cheap compared to the\
newer starfighters it is also used alot in the outer rim territories\
and by poorer organizations. It weak shielding and limited fire-power\
make it a poor choice as a front line attack ship despite its speed\
advantage.\
", 
         Name = "T-Wing tw01", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32201, 
      }, 
      [32202] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 1, 
         Sector = "city", 
         Description = "The Hoersh-Kessel Drive, Incorperated, T-Wing Starfighter is an older\
vessel but still used widely. Its small size and quick speed make it\
a favourite among pirates. As it is relatively cheap compared to the\
newer starfighters it is also used alot in the outer rim territories\
and by poorer organizations. It weak shielding and limited fire-power\
make it a poor choice as a front line attack ship despite its speed\
advantage.\
", 
         Name = "T-Wing tw02", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32202, 
      }, 
      [32203] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 1, 
         Sector = "city", 
         Description = "The Hoersh-Kessel Drive, Incorperated, T-Wing Starfighter is an older\
vessel but still used widely. Its small size and quick speed make it\
a favourite among pirates. As it is relatively cheap compared to the\
newer starfighters it is also used alot in the outer rim territories\
and by poorer organizations. It weak shielding and limited fire-power\
make it a poor choice as a front line attack ship despite its speed\
advantage.\
", 
         Name = "T-Wing tw03", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32203, 
      }, 
      [32204] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 1, 
         Sector = "city", 
         Description = "The Hoersh-Kessel Drive, Incorperated, T-Wing Starfighter is an older\
vessel but still used widely. Its small size and quick speed make it\
a favourite among pirates. As it is relatively cheap compared to the\
newer starfighters it is also used alot in the outer rim territories\
and by poorer organizations. It weak shielding and limited fire-power\
make it a poor choice as a front line attack ship despite its speed\
advantage.\
", 
         Name = "T-Wing tw04", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32204, 
      }, 
      [32205] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 1, 
         Sector = "city", 
         Description = "The Hoersh-Kessel Drive, Incorperated, T-Wing Starfighter is an older\
vessel but still used widely. Its small size and quick speed make it\
a favourite among pirates. As it is relatively cheap compared to the\
newer starfighters it is also used alot in the outer rim territories\
and by poorer organizations. It weak shielding and limited fire-power\
make it a poor choice as a front line attack ship despite its speed\
advantage.\
", 
         Name = "T-Wing tw05", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32205, 
      }, 
      [32206] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 1, 
         Sector = "city", 
         Description = "The Hoersh-Kessel Drive, Incorperated, T-Wing Starfighter is an older\
vessel but still used widely. Its small size and quick speed make it\
a favourite among pirates. As it is relatively cheap compared to the\
newer starfighters it is also used alot in the outer rim territories\
and by poorer organizations. It weak shielding and limited fire-power\
make it a poor choice as a front line attack ship despite its speed\
advantage.\
", 
         Name = "T-Wing tw06", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32206, 
      }, 
      [32207] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 1, 
         Sector = "city", 
         Description = "The Hoersh-Kessel Drive, Incorperated, T-Wing Starfighter is an older\
vessel but still used widely. Its small size and quick speed make it\
a favourite among pirates. As it is relatively cheap compared to the\
newer starfighters it is also used alot in the outer rim territories\
and by poorer organizations. It weak shielding and limited fire-power\
make it a poor choice as a front line attack ship despite its speed\
advantage.\
", 
         Name = "T-Wing tw07", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32207, 
      }, 
      [32208] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 1, 
         Sector = "city", 
         Description = "The Hoersh-Kessel Drive, Incorperated, T-Wing Starfighter is an older\
vessel but still used widely. Its small size and quick speed make it\
a favourite among pirates. As it is relatively cheap compared to the\
newer starfighters it is also used alot in the outer rim territories\
and by poorer organizations. It weak shielding and limited fire-power\
make it a poor choice as a front line attack ship despite its speed\
advantage.\
", 
         Name = "T-Wing tw08", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32208, 
      }, 
      [32209] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 1, 
         Sector = "city", 
         Description = "The Hoersh-Kessel Drive, Incorperated, T-Wing Starfighter is an older\
vessel but still used widely. Its small size and quick speed make it\
a favourite among pirates. As it is relatively cheap compared to the\
newer starfighters it is also used alot in the outer rim territories\
and by poorer organizations. It weak shielding and limited fire-power\
make it a poor choice as a front line attack ship despite its speed\
advantage.\
", 
         Name = "T-Wing tw09", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32209, 
      }, 
      [32210] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "You are in the cockpit of a standard Lambda-class shuttle. It is a\
popular lightly armed shuttle used by the Empire for transporting\
small groups of people. The cockpit is equipped with chairs for both\
a pilot and a co-pilot. There is room enough behind the chairs for a\
few passengers or a flight officer who might wish to oversee the flight\
operation, however most of the passenger seating is towards the back of\
the spacecraft.\
", 
         Name = "Shuttle Cockpit", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32211, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32210, 
      }, 
      [32211] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The entrance ramp is located just behind the cockpit of the shuttle\
and extends down underneath it when open. This almost gives the\
apearance of the shuttle opening its 'mouth' to let out passengers.\
The ramp is covered in a dark carpet suitable for formal apearances.\
A hallway extends around the ramp heading up towards the cockpit and\
back towards the passenger compartment.\
", 
         Name = "Entrance Ramp", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32210, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32212, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32211, 
      }, 
      [32212] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The passenger lounge was designed to be quite comfortable for human\
passengers. A dark rich carpet covers the entire floor. The chairs\
flank small tables that are spread along the walls of the\
compartment. Adjustable glow panels are strategicly positioned by\
each table providing directional light for reading and working or a\
more difused light for social rides.  \
", 
         Name = "Passenger Lounge", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32211, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32212, 
      }, 
      [32213] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "You are in the cockpit of a standard Lambda-class shuttle. It is a\
popular lightly armed shuttle used by the Empire for transporting\
small groups of people. The cockpit is equipped with chairs for both\
a pilot and a co-pilot. There is room enough behind the chairs for a\
few passengers or a flight officer who might wish to oversee the flight\
operation, however most of the passenger seating is towards the back of\
the spacecraft.\
", 
         Name = "Shuttle Cockpit", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32214, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32213, 
      }, 
      [32214] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The entrance ramp is located just behind the cockpit of the shuttle\
and extends down underneath it when open. This almost gives the\
apearance of the shuttle opening its 'mouth' to let out passengers.\
The ramp is covered in a dark carpet suitable for formal apearances.\
A hallway extends around the ramp heading up towards the cockpit and\
back towards the passenger compartment.\
", 
         Name = "Entrance Ramp", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32213, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32215, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32214, 
      }, 
      [32215] = 
      {
         Flags = 
         {
            [25] = "Refinery", 
            [2] = "NoMob", 
            [19] = "ClanStoreroom", 
            [29] = "Spacecraft", 
            [26] = "Factory", 
            [23] = "Hotel", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The passenger lounge was designed to be quite comfortable for human\
passengers. A dark rich carpet covers the entire floor. The chairs\
flank small tables that are spread along the walls of the\
compartment. Adjustable glow panels are strategicly positioned by\
each table providing directional light for reading and working or a\
more difused light for social rides.  \
", 
         Name = "Passenger Lounge", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32214, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32215, 
      }, 
      [32216] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "You are in the cockpit of a standard Lambda-class shuttle. It is a\
popular lightly armed shuttle used by the Empire for transporting\
small groups of people. The cockpit is equipped with chairs for both\
a pilot and a co-pilot. There is room enough behind the chairs for a\
few passengers or a flight officer who might wish to oversee the flight\
operation, however most of the passenger seating is towards the back of\
the spacecraft.\
", 
         Name = "Shuttle Cockpit", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32217, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32216, 
      }, 
      [32217] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The entrance ramp is located just behind the cockpit of the shuttle\
and extends down underneath it when open. This almost gives the\
apearance of the shuttle opening its 'mouth' to let out passengers.\
The ramp is covered in a dark carpet suitable for formal apearances.\
A hallway extends around the ramp heading up towards the cockpit and\
back towards the passenger compartment.\
", 
         Name = "Entrance Ramp", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32216, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32218, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32217, 
      }, 
      [32218] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The passenger lounge was designed to be quite comfortable for human\
passengers. A dark rich carpet covers the entire floor. The chairs\
flank small tables that are spread along the walls of the\
compartment. Adjustable glow panels are strategicly positioned by\
each table providing directional light for reading and working or a\
more difused light for social rides.  \
", 
         Name = "Passenger Lounge", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32217, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32218, 
      }, 
      [32219] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "You are in the cockpit of a standard Lambda-class shuttle. It is a\
popular lightly armed shuttle used by the Empire for transporting\
small groups of people. The cockpit is equipped with chairs for both\
a pilot and a co-pilot. There is room enough behind the chairs for a\
few passengers or a flight officer who might wish to oversee the flight\
operation, however most of the passenger seating is towards the back of\
the spacecraft.\
", 
         Name = "Shuttle Cockpit", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32220, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32219, 
      }, 
      [32220] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The entrance ramp is located just behind the cockpit of the shuttle\
and extends down underneath it when open. This almost gives the\
apearance of the shuttle opening its 'mouth' to let out passengers.\
The ramp is covered in a dark carpet suitable for formal apearances.\
A hallway extends around the ramp heading up towards the cockpit and\
back towards the passenger compartment.\
", 
         Name = "Entrance Ramp", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32219, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32221, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32220, 
      }, 
      [32221] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The passenger lounge was designed to be quite comfortable for human\
passengers. A dark rich carpet covers the entire floor. The chairs\
flank small tables that are spread along the walls of the\
compartment. Adjustable glow panels are strategicly positioned by\
each table providing directional light for reading and working or a\
more difused light for social rides.  \
", 
         Name = "Passenger Lounge", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32220, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32221, 
      }, 
      [32222] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "You are in the cockpit of a standard Lambda-class shuttle. It is a\
popular lightly armed shuttle used by the Empire for transporting\
small groups of people. The cockpit is equipped with chairs for both\
a pilot and a co-pilot. There is room enough behind the chairs for a\
few passengers or a flight officer who might wish to oversee the flight\
operation, however most of the passenger seating is towards the back of\
the spacecraft.\
", 
         Name = "Shuttle Cockpit", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32223, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32222, 
      }, 
      [32223] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The entrance ramp is located just behind the cockpit of the shuttle\
and extends down underneath it when open. This almost gives the\
apearance of the shuttle opening its 'mouth' to let out passengers.\
The ramp is covered in a dark carpet suitable for formal apearances.\
A hallway extends around the ramp heading up towards the cockpit and\
back towards the passenger compartment.\
", 
         Name = "Entrance Ramp", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32222, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32224, 
               Direction = "south", 
               Description = "", 
               Key = 4744, 
               Keyword = "", 
               Flags = 
               {
                  [0] = "IsDoor", 
                  [11] = "Hidden", 
               }, 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32223, 
      }, 
      [32224] = 
      {
         Flags = 
         {
            [25] = "Refinery", 
            [2] = "NoMob", 
            [19] = "ClanStoreroom", 
            [29] = "Spacecraft", 
            [26] = "Factory", 
            [23] = "Hotel", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The passenger lounge was designed to be quite comfortable for human\
passengers. A dark rich carpet covers the entire floor. The chairs\
flank small tables that are spread along the walls of the\
compartment. Adjustable glow panels are strategicly positioned by\
each table providing directional light for reading and working or a\
more difused light for social rides.  \
", 
         Name = "Passenger Lounge", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32223, 
               Direction = "north", 
               Description = "", 
               Key = 4744, 
               Keyword = "", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32224, 
      }, 
      [32225] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "You are in the cockpit of a standard Lambda-class shuttle. It is a\
popular lightly armed shuttle used by the Empire for transporting\
small groups of people. The cockpit is equipped with chairs for both\
a pilot and a co-pilot. There is room enough behind the chairs for a\
few passengers or a flight officer who might wish to oversee the flight\
operation, however most of the passenger seating is towards the back of\
the spacecraft.\
", 
         Name = "Shuttle Cockpit", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32226, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32225, 
      }, 
      [32226] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The entrance ramp is located just behind the cockpit of the shuttle\
and extends down underneath it when open. This almost gives the\
apearance of the shuttle opening its 'mouth' to let out passengers.\
The ramp is covered in a dark carpet suitable for formal apearances.\
A hallway extends around the ramp heading up towards the cockpit and\
back towards the passenger compartment.\
", 
         Name = "Entrance Ramp", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32225, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32227, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32226, 
      }, 
      [32227] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The passenger lounge was designed to be quite comfortable for human\
passengers. A dark rich carpet covers the entire floor. The chairs\
flank small tables that are spread along the walls of the\
compartment. Adjustable glow panels are strategicly positioned by\
each table providing directional light for reading and working or a\
more difused light for social rides.  \
", 
         Name = "Passenger Lounge", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32226, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32227, 
      }, 
      [32228] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "You are in the cockpit of a standard Lambda-class shuttle. It is a\
popular lightly armed shuttle used by the Empire for transporting\
small groups of people. The cockpit is equipped with chairs for both\
a pilot and a co-pilot. There is room enough behind the chairs for a\
few passengers or a flight officer who might wish to oversee the flight\
operation, however most of the passenger seating is towards the back of\
the spacecraft.\
", 
         Name = "Shuttle Cockpit", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32229, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32228, 
      }, 
      [32229] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The entrance ramp is located just behind the cockpit of the shuttle\
and extends down underneath it when open. This almost gives the\
apearance of the shuttle opening its 'mouth' to let out passengers.\
The ramp is covered in a dark carpet suitable for formal apearances.\
A hallway extends around the ramp heading up towards the cockpit and\
back towards the passenger compartment.\
", 
         Name = "Entrance Ramp", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32228, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32230, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32229, 
      }, 
      [32230] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The passenger lounge was designed to be quite comfortable for human\
passengers. A dark rich carpet covers the entire floor. The chairs\
flank small tables that are spread along the walls of the\
compartment. Adjustable glow panels are strategicly positioned by\
each table providing directional light for reading and working or a\
more difused light for social rides.  \
", 
         Name = "Passenger Lounge", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32229, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32230, 
      }, 
      [32231] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "You are in the cockpit of a standard Lambda-class shuttle. It is a\
popular lightly armed shuttle used by the Empire for transporting\
small groups of people. The cockpit is equipped with chairs for both\
a pilot and a co-pilot. There is room enough behind the chairs for a\
few passengers or a flight officer who might wish to oversee the flight\
operation, however most of the passenger seating is towards the back of\
the spacecraft.\
", 
         Name = "Shuttle Cockpit", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32232, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32231, 
      }, 
      [32232] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The entrance ramp is located just behind the cockpit of the shuttle\
and extends down underneath it when open. This almost gives the\
apearance of the shuttle opening its 'mouth' to let out passengers.\
The ramp is covered in a dark carpet suitable for formal apearances.\
A hallway extends around the ramp heading up towards the cockpit and\
back towards the passenger compartment.\
", 
         Name = "Entrance Ramp", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32231, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32233, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32232, 
      }, 
      [32233] = 
      {
         Flags = 
         {
            [26] = "Factory", 
            [29] = "Spacecraft", 
            [2] = "NoMob", 
            [19] = "ClanStoreroom", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The passenger lounge was designed to be quite comfortable for human\
passengers. A dark rich carpet covers the entire floor. The chairs\
flank small tables that are spread along the walls of the\
compartment. Adjustable glow panels are strategicly positioned by\
each table providing directional light for reading and working or a\
more difused light for social rides.  \
", 
         Name = "Passenger Lounge", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32232, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32233, 
      }, 
      [32234] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "You are in the cockpit of a standard Lambda-class shuttle. It is a\
popular lightly armed shuttle used by the Empire for transporting\
small groups of people. The cockpit is equipped with chairs for both\
a pilot and a co-pilot. There is room enough behind the chairs for a\
few passengers or a flight officer who might wish to oversee the flight\
operation, however most of the passenger seating is towards the back of\
the spacecraft.\
", 
         Name = "Shuttle Cockpit", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32235, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32234, 
      }, 
      [32235] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The entrance ramp is located just behind the cockpit of the shuttle\
and extends down underneath it when open. This almost gives the\
apearance of the shuttle opening its 'mouth' to let out passengers.\
The ramp is covered in a dark carpet suitable for formal apearances.\
A hallway extends around the ramp heading up towards the cockpit and\
back towards the passenger compartment.\
", 
         Name = "Entrance Ramp", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32234, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32236, 
               Direction = "south", 
               Description = "", 
               Key = 32411, 
               Keyword = "", 
               Flags = 
               {
                  [0] = "IsDoor", 
                  [11] = "Hidden", 
               }, 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32235, 
      }, 
      [32236] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The passenger lounge was designed to be quite comfortable for human\
passengers. A dark rich carpet covers the entire floor. The chairs\
flank small tables that are spread along the walls of the\
compartment. Adjustable glow panels are strategicly positioned by\
each table providing directional light for reading and working or a\
more difused light for social rides.  \
", 
         Name = "Passenger Lounge", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32235, 
               Direction = "north", 
               Description = "", 
               Key = 32411, 
               Keyword = "", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32236, 
      }, 
      [32237] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "You are in the cockpit of a standard Lambda-class shuttle. It is a\
popular lightly armed shuttle used by the Empire for transporting\
small groups of people. The cockpit is equipped with chairs for both\
a pilot and a co-pilot. There is room enough behind the chairs for a\
few passengers or a flight officer who might wish to oversee the flight\
operation, however most of the passenger seating is towards the back of\
the spacecraft.\
", 
         Name = "Shuttle Cockpit", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32238, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32237, 
      }, 
      [32238] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The entrance ramp is located just behind the cockpit of the shuttle\
and extends down underneath it when open. This almost gives the\
apearance of the shuttle opening its 'mouth' to let out passengers.\
The ramp is covered in a dark carpet suitable for formal apearances.\
A hallway extends around the ramp heading up towards the cockpit and\
back towards the passenger compartment.\
", 
         Name = "Entrance Ramp", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32237, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32239, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32238, 
      }, 
      [32239] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The passenger lounge was designed to be quite comfortable for human\
passengers. A dark rich carpet covers the entire floor. The chairs\
flank small tables that are spread along the walls of the\
compartment. Adjustable glow panels are strategicly positioned by\
each table providing directional light for reading and working or a\
more difused light for social rides.  \
", 
         Name = "Passenger Lounge", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32238, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32239, 
      }, 
      [32240] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 2, 
         Sector = "city", 
         Description = "The Cygnus Spaceworks XG-1 Star Wing or Assault Gunboat, was the first\
imperial starfighter to carry shields. It is a powerful and versatile\
attack vessel and is a favourite of many pilots in the imperial navy. It\
is equiped with a hyperdrive and a large payload of concussion missions\
making it a good choice for extended missions. \
", 
         Name = "An XG-1 Star Wing", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32240, 
      }, 
      [32241] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 2, 
         Sector = "city", 
         Description = "The Cygnus Spaceworks XG-1 Star Wing or Assault Gunboat, was the first\
imperial starfighter to carry shields. It is a powerful and versatile\
attack vessel and is a favourite of many pilots in the imperial navy. It\
is equiped with a hyperdrive and a large payload of concussion missions\
making it a good choice for extended missions. \
", 
         Name = "An XG-1 Star Wing", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32241, 
      }, 
      [32242] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 2, 
         Sector = "city", 
         Description = "The Cygnus Spaceworks XG-1 Star Wing or Assault Gunboat, was the first\
imperial starfighter to carry shields. It is a powerful and versatile\
attack vessel and is a favourite of many pilots in the imperial navy. It\
is equiped with a hyperdrive and a large payload of concussion missions\
making it a good choice for extended missions. \
", 
         Name = "An XG-1 Star Wing", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32242, 
      }, 
      [32243] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 2, 
         Sector = "city", 
         Description = "The Cygnus Spaceworks XG-1 Star Wing or Assault Gunboat, was the first\
imperial starfighter to carry shields. It is a powerful and versatile\
attack vessel and is a favourite of many pilots in the imperial navy. It\
is equiped with a hyperdrive and a large payload of concussion missions\
making it a good choice for extended missions. \
", 
         Name = "An XG-1 Star Wing", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32243, 
      }, 
      [32244] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 2, 
         Sector = "city", 
         Description = "The Cygnus Spaceworks XG-1 Star Wing or Assault Gunboat, was the first\
imperial starfighter to carry shields. It is a powerful and versatile\
attack vessel and is a favourite of many pilots in the imperial navy. It\
is equiped with a hyperdrive and a large payload of concussion missions\
making it a good choice for extended missions. \
", 
         Name = "An XG-1 Star Wing", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32244, 
      }, 
      [32245] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 2, 
         Sector = "city", 
         Description = "The Cygnus Spaceworks XG-1 Star Wing or Assault Gunboat, was the first\
imperial starfighter to carry shields. It is a powerful and versatile\
attack vessel and is a favourite of many pilots in the imperial navy. It\
is equiped with a hyperdrive and a large payload of concussion missions\
making it a good choice for extended missions. \
", 
         Name = "An XG-1 Star Wing", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32245, 
      }, 
      [32246] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 2, 
         Sector = "city", 
         Description = "The Cygnus Spaceworks XG-1 Star Wing or Assault Gunboat, was the first\
imperial starfighter to carry shields. It is a powerful and versatile\
attack vessel and is a favourite of many pilots in the imperial navy. It\
is equiped with a hyperdrive and a large payload of concussion missions\
making it a good choice for extended missions. \
", 
         Name = "An XG-1 Star Wing", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32246, 
      }, 
      [32247] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 2, 
         Sector = "city", 
         Description = "The Cygnus Spaceworks XG-1 Star Wing or Assault Gunboat, was the first\
imperial starfighter to carry shields. It is a powerful and versatile\
attack vessel and is a favourite of many pilots in the imperial navy. It\
is equiped with a hyperdrive and a large payload of concussion missions\
making it a good choice for extended missions. \
", 
         Name = "An XG-1 Star Wing", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32247, 
      }, 
      [32248] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 2, 
         Sector = "city", 
         Description = "The Cygnus Spaceworks XG-1 Star Wing or Assault Gunboat, was the first\
imperial starfighter to carry shields. It is a powerful and versatile\
attack vessel and is a favourite of many pilots in the imperial navy. It\
is equiped with a hyperdrive and a large payload of concussion missions\
making it a good choice for extended missions. \
", 
         Name = "An XG-1 Star Wing", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32248, 
      }, 
      [32249] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 2, 
         Sector = "city", 
         Description = "The Cygnus Spaceworks XG-1 Star Wing or Assault Gunboat, was the first\
imperial starfighter to carry shields. It is a powerful and versatile\
attack vessel and is a favourite of many pilots in the imperial navy. It\
is equiped with a hyperdrive and a large payload of concussion missions\
making it a good choice for extended missions. \
", 
         Name = "An XG-1 Star Wing", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 32249, 
      }, 
      [32250] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Fast Attack Cockpit", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32251, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32250, 
      }, 
      [32251] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Corridor in a Noghri Fast Attack Ship", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32250, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32253, 
               Direction = "east", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32252, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               DestinationVnum = 32254, 
               Direction = "west", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32251, 
      }, 
      [32252] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Corridor in a Noghri Fast Attack Ship", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32251, 
               Direction = "north", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32255, 
               Direction = "east", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               DestinationVnum = 32257, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               DestinationVnum = 32256, 
               Direction = "west", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32252, 
      }, 
      [32253] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Captains Room", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32251, 
               Direction = "west", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32253, 
      }, 
      [32254] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Fast Attack Entrance Ramp", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32251, 
               Direction = "east", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32254, 
      }, 
      [32255] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Name = "Passenger Lounge", 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32259, 
               Direction = "south", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               DestinationVnum = 32252, 
               Direction = "west", 
               Description = "", 
               Key = -1, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 32255, 
      }, 
   }, 
   LowEconomy = 18853075, 
   Objects = 
   {
      [32000] = 
      {
         ItemType = "trash", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "Some god dropped a newly created firstobject here.", 
         Name = "firstobject", 
         ShortDescr = "a newly created firstobject", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32000, 
      }, 
      [32001] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "Z-95 Headhunter 0002 is here waiting for someone to rent it.", 
         Name = "z-95 z95 headhunter public 0002", 
         ShortDescr = "a Z-95 Headhunter", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32001, 
      }, 
      [32002] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "Public shuttle 0002 is here waiting for someone to rent it.", 
         Name = "public shuttle 0002", 
         ShortDescr = "shuttle 0002", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32002, 
      }, 
      [32003] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "Assault Shuttle AS-0001 is docked here.", 
         Name = "public ship assault shuttle AS-0001", 
         ShortDescr = "Assault Shuttle AS-0001", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32003, 
      }, 
      [32004] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "Public Shuttle 0001 is docked here.", 
         Name = "public shuttle 0001", 
         ShortDescr = "shuttle 0001", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32004, 
      }, 
      [32005] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "X-Wing XW-0001 is docked here.", 
         Name = "rebel alliance starfighter x-wing xw-0001", 
         ShortDescr = "X-Wing XW-0001", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32005, 
      }, 
      [32006] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "Y-Wing YW-0001 is docked here.", 
         Name = "rebel alliance starfighter y-wing yw-0001", 
         ShortDescr = "Y-Wing YW-0001", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32006, 
      }, 
      [32007] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "B-Wing BW-0001 is docked here.", 
         Name = "rebel alliance starfighter b-wing bw-0001", 
         ShortDescr = "B-Wing BW-0001", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32007, 
      }, 
      [32008] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "A-Wing AW-0001 is docked here.", 
         Name = "rebel alliance starfighter a-wing aw-0001", 
         ShortDescr = "A-Wing AW-0001", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32008, 
      }, 
      [32009] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "TIE Fighter TF-0001 has no weapons it is used for training only.", 
         Name = "imperial tie fighter tf-0001", 
         ShortDescr = "TIE Fighter TF-0001", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32009, 
      }, 
      [32010] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "TIE Interceptor TI-0001 is docked here.", 
         Name = "imperial tie interceptor ti-0001", 
         ShortDescr = "TIE Interceptor TI-0001", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32010, 
      }, 
      [32011] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "TIE Bomber TB-0001 is docked here.", 
         Name = "imperial tie bomber tb-0001", 
         ShortDescr = "TIE Bomber TB-0001", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32011, 
      }, 
      [32012] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "TIE Advanced TA-0001 is docked here.", 
         Name = "imperial starfighter tie advanced ta-0001", 
         ShortDescr = "TIE Advanced TA-0001", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32012, 
      }, 
      [32013] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "TIE Defender TD-0001 is docked here.", 
         Name = "imperial starfighter tie defender td-0001", 
         ShortDescr = "TIE Defender TD-0001", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32013, 
      }, 
      [32014] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "Assault Gunboat AG-0001 is docked here.", 
         Name = "imperial starfighter assault gunboat ag-0001", 
         ShortDescr = "Assault Gunboat AG-0001", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32014, 
      }, 
      [32015] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "Imperial Missile Boat MB-0001 is docked here.", 
         Name = "imperial starfighter missile boat mb-0001", 
         ShortDescr = "Imperial Missile Boat MB-0001", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32015, 
      }, 
      [32016] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "The Corellian Transport, Maw Hopper is docked here.", 
         Name = "Corellian Transport Maw Hopper", 
         ShortDescr = "the Maw Hopper", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32016, 
      }, 
      [32017] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "Transport T001 is docked here.", 
         Name = "Transport T001", 
         ShortDescr = "Transport T001", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32017, 
      }, 
      [32018] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "The Serin Pluogus is here waiting for passengers.", 
         Name = "serin pluogus bus shuttle", 
         ShortDescr = "The Serin Pluogus", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32018, 
      }, 
      [32019] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "B-Wing bw02 is docked here.", 
         Name = "B-Wing bw02", 
         ShortDescr = "B-Wing bw02", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32019, 
      }, 
      [32020] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "B-Wing bw03 is docked here.", 
         Name = "B-Wing bw03", 
         ShortDescr = "B-Wing bw03", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32020, 
      }, 
      [32021] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "B-Wing bw04 is docked here.", 
         Name = "B-Wing bw04", 
         ShortDescr = "B-Wing bw04", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32021, 
      }, 
      [32022] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "B-Wing bw05 is docked here.", 
         Name = "B-Wing bw05", 
         ShortDescr = "B-Wing bw05", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32022, 
      }, 
      [32023] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "B-Wing bw06 is docked here.", 
         Name = "B-Wing bw06", 
         ShortDescr = "B-Wing bw06", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32023, 
      }, 
      [32024] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "B-Wing bw07 is docked here.", 
         Name = "B-Wing bw07", 
         ShortDescr = "B-Wing bw07", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32024, 
      }, 
      [32025] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "B-Wing bw08 is docked here.", 
         Name = "B-Wing bw08", 
         ShortDescr = "B-Wing bw08", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32025, 
      }, 
      [32026] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "B-Wing bw09 is docked here.", 
         Name = "B-Wing bw09", 
         ShortDescr = "B-Wing bw09", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32026, 
      }, 
      [32027] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "B-Wing bw10 is docked here.", 
         Name = "B-Wing bw10", 
         ShortDescr = "B-Wing bw10", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32027, 
      }, 
      [32030] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "Z-95 Headhunter z95csa0 is docked here.", 
         Name = "z95 z-95 headhunter z95csa0", 
         ShortDescr = "a Z-95", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32030, 
      }, 
      [32031] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "Z-95 Headhunter z95csa1 is docked here.", 
         Name = "z95 z-95 headhunter z95csa1", 
         ShortDescr = "a Z-95", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32031, 
      }, 
      [32032] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "Z-95 Headhunter z95csa2 is docked here.", 
         Name = "z95 z-95 headhunter z95csa2", 
         ShortDescr = "a Z-95", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32032, 
      }, 
      [32033] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "Z-95 Headhunter z95csa3 is docked here.", 
         Name = "z95 z-95 headhunter z95csa3", 
         ShortDescr = "a Z-95", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32033, 
      }, 
      [32034] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "Z-95 Headhunter z95csa4 is docked here.", 
         Name = "z95 z-95 headhunter z95csa4", 
         ShortDescr = "a Z-95", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32034, 
      }, 
      [32035] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "Z-95 Headhunter z95csa5 is docked here.", 
         Name = "z95 z-95 headhunter z95csa5", 
         ShortDescr = "a Z-95", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32035, 
      }, 
      [32036] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "Z-95 Headhunter z95csa6 is docked here.", 
         Name = "z95 z-95 headhunter z95csa6", 
         ShortDescr = "a Z-95", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32036, 
      }, 
      [32037] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "Z-95 Headhunter z95csa7 is docked here.", 
         Name = "z95 z-95 headhunter z95csa7", 
         ShortDescr = "a Z-95", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32037, 
      }, 
      [32038] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "Z-95 Headhunter z95csa8 is docked here.", 
         Name = "z95 z-95 headhunter z95csa8", 
         ShortDescr = "a Z-95", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32038, 
      }, 
      [32039] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "Z-95 Headhunter z95csa9 is docked here.", 
         Name = "z95 z-95 headhunter z95csa9", 
         ShortDescr = "a Z-95", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32039, 
      }, 
      [32040] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "R-41 r41aa0 is docked here.", 
         Name = "r-41 starchaser r41aa0", 
         ShortDescr = "an R-41 Starchaser", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32040, 
      }, 
      [32041] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "R-41 r41aa1 is docked here.", 
         Name = "r-41 starchaser r41aa1", 
         ShortDescr = "an R-41 Starchaser", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32041, 
      }, 
      [32042] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "R-41 r41aa2 is docked here.", 
         Name = "r-41 starchaser r41aa2", 
         ShortDescr = "an R-41 Starchaser", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32042, 
      }, 
      [32043] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "R-41 r41aa3 is docked here.", 
         Name = "r-41 starchaser r41aa3", 
         ShortDescr = "an R-41 Starchaser", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32043, 
      }, 
      [32044] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "R-41 r41aa4 is docked here.", 
         Name = "r-41 starchaser r41aa4", 
         ShortDescr = "an R-41 Starchaser", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32044, 
      }, 
      [32045] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "R-41 r41aa5 is docked here.", 
         Name = "r-41 starchaser r41aa5", 
         ShortDescr = "an R-41 Starchaser", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32045, 
      }, 
      [32046] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "R-41 r41aa6 is docked here.", 
         Name = "r-41 starchaser r41aa6", 
         ShortDescr = "an R-41 Starchaser", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32046, 
      }, 
      [32047] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "R-41 r41aa7 is docked here.", 
         Name = "r-41 starchaser r41aa7", 
         ShortDescr = "an R-41 Starchaser", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32047, 
      }, 
      [32048] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "R-41 r41aa8 is docked here.", 
         Name = "r-41 starchaser r41aa8", 
         ShortDescr = "an R-41 Starchaser", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32048, 
      }, 
      [32049] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "R-41 r41aa9 is docked here.", 
         Name = "r-41 starchaser r41aa9", 
         ShortDescr = "an R-41 Starchaser", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32049, 
      }, 
      [32050] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "T-Wing TW00 is docked here.", 
         Name = "T-Wing tw00", 
         ShortDescr = "a T-Wing starfighter", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32050, 
      }, 
      [32051] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "T-Wing TW01 is docked here.", 
         Name = "T-Wing tw01", 
         ShortDescr = "a T-Wing starfighter", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32051, 
      }, 
      [32052] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "T-Wing TW02 is docked here.", 
         Name = "T-Wing tw02", 
         ShortDescr = "a T-Wing starfighter", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32052, 
      }, 
      [32053] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "T-Wing TW03 is docked here.", 
         Name = "T-Wing tw03", 
         ShortDescr = "a T-Wing starfighter", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32053, 
      }, 
      [32054] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "T-Wing TW04 is docked here.", 
         Name = "T-Wing tw04", 
         ShortDescr = "a T-Wing starfighter", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32054, 
      }, 
      [32055] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "T-Wing TW05 is docked here.", 
         Name = "T-Wing tw05", 
         ShortDescr = "a T-Wing starfighter", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32055, 
      }, 
      [32056] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "T-Wing TW06 is docked here.", 
         Name = "T-Wing tw06", 
         ShortDescr = "a T-Wing starfighter", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32056, 
      }, 
      [32057] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "T-Wing TW07 is docked here.", 
         Name = "T-Wing tw07", 
         ShortDescr = "a T-Wing starfighter", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32057, 
      }, 
      [32058] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "T-Wing TW08 is docked here.", 
         Name = "T-Wing tw08", 
         ShortDescr = "a T-Wing starfighter", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32058, 
      }, 
      [32059] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "T-Wing TW09 is docked here.", 
         Name = "T-Wing tw09", 
         ShortDescr = "a T-Wing starfighter", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32059, 
      }, 
      [32060] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "TIE Advanced ta02 is docked here.", 
         Name = "TIE Advanced Starfighter ta02", 
         ShortDescr = "A TIE Advanced Starfighter", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32060, 
      }, 
      [32061] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "TIE Advanced ta03 is docked here.", 
         Name = "TIE Advanced Starfighter ta03", 
         ShortDescr = "A TIE Advanced Starfighter", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32061, 
      }, 
      [32062] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "TIE Advanced ta04 is docked here.", 
         Name = "TIE Advanced Starfighter ta04", 
         ShortDescr = "A TIE Advanced Starfighter", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32062, 
      }, 
      [32063] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "TIE Advanced ta05 is docked here.", 
         Name = "TIE Advanced Starfighter ta05", 
         ShortDescr = "A TIE Advanced Starfighter", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32063, 
      }, 
      [32064] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "Lambda class shuttle 32210 is docked here.", 
         Name = "shuttle 32210", 
         ShortDescr = "a lambda class shuttle", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32064, 
      }, 
      [32065] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "Lambda class shuttle 32213 is docked here.", 
         Name = "shuttle 32213", 
         ShortDescr = "a lambda class shuttle", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32065, 
      }, 
      [32066] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "Lambda class shuttle 32216 is docked here.", 
         Name = "shuttle 32216", 
         ShortDescr = "a lambda class shuttle", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32066, 
      }, 
      [32067] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "Lambda class shuttle 32219 is docked here.", 
         Name = "shuttle 32219", 
         ShortDescr = "a lambda class shuttle", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32067, 
      }, 
      [32068] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "Lambda class shuttle 32222 is docked here.", 
         Name = "shuttle 32222", 
         ShortDescr = "a lambda class shuttle", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32068, 
      }, 
      [32069] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "Lambda class shuttle 32225 is docked here.", 
         Name = "shuttle 32225", 
         ShortDescr = "a lambda class shuttle", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32069, 
      }, 
      [32070] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "Lambda class shuttle 32228 is docked here.", 
         Name = "shuttle 32228", 
         ShortDescr = "a lambda class shuttle", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32070, 
      }, 
      [32071] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "Lambda class shuttle 32231 is docked here.", 
         Name = "shuttle 32231", 
         ShortDescr = "a lambda class shuttle", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32071, 
      }, 
      [32072] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "Lambda class shuttle 32234 is docked here.", 
         Name = "shuttle 32234", 
         ShortDescr = "a lambda class shuttle", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32072, 
      }, 
      [32073] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "Lambda class shuttle 32237 is docked here.", 
         Name = "shuttle 32237", 
         ShortDescr = "a lambda class shuttle", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32073, 
      }, 
      [32330] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "Assault Shuttle 32330 is docked here.", 
         Name = "assault shuttle 32330", 
         ShortDescr = "an Assault Shuttle", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32330, 
      }, 
      [32335] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "Assault Shuttle 32335 is docked here.", 
         Name = "assault shuttle 32335", 
         ShortDescr = "an Assault Shuttle", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32335, 
      }, 
      [32340] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "Assault Shuttle 32340 is docked here.", 
         Name = "assault shuttle 32340", 
         ShortDescr = "an Assault Shuttle", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32340, 
      }, 
      [32345] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "Assault Shuttle 32345 is docked here.", 
         Name = "assault shuttle 32345", 
         ShortDescr = "an Assault Shuttle", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32345, 
      }, 
      [32350] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "Assault Shuttle 32350 is docked here.", 
         Name = "assault shuttle 32350", 
         ShortDescr = "an Assault Shuttle", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32350, 
      }, 
      [32355] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "Assault Shuttle 32355 is docked here.", 
         Name = "assault shuttle 32355", 
         ShortDescr = "an Assault Shuttle", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32355, 
      }, 
      [32360] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "Assault Shuttle 32360 is docked here.", 
         Name = "assault shuttle 32360", 
         ShortDescr = "an Assault Shuttle", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32360, 
      }, 
      [32365] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "Assault Shuttle 32365 is docked here.", 
         Name = "assault shuttle 32365", 
         ShortDescr = "an Assault Shuttle", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32365, 
      }, 
      [32370] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "Assault Shuttle 32370 is docked here.", 
         Name = "assault shuttle 32370", 
         ShortDescr = "an Assault Shuttle", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32370, 
      }, 
      [32375] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "Assault Shuttle 32375 is docked here.", 
         Name = "assault shuttle 32375", 
         ShortDescr = "an Assault Shuttle", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32375, 
      }, 
      [32380] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "Assault Shuttle 32380 is docked here.", 
         Name = "assault shuttle 32380", 
         ShortDescr = "an Assault Shuttle", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32380, 
      }, 
      [32385] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "Assault Shuttle 32385 is docked here.", 
         Name = "assault shuttle 32385", 
         ShortDescr = "an Assault Shuttle", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32385, 
      }, 
      [32499] = 
      {
         ItemType = "trash", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "Some god dropped a newly created lastobj here.", 
         Name = "lastobj", 
         ShortDescr = "a newly created lastobj", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32499, 
      }, 
      [32402] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "An old beat up starfighter is used mostly for training.", 
         Name = "old starfighter 32402", 
         ShortDescr = "an old starfighter", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32402, 
      }, 
      [32390] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "Assault Shuttle 32390 is docked here.", 
         Name = "assault shuttle 32390", 
         ShortDescr = "an Assault Shuttle", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32390, 
      }, 
      [32403] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "An old beat up starfighter is used mostly for training.", 
         Name = "old starfighter 32403", 
         ShortDescr = "an old starfighter", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32403, 
      }, 
      [32404] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "An old beat up starfighter is used mostly for training.", 
         Name = "old starfighter 32404", 
         ShortDescr = "an old starfighter", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32404, 
      }, 
      [32405] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "An old beat up starfighter is used mostly for training.", 
         Name = "old starfighter 32405", 
         ShortDescr = "an old starfighter", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32405, 
      }, 
      [32406] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "An old beat up starfighter is used mostly for training.", 
         Name = "old starfighter 32406", 
         ShortDescr = "an old starfighter", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32406, 
      }, 
      [32395] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "Assault Shuttle 32395 is docked here.", 
         Name = "assault shuttle 32395", 
         ShortDescr = "an Assault Shuttle", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32395, 
      }, 
      [32140] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "XG-1 starwing assault gunboat 32240 is docked here", 
         Name = "xg-1 starwing assault gunboat 32240", 
         ShortDescr = "an assault gunboat", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32140, 
      }, 
      [32141] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "XG-1 starwing assault gunboat 32241 is docked here", 
         Name = "xg-1 starwing assault gunboat 32241", 
         ShortDescr = "an assault gunboat", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32141, 
      }, 
      [32142] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "XG-1 starwing assault gunboat 32242 is docked here", 
         Name = "xg-1 starwing assault gunboat 32242", 
         ShortDescr = "an assault gunboat", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32142, 
      }, 
      [32143] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "XG-1 starwing assault gunboat 32243 is docked here", 
         Name = "xg-1 starwing assault gunboat 32243", 
         ShortDescr = "an assault gunboat", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32143, 
      }, 
      [32144] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "XG-1 starwing assault gunboat 32244 is docked here", 
         Name = "xg-1 starwing assault gunboat 32244", 
         ShortDescr = "an assault gunboat", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32144, 
      }, 
      [32145] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "XG-1 starwing assault gunboat 32245 is docked here", 
         Name = "xg-1 starwing assault gunboat 32245", 
         ShortDescr = "an assault gunboat", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32145, 
      }, 
      [32146] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "XG-1 starwing assault gunboat 32246 is docked here", 
         Name = "xg-1 starwing assault gunboat 32246", 
         ShortDescr = "an assault gunboat", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32146, 
      }, 
      [32147] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "XG-1 starwing assault gunboat 32247 is docked here", 
         Name = "xg-1 starwing assault gunboat 32247", 
         ShortDescr = "an assault gunboat", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32147, 
      }, 
      [32148] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "XG-1 starwing assault gunboat 32248 is docked here", 
         Name = "xg-1 starwing assault gunboat 32248", 
         ShortDescr = "an assault gunboat", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32148, 
      }, 
      [32149] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "XG-1 starwing assault gunboat 32249 is docked here", 
         Name = "xg-1 starwing assault gunboat 32249", 
         ShortDescr = "an assault gunboat", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32149, 
      }, 
      [32150] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "Fast Attack Patrol Ship 32150 is docked here.", 
         Name = "Fast Attack Patrol Ship 32150", 
         ShortDescr = "a Fast Attack Patrol Ship", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32150, 
      }, 
      [32407] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "An old beat up starfighter is used mostly for training.", 
         Name = "old starfighter 32407", 
         ShortDescr = "an old starfighter", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32407, 
      }, 
      [32408] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "An old beat up starfighter is used mostly for training.", 
         Name = "old starfighter 32408", 
         ShortDescr = "an old starfighter", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32408, 
      }, 
      [32409] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "An old beat up starfighter is used mostly for training.", 
         Name = "old starfighter 32409", 
         ShortDescr = "an old starfighter", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32409, 
      }, 
      [32410] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "You may BOARD the Serin Tocca.", 
         Name = "serin tocca", 
         ShortDescr = "The Serin Tocca", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32410, 
      }, 
      [32411] = 
      {
         ItemType = "trash", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "An electronic keycard is glowing ever so slightly.", 
         Name = "Shuttle 32234 Door Key", 
         ShortDescr = "&R&BShuttle 32234 Passenger Lounge Electronic Keycard&R&W", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32411, 
      }, 
      [32401] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "An old beat up starfighter is used mostly for training.", 
         Name = "old starfighter 32401", 
         ShortDescr = "an old starfighter", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32401, 
      }, 
      [32400] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "An old beat up starfighter is used mostly for training.", 
         Name = "old starfighter 32400", 
         ShortDescr = "an old starfighter", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32400, 
      }, 
      [32325] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "Assault Shuttle 32325 is docked here.", 
         Name = "assault shuttle 32325", 
         ShortDescr = "an Assault Shuttle", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32325, 
      }, 
      [32320] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "Assault Shuttle 32320 is docked here.", 
         Name = "assault shuttle 32320", 
         ShortDescr = "an Assault Shuttle", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32320, 
      }, 
      [32160] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "Fast Attack Patrol Ship 32160 is docked here.", 
         Name = "Fast Attack Patrol Ship 32160", 
         ShortDescr = "a Fast Attack Patrol Ship", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32160, 
      }, 
      [32315] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "Assault Shuttle 32315 is docked here.", 
         Name = "assault shuttle 32315", 
         ShortDescr = "an Assault Shuttle", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32315, 
      }, 
      [32310] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "Assault Shuttle 32310 is docked here.", 
         Name = "assault shuttle 32310", 
         ShortDescr = "an Assault Shuttle", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32310, 
      }, 
      [32305] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "Assault Shuttle 32305 is docked here.", 
         Name = "assault shuttle 32305", 
         ShortDescr = "an Assault Shuttle", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32305, 
      }, 
      [32300] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "Assault Shuttle 32300 is docked here.", 
         Name = "assault shuttle 32300", 
         ShortDescr = "an Assault Shuttle", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32300, 
      }, 
      [32299] = 
      {
         ItemType = "trash", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "Some god dropped a newly created lastobject here.", 
         Name = "lastobject", 
         ShortDescr = "a newly created lastobject", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32299, 
      }, 
      [32298] = 
      {
         ItemType = "trash", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "This shuttle docks with the pluogus.", 
         Name = "shuttle", 
         ShortDescr = "a newly created shuttle", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32298, 
      }, 
      [32283] = 
      {
         ItemType = "drink_container", 
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 1, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Layers = 0, 
         Description = "A glass of water is a good cheap drink.", 
         Name = "glass of water", 
         ShortDescr = "a glass of water", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32283, 
      }, 
      [32282] = 
      {
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpechoat $n You decide to commit suicide by pushing the button.\
mpechoaround $n $n begins to push the button.\
mpechoaround $n You decide that leaving would be a good idea.\
pull button\
mptransfer $n 32295\
open w\
mpforce all wake\
mpforce all stand\
mpforce all w\
close w\
mpgoto 32295\
mptransfer $n 32296\
mpgoto 32296\
mpechoat $n The air pressure drops quickly.\
if race($n) == duinuogwuin\
mpechoat $n Thank god you're a Duinuogwuin.\
else\
mpechoat $n Moments later you are dead.\
mpdamage $n 20000\
endif\
", 
               MudProgType = "push_prog", 
               Arguments = "100", 
            }, 
         }, 
         ItemType = "button", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "DO NOT PUSH THIS BUTTON.", 
         Name = "a button", 
         ShortDescr = "a button", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32282, 
      }, 
      [32281] = 
      {
         ItemType = "fabric", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 50, 
         ObjectValues = 
         {
            [1] = 4, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 4, 
         }, 
         Layers = 16, 
         Description = "A nice jacket could be made out of this cu-pa hide.", 
         Name = "some cu-pa hide fabric", 
         ShortDescr = "some cu-pa hide", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32281, 
      }, 
      [32170] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "Fast Attack Patrol Ship 32170 is docked here.", 
         Name = "Fast Attack Patrol Ship 32170", 
         ShortDescr = "a Fast Attack Patrol Ship", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32170, 
      }, 
      [32280] = 
      {
         ItemType = "thread", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 2000, 
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
         Description = "A needle and thread would come in handy if you wanted to sew something.", 
         Name = "needle and thread", 
         ShortDescr = "a needle and thread", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32280, 
      }, 
      [32279] = 
      {
         ItemType = "armor", 
         WearFlags = 
         {
            [0] = "Take", 
            [5] = "Legs", 
         }, 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Layers = 32, 
         Description = "Part of a grey flight suit was dropped here", 
         Name = "silver-grey flight suit bottom", 
         ShortDescr = "grey flight suit pants", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32279, 
      }, 
      [32278] = 
      {
         ItemType = "armor", 
         WearFlags = 
         {
            [0] = "Take", 
            [3] = "Body", 
         }, 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Layers = 32, 
         Description = "Part of a grey flight suit was dropped here", 
         Name = "silver-grey flight suit top", 
         ShortDescr = "a grey flight suit top", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32278, 
      }, 
      [32276] = 
      {
         ItemType = "rawspice", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 100, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 1, 
         }, 
         Layers = 0, 
         Description = "A large amount of unrefined carsanum was foolishly left lying around.", 
         Name = "raw unrefined carsanum spice", 
         ShortDescr = "some unrefined carsanum", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32276, 
      }, 
      [32275] = 
      {
         Affects = 
         {
            [1] = 
            {
               Location = 19, 
               Modifier = 3, 
            }, 
         }, 
         ItemType = "weapon", 
         ObjectValues = 
         {
            [1] = 7, 
            [2] = 4, 
            [3] = 6, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         Weight = 4, 
         ActionDescription = "", 
         Cost = 3800, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Layers = 0, 
         Description = "A Heavy Sorosuub Q2-H Holdout Blaster was left here.", 
         Name = "Q2-H Heavy Holdout Blaster Sorosuub", 
         ShortDescr = "a Heavy Sorosuub Q2-H Holdout Blaster", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32275, 
      }, 
      [32274] = 
      {
         ItemType = "weapon", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 6, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Layers = 0, 
         Description = "A stick is a better weapon than nothing.", 
         Name = "stick", 
         ShortDescr = "a stick", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32274, 
      }, 
      [32273] = 
      {
         ItemType = "furniture", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "Why not enter the lost and found box and see whats inside.", 
         Name = "lost and found box", 
         ShortDescr = "the lost and found box", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32273, 
      }, 
      [32272] = 
      {
         ItemType = "furniture", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "A recruiting desk is in the corner here.", 
         Name = "Recruiting desk.", 
         ShortDescr = "the recruiting desc", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32272, 
      }, 
      [32271] = 
      {
         Affects = 
         {
            [1] = 
            {
               Location = 25, 
               Modifier = 1, 
            }, 
            [2] = 
            {
               Location = 4, 
               Modifier = 1, 
            }, 
            [3] = 
            {
               Location = 19, 
               Modifier = 1, 
            }, 
         }, 
         ItemType = "container", 
         WearFlags = 
         {
            [0] = "Take", 
            [10] = "About", 
         }, 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 30, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 30, 
         }, 
         Layers = 64, 
         Description = "A haversac makes a good travel bag.", 
         Name = "haversac", 
         ShortDescr = "a haversac", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32271, 
      }, 
      [32180] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "Fast Attack Patrol Ship 32180 is docked here.", 
         Name = "Fast Attack Patrol Ship 32180", 
         ShortDescr = "a Fast Attack Patrol Ship", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32180, 
      }, 
      [32270] = 
      {
         ItemType = "bolt", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 50, 
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
         Description = "Some quarrels are used in bowcasters.", 
         Name = "quarrel bolt energy", 
         ShortDescr = "some quarrels", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32270, 
      }, 
      [32182] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "X-Wing xw02 is docked here.", 
         Name = "x-wing xw02", 
         ShortDescr = "an X-Wing", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32182, 
      }, 
      [32183] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "X-Wing xw03 is docked here.", 
         Name = "x-wing xw03", 
         ShortDescr = "an X-Wing", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32183, 
      }, 
      [32184] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "X-Wing xw04 is docked here.", 
         Name = "x-wing xw04", 
         ShortDescr = "an X-Wing", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32184, 
      }, 
      [32185] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "X-Wing xw05 is docked here.", 
         Name = "x-wing xw05", 
         ShortDescr = "an X-Wing", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32185, 
      }, 
      [32269] = 
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
               Location = 17, 
               Modifier = -3, 
            }, 
         }, 
         ItemType = "container", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         Weight = 5, 
         ActionDescription = "", 
         Cost = 200, 
         WearFlags = 
         {
            [0] = "Take", 
            [10] = "About", 
         }, 
         Layers = 32, 
         Description = "A wookiee bandolier holds bowcaster quarrels.", 
         Name = "wookiee bandolier", 
         ShortDescr = "a wookiee bandolier", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32269, 
      }, 
      [32268] = 
      {
         ObjectValues = 
         {
            [1] = 6, 
            [2] = 7, 
            [3] = 9, 
            [4] = 110, 
            [5] = 110, 
            [0] = 0, 
         }, 
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
         ItemType = "weapon", 
         MudProgs = 
         {
            [1] = 
            {
               Code = "if race($n) != wookiee\
mpechoat $n Only Wookiees can handle bowcasters.\
mpechoaround $n $n Tries to figure out what to do with a bowcaster.\
mpforce $n remove bowcaster \
endif\
", 
               MudProgType = "wear_prog", 
               Arguments = "100", 
            }, 
         }, 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         Weight = 10, 
         ActionDescription = "", 
         Cost = 4100, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Layers = 0, 
         Description = "Bowcasters are the wookiees weapon of choice.", 
         Name = "wookiee bowcaster", 
         ShortDescr = "a wookiee bowcaster", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32268, 
      }, 
      [32267] = 
      {
         Affects = 
         {
            [1] = 
            {
               Location = 14, 
               Modifier = 10, 
            }, 
         }, 
         ItemType = "armor", 
         ObjectValues = 
         {
            [1] = 3, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Flags = 
         {
            [31] = "HumanSize", 
         }, 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 125, 
         WearFlags = 
         {
            [0] = "Take", 
            [6] = "Feet", 
         }, 
         Layers = 0, 
         Description = "A pair of low cut boots is here.", 
         Name = "boots", 
         ShortDescr = "some low cut boots", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32267, 
      }, 
      [32266] = 
      {
         Affects = 
         {
            [1] = 
            {
               Location = 18, 
               Modifier = 1, 
            }, 
         }, 
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
         Flags = 
         {
            [31] = "HumanSize", 
         }, 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 30, 
         WearFlags = 
         {
            [0] = "Take", 
            [3] = "Body", 
         }, 
         Layers = 6, 
         Description = "A white t-shirt is a little bit stained.", 
         Name = "white t-shirt", 
         ShortDescr = "a white t-shirt", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32266, 
      }, 
      [32265] = 
      {
         ItemType = "armor", 
         ObjectValues = 
         {
            [1] = 4, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Flags = 
         {
            [31] = "HumanSize", 
         }, 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 80, 
         WearFlags = 
         {
            [0] = "Take", 
            [5] = "Legs", 
         }, 
         Layers = 0, 
         Description = "Part of a grey flight suit is here.", 
         Name = "grey flight suit bottom top pants slacks trousers", 
         ShortDescr = "some flight pants", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32265, 
      }, 
      [32264] = 
      {
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
         Flags = 
         {
            [31] = "HumanSize", 
         }, 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 120, 
         WearFlags = 
         {
            [0] = "Take", 
            [3] = "Body", 
         }, 
         Layers = 112, 
         Description = "Part of a grey flight suit is here.", 
         Name = "grey flight suit top jacket", 
         ShortDescr = "a grey flight jacket", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32264, 
      }, 
      [32263] = 
      {
         Affects = 
         {
            [1] = 
            {
               Location = 5, 
               Modifier = 1, 
            }, 
         }, 
         ItemType = "armor", 
         ObjectValues = 
         {
            [1] = 3, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Flags = 
         {
            [31] = "HumanSize", 
         }, 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 30, 
         WearFlags = 
         {
            [0] = "Take", 
            [5] = "Legs", 
         }, 
         Layers = 0, 
         Description = "A navy blue imperial uniform is here.", 
         Name = "blue imperial navy bottom pants", 
         ShortDescr = "navy uniform pants", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32263, 
      }, 
      [32262] = 
      {
         Affects = 
         {
            [1] = 
            {
               Location = 5, 
               Modifier = 1, 
            }, 
         }, 
         ItemType = "armor", 
         ObjectValues = 
         {
            [1] = 3, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Flags = 
         {
            [31] = "HumanSize", 
         }, 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 30, 
         WearFlags = 
         {
            [0] = "Take", 
            [3] = "Body", 
         }, 
         Layers = 0, 
         Description = "A navy blue imperial uniform is here.", 
         Name = "blue imperial navy top", 
         ShortDescr = "navy uniform top", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32262, 
      }, 
      [32261] = 
      {
         ItemType = "food", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 8, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         Layers = 0, 
         Description = "Some dried fruit should last for a long time without going bad.", 
         Name = "dried fruit", 
         ShortDescr = "some dried fruit", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32261, 
      }, 
      [32260] = 
      {
         ItemType = "food", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 3, 
         ObjectValues = 
         {
            [1] = 20, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 30, 
         }, 
         Layers = 0, 
         Description = "Some flavoured bean curd is very nutritious.", 
         Name = "flavoured bean curd", 
         ShortDescr = "some flavoured bean curd", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32260, 
      }, 
      [32259] = 
      {
         ItemType = "fountain", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 10000, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10000, 
         }, 
         Layers = 0, 
         Description = "A large fountain is in the center of the courtyard.", 
         Name = "water fountain", 
         ShortDescr = "a fountain", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32259, 
      }, 
      [32258] = 
      {
         Affects = 
         {
            [1] = 
            {
               Location = 14, 
               Modifier = 10, 
            }, 
            [2] = 
            {
               Location = 17, 
               Modifier = -5, 
            }, 
            [3] = 
            {
               Location = 2, 
               Modifier = -10, 
            }, 
         }, 
         ItemType = "container", 
         WearFlags = 
         {
            [0] = "Take", 
            [19] = "Floating", 
            [11] = "Waist", 
         }, 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 2000, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 20, 
            [5] = 0, 
            [0] = 5000, 
         }, 
         Layers = 4, 
         Description = "A repulsor sled would fit around the bottom of a hutt quite well.", 
         Name = "repulsor sled", 
         ShortDescr = "a repulsor sled", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32258, 
      }, 
      [32257] = 
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
            [3] = 
            {
               Location = 25, 
               Modifier = 1, 
            }, 
         }, 
         ItemType = "crystal", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Flags = 
         {
            [3] = "HuttSize", 
         }, 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 1000, 
         WearFlags = 
         {
            [1] = "Finger", 
            [0] = "Take", 
         }, 
         Layers = 0, 
         Description = "A ring with a large crystal.", 
         Name = "crystal ring", 
         ShortDescr = "a crystal ring", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32257, 
      }, 
      [32256] = 
      {
         Affects = 
         {
            [1] = 
            {
               Location = 35, 
               Modifier = -10, 
            }, 
            [2] = 
            {
               Location = 32, 
               Modifier = -10, 
            }, 
            [3] = 
            {
               Location = 39, 
               Modifier = -10, 
            }, 
            [4] = 
            {
               Location = 52, 
               Modifier = -10, 
            }, 
            [5] = 
            {
               Location = 36, 
               Modifier = -10, 
            }, 
            [6] = 
            {
               Location = 37, 
               Modifier = -10, 
            }, 
            [7] = 
            {
               Location = 45, 
               Modifier = -10, 
            }, 
         }, 
         ItemType = "armor", 
         WearFlags = 
         {
            [0] = "Take", 
            [9] = "Shield", 
         }, 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 2300, 
         ObjectValues = 
         {
            [1] = 15, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Layers = 0, 
         Description = "A personal energy shield emits a strong protective bubble.", 
         Name = "personal energy shield", 
         ShortDescr = "a personal energy shield", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32256, 
      }, 
      [32200] = 
      {
         Affects = 
         {
            [1] = 
            {
               Location = 18, 
               Modifier = -1, 
            }, 
         }, 
         ItemType = "weapon", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Weight = 10, 
         ActionDescription = "", 
         Cost = 1500, 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 6, 
            [3] = 11, 
            [4] = 1000, 
            [5] = 1000, 
            [0] = 0, 
         }, 
         Layers = 0, 
         Description = "A imperial guards force pike was left here.", 
         Name = "force pike staff", 
         ShortDescr = "a force pike", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32200, 
      }, 
      [32201] = 
      {
         ItemType = "furniture", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "A galactic net message terminal is installed on the wall here.", 
         Name = "terminal board message", 
         ShortDescr = "a terminal", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "A small computer terminal is installed on the wall for passengers to\
\13leave comments to the operators. To learn more about its usage type\
\13'HELP MESSAGE'.\
\13", 
               Keyword = "terminal board message", 
            }, 
         }, 
         Vnum = 32201, 
      }, 
      [32202] = 
      {
         Affects = 
         {
            [1] = 
            {
               Location = 18, 
               Modifier = 1, 
            }, 
         }, 
         ItemType = "armor", 
         ObjectValues = 
         {
            [1] = 1, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Flags = 
         {
            [31] = "HumanSize", 
         }, 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [3] = "Body", 
         }, 
         Layers = 2, 
         Description = "Part of a black uniform lies crumpled on the floor.", 
         Name = "shirt top black imperial trooper uniform", 
         ShortDescr = "a black imperial troopers shirt", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32202, 
      }, 
      [32203] = 
      {
         ItemType = "trash", 
         WearFlags = 
         {
            [0] = "Take", 
            [5] = "Legs", 
         }, 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Layers = 1, 
         Description = "Part of a black uniform lies crumpled on the floor.", 
         Name = "plants leggings trousers slacks black imperial trooper uniform", 
         ShortDescr = "black imperial trooper leggings", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32203, 
      }, 
      [32204] = 
      {
         ItemType = "armor", 
         ObjectValues = 
         {
            [1] = 4, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Flags = 
         {
            [31] = "HumanSize", 
            [18] = "SmallSize", 
            [19] = "LargeSize", 
         }, 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [11] = "Waist", 
         }, 
         Layers = 60, 
         Description = "A black belt was left here.", 
         Name = "belt black imperial trooper", 
         ShortDescr = "a black belt", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32204, 
      }, 
      [32205] = 
      {
         ItemType = "armor", 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Flags = 
         {
            [31] = "HumanSize", 
         }, 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [6] = "Feet", 
         }, 
         Layers = 0, 
         Description = "Some high cut black boots are here.", 
         Name = "boots black imperial trooper", 
         ShortDescr = "some high cut black boots", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32205, 
      }, 
      [32206] = 
      {
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
         Flags = 
         {
            [31] = "HumanSize", 
         }, 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [4] = "Head", 
         }, 
         Layers = 0, 
         Description = "A shiney black object is here.", 
         Name = "helmet black imperial trooper", 
         ShortDescr = "a black imperial troopers helmet", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32206, 
      }, 
      [32207] = 
      {
         ItemType = "drink_container", 
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 3, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 3, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Layers = 0, 
         Description = "A glass of corellian ale is here.", 
         Name = "glass corellian ale", 
         ShortDescr = "a glass of corellian ale", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32207, 
      }, 
      [32208] = 
      {
         ItemType = "fountain", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 1000, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 1000, 
         }, 
         Layers = 0, 
         Description = "A drinking fountain provides fresh water.", 
         Name = "drinking fountain water", 
         ShortDescr = "a drinking fountain", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32208, 
      }, 
      [32209] = 
      {
         ItemType = "trash", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 20, 
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
         Description = "Some hydrospanners might come in handy.", 
         Name = "hydrospanners", 
         ShortDescr = "some hydrospanners", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32209, 
      }, 
      [32210] = 
      {
         ItemType = "toolkit", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 50, 
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
         Description = "A toolkit was left here.", 
         Name = "toolkit toolbox", 
         ShortDescr = "a toolkit", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32210, 
      }, 
      [32211] = 
      {
         Affects = 
         {
            [1] = 
            {
               Location = 40, 
               Modifier = 10, 
            }, 
         }, 
         ItemType = "armor", 
         ObjectValues = 
         {
            [1] = 3, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Flags = 
         {
            [31] = "HumanSize", 
         }, 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 45, 
         WearFlags = 
         {
            [0] = "Take", 
            [5] = "Legs", 
            [3] = "Body", 
         }, 
         Layers = 10, 
         Description = "Some technicians coveralls are getting walked on.", 
         Name = "technicians coveralls", 
         ShortDescr = "some coveralls", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32211, 
      }, 
      [32212] = 
      {
         ItemType = "drink_container", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 5, 
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 6, 
            [3] = 1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         Layers = 0, 
         Description = "A glass of juri juice is here.", 
         Name = "juri juice", 
         ShortDescr = "a glass of juri juice", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32212, 
      }, 
      [32213] = 
      {
         ItemType = "drink_container", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 4, 
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 5, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         Layers = 0, 
         Description = "A glass of brandal is here.", 
         Name = "vistulo brandale", 
         ShortDescr = "a glass of brandal", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32213, 
      }, 
      [32214] = 
      {
         ItemType = "drink_container", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 6, 
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 2, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         Layers = 0, 
         Description = "A glass of kibshae is here.", 
         Name = "kibshae", 
         ShortDescr = "a glass of kibshae", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32214, 
      }, 
      [32215] = 
      {
         Affects = 
         {
            [1] = 
            {
               Location = 5, 
               Modifier = 1, 
            }, 
         }, 
         ItemType = "armor", 
         ObjectValues = 
         {
            [1] = 3, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Flags = 
         {
            [31] = "HumanSize", 
         }, 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 30, 
         WearFlags = 
         {
            [0] = "Take", 
            [3] = "Body", 
         }, 
         Layers = 46, 
         Description = "Part of a grey imperial suit is getting trampled.", 
         Name = "grey imperial uniform top", 
         ShortDescr = "grey uniform top", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32215, 
      }, 
      [32216] = 
      {
         Affects = 
         {
            [1] = 
            {
               Location = 5, 
               Modifier = 1, 
            }, 
         }, 
         ItemType = "armor", 
         ObjectValues = 
         {
            [1] = 3, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Flags = 
         {
            [31] = "HumanSize", 
         }, 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 30, 
         WearFlags = 
         {
            [0] = "Take", 
            [5] = "Legs", 
         }, 
         Layers = 46, 
         Description = "Part of a grey imperial suit is getting trampled.", 
         Name = "grey imperial uniform bottom", 
         ShortDescr = "grey uniform pants", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32216, 
      }, 
      [32217] = 
      {
         Affects = 
         {
            [1] = 
            {
               Location = 3, 
               Modifier = 1, 
            }, 
         }, 
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
         Flags = 
         {
            [31] = "HumanSize", 
         }, 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 10, 
         WearFlags = 
         {
            [0] = "Take", 
            [4] = "Head", 
         }, 
         Layers = 0, 
         Description = "A grey cap is getting dirty on the floor.", 
         Name = "grey imperial cap", 
         ShortDescr = "a grey imperial cap", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32217, 
      }, 
      [32218] = 
      {
         Affects = 
         {
            [1] = 
            {
               Location = 14, 
               Modifier = -10, 
            }, 
         }, 
         ItemType = "armor", 
         ObjectValues = 
         {
            [1] = 8, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Flags = 
         {
            [31] = "HumanSize", 
            [19] = "LargeSize", 
         }, 
         Weight = 5, 
         ActionDescription = "", 
         Cost = 50, 
         WearFlags = 
         {
            [0] = "Take", 
            [10] = "About", 
         }, 
         Layers = 96, 
         Description = "A hooded cloak is crumled up on the floor here.", 
         Name = "ooded cloak", 
         ShortDescr = "a hooded cloak", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32218, 
      }, 
      [32219] = 
      {
         Affects = 
         {
            [1] = 
            {
               Location = 19, 
               Modifier = 2, 
            }, 
         }, 
         ItemType = "armor", 
         WearFlags = 
         {
            [0] = "Take", 
            [3] = "Body", 
         }, 
         Weight = 2, 
         ActionDescription = "", 
         Cost = 70, 
         ObjectValues = 
         {
            [1] = 1, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Layers = 4, 
         Description = "A light tunic is getting trampled.", 
         Name = "tunic", 
         ShortDescr = "a light tunic", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32219, 
      }, 
      [32220] = 
      {
         Affects = 
         {
            [1] = 
            {
               Location = 14, 
               Modifier = 20, 
            }, 
         }, 
         ItemType = "armor", 
         WearFlags = 
         {
            [0] = "Take", 
            [5] = "Legs", 
         }, 
         Weight = 2, 
         ActionDescription = "", 
         Cost = 70, 
         ObjectValues = 
         {
            [1] = 1, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Layers = 6, 
         Description = "Some light pants are getting trampled.", 
         Name = "pants", 
         ShortDescr = "some light pants", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32220, 
      }, 
      [32221] = 
      {
         ItemType = "key", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "Wonder what that keycard is for...", 
         Name = "keycard card", 
         ShortDescr = "a keycard", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32221, 
      }, 
      [32222] = 
      {
         Affects = 
         {
            [1] = 
            {
               Location = 3, 
               Modifier = -1, 
            }, 
            [2] = 
            {
               Location = 25, 
               Modifier = -1, 
            }, 
         }, 
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
         Flags = 
         {
            [31] = "HumanSize", 
         }, 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 200, 
         WearFlags = 
         {
            [0] = "Take", 
            [4] = "Head", 
         }, 
         Layers = 0, 
         Description = "A helmet has been kicked around.", 
         Name = "trooper rebel alliance helmet", 
         ShortDescr = "a rebel alliance trooper helmet", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32222, 
      }, 
      [32223] = 
      {
         Affects = 
         {
            [1] = 
            {
               Location = 14, 
               Modifier = -20, 
            }, 
         }, 
         ItemType = "armor", 
         ObjectValues = 
         {
            [1] = 8, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Flags = 
         {
            [31] = "HumanSize", 
         }, 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 125, 
         WearFlags = 
         {
            [0] = "Take", 
            [6] = "Feet", 
         }, 
         Layers = 112, 
         Description = "Some boots are nocked over on the floor.", 
         Name = "military black boots", 
         ShortDescr = "military cut black boots", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32223, 
      }, 
      [32224] = 
      {
         ItemType = "armor", 
         ObjectValues = 
         {
            [1] = 4, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Flags = 
         {
            [31] = "HumanSize", 
         }, 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 80, 
         WearFlags = 
         {
            [0] = "Take", 
            [5] = "Legs", 
         }, 
         Layers = 48, 
         Description = "Part of a black uniform is here.", 
         Name = "black uniform pants", 
         ShortDescr = "black uniform pants", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32224, 
      }, 
      [32225] = 
      {
         Affects = 
         {
            [1] = 
            {
               Location = 17, 
               Modifier = -2, 
            }, 
            [2] = 
            {
               Location = 17, 
               Modifier = -4, 
            }, 
         }, 
         ItemType = "container", 
         WearFlags = 
         {
            [0] = "Take", 
            [11] = "Waist", 
         }, 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 300, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         Layers = 24, 
         Description = "A utility belt lies here.", 
         Name = "black utility belt", 
         ShortDescr = "a black utility belt", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32225, 
      }, 
      [32226] = 
      {
         Affects = 
         {
            [1] = 
            {
               Location = 2, 
               Modifier = 1, 
            }, 
         }, 
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
         Flags = 
         {
            [31] = "HumanSize", 
         }, 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 60, 
         WearFlags = 
         {
            [0] = "Take", 
            [3] = "Body", 
         }, 
         Layers = 6, 
         Description = "A white shirt is getting dirty lying on the floor.", 
         Name = "white rebel alliance crested shirt", 
         ShortDescr = "a white crested shirt", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32226, 
      }, 
      [32227] = 
      {
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
         Flags = 
         {
            [31] = "HumanSize", 
         }, 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 150, 
         WearFlags = 
         {
            [0] = "Take", 
            [3] = "Body", 
         }, 
         Layers = 24, 
         Description = "A tough vest is here.", 
         Name = "rebel alliance vest", 
         ShortDescr = "a Rebel Alliance vest", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32227, 
      }, 
      [32228] = 
      {
         Affects = 
         {
            [1] = 
            {
               Location = 18, 
               Modifier = 2, 
            }, 
         }, 
         ItemType = "container", 
         WearFlags = 
         {
            [0] = "Take", 
            [11] = "Waist", 
         }, 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 20, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 9, 
         }, 
         Layers = 64, 
         Description = "A holster could hold a large pistol.", 
         Name = "pistol holster", 
         ShortDescr = "a holster", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32228, 
      }, 
      [32229] = 
      {
         Affects = 
         {
            [1] = 
            {
               Location = 3, 
               Modifier = 1, 
            }, 
            [2] = 
            {
               Location = 17, 
               Modifier = -2, 
            }, 
         }, 
         ItemType = "comlink", 
         WearFlags = 
         {
            [0] = "Take", 
            [16] = "Ears", 
         }, 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 300, 
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
         Description = "A headset of some sort is buzzing on the ground.", 
         Name = "comlink headset", 
         ShortDescr = "a comlink headset", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32229, 
      }, 
      [32230] = 
      {
         ItemType = "spice", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 100, 
         ObjectValues = 
         {
            [1] = 10, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         Layers = 0, 
         Description = "A stim of spice shouldn't be left lying around like that.", 
         Name = "ryll spice", 
         ShortDescr = "a stim of ryll", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32230, 
      }, 
      [32231] = 
      {
         ItemType = "furniture", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "A bacta tank is here for the severly wounded.", 
         Name = "bacta tank", 
         ShortDescr = "a bacta tank", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32231, 
      }, 
      [32232] = 
      {
         ItemType = "device", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Weight = 5, 
         ActionDescription = "", 
         Cost = 250, 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 5, 
            [3] = 53, 
            [4] = 0, 
            [5] = 0, 
            [0] = 100, 
         }, 
         Layers = 0, 
         Description = "A scanner is very useful in analysing oponents and equipment.", 
         Name = "scanner", 
         ShortDescr = "a scanner", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32232, 
      }, 
      [32233] = 
      {
         Affects = 
         {
            [1] = 
            {
               Location = 18, 
               Modifier = -4, 
            }, 
         }, 
         ItemType = "weapon", 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 4, 
            [3] = 2, 
            [4] = 100, 
            [5] = 100, 
            [0] = 0, 
         }, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 50, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Layers = 0, 
         Description = "A vibro-shiv could give somebody a sore foot.", 
         Name = "vibroshiv shiv blade vibro-shiv", 
         ShortDescr = "a vibro-shiv", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32233, 
      }, 
      [32234] = 
      {
         ItemType = "battery", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 20, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 100, 
         }, 
         Layers = 0, 
         Description = "A battery might come in handy.", 
         Name = "battery", 
         ShortDescr = "a battery", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32234, 
      }, 
      [32235] = 
      {
         Affects = 
         {
            [1] = 
            {
               Location = 2, 
               Modifier = -2, 
            }, 
            [2] = 
            {
               Location = 18, 
               Modifier = -1, 
            }, 
         }, 
         ItemType = "armor", 
         ObjectValues = 
         {
            [1] = 10, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Flags = 
         {
            [31] = "HumanSize", 
         }, 
         Weight = 8, 
         ActionDescription = "", 
         Cost = 770, 
         WearFlags = 
         {
            [0] = "Take", 
            [4] = "Head", 
         }, 
         Layers = 0, 
         Description = "An imperial gunners helmet is here for you to kick around.", 
         Name = "imperial gunners helmet", 
         ShortDescr = "an imperial gunners helmet", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32235, 
      }, 
      [32236] = 
      {
         ItemType = "armor", 
         ObjectValues = 
         {
            [1] = 4, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Flags = 
         {
            [31] = "HumanSize", 
         }, 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 35, 
         WearFlags = 
         {
            [0] = "Take", 
            [7] = "Hands", 
         }, 
         Layers = 0, 
         Description = "Some black fingers were left on the floor.", 
         Name = "black gloves", 
         ShortDescr = "some black gloves", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32236, 
      }, 
      [32237] = 
      {
         ItemType = "armor", 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Flags = 
         {
            [13] = "Inventory", 
            [19] = "LargeSize", 
            [3] = "HuttSize", 
         }, 
         Weight = 4, 
         ActionDescription = "", 
         Cost = 50, 
         WearFlags = 
         {
            [0] = "Take", 
            [10] = "About", 
         }, 
         Layers = 96, 
         Description = "An enormous cloak is getting trampled.", 
         Name = "cloak", 
         ShortDescr = "an enormous cloak", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32237, 
      }, 
      [32238] = 
      {
         Affects = 
         {
            [1] = 
            {
               Location = 26, 
               Modifier = 512, 
            }, 
            [2] = 
            {
               Location = 18, 
               Modifier = -4, 
            }, 
            [3] = 
            {
               Location = 26, 
               Modifier = 32, 
            }, 
         }, 
         ItemType = "armor", 
         WearFlags = 
         {
            [0] = "Take", 
            [17] = "Eyes", 
         }, 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 2800, 
         ObjectValues = 
         {
            [1] = 3, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Layers = 0, 
         Description = "Some goggles were discarded here.", 
         Name = "infrared goggles", 
         ShortDescr = "infrared goggles", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32238, 
      }, 
      [32239] = 
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
         ItemType = "armor", 
         ObjectValues = 
         {
            [1] = 1, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Flags = 
         {
            [31] = "HumanSize", 
         }, 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [3] = "Body", 
         }, 
         Layers = 6, 
         Description = "Part of a black bodyglove suit is here.", 
         Name = "top bodyglove", 
         ShortDescr = "black bodyglove top", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32239, 
      }, 
      [32240] = 
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
         ItemType = "armor", 
         ObjectValues = 
         {
            [1] = 1, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Flags = 
         {
            [31] = "HumanSize", 
         }, 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [5] = "Legs", 
         }, 
         Layers = 6, 
         Description = "Part of a black bodyglove suit is here.", 
         Name = "bottom bodyglove", 
         ShortDescr = "black bodyglove bottom", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32240, 
      }, 
      [32241] = 
      {
         ObjectValues = 
         {
            [1] = 6, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "armor", 
         MudProgs = 
         {
            [1] = 
            {
               Code = "if clan($n) != The Empire\
mpechoat $n What do you think you are a stormtrooper?\
mpechoat $n Go join the empire if you want to wear that!\
mpechoaround $n $n thinks $ss a stormtrooper.\
mpforce $n remove s32241 \
endif\
", 
               MudProgType = "wear_prog", 
               Arguments = "100", 
            }, 
         }, 
         Flags = 
         {
            [31] = "HumanSize", 
         }, 
         Weight = 5, 
         ActionDescription = "", 
         Cost = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [4] = "Head", 
         }, 
         Layers = 56, 
         Description = "A stormtrooper helmet was dropped here.", 
         Name = "stormtrooper helmet s32241", 
         ShortDescr = "a stormtrooper helmet", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32241, 
      }, 
      [32242] = 
      {
         ItemType = "armor", 
         ObjectValues = 
         {
            [1] = 4, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Flags = 
         {
            [31] = "HumanSize", 
         }, 
         Weight = 3, 
         ActionDescription = "", 
         Cost = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [7] = "Hands", 
         }, 
         Layers = 56, 
         Description = "Stormtrooper gloves were dropped here.", 
         Name = "stormtrooper gloves", 
         ShortDescr = "stormtrooper gloves", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32242, 
      }, 
      [32243] = 
      {
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
         Flags = 
         {
            [31] = "HumanSize", 
         }, 
         Weight = 3, 
         ActionDescription = "", 
         Cost = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [8] = "Arms", 
         }, 
         Layers = 56, 
         Description = "Some stormtrooper arm plates were left here.", 
         Name = "stormtrooper arm plates", 
         ShortDescr = "stormtrooper arm plates", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32243, 
      }, 
      [32244] = 
      {
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
         Flags = 
         {
            [31] = "HumanSize", 
         }, 
         Weight = 3, 
         ActionDescription = "", 
         Cost = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
         }, 
         Layers = 56, 
         Description = "Stormtrooper shoulder plates were discarded here.", 
         Name = "stormtrooper shoulder plates", 
         ShortDescr = "stormtrooper shoulder plates", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32244, 
      }, 
      [32245] = 
      {
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
         Flags = 
         {
            [31] = "HumanSize", 
         }, 
         Weight = 3, 
         ActionDescription = "", 
         Cost = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [12] = "Wrist", 
         }, 
         Layers = 56, 
         Description = "Stormtrooper hand plates were discarded here.", 
         Name = "stormtrooper hand plates", 
         ShortDescr = "stormtrooper hand plates", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32245, 
      }, 
      [32246] = 
      {
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
         Flags = 
         {
            [31] = "HumanSize", 
         }, 
         Weight = 7, 
         ActionDescription = "", 
         Cost = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [3] = "Body", 
         }, 
         Layers = 56, 
         Description = "A white stormtrooper chest plate was left here.", 
         Name = "stormtrooper chest plate", 
         ShortDescr = "a stormtrooper chest plate", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32246, 
      }, 
      [32247] = 
      {
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
         Flags = 
         {
            [31] = "HumanSize", 
         }, 
         Weight = 3, 
         ActionDescription = "", 
         Cost = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [11] = "Waist", 
         }, 
         Layers = 56, 
         Description = "A stormtrooper groin plate was left here.", 
         Name = "stormtrooper groin plate", 
         ShortDescr = "a stormtrooper groin plate", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32247, 
      }, 
      [32248] = 
      {
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
         Flags = 
         {
            [31] = "HumanSize", 
         }, 
         Weight = 6, 
         ActionDescription = "", 
         Cost = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [5] = "Legs", 
         }, 
         Layers = 56, 
         Description = "Some stormtrooper leg armor was left here.", 
         Name = "stormtrooper leg plates", 
         ShortDescr = "stormtrooper leg plates", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32248, 
      }, 
      [32249] = 
      {
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
         Flags = 
         {
            [31] = "HumanSize", 
         }, 
         Weight = 3, 
         ActionDescription = "", 
         Cost = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [6] = "Feet", 
         }, 
         Layers = 56, 
         Description = "Some white boots are here.", 
         Name = "stormtrooper boots", 
         ShortDescr = "white stormtrooper boots", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32249, 
      }, 
      [32250] = 
      {
         Affects = 
         {
            [1] = 
            {
               Location = 17, 
               Modifier = -5, 
            }, 
         }, 
         ItemType = "container", 
         WearFlags = 
         {
            [0] = "Take", 
            [11] = "Waist", 
         }, 
         Weight = 3, 
         ActionDescription = "", 
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         Layers = 64, 
         Description = "A very useful utility belt was misplaced here.", 
         Name = "stormtrooper utility belt", 
         ShortDescr = "a stormtrooper utility belt", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32250, 
      }, 
      [32251] = 
      {
         Affects = 
         {
            [1] = 
            {
               Location = 17, 
               Modifier = -5, 
            }, 
         }, 
         ItemType = "container", 
         WearFlags = 
         {
            [0] = "Take", 
            [10] = "About", 
         }, 
         Weight = 6, 
         ActionDescription = "", 
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 50, 
         }, 
         Layers = 96, 
         Description = "A black backpack bearing the imperial crest was left here.", 
         Name = "stormtrooper backpack", 
         ShortDescr = "a stormtrooper backpack", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32251, 
      }, 
      [32252] = 
      {
         ItemType = "food", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Weight = 2, 
         ActionDescription = "", 
         Cost = 5, 
         ObjectValues = 
         {
            [1] = 20, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 20, 
         }, 
         Layers = 0, 
         Description = "A packaged ration is here, waiting to be eaten.", 
         Name = "small ration", 
         ShortDescr = "a small packaged ration", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32252, 
      }, 
      [32253] = 
      {
         ItemType = "drink_container", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 10, 
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
         Description = "A belt sized canteen was dropped here.", 
         Name = "small canteen", 
         ShortDescr = "a small canteen", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32253, 
      }, 
      [32254] = 
      {
         ItemType = "medpac", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 100, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         Layers = 0, 
         Description = "A medpac could be very useful.", 
         Name = "small medpack", 
         ShortDescr = "a medpac", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32254, 
      }, 
      [32255] = 
      {
         ItemType = "spacecraft", 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
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
         Description = "A space barge is docked here for repairs.", 
         Name = "space barge", 
         ShortDescr = "a space barge", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 32255, 
      }, 
   }, 
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
   ResetMessage = "", 
   Name = "Spacecraft and Orbiting Shipyards", 
   HighEconomy = 0, 
   ResetFrequency = 10, 
   Author = "Durga", 
}
