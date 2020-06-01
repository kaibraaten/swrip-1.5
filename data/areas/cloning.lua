-- Cloning Station
-- Last saved Monday 01-Jun-2020 11:08:46

AreaEntry
{
   Name = "Cloning Station", 
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
      [10000] = 
      {
         Name = "firstmob", 
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
         Vnum = 10000, 
         LongDescr = "Some god abandoned a newly created firstmob here.\
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
         ShortDescr = "a newly created firstmob", 
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
      [10001] = 
      {
         Name = "doctor Bnokkt", 
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
         Vnum = 10001, 
         LongDescr = "Doctor Bnokkt is the head of the cloning facilities.\
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
         ShortDescr = "Doctor Bnokkt", 
         DamRoll = 10, 
         Height = 0, 
         Race = "Human", 
         Position = "standing", 
         Credits = 1000, 
         ArmorClass = -25, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
         }, 
      }, 
      [10002] = 
      {
         Name = "c-7hp64 personal assistant droid", 
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
            HitPlus = 5000, 
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
         Vnum = 10002, 
         Race = "Human", 
         LongDescr = "A c-7hp64 personal assistant droid is here.\
", 
         NumberOfAttacks = 0, 
         Level = 50, 
         Description = "", 
         Damage = 
         {
            DamNoDice = 1, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         ShortDescr = "a c-7hp64 personal assistant droid", 
         DamRoll = 0, 
         Height = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               Code = "mpoload 10003\
", 
               MudProgType = "death_prog", 
            }, 
         }, 
         Position = "standing", 
         Credits = 0, 
         ArmorClass = -25, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [26] = "Droid", 
         }, 
      }, 
      [10003] = 
      {
         Name = "facility guard", 
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
         HitRoll = 20, 
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
         Vnum = 10003, 
         LongDescr = "A Facility guard stands at attention.\
", 
         NumberOfAttacks = 0, 
         Level = 100, 
         Description = "", 
         Damage = 
         {
            DamNoDice = 10, 
            DamSizeDice = 4, 
            DamPlus = 2, 
         }, 
         ShortDescr = "a facility guard", 
         DamRoll = 20, 
         Height = 0, 
         Race = "Human", 
         Position = "standing", 
         Credits = 0, 
         ArmorClass = -150, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
      }, 
      [10004] = 
      {
         Name = "Cloning Nurse", 
         Sex = "undistinguished", 
         Weight = 0, 
         Alignment = 0, 
         DefaultPosition = "standing", 
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
         Vnum = 10004, 
         Race = "Human", 
         LongDescr = "A shapely nurse is standing here, handing out hospital clothes.\
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
         ShortDescr = "a shapely nurse", 
         DamRoll = 0, 
         Height = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "Hello Hi", 
               Code = "say Why hello, oh you poor thing!\
say Here, let me give you theese.\
mpechoat $n The nurse gives you a compassionate look.\
mpoload 10004\
give scrubs $n\
mpforce $n wear scrubs\
emote giggles as she helps you into your new garb.\
say There! Much better!\
smile $n\
", 
               MudProgType = "speech_prog", 
            }, 
            [2] = 
            {
               Arguments = "blushes.", 
               Code = "if sex($n) == 1\
say Oh stop it! It's nothing I haven't seen before.\
giggle\
'Besides, it's nothing to be ashamed of.\
say Size really doesn't matter.\
else\
if sex($n) == 0\
say Oh honey, you really ought to work out more.\
shake\
else\
if sex($n) == 2\
say It's such a shame to see a woman letting herself go like that.\
tisk\
endif\
endif\
endif\
", 
               MudProgType = "act_prog", 
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
      [10005] = 
      {
         Name = "A Vending Machine", 
         Sex = "undistinguished", 
         Weight = 0, 
         Alignment = 0, 
         DefaultPosition = "standing", 
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
            Speaking = 
            {
               [27] = "binary", 
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
         Vnum = 10005, 
         ArmorClass = 0, 
         LongDescr = "A vending machine rests against the wall here.\
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
         ShortDescr = "A vending machine", 
         DamRoll = 0, 
         Height = 0, 
         Race = "Astromech", 
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
            KeeperShortDescr = "A vending machine", 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
         }, 
      }, 
      [10009] = 
      {
         Name = "clerk", 
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
         Vnum = 10009, 
         LongDescr = "A clerk is here to take your payment.\
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
         ShortDescr = "a clerk", 
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
   }, 
   ResetMessage = "&CThe filtered air carries the distinct scent of medicine.", 
   Resets = 
   {
      [1] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10001, 
         Arg1 = 10009, 
         Arg2 = 1, 
      }, 
      [2] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10010, 
         Arg1 = 10001, 
         Arg2 = 1, 
      }, 
      [3] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10010, 
         Arg1 = 10002, 
         Arg2 = 1, 
      }, 
      [4] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10010, 
         Arg1 = 10003, 
         Arg2 = 1, 
      }, 
      [5] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10007, 
         Arg1 = 10005, 
         Arg2 = 1, 
      }, 
      [6] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg1 = 10424, 
         Arg2 = 1, 
      }, 
      [7] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg1 = 10314, 
         Arg2 = 1, 
      }, 
      [8] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10009, 
         Arg1 = 10004, 
         Arg2 = 1, 
      }, 
      [9] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg1 = 10004, 
         Arg2 = 1, 
      }, 
      [10] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg1 = 10004, 
         Arg2 = 1, 
      }, 
      [11] = 
      {
         Command = "G", 
         MiscData = 1, 
         Arg1 = 10004, 
         Arg2 = 1, 
      }, 
      [12] = 
      {
         Command = "O", 
         MiscData = 1, 
         Arg3 = 10009, 
         Arg1 = 10001, 
         Arg2 = 1, 
      }, 
   }, 
   Author = "Durga", 
   VnumRanges = 
   {
      Mob = 
      {
         Last = 10009, 
         First = 10000, 
      }, 
      Room = 
      {
         Last = 10011, 
         First = 10000, 
      }, 
      Object = 
      {
         Last = 10009, 
         First = 10000, 
      }, 
   }, 
   Objects = 
   {
      [10000] = 
      {
         Name = "bookend", 
         Vnum = 10000, 
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
         Description = "Some god dropped a newly created bookend here.", 
         ShortDescr = "a newly created bookend", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
         ItemType = "trash", 
      }, 
      [10001] = 
      {
         Name = "sparti cloning cylinder", 
         Vnum = 10001, 
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
         Description = "A sparti cloning cylinder is here.", 
         ShortDescr = "a sparti cloning cylinder", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
         ItemType = "trash", 
      }, 
      [10002] = 
      {
         Name = "desc", 
         Vnum = 10002, 
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
         Description = "Some god dropped a newly created desc here.", 
         ShortDescr = "a newly created desc", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
         ItemType = "trash", 
      }, 
      [10003] = 
      {
         Name = "facility deed ", 
         Vnum = 10003, 
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
         Description = "OOooOOoo the deed to the cloning facilities is here.", 
         ShortDescr = "the deed", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
         ItemType = "government", 
      }, 
      [10004] = 
      {
         Name = "Hospital Scrubs", 
         Vnum = 10004, 
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         Layers = 0, 
         Description = "White hospital scrubs have been discarded in a pile here.", 
         ShortDescr = "White hospital scrubs", 
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
         Cost = 0, 
         Weight = 3, 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
            [10] = "About", 
         }, 
         ItemType = "armor", 
      }, 
      [10009] = 
      {
         Name = "sparti cloning cylinder", 
         Vnum = 10009, 
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
         Description = "Some god dropped a newly created sparti cloning cylinder here.", 
         ShortDescr = "a newly created sparti cloning cylinder", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
         ItemType = "trash", 
      }, 
   }, 
   Filename = "cloning.lua", 
   Rooms = 
   {
      [10000] = 
      {
         Name = "Inside a Sparti Cloning Cylinder", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [18] = "NoDrop", 
            [23] = "Hotel", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "&cYou awaken inside a tube of semi-viscous grey-blue liquid. You find you\
have only glimpses of what scientists would describe as muscle memory. You\
remember how to function, but not how you can across the knowledge to\
begin with. Outside the tank you see people preparing to open the tank,\
there are things you recognise...flash-readers and the sort. But you still\
can't recall how you know. \
your original has died.\
 \
&WRemember to clone again. You might regret it if you don't.\
", 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "enters", 
               Code = "mpat 122 mpecho $n enters from a cloning chamber.\
", 
               MudProgType = "act_prog", 
            }, 
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "somewhere", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10009, 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [11] = "Hidden", 
               }, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10000, 
         TeleDelay = 0, 
      }, 
      [10001] = 
      {
         Name = "Pay Counter", 
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
         Description = "After the long wait you are finally here. Now all that is left to do is to\
pay the clerk, sign a few papers and give a tissue sample. (To do this\
type \"clone\")\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10007, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10001, 
         TeleDelay = 0, 
      }, 
      [10002] = 
      {
         Name = "In a Small Sterile Room", 
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
         Description = "This small room smells strongly of antiseptic.  There is a large flat\
table, that is covered with removable paper.  You assume that this is\
where blood and tissue samples are taken, as well as where new clones are\
examined. There are several medical instruments hanging on hooks on the\
walls.  Some of them look to horrible to even imagine their use.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10003, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10002, 
         TeleDelay = 0, 
      }, 
      [10003] = 
      {
         Name = "A Clinic Hallway", 
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
         Description = "This small hallway leads from the lobby of the facilities to a set of\
locked blastdoors.  To the east is a small doctor's office.  To the west\
is a large room filled with exercise equipment.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10002, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10007, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10004, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10003, 
         TeleDelay = 0, 
      }, 
      [10004] = 
      {
         Name = "Exercise Room.", 
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
         Description = "This room is filled with various pieces of exercise equipment.   It is\
available for young clones to regain their strength as they become\
accustomed to their new forms after gestation and an accelerated growth\
period. All of the equipment has gauges to monitor the progress and vital\
signs of the clones.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10005, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10003, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10009, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10004, 
         TeleDelay = 0, 
      }, 
      [10005] = 
      {
         Name = "Rest Area", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [23] = "Hotel", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "This area of the complex is set up as a small lounge.  There are several\
couches and chairs scattered about the room, along with a few tables. A\
curtain at the back hides a few cots for those who are tired.\
 \
 \
You may quit and re-enter the game from here.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10004, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10005, 
         TeleDelay = 0, 
      }, 
      [10006] = 
      {
         Name = "Desert Landing Pad", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
            [4] = "CanLand", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "You stand upon a small landing pad on a relatively unknown planet somewhere\
in the core worlds. Dense jungle surrounds this clearing, and the only\
manmade structure visible is a small building to the north. \
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10007, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 32297, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10006, 
         TeleDelay = 0, 
      }, 
      [10007] = 
      {
         Name = "The cloning Facilities", 
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
         Description = "The actual livable portion of this building is small and almost bunkerlike.\
  The rest of the immense edifice lies below where you stand. Cloning\
requires considerable energy, and you can sense the hum of the engines\
under your feet. The owners of this establishment have salvaged a couple\
of cloning cylinders, found after the cloning wars, and turned them into a\
small but profitable business.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10003, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10008, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10006, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10010, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10007, 
         TeleDelay = 0, 
      }, 
      [10008] = 
      {
         Name = "Standing in Line", 
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
         Description = "You stand in a long line waiting for your turn to be cloned.\
There is nothing to do but stand here and wait.\
", 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               Code = "mpechoat $n You finally make it to the front of the line.\
mpechoaround $n $n Moves to the front of the line.\
mptransfer $n 10001\
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
               DestinationVnum = 10007, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10008, 
         TeleDelay = 0, 
      }, 
      [10009] = 
      {
         Name = "The Cloning Chamber", 
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
         Description = "This large room contains the tops of some cloning cylinders, but from the\
rumors you have heard, there must be many more below this level. Many\
pipes and wires run haphazardly from the cylinders.   There is no way to\
enter the cloning chambers from here.  You must go stand in line.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10004, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10009, 
         TeleDelay = 0, 
      }, 
      [10010] = 
      {
         Name = "The Office", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [10] = "Safe", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "This large office contains a very fine wood desk as well as several\
expensive looking paintings. There is a small tree in one corner of the\
room and a large bookcase on one wall.\
", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 10007, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Vnum = 10010, 
         TeleDelay = 0, 
      }, 
      [10011] = 
      {
         Name = "Storage Chamber", 
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
         Description = "", 
         Exits = 
         {
         }, 
         Vnum = 10011, 
         TeleDelay = 0, 
      }, 
   }, 
   LowEconomy = 130046569, 
}
