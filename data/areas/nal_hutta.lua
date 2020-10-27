-- Nal Hutta
-- Last saved Tuesday 27-Oct-2020 11:58:44

AreaEntry
{
   Objects = 
   {
      [21500] = 
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
         Description = "Universe Construction Board rests on the wall here.", 
         Name = "board terminal", 
         ShortDescr = "Universe Construction Board", 
         Layers = 0, 
         Cost = 0, 
         ExtraDescriptions = 
         {
         }, 
         Weight = 1, 
         ItemType = "trash", 
         Vnum = 21500, 
      }, 
      [21501] = 
      {
         Flags = 
         {
            [0] = "Glow", 
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
         Description = "&g A Tk_9U slot machine rest on the wall.", 
         Name = "slot machine ", 
         ShortDescr = "A TK_9U Slot Machine", 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpecho You have just reset the Machine! Pull for Money!\
", 
               ScriptType = "MProg", 
               Arguments = "", 
               MudProgType = "push_prog", 
            }, 
            [2] = 
            {
               Code = "mpecho Bing .bang Baong!\
mpecho You see small pictures of rotate in circles showing up in various\
forms.\
", 
               ScriptType = "MProg", 
               Arguments = "", 
               MudProgType = "pull_prog", 
            }, 
         }, 
         Layers = 0, 
         Cost = 0, 
         ExtraDescriptions = 
         {
         }, 
         Weight = 1, 
         ItemType = "lever", 
         Vnum = 21501, 
      }, 
      [21799] = 
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
         Description = "A bookend is here.", 
         Name = "bookend", 
         ShortDescr = "a bookend", 
         Layers = 0, 
         Cost = 0, 
         ExtraDescriptions = 
         {
         }, 
         Weight = 1, 
         ItemType = "trash", 
         Vnum = 21799, 
      }, 
   }, 
   ResetMessage = "", 
   Author = "Ackbar", 
   LowEconomy = 6250000, 
   HighEconomy = 0, 
   Name = "Nal Hutta", 
   FileFormatVersion = 1, 
   VnumRanges = 
   {
      Mob = 
      {
         Last = 21799, 
         First = 21500, 
      }, 
      Room = 
      {
         Last = 21515, 
         First = 21500, 
      }, 
      Object = 
      {
         Last = 21799, 
         First = 21500, 
      }, 
   }, 
   Mobiles = 
   {
      [21500] = 
      {
         Weight = 0, 
         Description = "", 
         Name = "mobhead", 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         Sex = "undistinguished", 
         LongDescr = "Leave this reset until you make a new one. If you don't have at least one bad things will happen.\
", 
         Credits = 0, 
         Vnum = 21500, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Height = 0, 
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
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Force = 0, 
            Dexterity = 10, 
            Strength = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Constitution = 10, 
            Luck = 10, 
            Intelligence = 10, 
         }, 
         HitRoll = 0, 
         ShortDescr = "a newly created mobhead", 
         Level = 1, 
         DamRoll = 0, 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         ArmorClass = 0, 
         Race = "Human", 
         Position = "standing", 
      }, 
      [21799] = 
      {
         Weight = 0, 
         Description = "", 
         Name = "mobtail", 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         Sex = "undistinguished", 
         LongDescr = "Some god abandoned a newly created mobtail here.\
", 
         Credits = 0, 
         Vnum = 21799, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Height = 0, 
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
            Breath = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            PoisonDeath = 0, 
         }, 
         Stats = 
         {
            Force = 0, 
            Dexterity = 10, 
            Strength = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Constitution = 10, 
            Luck = 10, 
            Intelligence = 10, 
         }, 
         HitRoll = 0, 
         ShortDescr = "a newly created mobtail", 
         Level = 1, 
         DamRoll = 0, 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         ArmorClass = 0, 
         Race = "Human", 
         Position = "standing", 
      }, 
   }, 
   Rooms = 
   {
      [21504] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleVnum = 0, 
         Tag = "", 
         Description = "", 
         Name = "Floating in a void", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
         }, 
         Sector = "city", 
         Vnum = 21504, 
      }, 
      [21505] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleVnum = 0, 
         Tag = "", 
         Description = "", 
         Name = "Floating in a void", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
         }, 
         Sector = "city", 
         Vnum = 21505, 
      }, 
      [21506] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleVnum = 0, 
         Tag = "", 
         Description = "", 
         Name = "Floating in a void", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
         }, 
         Sector = "city", 
         Vnum = 21506, 
      }, 
      [21507] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleVnum = 0, 
         Tag = "", 
         Description = "", 
         Name = "Floating in a void", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
         }, 
         Sector = "city", 
         Vnum = 21507, 
      }, 
      [21508] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleVnum = 0, 
         Tag = "", 
         Description = "", 
         Name = "Floating in a void", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
         }, 
         Sector = "city", 
         Vnum = 21508, 
      }, 
      [21509] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleVnum = 0, 
         Tag = "", 
         Description = "", 
         Name = "Floating in a void", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
         }, 
         Sector = "city", 
         Vnum = 21509, 
      }, 
      [21510] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleVnum = 0, 
         Tag = "", 
         Description = "", 
         Name = "Floating in a void", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
         }, 
         Sector = "city", 
         Vnum = 21510, 
      }, 
      [21511] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleVnum = 0, 
         Tag = "", 
         Description = "", 
         Name = "Floating in a void", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
         }, 
         Sector = "city", 
         Vnum = 21511, 
      }, 
      [21512] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleVnum = 0, 
         Tag = "", 
         Description = "", 
         Name = "Floating in a void", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
         }, 
         Sector = "city", 
         Vnum = 21512, 
      }, 
      [21513] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleVnum = 0, 
         Tag = "", 
         Description = "", 
         Name = "Floating in a void", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
         }, 
         Sector = "city", 
         Vnum = 21513, 
      }, 
      [21514] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleVnum = 0, 
         Tag = "", 
         Description = "", 
         Name = "Floating in a void", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
         }, 
         Sector = "city", 
         Vnum = 21514, 
      }, 
      [21515] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleVnum = 0, 
         Tag = "", 
         Description = "", 
         Name = "Floating in a void", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
         }, 
         Sector = "city", 
         Vnum = 21515, 
      }, 
      [21500] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleVnum = 0, 
         Tag = "", 
         Description = "I will start building with this number ...Durga please separtae the world\
form this point!\
", 
         Name = "Begiing of zone Nal HUTTA", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
         }, 
         Sector = "city", 
         Vnum = 21500, 
      }, 
      [21501] = 
      {
         TeleVnum = 0, 
         Tag = "", 
         Description = "A clearing in the large terrestrial planet of Nal Hutta. There are some\
burn marks from transport vehicle exahust on the ground. From the tracks\
and burn circles you can tell this area recives alot of trafic. Looking up\
into the sky you can see the nearby moon, Nar Shada and what appears to be\
lights form the eciting citys of above. Looking up to the west you can see\
a red outline of a nearby gas cloud. There is a wide path heading toward\
the east and one to the west from here. \
", 
         Name = "A Landing Clearing", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 21502, 
               Description = "", 
               Distance = 0, 
               Direction = "east", 
            }, 
         }, 
         Sector = "city", 
         Vnum = 21501, 
      }, 
      [21502] = 
      {
         TeleVnum = 0, 
         Tag = "", 
         Description = "", 
         Name = "Floating in a void", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 21503, 
               Description = "", 
               Distance = 0, 
               Direction = "south", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 21501, 
               Description = "", 
               Distance = 0, 
               Direction = "west", 
            }, 
         }, 
         Sector = "city", 
         Vnum = 21502, 
      }, 
      [21503] = 
      {
         TeleVnum = 0, 
         Tag = "", 
         Description = "", 
         Name = "Floating in a void", 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               DestinationVnum = 21502, 
               Description = "", 
               Distance = 0, 
               Direction = "north", 
            }, 
         }, 
         Sector = "city", 
         Vnum = 21503, 
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
         High = 105, 
         Low = 0, 
      }, 
   }, 
   Filename = "nal_hutta.lua", 
   ResetFrequency = 0, 
   Resets = 
   {
      [1] = 
      {
         Command = "M", 
         Arg1 = 21500, 
         MiscData = 1, 
         Arg3 = 21500, 
         Arg2 = 1, 
      }, 
      [2] = 
      {
         Command = "O", 
         Arg1 = 21500, 
         MiscData = 1, 
         Arg3 = 21186, 
         Arg2 = 1, 
      }, 
      [3] = 
      {
         Command = "D", 
         Arg1 = 21186, 
         MiscData = 0, 
         Arg3 = 0, 
         Arg2 = 2, 
      }, 
   }, 
}
