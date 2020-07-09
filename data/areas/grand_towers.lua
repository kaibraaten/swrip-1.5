-- Grand Towers Appartments
-- Last saved Thursday 09-Jul-2020 21:56:48

AreaEntry
{
   HighEconomy = 0, 
   Objects = 
   {
      [5000] = 
      {
         Weight = 1, 
         ItemType = "trash", 
         ShortDescr = "a newly created dummy", 
         Name = "dummy", 
         Layers = 0, 
         Vnum = 5000, 
         ExtraDescriptions = 
         {
         }, 
         Description = "Some god dropped a newly created dummy here.", 
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
      [5099] = 
      {
         Weight = 1, 
         ItemType = "trash", 
         ShortDescr = "a plant", 
         Name = "plant", 
         Layers = 0, 
         Vnum = 5099, 
         ExtraDescriptions = 
         {
         }, 
         Description = "A plant sits in the corner.", 
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
      [5000] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [23] = "Hotel", 
            [10] = "Safe", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "The Guest Room", 
         Vnum = 5000, 
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
               DestinationVnum = 5001, 
               Direction = "north", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [5001] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "The Lobby", 
         Vnum = 5001, 
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
               DestinationVnum = 5002, 
               Direction = "north", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 303, 
               Direction = "east", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5011, 
               Direction = "west", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [5002] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "A Turbolift: Main Lobby", 
         Vnum = 5002, 
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
               DestinationVnum = 5001, 
               Direction = "south", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5003, 
               Direction = "up", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [5003] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "A Turbolift: Floor 100", 
         Vnum = 5003, 
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
               DestinationVnum = 5016, 
               Direction = "south", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5004, 
               Direction = "up", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5002, 
               Direction = "down", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [5004] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "A Turbolift: Floor 200", 
         Vnum = 5004, 
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
               DestinationVnum = 5021, 
               Direction = "south", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5005, 
               Direction = "up", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5003, 
               Direction = "down", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [5005] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "A Turbolift: Floor 300", 
         Vnum = 5005, 
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
               DestinationVnum = 5026, 
               Direction = "south", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5006, 
               Direction = "up", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5004, 
               Direction = "down", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [5006] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "A Turbolift: Floor 400", 
         Vnum = 5006, 
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
               DestinationVnum = 5031, 
               Direction = "south", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5007, 
               Direction = "up", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5005, 
               Direction = "down", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [5007] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "A Turbolift: Floor 500", 
         Vnum = 5007, 
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
               DestinationVnum = 5036, 
               Direction = "south", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5008, 
               Direction = "up", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5006, 
               Direction = "down", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [5008] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "A Turbolift: Floor 600", 
         Vnum = 5008, 
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
               DestinationVnum = 5099, 
               Direction = "south", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5009, 
               Direction = "up", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5007, 
               Direction = "down", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [5009] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "A Turbolift: Floor 700", 
         Vnum = 5009, 
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
               DestinationVnum = 5100, 
               Direction = "north", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5113, 
               Direction = "east", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5104, 
               Direction = "south", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5108, 
               Direction = "west", 
               Distance = 0, 
            }, 
            [5] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5010, 
               Direction = "up", 
               Distance = 0, 
            }, 
            [6] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5008, 
               Direction = "down", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [5010] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "A Turbolift: Floor 800", 
         Vnum = 5010, 
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
               DestinationVnum = 5009, 
               Direction = "down", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [5011] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "A Hallway", 
         Vnum = 5011, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully\
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5040, 
               Direction = "north", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5001, 
               Direction = "east", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5041, 
               Direction = "south", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5012, 
               Direction = "west", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [5012] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "A Hallway", 
         Vnum = 5012, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully\
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5043, 
               Direction = "north", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5011, 
               Direction = "east", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5042, 
               Direction = "south", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5013, 
               Direction = "west", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [5013] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "A Hallway", 
         Vnum = 5013, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully\
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5045, 
               Direction = "north", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5012, 
               Direction = "east", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5044, 
               Direction = "south", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5014, 
               Direction = "west", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [5014] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "A Hallway", 
         Vnum = 5014, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully\
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5047, 
               Direction = "north", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5013, 
               Direction = "east", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5046, 
               Direction = "south", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5015, 
               Direction = "west", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [5015] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "A Hallway", 
         Vnum = 5015, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5049, 
               Direction = "north", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5014, 
               Direction = "east", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5048, 
               Direction = "south", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5098, 
               Direction = "west", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [5016] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "A Hallway", 
         Vnum = 5016, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5003, 
               Direction = "north", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5096, 
               Direction = "south", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5017, 
               Direction = "west", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [5017] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "A Hallway", 
         Vnum = 5017, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5051, 
               Direction = "north", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5016, 
               Direction = "east", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5050, 
               Direction = "south", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5018, 
               Direction = "west", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [5018] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "A Hallway", 
         Vnum = 5018, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5052, 
               Direction = "north", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5017, 
               Direction = "east", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5053, 
               Direction = "south", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5019, 
               Direction = "west", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [5019] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "A Hallway", 
         Vnum = 5019, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5055, 
               Direction = "north", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5018, 
               Direction = "east", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5054, 
               Direction = "south", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5020, 
               Direction = "west", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [5020] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "A Hallway", 
         Vnum = 5020, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5057, 
               Direction = "north", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5019, 
               Direction = "east", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5056, 
               Direction = "south", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5097, 
               Direction = "west", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [5021] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "A Hallway", 
         Vnum = 5021, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5004, 
               Direction = "north", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5094, 
               Direction = "south", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5022, 
               Direction = "west", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [5022] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "A Hallway", 
         Vnum = 5022, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5059, 
               Direction = "north", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5021, 
               Direction = "east", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5058, 
               Direction = "south", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5023, 
               Direction = "west", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [5023] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "A Hallway", 
         Vnum = 5023, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5061, 
               Direction = "north", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5022, 
               Direction = "east", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5060, 
               Direction = "south", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5024, 
               Direction = "west", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [5024] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "A Hallway", 
         Vnum = 5024, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5063, 
               Direction = "north", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5023, 
               Direction = "east", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5062, 
               Direction = "south", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5025, 
               Direction = "west", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [5025] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "A Hallway", 
         Vnum = 5025, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5065, 
               Direction = "north", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5024, 
               Direction = "east", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5064, 
               Direction = "south", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5095, 
               Direction = "west", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [5026] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "A Hallway", 
         Vnum = 5026, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5005, 
               Direction = "north", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5092, 
               Direction = "south", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5027, 
               Direction = "west", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [5027] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "A Hallway", 
         Vnum = 5027, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5067, 
               Direction = "north", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5026, 
               Direction = "east", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5066, 
               Direction = "south", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5028, 
               Direction = "west", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [5028] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "A Hallway", 
         Vnum = 5028, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5069, 
               Direction = "north", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5027, 
               Direction = "east", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5068, 
               Direction = "south", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5029, 
               Direction = "west", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [5029] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "A Hallway", 
         Vnum = 5029, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5071, 
               Direction = "north", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5028, 
               Direction = "east", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5070, 
               Direction = "south", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5030, 
               Direction = "west", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [5030] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "A Hallway", 
         Vnum = 5030, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5073, 
               Direction = "north", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5029, 
               Direction = "east", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5072, 
               Direction = "south", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5093, 
               Direction = "west", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [5031] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "A Hallway", 
         Vnum = 5031, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5006, 
               Direction = "north", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5090, 
               Direction = "south", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5032, 
               Direction = "west", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [5032] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "A Hallway", 
         Vnum = 5032, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5074, 
               Direction = "north", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5031, 
               Direction = "east", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5075, 
               Direction = "south", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5033, 
               Direction = "west", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [5033] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "A Hallway", 
         Vnum = 5033, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5077, 
               Direction = "north", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5032, 
               Direction = "east", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5076, 
               Direction = "south", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5034, 
               Direction = "west", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [5034] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "A Hallway", 
         Vnum = 5034, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5079, 
               Direction = "north", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5033, 
               Direction = "east", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5078, 
               Direction = "south", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5035, 
               Direction = "west", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [5035] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "A Hallway", 
         Vnum = 5035, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5081, 
               Direction = "north", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5034, 
               Direction = "east", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5080, 
               Direction = "south", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5091, 
               Direction = "west", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [5036] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "A Hallway", 
         Vnum = 5036, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5007, 
               Direction = "north", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5089, 
               Direction = "south", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5037, 
               Direction = "west", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [5037] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "A Hallway", 
         Vnum = 5037, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5083, 
               Direction = "north", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5036, 
               Direction = "east", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5082, 
               Direction = "south", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5038, 
               Direction = "west", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [5038] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "A Hallway", 
         Vnum = 5038, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5085, 
               Direction = "north", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5037, 
               Direction = "east", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5084, 
               Direction = "south", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5039, 
               Direction = "west", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [5039] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "A Hallway", 
         Vnum = 5039, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The hallway seems to stretch forever. It is brightly lit and cheerfully \
decorated. The walls are a redish wood and a plush brown carpet lines the\
floor. The doors are spaced evenly apart and are all numbered.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5086, 
               Direction = "north", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5038, 
               Direction = "east", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5087, 
               Direction = "south", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5088, 
               Direction = "west", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "city", 
      }, 
      [5040] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Vnum = 5040, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5011, 
               Direction = "south", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
      }, 
      [5041] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Vnum = 5041, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5011, 
               Direction = "north", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
      }, 
      [5042] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Vnum = 5042, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5012, 
               Direction = "north", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
      }, 
      [5043] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Vnum = 5043, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5012, 
               Direction = "south", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
      }, 
      [5044] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               Code = "mpechoat $n The healing warmth of the bacta spreads over your body.\
feel heal $n\
", 
               MudProgType = "rand_prog", 
            }, 
         }, 
         Vnum = 5044, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5013, 
               Direction = "north", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
      }, 
      [5045] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Vnum = 5045, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5013, 
               Direction = "south", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
      }, 
      [5046] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Vnum = 5046, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5014, 
               Direction = "north", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
      }, 
      [5047] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Vnum = 5047, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5014, 
               Direction = "south", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
      }, 
      [5048] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Vnum = 5048, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5015, 
               Direction = "north", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
      }, 
      [5049] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Vnum = 5049, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5015, 
               Direction = "south", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
      }, 
      [5050] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Vnum = 5050, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5017, 
               Direction = "north", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
      }, 
      [5051] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Vnum = 5051, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5017, 
               Direction = "south", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
      }, 
      [5052] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Vnum = 5052, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5018, 
               Direction = "south", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
      }, 
      [5053] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Vnum = 5053, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5018, 
               Direction = "north", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
      }, 
      [5054] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Vnum = 5054, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5019, 
               Direction = "north", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
      }, 
      [5055] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Vnum = 5055, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5019, 
               Direction = "south", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
      }, 
      [5056] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Vnum = 5056, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5020, 
               Direction = "north", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
      }, 
      [5057] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Vnum = 5057, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5020, 
               Direction = "south", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
      }, 
      [5058] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Vnum = 5058, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5022, 
               Direction = "north", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
      }, 
      [5059] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Vnum = 5059, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5022, 
               Direction = "south", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
      }, 
      [5060] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Vnum = 5060, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5023, 
               Direction = "north", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
      }, 
      [5061] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Vnum = 5061, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5023, 
               Direction = "south", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
      }, 
      [5062] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Vnum = 5062, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5024, 
               Direction = "north", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
      }, 
      [5063] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Vnum = 5063, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5024, 
               Direction = "south", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
      }, 
      [5064] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Vnum = 5064, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5025, 
               Direction = "north", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
      }, 
      [5065] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Vnum = 5065, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5025, 
               Direction = "south", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
      }, 
      [5066] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Vnum = 5066, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5027, 
               Direction = "north", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
      }, 
      [5067] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Vnum = 5067, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5027, 
               Direction = "south", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
      }, 
      [5068] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Vnum = 5068, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5028, 
               Direction = "north", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
      }, 
      [5069] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Vnum = 5069, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5028, 
               Direction = "south", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
      }, 
      [5070] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Vnum = 5070, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5029, 
               Direction = "north", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
      }, 
      [5071] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Vnum = 5071, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5029, 
               Direction = "south", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
      }, 
      [5072] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Vnum = 5072, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5030, 
               Direction = "north", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
      }, 
      [5073] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Vnum = 5073, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5030, 
               Direction = "south", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
      }, 
      [5074] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Vnum = 5074, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5032, 
               Direction = "south", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
      }, 
      [5075] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Vnum = 5075, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5032, 
               Direction = "north", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
      }, 
      [5076] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Vnum = 5076, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5033, 
               Direction = "north", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
      }, 
      [5077] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Vnum = 5077, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5033, 
               Direction = "south", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
      }, 
      [5078] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Vnum = 5078, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5034, 
               Direction = "north", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
      }, 
      [5079] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Vnum = 5079, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5034, 
               Direction = "south", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
      }, 
      [5080] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Vnum = 5080, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5035, 
               Direction = "north", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
      }, 
      [5081] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Vnum = 5081, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5035, 
               Direction = "south", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
      }, 
      [5082] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Vnum = 5082, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5037, 
               Direction = "north", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
      }, 
      [5083] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Vnum = 5083, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5037, 
               Direction = "south", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
      }, 
      [5084] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Vnum = 5084, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5038, 
               Direction = "north", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
      }, 
      [5085] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Vnum = 5085, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5038, 
               Direction = "south", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
      }, 
      [5086] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Vnum = 5086, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5039, 
               Direction = "south", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
      }, 
      [5087] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Vnum = 5087, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5039, 
               Direction = "north", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
      }, 
      [5088] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Vnum = 5088, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5039, 
               Direction = "east", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
      }, 
      [5089] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Vnum = 5089, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5036, 
               Direction = "north", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
      }, 
      [5090] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Vnum = 5090, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5031, 
               Direction = "north", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
      }, 
      [5091] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Vnum = 5091, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5035, 
               Direction = "east", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
      }, 
      [5092] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Vnum = 5092, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5026, 
               Direction = "north", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
      }, 
      [5093] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Vnum = 5093, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5030, 
               Direction = "east", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
      }, 
      [5094] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Vnum = 5094, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5021, 
               Direction = "north", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
      }, 
      [5095] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Vnum = 5095, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5025, 
               Direction = "east", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
      }, 
      [5096] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Vnum = 5096, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5016, 
               Direction = "north", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
      }, 
      [5097] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Vnum = 5097, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5020, 
               Direction = "east", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
      }, 
      [5098] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Vnum = 5098, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5015, 
               Direction = "east", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
      }, 
      [5099] = 
      {
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Vnum = 5099, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Key = -1, 
               Description = "", 
               DestinationVnum = 5008, 
               Direction = "north", 
               Distance = 0, 
            }, 
         }, 
         TeleVnum = 0, 
         Sector = "inside", 
      }, 
   }, 
   Author = "Durga", 
   ResetMessage = "", 
   Name = "Grand Towers Appartments", 
   Resets = 
   {
      [1] = 
      {
         Arg3 = 5001, 
         Command = "O", 
         Arg2 = 1, 
         Arg1 = 5099, 
         MiscData = 1, 
      }, 
   }, 
   LowEconomy = 130050000, 
   Mobiles = 
   {
      [5000] = 
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
         LongDescr = "Some god abandoned a newly created dummy here.\
", 
         Level = 1, 
         Position = "standing", 
         Vnum = 5000, 
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
         ShortDescr = "a newly created dummy", 
         Weight = 0, 
         Name = "dummy", 
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
      [5099] = 
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
         LongDescr = "Some god abandoned a newly created dummy here.\
", 
         Level = 1, 
         Position = "standing", 
         Vnum = 5099, 
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
         ShortDescr = "a newly created dummy", 
         Weight = 0, 
         Name = "dummy", 
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
         First = 5000, 
         Last = 5099, 
      }, 
      Object = 
      {
         First = 5000, 
         Last = 5099, 
      }, 
      Room = 
      {
         First = 5000, 
         Last = 5099, 
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
   Filename = "grand_towers.lua", 
}
