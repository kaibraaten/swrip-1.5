-- Cloning Station
-- Last saved Thursday 07-May-2020 14:47:57

AreaEntry
{
   ResetMessage = "&CThe filtered air carries the distinct scent of medicine.", 
   HighEconomy = 0, 
   Author = "Durga", 
   Rooms = 
   {
      [10000] = 
      {
         TeleVnum = 0, 
         Tunnel = 0, 
         Vnum = 10000, 
         TeleDelay = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "act_prog", 
               Arguments = "enters", 
               Code = "mpat 122 mpecho $n enters from a cloning chamber.\
", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
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
               Direction = "somewhere", 
               DestinationVnum = 10009, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Inside a Sparti Cloning Cylinder", 
         Flags = 
         {
            [2] = "NoMob", 
            [18] = "NoDrop", 
            [23] = "Hotel", 
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
      }, 
      [10001] = 
      {
         TeleVnum = 0, 
         Tunnel = 0, 
         Vnum = 10001, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 10007, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Pay Counter", 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Description = "After the long wait you are finally here. Now all that is left to do is to\
pay the clerk, sign a few papers and give a tissue sample. (To do this\
type \"clone\")\
", 
      }, 
      [10002] = 
      {
         TeleVnum = 0, 
         Tunnel = 0, 
         Vnum = 10002, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 10003, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "In a Small Sterile Room", 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Description = "This small room smells strongly of antiseptic.  There is a large flat\
table, that is covered with removable paper.  You assume that this is\
where blood and tissue samples are taken, as well as where new clones are\
examined. There are several medical instruments hanging on hooks on the\
walls.  Some of them look to horrible to even imagine their use.\
", 
      }, 
      [10003] = 
      {
         TeleVnum = 0, 
         Tunnel = 0, 
         Vnum = 10003, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 10002, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 10007, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 10004, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "A Clinic Hallway", 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Description = "This small hallway leads from the lobby of the facilities to a set of\
locked blastdoors.  To the east is a small doctor's office.  To the west\
is a large room filled with exercise equipment.\
", 
      }, 
      [10004] = 
      {
         TeleVnum = 0, 
         Tunnel = 0, 
         Vnum = 10004, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 10005, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 10003, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 10009, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Exercise Room.", 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Description = "This room is filled with various pieces of exercise equipment.   It is\
available for young clones to regain their strength as they become\
accustomed to their new forms after gestation and an accelerated growth\
period. All of the equipment has gauges to monitor the progress and vital\
signs of the clones.\
", 
      }, 
      [10005] = 
      {
         TeleVnum = 0, 
         Tunnel = 0, 
         Vnum = 10005, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 10004, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Rest Area", 
         Flags = 
         {
            [23] = "Hotel", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
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
         TeleVnum = 0, 
         Tunnel = 0, 
         Vnum = 10006, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 10007, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 32297, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Desert Landing Pad", 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
            [4] = "CanLand", 
         }, 
         Description = "You stand upon a small landing pad on a relatively unknown planet somewhere\
in the core worlds. Dense jungle surrounds this clearing, and the only\
manmade structure visible is a small building to the north. \
", 
      }, 
      [10007] = 
      {
         TeleVnum = 0, 
         Tunnel = 0, 
         Vnum = 10007, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 10003, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 10008, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 10006, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 10010, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "The cloning Facilities", 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
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
         TeleVnum = 0, 
         Tunnel = 0, 
         Vnum = 10008, 
         TeleDelay = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "100", 
               Code = "mpechoat $n You finally make it to the front of the line.\
mpechoaround $n $n Moves to the front of the line.\
mptransfer $n 10001\
", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 10007, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "Standing in Line", 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Description = "You stand in a long line waiting for your turn to be cloned.\
There is nothing to do but stand here and wait.\
", 
      }, 
      [10009] = 
      {
         TeleVnum = 0, 
         Tunnel = 0, 
         Vnum = 10009, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 10004, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "The Cloning Chamber", 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Description = "This large room contains the tops of some cloning cylinders, but from the\
rumors you have heard, there must be many more below this level. Many\
pipes and wires run haphazardly from the cylinders.   There is no way to\
enter the cloning chambers from here.  You must go stand in line.\
", 
      }, 
      [10010] = 
      {
         TeleVnum = 0, 
         Tunnel = 0, 
         Vnum = 10010, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 10007, 
               Key = -1, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Name = "The Office", 
         Flags = 
         {
            [10] = "Safe", 
         }, 
         Description = "This large office contains a very fine wood desk as well as several\
expensive looking paintings. There is a small tree in one corner of the\
room and a large bookcase on one wall.\
", 
      }, 
      [10011] = 
      {
         TeleVnum = 0, 
         Tunnel = 0, 
         Vnum = 10011, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
         }, 
         Name = "Storage Chamber", 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Description = "", 
      }, 
   }, 
   FileFormatVersion = 1, 
   VnumRanges = 
   {
      Room = 
      {
         Last = 10011, 
         First = 10000, 
      }, 
      Mob = 
      {
         Last = 10009, 
         First = 10000, 
      }, 
      Object = 
      {
         Last = 10009, 
         First = 10000, 
      }, 
   }, 
   Resets = 
   {
      [1] = 
      {
         Arg1 = 10009, 
         Arg2 = 1, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10001, 
      }, 
      [2] = 
      {
         Arg1 = 10001, 
         Arg2 = 1, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10010, 
      }, 
      [3] = 
      {
         Arg1 = 10002, 
         Arg2 = 1, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10010, 
      }, 
      [4] = 
      {
         Arg1 = 10003, 
         Arg2 = 1, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10010, 
      }, 
      [5] = 
      {
         Arg1 = 10005, 
         Arg2 = 1, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10007, 
      }, 
      [6] = 
      {
         Arg1 = 10424, 
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
      }, 
      [7] = 
      {
         Arg1 = 10314, 
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
      }, 
      [8] = 
      {
         Arg1 = 10004, 
         Arg2 = 1, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 10009, 
      }, 
      [9] = 
      {
         Arg1 = 10004, 
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
      }, 
      [10] = 
      {
         Arg1 = 10004, 
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
      }, 
      [11] = 
      {
         Arg1 = 10004, 
         MiscData = 1, 
         Command = "G", 
         Arg2 = 1, 
      }, 
      [12] = 
      {
         Arg1 = 10001, 
         Arg2 = 1, 
         Command = "O", 
         MiscData = 1, 
         Arg3 = 10009, 
      }, 
   }, 
   Objects = 
   {
      [10000] = 
      {
         ShortDescr = "a newly created bookend", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 10000, 
         ActionDescription = "", 
         Cost = 0, 
         ItemType = "trash", 
         Weight = 1, 
         Layers = 0, 
         Name = "bookend", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Description = "Some god dropped a newly created bookend here.", 
      }, 
      [10001] = 
      {
         ShortDescr = "a sparti cloning cylinder", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 10001, 
         ActionDescription = "", 
         Cost = 0, 
         ItemType = "trash", 
         Weight = 1, 
         Layers = 0, 
         Name = "sparti cloning cylinder", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Description = "A sparti cloning cylinder is here.", 
      }, 
      [10002] = 
      {
         ShortDescr = "a newly created desc", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 10002, 
         ActionDescription = "", 
         Cost = 0, 
         ItemType = "trash", 
         Weight = 1, 
         Layers = 0, 
         Name = "desc", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Description = "Some god dropped a newly created desc here.", 
      }, 
      [10003] = 
      {
         ShortDescr = "the deed", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 10003, 
         ActionDescription = "", 
         Cost = 0, 
         ItemType = "government", 
         Weight = 1, 
         Layers = 0, 
         Name = "facility deed ", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Description = "OOooOOoo the deed to the cloning facilities is here.", 
      }, 
      [10004] = 
      {
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
         Vnum = 10004, 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
            [10] = "About", 
         }, 
         ItemType = "armor", 
         Weight = 3, 
         Layers = 0, 
         Name = "Hospital Scrubs", 
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         Description = "White hospital scrubs have been discarded in a pile here.", 
      }, 
      [10009] = 
      {
         ShortDescr = "a newly created sparti cloning cylinder", 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 10009, 
         ActionDescription = "", 
         Cost = 0, 
         ItemType = "trash", 
         Weight = 1, 
         Layers = 0, 
         Name = "sparti cloning cylinder", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Description = "Some god dropped a newly created sparti cloning cylinder here.", 
      }, 
   }, 
   Filename = "cloning.lua", 
   LevelRanges = 
   {
      Soft = 
      {
         Low = 0, 
         High = 103, 
      }, 
      Hard = 
      {
         Low = 0, 
         High = 103, 
      }, 
   }, 
   Mobiles = 
   {
      [10000] = 
      {
         ShortDescr = "a newly created firstmob", 
         HitRoll = 0, 
         NumberOfAttacks = 0, 
         Stats = 
         {
            Wisdom = 10, 
            Constitution = 10, 
            Charisma = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Force = 0, 
            Intelligence = 10, 
         }, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         Weight = 0, 
         Flags = 
         {
            [0] = "Npc", 
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
         LongDescr = "Some god abandoned a newly created firstmob here.\
", 
         Credits = 0, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         DamRoll = 0, 
         ArmorClass = 0, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         Race = "Human", 
         Height = 0, 
         Alignment = 0, 
         Level = 1, 
         DefaultPosition = "standing", 
         Vnum = 10000, 
         Sex = "undistinguished", 
         Name = "firstmob", 
         Position = "standing", 
         Description = "", 
      }, 
      [10001] = 
      {
         ShortDescr = "Doctor Bnokkt", 
         HitRoll = 10, 
         NumberOfAttacks = 0, 
         Stats = 
         {
            Wisdom = 13, 
            Constitution = 13, 
            Charisma = 13, 
            Luck = 13, 
            Dexterity = 13, 
            Strength = 13, 
            Force = 0, 
            Intelligence = 13, 
         }, 
         HitChance = 
         {
            HitNoDice = 10, 
            HitPlus = 500, 
            HitSizeDice = 10, 
         }, 
         Weight = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
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
         LongDescr = "Doctor Bnokkt is the head of the cloning facilities.\
", 
         Credits = 1000, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         DamRoll = 10, 
         ArmorClass = -25, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamNoDice = 5, 
            DamPlus = 2, 
         }, 
         Race = "Human", 
         Height = 0, 
         Alignment = 0, 
         Level = 50, 
         DefaultPosition = "standing", 
         Vnum = 10001, 
         Sex = "male", 
         Name = "doctor Bnokkt", 
         Position = "standing", 
         Description = "", 
      }, 
      [10002] = 
      {
         ShortDescr = "a c-7hp64 personal assistant droid", 
         HitRoll = 0, 
         NumberOfAttacks = 0, 
         Stats = 
         {
            Wisdom = 10, 
            Constitution = 10, 
            Charisma = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Force = 0, 
            Intelligence = 10, 
         }, 
         HitChance = 
         {
            HitNoDice = 10, 
            HitPlus = 5000, 
            HitSizeDice = 10, 
         }, 
         Weight = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [26] = "Droid", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "death_prog", 
               Arguments = "100", 
               Code = "mpoload 10003\
", 
            }, 
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
         LongDescr = "A c-7hp64 personal assistant droid is here.\
", 
         Credits = 0, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         DamRoll = 0, 
         ArmorClass = -25, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamNoDice = 1, 
            DamPlus = 2, 
         }, 
         Race = "Human", 
         Height = 0, 
         Alignment = 0, 
         Level = 50, 
         DefaultPosition = "standing", 
         Vnum = 10002, 
         Sex = "undistinguished", 
         Name = "c-7hp64 personal assistant droid", 
         Position = "standing", 
         Description = "", 
      }, 
      [10003] = 
      {
         ShortDescr = "a facility guard", 
         HitRoll = 20, 
         NumberOfAttacks = 0, 
         Stats = 
         {
            Wisdom = 13, 
            Constitution = 13, 
            Charisma = 13, 
            Luck = 13, 
            Dexterity = 13, 
            Strength = 13, 
            Force = 0, 
            Intelligence = 13, 
         }, 
         HitChance = 
         {
            HitNoDice = 20, 
            HitPlus = 1000, 
            HitSizeDice = 10, 
         }, 
         Weight = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
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
         LongDescr = "A Facility guard stands at attention.\
", 
         Credits = 0, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         DamRoll = 20, 
         ArmorClass = -150, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamNoDice = 10, 
            DamPlus = 2, 
         }, 
         Race = "Human", 
         Height = 0, 
         Alignment = 0, 
         Level = 100, 
         DefaultPosition = "standing", 
         Vnum = 10003, 
         Sex = "undistinguished", 
         Name = "facility guard", 
         Position = "standing", 
         Description = "", 
      }, 
      [10004] = 
      {
         ShortDescr = "a shapely nurse", 
         HitRoll = 0, 
         NumberOfAttacks = 0, 
         Stats = 
         {
            Wisdom = 10, 
            Constitution = 10, 
            Charisma = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Force = 0, 
            Intelligence = 10, 
         }, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         Weight = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "speech_prog", 
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
            }, 
            [2] = 
            {
               MudProgType = "act_prog", 
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
            }, 
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
         LongDescr = "A shapely nurse is standing here, handing out hospital clothes.\
", 
         Credits = 0, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         DamRoll = 0, 
         ArmorClass = 0, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         Race = "Human", 
         Height = 0, 
         Alignment = 0, 
         Level = 1, 
         DefaultPosition = "standing", 
         Vnum = 10004, 
         Sex = "undistinguished", 
         Name = "Cloning Nurse", 
         Position = "standing", 
         Description = "", 
      }, 
      [10005] = 
      {
         ShortDescr = "A vending machine", 
         HitRoll = 0, 
         NumberOfAttacks = 0, 
         Stats = 
         {
            Wisdom = 10, 
            Constitution = 10, 
            Charisma = 10, 
            Luck = 10, 
            Dexterity = 25, 
            Strength = 10, 
            Force = 0, 
            Intelligence = 10, 
         }, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         Weight = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
         }, 
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
         LongDescr = "A vending machine rests against the wall here.\
", 
         Credits = 0, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
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
            ProfitSell = 90, 
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            KeeperShortDescr = "A vending machine", 
            ProfitBuy = 120, 
         }, 
         ArmorClass = 0, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         Race = "Astromech", 
         Height = 0, 
         Alignment = 0, 
         Level = 1, 
         DefaultPosition = "standing", 
         Vnum = 10005, 
         Sex = "undistinguished", 
         Name = "A Vending Machine", 
         Position = "standing", 
         Description = "", 
      }, 
      [10009] = 
      {
         ShortDescr = "a clerk", 
         HitRoll = 0, 
         NumberOfAttacks = 0, 
         Stats = 
         {
            Wisdom = 10, 
            Constitution = 10, 
            Charisma = 10, 
            Luck = 10, 
            Dexterity = 10, 
            Strength = 10, 
            Force = 0, 
            Intelligence = 10, 
         }, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         Weight = 0, 
         Flags = 
         {
            [0] = "Npc", 
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
         LongDescr = "A clerk is here to take your payment.\
", 
         Credits = 0, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Breath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         DamRoll = 0, 
         ArmorClass = 0, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         Race = "Human", 
         Height = 0, 
         Alignment = 0, 
         Level = 1, 
         DefaultPosition = "standing", 
         Vnum = 10009, 
         Sex = "undistinguished", 
         Name = "clerk", 
         Position = "standing", 
         Description = "", 
      }, 
   }, 
   Name = "Cloning Station", 
   LowEconomy = 130048569, 
   ResetFrequency = 0, 
}
