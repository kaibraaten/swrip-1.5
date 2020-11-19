-- Coruscant Prison
-- Last saved Thursday 19-Nov-2020 14:31:09

AreaEntry
{
   VnumRanges = 
   {
      Mob = 
      {
         First = 9000, 
         Last = 9049, 
      }, 
      Object = 
      {
         First = 9000, 
         Last = 9049, 
      }, 
      Room = 
      {
         First = 9000, 
         Last = 9049, 
      }, 
   }, 
   Objects = 
   {
      [9000] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 9000, 
         Cost = 0, 
         ShortDescr = "a jail key", 
         Weight = 1, 
         Layers = 0, 
         Name = "jail key", 
         Description = "A key is here", 
         ActionDescription = "", 
         ItemType = "furniture", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
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
      [9001] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Vnum = 9001, 
         Cost = 0, 
         ShortDescr = "a sink", 
         Layers = 0, 
         Weight = 1, 
         Description = "A sink is here.", 
         ActionDescription = "", 
         ItemType = "fountain", 
         Name = "sink", 
         ObjectValues = 
         {
            [1] = 1000, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 1000, 
         }, 
      }, 
      [9002] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 9002, 
         Cost = 5, 
         ShortDescr = "some mush", 
         Weight = 2, 
         Layers = 0, 
         Name = "mush", 
         Description = "Some day old mush is here for you to eat.", 
         ActionDescription = "", 
         ItemType = "food", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 20, 
         }, 
      }, 
      [9049] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 9049, 
         Cost = 0, 
         ShortDescr = "a dud", 
         Layers = 0, 
         Weight = 1, 
         Name = "dud", 
         ActionDescription = "", 
         ItemType = "trash", 
         Description = "A dud is here.", 
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
      [9024] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 9024, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 9026, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 9023, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "CellBlock Checkpoint", 
      }, 
      [9025] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 9025, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 9023, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "CellBlock Checkpoint", 
      }, 
      [9026] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 9026, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 9029, 
               Distance = 0, 
               Keyword = "Cell", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 9027, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 9024, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Cellblock A", 
      }, 
      [9027] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 9027, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 9028, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 9026, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Cellblock A", 
      }, 
      [9028] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 9028, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 9027, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Cellblock A", 
      }, 
      [9029] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         Vnum = 9029, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "A Cell", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 9026, 
               Distance = 0, 
               Keyword = "Cell", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "You may safely quit and reenter the game from here.\
 \
", 
      }, 
      [9030] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 9030, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 9031, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 9033, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 9021, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Outside the Dining Area", 
      }, 
      [9031] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 9031, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 9032, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 9030, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Prison Dining Room", 
      }, 
      [9032] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 9032, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [25] = "Window", 
               }, 
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 9033, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 9031, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Food Line", 
      }, 
      [9033] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 9033, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [25] = "Window", 
               }, 
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 9032, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 9030, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "The Prison Kitchen", 
      }, 
      [9034] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Vnum = 9034, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Floating in a void", 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [9035] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Vnum = 9035, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Floating in a void", 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [9036] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Vnum = 9036, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Floating in a void", 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [9037] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Vnum = 9037, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Floating in a void", 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [9038] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Vnum = 9038, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Floating in a void", 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [9039] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Vnum = 9039, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Floating in a void", 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [9040] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Vnum = 9040, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Floating in a void", 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [9041] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Vnum = 9041, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Floating in a void", 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [9042] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Vnum = 9042, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Floating in a void", 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [9043] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Vnum = 9043, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Floating in a void", 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [9044] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Vnum = 9044, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Floating in a void", 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [9045] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Vnum = 9045, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Floating in a void", 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [9046] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Vnum = 9046, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Floating in a void", 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [9047] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Vnum = 9047, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Floating in a void", 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [9048] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Vnum = 9048, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Floating in a void", 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [9049] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Vnum = 9049, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Floating in a void", 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [9000] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 9000, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "southeast", 
               Key = -1, 
               DestinationVnum = 9018, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "New Prisoner Processing", 
      }, 
      [9001] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Vnum = 9001, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Coruscant Penitentiary", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 337, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "southeast", 
               Key = -1, 
               DestinationVnum = 9003, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "southwest", 
               Key = -1, 
               DestinationVnum = 9002, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [9002] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 9002, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Prisoner Entrance", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "northeast", 
               Key = -1, 
               DestinationVnum = 9001, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "southwest", 
               Key = -1, 
               DestinationVnum = 9004, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [9003] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Vnum = 9003, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Vistor Entrance", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "northwest", 
               Key = -1, 
               DestinationVnum = 9001, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "southeast", 
               Key = -1, 
               DestinationVnum = 9017, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [9004] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Vnum = 9004, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Outside Checkpoint A", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "act_prog", 
               Code = "mpat 122 mpecho $n just opened the Coruscant jail door. \
mpat 109 mpecho $n just opened the jail door. \
", 
               Arguments = "p opens the door.", 
               ScriptType = "MProg", 
            }, 
         }, 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Description = "", 
               Direction = "south", 
               Key = 9000, 
               DestinationVnum = 9005, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "northeast", 
               Key = -1, 
               DestinationVnum = 9002, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [9005] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 9005, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "speech_prog", 
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
               Arguments = "exit door", 
               ScriptType = "MProg", 
            }, 
         }, 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
               }, 
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 9004, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 9006, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Inside Checkpoint A", 
      }, 
      [9006] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 9006, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 9005, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 9009, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 9007, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A Prison Corridor", 
      }, 
      [9007] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 9007, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 9006, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 9008, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Outside Check Point B", 
      }, 
      [9008] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 9008, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 9007, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 9000, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "southeast", 
               Key = -1, 
               DestinationVnum = 9010, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Inside Check Point B", 
      }, 
      [9009] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 9009, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 9006, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Staff Check Point", 
      }, 
      [9010] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 9010, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 9011, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "northwest", 
               Key = -1, 
               DestinationVnum = 9008, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A Prison Corridor", 
      }, 
      [9011] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 9011, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 9012, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 9020, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 9010, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Outside Checkpoint C", 
      }, 
      [9012] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 9012, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 9011, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "northeast", 
               Key = -1, 
               DestinationVnum = 9013, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A Prison Corridor", 
      }, 
      [9013] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 9013, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 9014, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "southwest", 
               Key = -1, 
               DestinationVnum = 9012, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Viewing Room Checkpoint", 
      }, 
      [9014] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 9014, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [25] = "Window", 
               }, 
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 9015, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 9013, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Viewing Room", 
      }, 
      [9015] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Vnum = 9015, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Visiting Room", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 9016, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Flags = 
               {
                  [25] = "Window", 
               }, 
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 9014, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [9016] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Vnum = 9016, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Inside Visitors Checkpoint", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 9017, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 9015, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [9017] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Vnum = 9017, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Outside Visitors Checkpoint", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 9016, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "northwest", 
               Key = -1, 
               DestinationVnum = 9003, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [9018] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 9018, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 9019, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Strip Search", 
      }, 
      [9019] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 9019, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "northeast", 
               Key = -1, 
               DestinationVnum = 9010, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Prison Garments", 
      }, 
      [9020] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 9020, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 9011, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 9021, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Inside Checkpoint C", 
      }, 
      [9021] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 9021, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 9020, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 9030, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 9022, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A Prison Corridor", 
      }, 
      [9022] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 9022, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 9021, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 9023, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A Prison Corridor", 
      }, 
      [9023] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 9023, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 9022, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 9024, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 9025, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A Prison Corridor", 
      }, 
   }, 
   FileFormatVersion = 1, 
   LowEconomy = 6250000, 
   Resets = 
   {
      [1] = 
      {
         MiscData = 0, 
         Arg1 = 9005, 
         Command = "D", 
         Arg3 = 2, 
         Arg2 = 0, 
      }, 
      [2] = 
      {
         MiscData = 0, 
         Arg1 = 9004, 
         Command = "D", 
         Arg3 = 1, 
         Arg2 = 2, 
      }, 
      [3] = 
      {
         MiscData = 1, 
         Arg1 = 9001, 
         Command = "O", 
         Arg3 = 9033, 
         Arg2 = 1, 
      }, 
      [4] = 
      {
         MiscData = 1, 
         Arg1 = 9002, 
         Command = "O", 
         Arg3 = 9032, 
         Arg2 = 1, 
      }, 
   }, 
   ResetMessage = "", 
   Author = "Durga", 
   Name = "Coruscant Prison", 
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
   Filename = "corus_jail.lua", 
   Mobiles = 
   {
      [9000] = 
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
         ShortDescr = "a newly created dude", 
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
         Vnum = 9000, 
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
         Name = "dude", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "Some god abandoned a newly created dude here.\
", 
         ArmorClass = 0, 
      }, 
      [9049] = 
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
         ShortDescr = "a newly created dude", 
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
         Vnum = 9049, 
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
         Name = "dude", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "Some god abandoned a newly created dude here.\
", 
         ArmorClass = 0, 
      }, 
   }, 
}
