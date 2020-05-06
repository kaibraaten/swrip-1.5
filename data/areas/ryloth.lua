-- Ryloth
-- Last saved Wednesday 06-May-2020 12:59:10

AreaEntry
{
   Rooms = 
   {
      [896] = 
      {
         Exits = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         Tunnel = 0, 
         Vnum = 896, 
         Name = "Floating in a void", 
         TeleVnum = 0, 
      }, 
      [897] = 
      {
         Exits = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         Tunnel = 0, 
         Vnum = 897, 
         Name = "Floating in a void", 
         TeleVnum = 0, 
      }, 
      [898] = 
      {
         Exits = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         Tunnel = 0, 
         Vnum = 898, 
         Name = "Floating in a void", 
         TeleVnum = 0, 
      }, 
      [800] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 801, 
               Key = -1, 
               Direction = "west", 
            }, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               Code = "", 
               MudProgType = "rand_prog", 
            }, 
         }, 
         Flags = 
         {
            [4] = "CanLand", 
            [5] = "CanFly", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         Tunnel = 0, 
         Vnum = 800, 
         Name = "Kala'uun Spaceport Landing Pad", 
         TeleVnum = 0, 
      }, 
      [801] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 802, 
               Key = -1, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 800, 
               Key = -1, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 805, 
               Key = -1, 
               Direction = "west", 
            }, 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         Vnum = 801, 
         Name = "In the heart of Kala'uun Spaceport", 
         TeleVnum = 0, 
      }, 
      [802] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 804, 
               Key = -1, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 801, 
               Key = -1, 
               Direction = "south", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 803, 
               Key = -1, 
               Direction = "west", 
            }, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               Code = "", 
               MudProgType = "rand_prog", 
            }, 
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         Tunnel = 0, 
         Vnum = 802, 
         Name = "Gira'haad Cantina.", 
         TeleVnum = 0, 
      }, 
      [803] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 802, 
               Key = -1, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 804, 
               Key = -1, 
               Direction = "northeast", 
            }, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               Code = "mpechoat $n &gA Small Cock-a-Roach skitters past your boot...\
", 
               MudProgType = "rand_prog", 
            }, 
         }, 
         Flags = 
         {
            [25] = "Refinery", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "You can refine spice here.\
", 
         Tunnel = 0, 
         Vnum = 803, 
         Name = "A cramped booth", 
         TeleVnum = 0, 
      }, 
      [804] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 802, 
               Key = -1, 
               Direction = "south", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 803, 
               Key = -1, 
               Direction = "southwest", 
            }, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               Code = "mpechoat $n &gThe hustle and bustle of the bar gets a bit louder...\
", 
               MudProgType = "rand_prog", 
            }, 
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         Tunnel = 0, 
         Vnum = 804, 
         Name = "Gira'haad's Counter", 
         TeleVnum = 0, 
      }, 
      [805] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 801, 
               Key = -1, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 806, 
               Key = -1, 
               Direction = "south", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 816, 
               Key = -1, 
               Direction = "west", 
            }, 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         Vnum = 805, 
         Name = "Entrance to Kala'uun", 
         TeleVnum = 0, 
      }, 
      [806] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 805, 
               Key = -1, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 807, 
               Key = -1, 
               Direction = "southwest", 
            }, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               Code = "", 
               MudProgType = "rand_prog", 
            }, 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         Vnum = 806, 
         Name = "Nuntav'ara Street", 
         TeleVnum = 0, 
      }, 
      [807] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 815, 
               Key = -1, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 806, 
               Key = -1, 
               Direction = "northeast", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 808, 
               Key = -1, 
               Direction = "southwest", 
            }, 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         Vnum = 807, 
         Name = "Nuntav'ara Street", 
         TeleVnum = 0, 
      }, 
      [808] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 809, 
               Key = -1, 
               Direction = "south", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 810, 
               Key = -1, 
               Direction = "west", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 807, 
               Key = -1, 
               Direction = "northeast", 
            }, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               Code = "", 
               MudProgType = "rand_prog", 
            }, 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         Vnum = 808, 
         Name = "Nuntav'ara Street", 
         TeleVnum = 0, 
      }, 
      [809] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 808, 
               Key = -1, 
               Direction = "north", 
            }, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "", 
               Code = "", 
               MudProgType = "all_greet_prog", 
            }, 
            [2] = 
            {
               Arguments = "100", 
               Code = "mpechoat $n The Fat Banker snickers under his breath.\
mpechoat $n The Fat Banker says, \"Hello, there.  Just give all your credits\
to\
me.\"\
mpechoat $n The Fat Banker guffaws loudly to nobody in particular.\
", 
               MudProgType = "all_greet_prog", 
            }, 
            [3] = 
            {
               Arguments = "100", 
               Code = "mpecho &gThe clanging of exchanged credits fills the room...\
", 
               MudProgType = "rand_prog", 
            }, 
         }, 
         Flags = 
         {
            [8] = "Bank", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "The Planetary Bank is one of the few bustling offices in town.  Mainly\
because it's indoors, and offers it's residents an escape from the heat.\
There are lines 30 people long in each of the 5 teller windows, and as\
always, 8 windows are left closed. Then, you see a fat Twi'lek man wearing\
the bankers uniform stand off near a table.  You dash over to him in hopes\
that he can record your credit transactions.  Upon closer inspection, you\
notice his uniform is not quite right...\
", 
         Tunnel = 0, 
         Vnum = 809, 
         Name = "Ryloth Planetary Bank", 
         TeleVnum = 0, 
      }, 
      [810] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 811, 
               Key = -1, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 808, 
               Key = -1, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 813, 
               Key = -1, 
               Direction = "northwest", 
            }, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               Code = "", 
               MudProgType = "rand_prog", 
            }, 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         Vnum = 810, 
         Name = "Nuntav'ara Street", 
         TeleVnum = 0, 
      }, 
      [811] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 810, 
               Key = -1, 
               Direction = "south", 
            }, 
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         Tunnel = 0, 
         Vnum = 811, 
         Name = "Fal'vira Ryll Clinic", 
         TeleVnum = 0, 
      }, 
      [812] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 849, 
               Key = -1, 
               Direction = "west", 
            }, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               Code = "feel 'cure serious' $n\
mpechoat $n You feel the Ryll healing you slightly.\
", 
               MudProgType = "rand_prog", 
            }, 
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "Well, you've made it into a ryll tank.  Once you get in here, you notice\
something is clearly different from most bacta tanks. While in bacta, your\
wounds go away much faster, but here in the ryll, your pain lingers for a\
little while longer.  It certainly feels better than bacta somehow, and\
you are comforted by the fact that you won't be tasting bacta in your\
mouth for weeks to come.\
", 
         Tunnel = 1, 
         Vnum = 812, 
         Name = "Ryll Tank", 
         TeleVnum = 0, 
      }, 
      [813] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 814, 
               Key = -1, 
               Direction = "northwest", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 810, 
               Key = -1, 
               Direction = "southeast", 
            }, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               Code = "mpechoat $n &gAn unidentified rodent skitters by your feet...\
", 
               MudProgType = "rand_prog", 
            }, 
         }, 
         Flags = 
         {
            [0] = "Dark", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "DO NOT GO NORTHWEST UNLESS YOU FEEL VERY COMFORTABLE ABOUT YOUR FIGHTING\
SKILLS!!!\
", 
         Tunnel = 0, 
         Vnum = 813, 
         Name = "A Dark alley.", 
         TeleVnum = 0, 
      }, 
      [814] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 813, 
               Key = -1, 
               Direction = "southeast", 
            }, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               Code = "", 
               MudProgType = "rand_prog", 
            }, 
         }, 
         Flags = 
         {
            [0] = "Dark", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         Tunnel = 0, 
         Vnum = 814, 
         Name = "A Dead End", 
         TeleVnum = 0, 
      }, 
      [815] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 807, 
               Key = -1, 
               Direction = "west", 
            }, 
         }, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         Vnum = 815, 
         Name = "Tam'arr Food Bar.", 
         TeleVnum = 0, 
      }, 
      [816] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 805, 
               Key = -1, 
               Direction = "east", 
            }, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               Code = "", 
               MudProgType = "rand_prog", 
            }, 
            [2] = 
            {
               Arguments = "100", 
               Code = "mpechoat $n &bWater rises from the plaza fountain blasting 50 meters in the\
mpechoat $n &bair and falling back down into the tiny pool...\
", 
               MudProgType = "rand_prog", 
            }, 
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         Tunnel = 0, 
         Vnum = 816, 
         Name = "Malachu Market", 
         TeleVnum = 0, 
      }, 
      [817] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 846, 
               Key = -1, 
               Direction = "west", 
            }, 
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         Tunnel = 0, 
         Vnum = 817, 
         Name = "The Komlinks of Kookab'urra", 
         TeleVnum = 0, 
      }, 
      [818] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Flags = 
               {
                  [24] = "NoMob", 
               }, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 848, 
               Key = -1, 
               Direction = "west", 
            }, 
            [2] = 
            {
               Keyword = "spice", 
               Flags = 
               {
                  [19] = "Auto", 
                  [11] = "Hidden", 
               }, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 820, 
               Key = -1, 
               Direction = "somewhere", 
            }, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               Code = "", 
               MudProgType = "rand_prog", 
            }, 
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         Tunnel = 0, 
         Vnum = 818, 
         Name = "Power Cell Kiosk", 
         TeleVnum = 0, 
      }, 
      [819] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Flags = 
               {
                  [24] = "NoMob", 
               }, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 847, 
               Key = -1, 
               Direction = "west", 
            }, 
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         Tunnel = 0, 
         Vnum = 819, 
         Name = "Sal'mara Shields.", 
         TeleVnum = 0, 
      }, 
      [820] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 818, 
               Key = -1, 
               Direction = "southeast", 
            }, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               Code = "", 
               MudProgType = "rand_prog", 
            }, 
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         Tunnel = 0, 
         Vnum = 820, 
         Name = "A Raw Ryll Depository.", 
         TeleVnum = 0, 
      }, 
      [821] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 880, 
               Key = -1, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 881, 
               Key = -1, 
               Direction = "south", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 822, 
               Key = -1, 
               Direction = "west", 
            }, 
            [4] = 
            {
               Keyword = "pluogusnow", 
               Flags = 
               {
                  [19] = "Auto", 
                  [11] = "Hidden", 
                  [3] = "Secret", 
               }, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 32149, 
               Key = -1, 
               Direction = "somewhere", 
            }, 
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [23] = "Hotel", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "Amenities here are spare.  This hostel is strictly for getting much needed\
rest for non-twl'lek travelers, since no aliens are allowed into the\
warrens. Two rooms and one commons is provided.\
", 
         Tunnel = 0, 
         Vnum = 821, 
         Name = "Kala'uun Hostel.", 
         TeleVnum = 0, 
      }, 
      [822] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 821, 
               Key = -1, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 823, 
               Key = -1, 
               Direction = "west", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 824, 
               Key = -1, 
               Direction = "northwest", 
            }, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               Code = "", 
               MudProgType = "rand_prog", 
            }, 
         }, 
         Flags = 
         {
            [4] = "CanLand", 
            [5] = "CanFly", 
            [2] = "NoMob", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "The starport is a colossil cavern which had been hollowed out out of the\
heart of the mountain that sheltered it. Above the landing area lay level\
upon level of Twi'lek clan warrens, comprising the living quarters and\
work areas of over 100,00 Twi'leks.\
", 
         Tunnel = 0, 
         Vnum = 822, 
         Name = "Kala'uun Starport : Serin Landing Bay", 
         TeleVnum = 0, 
      }, 
      [823] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 822, 
               Key = -1, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 824, 
               Key = -1, 
               Direction = "northeast", 
            }, 
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "The starport is a colossil cavern which had been hollowed out out of the\
heart of the mountain that sheltered it. Above the landing area lay level\
upon level of Twi'lek clan warrens, comprising the living quarters and\
work areas of over 100,00 Twi'leks.    This section of the Starport is\
reserved for Twi'lek Clan ships. Mostly this consists of merchant vessels,\
but occasionally a starfighter of various kind will land here.\
", 
         Tunnel = 0, 
         Vnum = 823, 
         Name = "Kala'uun Starport : Landing Bay", 
         TeleVnum = 0, 
      }, 
      [824] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 825, 
               Key = -1, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 822, 
               Key = -1, 
               Direction = "southeast", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 823, 
               Key = -1, 
               Direction = "southwest", 
            }, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               Code = "", 
               MudProgType = "rand_prog", 
            }, 
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "The starport is a colossil cavern which had been hollowed out out of the\
heart of the mountain that sheltered it. Above the landing area lay level\
upon level of Twi'lek clan warrens, comprising the living quarters and\
work areas of over 100,00 Twi'leks. \
", 
         Tunnel = 0, 
         Vnum = 824, 
         Name = "Kala'uun Starport", 
         TeleVnum = 0, 
      }, 
      [825] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 824, 
               Key = -1, 
               Direction = "south", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 826, 
               Key = -1, 
               Direction = "up", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 854, 
               Key = -1, 
               Direction = "down", 
            }, 
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "The starport is a colossil cavern which had been hollowed out out of the\
heart of the mountain that sheltered it. Above the landing area lay level\
upon level of Twi'lek clan warrens, comprising the living quarters and\
work areas of over 100,00 Twi'leks.   The areas beyond this are private.\
Only Twi'lek clan members are allowedibeyond here. \
", 
         Tunnel = 0, 
         Vnum = 825, 
         Name = "Kala'uun Starport : Warren Entrance", 
         TeleVnum = 0, 
      }, 
      [826] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 844, 
               Key = -1, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 827, 
               Key = -1, 
               Direction = "west", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 850, 
               Key = -1, 
               Direction = "up", 
            }, 
            [4] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 825, 
               Key = -1, 
               Direction = "down", 
            }, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               Code = "", 
               MudProgType = "rand_prog", 
            }, 
            [2] = 
            {
               Arguments = "100", 
               Code = "if isimmort($n)\
else\
if race($n) == twi'lek\
else\
mpechoat $n Someone says, 'You don't belong in here!'\
mpechoat $n You run back downstairs.\
endif\
endif\
", 
               MudProgType = "entry_prog", 
            }, 
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "The stair case you climb brings you to a hallway. Hollowed out of stone,\
the hallway is lighted by glowrods attached to the ceiling. To the west\
lies the thousands of warrens where the Twi'lek clans live. To the east\
lies the shops where one can buy what one needs. \
", 
         Tunnel = 0, 
         Vnum = 826, 
         Name = "Kala'uun Starport : Warrens", 
         TeleVnum = 0, 
      }, 
      [827] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 826, 
               Key = -1, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 828, 
               Key = -1, 
               Direction = "west", 
            }, 
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "Hollowed out of stone, the hallway is lighted by glowrods attached to the\
ceiling.\
", 
         Tunnel = 0, 
         Vnum = 827, 
         Name = "Kala'uun Starport : Warrens", 
         TeleVnum = 0, 
      }, 
      [828] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 827, 
               Key = -1, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 829, 
               Key = -1, 
               Direction = "south", 
            }, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               Code = "", 
               MudProgType = "rand_prog", 
            }, 
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "Hollowed out of stone, the hallway is lighted by glowrods attached to the\
ceiling.\
", 
         Tunnel = 0, 
         Vnum = 828, 
         Name = "Kala'uun Starport : Warrens", 
         TeleVnum = 0, 
      }, 
      [829] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 828, 
               Key = -1, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 835, 
               Key = -1, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 830, 
               Key = -1, 
               Direction = "south", 
            }, 
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "Hollowed out of stone, the hallway is lighted by glowrods attached to the\
ceiling.\
", 
         Tunnel = 0, 
         Vnum = 829, 
         Name = "Kala'uun Starport : Warrens", 
         TeleVnum = 0, 
      }, 
      [830] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 829, 
               Key = -1, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 836, 
               Key = -1, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 831, 
               Key = -1, 
               Direction = "south", 
            }, 
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "Hollowed out of stone, the hallway is lighted by glowrods attached to\
the ceiling.\
", 
         Tunnel = 0, 
         Vnum = 830, 
         Name = "Kala'uun Starport : Warrens", 
         TeleVnum = 0, 
      }, 
      [831] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 830, 
               Key = -1, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 837, 
               Key = -1, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 832, 
               Key = -1, 
               Direction = "south", 
            }, 
            [4] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 842, 
               Key = -1, 
               Direction = "west", 
            }, 
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "Hollowed out of stone, the hallway is lighted by glowrods attached to the\
ceiling.\
", 
         Tunnel = 0, 
         Vnum = 831, 
         Name = "Kala'uun Starport : Warrens", 
         TeleVnum = 0, 
      }, 
      [832] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 831, 
               Key = -1, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 838, 
               Key = -1, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 833, 
               Key = -1, 
               Direction = "south", 
            }, 
            [4] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 841, 
               Key = -1, 
               Direction = "west", 
            }, 
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "Hollowed out of stone, the hallway is lighted by glowrods attached to the\
ceiling.\
", 
         Tunnel = 0, 
         Vnum = 832, 
         Name = "Kala'uun Starport : Warrens", 
         TeleVnum = 0, 
      }, 
      [833] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 832, 
               Key = -1, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 839, 
               Key = -1, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 834, 
               Key = -1, 
               Direction = "south", 
            }, 
            [4] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 840, 
               Key = -1, 
               Direction = "west", 
            }, 
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "Hollowed out of stone, the hallway is lighted by glowrods attached to the\
ceiling.\
", 
         Tunnel = 0, 
         Vnum = 833, 
         Name = "Kala'uun Starport : Warrens", 
         TeleVnum = 0, 
      }, 
      [834] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 833, 
               Key = -1, 
               Direction = "north", 
            }, 
         }, 
         Flags = 
         {
            [21] = "EmptyHome", 
            [30] = "Prototype", 
            [23] = "Hotel", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         Tunnel = 0, 
         Vnum = 834, 
         Name = "An Empty Warren", 
         TeleVnum = 0, 
      }, 
      [835] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Flags = 
               {
                  [25] = "Window", 
               }, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 822, 
               Key = -1, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 829, 
               Key = -1, 
               Direction = "west", 
            }, 
         }, 
         Flags = 
         {
            [21] = "EmptyHome", 
            [30] = "Prototype", 
            [23] = "Hotel", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         Tunnel = 0, 
         Vnum = 835, 
         Name = "An Empty Apartment", 
         TeleVnum = 0, 
      }, 
      [836] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Flags = 
               {
                  [25] = "Window", 
               }, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 822, 
               Key = -1, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 830, 
               Key = -1, 
               Direction = "west", 
            }, 
         }, 
         Flags = 
         {
            [21] = "EmptyHome", 
            [30] = "Prototype", 
            [23] = "Hotel", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         Tunnel = 0, 
         Vnum = 836, 
         Name = "An Empty Warren", 
         TeleVnum = 0, 
      }, 
      [837] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Flags = 
               {
                  [25] = "Window", 
               }, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 822, 
               Key = -1, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 831, 
               Key = -1, 
               Direction = "west", 
            }, 
         }, 
         Flags = 
         {
            [21] = "EmptyHome", 
            [30] = "Prototype", 
            [23] = "Hotel", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         Tunnel = 0, 
         Vnum = 837, 
         Name = "An Empty Apartment", 
         TeleVnum = 0, 
      }, 
      [838] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Flags = 
               {
                  [25] = "Window", 
               }, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 822, 
               Key = -1, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 832, 
               Key = -1, 
               Direction = "west", 
            }, 
         }, 
         Flags = 
         {
            [21] = "EmptyHome", 
            [30] = "Prototype", 
            [23] = "Hotel", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         Tunnel = 0, 
         Vnum = 838, 
         Name = "An Empty Warren", 
         TeleVnum = 0, 
      }, 
      [839] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Flags = 
               {
                  [25] = "Window", 
               }, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 822, 
               Key = -1, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 833, 
               Key = -1, 
               Direction = "west", 
            }, 
         }, 
         Flags = 
         {
            [21] = "EmptyHome", 
            [30] = "Prototype", 
            [23] = "Hotel", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         Tunnel = 0, 
         Vnum = 839, 
         Name = "An Empty Warren", 
         TeleVnum = 0, 
      }, 
      [840] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 833, 
               Key = -1, 
               Direction = "east", 
            }, 
         }, 
         Flags = 
         {
            [21] = "EmptyHome", 
            [30] = "Prototype", 
            [23] = "Hotel", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         Tunnel = 0, 
         Vnum = 840, 
         Name = "An Empty Warren", 
         TeleVnum = 0, 
      }, 
      [841] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 832, 
               Key = -1, 
               Direction = "east", 
            }, 
         }, 
         Flags = 
         {
            [21] = "EmptyHome", 
            [30] = "Prototype", 
            [23] = "Hotel", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         Tunnel = 0, 
         Vnum = 841, 
         Name = "An Empty Warren", 
         TeleVnum = 0, 
      }, 
      [842] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 843, 
               Key = -1, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 831, 
               Key = -1, 
               Direction = "east", 
            }, 
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         Tunnel = 0, 
         Vnum = 842, 
         Name = "Butcher", 
         TeleVnum = 0, 
      }, 
      [843] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 842, 
               Key = -1, 
               Direction = "south", 
            }, 
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         Tunnel = 0, 
         Vnum = 843, 
         Name = "Meat Locker", 
         TeleVnum = 0, 
      }, 
      [844] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 845, 
               Key = -1, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 826, 
               Key = -1, 
               Direction = "west", 
            }, 
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "Hollowed out of stone, the hallway is lighted by glowrods attached to the\
ceiling. \
", 
         Tunnel = 0, 
         Vnum = 844, 
         Name = "Kala'uun Starport : Warrens", 
         TeleVnum = 0, 
      }, 
      [845] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 846, 
               Key = -1, 
               Direction = "south", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 844, 
               Key = -1, 
               Direction = "west", 
            }, 
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "Hollowed out of stone, the hallway is lighted by glowrods attached to the\
ceiling. \
", 
         Tunnel = 0, 
         Vnum = 845, 
         Name = "Kala'uun Starport : Warrens", 
         TeleVnum = 0, 
      }, 
      [846] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 845, 
               Key = -1, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 817, 
               Key = -1, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 847, 
               Key = -1, 
               Direction = "south", 
            }, 
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "Hollowed out of stone, the hallway is lighted by glowrods attached to the\
ceiling. \
", 
         Tunnel = 0, 
         Vnum = 846, 
         Name = "Kala'uun Starport : Warrens", 
         TeleVnum = 0, 
      }, 
      [847] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 846, 
               Key = -1, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 819, 
               Key = -1, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 848, 
               Key = -1, 
               Direction = "south", 
            }, 
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "Hollowed out of stone, the hallway is lighted by glowrods attached to the\
ceiling. \
", 
         Tunnel = 0, 
         Vnum = 847, 
         Name = "Kala'uun Starport : Warrens", 
         TeleVnum = 0, 
      }, 
      [848] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 847, 
               Key = -1, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 818, 
               Key = -1, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 849, 
               Key = -1, 
               Direction = "south", 
            }, 
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "Hollowed out of stone, the hallway is lighted by glowrods attached to the\
ceiling. \
", 
         Tunnel = 0, 
         Vnum = 848, 
         Name = "Kala'uun Starport : Warrens", 
         TeleVnum = 0, 
      }, 
      [849] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 848, 
               Key = -1, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 812, 
               Key = -1, 
               Direction = "east", 
            }, 
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "Hollowed out of stone, the hallway is lighted by glowrods attached to the\
ceiling. \
", 
         Tunnel = 0, 
         Vnum = 849, 
         Name = "Kala'uun Starport : Warrens", 
         TeleVnum = 0, 
      }, 
      [850] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 851, 
               Key = -1, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 875, 
               Key = -1, 
               Direction = "up", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 826, 
               Key = -1, 
               Direction = "down", 
            }, 
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "The stair case you climb brings you to a hallway. Hollowed out of stone,\
the hallway is lighted by glowrods attached to the ceiling. Thousands of\
twi'leks move in and out of this area, where things are built and pieces\
of hardware are sold.\
", 
         Tunnel = 0, 
         Vnum = 850, 
         Name = "Kala'uun Starport : Work Area", 
         TeleVnum = 0, 
      }, 
      [851] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 852, 
               Key = -1, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 850, 
               Key = -1, 
               Direction = "south", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 853, 
               Key = -1, 
               Direction = "west", 
            }, 
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "The stair case you climb brings you to a hallway. Hollowed out of stone,\
the hallway is lighted by glowrods attached to the ceiling. Thousands of\
twi'leks move in and out of this area, where things are built and pieces\
of hardware are sold.\
", 
         Tunnel = 0, 
         Vnum = 851, 
         Name = "Kala'uun Starport : Work Area", 
         TeleVnum = 0, 
      }, 
      [852] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 879, 
               Key = -1, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 851, 
               Key = -1, 
               Direction = "west", 
            }, 
         }, 
         Flags = 
         {
            [30] = "Prototype", 
            [26] = "Factory", 
            [2] = "NoMob", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         Tunnel = 0, 
         Vnum = 852, 
         Name = "Workshop", 
         TeleVnum = 0, 
      }, 
      [853] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 851, 
               Key = -1, 
               Direction = "east", 
            }, 
         }, 
         Flags = 
         {
            [30] = "Prototype", 
            [26] = "Factory", 
            [2] = "NoMob", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         Tunnel = 0, 
         Vnum = 853, 
         Name = "Hardware", 
         TeleVnum = 0, 
      }, 
      [854] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 855, 
               Key = -1, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 825, 
               Key = -1, 
               Direction = "up", 
            }, 
         }, 
         Flags = 
         {
            [0] = "Dark", 
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         Tunnel = 0, 
         Vnum = 854, 
         Name = "A Dark Tunnel", 
         TeleVnum = 0, 
      }, 
      [855] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 856, 
               Key = -1, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 854, 
               Key = -1, 
               Direction = "south", 
            }, 
         }, 
         Flags = 
         {
            [0] = "Dark", 
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         Tunnel = 0, 
         Vnum = 855, 
         Name = "A Dark Tunnel", 
         TeleVnum = 0, 
      }, 
      [856] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 857, 
               Key = -1, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 855, 
               Key = -1, 
               Direction = "south", 
            }, 
         }, 
         Flags = 
         {
            [0] = "Dark", 
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         Tunnel = 0, 
         Vnum = 856, 
         Name = "A Dark Tunnel", 
         TeleVnum = 0, 
      }, 
      [857] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 858, 
               Key = -1, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 856, 
               Key = -1, 
               Direction = "south", 
            }, 
         }, 
         Flags = 
         {
            [0] = "Dark", 
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         Tunnel = 0, 
         Vnum = 857, 
         Name = "A Dark Tunnel", 
         TeleVnum = 0, 
      }, 
      [858] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 859, 
               Key = -1, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 857, 
               Key = -1, 
               Direction = "south", 
            }, 
         }, 
         Flags = 
         {
            [0] = "Dark", 
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         Tunnel = 0, 
         Vnum = 858, 
         Name = "A Dark Tunnel", 
         TeleVnum = 0, 
      }, 
      [859] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 858, 
               Key = -1, 
               Direction = "south", 
            }, 
            [2] = 
            {
               Keyword = "Mines", 
               Flags = 
               {
                  [19] = "Auto", 
               }, 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 860, 
               Key = -1, 
               Direction = "somewhere", 
            }, 
         }, 
         Flags = 
         {
            [0] = "Dark", 
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         Tunnel = 0, 
         Vnum = 859, 
         Name = "A Dark Tunnel", 
         TeleVnum = 0, 
      }, 
      [860] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 861, 
               Key = -1, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 859, 
               Key = -1, 
               Direction = "south", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 863, 
               Key = -1, 
               Direction = "west", 
            }, 
         }, 
         Flags = 
         {
            [0] = "Dark", 
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         Tunnel = 0, 
         Vnum = 860, 
         Name = "Ryll Mines", 
         TeleVnum = 0, 
      }, 
      [861] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 862, 
               Key = -1, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 860, 
               Key = -1, 
               Direction = "west", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 865, 
               Key = -1, 
               Direction = "down", 
            }, 
         }, 
         Flags = 
         {
            [0] = "Dark", 
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         Tunnel = 0, 
         Vnum = 861, 
         Name = "Ryll Mines", 
         TeleVnum = 0, 
      }, 
      [862] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 861, 
               Key = -1, 
               Direction = "west", 
            }, 
         }, 
         Flags = 
         {
            [0] = "Dark", 
            [25] = "Refinery", 
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         Tunnel = 0, 
         Vnum = 862, 
         Name = "Ryll Mines", 
         TeleVnum = 0, 
      }, 
      [863] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 860, 
               Key = -1, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 864, 
               Key = -1, 
               Direction = "west", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 867, 
               Key = -1, 
               Direction = "down", 
            }, 
         }, 
         Flags = 
         {
            [0] = "Dark", 
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         Tunnel = 0, 
         Vnum = 863, 
         Name = "Ryll Mines", 
         TeleVnum = 0, 
      }, 
      [864] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 863, 
               Key = -1, 
               Direction = "east", 
            }, 
         }, 
         Flags = 
         {
            [0] = "Dark", 
            [25] = "Refinery", 
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         Tunnel = 0, 
         Vnum = 864, 
         Name = "Ryll Mines", 
         TeleVnum = 0, 
      }, 
      [865] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 866, 
               Key = -1, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 861, 
               Key = -1, 
               Direction = "up", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 872, 
               Key = -1, 
               Direction = "down", 
            }, 
         }, 
         Flags = 
         {
            [0] = "Dark", 
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         Tunnel = 0, 
         Vnum = 865, 
         Name = "Ryll Mines", 
         TeleVnum = 0, 
      }, 
      [866] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 865, 
               Key = -1, 
               Direction = "west", 
            }, 
         }, 
         Flags = 
         {
            [0] = "Dark", 
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         Tunnel = 0, 
         Vnum = 866, 
         Name = "Ryll Mines", 
         TeleVnum = 0, 
      }, 
      [867] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 868, 
               Key = -1, 
               Direction = "west", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 863, 
               Key = -1, 
               Direction = "up", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 870, 
               Key = -1, 
               Direction = "down", 
            }, 
         }, 
         Flags = 
         {
            [0] = "Dark", 
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         Tunnel = 0, 
         Vnum = 867, 
         Name = "Ryll Mines", 
         TeleVnum = 0, 
      }, 
      [868] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 867, 
               Key = -1, 
               Direction = "east", 
            }, 
         }, 
         Flags = 
         {
            [0] = "Dark", 
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         Tunnel = 0, 
         Vnum = 868, 
         Name = "Ryll Mines", 
         TeleVnum = 0, 
      }, 
      [869] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 870, 
               Key = -1, 
               Direction = "east", 
            }, 
         }, 
         Flags = 
         {
            [0] = "Dark", 
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         Tunnel = 0, 
         Vnum = 869, 
         Name = "Ryll Mines", 
         TeleVnum = 0, 
      }, 
      [870] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 871, 
               Key = -1, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 869, 
               Key = -1, 
               Direction = "west", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 867, 
               Key = -1, 
               Direction = "up", 
            }, 
         }, 
         Flags = 
         {
            [0] = "Dark", 
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         Tunnel = 0, 
         Vnum = 870, 
         Name = "Ryll Mines", 
         TeleVnum = 0, 
      }, 
      [871] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 872, 
               Key = -1, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 870, 
               Key = -1, 
               Direction = "west", 
            }, 
         }, 
         Flags = 
         {
            [0] = "Dark", 
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         Tunnel = 0, 
         Vnum = 871, 
         Name = "Ryll Mines", 
         TeleVnum = 0, 
      }, 
      [872] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 873, 
               Key = -1, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 871, 
               Key = -1, 
               Direction = "west", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 865, 
               Key = -1, 
               Direction = "up", 
            }, 
         }, 
         Flags = 
         {
            [0] = "Dark", 
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         Tunnel = 0, 
         Vnum = 872, 
         Name = "Ryll Mines", 
         TeleVnum = 0, 
      }, 
      [873] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 872, 
               Key = -1, 
               Direction = "west", 
            }, 
         }, 
         Flags = 
         {
            [0] = "Dark", 
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         Tunnel = 0, 
         Vnum = 873, 
         Name = "Ryll Mines", 
         TeleVnum = 0, 
      }, 
      [874] = 
      {
         Exits = 
         {
         }, 
         Flags = 
         {
            [0] = "Dark", 
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         Tunnel = 0, 
         Vnum = 874, 
         Name = "Floating in a void", 
         TeleVnum = 0, 
      }, 
      [875] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 876, 
               Key = -1, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 850, 
               Key = -1, 
               Direction = "down", 
            }, 
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "The stair case you climb brings you to a hallway. Hollowed out of stone,\
the hallway is lighted by glowrods attached to the ceiling. Twi'leks come\
here to train before going out into the world. \
", 
         Tunnel = 0, 
         Vnum = 875, 
         Name = "Kala'uun Starport : Academy", 
         TeleVnum = 0, 
      }, 
      [876] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 878, 
               Key = -1, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 875, 
               Key = -1, 
               Direction = "south", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 877, 
               Key = -1, 
               Direction = "west", 
            }, 
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "The stair case you climb brings you to a hallway. Hollowed out of stone,\
the hallway is lighted by glowrods attached to the ceiling. Twi'leks come\
here to train before going out into the world. \
", 
         Tunnel = 0, 
         Vnum = 876, 
         Name = "Kala'uun Starport : Academy", 
         TeleVnum = 0, 
      }, 
      [877] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 876, 
               Key = -1, 
               Direction = "east", 
            }, 
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         Tunnel = 0, 
         Vnum = 877, 
         Name = "Kala'uun Starport : Academy Training", 
         TeleVnum = 0, 
      }, 
      [878] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 876, 
               Key = -1, 
               Direction = "west", 
            }, 
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         Tunnel = 0, 
         Vnum = 878, 
         Name = "Kala'uun Starport : Combat Skills", 
         TeleVnum = 0, 
      }, 
      [879] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 852, 
               Key = -1, 
               Direction = "west", 
            }, 
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         Tunnel = 0, 
         Vnum = 879, 
         Name = "Compactor", 
         TeleVnum = 0, 
      }, 
      [880] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 882, 
               Key = -1, 
               Direction = "south", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 821, 
               Key = -1, 
               Direction = "west", 
            }, 
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "The hostel commons is simply an area where travelers can get food and drink\
for cheap prices. It is small and crowded with tables.  A fireplace sits\
near the bar, and a bartender waits on your order. \
", 
         Tunnel = 0, 
         Vnum = 880, 
         Name = "Hostel Commons", 
         TeleVnum = 0, 
      }, 
      [881] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 821, 
               Key = -1, 
               Direction = "north", 
            }, 
         }, 
         Flags = 
         {
            [30] = "Prototype", 
            [2] = "NoMob", 
            [23] = "Hotel", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "Small and cramped, the room will fit a family of 4 in 2 beds, with little\
space to spare.\
", 
         Tunnel = 0, 
         Vnum = 881, 
         Name = "Hostel Room", 
         TeleVnum = 0, 
      }, 
      [882] = 
      {
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               DestinationVnum = 880, 
               Key = -1, 
               Direction = "north", 
            }, 
         }, 
         Flags = 
         {
            [30] = "Prototype", 
            [2] = "NoMob", 
            [23] = "Hotel", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "Small and cramped, the room will fit a family of 4 in 2 beds, with little\
space to spare. \
", 
         Tunnel = 0, 
         Vnum = 882, 
         Name = "Hostel Room", 
         TeleVnum = 0, 
      }, 
      [883] = 
      {
         Exits = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         Tunnel = 0, 
         Vnum = 883, 
         Name = "Floating in a void", 
         TeleVnum = 0, 
      }, 
      [884] = 
      {
         Exits = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         Tunnel = 0, 
         Vnum = 884, 
         Name = "Floating in a void", 
         TeleVnum = 0, 
      }, 
      [885] = 
      {
         Exits = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         Tunnel = 0, 
         Vnum = 885, 
         Name = "Floating in a void", 
         TeleVnum = 0, 
      }, 
      [886] = 
      {
         Exits = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         Tunnel = 0, 
         Vnum = 886, 
         Name = "Floating in a void", 
         TeleVnum = 0, 
      }, 
      [887] = 
      {
         Exits = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         Tunnel = 0, 
         Vnum = 887, 
         Name = "Floating in a void", 
         TeleVnum = 0, 
      }, 
      [888] = 
      {
         Exits = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         Tunnel = 0, 
         Vnum = 888, 
         Name = "Floating in a void", 
         TeleVnum = 0, 
      }, 
      [889] = 
      {
         Exits = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         Tunnel = 0, 
         Vnum = 889, 
         Name = "Floating in a void", 
         TeleVnum = 0, 
      }, 
      [890] = 
      {
         Exits = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         Tunnel = 0, 
         Vnum = 890, 
         Name = "Floating in a void", 
         TeleVnum = 0, 
      }, 
      [891] = 
      {
         Exits = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         Tunnel = 0, 
         Vnum = 891, 
         Name = "Floating in a void", 
         TeleVnum = 0, 
      }, 
      [892] = 
      {
         Exits = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         Tunnel = 0, 
         Vnum = 892, 
         Name = "Floating in a void", 
         TeleVnum = 0, 
      }, 
      [893] = 
      {
         Exits = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         Tunnel = 0, 
         Vnum = 893, 
         Name = "Floating in a void", 
         TeleVnum = 0, 
      }, 
      [894] = 
      {
         Exits = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         Tunnel = 0, 
         Vnum = 894, 
         Name = "Floating in a void", 
         TeleVnum = 0, 
      }, 
      [895] = 
      {
         Exits = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Sector = "city", 
         Description = "", 
         Tunnel = 0, 
         Vnum = 895, 
         Name = "Floating in a void", 
         TeleVnum = 0, 
      }, 
   }, 
   Resets = 
   {
      [1] = 
      {
         Command = "M", 
         Arg1 = 891, 
         Arg3 = 801, 
         MiscData = 1, 
         Arg2 = 5, 
      }, 
      [2] = 
      {
         Command = "M", 
         Arg1 = 890, 
         Arg3 = 808, 
         MiscData = 1, 
         Arg2 = 3, 
      }, 
      [3] = 
      {
         Command = "M", 
         Arg1 = 893, 
         Arg3 = 808, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [4] = 
      {
         Command = "M", 
         Arg1 = 898, 
         Arg3 = 809, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [5] = 
      {
         Command = "M", 
         Arg1 = 890, 
         Arg3 = 813, 
         MiscData = 1, 
         Arg2 = 3, 
      }, 
      [6] = 
      {
         Command = "M", 
         Arg1 = 894, 
         Arg3 = 814, 
         MiscData = 1, 
         Arg2 = 2, 
      }, 
      [7] = 
      {
         Command = "M", 
         Arg1 = 894, 
         Arg3 = 814, 
         MiscData = 1, 
         Arg2 = 2, 
      }, 
      [8] = 
      {
         Arg1 = 32230, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [9] = 
      {
         Command = "M", 
         Arg1 = 895, 
         Arg3 = 815, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [10] = 
      {
         Arg1 = 302, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [11] = 
      {
         Command = "M", 
         Arg1 = 890, 
         Arg3 = 815, 
         MiscData = 1, 
         Arg2 = 3, 
      }, 
      [12] = 
      {
         Command = "O", 
         Arg1 = 32259, 
         Arg3 = 816, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [13] = 
      {
         Command = "O", 
         Arg1 = 326, 
         Arg3 = 820, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [14] = 
      {
         Command = "O", 
         Arg1 = 90, 
         Arg3 = 805, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [15] = 
      {
         Command = "M", 
         Arg1 = 800, 
         Arg3 = 864, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [16] = 
      {
         Arg1 = 326, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [17] = 
      {
         Command = "O", 
         Arg1 = 880, 
         Arg3 = 864, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [18] = 
      {
         Command = "M", 
         Arg1 = 800, 
         Arg3 = 862, 
         MiscData = 1, 
         Arg2 = 2, 
      }, 
      [19] = 
      {
         Arg1 = 326, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [20] = 
      {
         Command = "O", 
         Arg1 = 880, 
         Arg3 = 862, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [21] = 
      {
         Command = "O", 
         Arg1 = 326, 
         Arg3 = 873, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [22] = 
      {
         Command = "O", 
         Arg1 = 326, 
         Arg3 = 872, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [23] = 
      {
         Command = "O", 
         Arg1 = 326, 
         Arg3 = 871, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [24] = 
      {
         Command = "O", 
         Arg1 = 326, 
         Arg3 = 869, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [25] = 
      {
         Command = "O", 
         Arg1 = 326, 
         Arg3 = 870, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [26] = 
      {
         Command = "M", 
         Arg1 = 801, 
         Arg3 = 853, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [27] = 
      {
         Arg1 = 32210, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [28] = 
      {
         Arg1 = 32234, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [29] = 
      {
         Arg1 = 10494, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [30] = 
      {
         Arg1 = 324, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [31] = 
      {
         Arg1 = 10497, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [32] = 
      {
         Command = "M", 
         Arg1 = 802, 
         Arg3 = 877, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [33] = 
      {
         Command = "M", 
         Arg1 = 10509, 
         Arg3 = 878, 
         MiscData = 1, 
         Arg2 = 3, 
      }, 
      [34] = 
      {
         Command = "M", 
         Arg1 = 803, 
         Arg3 = 879, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [35] = 
      {
         Command = "M", 
         Arg1 = 899, 
         Arg3 = 880, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [36] = 
      {
         Arg1 = 3, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [37] = 
      {
         Command = "M", 
         Arg1 = 895, 
         Arg3 = 842, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [38] = 
      {
         Arg1 = 302, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [39] = 
      {
         Command = "M", 
         Arg1 = 889, 
         Arg3 = 818, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [40] = 
      {
         Arg1 = 900, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [41] = 
      {
         Arg1 = 32234, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [42] = 
      {
         Command = "M", 
         Arg1 = 892, 
         Arg3 = 817, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [43] = 
      {
         Arg1 = 32229, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [44] = 
      {
         Arg1 = 10424, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [45] = 
      {
         Command = "M", 
         Arg1 = 822, 
         Arg3 = 822, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [46] = 
      {
         Command = "M", 
         Arg1 = 891, 
         Arg3 = 821, 
         MiscData = 1, 
         Arg2 = 11, 
      }, 
      [47] = 
      {
         Command = "M", 
         Arg1 = 891, 
         Arg3 = 821, 
         MiscData = 1, 
         Arg2 = 11, 
      }, 
      [48] = 
      {
         Command = "M", 
         Arg1 = 891, 
         Arg3 = 821, 
         MiscData = 1, 
         Arg2 = 11, 
      }, 
      [49] = 
      {
         Command = "M", 
         Arg1 = 891, 
         Arg3 = 821, 
         MiscData = 1, 
         Arg2 = 11, 
      }, 
      [50] = 
      {
         Command = "M", 
         Arg1 = 891, 
         Arg3 = 821, 
         MiscData = 1, 
         Arg2 = 11, 
      }, 
      [51] = 
      {
         Command = "M", 
         Arg1 = 891, 
         Arg3 = 821, 
         MiscData = 1, 
         Arg2 = 11, 
      }, 
      [52] = 
      {
         Command = "M", 
         Arg1 = 891, 
         Arg3 = 824, 
         MiscData = 1, 
         Arg2 = 18, 
      }, 
      [53] = 
      {
         Command = "M", 
         Arg1 = 891, 
         Arg3 = 824, 
         MiscData = 1, 
         Arg2 = 18, 
      }, 
      [54] = 
      {
         Command = "M", 
         Arg1 = 891, 
         Arg3 = 824, 
         MiscData = 1, 
         Arg2 = 18, 
      }, 
      [55] = 
      {
         Command = "M", 
         Arg1 = 891, 
         Arg3 = 824, 
         MiscData = 1, 
         Arg2 = 18, 
      }, 
      [56] = 
      {
         Command = "M", 
         Arg1 = 891, 
         Arg3 = 824, 
         MiscData = 1, 
         Arg2 = 18, 
      }, 
      [57] = 
      {
         Command = "M", 
         Arg1 = 891, 
         Arg3 = 824, 
         MiscData = 1, 
         Arg2 = 18, 
      }, 
      [58] = 
      {
         Command = "M", 
         Arg1 = 891, 
         Arg3 = 824, 
         MiscData = 1, 
         Arg2 = 18, 
      }, 
      [59] = 
      {
         Command = "M", 
         Arg1 = 891, 
         Arg3 = 823, 
         MiscData = 1, 
         Arg2 = 26, 
      }, 
      [60] = 
      {
         Command = "M", 
         Arg1 = 891, 
         Arg3 = 823, 
         MiscData = 1, 
         Arg2 = 26, 
      }, 
      [61] = 
      {
         Command = "M", 
         Arg1 = 891, 
         Arg3 = 823, 
         MiscData = 1, 
         Arg2 = 26, 
      }, 
      [62] = 
      {
         Command = "M", 
         Arg1 = 891, 
         Arg3 = 823, 
         MiscData = 1, 
         Arg2 = 26, 
      }, 
      [63] = 
      {
         Command = "M", 
         Arg1 = 891, 
         Arg3 = 823, 
         MiscData = 1, 
         Arg2 = 26, 
      }, 
      [64] = 
      {
         Command = "M", 
         Arg1 = 891, 
         Arg3 = 823, 
         MiscData = 1, 
         Arg2 = 26, 
      }, 
      [65] = 
      {
         Command = "M", 
         Arg1 = 891, 
         Arg3 = 823, 
         MiscData = 1, 
         Arg2 = 26, 
      }, 
      [66] = 
      {
         Command = "M", 
         Arg1 = 891, 
         Arg3 = 823, 
         MiscData = 1, 
         Arg2 = 26, 
      }, 
      [67] = 
      {
         Command = "M", 
         Arg1 = 891, 
         Arg3 = 825, 
         MiscData = 1, 
         Arg2 = 34, 
      }, 
      [68] = 
      {
         Command = "M", 
         Arg1 = 891, 
         Arg3 = 825, 
         MiscData = 1, 
         Arg2 = 34, 
      }, 
      [69] = 
      {
         Command = "M", 
         Arg1 = 891, 
         Arg3 = 825, 
         MiscData = 1, 
         Arg2 = 34, 
      }, 
      [70] = 
      {
         Command = "M", 
         Arg1 = 891, 
         Arg3 = 825, 
         MiscData = 1, 
         Arg2 = 34, 
      }, 
      [71] = 
      {
         Command = "M", 
         Arg1 = 891, 
         Arg3 = 825, 
         MiscData = 1, 
         Arg2 = 34, 
      }, 
      [72] = 
      {
         Command = "M", 
         Arg1 = 891, 
         Arg3 = 825, 
         MiscData = 1, 
         Arg2 = 34, 
      }, 
      [73] = 
      {
         Command = "M", 
         Arg1 = 891, 
         Arg3 = 825, 
         MiscData = 1, 
         Arg2 = 34, 
      }, 
      [74] = 
      {
         Command = "M", 
         Arg1 = 891, 
         Arg3 = 825, 
         MiscData = 1, 
         Arg2 = 34, 
      }, 
      [75] = 
      {
         Command = "M", 
         Arg1 = 891, 
         Arg3 = 826, 
         MiscData = 1, 
         Arg2 = 37, 
      }, 
      [76] = 
      {
         Command = "M", 
         Arg1 = 891, 
         Arg3 = 826, 
         MiscData = 1, 
         Arg2 = 37, 
      }, 
      [77] = 
      {
         Command = "M", 
         Arg1 = 891, 
         Arg3 = 826, 
         MiscData = 1, 
         Arg2 = 37, 
      }, 
      [78] = 
      {
         Command = "M", 
         Arg1 = 891, 
         Arg3 = 845, 
         MiscData = 1, 
         Arg2 = 41, 
      }, 
      [79] = 
      {
         Command = "M", 
         Arg1 = 891, 
         Arg3 = 845, 
         MiscData = 1, 
         Arg2 = 41, 
      }, 
      [80] = 
      {
         Command = "M", 
         Arg1 = 891, 
         Arg3 = 845, 
         MiscData = 1, 
         Arg2 = 41, 
      }, 
      [81] = 
      {
         Command = "M", 
         Arg1 = 891, 
         Arg3 = 845, 
         MiscData = 1, 
         Arg2 = 41, 
      }, 
      [82] = 
      {
         Command = "M", 
         Arg1 = 891, 
         Arg3 = 828, 
         MiscData = 1, 
         Arg2 = 45, 
      }, 
      [83] = 
      {
         Command = "M", 
         Arg1 = 891, 
         Arg3 = 828, 
         MiscData = 1, 
         Arg2 = 45, 
      }, 
      [84] = 
      {
         Command = "M", 
         Arg1 = 891, 
         Arg3 = 828, 
         MiscData = 1, 
         Arg2 = 45, 
      }, 
      [85] = 
      {
         Command = "M", 
         Arg1 = 891, 
         Arg3 = 828, 
         MiscData = 1, 
         Arg2 = 45, 
      }, 
      [86] = 
      {
         Command = "M", 
         Arg1 = 893, 
         Arg3 = 819, 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
   }, 
   FileFormatVersion = 1, 
   Mobiles = 
   {
      [800] = 
      {
         NumberOfAttacks = 0, 
         Stats = 
         {
            Wisdom = 10, 
            Intelligence = 10, 
            Luck = 10, 
            Charisma = 10, 
            Force = 0, 
            Strength = 10, 
            Constitution = 10, 
            Dexterity = 10, 
         }, 
         Race = "Twi'lek", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         Credits = 0, 
         Name = "twi'lek", 
         Vnum = 800, 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
               [2] = "twileki", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [2] = "twileki", 
            }, 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         Alignment = 0, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         HitChance = 
         {
            HitPlus = 1050, 
            HitNoDice = 21, 
            HitSizeDice = 10, 
         }, 
         DamRoll = 21, 
         Damage = 
         {
            DamNoDice = 10, 
            DamPlus = 2, 
            DamSizeDice = 4, 
         }, 
         AffectedBy = 
         {
            [9] = "Infrared", 
         }, 
         Weight = 0, 
         DefaultPosition = "standing", 
         ArmorClass = -160, 
         Sex = "undistinguished", 
         Height = 0, 
         Position = "standing", 
         Level = 104, 
         HitRoll = 23, 
         LongDescr = "A twi'lek works hard refining ryll here.\
", 
         ShortDescr = "a twi'lek", 
         Description = "", 
      }, 
      [801] = 
      {
         NumberOfAttacks = 0, 
         Stats = 
         {
            Wisdom = 10, 
            Intelligence = 10, 
            Luck = 10, 
            Charisma = 10, 
            Force = 0, 
            Strength = 10, 
            Constitution = 10, 
            Dexterity = 10, 
         }, 
         Race = "Twi'lek", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [30] = "Prototype", 
         }, 
         Credits = 0, 
         Name = "twi'lek", 
         Vnum = 801, 
         Shop = 
         {
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            ProfitSell = 90, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            ProfitBuy = 120, 
            KeeperShortDescr = "a twi'lek", 
            KeeperVnum = 801, 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [2] = "twileki", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [2] = "twileki", 
            }, 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         Alignment = 0, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         HitChance = 
         {
            HitPlus = 1050, 
            HitNoDice = 21, 
            HitSizeDice = 10, 
         }, 
         DamRoll = 0, 
         Damage = 
         {
            DamNoDice = 10, 
            DamPlus = 2, 
            DamSizeDice = 4, 
         }, 
         AffectedBy = 
         {
            [9] = "Infrared", 
         }, 
         Weight = 0, 
         DefaultPosition = "standing", 
         ArmorClass = -160, 
         Sex = "undistinguished", 
         Height = 0, 
         Position = "standing", 
         Level = 104, 
         HitRoll = 0, 
         LongDescr = "A twi'lek sells hardware equipment while he works.\
", 
         ShortDescr = "a twi'lek", 
         Description = "", 
      }, 
      [802] = 
      {
         NumberOfAttacks = 0, 
         Stats = 
         {
            Wisdom = 25, 
            Intelligence = 25, 
            Luck = 10, 
            Charisma = 25, 
            Force = 0, 
            Strength = 25, 
            Constitution = 25, 
            Dexterity = 25, 
         }, 
         Race = "Twi'lek", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [9] = "Train", 
            [30] = "Prototype", 
         }, 
         Credits = 0, 
         Name = "a twi'lek stat trainer", 
         Vnum = 802, 
         Languages = 
         {
            Speaking = 
            {
               [2] = "twileki", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [2] = "twileki", 
            }, 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         Alignment = 0, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         HitChance = 
         {
            HitPlus = 1050, 
            HitNoDice = 21, 
            HitSizeDice = 10, 
         }, 
         DamRoll = 0, 
         Damage = 
         {
            DamNoDice = 10, 
            DamPlus = 2, 
            DamSizeDice = 4, 
         }, 
         AffectedBy = 
         {
            [9] = "Infrared", 
         }, 
         Weight = 0, 
         DefaultPosition = "standing", 
         ArmorClass = -160, 
         Sex = "undistinguished", 
         Height = 0, 
         Position = "standing", 
         Level = 104, 
         HitRoll = 0, 
         LongDescr = "A twi'lek is here to help develop your abilities\
", 
         ShortDescr = "a twi'lek", 
         Description = "", 
      }, 
      [803] = 
      {
         NumberOfAttacks = 0, 
         Stats = 
         {
            Wisdom = 10, 
            Intelligence = 10, 
            Luck = 10, 
            Charisma = 10, 
            Force = 0, 
            Strength = 10, 
            Constitution = 10, 
            Dexterity = 10, 
         }, 
         Race = "Twi'lek", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         Credits = 0, 
         Name = "a twilek janitor", 
         Vnum = 803, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "compact", 
               Code = "mpecho The Janitor ushers you out as the walls begin to close\
mppurge\
mpecho You are allowed back in after the cycle is complete. \
", 
               MudProgType = "speech_prog", 
            }, 
            [2] = 
            {
               Arguments = "25", 
               Code = "mpecho The janitor ushers you out as the walls begin to close.\
mppurge\
mpecho You are allowed back in after the cycle is complete.\
", 
               MudProgType = "rand_prog", 
            }, 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [2] = "twileki", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [2] = "twileki", 
            }, 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         Alignment = 0, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         HitChance = 
         {
            HitPlus = 1050, 
            HitNoDice = 21, 
            HitSizeDice = 10, 
         }, 
         DamRoll = 0, 
         Damage = 
         {
            DamNoDice = 10, 
            DamPlus = 2, 
            DamSizeDice = 4, 
         }, 
         AffectedBy = 
         {
            [9] = "Infrared", 
         }, 
         Weight = 0, 
         DefaultPosition = "standing", 
         ArmorClass = -160, 
         Sex = "undistinguished", 
         Height = 0, 
         Position = "standing", 
         Level = 104, 
         HitRoll = 0, 
         LongDescr = "A twi'lek goes through the trash, preparing for compaction.\
", 
         ShortDescr = "a twi'lek", 
         Description = "", 
      }, 
      [899] = 
      {
         NumberOfAttacks = 0, 
         Stats = 
         {
            Wisdom = 10, 
            Intelligence = 10, 
            Luck = 10, 
            Charisma = 10, 
            Force = 0, 
            Strength = 10, 
            Constitution = 10, 
            Dexterity = 10, 
         }, 
         Race = "Twi'lek", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [30] = "Prototype", 
         }, 
         Credits = 0, 
         Name = "Gira'haad", 
         Vnum = 899, 
         Shop = 
         {
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            ProfitSell = 50, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "spice", 
            }, 
            ProfitBuy = 120, 
            KeeperShortDescr = "Gira'haad the Bartender", 
            KeeperVnum = 899, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "50", 
               Code = "say ooh, thanks Honey.  Here...\
,reaches down under the counter and rises with a stim of ryll.\
mpoload 32230\
give ryll to $n\
say This'll make you feel real good!\
cackle\
", 
               MudProgType = "bribe_prog", 
            }, 
            [2] = 
            {
               Arguments = "Hi hello hey sup konichiwa shalom aloha hola", 
               Code = ",looks up from the counter.\
say Hello there, $n.  Can I get you something?  Some alcohol perhaps?\
mpechoat $n Is that Ryll in her cloak pocket?\
", 
               MudProgType = "speech_prog", 
            }, 
            [3] = 
            {
               Arguments = "gives", 
               Code = "if ovnuminv(2100) >= 1\
'Ah, my special Ry...um, Ale.\
giggle\
mpwithdraw 5000\
give 5000 credits $n\
mpgain $n 5 100000\
mpat 10299 drop all\
mpat 10299 mppurge\
mpechoat $n &gThe Bitch forgot to pay you!\
endif\
", 
               MudProgType = "act_prog", 
            }, 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
               [2] = "twileki", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [2] = "twileki", 
            }, 
         }, 
         Alignment = 0, 
         SaveVs = 
         {
            Breath = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         HitChance = 
         {
            HitPlus = 700, 
            HitNoDice = 14, 
            HitSizeDice = 10, 
         }, 
         Immune = 
         {
            [20] = "magic", 
            [11] = "charm", 
         }, 
         DamRoll = 14, 
         Damage = 
         {
            DamNoDice = 7, 
            DamPlus = 2, 
            DamSizeDice = 4, 
         }, 
         Weight = 0, 
         Sex = "female", 
         ArmorClass = -75, 
         DefaultPosition = "standing", 
         Height = 0, 
         Position = "standing", 
         Level = 70, 
         HitRoll = 14, 
         LongDescr = "Gira'haad waits to take your order.\
", 
         Description = "Gira'haad is a weathered Twi'lek female.  You can tell she has been running\
this cantina for a long time and is fed up with the everyday scum that\
comes here. What keeps that lovely smile on her face?\
", 
         ShortDescr = "Gira'haad the Bartender", 
      }, 
      [898] = 
      {
         NumberOfAttacks = 0, 
         Stats = 
         {
            Wisdom = 10, 
            Intelligence = 10, 
            Luck = 10, 
            Charisma = 10, 
            Force = 0, 
            Strength = 10, 
            Constitution = 10, 
            Dexterity = 10, 
         }, 
         Race = "Human", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Credits = 0, 
         VipFlags = 
         {
            [2] = "Ryloth", 
         }, 
         Name = "A Fat Twi'lek Banker", 
         Vnum = 898, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "1", 
               Code = "snicker\
say Thanks, Bud.  Your credits are mine now.\
muha\
", 
               MudProgType = "bribe_prog", 
            }, 
            [2] = 
            {
               Arguments = "hi hello sup aloha konichiwa shalom hola bonjour utini", 
               Code = "say Oh, hello there. \
,peers around nervously.\
evilgrin\
say Care to make a little transaction?\
cough\
", 
               MudProgType = "speech_prog", 
            }, 
            [3] = 
            {
               Arguments = "ryll spice", 
               Code = "grin\
sat Yes, Ryll is grown here.  I never take it.  I have enough to worry\
about.\
mutter\
", 
               MudProgType = "speech_prog", 
            }, 
            [4] = 
            {
               Arguments = "100", 
               Code = "chuckle\
'Hello there.  You got credits?  Give them\
mpecho &Chere'&c\
grin\
", 
               MudProgType = "all_greet_prog", 
            }, 
         }, 
         Alignment = -500, 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
               [2] = "twileki", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [2] = "twileki", 
            }, 
         }, 
         HitChance = 
         {
            HitPlus = 0, 
            HitNoDice = 0, 
            HitSizeDice = 0, 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         DamRoll = 10, 
         Damage = 
         {
            DamNoDice = 0, 
            DamPlus = 0, 
            DamSizeDice = 0, 
         }, 
         Weight = 0, 
         Sex = "male", 
         ArmorClass = 0, 
         DefaultPosition = "standing", 
         Height = 0, 
         Position = "standing", 
         Level = 1, 
         HitRoll = 10, 
         LongDescr = "A Fat Twi'lek Banker is here smelling credits.\
", 
         Description = "", 
         ShortDescr = "A Twi'lek Banker", 
      }, 
      [822] = 
      {
         NumberOfAttacks = 0, 
         Stats = 
         {
            Wisdom = 10, 
            Intelligence = 10, 
            Luck = 10, 
            Charisma = 10, 
            Force = 0, 
            Strength = 20, 
            Constitution = 10, 
            Dexterity = 10, 
         }, 
         Race = "Human", 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         Credits = 0, 
         Name = "Koh'shak, starport master", 
         Vnum = 822, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "gives", 
               Code = "if ovnuminv(881) >= 1 \
say So! That little thief has finally gotten around to paying me! \
say It must have been that bounty hunter I sent after him.\
mpwithdraw 5000\
give 5000 credits $n\
drop 5000 credits\
mpgain $n 5 100000 \
mpat 10299 drop all \
mpat 10299 mppurge \
say There. I must go call off the bounty I set on him. \
mpecho Koh'shak walks a little ways off and gets out his comlink. \
endif \
if ovnuminv(24611) == 1\
smile $n\
say My customer was wondering if you would get\
these.\
say Good job!\
mpwithdraw 250000\
give 250000 credits $n\
drop 250000 credits\
endif\
mpat 10299 drop all\
mpat 10299 mppurge\
", 
               MudProgType = "act_prog", 
            }, 
            [2] = 
            {
               Arguments = "p queen", 
               Code = "say I had an odd customer in here the other day.\
emote shakes her head.\
say They asked if I could acquire the queens jewels.\
emote blinks.\
say You're not going to believe which queen.\
say The Queen Mother of Hapes! Ha!\
say I'd pay anyone who got them enormously though.\
", 
               MudProgType = "speech_prog", 
            }, 
         }, 
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
         HitChance = 
         {
            HitPlus = 950, 
            HitNoDice = 19, 
            HitSizeDice = 10, 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         DamRoll = 20, 
         Damage = 
         {
            DamNoDice = 9, 
            DamPlus = 2, 
            DamSizeDice = 4, 
         }, 
         Weight = 0, 
         Sex = "undistinguished", 
         ArmorClass = -137, 
         DefaultPosition = "standing", 
         Height = 0, 
         Position = "standing", 
         Level = 95, 
         HitRoll = 20, 
         LongDescr = "Koh'shak, starport master\
", 
         Description = "", 
         ShortDescr = "Koh'shak", 
      }, 
      [897] = 
      {
         NumberOfAttacks = 0, 
         Stats = 
         {
            Wisdom = 10, 
            Intelligence = 10, 
            Luck = 10, 
            Charisma = 10, 
            Force = 0, 
            Strength = 10, 
            Constitution = 10, 
            Dexterity = 10, 
         }, 
         Race = "Human", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Credits = 0, 
         Name = "Faro the Triad Armor Guy", 
         Vnum = 897, 
         RepairShop = 
         {
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            ShopType = 1, 
            ProfitFix = 50, 
            FixTypes = 
            {
               [1] = "weapon", 
               [2] = "none", 
               [0] = "armor", 
            }, 
            KeeperShortDescr = "Triad Armor Repairman", 
            KeeperVnum = 897, 
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
         Alignment = 0, 
         SaveVs = 
         {
            Breath = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         HitChance = 
         {
            HitPlus = 750, 
            HitNoDice = 15, 
            HitSizeDice = 10, 
         }, 
         Immune = 
         {
            [11] = "charm", 
         }, 
         DamRoll = 15, 
         Damage = 
         {
            DamNoDice = 7, 
            DamPlus = 2, 
            DamSizeDice = 4, 
         }, 
         Weight = 0, 
         Sex = "male", 
         ArmorClass = -87, 
         DefaultPosition = "standing", 
         Height = 0, 
         Position = "standing", 
         Level = 75, 
         HitRoll = 15, 
         LongDescr = "Faro, the Triad Armorer is fixing armor for members\
", 
         Description = "", 
         ShortDescr = "Triad Armor Repairman", 
      }, 
      [896] = 
      {
         NumberOfAttacks = 0, 
         Stats = 
         {
            Wisdom = 10, 
            Intelligence = 10, 
            Luck = 10, 
            Charisma = 10, 
            Force = 0, 
            Strength = 10, 
            Constitution = 10, 
            Dexterity = 10, 
         }, 
         Race = "Twi'lek", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Credits = 0, 
         Name = "Fal'vira is renting out RYLL tanks??", 
         Vnum = 896, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               Code = "smile $n\
'Welcome.  Are you wounded?\
exam $n\
'Come relax in my Ryll tank.  Only 100 credits.\
comfort $n\
", 
               MudProgType = "all_greet_prog", 
            }, 
            [2] = 
            {
               Arguments = "100", 
               Code = "'Oh dear, you are hurt, aren't you?  Well, we'll have you fixed up.\
smile\
,gestures downwards and lowers you into the tank.\
mptransfer $n 812\
", 
               MudProgType = "bribe_prog", 
            }, 
            [3] = 
            {
               Arguments = "ryll spice drugs", 
               Code = "'Yes, it's true.  Some evil Twi'leks have changed the purpose of\
mpecho &Cryll.\
sigh\
'They use it as a drug.  But ryll is meant strictly for\
mpecho &chealing.\
", 
               MudProgType = "speech_prog", 
            }, 
            [4] = 
            {
               Arguments = "bacta", 
               Code = "'Bacta??\
snort\
'Bacta is for human wimps who must get rid of their pain faster.\
chuckle\
'We Twi'leks are strong enough to only need Ryll to heal our wounds.\
'In fact, using Bacta is seen as a weakness here on Ryloth.\
laugh\
'Bacta...silly tourists...\
", 
               MudProgType = "speech_prog", 
            }, 
         }, 
         Alignment = 0, 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
               [2] = "twileki", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [2] = "twileki", 
            }, 
         }, 
         HitChance = 
         {
            HitPlus = 550, 
            HitNoDice = 11, 
            HitSizeDice = 10, 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         DamRoll = 11, 
         Damage = 
         {
            DamNoDice = 5, 
            DamPlus = 2, 
            DamSizeDice = 4, 
         }, 
         Weight = 0, 
         Sex = "male", 
         ArmorClass = -37, 
         DefaultPosition = "standing", 
         Height = 0, 
         Position = "standing", 
         Level = 55, 
         HitRoll = 11, 
         LongDescr = "Fal'vira is renting out RYLL tanks??\
", 
         Description = "", 
         ShortDescr = "Fal'vira", 
      }, 
      [889] = 
      {
         NumberOfAttacks = 0, 
         Stats = 
         {
            Wisdom = 10, 
            Intelligence = 10, 
            Luck = 10, 
            Charisma = 10, 
            Force = 0, 
            Strength = 10, 
            Constitution = 10, 
            Dexterity = 10, 
         }, 
         Race = "Human", 
         Flags = 
         {
            [0] = "Npc", 
            [25] = "NoKill", 
            [30] = "Prototype", 
         }, 
         Credits = 0, 
         Name = "A Twi'lek Merchant", 
         Vnum = 889, 
         Shop = 
         {
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            ProfitSell = 90, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            ProfitBuy = 120, 
            KeeperShortDescr = "a newly created A Twi'lek Merchant", 
            KeeperVnum = 889, 
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
         Alignment = 0, 
         SaveVs = 
         {
            Breath = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         HitChance = 
         {
            HitPlus = 0, 
            HitNoDice = 0, 
            HitSizeDice = 0, 
         }, 
         Immune = 
         {
            [20] = "magic", 
            [11] = "charm", 
         }, 
         DamRoll = 0, 
         Damage = 
         {
            DamNoDice = 0, 
            DamPlus = 0, 
            DamSizeDice = 0, 
         }, 
         Weight = 0, 
         Sex = "undistinguished", 
         ArmorClass = 0, 
         DefaultPosition = "standing", 
         Height = 0, 
         Position = "standing", 
         Level = 1, 
         HitRoll = 0, 
         LongDescr = "A Twi'lek Merchant\
", 
         Description = "", 
         ShortDescr = "a newly created A Twi'lek Merchant", 
      }, 
      [890] = 
      {
         NumberOfAttacks = 0, 
         Stats = 
         {
            Wisdom = 10, 
            Intelligence = 10, 
            Luck = 10, 
            Charisma = 10, 
            Force = 0, 
            Strength = 10, 
            Constitution = 10, 
            Dexterity = 10, 
         }, 
         Race = "Human", 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         Credits = 0, 
         VipFlags = 
         {
            [2] = "Ryloth", 
         }, 
         Name = "A Twi'lek Police", 
         Vnum = 890, 
         SpecFuns = 
         {
            [1] = "spec_guardian", 
            [2] = "spec_police_attack", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               Code = "", 
               MudProgType = "fight_prog", 
            }, 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
               [2] = "twileki", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [2] = "twileki", 
            }, 
         }, 
         Alignment = 0, 
         SaveVs = 
         {
            Breath = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         HitChance = 
         {
            HitPlus = 240, 
            HitNoDice = 4, 
            HitSizeDice = 10, 
         }, 
         Immune = 
         {
            [11] = "charm", 
         }, 
         DamRoll = 4, 
         Damage = 
         {
            DamNoDice = 2, 
            DamPlus = 2, 
            DamSizeDice = 4, 
         }, 
         Weight = 0, 
         Sex = "undistinguished", 
         ArmorClass = 40, 
         DefaultPosition = "standing", 
         Height = 0, 
         Position = "standing", 
         Level = 24, 
         HitRoll = 4, 
         LongDescr = "A Twi'lek Peace Official is protecting the innocent.\
", 
         Description = "", 
         ShortDescr = "A Twi'lek Cop", 
      }, 
      [891] = 
      {
         NumberOfAttacks = 0, 
         Stats = 
         {
            Wisdom = 10, 
            Intelligence = 10, 
            Luck = 10, 
            Charisma = 10, 
            Force = 0, 
            Strength = 10, 
            Constitution = 10, 
            Dexterity = 10, 
         }, 
         Race = "Human", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Credits = 0, 
         VipFlags = 
         {
            [2] = "Ryloth", 
         }, 
         Name = "twi'lek twilek citizen", 
         Vnum = 891, 
         Alignment = 0, 
         Languages = 
         {
            Speaking = 
            {
               [2] = "twileki", 
            }, 
            Speaks = 
            {
               [2] = "twileki", 
            }, 
         }, 
         HitChance = 
         {
            HitPlus = 50, 
            HitNoDice = 1, 
            HitSizeDice = 10, 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         DamRoll = 1, 
         Damage = 
         {
            DamNoDice = 0, 
            DamPlus = 2, 
            DamSizeDice = 4, 
         }, 
         Weight = 0, 
         Sex = "undistinguished", 
         ArmorClass = 87, 
         DefaultPosition = "standing", 
         Height = 0, 
         Position = "standing", 
         Level = 5, 
         HitRoll = 1, 
         LongDescr = "A twi'lek moves around Kala'uun on business.\
", 
         Description = "This is your everyday Twi'lek, really.  He stands 2 meters tall, with his\
lekku hanging behind his\
head.\
", 
         ShortDescr = "Twi'lek Male", 
      }, 
      [892] = 
      {
         NumberOfAttacks = 0, 
         Stats = 
         {
            Wisdom = 10, 
            Intelligence = 10, 
            Luck = 10, 
            Charisma = 10, 
            Force = 0, 
            Strength = 10, 
            Constitution = 10, 
            Dexterity = 10, 
         }, 
         Race = "Human", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [30] = "Prototype", 
         }, 
         Credits = 0, 
         VipFlags = 
         {
            [2] = "Ryloth", 
         }, 
         Name = "Kookab'urra", 
         Vnum = 892, 
         Shop = 
         {
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            ProfitSell = 90, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "comlink", 
            }, 
            ProfitBuy = 120, 
            KeeperShortDescr = "Kookab'urra", 
            KeeperVnum = 892, 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
               [2] = "twileki", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [2] = "twileki", 
            }, 
         }, 
         Alignment = 0, 
         SaveVs = 
         {
            Breath = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         HitChance = 
         {
            HitPlus = 0, 
            HitNoDice = 0, 
            HitSizeDice = 0, 
         }, 
         Immune = 
         {
            [20] = "magic", 
            [11] = "charm", 
         }, 
         DamRoll = 0, 
         Damage = 
         {
            DamNoDice = 0, 
            DamPlus = 0, 
            DamSizeDice = 0, 
         }, 
         Weight = 0, 
         Sex = "undistinguished", 
         ArmorClass = 0, 
         DefaultPosition = "standing", 
         Height = 0, 
         Position = "standing", 
         Level = 1, 
         HitRoll = 0, 
         LongDescr = "Kookab'urra is selling comlinks\
", 
         Description = "", 
         ShortDescr = "Kookab'urra", 
      }, 
      [893] = 
      {
         NumberOfAttacks = 0, 
         Stats = 
         {
            Wisdom = 10, 
            Intelligence = 10, 
            Luck = 10, 
            Charisma = 10, 
            Force = 0, 
            Strength = 10, 
            Constitution = 10, 
            Dexterity = 10, 
         }, 
         Race = "Human", 
         Flags = 
         {
            [0] = "Npc", 
            [25] = "NoKill", 
            [30] = "Prototype", 
         }, 
         Credits = 0, 
         VipFlags = 
         {
            [2] = "Ryloth", 
         }, 
         Name = "Sal'mara", 
         Vnum = 893, 
         Shop = 
         {
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            ProfitSell = 0, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            ProfitBuy = 120, 
            KeeperShortDescr = "Sal'mara the Vendor", 
            KeeperVnum = 893, 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
               [2] = "twileki", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [2] = "twileki", 
            }, 
         }, 
         Alignment = 0, 
         SaveVs = 
         {
            Breath = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         HitChance = 
         {
            HitPlus = 650, 
            HitNoDice = 13, 
            HitSizeDice = 10, 
         }, 
         Immune = 
         {
            [20] = "magic", 
            [11] = "charm", 
         }, 
         DamRoll = 13, 
         Damage = 
         {
            DamNoDice = 6, 
            DamPlus = 2, 
            DamSizeDice = 4, 
         }, 
         Weight = 0, 
         Sex = "undistinguished", 
         ArmorClass = -62, 
         DefaultPosition = "standing", 
         Height = 0, 
         Position = "standing", 
         Level = 65, 
         HitRoll = 13, 
         LongDescr = "Sal'mara is here looking to unload some shields\
", 
         Description = "", 
         ShortDescr = "Sal'mara the Vendor", 
      }, 
      [894] = 
      {
         NumberOfAttacks = 0, 
         Stats = 
         {
            Wisdom = 10, 
            Intelligence = 10, 
            Luck = 10, 
            Charisma = 10, 
            Force = 0, 
            Strength = 10, 
            Constitution = 10, 
            Dexterity = 10, 
         }, 
         Race = "Human", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [5] = "Aggressive", 
            [10] = "Practice", 
         }, 
         Credits = 0, 
         VipFlags = 
         {
            [2] = "Ryloth", 
         }, 
         SpecFuns = 
         {
            [1] = "spec_janitor", 
         }, 
         Name = "A Twi'lek Junkie", 
         Vnum = 894, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               Code = "mpechoat $n &cA Twi'lek Junkie looks at you with utter contempt.\
'Get out of here!  This is our Ryll!\
", 
               MudProgType = "all_greet_prog", 
            }, 
            [2] = 
            {
               Arguments = "100", 
               Code = "mpmload 894\
", 
               MudProgType = "death_prog", 
            }, 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
               [2] = "twileki", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [2] = "twileki", 
            }, 
         }, 
         SaveVs = 
         {
            Breath = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         Alignment = 0, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         HitChance = 
         {
            HitPlus = 450, 
            HitNoDice = 4, 
            HitSizeDice = 10, 
         }, 
         AttackFlags = 
         {
            [1] = "claws", 
         }, 
         DamRoll = 11, 
         Damage = 
         {
            DamNoDice = 4, 
            DamPlus = 2, 
            DamSizeDice = 4, 
         }, 
         Weight = 0, 
         Sex = "male", 
         ArmorClass = -12, 
         DefaultPosition = "standing", 
         Height = 0, 
         Position = "standing", 
         Level = 45, 
         HitRoll = 11, 
         LongDescr = "A Twi'lek Junkie is hoarding Ryll.\
", 
         Description = "", 
         ShortDescr = "A Twi'lek Junkie", 
      }, 
      [895] = 
      {
         NumberOfAttacks = 0, 
         Stats = 
         {
            Wisdom = 10, 
            Intelligence = 10, 
            Luck = 10, 
            Charisma = 10, 
            Force = 0, 
            Strength = 10, 
            Constitution = 10, 
            Dexterity = 10, 
         }, 
         Race = "Twi'lek", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
         }, 
         Credits = 0, 
         VipFlags = 
         {
            [2] = "Ryloth", 
         }, 
         Name = "Lavar'inaa", 
         Vnum = 895, 
         Shop = 
         {
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            ProfitSell = 75, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            ProfitBuy = 120, 
            KeeperShortDescr = "Lavar'inaa the cook", 
            KeeperVnum = 895, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Arguments = "100", 
               Code = "smile $n\
'Uncle Tam'arr isn't feeling well so I'm watching the cafe today.\
giggle\
'Would you like something to eat?\
flirt $n\
", 
               MudProgType = "all_greet_prog", 
            }, 
            [2] = 
            {
               Arguments = "yes yeah yup yep oui si sure", 
               Code = "'Well in that case, pull up a seat.\
mpecho &cLavar'inaa leans on the greasy counter.\
'We got a lot of good stuff\
here.\
giggle\
", 
               MudProgType = "speech_prog", 
            }, 
            [3] = 
            {
               Arguments = "food", 
               Code = "'The food?\
mpecho &cLavar'inaa laughs nervously.\
'Well...they're not exactly Twi'lek delicacies.\
inno $n\
'Listen, Uncle Tam'arr is sick.  This is the best I can do.\
", 
               MudProgType = "speech_prog", 
            }, 
            [4] = 
            {
               Arguments = "1", 
               Code = "mpechoat $n &cLavar'inaa takes your credits.\
'A tip?  Thanks, $n.  You're a doll.\
mpecho &cLavar'inaa puts some credits in her pocket.\
smile $n\
thank $n\
", 
               MudProgType = "bribe_prog", 
            }, 
         }, 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
               [2] = "twileki", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [2] = "twileki", 
            }, 
         }, 
         Alignment = 0, 
         SaveVs = 
         {
            Breath = 0, 
            PoisonDeath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         HitChance = 
         {
            HitPlus = 250, 
            HitNoDice = 5, 
            HitSizeDice = 10, 
         }, 
         Immune = 
         {
            [20] = "magic", 
            [11] = "charm", 
         }, 
         DamRoll = 5, 
         Damage = 
         {
            DamNoDice = 2, 
            DamPlus = 2, 
            DamSizeDice = 4, 
         }, 
         Weight = 0, 
         Sex = "female", 
         ArmorClass = 37, 
         DefaultPosition = "standing", 
         Height = 0, 
         Position = "standing", 
         Level = 25, 
         HitRoll = 5, 
         LongDescr = "Lavar'inaa is serving Twi'lek delicacies.\
", 
         Description = "", 
         ShortDescr = "Lavar'inaa the cook", 
      }, 
   }, 
   HighEconomy = 0, 
   ResetMessage = "", 
   Author = "Darrik", 
   Objects = 
   {
      [880] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Layers = 0, 
         ShortDescr = "Pure Ryll", 
         ActionDescription = "", 
         Weight = 3, 
         ObjectValues = 
         {
            [1] = 25, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         Name = "Pure Ryll", 
         Description = "Some of Ryloth's Finest was left around here.", 
         ItemType = "spice", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Cost = 0, 
         Vnum = 880, 
      }, 
      [881] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Layers = 0, 
         ShortDescr = "A package for Koh'shak", 
         ActionDescription = "", 
         Weight = 200, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Name = "A package for Koh'shak", 
         Description = "A package for Koh'shak", 
         ItemType = "container", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Cost = 10000, 
         Vnum = 881, 
      }, 
      [900] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         Layers = 0, 
         ShortDescr = "a A Super-Advanced Battery", 
         ActionDescription = "", 
         Weight = 1, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 250, 
         }, 
         Name = "A Super-Advanced Battery", 
         Description = "A Super-Advanced Battery", 
         ItemType = "battery", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Cost = 350, 
         Vnum = 900, 
      }, 
   }, 
   ResetFrequency = 0, 
   Name = "Ryloth", 
   LowEconomy = 4483179, 
   Filename = "ryloth.lua", 
}
