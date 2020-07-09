-- Coruscant Prison
-- Last saved Thursday 09-Jul-2020 21:56:48

AreaEntry
{
   HighEconomy = 0, 
   Objects = 
   {
      [9000] = 
      {
         Weight = 1, 
         ItemType = "furniture", 
         ShortDescr = "a jail key", 
         Name = "jail key", 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 9000, 
         Cost = 0, 
         Description = "A key is here", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
      }, 
      [9001] = 
      {
         Weight = 1, 
         ItemType = "fountain", 
         ShortDescr = "a sink", 
         Name = "sink", 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 9001, 
         Cost = 0, 
         Description = "A sink is here.", 
         ObjectValues = 
         {
            [1] = 1000, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 1000, 
         }, 
         ActionDescription = "", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
      }, 
      [9002] = 
      {
         Weight = 2, 
         ItemType = "food", 
         ShortDescr = "some mush", 
         Name = "mush", 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 9002, 
         Cost = 5, 
         Description = "Some day old mush is here for you to eat.", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 20, 
         }, 
         ActionDescription = "", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
      }, 
      [9049] = 
      {
         Weight = 1, 
         ItemType = "trash", 
         ShortDescr = "a dud", 
         Name = "dud", 
         Layers = 0, 
         Vnum = 9049, 
         ExtraDescriptions = 
         {
         }, 
         Description = "A dud is here.", 
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
      [9024] = 
      {
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 9026, 
               Direction = "east", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 9023, 
               Direction = "west", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "CellBlock Checkpoint", 
         Vnum = 9024, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Description = "", 
      }, 
      [9025] = 
      {
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 9023, 
               Direction = "east", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "CellBlock Checkpoint", 
         Vnum = 9025, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Description = "", 
      }, 
      [9026] = 
      {
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "Cell", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 9029, 
               Direction = "north", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 9027, 
               Direction = "east", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 9024, 
               Direction = "west", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Cellblock A", 
         Vnum = 9026, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Description = "", 
      }, 
      [9027] = 
      {
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 9028, 
               Direction = "east", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 9026, 
               Direction = "west", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Cellblock A", 
         Vnum = 9027, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Description = "", 
      }, 
      [9028] = 
      {
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 9027, 
               Direction = "west", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Cellblock A", 
         Vnum = 9028, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Description = "", 
      }, 
      [9029] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         TeleDelay = 0, 
         Name = "A Cell", 
         Vnum = 9029, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You may safely quit and reenter the game from here.\
 \
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "Cell", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 9026, 
               Direction = "south", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [9030] = 
      {
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 9031, 
               Direction = "north", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 9033, 
               Direction = "east", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 9021, 
               Direction = "west", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Outside the Dining Area", 
         Vnum = 9030, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Description = "", 
      }, 
      [9031] = 
      {
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 9032, 
               Direction = "east", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 9030, 
               Direction = "south", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Prison Dining Room", 
         Vnum = 9031, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Description = "", 
      }, 
      [9032] = 
      {
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Flags = 
               {
                  [25] = "Window", 
               }, 
               Description = "", 
               DestinationVnum = 9033, 
               Direction = "south", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 9031, 
               Direction = "west", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Food Line", 
         Vnum = 9032, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Description = "", 
      }, 
      [9033] = 
      {
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Flags = 
               {
                  [25] = "Window", 
               }, 
               Description = "", 
               DestinationVnum = 9032, 
               Direction = "north", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 9030, 
               Direction = "west", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "The Prison Kitchen", 
         Vnum = 9033, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Description = "", 
      }, 
      [9034] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleDelay = 0, 
         Name = "Floating in a void", 
         Vnum = 9034, 
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
      [9035] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleDelay = 0, 
         Name = "Floating in a void", 
         Vnum = 9035, 
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
      [9036] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleDelay = 0, 
         Name = "Floating in a void", 
         Vnum = 9036, 
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
      [9037] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleDelay = 0, 
         Name = "Floating in a void", 
         Vnum = 9037, 
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
      [9038] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleDelay = 0, 
         Name = "Floating in a void", 
         Vnum = 9038, 
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
      [9039] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleDelay = 0, 
         Name = "Floating in a void", 
         Vnum = 9039, 
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
      [9040] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleDelay = 0, 
         Name = "Floating in a void", 
         Vnum = 9040, 
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
      [9041] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleDelay = 0, 
         Name = "Floating in a void", 
         Vnum = 9041, 
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
      [9042] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleDelay = 0, 
         Name = "Floating in a void", 
         Vnum = 9042, 
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
      [9043] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleDelay = 0, 
         Name = "Floating in a void", 
         Vnum = 9043, 
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
      [9044] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleDelay = 0, 
         Name = "Floating in a void", 
         Vnum = 9044, 
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
      [9045] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleDelay = 0, 
         Name = "Floating in a void", 
         Vnum = 9045, 
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
      [9046] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleDelay = 0, 
         Name = "Floating in a void", 
         Vnum = 9046, 
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
      [9047] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleDelay = 0, 
         Name = "Floating in a void", 
         Vnum = 9047, 
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
      [9048] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleDelay = 0, 
         Name = "Floating in a void", 
         Vnum = 9048, 
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
      [9049] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleDelay = 0, 
         Name = "Floating in a void", 
         Vnum = 9049, 
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
      [9000] = 
      {
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 9018, 
               Direction = "southeast", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "New Prisoner Processing", 
         Vnum = 9000, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Description = "", 
      }, 
      [9001] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         TeleDelay = 0, 
         Name = "Coruscant Penitentiary", 
         Vnum = 9001, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 337, 
               Direction = "south", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 9003, 
               Direction = "southeast", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 9002, 
               Direction = "southwest", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [9002] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "Prisoner Entrance", 
         Vnum = 9002, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 9001, 
               Direction = "northeast", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 9004, 
               Direction = "southwest", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [9003] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "Vistor Entrance", 
         Vnum = 9003, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 9001, 
               Direction = "northwest", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 9017, 
               Direction = "southeast", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [9004] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "Outside Checkpoint A", 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "p opens the door.", 
               Code = "mpat 122 mpecho $n just opened the Coruscant jail door. \
mpat 109 mpecho $n just opened the jail door. \
", 
               MudProgType = "act_prog", 
            }, 
         }, 
         Vnum = 9004, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = 9000, 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Description = "", 
               DestinationVnum = 9005, 
               Direction = "south", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 9002, 
               Direction = "northeast", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [9005] = 
      {
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
               }, 
               Description = "", 
               DestinationVnum = 9004, 
               Direction = "north", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 9006, 
               Direction = "south", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Inside Checkpoint A", 
         Vnum = 9005, 
         MudProgs = 
         {
            [1] = 
            {
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
               MudProgType = "speech_prog", 
            }, 
         }, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Description = "", 
      }, 
      [9006] = 
      {
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 9005, 
               Direction = "north", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 9009, 
               Direction = "east", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 9007, 
               Direction = "south", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "A Prison Corridor", 
         Vnum = 9006, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Description = "", 
      }, 
      [9007] = 
      {
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 9006, 
               Direction = "north", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 9008, 
               Direction = "south", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Outside Check Point B", 
         Vnum = 9007, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Description = "", 
      }, 
      [9008] = 
      {
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 9007, 
               Direction = "north", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 9000, 
               Direction = "south", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 9010, 
               Direction = "southeast", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Inside Check Point B", 
         Vnum = 9008, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Description = "", 
      }, 
      [9009] = 
      {
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 9006, 
               Direction = "west", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Staff Check Point", 
         Vnum = 9009, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Description = "", 
      }, 
      [9010] = 
      {
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 9011, 
               Direction = "east", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 9008, 
               Direction = "northwest", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "A Prison Corridor", 
         Vnum = 9010, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Description = "", 
      }, 
      [9011] = 
      {
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 9012, 
               Direction = "east", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 9020, 
               Direction = "south", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 9010, 
               Direction = "west", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Outside Checkpoint C", 
         Vnum = 9011, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Description = "", 
      }, 
      [9012] = 
      {
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 9011, 
               Direction = "west", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 9013, 
               Direction = "northeast", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "A Prison Corridor", 
         Vnum = 9012, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Description = "", 
      }, 
      [9013] = 
      {
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 9014, 
               Direction = "north", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 9012, 
               Direction = "southwest", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Viewing Room Checkpoint", 
         Vnum = 9013, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Description = "", 
      }, 
      [9014] = 
      {
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Flags = 
               {
                  [25] = "Window", 
               }, 
               Description = "", 
               DestinationVnum = 9015, 
               Direction = "north", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 9013, 
               Direction = "south", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Viewing Room", 
         Vnum = 9014, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Description = "", 
      }, 
      [9015] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "Visiting Room", 
         Vnum = 9015, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 9016, 
               Direction = "north", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Flags = 
               {
                  [25] = "Window", 
               }, 
               Description = "", 
               DestinationVnum = 9014, 
               Direction = "south", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [9016] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "Inside Visitors Checkpoint", 
         Vnum = 9016, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 9017, 
               Direction = "north", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 9015, 
               Direction = "south", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [9017] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "Outside Visitors Checkpoint", 
         Vnum = 9017, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 9016, 
               Direction = "south", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 9003, 
               Direction = "northwest", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [9018] = 
      {
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 9019, 
               Direction = "east", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Strip Search", 
         Vnum = 9018, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Description = "", 
      }, 
      [9019] = 
      {
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 9010, 
               Direction = "northeast", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Prison Garments", 
         Vnum = 9019, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Description = "", 
      }, 
      [9020] = 
      {
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 9011, 
               Direction = "north", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 9021, 
               Direction = "south", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "Inside Checkpoint C", 
         Vnum = 9020, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Description = "", 
      }, 
      [9021] = 
      {
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 9020, 
               Direction = "north", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 9030, 
               Direction = "east", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 9022, 
               Direction = "south", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "A Prison Corridor", 
         Vnum = 9021, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Description = "", 
      }, 
      [9022] = 
      {
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 9021, 
               Direction = "north", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 9023, 
               Direction = "south", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "A Prison Corridor", 
         Vnum = 9022, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Description = "", 
      }, 
      [9023] = 
      {
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 9022, 
               Direction = "north", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 9024, 
               Direction = "east", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 9025, 
               Direction = "west", 
               Distance = 0, 
            }, 
         }, 
         TeleDelay = 0, 
         Name = "A Prison Corridor", 
         Vnum = 9023, 
         Sector = "city", 
         ExtraDescriptions = 
         {
         }, 
         TeleVnum = 0, 
         Description = "", 
      }, 
   }, 
   Author = "Durga", 
   ResetMessage = "", 
   Name = "Coruscant Prison", 
   Resets = 
   {
      [1] = 
      {
         Arg3 = 2, 
         Command = "D", 
         Arg2 = 0, 
         Arg1 = 9005, 
         MiscData = 0, 
      }, 
      [2] = 
      {
         Arg3 = 1, 
         Command = "D", 
         Arg2 = 2, 
         Arg1 = 9004, 
         MiscData = 0, 
      }, 
      [3] = 
      {
         Arg3 = 9033, 
         Command = "O", 
         Arg2 = 1, 
         Arg1 = 9001, 
         MiscData = 1, 
      }, 
      [4] = 
      {
         Arg3 = 9032, 
         Command = "O", 
         Arg2 = 1, 
         Arg1 = 9002, 
         MiscData = 1, 
      }, 
   }, 
   LowEconomy = 6250000, 
   Mobiles = 
   {
      [9000] = 
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
         LongDescr = "Some god abandoned a newly created dude here.\
", 
         Level = 1, 
         Position = "standing", 
         Vnum = 9000, 
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
         ShortDescr = "a newly created dude", 
         Weight = 0, 
         Name = "dude", 
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
      [9049] = 
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
         LongDescr = "Some god abandoned a newly created dude here.\
", 
         Level = 1, 
         Position = "standing", 
         Vnum = 9049, 
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
         ShortDescr = "a newly created dude", 
         Weight = 0, 
         Name = "dude", 
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
   Filename = "corus_jail.lua", 
}
