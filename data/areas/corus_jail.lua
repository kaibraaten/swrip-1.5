-- Coruscant Prison
-- Last saved Wednesday 06-May-2020 12:59:10

AreaEntry
{
   FileFormatVersion = 1, 
   Resets = 
   {
      [1] = 
      {
         Arg3 = 2, 
         MiscData = 0, 
         Arg2 = 0, 
         Command = "D", 
         Arg1 = 9005, 
      }, 
      [2] = 
      {
         Arg3 = 1, 
         MiscData = 0, 
         Arg2 = 2, 
         Command = "D", 
         Arg1 = 9004, 
      }, 
      [3] = 
      {
         Arg3 = 9033, 
         MiscData = 1, 
         Arg2 = 1, 
         Command = "O", 
         Arg1 = 9001, 
      }, 
      [4] = 
      {
         Arg3 = 9032, 
         MiscData = 1, 
         Arg2 = 1, 
         Command = "O", 
         Arg1 = 9002, 
      }, 
   }, 
   Name = "Coruscant Prison", 
   Rooms = 
   {
      [9024] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Name = "CellBlock Checkpoint", 
         Vnum = 9024, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               DestinationVnum = 9026, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               DestinationVnum = 9023, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [9025] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Name = "CellBlock Checkpoint", 
         Vnum = 9025, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               DestinationVnum = 9023, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [9026] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Name = "Cellblock A", 
         Vnum = 9026, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               DestinationVnum = 9029, 
               Keyword = "Cell", 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               DestinationVnum = 9027, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               DestinationVnum = 9024, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [9027] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Name = "Cellblock A", 
         Vnum = 9027, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               DestinationVnum = 9028, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               DestinationVnum = 9026, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [9028] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Name = "Cellblock A", 
         Vnum = 9028, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               DestinationVnum = 9027, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [9029] = 
      {
         Flags = 
         {
            [29] = "Spacecraft", 
            [23] = "Hotel", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You may safely quit and reenter the game from here.\
 \
", 
         Name = "A Cell", 
         Vnum = 9029, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               DestinationVnum = 9026, 
               Keyword = "Cell", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [9030] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Name = "Outside the Dining Area", 
         Vnum = 9030, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               DestinationVnum = 9031, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               DestinationVnum = 9033, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               DestinationVnum = 9021, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [9031] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Name = "Prison Dining Room", 
         Vnum = 9031, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               DestinationVnum = 9032, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               DestinationVnum = 9030, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [9032] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Name = "Food Line", 
         Vnum = 9032, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Flags = 
               {
                  [25] = "Window", 
               }, 
               Direction = "south", 
               Distance = 0, 
               DestinationVnum = 9033, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               DestinationVnum = 9031, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [9033] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Name = "The Prison Kitchen", 
         Vnum = 9033, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Flags = 
               {
                  [25] = "Window", 
               }, 
               Direction = "north", 
               Distance = 0, 
               DestinationVnum = 9032, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               DestinationVnum = 9030, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [9034] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Name = "Floating in a void", 
         Vnum = 9034, 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [9035] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Name = "Floating in a void", 
         Vnum = 9035, 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [9036] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Name = "Floating in a void", 
         Vnum = 9036, 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [9037] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Name = "Floating in a void", 
         Vnum = 9037, 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [9038] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Name = "Floating in a void", 
         Vnum = 9038, 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [9039] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Name = "Floating in a void", 
         Vnum = 9039, 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [9040] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Name = "Floating in a void", 
         Vnum = 9040, 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [9041] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Name = "Floating in a void", 
         Vnum = 9041, 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [9042] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Name = "Floating in a void", 
         Vnum = 9042, 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [9043] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Name = "Floating in a void", 
         Vnum = 9043, 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [9044] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Name = "Floating in a void", 
         Vnum = 9044, 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [9045] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Name = "Floating in a void", 
         Vnum = 9045, 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [9046] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Name = "Floating in a void", 
         Vnum = 9046, 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [9047] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Name = "Floating in a void", 
         Vnum = 9047, 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [9048] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Name = "Floating in a void", 
         Vnum = 9048, 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [9049] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Name = "Floating in a void", 
         Vnum = 9049, 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [9000] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Name = "New Prisoner Processing", 
         Vnum = 9000, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "southeast", 
               Distance = 0, 
               DestinationVnum = 9018, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [9001] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Name = "Coruscant Penitentiary", 
         Vnum = 9001, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               DestinationVnum = 337, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "southeast", 
               Distance = 0, 
               DestinationVnum = 9003, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "southwest", 
               Distance = 0, 
               DestinationVnum = 9002, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [9002] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Name = "Prisoner Entrance", 
         Vnum = 9002, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "northeast", 
               Distance = 0, 
               DestinationVnum = 9001, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "southwest", 
               Distance = 0, 
               DestinationVnum = 9004, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [9003] = 
      {
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Name = "Vistor Entrance", 
         Vnum = 9003, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "northwest", 
               Distance = 0, 
               DestinationVnum = 9001, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "southeast", 
               Distance = 0, 
               DestinationVnum = 9017, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [9004] = 
      {
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
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
         Name = "Outside Checkpoint A", 
         Vnum = 9004, 
         Exits = 
         {
            [1] = 
            {
               Key = 9000, 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Direction = "south", 
               Distance = 0, 
               DestinationVnum = 9005, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "northeast", 
               Distance = 0, 
               DestinationVnum = 9002, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [9005] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
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
         Name = "Inside Checkpoint A", 
         Vnum = 9005, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
               }, 
               Direction = "north", 
               Distance = 0, 
               DestinationVnum = 9004, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               DestinationVnum = 9006, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [9006] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Name = "A Prison Corridor", 
         Vnum = 9006, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               DestinationVnum = 9005, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               DestinationVnum = 9009, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               DestinationVnum = 9007, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [9007] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Name = "Outside Check Point B", 
         Vnum = 9007, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               DestinationVnum = 9006, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               DestinationVnum = 9008, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [9008] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Name = "Inside Check Point B", 
         Vnum = 9008, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               DestinationVnum = 9007, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               DestinationVnum = 9000, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "southeast", 
               Distance = 0, 
               DestinationVnum = 9010, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [9009] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Name = "Staff Check Point", 
         Vnum = 9009, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               DestinationVnum = 9006, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [9010] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Name = "A Prison Corridor", 
         Vnum = 9010, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               DestinationVnum = 9011, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "northwest", 
               Distance = 0, 
               DestinationVnum = 9008, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [9011] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Name = "Outside Checkpoint C", 
         Vnum = 9011, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               DestinationVnum = 9012, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               DestinationVnum = 9020, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               DestinationVnum = 9010, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [9012] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Name = "A Prison Corridor", 
         Vnum = 9012, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               DestinationVnum = 9011, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "northeast", 
               Distance = 0, 
               DestinationVnum = 9013, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [9013] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Name = "Viewing Room Checkpoint", 
         Vnum = 9013, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               DestinationVnum = 9014, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "southwest", 
               Distance = 0, 
               DestinationVnum = 9012, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [9014] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Name = "Viewing Room", 
         Vnum = 9014, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Flags = 
               {
                  [25] = "Window", 
               }, 
               Direction = "north", 
               Distance = 0, 
               DestinationVnum = 9015, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               DestinationVnum = 9013, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [9015] = 
      {
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Name = "Visiting Room", 
         Vnum = 9015, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               DestinationVnum = 9016, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Flags = 
               {
                  [25] = "Window", 
               }, 
               Direction = "south", 
               Distance = 0, 
               DestinationVnum = 9014, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [9016] = 
      {
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Name = "Inside Visitors Checkpoint", 
         Vnum = 9016, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               DestinationVnum = 9017, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               DestinationVnum = 9015, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [9017] = 
      {
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Name = "Outside Visitors Checkpoint", 
         Vnum = 9017, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               DestinationVnum = 9016, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "northwest", 
               Distance = 0, 
               DestinationVnum = 9003, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [9018] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Name = "Strip Search", 
         Vnum = 9018, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               DestinationVnum = 9019, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [9019] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Name = "Prison Garments", 
         Vnum = 9019, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "northeast", 
               Distance = 0, 
               DestinationVnum = 9010, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [9020] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Name = "Inside Checkpoint C", 
         Vnum = 9020, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               DestinationVnum = 9011, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               DestinationVnum = 9021, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [9021] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Name = "A Prison Corridor", 
         Vnum = 9021, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               DestinationVnum = 9020, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               DestinationVnum = 9030, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               DestinationVnum = 9022, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [9022] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Name = "A Prison Corridor", 
         Vnum = 9022, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               DestinationVnum = 9021, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               DestinationVnum = 9023, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [9023] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Name = "A Prison Corridor", 
         Vnum = 9023, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               DestinationVnum = 9022, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               DestinationVnum = 9024, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               DestinationVnum = 9025, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Tunnel = 0, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
   }, 
   Objects = 
   {
      [9000] = 
      {
         ShortDescr = "a jail key", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         ItemType = "furniture", 
         Cost = 0, 
         Name = "jail key", 
         Vnum = 9000, 
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
         ActionDescription = "", 
         Description = "A key is here", 
         Layers = 0, 
      }, 
      [9001] = 
      {
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         ItemType = "fountain", 
         Cost = 0, 
         Name = "sink", 
         Vnum = 9001, 
         ObjectValues = 
         {
            [1] = 1000, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 1000, 
         }, 
         Weight = 1, 
         ShortDescr = "a sink", 
         Description = "A sink is here.", 
         Layers = 0, 
      }, 
      [9002] = 
      {
         ShortDescr = "some mush", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         ItemType = "food", 
         Cost = 5, 
         Name = "mush", 
         Vnum = 9002, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 20, 
         }, 
         Weight = 2, 
         ActionDescription = "", 
         Description = "Some day old mush is here for you to eat.", 
         Layers = 0, 
      }, 
      [9049] = 
      {
         ShortDescr = "a dud", 
         ActionDescription = "", 
         ExtraDescriptions = 
         {
         }, 
         ItemType = "trash", 
         Cost = 0, 
         Name = "dud", 
         Vnum = 9049, 
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
         Description = "A dud is here.", 
         Layers = 0, 
      }, 
   }, 
   Mobiles = 
   {
      [9000] = 
      {
         ShortDescr = "a newly created dude", 
         ArmorClass = 0, 
         Description = "", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Name = "dude", 
         Vnum = 9000, 
         NumberOfAttacks = 0, 
         Sex = "undistinguished", 
         Level = 1, 
         Weight = 0, 
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
         HitRoll = 0, 
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
         Race = "Human", 
         SaveVs = 
         {
            Wand = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         DamRoll = 0, 
         Credits = 0, 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Intelligence = 10, 
            Constitution = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Dexterity = 10, 
         }, 
         Alignment = 0, 
         Height = 0, 
         Position = "standing", 
         LongDescr = "Some god abandoned a newly created dude here.\
", 
      }, 
      [9049] = 
      {
         ShortDescr = "a newly created dude", 
         ArmorClass = 0, 
         Description = "", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Name = "dude", 
         Vnum = 9049, 
         NumberOfAttacks = 0, 
         Sex = "undistinguished", 
         Level = 1, 
         Weight = 0, 
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
         HitRoll = 0, 
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
         Race = "Human", 
         SaveVs = 
         {
            Wand = 0, 
            SpellStaff = 0, 
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         DamRoll = 0, 
         Credits = 0, 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Intelligence = 10, 
            Constitution = 10, 
            Strength = 10, 
            Wisdom = 10, 
            Dexterity = 10, 
         }, 
         Alignment = 0, 
         Height = 0, 
         Position = "standing", 
         LongDescr = "Some god abandoned a newly created dude here.\
", 
      }, 
   }, 
   ResetMessage = "", 
   Filename = "corus_jail.lua", 
   ResetFrequency = 0, 
   LowEconomy = 6250000, 
   Author = "Durga", 
   HighEconomy = 0, 
}
