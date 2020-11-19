-- Cloning Station
-- Last saved Thursday 19-Nov-2020 14:31:09

AreaEntry
{
   VnumRanges = 
   {
      Mob = 
      {
         First = 10000, 
         Last = 10009, 
      }, 
      Object = 
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
   Objects = 
   {
      [10000] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 10000, 
         Cost = 0, 
         ShortDescr = "a newly created bookend", 
         Layers = 0, 
         Weight = 1, 
         Name = "bookend", 
         ActionDescription = "", 
         ItemType = "trash", 
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
      }, 
      [10001] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 10001, 
         Cost = 0, 
         ShortDescr = "a sparti cloning cylinder", 
         Layers = 0, 
         Weight = 1, 
         Name = "sparti cloning cylinder", 
         ActionDescription = "", 
         ItemType = "trash", 
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
      }, 
      [10002] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 10002, 
         Cost = 0, 
         ShortDescr = "a newly created desc", 
         Layers = 0, 
         Weight = 1, 
         Name = "desc", 
         ActionDescription = "", 
         ItemType = "trash", 
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
      }, 
      [10003] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 10003, 
         Cost = 0, 
         ShortDescr = "the deed", 
         Layers = 0, 
         Weight = 1, 
         Name = "facility deed ", 
         ActionDescription = "", 
         ItemType = "government", 
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
      }, 
      [10004] = 
      {
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
         Vnum = 10004, 
         Cost = 0, 
         ShortDescr = "White hospital scrubs", 
         Weight = 3, 
         Layers = 0, 
         Name = "Hospital Scrubs", 
         Description = "White hospital scrubs have been discarded in a pile here.", 
         ActionDescription = "", 
         ItemType = "armor", 
         WearFlags = 
         {
            [0] = "Take", 
            [10] = "About", 
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
      }, 
      [10009] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 10009, 
         Cost = 0, 
         ShortDescr = "a newly created sparti cloning cylinder", 
         Layers = 0, 
         Weight = 1, 
         Name = "sparti cloning cylinder", 
         ActionDescription = "", 
         ItemType = "trash", 
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
      }, 
   }, 
   HighEconomy = 0, 
   Rooms = 
   {
      [10000] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [18] = "NoDrop", 
            [23] = "Hotel", 
         }, 
         Vnum = 10000, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Inside a Sparti Cloning Cylinder", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "act_prog", 
               Code = "mpat 122 mpecho $n enters from a cloning chamber.\
", 
               Arguments = "enters", 
               ScriptType = "MProg", 
            }, 
         }, 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [18] = "CanLeave", 
                  [11] = "Hidden", 
               }, 
               Description = "", 
               Direction = "somewhere", 
               Key = -1, 
               DestinationVnum = 10009, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
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
      }, 
      [10001] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 10001, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Pay Counter", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 10007, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "After the long wait you are finally here. Now all that is left to do is to\
pay the clerk, sign a few papers and give a tissue sample. (To do this\
type \"clone\")\
", 
      }, 
      [10002] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 10002, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "In a Small Sterile Room", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 10003, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This small room smells strongly of antiseptic.  There is a large flat\
table, that is covered with removable paper.  You assume that this is\
where blood and tissue samples are taken, as well as where new clones are\
examined. There are several medical instruments hanging on hooks on the\
walls.  Some of them look to horrible to even imagine their use.\
", 
      }, 
      [10003] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 10003, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "A Clinic Hallway", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 10002, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 10007, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 10004, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This small hallway leads from the lobby of the facilities to a set of\
locked blastdoors.  To the east is a small doctor's office.  To the west\
is a large room filled with exercise equipment.\
", 
      }, 
      [10004] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 10004, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Exercise Room.", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 10005, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 10003, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 10009, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This room is filled with various pieces of exercise equipment.   It is\
available for young clones to regain their strength as they become\
accustomed to their new forms after gestation and an accelerated growth\
period. All of the equipment has gauges to monitor the progress and vital\
signs of the clones.\
", 
      }, 
      [10005] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [23] = "Hotel", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 10005, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Rest Area", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 10004, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This area of the complex is set up as a small lounge.  There are several\
couches and chairs scattered about the room, along with a few tables. A\
curtain at the back hides a few cots for those who are tired.\
 \
 \
You may quit and re-enter the game from here.\
", 
      }, 
      [10006] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
            [4] = "CanLand", 
         }, 
         Vnum = 10006, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Desert Landing Pad", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 10007, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 32297, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "You stand upon a small landing pad on a relatively unknown planet somewhere\
in the core worlds. Dense jungle surrounds this clearing, and the only\
manmade structure visible is a small building to the north. \
", 
      }, 
      [10007] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 10007, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "The cloning Facilities", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 10003, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 10008, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 10006, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 10010, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The actual livable portion of this building is small and almost bunkerlike.\
  The rest of the immense edifice lies below where you stand. Cloning\
requires considerable energy, and you can sense the hum of the engines\
under your feet. The owners of this establishment have salvaged a couple\
of cloning cylinders, found after the cloning wars, and turned them into a\
small but profitable business.\
", 
      }, 
      [10008] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 10008, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Standing in Line", 
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
               ScriptType = "MProg", 
            }, 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 10007, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "You stand in a long line waiting for your turn to be cloned.\
There is nothing to do but stand here and wait.\
", 
      }, 
      [10009] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 10009, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "The Cloning Chamber", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 10004, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This large room contains the tops of some cloning cylinders, but from the\
rumors you have heard, there must be many more below this level. Many\
pipes and wires run haphazardly from the cylinders.   There is no way to\
enter the cloning chambers from here.  You must go stand in line.\
", 
      }, 
      [10010] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [10] = "Safe", 
         }, 
         Vnum = 10010, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "The Office", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 10007, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This large office contains a very fine wood desk as well as several\
expensive looking paintings. There is a small tree in one corner of the\
room and a large bookcase on one wall.\
", 
      }, 
      [10011] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 10011, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Storage Chamber", 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
   }, 
   FileFormatVersion = 1, 
   LowEconomy = 130040569, 
   Resets = 
   {
      [1] = 
      {
         MiscData = 1, 
         Arg1 = 10009, 
         Command = "M", 
         Arg3 = 10001, 
         Arg2 = 1, 
      }, 
      [2] = 
      {
         MiscData = 1, 
         Arg1 = 10001, 
         Command = "M", 
         Arg3 = 10010, 
         Arg2 = 1, 
      }, 
      [3] = 
      {
         MiscData = 1, 
         Arg1 = 10002, 
         Command = "M", 
         Arg3 = 10010, 
         Arg2 = 1, 
      }, 
      [4] = 
      {
         MiscData = 1, 
         Arg1 = 10003, 
         Command = "M", 
         Arg3 = 10010, 
         Arg2 = 1, 
      }, 
      [5] = 
      {
         MiscData = 1, 
         Arg1 = 10005, 
         Command = "M", 
         Arg3 = 10007, 
         Arg2 = 1, 
      }, 
      [6] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 10424, 
         Command = "G", 
      }, 
      [7] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 10314, 
         Command = "G", 
      }, 
      [8] = 
      {
         MiscData = 1, 
         Arg1 = 10004, 
         Command = "M", 
         Arg3 = 10009, 
         Arg2 = 1, 
      }, 
      [9] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 10004, 
         Command = "G", 
      }, 
      [10] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 10004, 
         Command = "G", 
      }, 
      [11] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 10004, 
         Command = "G", 
      }, 
      [12] = 
      {
         MiscData = 1, 
         Arg1 = 10001, 
         Command = "O", 
         Arg3 = 10009, 
         Arg2 = 1, 
      }, 
   }, 
   ResetMessage = "&CThe filtered air carries the distinct scent of medicine.", 
   Author = "Durga", 
   Name = "Cloning Station", 
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
   Filename = "cloning.lua", 
   Mobiles = 
   {
      [10000] = 
      {
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Position = "standing", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         ShortDescr = "a newly created firstmob", 
         Race = "Human", 
         Stats = 
         {
            Strength = 10, 
            Dexterity = 10, 
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Constitution = 10, 
            Intelligence = 10, 
         }, 
         Description = "", 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         HitRoll = 0, 
         Vnum = 10000, 
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
         Sex = "undistinguished", 
         Credits = 0, 
         DamRoll = 0, 
         Level = 1, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Name = "firstmob", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "Some god abandoned a newly created firstmob here.\
", 
         ArmorClass = 0, 
      }, 
      [10001] = 
      {
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 5, 
         }, 
         Position = "standing", 
         HitChance = 
         {
            HitPlus = 500, 
            HitSizeDice = 10, 
            HitNoDice = 10, 
         }, 
         ShortDescr = "Doctor Bnokkt", 
         Race = "Human", 
         Stats = 
         {
            Strength = 10, 
            Dexterity = 10, 
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Constitution = 10, 
            Intelligence = 10, 
         }, 
         Description = "", 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         HitRoll = 10, 
         Vnum = 10001, 
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
         Sex = "male", 
         Credits = 1000, 
         DamRoll = 10, 
         Level = 50, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
         }, 
         Name = "doctor Bnokkt", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "Doctor Bnokkt is the head of the cloning facilities.\
", 
         ArmorClass = -25, 
      }, 
      [10002] = 
      {
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 1, 
         }, 
         Position = "standing", 
         HitChance = 
         {
            HitPlus = 5000, 
            HitSizeDice = 10, 
            HitNoDice = 10, 
         }, 
         ShortDescr = "a c-7hp64 personal assistant droid", 
         Race = "Human", 
         Stats = 
         {
            Strength = 10, 
            Dexterity = 10, 
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Constitution = 10, 
            Intelligence = 10, 
         }, 
         Description = "", 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         DamRoll = 0, 
         HitRoll = 0, 
         Vnum = 10002, 
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
         Sex = "undistinguished", 
         Credits = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "death_prog", 
               Code = "mpoload 10003\
", 
               Arguments = "100", 
               ScriptType = "MProg", 
            }, 
         }, 
         Level = 50, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [26] = "Droid", 
         }, 
         Name = "c-7hp64 personal assistant droid", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A c-7hp64 personal assistant droid is here.\
", 
         ArmorClass = -25, 
      }, 
      [10003] = 
      {
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 10, 
         }, 
         Position = "standing", 
         HitChance = 
         {
            HitPlus = 1000, 
            HitSizeDice = 10, 
            HitNoDice = 20, 
         }, 
         ShortDescr = "a facility guard", 
         Race = "Human", 
         Stats = 
         {
            Strength = 10, 
            Dexterity = 10, 
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Constitution = 10, 
            Intelligence = 10, 
         }, 
         Description = "", 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         HitRoll = 20, 
         Vnum = 10003, 
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
         Sex = "undistinguished", 
         Credits = 0, 
         DamRoll = 20, 
         Level = 100, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Name = "facility guard", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A Facility guard stands at attention.\
", 
         ArmorClass = -150, 
      }, 
      [10004] = 
      {
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Position = "standing", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         ShortDescr = "a shapely nurse", 
         Race = "Human", 
         Stats = 
         {
            Strength = 10, 
            Dexterity = 10, 
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Constitution = 10, 
            Intelligence = 10, 
         }, 
         Description = "", 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         DamRoll = 0, 
         HitRoll = 0, 
         Vnum = 10004, 
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
         Sex = "undistinguished", 
         Credits = 0, 
         MudProgs = 
         {
            [1] = 
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
               ScriptType = "MProg", 
            }, 
            [2] = 
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
               ScriptType = "MProg", 
            }, 
         }, 
         Level = 1, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
         }, 
         Name = "Cloning Nurse", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A shapely nurse is standing here, handing out hospital clothes.\
", 
         ArmorClass = 0, 
      }, 
      [10005] = 
      {
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Position = "standing", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         ShortDescr = "A vending machine", 
         Race = "Astromech", 
         Stats = 
         {
            Strength = 10, 
            Dexterity = 10, 
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Constitution = 10, 
            Intelligence = 10, 
         }, 
         Description = "", 
         Alignment = 0, 
         NumberOfAttacks = 0, 
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
            ProfitBuy = 120, 
            ProfitSell = 90, 
            KeeperShortDescr = "A vending machine", 
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
         }, 
         HitRoll = 0, 
         Vnum = 10005, 
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
         Sex = "undistinguished", 
         Credits = 0, 
         DamRoll = 0, 
         Level = 1, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
         }, 
         Name = "A Vending Machine", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A vending machine rests against the wall here.\
", 
         ArmorClass = 0, 
      }, 
      [10009] = 
      {
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Position = "standing", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         ShortDescr = "a clerk", 
         Race = "Human", 
         Stats = 
         {
            Strength = 10, 
            Dexterity = 10, 
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Constitution = 10, 
            Intelligence = 10, 
         }, 
         Description = "", 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         HitRoll = 0, 
         Vnum = 10009, 
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
         Sex = "undistinguished", 
         Credits = 0, 
         DamRoll = 0, 
         Level = 1, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Name = "clerk", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A clerk is here to take your payment.\
", 
         ArmorClass = 0, 
      }, 
   }, 
}
