-- Cloning Station
-- Last saved Thursday 09-Jul-2020 23:19:12

AreaEntry
{
   Rooms = 
   {
      [10000] = 
      {
         TeleDelay = 0, 
         Vnum = 10000, 
         Name = "Inside a Sparti Cloning Cylinder", 
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
               Description = "", 
               Keyword = "", 
               Direction = "somewhere", 
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
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpat 122 mpecho $n enters from a cloning chamber.\
", 
               MudProgType = "act_prog", 
               Arguments = "enters", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [18] = "NoDrop", 
            [23] = "Hotel", 
         }, 
      }, 
      [10001] = 
      {
         TeleDelay = 0, 
         Vnum = 10001, 
         Name = "Pay Counter", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 10007, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "After the long wait you are finally here. Now all that is left to do is to\
pay the clerk, sign a few papers and give a tissue sample. (To do this\
type \"clone\")\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
      }, 
      [10002] = 
      {
         TeleDelay = 0, 
         Vnum = 10002, 
         Name = "In a Small Sterile Room", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 10003, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "This small room smells strongly of antiseptic.  There is a large flat\
table, that is covered with removable paper.  You assume that this is\
where blood and tissue samples are taken, as well as where new clones are\
examined. There are several medical instruments hanging on hooks on the\
walls.  Some of them look to horrible to even imagine their use.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
      }, 
      [10003] = 
      {
         TeleDelay = 0, 
         Vnum = 10003, 
         Name = "A Clinic Hallway", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 10002, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 10007, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 10004, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "This small hallway leads from the lobby of the facilities to a set of\
locked blastdoors.  To the east is a small doctor's office.  To the west\
is a large room filled with exercise equipment.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
      }, 
      [10004] = 
      {
         TeleDelay = 0, 
         Vnum = 10004, 
         Name = "Exercise Room.", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 10005, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 10003, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 10009, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
         }, 
         Description = "This room is filled with various pieces of exercise equipment.   It is\
available for young clones to regain their strength as they become\
accustomed to their new forms after gestation and an accelerated growth\
period. All of the equipment has gauges to monitor the progress and vital\
signs of the clones.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
      }, 
      [10005] = 
      {
         TeleDelay = 0, 
         Vnum = 10005, 
         Name = "Rest Area", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 10004, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
         }, 
         Description = "This area of the complex is set up as a small lounge.  There are several\
couches and chairs scattered about the room, along with a few tables. A\
curtain at the back hides a few cots for those who are tired.\
 \
 \
You may quit and re-enter the game from here.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [23] = "Hotel", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
      }, 
      [10006] = 
      {
         TeleDelay = 0, 
         Vnum = 10006, 
         Name = "Desert Landing Pad", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 10007, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 32297, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
         }, 
         Description = "You stand upon a small landing pad on a relatively unknown planet somewhere\
in the core worlds. Dense jungle surrounds this clearing, and the only\
manmade structure visible is a small building to the north. \
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
            [4] = "CanLand", 
         }, 
      }, 
      [10007] = 
      {
         TeleDelay = 0, 
         Vnum = 10007, 
         Name = "The cloning Facilities", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 10003, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
            [2] = 
            {
               Distance = 0, 
               DestinationVnum = 10008, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
            [3] = 
            {
               Distance = 0, 
               DestinationVnum = 10006, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "south", 
            }, 
            [4] = 
            {
               Distance = 0, 
               DestinationVnum = 10010, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "The actual livable portion of this building is small and almost bunkerlike.\
  The rest of the immense edifice lies below where you stand. Cloning\
requires considerable energy, and you can sense the hum of the engines\
under your feet. The owners of this establishment have salvaged a couple\
of cloning cylinders, found after the cloning wars, and turned them into a\
small but profitable business.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
      }, 
      [10008] = 
      {
         TeleDelay = 0, 
         Vnum = 10008, 
         Name = "Standing in Line", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 10007, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "west", 
            }, 
         }, 
         Description = "You stand in a long line waiting for your turn to be cloned.\
There is nothing to do but stand here and wait.\
", 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpechoat $n You finally make it to the front of the line.\
mpechoaround $n $n Moves to the front of the line.\
mptransfer $n 10001\
", 
               MudProgType = "rand_prog", 
               Arguments = "100", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
      }, 
      [10009] = 
      {
         TeleDelay = 0, 
         Vnum = 10009, 
         Name = "The Cloning Chamber", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 10004, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "north", 
            }, 
         }, 
         Description = "This large room contains the tops of some cloning cylinders, but from the\
rumors you have heard, there must be many more below this level. Many\
pipes and wires run haphazardly from the cylinders.   There is no way to\
enter the cloning chambers from here.  You must go stand in line.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
      }, 
      [10010] = 
      {
         TeleDelay = 0, 
         Vnum = 10010, 
         Name = "The Office", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               DestinationVnum = 10007, 
               Key = -1, 
               Description = "", 
               Keyword = "", 
               Direction = "east", 
            }, 
         }, 
         Description = "This large office contains a very fine wood desk as well as several\
expensive looking paintings. There is a small tree in one corner of the\
room and a large bookcase on one wall.\
", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [10] = "Safe", 
         }, 
      }, 
      [10011] = 
      {
         TeleDelay = 0, 
         Vnum = 10011, 
         Name = "Storage Chamber", 
         Exits = 
         {
         }, 
         Description = "", 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
      }, 
   }, 
   Author = "Durga", 
   ResetFrequency = 0, 
   Name = "Cloning Station", 
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
         High = 105, 
      }, 
   }, 
   HighEconomy = 0, 
   FileFormatVersion = 1, 
   Resets = 
   {
      [1] = 
      {
         Arg1 = 10009, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 10001, 
      }, 
      [2] = 
      {
         Arg1 = 10001, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 10010, 
      }, 
      [3] = 
      {
         Arg1 = 10002, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 10010, 
      }, 
      [4] = 
      {
         Arg1 = 10003, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 10010, 
      }, 
      [5] = 
      {
         Arg1 = 10005, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 10007, 
      }, 
      [6] = 
      {
         MiscData = 1, 
         Arg1 = 10424, 
         Arg2 = 1, 
         Command = "G", 
      }, 
      [7] = 
      {
         MiscData = 1, 
         Arg1 = 10314, 
         Arg2 = 1, 
         Command = "G", 
      }, 
      [8] = 
      {
         Arg1 = 10004, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 10009, 
      }, 
      [9] = 
      {
         MiscData = 1, 
         Arg1 = 10004, 
         Arg2 = 1, 
         Command = "G", 
      }, 
      [10] = 
      {
         MiscData = 1, 
         Arg1 = 10004, 
         Arg2 = 1, 
         Command = "G", 
      }, 
      [11] = 
      {
         MiscData = 1, 
         Arg1 = 10004, 
         Arg2 = 1, 
         Command = "G", 
      }, 
      [12] = 
      {
         Arg1 = 10001, 
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
         Arg3 = 10009, 
      }, 
   }, 
   Filename = "cloning.lua", 
   Objects = 
   {
      [10000] = 
      {
         Vnum = 10000, 
         Weight = 1, 
         Name = "bookend", 
         Cost = 0, 
         Description = "Some god dropped a newly created bookend here.", 
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
         ShortDescr = "a newly created bookend", 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Layers = 0, 
      }, 
      [10001] = 
      {
         Vnum = 10001, 
         Weight = 1, 
         Name = "sparti cloning cylinder", 
         Cost = 0, 
         Description = "A sparti cloning cylinder is here.", 
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
         ShortDescr = "a sparti cloning cylinder", 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Layers = 0, 
      }, 
      [10002] = 
      {
         Vnum = 10002, 
         Weight = 1, 
         Name = "desc", 
         Cost = 0, 
         Description = "Some god dropped a newly created desc here.", 
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
         ShortDescr = "a newly created desc", 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Layers = 0, 
      }, 
      [10003] = 
      {
         Vnum = 10003, 
         Weight = 1, 
         Name = "facility deed ", 
         Cost = 0, 
         Description = "OOooOOoo the deed to the cloning facilities is here.", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ItemType = "government", 
         ShortDescr = "the deed", 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Layers = 0, 
      }, 
      [10004] = 
      {
         WearFlags = 
         {
            [0] = "Take", 
            [10] = "About", 
         }, 
         Vnum = 10004, 
         Weight = 3, 
         Name = "Hospital Scrubs", 
         Cost = 0, 
         Description = "White hospital scrubs have been discarded in a pile here.", 
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         ItemType = "armor", 
         ShortDescr = "White hospital scrubs", 
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
      }, 
      [10009] = 
      {
         Vnum = 10009, 
         Weight = 1, 
         Name = "sparti cloning cylinder", 
         Cost = 0, 
         Description = "Some god dropped a newly created sparti cloning cylinder here.", 
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
         ShortDescr = "a newly created sparti cloning cylinder", 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         Layers = 0, 
      }, 
   }, 
   Mobiles = 
   {
      [10000] = 
      {
         Weight = 0, 
         Name = "firstmob", 
         ArmorClass = 0, 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         Damage = 
         {
            DamNoDice = 0, 
            DamPlus = 0, 
            DamSizeDice = 0, 
         }, 
         LongDescr = "Some god abandoned a newly created firstmob here.\
", 
         NumberOfAttacks = 0, 
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
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
         }, 
         Position = "standing", 
         Stats = 
         {
            Wisdom = 10, 
            Force = 0, 
            Constitution = 10, 
            Charisma = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Luck = 10, 
            Strength = 10, 
         }, 
         Level = 1, 
         HitRoll = 0, 
         Height = 0, 
         DefaultPosition = "standing", 
         Description = "", 
         Credits = 0, 
         Race = "Human", 
         Alignment = 0, 
         Vnum = 10000, 
         ShortDescr = "a newly created firstmob", 
         Sex = "undistinguished", 
         DamRoll = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
      }, 
      [10001] = 
      {
         Weight = 0, 
         Name = "doctor Bnokkt", 
         ArmorClass = -25, 
         HitChance = 
         {
            HitPlus = 500, 
            HitSizeDice = 10, 
            HitNoDice = 10, 
         }, 
         Damage = 
         {
            DamNoDice = 5, 
            DamPlus = 2, 
            DamSizeDice = 4, 
         }, 
         LongDescr = "Doctor Bnokkt is the head of the cloning facilities.\
", 
         NumberOfAttacks = 0, 
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
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
         }, 
         Position = "standing", 
         Stats = 
         {
            Wisdom = 10, 
            Force = 0, 
            Constitution = 10, 
            Charisma = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Luck = 10, 
            Strength = 10, 
         }, 
         Level = 50, 
         HitRoll = 10, 
         Height = 0, 
         DefaultPosition = "standing", 
         Description = "", 
         Credits = 1000, 
         Race = "Human", 
         Alignment = 0, 
         Vnum = 10001, 
         ShortDescr = "Doctor Bnokkt", 
         Sex = "male", 
         DamRoll = 10, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
         }, 
      }, 
      [10002] = 
      {
         Weight = 0, 
         Name = "c-7hp64 personal assistant droid", 
         ArmorClass = -25, 
         HitChance = 
         {
            HitPlus = 5000, 
            HitSizeDice = 10, 
            HitNoDice = 10, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpoload 10003\
", 
               MudProgType = "death_prog", 
               Arguments = "100", 
            }, 
         }, 
         Damage = 
         {
            DamNoDice = 1, 
            DamPlus = 2, 
            DamSizeDice = 4, 
         }, 
         LongDescr = "A c-7hp64 personal assistant droid is here.\
", 
         NumberOfAttacks = 0, 
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
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
         }, 
         Position = "standing", 
         Stats = 
         {
            Wisdom = 10, 
            Force = 0, 
            Constitution = 10, 
            Charisma = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Luck = 10, 
            Strength = 10, 
         }, 
         Level = 50, 
         HitRoll = 0, 
         Height = 0, 
         DefaultPosition = "standing", 
         Description = "", 
         Credits = 0, 
         Race = "Human", 
         Alignment = 0, 
         Vnum = 10002, 
         ShortDescr = "a c-7hp64 personal assistant droid", 
         Sex = "undistinguished", 
         DamRoll = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [26] = "Droid", 
         }, 
      }, 
      [10003] = 
      {
         Weight = 0, 
         Name = "facility guard", 
         ArmorClass = -150, 
         HitChance = 
         {
            HitPlus = 1000, 
            HitSizeDice = 10, 
            HitNoDice = 20, 
         }, 
         Damage = 
         {
            DamNoDice = 10, 
            DamPlus = 2, 
            DamSizeDice = 4, 
         }, 
         LongDescr = "A Facility guard stands at attention.\
", 
         NumberOfAttacks = 0, 
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
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
         }, 
         Position = "standing", 
         Stats = 
         {
            Wisdom = 10, 
            Force = 0, 
            Constitution = 10, 
            Charisma = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Luck = 10, 
            Strength = 10, 
         }, 
         Level = 100, 
         HitRoll = 20, 
         Height = 0, 
         DefaultPosition = "standing", 
         Description = "", 
         Credits = 0, 
         Race = "Human", 
         Alignment = 0, 
         Vnum = 10003, 
         ShortDescr = "a facility guard", 
         Sex = "undistinguished", 
         DamRoll = 20, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
      }, 
      [10004] = 
      {
         Weight = 0, 
         Name = "Cloning Nurse", 
         ArmorClass = 0, 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
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
               Arguments = "Hello Hi", 
            }, 
            [2] = 
            {
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
               Arguments = "blushes.", 
            }, 
         }, 
         Damage = 
         {
            DamNoDice = 0, 
            DamPlus = 0, 
            DamSizeDice = 0, 
         }, 
         LongDescr = "A shapely nurse is standing here, handing out hospital clothes.\
", 
         NumberOfAttacks = 0, 
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
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
         }, 
         Position = "standing", 
         Stats = 
         {
            Wisdom = 10, 
            Force = 0, 
            Constitution = 10, 
            Charisma = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Luck = 10, 
            Strength = 10, 
         }, 
         Level = 1, 
         HitRoll = 0, 
         Height = 0, 
         DefaultPosition = "standing", 
         Description = "", 
         Credits = 0, 
         Race = "Human", 
         Alignment = 0, 
         Vnum = 10004, 
         ShortDescr = "a shapely nurse", 
         Sex = "undistinguished", 
         DamRoll = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
         }, 
      }, 
      [10005] = 
      {
         Weight = 0, 
         Name = "A Vending Machine", 
         ArmorClass = 0, 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         Damage = 
         {
            DamNoDice = 0, 
            DamPlus = 0, 
            DamSizeDice = 0, 
         }, 
         LongDescr = "A vending machine rests against the wall here.\
", 
         NumberOfAttacks = 0, 
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
         Shop = 
         {
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
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
            KeeperShortDescr = "A vending machine", 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
         }, 
         Position = "standing", 
         Stats = 
         {
            Wisdom = 10, 
            Force = 0, 
            Constitution = 10, 
            Charisma = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Luck = 10, 
            Strength = 10, 
         }, 
         Level = 1, 
         HitRoll = 0, 
         Height = 0, 
         DefaultPosition = "standing", 
         Description = "", 
         Credits = 0, 
         Race = "Astromech", 
         Alignment = 0, 
         Vnum = 10005, 
         ShortDescr = "A vending machine", 
         Sex = "undistinguished", 
         DamRoll = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
         }, 
      }, 
      [10009] = 
      {
         Weight = 0, 
         Name = "clerk", 
         ArmorClass = 0, 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         Damage = 
         {
            DamNoDice = 0, 
            DamPlus = 0, 
            DamSizeDice = 0, 
         }, 
         LongDescr = "A clerk is here to take your payment.\
", 
         NumberOfAttacks = 0, 
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
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
         }, 
         Position = "standing", 
         Stats = 
         {
            Wisdom = 10, 
            Force = 0, 
            Constitution = 10, 
            Charisma = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Luck = 10, 
            Strength = 10, 
         }, 
         Level = 1, 
         HitRoll = 0, 
         Height = 0, 
         DefaultPosition = "standing", 
         Description = "", 
         Credits = 0, 
         Race = "Human", 
         Alignment = 0, 
         Vnum = 10009, 
         ShortDescr = "a clerk", 
         Sex = "undistinguished", 
         DamRoll = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
      }, 
   }, 
   LowEconomy = 130042569, 
   ResetMessage = "&CThe filtered air carries the distinct scent of medicine.", 
   VnumRanges = 
   {
      Object = 
      {
         First = 10000, 
         Last = 10009, 
      }, 
      Mob = 
      {
         First = 10000, 
         Last = 10009, 
      }, 
      Room = 
      {
         First = 10000, 
         Last = 10011, 
      }, 
   }, 
}
