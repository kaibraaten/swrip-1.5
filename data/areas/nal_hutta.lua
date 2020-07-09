-- Nal Hutta
-- Last saved Thursday 09-Jul-2020 21:56:48

AreaEntry
{
   Mobiles = 
   {
      [21500] = 
      {
         DefaultPosition = "standing", 
         Level = 1, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            Breath = 0, 
         }, 
         Description = "", 
         ShortDescr = "a newly created mobhead", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         ArmorClass = 0, 
         NumberOfAttacks = 0, 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Sex = "undistinguished", 
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
         Stats = 
         {
            Force = 0, 
            Luck = 0, 
            Strength = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Wisdom = 0, 
            Intelligence = 0, 
         }, 
         DamRoll = 0, 
         HitRoll = 0, 
         Race = "Human", 
         LongDescr = "Leave this reset until you make a new one. If you don't have at least one bad things will happen.\
", 
         Credits = 0, 
         Weight = 0, 
         Height = 0, 
         Name = "mobhead", 
         Alignment = 0, 
         Position = "standing", 
         Vnum = 21500, 
      }, 
      [21799] = 
      {
         DefaultPosition = "standing", 
         Level = 1, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            Breath = 0, 
         }, 
         Description = "", 
         ShortDescr = "a newly created mobtail", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         ArmorClass = 0, 
         NumberOfAttacks = 0, 
         Damage = 
         {
            DamNoDice = 0, 
            DamSizeDice = 0, 
            DamPlus = 0, 
         }, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Sex = "undistinguished", 
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
         Stats = 
         {
            Force = 0, 
            Luck = 0, 
            Strength = 0, 
            Constitution = 0, 
            Charisma = 0, 
            Dexterity = 0, 
            Wisdom = 0, 
            Intelligence = 0, 
         }, 
         DamRoll = 0, 
         HitRoll = 0, 
         Race = "Human", 
         LongDescr = "Some god abandoned a newly created mobtail here.\
", 
         Credits = 0, 
         Weight = 0, 
         Height = 0, 
         Name = "mobtail", 
         Alignment = 0, 
         Position = "standing", 
         Vnum = 21799, 
      }, 
   }, 
   ResetFrequency = 0, 
   ResetMessage = "", 
   Objects = 
   {
      [21500] = 
      {
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Weight = 1, 
         ItemType = "trash", 
         Description = "Universe Construction Board rests on the wall here.", 
         Vnum = 21500, 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "", 
         Name = "board terminal", 
         Layers = 0, 
         Cost = 0, 
         ShortDescr = "Universe Construction Board", 
      }, 
      [21501] = 
      {
         Flags = 
         {
            [0] = "Glow", 
         }, 
         Weight = 1, 
         ItemType = "lever", 
         Description = "&g A Tk_9U slot machine rest on the wall.", 
         Vnum = 21501, 
         ExtraDescriptions = 
         {
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "push_prog", 
               Code = "mpecho You have just reset the Machine! Pull for Money!\
", 
               Arguments = "", 
            }, 
            [2] = 
            {
               MudProgType = "pull_prog", 
               Code = "mpecho Bing .bang Baong!\
mpecho You see small pictures of rotate in circles showing up in various\
forms.\
", 
               Arguments = "", 
            }, 
         }, 
         Cost = 0, 
         ActionDescription = "", 
         Name = "slot machine ", 
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
         ShortDescr = "A TK_9U Slot Machine", 
      }, 
      [21799] = 
      {
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Weight = 1, 
         ItemType = "trash", 
         Description = "A bookend is here.", 
         Vnum = 21799, 
         ExtraDescriptions = 
         {
         }, 
         ActionDescription = "", 
         Name = "bookend", 
         Layers = 0, 
         Cost = 0, 
         ShortDescr = "a bookend", 
      }, 
   }, 
   Resets = 
   {
      [1] = 
      {
         Command = "M", 
         Arg3 = 21500, 
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 21500, 
      }, 
      [2] = 
      {
         Command = "O", 
         Arg3 = 21186, 
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 21500, 
      }, 
      [3] = 
      {
         Command = "D", 
         Arg3 = 0, 
         Arg2 = 2, 
         MiscData = 0, 
         Arg1 = 21186, 
      }, 
   }, 
   HighEconomy = 0, 
   Author = "Ackbar", 
   Rooms = 
   {
      [21504] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
         Vnum = 21504, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Floating in a void", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [21505] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
         Vnum = 21505, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Floating in a void", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [21506] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
         Vnum = 21506, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Floating in a void", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [21507] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
         Vnum = 21507, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Floating in a void", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [21508] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
         Vnum = 21508, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Floating in a void", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [21509] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
         Vnum = 21509, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Floating in a void", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [21510] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
         Vnum = 21510, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Floating in a void", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [21511] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
         Vnum = 21511, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Floating in a void", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [21512] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
         Vnum = 21512, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Floating in a void", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [21513] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
         Vnum = 21513, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Floating in a void", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [21514] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
         Vnum = 21514, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Floating in a void", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [21515] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
         Vnum = 21515, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Floating in a void", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [21500] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Description = "I will start building with this number ...Durga please separtae the world\
form this point!\
", 
         Vnum = 21500, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Begiing of zone Nal HUTTA", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [21501] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 21502, 
               Direction = "east", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "A clearing in the large terrestrial planet of Nal Hutta. There are some\
burn marks from transport vehicle exahust on the ground. From the tracks\
and burn circles you can tell this area recives alot of trafic. Looking up\
into the sky you can see the nearby moon, Nar Shada and what appears to be\
lights form the eciting citys of above. Looking up to the west you can see\
a red outline of a nearby gas cloud. There is a wide path heading toward\
the east and one to the west from here. \
", 
         Vnum = 21501, 
         Name = "A Landing Clearing", 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [21502] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 21503, 
               Direction = "south", 
               Description = "", 
               Keyword = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 21501, 
               Direction = "west", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
         Vnum = 21502, 
         Name = "Floating in a void", 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [21503] = 
      {
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 21502, 
               Direction = "north", 
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
         Vnum = 21503, 
         Name = "Floating in a void", 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
   }, 
   Filename = "nal_hutta.lua", 
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
   FileFormatVersion = 1, 
   VnumRanges = 
   {
      Room = 
      {
         Last = 21515, 
         First = 21500, 
      }, 
      Mob = 
      {
         Last = 21799, 
         First = 21500, 
      }, 
      Object = 
      {
         Last = 21799, 
         First = 21500, 
      }, 
   }, 
   LowEconomy = 6250000, 
   Name = "Nal Hutta", 
}
