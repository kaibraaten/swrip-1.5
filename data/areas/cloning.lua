-- Cloning Station
-- Last saved Sunday 31-May-2020 15:51:33

AreaEntry
{
   ResetMessage = "&CThe filtered air carries the distinct scent of medicine.", 
   Filename = "cloning.lua", 
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
   Name = "Cloning Station", 
   Resets = 
   {
      [1] = 
      {
         Command = "M", 
         Arg1 = 10009, 
         Arg2 = 1, 
         Arg3 = 10001, 
         MiscData = 1, 
      }, 
      [2] = 
      {
         Command = "M", 
         Arg1 = 10001, 
         Arg2 = 1, 
         Arg3 = 10010, 
         MiscData = 1, 
      }, 
      [3] = 
      {
         Command = "M", 
         Arg1 = 10002, 
         Arg2 = 1, 
         Arg3 = 10010, 
         MiscData = 1, 
      }, 
      [4] = 
      {
         Command = "M", 
         Arg1 = 10003, 
         Arg2 = 1, 
         Arg3 = 10010, 
         MiscData = 1, 
      }, 
      [5] = 
      {
         Command = "M", 
         Arg1 = 10005, 
         Arg2 = 1, 
         Arg3 = 10007, 
         MiscData = 1, 
      }, 
      [6] = 
      {
         Arg2 = 1, 
         Command = "G", 
         Arg1 = 10424, 
         MiscData = 1, 
      }, 
      [7] = 
      {
         Arg2 = 1, 
         Command = "G", 
         Arg1 = 10314, 
         MiscData = 1, 
      }, 
      [8] = 
      {
         Command = "M", 
         Arg1 = 10004, 
         Arg2 = 1, 
         Arg3 = 10009, 
         MiscData = 1, 
      }, 
      [9] = 
      {
         Arg2 = 1, 
         Command = "G", 
         Arg1 = 10004, 
         MiscData = 1, 
      }, 
      [10] = 
      {
         Arg2 = 1, 
         Command = "G", 
         Arg1 = 10004, 
         MiscData = 1, 
      }, 
      [11] = 
      {
         Arg2 = 1, 
         Command = "G", 
         Arg1 = 10004, 
         MiscData = 1, 
      }, 
      [12] = 
      {
         Command = "O", 
         Arg1 = 10001, 
         Arg2 = 1, 
         Arg3 = 10009, 
         MiscData = 1, 
      }, 
   }, 
   Rooms = 
   {
      [10000] = 
      {
         Name = "Inside a Sparti Cloning Cylinder", 
         Flags = 
         {
            [2] = "NoMob", 
            [18] = "NoDrop", 
            [23] = "Hotel", 
         }, 
         Vnum = 10000, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "act_prog", 
               Code = "mpat 122 mpecho $n enters from a cloning chamber.\
", 
               Arguments = "enters", 
            }, 
         }, 
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
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "somewhere", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 10009, 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [11] = "Hidden", 
               }, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [10001] = 
      {
         Name = "Pay Counter", 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 10001, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Description = "After the long wait you are finally here. Now all that is left to do is to\
pay the clerk, sign a few papers and give a tissue sample. (To do this\
type \"clone\")\
", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "west", 
               Description = "", 
               DestinationVnum = 10007, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [10002] = 
      {
         Name = "In a Small Sterile Room", 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 10002, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Description = "This small room smells strongly of antiseptic.  There is a large flat\
table, that is covered with removable paper.  You assume that this is\
where blood and tissue samples are taken, as well as where new clones are\
examined. There are several medical instruments hanging on hooks on the\
walls.  Some of them look to horrible to even imagine their use.\
", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "west", 
               Description = "", 
               DestinationVnum = 10003, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [10003] = 
      {
         Name = "A Clinic Hallway", 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 10003, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Description = "This small hallway leads from the lobby of the facilities to a set of\
locked blastdoors.  To the east is a small doctor's office.  To the west\
is a large room filled with exercise equipment.\
", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Description = "", 
               DestinationVnum = 10002, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Description = "", 
               DestinationVnum = 10007, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "west", 
               Description = "", 
               DestinationVnum = 10004, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [10004] = 
      {
         Name = "Exercise Room.", 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 10004, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Description = "This room is filled with various pieces of exercise equipment.   It is\
available for young clones to regain their strength as they become\
accustomed to their new forms after gestation and an accelerated growth\
period. All of the equipment has gauges to monitor the progress and vital\
signs of the clones.\
", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Description = "", 
               DestinationVnum = 10005, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "east", 
               Description = "", 
               DestinationVnum = 10003, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "south", 
               Description = "", 
               DestinationVnum = 10009, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [10005] = 
      {
         Name = "Rest Area", 
         Flags = 
         {
            [23] = "Hotel", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 10005, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Description = "This area of the complex is set up as a small lounge.  There are several\
couches and chairs scattered about the room, along with a few tables. A\
curtain at the back hides a few cots for those who are tired.\
 \
 \
You may quit and re-enter the game from here.\
", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "south", 
               Description = "", 
               DestinationVnum = 10004, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [10006] = 
      {
         Name = "Desert Landing Pad", 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
            [4] = "CanLand", 
         }, 
         Vnum = 10006, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Description = "You stand upon a small landing pad on a relatively unknown planet somewhere\
in the core worlds. Dense jungle surrounds this clearing, and the only\
manmade structure visible is a small building to the north. \
", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Description = "", 
               DestinationVnum = 10007, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "east", 
               Description = "", 
               DestinationVnum = 32297, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [10007] = 
      {
         Name = "The cloning Facilities", 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 10007, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Description = "The actual livable portion of this building is small and almost bunkerlike.\
  The rest of the immense edifice lies below where you stand. Cloning\
requires considerable energy, and you can sense the hum of the engines\
under your feet. The owners of this establishment have salvaged a couple\
of cloning cylinders, found after the cloning wars, and turned them into a\
small but profitable business.\
", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Description = "", 
               DestinationVnum = 10003, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "east", 
               Description = "", 
               DestinationVnum = 10008, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "south", 
               Description = "", 
               DestinationVnum = 10006, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Key = -1, 
               Direction = "west", 
               Description = "", 
               DestinationVnum = 10010, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [10008] = 
      {
         Name = "Standing in Line", 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 10008, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Code = "mpechoat $n You finally make it to the front of the line.\
mpechoaround $n $n Moves to the front of the line.\
mptransfer $n 10001\
", 
               Arguments = "100", 
            }, 
         }, 
         Description = "You stand in a long line waiting for your turn to be cloned.\
There is nothing to do but stand here and wait.\
", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "west", 
               Description = "", 
               DestinationVnum = 10007, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [10009] = 
      {
         Name = "The Cloning Chamber", 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 10009, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Description = "This large room contains the tops of some cloning cylinders, but from the\
rumors you have heard, there must be many more below this level. Many\
pipes and wires run haphazardly from the cylinders.   There is no way to\
enter the cloning chambers from here.  You must go stand in line.\
", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Description = "", 
               DestinationVnum = 10004, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [10010] = 
      {
         Name = "The Office", 
         Flags = 
         {
            [10] = "Safe", 
         }, 
         Vnum = 10010, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Description = "This large office contains a very fine wood desk as well as several\
expensive looking paintings. There is a small tree in one corner of the\
room and a large bookcase on one wall.\
", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Description = "", 
               DestinationVnum = 10007, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
      [10011] = 
      {
         Name = "Storage Chamber", 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 10011, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         TeleDelay = 0, 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
      }, 
   }, 
   LevelRanges = 
   {
      Hard = 
      {
         Low = 0, 
         High = 105, 
      }, 
      Soft = 
      {
         Low = 0, 
         High = 103, 
      }, 
   }, 
   Author = "Durga", 
   Mobiles = 
   {
      [10000] = 
      {
         DefaultPosition = "standing", 
         LongDescr = "Some god abandoned a newly created firstmob here.\
", 
         Name = "firstmob", 
         Vnum = 10000, 
         HitChance = 
         {
            HitPlus = 0, 
            HitNoDice = 0, 
            HitSizeDice = 0, 
         }, 
         Weight = 0, 
         Race = "Human", 
         Alignment = 0, 
         DamRoll = 0, 
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
         Stats = 
         {
            Force = 0, 
            Intelligence = 0, 
            Luck = 0, 
            Strength = 0, 
            Dexterity = 0, 
            Wisdom = 0, 
            Constitution = 0, 
            Charisma = 0, 
         }, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
         }, 
         HitRoll = 0, 
         Position = "standing", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         NumberOfAttacks = 0, 
         ArmorClass = 0, 
         ShortDescr = "a newly created firstmob", 
         Level = 1, 
         Description = "", 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         Height = 0, 
         Credits = 0, 
         Sex = "undistinguished", 
      }, 
      [10001] = 
      {
         DefaultPosition = "standing", 
         LongDescr = "Doctor Bnokkt is the head of the cloning facilities.\
", 
         Name = "doctor Bnokkt", 
         Vnum = 10001, 
         HitChance = 
         {
            HitPlus = 500, 
            HitNoDice = 10, 
            HitSizeDice = 10, 
         }, 
         Weight = 0, 
         Race = "Human", 
         Alignment = 0, 
         DamRoll = 10, 
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
         Stats = 
         {
            Force = 0, 
            Intelligence = 0, 
            Luck = 0, 
            Strength = 0, 
            Dexterity = 0, 
            Wisdom = 0, 
            Constitution = 0, 
            Charisma = 0, 
         }, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
         }, 
         HitRoll = 10, 
         Position = "standing", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
         }, 
         NumberOfAttacks = 0, 
         ArmorClass = -25, 
         ShortDescr = "Doctor Bnokkt", 
         Level = 50, 
         Description = "", 
         Damage = 
         {
            DamSizeDice = 4, 
            DamNoDice = 5, 
            DamPlus = 2, 
         }, 
         Height = 0, 
         Credits = 1000, 
         Sex = "male", 
      }, 
      [10002] = 
      {
         DefaultPosition = "standing", 
         LongDescr = "A c-7hp64 personal assistant droid is here.\
", 
         Name = "c-7hp64 personal assistant droid", 
         Vnum = 10002, 
         HitChance = 
         {
            HitPlus = 5000, 
            HitNoDice = 10, 
            HitSizeDice = 10, 
         }, 
         Weight = 0, 
         Race = "Human", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "death_prog", 
               Code = "mpoload 10003\
", 
               Arguments = "100", 
            }, 
         }, 
         Alignment = 0, 
         DamRoll = 0, 
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
         Stats = 
         {
            Force = 0, 
            Intelligence = 0, 
            Luck = 0, 
            Strength = 0, 
            Dexterity = 0, 
            Wisdom = 0, 
            Constitution = 0, 
            Charisma = 0, 
         }, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
         }, 
         HitRoll = 0, 
         Position = "standing", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [26] = "Droid", 
         }, 
         NumberOfAttacks = 0, 
         ArmorClass = -25, 
         ShortDescr = "a c-7hp64 personal assistant droid", 
         Level = 50, 
         Description = "", 
         Damage = 
         {
            DamSizeDice = 4, 
            DamNoDice = 1, 
            DamPlus = 2, 
         }, 
         Height = 0, 
         Credits = 0, 
         Sex = "undistinguished", 
      }, 
      [10003] = 
      {
         DefaultPosition = "standing", 
         LongDescr = "A Facility guard stands at attention.\
", 
         Name = "facility guard", 
         Vnum = 10003, 
         HitChance = 
         {
            HitPlus = 1000, 
            HitNoDice = 20, 
            HitSizeDice = 10, 
         }, 
         Weight = 0, 
         Race = "Human", 
         Alignment = 0, 
         DamRoll = 20, 
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
         Stats = 
         {
            Force = 0, 
            Intelligence = 0, 
            Luck = 0, 
            Strength = 0, 
            Dexterity = 0, 
            Wisdom = 0, 
            Constitution = 0, 
            Charisma = 0, 
         }, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
         }, 
         HitRoll = 20, 
         Position = "standing", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         NumberOfAttacks = 0, 
         ArmorClass = -150, 
         ShortDescr = "a facility guard", 
         Level = 100, 
         Description = "", 
         Damage = 
         {
            DamSizeDice = 4, 
            DamNoDice = 10, 
            DamPlus = 2, 
         }, 
         Height = 0, 
         Credits = 0, 
         Sex = "undistinguished", 
      }, 
      [10004] = 
      {
         DefaultPosition = "standing", 
         LongDescr = "A shapely nurse is standing here, handing out hospital clothes.\
", 
         Name = "Cloning Nurse", 
         Vnum = 10004, 
         HitChance = 
         {
            HitPlus = 0, 
            HitNoDice = 0, 
            HitSizeDice = 0, 
         }, 
         Weight = 0, 
         Race = "Human", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "act_prog", 
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
               Arguments = "blushes.", 
            }, 
            [2] = 
            {
               MudProgType = "speech_prog", 
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
               Arguments = "Hello Hi", 
            }, 
         }, 
         Alignment = 0, 
         DamRoll = 0, 
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
         Stats = 
         {
            Force = 0, 
            Intelligence = 0, 
            Luck = 0, 
            Strength = 0, 
            Dexterity = 0, 
            Wisdom = 0, 
            Constitution = 0, 
            Charisma = 0, 
         }, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
         }, 
         HitRoll = 0, 
         Position = "standing", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
         }, 
         NumberOfAttacks = 0, 
         ArmorClass = 0, 
         ShortDescr = "a shapely nurse", 
         Level = 1, 
         Description = "", 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         Height = 0, 
         Credits = 0, 
         Sex = "undistinguished", 
      }, 
      [10005] = 
      {
         DefaultPosition = "standing", 
         LongDescr = "A vending machine rests against the wall here.\
", 
         Name = "A Vending Machine", 
         Vnum = 10005, 
         HitChance = 
         {
            HitPlus = 0, 
            HitNoDice = 0, 
            HitSizeDice = 0, 
         }, 
         Weight = 0, 
         Race = "Astromech", 
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
            ProfitBuy = 120, 
            KeeperShortDescr = "A vending machine", 
            ProfitSell = 90, 
         }, 
         Alignment = 0, 
         DamRoll = 0, 
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
         Stats = 
         {
            Force = 0, 
            Intelligence = 0, 
            Luck = 0, 
            Strength = 0, 
            Dexterity = 0, 
            Wisdom = 0, 
            Constitution = 0, 
            Charisma = 0, 
         }, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
         }, 
         HitRoll = 0, 
         Position = "standing", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
         }, 
         NumberOfAttacks = 0, 
         ArmorClass = 0, 
         ShortDescr = "A vending machine", 
         Level = 1, 
         Description = "", 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         Height = 0, 
         Credits = 0, 
         Sex = "undistinguished", 
      }, 
      [10009] = 
      {
         DefaultPosition = "standing", 
         LongDescr = "A clerk is here to take your payment.\
", 
         Name = "clerk", 
         Vnum = 10009, 
         HitChance = 
         {
            HitPlus = 0, 
            HitNoDice = 0, 
            HitSizeDice = 0, 
         }, 
         Weight = 0, 
         Race = "Human", 
         Alignment = 0, 
         DamRoll = 0, 
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
         Stats = 
         {
            Force = 0, 
            Intelligence = 0, 
            Luck = 0, 
            Strength = 0, 
            Dexterity = 0, 
            Wisdom = 0, 
            Constitution = 0, 
            Charisma = 0, 
         }, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
         }, 
         HitRoll = 0, 
         Position = "standing", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         NumberOfAttacks = 0, 
         ArmorClass = 0, 
         ShortDescr = "a clerk", 
         Level = 1, 
         Description = "", 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         Height = 0, 
         Credits = 0, 
         Sex = "undistinguished", 
      }, 
   }, 
   FileFormatVersion = 1, 
   HighEconomy = 0, 
   Objects = 
   {
      [10000] = 
      {
         Cost = 0, 
         Name = "bookend", 
         ItemType = "trash", 
         Vnum = 10000, 
         ShortDescr = "a newly created bookend", 
         Layers = 0, 
         Description = "Some god dropped a newly created bookend here.", 
         Weight = 1, 
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
      }, 
      [10001] = 
      {
         Cost = 0, 
         Name = "sparti cloning cylinder", 
         ItemType = "trash", 
         Vnum = 10001, 
         ShortDescr = "a sparti cloning cylinder", 
         Layers = 0, 
         Description = "A sparti cloning cylinder is here.", 
         Weight = 1, 
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
      }, 
      [10002] = 
      {
         Cost = 0, 
         Name = "desc", 
         ItemType = "trash", 
         Vnum = 10002, 
         ShortDescr = "a newly created desc", 
         Layers = 0, 
         Description = "Some god dropped a newly created desc here.", 
         Weight = 1, 
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
      }, 
      [10003] = 
      {
         Cost = 0, 
         Name = "facility deed ", 
         ItemType = "government", 
         Vnum = 10003, 
         ShortDescr = "the deed", 
         Layers = 0, 
         Description = "OOooOOoo the deed to the cloning facilities is here.", 
         Weight = 1, 
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
      }, 
      [10004] = 
      {
         Cost = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [10] = "About", 
         }, 
         Name = "Hospital Scrubs", 
         ItemType = "armor", 
         Vnum = 10004, 
         ShortDescr = "White hospital scrubs", 
         Layers = 0, 
         Description = "White hospital scrubs have been discarded in a pile here.", 
         Weight = 3, 
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
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
      }, 
      [10009] = 
      {
         Cost = 0, 
         Name = "sparti cloning cylinder", 
         ItemType = "trash", 
         Vnum = 10009, 
         ShortDescr = "a newly created sparti cloning cylinder", 
         Layers = 0, 
         Description = "Some god dropped a newly created sparti cloning cylinder here.", 
         Weight = 1, 
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
      }, 
   }, 
   LowEconomy = 130047569, 
   ResetFrequency = 0, 
}
