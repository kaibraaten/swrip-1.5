-- Grand Towers Appartments
-- Last saved Sunday 31-May-2020 15:51:33

AreaEntry
{
   Author = "Durga", 
   Objects = 
   {
      [5000] = 
      {
         Layers = 0, 
         ItemType = "trash", 
         Name = "dummy", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         Description = "Some god dropped a newly created dummy here.", 
         Weight = 1, 
         Vnum = 5000, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "a newly created dummy", 
         ActionDescription = "", 
      }, 
      [5099] = 
      {
         Layers = 0, 
         ItemType = "trash", 
         Name = "plant", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         Description = "A plant sits in the corner.", 
         Weight = 1, 
         Vnum = 5099, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "a plant", 
         ActionDescription = "", 
      }, 
   }, 
   Rooms = 
   {
      [5000] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 5001, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "The Guest Room", 
         Sector = "city", 
         Flags = 
         {
            [23] = "Hotel", 
            [10] = "Safe", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5000, 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [5001] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 5002, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "east", 
               DestinationVnum = 303, 
               Distance = 0, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "west", 
               DestinationVnum = 5011, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "The Lobby", 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5001, 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [5002] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 5001, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "up", 
               DestinationVnum = 5003, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A Turbolift: Main Lobby", 
         Sector = "city", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5002, 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [5003] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 5016, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "up", 
               DestinationVnum = 5004, 
               Distance = 0, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "down", 
               DestinationVnum = 5002, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A Turbolift: Floor 100", 
         Sector = "city", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5003, 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [5004] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 5021, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "up", 
               DestinationVnum = 5005, 
               Distance = 0, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "down", 
               DestinationVnum = 5003, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A Turbolift: Floor 200", 
         Sector = "city", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5004, 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [5005] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 5026, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "up", 
               DestinationVnum = 5006, 
               Distance = 0, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "down", 
               DestinationVnum = 5004, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A Turbolift: Floor 300", 
         Sector = "city", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5005, 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [5006] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 5031, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "up", 
               DestinationVnum = 5007, 
               Distance = 0, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "down", 
               DestinationVnum = 5005, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A Turbolift: Floor 400", 
         Sector = "city", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5006, 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [5007] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 5036, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "up", 
               DestinationVnum = 5008, 
               Distance = 0, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "down", 
               DestinationVnum = 5006, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A Turbolift: Floor 500", 
         Sector = "city", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5007, 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [5008] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 5099, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "up", 
               DestinationVnum = 5009, 
               Distance = 0, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "down", 
               DestinationVnum = 5007, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A Turbolift: Floor 600", 
         Sector = "city", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5008, 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [5009] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 5100, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "east", 
               DestinationVnum = 5113, 
               Distance = 0, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 5104, 
               Distance = 0, 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "west", 
               DestinationVnum = 5108, 
               Distance = 0, 
               Key = -1, 
            }, 
            [5] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "up", 
               DestinationVnum = 5010, 
               Distance = 0, 
               Key = -1, 
            }, 
            [6] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "down", 
               DestinationVnum = 5008, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A Turbolift: Floor 700", 
         Sector = "city", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5009, 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [5010] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "down", 
               DestinationVnum = 5009, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A Turbolift: Floor 800", 
         Sector = "city", 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5010, 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
      }, 
      [5011] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 5040, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "east", 
               DestinationVnum = 5001, 
               Distance = 0, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 5041, 
               Distance = 0, 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "west", 
               DestinationVnum = 5012, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A Hallway", 
         Sector = "city", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5011, 
         TeleDelay = 0, 
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully\
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         TeleVnum = 0, 
      }, 
      [5012] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 5043, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "east", 
               DestinationVnum = 5011, 
               Distance = 0, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 5042, 
               Distance = 0, 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "west", 
               DestinationVnum = 5013, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A Hallway", 
         Sector = "city", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5012, 
         TeleDelay = 0, 
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully\
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         TeleVnum = 0, 
      }, 
      [5013] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 5045, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "east", 
               DestinationVnum = 5012, 
               Distance = 0, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 5044, 
               Distance = 0, 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "west", 
               DestinationVnum = 5014, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A Hallway", 
         Sector = "city", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5013, 
         TeleDelay = 0, 
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully\
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         TeleVnum = 0, 
      }, 
      [5014] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 5047, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "east", 
               DestinationVnum = 5013, 
               Distance = 0, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 5046, 
               Distance = 0, 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "west", 
               DestinationVnum = 5015, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A Hallway", 
         Sector = "city", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5014, 
         TeleDelay = 0, 
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully\
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         TeleVnum = 0, 
      }, 
      [5015] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 5049, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "east", 
               DestinationVnum = 5014, 
               Distance = 0, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 5048, 
               Distance = 0, 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "west", 
               DestinationVnum = 5098, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A Hallway", 
         Sector = "city", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5015, 
         TeleDelay = 0, 
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         TeleVnum = 0, 
      }, 
      [5016] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 5003, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 5096, 
               Distance = 0, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "west", 
               DestinationVnum = 5017, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A Hallway", 
         Sector = "city", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5016, 
         TeleDelay = 0, 
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         TeleVnum = 0, 
      }, 
      [5017] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 5051, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "east", 
               DestinationVnum = 5016, 
               Distance = 0, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 5050, 
               Distance = 0, 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "west", 
               DestinationVnum = 5018, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A Hallway", 
         Sector = "city", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5017, 
         TeleDelay = 0, 
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         TeleVnum = 0, 
      }, 
      [5018] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 5052, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "east", 
               DestinationVnum = 5017, 
               Distance = 0, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 5053, 
               Distance = 0, 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "west", 
               DestinationVnum = 5019, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A Hallway", 
         Sector = "city", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5018, 
         TeleDelay = 0, 
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         TeleVnum = 0, 
      }, 
      [5019] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 5055, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "east", 
               DestinationVnum = 5018, 
               Distance = 0, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 5054, 
               Distance = 0, 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "west", 
               DestinationVnum = 5020, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A Hallway", 
         Sector = "city", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5019, 
         TeleDelay = 0, 
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         TeleVnum = 0, 
      }, 
      [5020] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 5057, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "east", 
               DestinationVnum = 5019, 
               Distance = 0, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 5056, 
               Distance = 0, 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "west", 
               DestinationVnum = 5097, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A Hallway", 
         Sector = "city", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5020, 
         TeleDelay = 0, 
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         TeleVnum = 0, 
      }, 
      [5021] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 5004, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 5094, 
               Distance = 0, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "west", 
               DestinationVnum = 5022, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A Hallway", 
         Sector = "city", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5021, 
         TeleDelay = 0, 
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         TeleVnum = 0, 
      }, 
      [5022] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 5059, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "east", 
               DestinationVnum = 5021, 
               Distance = 0, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 5058, 
               Distance = 0, 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "west", 
               DestinationVnum = 5023, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A Hallway", 
         Sector = "city", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5022, 
         TeleDelay = 0, 
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         TeleVnum = 0, 
      }, 
      [5023] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 5061, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "east", 
               DestinationVnum = 5022, 
               Distance = 0, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 5060, 
               Distance = 0, 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "west", 
               DestinationVnum = 5024, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A Hallway", 
         Sector = "city", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5023, 
         TeleDelay = 0, 
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         TeleVnum = 0, 
      }, 
      [5024] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 5063, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "east", 
               DestinationVnum = 5023, 
               Distance = 0, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 5062, 
               Distance = 0, 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "west", 
               DestinationVnum = 5025, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A Hallway", 
         Sector = "city", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5024, 
         TeleDelay = 0, 
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         TeleVnum = 0, 
      }, 
      [5025] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 5065, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "east", 
               DestinationVnum = 5024, 
               Distance = 0, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 5064, 
               Distance = 0, 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "west", 
               DestinationVnum = 5095, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A Hallway", 
         Sector = "city", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5025, 
         TeleDelay = 0, 
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         TeleVnum = 0, 
      }, 
      [5026] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 5005, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 5092, 
               Distance = 0, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "west", 
               DestinationVnum = 5027, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A Hallway", 
         Sector = "city", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5026, 
         TeleDelay = 0, 
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         TeleVnum = 0, 
      }, 
      [5027] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 5067, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "east", 
               DestinationVnum = 5026, 
               Distance = 0, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 5066, 
               Distance = 0, 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "west", 
               DestinationVnum = 5028, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A Hallway", 
         Sector = "city", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5027, 
         TeleDelay = 0, 
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         TeleVnum = 0, 
      }, 
      [5028] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 5069, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "east", 
               DestinationVnum = 5027, 
               Distance = 0, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 5068, 
               Distance = 0, 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "west", 
               DestinationVnum = 5029, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A Hallway", 
         Sector = "city", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5028, 
         TeleDelay = 0, 
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         TeleVnum = 0, 
      }, 
      [5029] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 5071, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "east", 
               DestinationVnum = 5028, 
               Distance = 0, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 5070, 
               Distance = 0, 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "west", 
               DestinationVnum = 5030, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A Hallway", 
         Sector = "city", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5029, 
         TeleDelay = 0, 
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         TeleVnum = 0, 
      }, 
      [5030] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 5073, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "east", 
               DestinationVnum = 5029, 
               Distance = 0, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 5072, 
               Distance = 0, 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "west", 
               DestinationVnum = 5093, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A Hallway", 
         Sector = "city", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5030, 
         TeleDelay = 0, 
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         TeleVnum = 0, 
      }, 
      [5031] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 5006, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 5090, 
               Distance = 0, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "west", 
               DestinationVnum = 5032, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A Hallway", 
         Sector = "city", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5031, 
         TeleDelay = 0, 
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         TeleVnum = 0, 
      }, 
      [5032] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 5074, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "east", 
               DestinationVnum = 5031, 
               Distance = 0, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 5075, 
               Distance = 0, 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "west", 
               DestinationVnum = 5033, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A Hallway", 
         Sector = "city", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5032, 
         TeleDelay = 0, 
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         TeleVnum = 0, 
      }, 
      [5033] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 5077, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "east", 
               DestinationVnum = 5032, 
               Distance = 0, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 5076, 
               Distance = 0, 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "west", 
               DestinationVnum = 5034, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A Hallway", 
         Sector = "city", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5033, 
         TeleDelay = 0, 
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         TeleVnum = 0, 
      }, 
      [5034] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 5079, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "east", 
               DestinationVnum = 5033, 
               Distance = 0, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 5078, 
               Distance = 0, 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "west", 
               DestinationVnum = 5035, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A Hallway", 
         Sector = "city", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5034, 
         TeleDelay = 0, 
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         TeleVnum = 0, 
      }, 
      [5035] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 5081, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "east", 
               DestinationVnum = 5034, 
               Distance = 0, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 5080, 
               Distance = 0, 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "west", 
               DestinationVnum = 5091, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A Hallway", 
         Sector = "city", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5035, 
         TeleDelay = 0, 
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         TeleVnum = 0, 
      }, 
      [5036] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 5007, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 5089, 
               Distance = 0, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "west", 
               DestinationVnum = 5037, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A Hallway", 
         Sector = "city", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5036, 
         TeleDelay = 0, 
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         TeleVnum = 0, 
      }, 
      [5037] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 5083, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "east", 
               DestinationVnum = 5036, 
               Distance = 0, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 5082, 
               Distance = 0, 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "west", 
               DestinationVnum = 5038, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A Hallway", 
         Sector = "city", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5037, 
         TeleDelay = 0, 
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         TeleVnum = 0, 
      }, 
      [5038] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 5085, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "east", 
               DestinationVnum = 5037, 
               Distance = 0, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 5084, 
               Distance = 0, 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "west", 
               DestinationVnum = 5039, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A Hallway", 
         Sector = "city", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5038, 
         TeleDelay = 0, 
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         TeleVnum = 0, 
      }, 
      [5039] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 5086, 
               Distance = 0, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "east", 
               DestinationVnum = 5038, 
               Distance = 0, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 5087, 
               Distance = 0, 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "west", 
               DestinationVnum = 5088, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A Hallway", 
         Sector = "city", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5039, 
         TeleDelay = 0, 
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         TeleVnum = 0, 
      }, 
      [5040] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 5011, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "An Empty Home", 
         Sector = "inside", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5040, 
         TeleDelay = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleVnum = 0, 
      }, 
      [5041] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 5011, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "An Empty Home", 
         Sector = "inside", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5041, 
         TeleDelay = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleVnum = 0, 
      }, 
      [5042] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 5012, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "An Empty Home", 
         Sector = "inside", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5042, 
         TeleDelay = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleVnum = 0, 
      }, 
      [5043] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 5012, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "An Empty Home", 
         Sector = "inside", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5043, 
         TeleDelay = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleVnum = 0, 
      }, 
      [5044] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 5013, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "An Empty Home", 
         Sector = "inside", 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpechoat $n The healing warmth of the bacta spreads over your body.\
feel heal $n\
", 
               Arguments = "100", 
               MudProgType = "rand_prog", 
            }, 
         }, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5044, 
         TeleDelay = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleVnum = 0, 
      }, 
      [5045] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 5013, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "An Empty Home", 
         Sector = "inside", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5045, 
         TeleDelay = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleVnum = 0, 
      }, 
      [5046] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 5014, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "An Empty Home", 
         Sector = "inside", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5046, 
         TeleDelay = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleVnum = 0, 
      }, 
      [5047] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 5014, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "An Empty Home", 
         Sector = "inside", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5047, 
         TeleDelay = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleVnum = 0, 
      }, 
      [5048] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 5015, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "An Empty Home", 
         Sector = "inside", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5048, 
         TeleDelay = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleVnum = 0, 
      }, 
      [5049] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 5015, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "An Empty Home", 
         Sector = "inside", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5049, 
         TeleDelay = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleVnum = 0, 
      }, 
      [5050] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 5017, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "An Empty Home", 
         Sector = "inside", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5050, 
         TeleDelay = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleVnum = 0, 
      }, 
      [5051] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 5017, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "An Empty Home", 
         Sector = "inside", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5051, 
         TeleDelay = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleVnum = 0, 
      }, 
      [5052] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 5018, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "An Empty Home", 
         Sector = "inside", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5052, 
         TeleDelay = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleVnum = 0, 
      }, 
      [5053] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 5018, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "An Empty Home", 
         Sector = "inside", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5053, 
         TeleDelay = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleVnum = 0, 
      }, 
      [5054] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 5019, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "An Empty Home", 
         Sector = "inside", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5054, 
         TeleDelay = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleVnum = 0, 
      }, 
      [5055] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 5019, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "An Empty Home", 
         Sector = "inside", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5055, 
         TeleDelay = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleVnum = 0, 
      }, 
      [5056] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 5020, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "An Empty Home", 
         Sector = "inside", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5056, 
         TeleDelay = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleVnum = 0, 
      }, 
      [5057] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 5020, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "An Empty Home", 
         Sector = "inside", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5057, 
         TeleDelay = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleVnum = 0, 
      }, 
      [5058] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 5022, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "An Empty Home", 
         Sector = "inside", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5058, 
         TeleDelay = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleVnum = 0, 
      }, 
      [5059] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 5022, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "An Empty Home", 
         Sector = "inside", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5059, 
         TeleDelay = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleVnum = 0, 
      }, 
      [5060] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 5023, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "An Empty Home", 
         Sector = "inside", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5060, 
         TeleDelay = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleVnum = 0, 
      }, 
      [5061] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 5023, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "An Empty Home", 
         Sector = "inside", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5061, 
         TeleDelay = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleVnum = 0, 
      }, 
      [5062] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 5024, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "An Empty Home", 
         Sector = "inside", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5062, 
         TeleDelay = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleVnum = 0, 
      }, 
      [5063] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 5024, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "An Empty Home", 
         Sector = "inside", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5063, 
         TeleDelay = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleVnum = 0, 
      }, 
      [5064] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 5025, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "An Empty Home", 
         Sector = "inside", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5064, 
         TeleDelay = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleVnum = 0, 
      }, 
      [5065] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 5025, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "An Empty Home", 
         Sector = "inside", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5065, 
         TeleDelay = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleVnum = 0, 
      }, 
      [5066] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 5027, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "An Empty Home", 
         Sector = "inside", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5066, 
         TeleDelay = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleVnum = 0, 
      }, 
      [5067] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 5027, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "An Empty Home", 
         Sector = "inside", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5067, 
         TeleDelay = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleVnum = 0, 
      }, 
      [5068] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 5028, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "An Empty Home", 
         Sector = "inside", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5068, 
         TeleDelay = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleVnum = 0, 
      }, 
      [5069] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 5028, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "An Empty Home", 
         Sector = "inside", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5069, 
         TeleDelay = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleVnum = 0, 
      }, 
      [5070] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 5029, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "An Empty Home", 
         Sector = "inside", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5070, 
         TeleDelay = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleVnum = 0, 
      }, 
      [5071] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 5029, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "An Empty Home", 
         Sector = "inside", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5071, 
         TeleDelay = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleVnum = 0, 
      }, 
      [5072] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 5030, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "An Empty Home", 
         Sector = "inside", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5072, 
         TeleDelay = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleVnum = 0, 
      }, 
      [5073] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 5030, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "An Empty Home", 
         Sector = "inside", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5073, 
         TeleDelay = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleVnum = 0, 
      }, 
      [5074] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 5032, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "An Empty Home", 
         Sector = "inside", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5074, 
         TeleDelay = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleVnum = 0, 
      }, 
      [5075] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 5032, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "An Empty Home", 
         Sector = "inside", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5075, 
         TeleDelay = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleVnum = 0, 
      }, 
      [5076] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 5033, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "An Empty Home", 
         Sector = "inside", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5076, 
         TeleDelay = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleVnum = 0, 
      }, 
      [5077] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 5033, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "An Empty Home", 
         Sector = "inside", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5077, 
         TeleDelay = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleVnum = 0, 
      }, 
      [5078] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 5034, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "An Empty Home", 
         Sector = "inside", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5078, 
         TeleDelay = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleVnum = 0, 
      }, 
      [5079] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 5034, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "An Empty Home", 
         Sector = "inside", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5079, 
         TeleDelay = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleVnum = 0, 
      }, 
      [5080] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 5035, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "An Empty Home", 
         Sector = "inside", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5080, 
         TeleDelay = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleVnum = 0, 
      }, 
      [5081] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 5035, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "An Empty Home", 
         Sector = "inside", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5081, 
         TeleDelay = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleVnum = 0, 
      }, 
      [5082] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 5037, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "An Empty Home", 
         Sector = "inside", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5082, 
         TeleDelay = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleVnum = 0, 
      }, 
      [5083] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 5037, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "An Empty Home", 
         Sector = "inside", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5083, 
         TeleDelay = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleVnum = 0, 
      }, 
      [5084] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 5038, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "An Empty Home", 
         Sector = "inside", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5084, 
         TeleDelay = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleVnum = 0, 
      }, 
      [5085] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 5038, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "An Empty Home", 
         Sector = "inside", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5085, 
         TeleDelay = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleVnum = 0, 
      }, 
      [5086] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "south", 
               DestinationVnum = 5039, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "An Empty Home", 
         Sector = "inside", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5086, 
         TeleDelay = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleVnum = 0, 
      }, 
      [5087] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 5039, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "An Empty Home", 
         Sector = "inside", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5087, 
         TeleDelay = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleVnum = 0, 
      }, 
      [5088] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "east", 
               DestinationVnum = 5039, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "An Empty Home", 
         Sector = "inside", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5088, 
         TeleDelay = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleVnum = 0, 
      }, 
      [5089] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 5036, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "An Empty Home", 
         Sector = "inside", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5089, 
         TeleDelay = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleVnum = 0, 
      }, 
      [5090] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 5031, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "An Empty Home", 
         Sector = "inside", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5090, 
         TeleDelay = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleVnum = 0, 
      }, 
      [5091] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "east", 
               DestinationVnum = 5035, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "An Empty Home", 
         Sector = "inside", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5091, 
         TeleDelay = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleVnum = 0, 
      }, 
      [5092] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 5026, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "An Empty Home", 
         Sector = "inside", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5092, 
         TeleDelay = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleVnum = 0, 
      }, 
      [5093] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "east", 
               DestinationVnum = 5030, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "An Empty Home", 
         Sector = "inside", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5093, 
         TeleDelay = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleVnum = 0, 
      }, 
      [5094] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 5021, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "An Empty Home", 
         Sector = "inside", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5094, 
         TeleDelay = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleVnum = 0, 
      }, 
      [5095] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "east", 
               DestinationVnum = 5025, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "An Empty Home", 
         Sector = "inside", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5095, 
         TeleDelay = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleVnum = 0, 
      }, 
      [5096] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 5016, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "An Empty Home", 
         Sector = "inside", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5096, 
         TeleDelay = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleVnum = 0, 
      }, 
      [5097] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "east", 
               DestinationVnum = 5020, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "An Empty Home", 
         Sector = "inside", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5097, 
         TeleDelay = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleVnum = 0, 
      }, 
      [5098] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "east", 
               DestinationVnum = 5015, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "An Empty Home", 
         Sector = "inside", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5098, 
         TeleDelay = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleVnum = 0, 
      }, 
      [5099] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Direction = "north", 
               DestinationVnum = 5008, 
               Distance = 0, 
               Key = -1, 
            }, 
         }, 
         Tunnel = 0, 
         Name = "An Empty Home", 
         Sector = "inside", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Vnum = 5099, 
         TeleDelay = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         TeleVnum = 0, 
      }, 
   }, 
   HighEconomy = 0, 
   ResetMessage = "", 
   Name = "Grand Towers Appartments", 
   Mobiles = 
   {
      [5000] = 
      {
         Credits = 0, 
         Sex = "undistinguished", 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
         }, 
         DamRoll = 0, 
         ShortDescr = "a newly created dummy", 
         ArmorClass = 0, 
         Level = 1, 
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
         Stats = 
         {
            Luck = 0, 
            Intelligence = 0, 
            Force = 0, 
            Strength = 0, 
            Dexterity = 0, 
            Wisdom = 0, 
            Constitution = 0, 
            Charisma = 0, 
         }, 
         Position = "standing", 
         HitRoll = 0, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         Alignment = 0, 
         Weight = 0, 
         Height = 0, 
         Race = "Human", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         LongDescr = "Some god abandoned a newly created dummy here.\
", 
         Description = "", 
         NumberOfAttacks = 0, 
         Vnum = 5000, 
         Name = "dummy", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         DefaultPosition = "standing", 
      }, 
      [5099] = 
      {
         Credits = 0, 
         Sex = "undistinguished", 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
         }, 
         DamRoll = 0, 
         ShortDescr = "a newly created dummy", 
         ArmorClass = 0, 
         Level = 1, 
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
         Stats = 
         {
            Luck = 0, 
            Intelligence = 0, 
            Force = 0, 
            Strength = 0, 
            Dexterity = 0, 
            Wisdom = 0, 
            Constitution = 0, 
            Charisma = 0, 
         }, 
         Position = "standing", 
         HitRoll = 0, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         Alignment = 0, 
         Weight = 0, 
         Height = 0, 
         Race = "Human", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         LongDescr = "Some god abandoned a newly created dummy here.\
", 
         Description = "", 
         NumberOfAttacks = 0, 
         Vnum = 5099, 
         Name = "dummy", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         DefaultPosition = "standing", 
      }, 
   }, 
   Resets = 
   {
      [1] = 
      {
         Arg1 = 5099, 
         Arg2 = 1, 
         Arg3 = 5001, 
         Command = "O", 
         MiscData = 1, 
      }, 
   }, 
   VnumRanges = 
   {
      Room = 
      {
         Last = 5099, 
         First = 5000, 
      }, 
      Mob = 
      {
         Last = 5099, 
         First = 5000, 
      }, 
      Object = 
      {
         Last = 5099, 
         First = 5000, 
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
         High = 103, 
         Low = 0, 
      }, 
   }, 
   LowEconomy = 130050000, 
   FileFormatVersion = 1, 
   Filename = "grand_towers.lua", 
   ResetFrequency = 0, 
}
