-- Cloning Station
-- Last saved Thursday 09-Jul-2020 21:56:48

AreaEntry
{
   HighEconomy = 0, 
   Objects = 
   {
      [10000] = 
      {
         Weight = 1, 
         ItemType = "trash", 
         ShortDescr = "a newly created bookend", 
         Name = "bookend", 
         Layers = 0, 
         Vnum = 10000, 
         ExtraDescriptions = 
         {
         }, 
         Description = "Some god dropped a newly created bookend here.", 
         Cost = 0, 
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
         Weight = 1, 
         ItemType = "trash", 
         ShortDescr = "a sparti cloning cylinder", 
         Name = "sparti cloning cylinder", 
         Layers = 0, 
         Vnum = 10001, 
         ExtraDescriptions = 
         {
         }, 
         Description = "A sparti cloning cylinder is here.", 
         Cost = 0, 
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
         Weight = 1, 
         ItemType = "trash", 
         ShortDescr = "a newly created desc", 
         Name = "desc", 
         Layers = 0, 
         Vnum = 10002, 
         ExtraDescriptions = 
         {
         }, 
         Description = "Some god dropped a newly created desc here.", 
         Cost = 0, 
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
         Weight = 1, 
         ItemType = "government", 
         ShortDescr = "the deed", 
         Name = "facility deed ", 
         Layers = 0, 
         Vnum = 10003, 
         ExtraDescriptions = 
         {
         }, 
         Description = "OOooOOoo the deed to the cloning facilities is here.", 
         Cost = 0, 
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
         Weight = 3, 
         ItemType = "armor", 
         ShortDescr = "White hospital scrubs", 
         Name = "Hospital Scrubs", 
         Layers = 0, 
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
         Vnum = 10004, 
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
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
            [10] = "About", 
         }, 
      }, 
      [10009] = 
      {
         Weight = 1, 
         ItemType = "trash", 
         ShortDescr = "a newly created sparti cloning cylinder", 
         Name = "sparti cloning cylinder", 
         Layers = 0, 
         Vnum = 10009, 
         ExtraDescriptions = 
         {
         }, 
         Description = "Some god dropped a newly created sparti cloning cylinder here.", 
         Cost = 0, 
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
   Rooms = 
   {
      [10000] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [18] = "NoDrop", 
            [23] = "Hotel", 
         }, 
         TeleDelay = 0, 
         Name = "Inside a Sparti Cloning Cylinder", 
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
         Vnum = 10000, 
         ExtraDescriptions = 
         {
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
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [11] = "Hidden", 
               }, 
               Description = "", 
               DestinationVnum = 10009, 
               Direction = "somewhere", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [10001] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "Pay Counter", 
         Vnum = 10001, 
         ExtraDescriptions = 
         {
         }, 
         Description = "After the long wait you are finally here. Now all that is left to do is to\
pay the clerk, sign a few papers and give a tissue sample. (To do this\
type \"clone\")\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 10007, 
               Direction = "west", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [10002] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "In a Small Sterile Room", 
         Vnum = 10002, 
         ExtraDescriptions = 
         {
         }, 
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
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 10003, 
               Direction = "west", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [10003] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "A Clinic Hallway", 
         Vnum = 10003, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This small hallway leads from the lobby of the facilities to a set of\
locked blastdoors.  To the east is a small doctor's office.  To the west\
is a large room filled with exercise equipment.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 10002, 
               Direction = "east", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 10007, 
               Direction = "south", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 10004, 
               Direction = "west", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [10004] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "Exercise Room.", 
         Vnum = 10004, 
         ExtraDescriptions = 
         {
         }, 
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
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 10005, 
               Direction = "north", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 10003, 
               Direction = "east", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 10009, 
               Direction = "south", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [10005] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [23] = "Hotel", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "Rest Area", 
         Vnum = 10005, 
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
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 10004, 
               Direction = "south", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [10006] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
            [4] = "CanLand", 
         }, 
         TeleDelay = 0, 
         Name = "Desert Landing Pad", 
         Vnum = 10006, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You stand upon a small landing pad on a relatively unknown planet somewhere\
in the core worlds. Dense jungle surrounds this clearing, and the only\
manmade structure visible is a small building to the north. \
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 10007, 
               Direction = "north", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 32297, 
               Direction = "east", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [10007] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "The cloning Facilities", 
         Vnum = 10007, 
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
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 10003, 
               Direction = "north", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 10008, 
               Direction = "east", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 10006, 
               Direction = "south", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 10010, 
               Direction = "west", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [10008] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "Standing in Line", 
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
         Vnum = 10008, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You stand in a long line waiting for your turn to be cloned.\
There is nothing to do but stand here and wait.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 10007, 
               Direction = "west", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [10009] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "The Cloning Chamber", 
         Vnum = 10009, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This large room contains the tops of some cloning cylinders, but from the\
rumors you have heard, there must be many more below this level. Many\
pipes and wires run haphazardly from the cylinders.   There is no way to\
enter the cloning chambers from here.  You must go stand in line.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 10004, 
               Direction = "north", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [10010] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [10] = "Safe", 
         }, 
         TeleDelay = 0, 
         Name = "The Office", 
         Vnum = 10010, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This large office contains a very fine wood desk as well as several\
expensive looking paintings. There is a small tree in one corner of the\
room and a large bookcase on one wall.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 10007, 
               Direction = "east", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [10011] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "Storage Chamber", 
         Vnum = 10011, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Exits = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
   }, 
   Author = "Durga", 
   ResetMessage = "&CThe filtered air carries the distinct scent of medicine.", 
   Name = "Cloning Station", 
   Resets = 
   {
      [1] = 
      {
         Arg3 = 10001, 
         Command = "M", 
         Arg2 = 1, 
         Arg1 = 10009, 
         MiscData = 1, 
      }, 
      [2] = 
      {
         Arg3 = 10010, 
         Command = "M", 
         Arg2 = 1, 
         Arg1 = 10001, 
         MiscData = 1, 
      }, 
      [3] = 
      {
         Arg3 = 10010, 
         Command = "M", 
         Arg2 = 1, 
         Arg1 = 10002, 
         MiscData = 1, 
      }, 
      [4] = 
      {
         Arg3 = 10010, 
         Command = "M", 
         Arg2 = 1, 
         Arg1 = 10003, 
         MiscData = 1, 
      }, 
      [5] = 
      {
         Arg3 = 10007, 
         Command = "M", 
         Arg2 = 1, 
         Arg1 = 10005, 
         MiscData = 1, 
      }, 
      [6] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg1 = 10424, 
         Arg2 = 1, 
      }, 
      [7] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg1 = 10314, 
         Arg2 = 1, 
      }, 
      [8] = 
      {
         Arg3 = 10009, 
         Command = "M", 
         Arg2 = 1, 
         Arg1 = 10004, 
         MiscData = 1, 
      }, 
      [9] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg1 = 10004, 
         Arg2 = 1, 
      }, 
      [10] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg1 = 10004, 
         Arg2 = 1, 
      }, 
      [11] = 
      {
         MiscData = 1, 
         Command = "G", 
         Arg1 = 10004, 
         Arg2 = 1, 
      }, 
      [12] = 
      {
         Arg3 = 10009, 
         Command = "O", 
         Arg2 = 1, 
         Arg1 = 10001, 
         MiscData = 1, 
      }, 
   }, 
   LowEconomy = 130043569, 
   Mobiles = 
   {
      [10000] = 
      {
         Race = "Human", 
         Stats = 
         {
            Constitution = 0, 
            Wisdom = 0, 
            Dexterity = 0, 
            Intelligence = 0, 
            Luck = 0, 
            Strength = 0, 
            Charisma = 0, 
            Force = 0, 
         }, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         LongDescr = "Some god abandoned a newly created firstmob here.\
", 
         Level = 1, 
         Position = "standing", 
         Vnum = 10000, 
         Alignment = 0, 
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
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
         }, 
         DamRoll = 0, 
         HitRoll = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         ShortDescr = "a newly created firstmob", 
         Weight = 0, 
         Name = "firstmob", 
         Height = 0, 
         Sex = "undistinguished", 
         Credits = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         ArmorClass = 0, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 0, 
         Description = "", 
      }, 
      [10001] = 
      {
         Race = "Human", 
         Stats = 
         {
            Constitution = 0, 
            Wisdom = 0, 
            Dexterity = 0, 
            Intelligence = 0, 
            Luck = 0, 
            Strength = 0, 
            Charisma = 0, 
            Force = 0, 
         }, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitNoDice = 10, 
            HitPlus = 500, 
         }, 
         LongDescr = "Doctor Bnokkt is the head of the cloning facilities.\
", 
         Level = 50, 
         Position = "standing", 
         Vnum = 10001, 
         Alignment = 0, 
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
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
         }, 
         DamRoll = 10, 
         HitRoll = 10, 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 5, 
         }, 
         ShortDescr = "Doctor Bnokkt", 
         Weight = 0, 
         Name = "doctor Bnokkt", 
         Height = 0, 
         Sex = "male", 
         Credits = 1000, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
         }, 
         ArmorClass = -25, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 0, 
         Description = "", 
      }, 
      [10002] = 
      {
         Race = "Human", 
         Stats = 
         {
            Constitution = 0, 
            Wisdom = 0, 
            Dexterity = 0, 
            Intelligence = 0, 
            Luck = 0, 
            Strength = 0, 
            Charisma = 0, 
            Force = 0, 
         }, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitNoDice = 10, 
            HitPlus = 5000, 
         }, 
         LongDescr = "A c-7hp64 personal assistant droid is here.\
", 
         Level = 50, 
         Position = "standing", 
         Vnum = 10002, 
         Alignment = 0, 
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
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
         }, 
         DamRoll = 0, 
         HitRoll = 0, 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 1, 
         }, 
         ShortDescr = "a c-7hp64 personal assistant droid", 
         Weight = 0, 
         Name = "c-7hp64 personal assistant droid", 
         Height = 0, 
         Sex = "undistinguished", 
         Credits = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [26] = "Droid", 
         }, 
         ArmorClass = -25, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 0, 
         Description = "", 
      }, 
      [10003] = 
      {
         Race = "Human", 
         Stats = 
         {
            Constitution = 0, 
            Wisdom = 0, 
            Dexterity = 0, 
            Intelligence = 0, 
            Luck = 0, 
            Strength = 0, 
            Charisma = 0, 
            Force = 0, 
         }, 
         HitChance = 
         {
            HitSizeDice = 10, 
            HitNoDice = 20, 
            HitPlus = 1000, 
         }, 
         LongDescr = "A Facility guard stands at attention.\
", 
         Level = 100, 
         Position = "standing", 
         Vnum = 10003, 
         Alignment = 0, 
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
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
         }, 
         DamRoll = 20, 
         HitRoll = 20, 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 10, 
         }, 
         ShortDescr = "a facility guard", 
         Weight = 0, 
         Name = "facility guard", 
         Height = 0, 
         Sex = "undistinguished", 
         Credits = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         ArmorClass = -150, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 0, 
         Description = "", 
      }, 
      [10004] = 
      {
         Race = "Human", 
         Stats = 
         {
            Constitution = 0, 
            Wisdom = 0, 
            Dexterity = 0, 
            Intelligence = 0, 
            Luck = 0, 
            Strength = 0, 
            Charisma = 0, 
            Force = 0, 
         }, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         LongDescr = "A shapely nurse is standing here, handing out hospital clothes.\
", 
         Level = 1, 
         Position = "standing", 
         Vnum = 10004, 
         Alignment = 0, 
         MudProgs = 
         {
            [1] = 
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
            [2] = 
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
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
         }, 
         DamRoll = 0, 
         HitRoll = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         ShortDescr = "a shapely nurse", 
         Weight = 0, 
         Name = "Cloning Nurse", 
         Height = 0, 
         Sex = "undistinguished", 
         Credits = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
         }, 
         ArmorClass = 0, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 0, 
         Description = "", 
      }, 
      [10005] = 
      {
         Race = "Astromech", 
         Stats = 
         {
            Constitution = 0, 
            Wisdom = 0, 
            Dexterity = 0, 
            Intelligence = 0, 
            Luck = 0, 
            Strength = 0, 
            Charisma = 0, 
            Force = 0, 
         }, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         LongDescr = "A vending machine rests against the wall here.\
", 
         Level = 1, 
         Position = "standing", 
         Vnum = 10005, 
         Alignment = 0, 
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
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
         }, 
         DamRoll = 0, 
         HitRoll = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         ShortDescr = "A vending machine", 
         Weight = 0, 
         Name = "A Vending Machine", 
         Height = 0, 
         Sex = "undistinguished", 
         Credits = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
         }, 
         ArmorClass = 0, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 0, 
         Description = "", 
      }, 
      [10009] = 
      {
         Race = "Human", 
         Stats = 
         {
            Constitution = 0, 
            Wisdom = 0, 
            Dexterity = 0, 
            Intelligence = 0, 
            Luck = 0, 
            Strength = 0, 
            Charisma = 0, 
            Force = 0, 
         }, 
         HitChance = 
         {
            HitSizeDice = 0, 
            HitNoDice = 0, 
            HitPlus = 0, 
         }, 
         LongDescr = "A clerk is here to take your payment.\
", 
         Level = 1, 
         Position = "standing", 
         Vnum = 10009, 
         Alignment = 0, 
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
            SpellStaff = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
         }, 
         DamRoll = 0, 
         HitRoll = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         ShortDescr = "a clerk", 
         Weight = 0, 
         Name = "clerk", 
         Height = 0, 
         Sex = "undistinguished", 
         Credits = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         ArmorClass = 0, 
         DefaultPosition = "standing", 
         NumberOfAttacks = 0, 
         Description = "", 
      }, 
   }, 
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
   FileFormatVersion = 1, 
   ResetFrequency = 0, 
   Filename = "cloning.lua", 
}
