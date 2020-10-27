-- Cloning Station
-- Last saved Tuesday 27-Oct-2020 11:58:44

AreaEntry
{
   Rooms = 
   {
      [10000] = 
      {
         TeleVnum = 0, 
         Tag = "", 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               Arguments = "enters", 
               MudProgType = "act_prog", 
               Code = "mpat 122 mpecho $n enters from a cloning chamber.\
", 
            }, 
         }, 
         Tunnel = 0, 
         Sector = "city", 
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
         Vnum = 10000, 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [18] = "CanLeave", 
                  [11] = "Hidden", 
               }, 
               Distance = 0, 
               DestinationVnum = 10009, 
               Key = -1, 
               Keyword = "", 
               Direction = "somewhere", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [18] = "NoDrop", 
            [23] = "Hotel", 
         }, 
         Name = "Inside a Sparti Cloning Cylinder", 
      }, 
      [10001] = 
      {
         TeleVnum = 0, 
         Tag = "", 
         Tunnel = 0, 
         Sector = "city", 
         Description = "After the long wait you are finally here. Now all that is left to do is to\
pay the clerk, sign a few papers and give a tissue sample. (To do this\
type \"clone\")\
", 
         Vnum = 10001, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 10007, 
               Key = -1, 
               Keyword = "", 
               Direction = "west", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Name = "Pay Counter", 
      }, 
      [10002] = 
      {
         TeleVnum = 0, 
         Tag = "", 
         Tunnel = 0, 
         Sector = "city", 
         Description = "This small room smells strongly of antiseptic.  There is a large flat\
table, that is covered with removable paper.  You assume that this is\
where blood and tissue samples are taken, as well as where new clones are\
examined. There are several medical instruments hanging on hooks on the\
walls.  Some of them look to horrible to even imagine their use.\
", 
         Vnum = 10002, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 10003, 
               Key = -1, 
               Keyword = "", 
               Direction = "west", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Name = "In a Small Sterile Room", 
      }, 
      [10003] = 
      {
         TeleVnum = 0, 
         Tag = "", 
         Tunnel = 0, 
         Sector = "city", 
         Description = "This small hallway leads from the lobby of the facilities to a set of\
locked blastdoors.  To the east is a small doctor's office.  To the west\
is a large room filled with exercise equipment.\
", 
         Vnum = 10003, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 10002, 
               Key = -1, 
               Keyword = "", 
               Direction = "east", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 10007, 
               Key = -1, 
               Keyword = "", 
               Direction = "south", 
               Description = "", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 10004, 
               Key = -1, 
               Keyword = "", 
               Direction = "west", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Name = "A Clinic Hallway", 
      }, 
      [10004] = 
      {
         TeleVnum = 0, 
         Tag = "", 
         Tunnel = 0, 
         Sector = "city", 
         Description = "This room is filled with various pieces of exercise equipment.   It is\
available for young clones to regain their strength as they become\
accustomed to their new forms after gestation and an accelerated growth\
period. All of the equipment has gauges to monitor the progress and vital\
signs of the clones.\
", 
         Vnum = 10004, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 10005, 
               Key = -1, 
               Keyword = "", 
               Direction = "north", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 10003, 
               Key = -1, 
               Keyword = "", 
               Direction = "east", 
               Description = "", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 10009, 
               Key = -1, 
               Keyword = "", 
               Direction = "south", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Name = "Exercise Room.", 
      }, 
      [10005] = 
      {
         TeleVnum = 0, 
         Tag = "", 
         Tunnel = 0, 
         Sector = "city", 
         Description = "This area of the complex is set up as a small lounge.  There are several\
couches and chairs scattered about the room, along with a few tables. A\
curtain at the back hides a few cots for those who are tired.\
 \
 \
You may quit and re-enter the game from here.\
", 
         Vnum = 10005, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 10004, 
               Key = -1, 
               Keyword = "", 
               Direction = "south", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [23] = "Hotel", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Name = "Rest Area", 
      }, 
      [10006] = 
      {
         TeleVnum = 0, 
         Tag = "", 
         Tunnel = 0, 
         Sector = "city", 
         Description = "You stand upon a small landing pad on a relatively unknown planet somewhere\
in the core worlds. Dense jungle surrounds this clearing, and the only\
manmade structure visible is a small building to the north. \
", 
         Vnum = 10006, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 10007, 
               Key = -1, 
               Keyword = "", 
               Direction = "north", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 32297, 
               Key = -1, 
               Keyword = "", 
               Direction = "east", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
            [4] = "CanLand", 
         }, 
         Name = "Desert Landing Pad", 
      }, 
      [10007] = 
      {
         TeleVnum = 0, 
         Tag = "", 
         Tunnel = 0, 
         Sector = "city", 
         Description = "The actual livable portion of this building is small and almost bunkerlike.\
  The rest of the immense edifice lies below where you stand. Cloning\
requires considerable energy, and you can sense the hum of the engines\
under your feet. The owners of this establishment have salvaged a couple\
of cloning cylinders, found after the cloning wars, and turned them into a\
small but profitable business.\
", 
         Vnum = 10007, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 10003, 
               Key = -1, 
               Keyword = "", 
               Direction = "north", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 10008, 
               Key = -1, 
               Keyword = "", 
               Direction = "east", 
               Description = "", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 10006, 
               Key = -1, 
               Keyword = "", 
               Direction = "south", 
               Description = "", 
            }, 
            [4] = 
            {
               Distance = 0, 
               DestinationVnum = 10010, 
               Key = -1, 
               Keyword = "", 
               Direction = "west", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Name = "The cloning Facilities", 
      }, 
      [10008] = 
      {
         TeleVnum = 0, 
         Tag = "", 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               Arguments = "100", 
               MudProgType = "rand_prog", 
               Code = "mpechoat $n You finally make it to the front of the line.\
mpechoaround $n $n Moves to the front of the line.\
mptransfer $n 10001\
", 
            }, 
         }, 
         Tunnel = 0, 
         Sector = "city", 
         Description = "You stand in a long line waiting for your turn to be cloned.\
There is nothing to do but stand here and wait.\
", 
         Vnum = 10008, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 10007, 
               Key = -1, 
               Keyword = "", 
               Direction = "west", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Name = "Standing in Line", 
      }, 
      [10009] = 
      {
         TeleVnum = 0, 
         Tag = "", 
         Tunnel = 0, 
         Sector = "city", 
         Description = "This large room contains the tops of some cloning cylinders, but from the\
rumors you have heard, there must be many more below this level. Many\
pipes and wires run haphazardly from the cylinders.   There is no way to\
enter the cloning chambers from here.  You must go stand in line.\
", 
         Vnum = 10009, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 10004, 
               Key = -1, 
               Keyword = "", 
               Direction = "north", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Name = "The Cloning Chamber", 
      }, 
      [10010] = 
      {
         TeleVnum = 0, 
         Tag = "", 
         Tunnel = 0, 
         Sector = "city", 
         Description = "This large office contains a very fine wood desk as well as several\
expensive looking paintings. There is a small tree in one corner of the\
room and a large bookcase on one wall.\
", 
         Vnum = 10010, 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 10007, 
               Key = -1, 
               Keyword = "", 
               Direction = "east", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [10] = "Safe", 
         }, 
         Name = "The Office", 
      }, 
      [10011] = 
      {
         TeleVnum = 0, 
         Tag = "", 
         Tunnel = 0, 
         Sector = "city", 
         Description = "", 
         Vnum = 10011, 
         Exits = 
         {
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Name = "Storage Chamber", 
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
   VnumRanges = 
   {
      Object = 
      {
         Last = 10009, 
         First = 10000, 
      }, 
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
   }, 
   Author = "Durga", 
   Filename = "cloning.lua", 
   FileFormatVersion = 1, 
   ResetMessage = "&CThe filtered air carries the distinct scent of medicine.", 
   Resets = 
   {
      [1] = 
      {
         Arg3 = 10001, 
         Command = "M", 
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 10009, 
      }, 
      [2] = 
      {
         Arg3 = 10010, 
         Command = "M", 
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 10001, 
      }, 
      [3] = 
      {
         Arg3 = 10010, 
         Command = "M", 
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 10002, 
      }, 
      [4] = 
      {
         Arg3 = 10010, 
         Command = "M", 
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 10003, 
      }, 
      [5] = 
      {
         Arg3 = 10007, 
         Command = "M", 
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 10005, 
      }, 
      [6] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 10424, 
         Command = "G", 
      }, 
      [7] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 10314, 
         Command = "G", 
      }, 
      [8] = 
      {
         Arg3 = 10009, 
         Command = "M", 
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 10004, 
      }, 
      [9] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 10004, 
         Command = "G", 
      }, 
      [10] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 10004, 
         Command = "G", 
      }, 
      [11] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 10004, 
         Command = "G", 
      }, 
      [12] = 
      {
         Arg3 = 10009, 
         Command = "O", 
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 10001, 
      }, 
   }, 
   ResetFrequency = 0, 
   LowEconomy = 130041569, 
   HighEconomy = 0, 
   Mobiles = 
   {
      [10000] = 
      {
         HitRoll = 0, 
         DefaultPosition = "standing", 
         Description = "", 
         Credits = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
         LongDescr = "Some god abandoned a newly created firstmob here.\
", 
         Flags = 
         {
            [0] = "Npc", 
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
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
         }, 
         Position = "standing", 
         Stats = 
         {
            Intelligence = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Luck = 10, 
            Force = 0, 
            Charisma = 10, 
            Dexterity = 10, 
            Constitution = 10, 
         }, 
         Level = 1, 
         ArmorClass = 0, 
         Race = "Human", 
         Alignment = 0, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         ShortDescr = "a newly created firstmob", 
         Vnum = 10000, 
         Height = 0, 
         DamRoll = 0, 
         Sex = "undistinguished", 
         Name = "firstmob", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
      }, 
      [10001] = 
      {
         HitRoll = 10, 
         DefaultPosition = "standing", 
         Description = "", 
         Credits = 1000, 
         Damage = 
         {
            DamPlus = 2, 
            DamNoDice = 5, 
            DamSizeDice = 4, 
         }, 
         LongDescr = "Doctor Bnokkt is the head of the cloning facilities.\
", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
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
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
         }, 
         Position = "standing", 
         Stats = 
         {
            Intelligence = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Luck = 10, 
            Force = 0, 
            Charisma = 10, 
            Dexterity = 10, 
            Constitution = 10, 
         }, 
         Level = 50, 
         ArmorClass = -25, 
         Race = "Human", 
         Alignment = 0, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         ShortDescr = "Doctor Bnokkt", 
         Vnum = 10001, 
         Height = 0, 
         DamRoll = 10, 
         Sex = "male", 
         Name = "doctor Bnokkt", 
         HitChance = 
         {
            HitPlus = 500, 
            HitSizeDice = 10, 
            HitNoDice = 10, 
         }, 
      }, 
      [10002] = 
      {
         HitRoll = 0, 
         DefaultPosition = "standing", 
         Description = "", 
         Credits = 0, 
         Damage = 
         {
            DamPlus = 2, 
            DamNoDice = 1, 
            DamSizeDice = 4, 
         }, 
         LongDescr = "A c-7hp64 personal assistant droid is here.\
", 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               Arguments = "100", 
               MudProgType = "death_prog", 
               Code = "mpoload 10003\
", 
            }, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [26] = "Droid", 
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
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
         }, 
         Position = "standing", 
         Stats = 
         {
            Intelligence = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Luck = 10, 
            Force = 0, 
            Charisma = 10, 
            Dexterity = 10, 
            Constitution = 10, 
         }, 
         Level = 50, 
         ArmorClass = -25, 
         Race = "Human", 
         Alignment = 0, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         ShortDescr = "a c-7hp64 personal assistant droid", 
         Vnum = 10002, 
         Height = 0, 
         DamRoll = 0, 
         Sex = "undistinguished", 
         Name = "c-7hp64 personal assistant droid", 
         HitChance = 
         {
            HitPlus = 5000, 
            HitSizeDice = 10, 
            HitNoDice = 10, 
         }, 
      }, 
      [10003] = 
      {
         HitRoll = 20, 
         DefaultPosition = "standing", 
         Description = "", 
         Credits = 0, 
         Damage = 
         {
            DamPlus = 2, 
            DamNoDice = 10, 
            DamSizeDice = 4, 
         }, 
         LongDescr = "A Facility guard stands at attention.\
", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
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
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
         }, 
         Position = "standing", 
         Stats = 
         {
            Intelligence = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Luck = 10, 
            Force = 0, 
            Charisma = 10, 
            Dexterity = 10, 
            Constitution = 10, 
         }, 
         Level = 100, 
         ArmorClass = -150, 
         Race = "Human", 
         Alignment = 0, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         ShortDescr = "a facility guard", 
         Vnum = 10003, 
         Height = 0, 
         DamRoll = 20, 
         Sex = "undistinguished", 
         Name = "facility guard", 
         HitChance = 
         {
            HitPlus = 1000, 
            HitSizeDice = 10, 
            HitNoDice = 20, 
         }, 
      }, 
      [10004] = 
      {
         HitRoll = 0, 
         DefaultPosition = "standing", 
         Description = "", 
         Credits = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
         LongDescr = "A shapely nurse is standing here, handing out hospital clothes.\
", 
         MudProgs = 
         {
            [1] = 
            {
               ScriptType = "MProg", 
               Arguments = "blushes.", 
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
            }, 
            [2] = 
            {
               ScriptType = "MProg", 
               Arguments = "Hello Hi", 
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
            }, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
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
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
         }, 
         Position = "standing", 
         Stats = 
         {
            Intelligence = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Luck = 10, 
            Force = 0, 
            Charisma = 10, 
            Dexterity = 10, 
            Constitution = 10, 
         }, 
         Level = 1, 
         ArmorClass = 0, 
         Race = "Human", 
         Alignment = 0, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         ShortDescr = "a shapely nurse", 
         Vnum = 10004, 
         Height = 0, 
         DamRoll = 0, 
         Sex = "undistinguished", 
         Name = "Cloning Nurse", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
      }, 
      [10005] = 
      {
         HitRoll = 0, 
         DefaultPosition = "standing", 
         Description = "", 
         Credits = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
         LongDescr = "A vending machine rests against the wall here.\
", 
         Shop = 
         {
            ProfitBuy = 120, 
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
            KeeperShortDescr = "A vending machine", 
            ProfitSell = 90, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [27] = "binary", 
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
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
         }, 
         Position = "standing", 
         Stats = 
         {
            Intelligence = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Luck = 10, 
            Force = 0, 
            Charisma = 10, 
            Dexterity = 10, 
            Constitution = 10, 
         }, 
         Level = 1, 
         ArmorClass = 0, 
         Race = "Astromech", 
         Alignment = 0, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         ShortDescr = "A vending machine", 
         Vnum = 10005, 
         Height = 0, 
         DamRoll = 0, 
         Sex = "undistinguished", 
         Name = "A Vending Machine", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
      }, 
      [10009] = 
      {
         HitRoll = 0, 
         DefaultPosition = "standing", 
         Description = "", 
         Credits = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
         LongDescr = "A clerk is here to take your payment.\
", 
         Flags = 
         {
            [0] = "Npc", 
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
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            Breath = 0, 
            ParaPetri = 0, 
         }, 
         Position = "standing", 
         Stats = 
         {
            Intelligence = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Luck = 10, 
            Force = 0, 
            Charisma = 10, 
            Dexterity = 10, 
            Constitution = 10, 
         }, 
         Level = 1, 
         ArmorClass = 0, 
         Race = "Human", 
         Alignment = 0, 
         Weight = 0, 
         NumberOfAttacks = 0, 
         ShortDescr = "a clerk", 
         Vnum = 10009, 
         Height = 0, 
         DamRoll = 0, 
         Sex = "undistinguished", 
         Name = "clerk", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
      }, 
   }, 
   Name = "Cloning Station", 
   Objects = 
   {
      [10000] = 
      {
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
         Description = "Some god dropped a newly created bookend here.", 
         ShortDescr = "a newly created bookend", 
         Vnum = 10000, 
         Weight = 1, 
         ItemType = "trash", 
         ExtraDescriptions = 
         {
         }, 
         Name = "bookend", 
      }, 
      [10001] = 
      {
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
         Description = "A sparti cloning cylinder is here.", 
         ShortDescr = "a sparti cloning cylinder", 
         Vnum = 10001, 
         Weight = 1, 
         ItemType = "trash", 
         ExtraDescriptions = 
         {
         }, 
         Name = "sparti cloning cylinder", 
      }, 
      [10002] = 
      {
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
         Description = "Some god dropped a newly created desc here.", 
         ShortDescr = "a newly created desc", 
         Vnum = 10002, 
         Weight = 1, 
         ItemType = "trash", 
         ExtraDescriptions = 
         {
         }, 
         Name = "desc", 
      }, 
      [10003] = 
      {
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
         Description = "OOooOOoo the deed to the cloning facilities is here.", 
         ShortDescr = "the deed", 
         Vnum = 10003, 
         Weight = 1, 
         ItemType = "government", 
         ExtraDescriptions = 
         {
         }, 
         Name = "facility deed ", 
      }, 
      [10004] = 
      {
         ActionDescription = "", 
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
         Layers = 0, 
         Description = "White hospital scrubs have been discarded in a pile here.", 
         ShortDescr = "White hospital scrubs", 
         Vnum = 10004, 
         WearFlags = 
         {
            [0] = "Take", 
            [10] = "About", 
         }, 
         Weight = 3, 
         ItemType = "armor", 
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
         Name = "Hospital Scrubs", 
      }, 
      [10009] = 
      {
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
         Description = "Some god dropped a newly created sparti cloning cylinder here.", 
         ShortDescr = "a newly created sparti cloning cylinder", 
         Vnum = 10009, 
         Weight = 1, 
         ItemType = "trash", 
         ExtraDescriptions = 
         {
         }, 
         Name = "sparti cloning cylinder", 
      }, 
   }, 
}
