-- Coruscant Prison
-- Last saved Thursday 26-Nov-2020 15:24:24

AreaEntry
{
   HighEconomy = 0, 
   Objects = 
   {
      [9000] = 
      {
         Layers = 0, 
         Description = "A key is here", 
         ShortDescr = "a jail key", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ItemType = "furniture", 
         Weight = 1, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Vnum = 9000, 
         ActionDescription = "", 
         Tag = "", 
         Name = "jail key", 
      }, 
      [9001] = 
      {
         Layers = 0, 
         Description = "A sink is here.", 
         ShortDescr = "a sink", 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ItemType = "fountain", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         ObjectValues = 
         {
            [1] = 1000, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 1000, 
         }, 
         Vnum = 9001, 
         ActionDescription = "", 
         Tag = "", 
         Name = "sink", 
      }, 
      [9002] = 
      {
         Layers = 0, 
         Description = "Some day old mush is here for you to eat.", 
         ShortDescr = "some mush", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 5, 
         ItemType = "food", 
         Weight = 2, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 20, 
         }, 
         Vnum = 9002, 
         ActionDescription = "", 
         Tag = "", 
         Name = "mush", 
      }, 
      [9049] = 
      {
         Layers = 0, 
         Description = "A dud is here.", 
         ShortDescr = "a dud", 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ItemType = "trash", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Vnum = 9049, 
         ActionDescription = "", 
         Tag = "", 
         Name = "dud", 
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
         Last = 9049, 
         First = 9000, 
      }, 
      Mob = 
      {
         Last = 9049, 
         First = 9000, 
      }, 
      Room = 
      {
         Last = 9049, 
         First = 9000, 
      }, 
   }, 
   ResetMessage = "", 
   ResetFrequency = 0, 
   Resets = 
   {
      [1] = 
      {
         Arg3 = 2, 
         Arg1 = 9005, 
         Command = "D", 
         MiscData = 0, 
         Arg2 = 0, 
      }, 
      [2] = 
      {
         Arg3 = 1, 
         Arg1 = 9004, 
         Command = "D", 
         MiscData = 0, 
         Arg2 = 2, 
      }, 
      [3] = 
      {
         Arg3 = 9033, 
         Arg1 = 9001, 
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [4] = 
      {
         Arg3 = 9032, 
         Arg1 = 9002, 
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
   }, 
   Author = "Durga", 
   Rooms = 
   {
      [9024] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 9026, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 9023, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 9024, 
         Description = "", 
         Tag = "", 
         Name = "CellBlock Checkpoint", 
      }, 
      [9025] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 9023, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 9025, 
         Description = "", 
         Tag = "", 
         Name = "CellBlock Checkpoint", 
      }, 
      [9026] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 9029, 
               Keyword = "Cell", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 9027, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 9024, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 9026, 
         Description = "", 
         Tag = "", 
         Name = "Cellblock A", 
      }, 
      [9027] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 9028, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 9026, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 9027, 
         Description = "", 
         Tag = "", 
         Name = "Cellblock A", 
      }, 
      [9028] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 9027, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 9028, 
         Description = "", 
         Tag = "", 
         Name = "Cellblock A", 
      }, 
      [9029] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 9026, 
               Keyword = "Cell", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 9029, 
         Description = "You may safely quit and reenter the game from here.\
 \
", 
         Tag = "", 
         Name = "A Cell", 
      }, 
      [9030] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 9031, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 9033, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 9021, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 9030, 
         Description = "", 
         Tag = "", 
         Name = "Outside the Dining Area", 
      }, 
      [9031] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 9032, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 9030, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 9031, 
         Description = "", 
         Tag = "", 
         Name = "Prison Dining Room", 
      }, 
      [9032] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Flags = 
               {
                  [25] = "Window", 
               }, 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 9033, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 9031, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 9032, 
         Description = "", 
         Tag = "", 
         Name = "Food Line", 
      }, 
      [9033] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Flags = 
               {
                  [25] = "Window", 
               }, 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 9032, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 9030, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 9033, 
         Description = "", 
         Tag = "", 
         Name = "The Prison Kitchen", 
      }, 
      [9034] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Exits = 
         {
         }, 
         Vnum = 9034, 
         Description = "", 
         Tag = "", 
         Name = "Floating in a void", 
      }, 
      [9035] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Exits = 
         {
         }, 
         Vnum = 9035, 
         Description = "", 
         Tag = "", 
         Name = "Floating in a void", 
      }, 
      [9036] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Exits = 
         {
         }, 
         Vnum = 9036, 
         Description = "", 
         Tag = "", 
         Name = "Floating in a void", 
      }, 
      [9037] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Exits = 
         {
         }, 
         Vnum = 9037, 
         Description = "", 
         Tag = "", 
         Name = "Floating in a void", 
      }, 
      [9038] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Exits = 
         {
         }, 
         Vnum = 9038, 
         Description = "", 
         Tag = "", 
         Name = "Floating in a void", 
      }, 
      [9039] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Exits = 
         {
         }, 
         Vnum = 9039, 
         Description = "", 
         Tag = "", 
         Name = "Floating in a void", 
      }, 
      [9040] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Exits = 
         {
         }, 
         Vnum = 9040, 
         Description = "", 
         Tag = "", 
         Name = "Floating in a void", 
      }, 
      [9041] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Exits = 
         {
         }, 
         Vnum = 9041, 
         Description = "", 
         Tag = "", 
         Name = "Floating in a void", 
      }, 
      [9042] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Exits = 
         {
         }, 
         Vnum = 9042, 
         Description = "", 
         Tag = "", 
         Name = "Floating in a void", 
      }, 
      [9043] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Exits = 
         {
         }, 
         Vnum = 9043, 
         Description = "", 
         Tag = "", 
         Name = "Floating in a void", 
      }, 
      [9044] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Exits = 
         {
         }, 
         Vnum = 9044, 
         Description = "", 
         Tag = "", 
         Name = "Floating in a void", 
      }, 
      [9045] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Exits = 
         {
         }, 
         Vnum = 9045, 
         Description = "", 
         Tag = "", 
         Name = "Floating in a void", 
      }, 
      [9046] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Exits = 
         {
         }, 
         Vnum = 9046, 
         Description = "", 
         Tag = "", 
         Name = "Floating in a void", 
      }, 
      [9047] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Exits = 
         {
         }, 
         Vnum = 9047, 
         Description = "", 
         Tag = "", 
         Name = "Floating in a void", 
      }, 
      [9048] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Exits = 
         {
         }, 
         Vnum = 9048, 
         Description = "", 
         Tag = "", 
         Name = "Floating in a void", 
      }, 
      [9049] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Exits = 
         {
         }, 
         Vnum = 9049, 
         Description = "", 
         Tag = "", 
         Name = "Floating in a void", 
      }, 
      [9000] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "southeast", 
               DestinationVnum = 9018, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 9000, 
         Description = "", 
         Tag = "", 
         Name = "New Prisoner Processing", 
      }, 
      [9001] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 337, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "southeast", 
               DestinationVnum = 9003, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "southwest", 
               DestinationVnum = 9002, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 9001, 
         Description = "", 
         Tag = "", 
         Name = "Coruscant Penitentiary", 
      }, 
      [9002] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "northeast", 
               DestinationVnum = 9001, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "southwest", 
               DestinationVnum = 9004, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 9002, 
         Description = "", 
         Tag = "", 
         Name = "Prisoner Entrance", 
      }, 
      [9003] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "northwest", 
               DestinationVnum = 9001, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "southeast", 
               DestinationVnum = 9017, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 9003, 
         Description = "", 
         Tag = "", 
         Name = "Vistor Entrance", 
      }, 
      [9004] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "act_prog", 
               Arguments = "p opens the door.", 
               Code = "mpat 122 mpecho $n just opened the Coruscant jail door. \
mpat 109 mpecho $n just opened the jail door. \
", 
               ScriptType = "MProg", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Key = 9000, 
               Direction = "south", 
               DestinationVnum = 9005, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "northeast", 
               DestinationVnum = 9002, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 9004, 
         Description = "", 
         Tag = "", 
         Name = "Outside Checkpoint A", 
      }, 
      [9005] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "exit door", 
               Code = "if clan($n) == The Empire\
mpat 9004 open s\
mpat 122 mpecho $n just commanded the Coruscant jail be opened. \
mpat 109 mpecho $n just commanded the Coruscant jail be opened. \
else\
if clan($n) == The Death Commandos\
mpat 9004 open s\
else\
mptransfer $n 9000\
endif\
endif\
", 
               ScriptType = "MProg", 
            }, 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
               }, 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 9004, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 9006, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 9005, 
         Description = "", 
         Tag = "", 
         Name = "Inside Checkpoint A", 
      }, 
      [9006] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 9005, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 9009, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 9007, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 9006, 
         Description = "", 
         Tag = "", 
         Name = "A Prison Corridor", 
      }, 
      [9007] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 9006, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 9008, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 9007, 
         Description = "", 
         Tag = "", 
         Name = "Outside Check Point B", 
      }, 
      [9008] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 9007, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 9000, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "southeast", 
               DestinationVnum = 9010, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 9008, 
         Description = "", 
         Tag = "", 
         Name = "Inside Check Point B", 
      }, 
      [9009] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 9006, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 9009, 
         Description = "", 
         Tag = "", 
         Name = "Staff Check Point", 
      }, 
      [9010] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 9011, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "northwest", 
               DestinationVnum = 9008, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 9010, 
         Description = "", 
         Tag = "", 
         Name = "A Prison Corridor", 
      }, 
      [9011] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 9012, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 9020, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 9010, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 9011, 
         Description = "", 
         Tag = "", 
         Name = "Outside Checkpoint C", 
      }, 
      [9012] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 9011, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "northeast", 
               DestinationVnum = 9013, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 9012, 
         Description = "", 
         Tag = "", 
         Name = "A Prison Corridor", 
      }, 
      [9013] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 9014, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "southwest", 
               DestinationVnum = 9012, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 9013, 
         Description = "", 
         Tag = "", 
         Name = "Viewing Room Checkpoint", 
      }, 
      [9014] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Flags = 
               {
                  [25] = "Window", 
               }, 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 9015, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 9013, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 9014, 
         Description = "", 
         Tag = "", 
         Name = "Viewing Room", 
      }, 
      [9015] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 9016, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Flags = 
               {
                  [25] = "Window", 
               }, 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 9014, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 9015, 
         Description = "", 
         Tag = "", 
         Name = "Visiting Room", 
      }, 
      [9016] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 9017, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 9015, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 9016, 
         Description = "", 
         Tag = "", 
         Name = "Inside Visitors Checkpoint", 
      }, 
      [9017] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 9016, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "northwest", 
               DestinationVnum = 9003, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 9017, 
         Description = "", 
         Tag = "", 
         Name = "Outside Visitors Checkpoint", 
      }, 
      [9018] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 9019, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 9018, 
         Description = "", 
         Tag = "", 
         Name = "Strip Search", 
      }, 
      [9019] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "northeast", 
               DestinationVnum = 9010, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 9019, 
         Description = "", 
         Tag = "", 
         Name = "Prison Garments", 
      }, 
      [9020] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 9011, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 9021, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 9020, 
         Description = "", 
         Tag = "", 
         Name = "Inside Checkpoint C", 
      }, 
      [9021] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 9020, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 9030, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 9022, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 9021, 
         Description = "", 
         Tag = "", 
         Name = "A Prison Corridor", 
      }, 
      [9022] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 9021, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 9023, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 9022, 
         Description = "", 
         Tag = "", 
         Name = "A Prison Corridor", 
      }, 
      [9023] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 9022, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 9024, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 9025, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 9023, 
         Description = "", 
         Tag = "", 
         Name = "A Prison Corridor", 
      }, 
   }, 
   FileFormatVersion = 1, 
   Filename = "corus_jail.lua", 
   Mobiles = 
   {
      [9000] = 
      {
         Stats = 
         {
            Strength = 10, 
            Wisdom = 10, 
            Luck = 10, 
            Charisma = 10, 
            Intelligence = 10, 
            Force = 0, 
            Dexterity = 10, 
            Constitution = 10, 
         }, 
         Position = "standing", 
         Height = 0, 
         SaveVs = 
         {
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Race = "Human", 
         Alignment = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         NumberOfAttacks = 0, 
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
         DamRoll = 0, 
         Description = "", 
         ShortDescr = "a newly created dude", 
         Weight = 0, 
         HitRoll = 0, 
         Sex = "undistinguished", 
         LongDescr = "Some god abandoned a newly created dude here.\
", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         DefaultPosition = "standing", 
         Credits = 0, 
         Level = 1, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         Vnum = 9000, 
         ArmorClass = 0, 
         Tag = "", 
         Name = "dude", 
      }, 
      [9049] = 
      {
         Stats = 
         {
            Strength = 10, 
            Wisdom = 10, 
            Luck = 10, 
            Charisma = 10, 
            Intelligence = 10, 
            Force = 0, 
            Dexterity = 10, 
            Constitution = 10, 
         }, 
         Position = "standing", 
         Height = 0, 
         SaveVs = 
         {
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Race = "Human", 
         Alignment = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         NumberOfAttacks = 0, 
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
         DamRoll = 0, 
         Description = "", 
         ShortDescr = "a newly created dude", 
         Weight = 0, 
         HitRoll = 0, 
         Sex = "undistinguished", 
         LongDescr = "Some god abandoned a newly created dude here.\
", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         DefaultPosition = "standing", 
         Credits = 0, 
         Level = 1, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         Vnum = 9049, 
         ArmorClass = 0, 
         Tag = "", 
         Name = "dude", 
      }, 
   }, 
   LowEconomy = 6250000, 
   Name = "Coruscant Prison", 
}
