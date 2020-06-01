-- Nal Hutta
-- Last saved Monday 01-Jun-2020 11:08:46

AreaEntry
{
   Name = "Nal Hutta", 
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
      [21500] = 
      {
         Name = "mobhead", 
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
         Vnum = 21500, 
         LongDescr = "Leave this reset until you make a new one. If you don't have at least one bad things will happen.\
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
         ShortDescr = "a newly created mobhead", 
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
      [21799] = 
      {
         Name = "mobtail", 
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
         Vnum = 21799, 
         LongDescr = "Some god abandoned a newly created mobtail here.\
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
         ShortDescr = "a newly created mobtail", 
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
   ResetMessage = "", 
   Resets = 
   {
      [1] = 
      {
         Command = "M", 
         MiscData = 1, 
         Arg3 = 21500, 
         Arg1 = 21500, 
         Arg2 = 1, 
      }, 
      [2] = 
      {
         Command = "O", 
         MiscData = 1, 
         Arg3 = 21186, 
         Arg1 = 21500, 
         Arg2 = 1, 
      }, 
      [3] = 
      {
         Command = "D", 
         MiscData = 0, 
         Arg3 = 0, 
         Arg1 = 21186, 
         Arg2 = 2, 
      }, 
   }, 
   Author = "Ackbar", 
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
   Objects = 
   {
      [21500] = 
      {
         Name = "board terminal", 
         Vnum = 21500, 
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
         Description = "Universe Construction Board rests on the wall here.", 
         ShortDescr = "Universe Construction Board", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
         ItemType = "trash", 
      }, 
      [21501] = 
      {
         Name = "slot machine ", 
         Vnum = 21501, 
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
         Description = "&g A Tk_9U slot machine rest on the wall.", 
         ShortDescr = "A TK_9U Slot Machine", 
         Flags = 
         {
            [0] = "Glow", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "", 
               Code = "mpecho Bing .bang Baong!\
mpecho You see small pictures of rotate in circles showing up in various\
forms.\
", 
               MudProgType = "pull_prog", 
            }, 
            [2] = 
            {
               Arguments = "", 
               Code = "mpecho You have just reset the Machine! Pull for Money!\
", 
               MudProgType = "push_prog", 
            }, 
         }, 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
         ItemType = "lever", 
      }, 
      [21799] = 
      {
         Name = "bookend", 
         Vnum = 21799, 
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
         Description = "A bookend is here.", 
         ShortDescr = "a bookend", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 1, 
         ActionDescription = "", 
         Cost = 0, 
         ItemType = "trash", 
      }, 
   }, 
   Filename = "nal_hutta.lua", 
   Rooms = 
   {
      [21504] = 
      {
         Name = "Floating in a void", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "", 
         Exits = 
         {
         }, 
         Vnum = 21504, 
         TeleDelay = 0, 
      }, 
      [21505] = 
      {
         Name = "Floating in a void", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "", 
         Exits = 
         {
         }, 
         Vnum = 21505, 
         TeleDelay = 0, 
      }, 
      [21506] = 
      {
         Name = "Floating in a void", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "", 
         Exits = 
         {
         }, 
         Vnum = 21506, 
         TeleDelay = 0, 
      }, 
      [21507] = 
      {
         Name = "Floating in a void", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "", 
         Exits = 
         {
         }, 
         Vnum = 21507, 
         TeleDelay = 0, 
      }, 
      [21508] = 
      {
         Name = "Floating in a void", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "", 
         Exits = 
         {
         }, 
         Vnum = 21508, 
         TeleDelay = 0, 
      }, 
      [21509] = 
      {
         Name = "Floating in a void", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "", 
         Exits = 
         {
         }, 
         Vnum = 21509, 
         TeleDelay = 0, 
      }, 
      [21510] = 
      {
         Name = "Floating in a void", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "", 
         Exits = 
         {
         }, 
         Vnum = 21510, 
         TeleDelay = 0, 
      }, 
      [21511] = 
      {
         Name = "Floating in a void", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "", 
         Exits = 
         {
         }, 
         Vnum = 21511, 
         TeleDelay = 0, 
      }, 
      [21512] = 
      {
         Name = "Floating in a void", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "", 
         Exits = 
         {
         }, 
         Vnum = 21512, 
         TeleDelay = 0, 
      }, 
      [21513] = 
      {
         Name = "Floating in a void", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "", 
         Exits = 
         {
         }, 
         Vnum = 21513, 
         TeleDelay = 0, 
      }, 
      [21514] = 
      {
         Name = "Floating in a void", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "", 
         Exits = 
         {
         }, 
         Vnum = 21514, 
         TeleDelay = 0, 
      }, 
      [21515] = 
      {
         Name = "Floating in a void", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "", 
         Exits = 
         {
         }, 
         Vnum = 21515, 
         TeleDelay = 0, 
      }, 
      [21500] = 
      {
         Name = "Begiing of zone Nal HUTTA", 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "I will start building with this number ...Durga please separtae the world\
form this point!\
", 
         Exits = 
         {
         }, 
         Vnum = 21500, 
         TeleDelay = 0, 
      }, 
      [21501] = 
      {
         Name = "A Landing Clearing", 
         Vnum = 21501, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "A clearing in the large terrestrial planet of Nal Hutta. There are some\
burn marks from transport vehicle exahust on the ground. From the tracks\
and burn circles you can tell this area recives alot of trafic. Looking up\
into the sky you can see the nearby moon, Nar Shada and what appears to be\
lights form the eciting citys of above. Looking up to the west you can see\
a red outline of a nearby gas cloud. There is a wide path heading toward\
the east and one to the west from here. \
", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21502, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [21502] = 
      {
         Name = "Floating in a void", 
         Vnum = 21502, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21503, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21501, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
      [21503] = 
      {
         Name = "Floating in a void", 
         Vnum = 21503, 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 21502, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
      }, 
   }, 
   LowEconomy = 6250000, 
}
