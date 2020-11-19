-- Ryloth
-- Last saved Thursday 19-Nov-2020 14:31:09

AreaEntry
{
   VnumRanges = 
   {
      Mob = 
      {
         First = 800, 
         Last = 899, 
      }, 
      Object = 
      {
         First = 880, 
         Last = 900, 
      }, 
      Room = 
      {
         First = 800, 
         Last = 898, 
      }, 
   }, 
   Objects = 
   {
      [880] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 880, 
         Cost = 0, 
         ShortDescr = "Pure Ryll", 
         Weight = 3, 
         Layers = 0, 
         Name = "Pure Ryll", 
         Description = "Some of Ryloth's Finest was left around here.", 
         ActionDescription = "", 
         ItemType = "spice", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ObjectValues = 
         {
            [1] = 25, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
      }, 
      [881] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 881, 
         Cost = 10000, 
         ShortDescr = "A package for Koh'shak", 
         Weight = 200, 
         Layers = 0, 
         Name = "A package for Koh'shak", 
         Description = "A package for Koh'shak", 
         ActionDescription = "", 
         ItemType = "container", 
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
      [900] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         Vnum = 900, 
         Cost = 350, 
         ShortDescr = "a A Super-Advanced Battery", 
         Weight = 1, 
         Layers = 0, 
         Name = "A Super-Advanced Battery", 
         Description = "A Super-Advanced Battery", 
         ActionDescription = "", 
         ItemType = "battery", 
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
            [0] = 250, 
         }, 
      }, 
   }, 
   HighEconomy = 0, 
   Rooms = 
   {
      [896] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 896, 
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
      [897] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 897, 
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
      [898] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 898, 
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
      [800] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [4] = "CanLand", 
            [5] = "CanFly", 
         }, 
         Vnum = 800, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Kala'uun Spaceport Landing Pad", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Code = "", 
               Arguments = "100", 
               ScriptType = "MProg", 
            }, 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 801, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [801] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 801, 
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
               DestinationVnum = 802, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 800, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 805, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "In the heart of Kala'uun Spaceport", 
      }, 
      [802] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Vnum = 802, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Gira'haad Cantina.", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Code = "", 
               Arguments = "100", 
               ScriptType = "MProg", 
            }, 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 804, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 801, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 803, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [803] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [25] = "Refinery", 
            [3] = "Indoors", 
         }, 
         Vnum = 803, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "A cramped booth", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Code = "mpechoat $n &gA Small Cock-a-Roach skitters past your boot...\
", 
               Arguments = "100", 
               ScriptType = "MProg", 
            }, 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 802, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "northeast", 
               Key = -1, 
               DestinationVnum = 804, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "You can refine spice here.\
", 
      }, 
      [804] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Vnum = 804, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Gira'haad's Counter", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Code = "mpechoat $n &gThe hustle and bustle of the bar gets a bit louder...\
", 
               Arguments = "100", 
               ScriptType = "MProg", 
            }, 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 802, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "southwest", 
               Key = -1, 
               DestinationVnum = 803, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [805] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 805, 
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
               DestinationVnum = 801, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 806, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 816, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Entrance to Kala'uun", 
      }, 
      [806] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 806, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Code = "", 
               Arguments = "100", 
               ScriptType = "MProg", 
            }, 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 805, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "southwest", 
               Key = -1, 
               DestinationVnum = 807, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Nuntav'ara Street", 
      }, 
      [807] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 807, 
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
               DestinationVnum = 815, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "northeast", 
               Key = -1, 
               DestinationVnum = 806, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "southwest", 
               Key = -1, 
               DestinationVnum = 808, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Nuntav'ara Street", 
      }, 
      [808] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 808, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Code = "", 
               Arguments = "100", 
               ScriptType = "MProg", 
            }, 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 809, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 810, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "northeast", 
               Key = -1, 
               DestinationVnum = 807, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Nuntav'ara Street", 
      }, 
      [809] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [8] = "Bank", 
            [3] = "Indoors", 
         }, 
         Vnum = 809, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Ryloth Planetary Bank", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "all_greet_prog", 
               Code = "", 
               Arguments = "", 
               ScriptType = "MProg", 
            }, 
            [2] = 
            {
               MudProgType = "all_greet_prog", 
               Code = "mpechoat $n The Fat Banker snickers under his breath.\
mpechoat $n The Fat Banker says, \"Hello, there.  Just give all your credits\
to\
me.\"\
mpechoat $n The Fat Banker guffaws loudly to nobody in particular.\
", 
               Arguments = "100", 
               ScriptType = "MProg", 
            }, 
            [3] = 
            {
               MudProgType = "rand_prog", 
               Code = "mpecho &gThe clanging of exchanged credits fills the room...\
", 
               Arguments = "100", 
               ScriptType = "MProg", 
            }, 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 808, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The Planetary Bank is one of the few bustling offices in town.  Mainly\
because it's indoors, and offers it's residents an escape from the heat.\
There are lines 30 people long in each of the 5 teller windows, and as\
always, 8 windows are left closed. Then, you see a fat Twi'lek man wearing\
the bankers uniform stand off near a table.  You dash over to him in hopes\
that he can record your credit transactions.  Upon closer inspection, you\
notice his uniform is not quite right...\
", 
      }, 
      [810] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 810, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Code = "", 
               Arguments = "100", 
               ScriptType = "MProg", 
            }, 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 811, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 808, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "northwest", 
               Key = -1, 
               DestinationVnum = 813, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Nuntav'ara Street", 
      }, 
      [811] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Vnum = 811, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Fal'vira Ryll Clinic", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 810, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [812] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 812, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Ryll Tank", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Code = "feel 'cure serious' $n\
mpechoat $n You feel the Ryll healing you slightly.\
", 
               Arguments = "100", 
               ScriptType = "MProg", 
            }, 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 849, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 1, 
         Description = "Well, you've made it into a ryll tank.  Once you get in here, you notice\
something is clearly different from most bacta tanks. While in bacta, your\
wounds go away much faster, but here in the ryll, your pain lingers for a\
little while longer.  It certainly feels better than bacta somehow, and\
you are comforted by the fact that you won't be tasting bacta in your\
mouth for weeks to come.\
", 
      }, 
      [813] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [0] = "Dark", 
         }, 
         Vnum = 813, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "A Dark alley.", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Code = "mpechoat $n &gAn unidentified rodent skitters by your feet...\
", 
               Arguments = "100", 
               ScriptType = "MProg", 
            }, 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "northwest", 
               Key = -1, 
               DestinationVnum = 814, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "southeast", 
               Key = -1, 
               DestinationVnum = 810, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "DO NOT GO NORTHWEST UNLESS YOU FEEL VERY COMFORTABLE ABOUT YOUR FIGHTING\
SKILLS!!!\
", 
      }, 
      [814] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [0] = "Dark", 
         }, 
         Vnum = 814, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "A Dead End", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Code = "", 
               Arguments = "100", 
               ScriptType = "MProg", 
            }, 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "southeast", 
               Key = -1, 
               DestinationVnum = 813, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [815] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 815, 
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
               DestinationVnum = 807, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Tam'arr Food Bar.", 
      }, 
      [816] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Vnum = 816, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Malachu Market", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Code = "", 
               Arguments = "100", 
               ScriptType = "MProg", 
            }, 
            [2] = 
            {
               MudProgType = "rand_prog", 
               Code = "mpechoat $n &bWater rises from the plaza fountain blasting 50 meters in the\
mpechoat $n &bair and falling back down into the tiny pool...\
", 
               Arguments = "100", 
               ScriptType = "MProg", 
            }, 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 805, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [817] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Vnum = 817, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "The Komlinks of Kookab'urra", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 846, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [818] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Vnum = 818, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Power Cell Kiosk", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Code = "", 
               Arguments = "100", 
               ScriptType = "MProg", 
            }, 
         }, 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [24] = "NoMob", 
               }, 
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 848, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Flags = 
               {
                  [19] = "Auto", 
                  [11] = "Hidden", 
               }, 
               Description = "", 
               Direction = "somewhere", 
               Key = -1, 
               DestinationVnum = 820, 
               Distance = 0, 
               Keyword = "spice", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [819] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Vnum = 819, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Sal'mara Shields.", 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [24] = "NoMob", 
               }, 
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 847, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [820] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Vnum = 820, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "A Raw Ryll Depository.", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Code = "", 
               Arguments = "100", 
               ScriptType = "MProg", 
            }, 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "southeast", 
               Key = -1, 
               DestinationVnum = 818, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [821] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [23] = "Hotel", 
         }, 
         Vnum = 821, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Kala'uun Hostel.", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 880, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 881, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 822, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Flags = 
               {
                  [19] = "Auto", 
                  [11] = "Hidden", 
                  [3] = "Secret", 
               }, 
               Description = "", 
               Direction = "somewhere", 
               Key = -1, 
               DestinationVnum = 32149, 
               Distance = 0, 
               Keyword = "pluogusnow", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "Amenities here are spare.  This hostel is strictly for getting much needed\
rest for non-twl'lek travelers, since no aliens are allowed into the\
warrens. Two rooms and one commons is provided.\
", 
      }, 
      [822] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [4] = "CanLand", 
            [5] = "CanFly", 
            [2] = "NoMob", 
         }, 
         Vnum = 822, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Kala'uun Starport : Serin Landing Bay", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Code = "", 
               Arguments = "100", 
               ScriptType = "MProg", 
            }, 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 821, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 823, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "northwest", 
               Key = -1, 
               DestinationVnum = 824, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The starport is a colossil cavern which had been hollowed out out of the\
heart of the mountain that sheltered it. Above the landing area lay level\
upon level of Twi'lek clan warrens, comprising the living quarters and\
work areas of over 100,00 Twi'leks.\
", 
      }, 
      [823] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Vnum = 823, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Kala'uun Starport : Landing Bay", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 822, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "northeast", 
               Key = -1, 
               DestinationVnum = 824, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The starport is a colossil cavern which had been hollowed out out of the\
heart of the mountain that sheltered it. Above the landing area lay level\
upon level of Twi'lek clan warrens, comprising the living quarters and\
work areas of over 100,00 Twi'leks.    This section of the Starport is\
reserved for Twi'lek Clan ships. Mostly this consists of merchant vessels,\
but occasionally a starfighter of various kind will land here.\
", 
      }, 
      [824] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Vnum = 824, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Kala'uun Starport", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Code = "", 
               Arguments = "100", 
               ScriptType = "MProg", 
            }, 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 825, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "southeast", 
               Key = -1, 
               DestinationVnum = 822, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "southwest", 
               Key = -1, 
               DestinationVnum = 823, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The starport is a colossil cavern which had been hollowed out out of the\
heart of the mountain that sheltered it. Above the landing area lay level\
upon level of Twi'lek clan warrens, comprising the living quarters and\
work areas of over 100,00 Twi'leks. \
", 
      }, 
      [825] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Vnum = 825, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Kala'uun Starport : Warren Entrance", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 824, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 826, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 854, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The starport is a colossil cavern which had been hollowed out out of the\
heart of the mountain that sheltered it. Above the landing area lay level\
upon level of Twi'lek clan warrens, comprising the living quarters and\
work areas of over 100,00 Twi'leks.   The areas beyond this are private.\
Only Twi'lek clan members are allowedibeyond here. \
", 
      }, 
      [826] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Vnum = 826, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Kala'uun Starport : Warrens", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Code = "", 
               Arguments = "100", 
               ScriptType = "MProg", 
            }, 
            [2] = 
            {
               MudProgType = "entry_prog", 
               Code = "if isimmort($n)\
else\
if race($n) == twi'lek\
else\
mpechoat $n Someone says, 'You don't belong in here!'\
mpechoat $n You run back downstairs.\
endif\
endif\
", 
               Arguments = "100", 
               ScriptType = "MProg", 
            }, 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 844, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 827, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 850, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 825, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The stair case you climb brings you to a hallway. Hollowed out of stone,\
the hallway is lighted by glowrods attached to the ceiling. To the west\
lies the thousands of warrens where the Twi'lek clans live. To the east\
lies the shops where one can buy what one needs. \
", 
      }, 
      [827] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Vnum = 827, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Kala'uun Starport : Warrens", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 826, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 828, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "Hollowed out of stone, the hallway is lighted by glowrods attached to the\
ceiling.\
", 
      }, 
      [828] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Vnum = 828, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Kala'uun Starport : Warrens", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Code = "", 
               Arguments = "100", 
               ScriptType = "MProg", 
            }, 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 827, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 829, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "Hollowed out of stone, the hallway is lighted by glowrods attached to the\
ceiling.\
", 
      }, 
      [829] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Vnum = 829, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Kala'uun Starport : Warrens", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 828, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 835, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 830, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "Hollowed out of stone, the hallway is lighted by glowrods attached to the\
ceiling.\
", 
      }, 
      [830] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Vnum = 830, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Kala'uun Starport : Warrens", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 829, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 836, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 831, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "Hollowed out of stone, the hallway is lighted by glowrods attached to\
the ceiling.\
", 
      }, 
      [831] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Vnum = 831, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Kala'uun Starport : Warrens", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 830, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 837, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 832, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 842, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "Hollowed out of stone, the hallway is lighted by glowrods attached to the\
ceiling.\
", 
      }, 
      [832] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Vnum = 832, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Kala'uun Starport : Warrens", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 831, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 838, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 833, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 841, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "Hollowed out of stone, the hallway is lighted by glowrods attached to the\
ceiling.\
", 
      }, 
      [833] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Vnum = 833, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Kala'uun Starport : Warrens", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 832, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 839, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 834, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 840, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "Hollowed out of stone, the hallway is lighted by glowrods attached to the\
ceiling.\
", 
      }, 
      [834] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Vnum = 834, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 833, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
      }, 
      [835] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Vnum = 835, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [25] = "Window", 
               }, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 822, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 829, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
      }, 
      [836] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Vnum = 836, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [25] = "Window", 
               }, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 822, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 830, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
      }, 
      [837] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Vnum = 837, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [25] = "Window", 
               }, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 822, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 831, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
      }, 
      [838] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Vnum = 838, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [25] = "Window", 
               }, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 822, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 832, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
      }, 
      [839] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Vnum = 839, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [25] = "Window", 
               }, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 822, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 833, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
      }, 
      [840] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Vnum = 840, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 833, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
      }, 
      [841] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Vnum = 841, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "An Empty Home", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 832, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
      }, 
      [842] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Vnum = 842, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Butcher", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 843, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 831, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [843] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Vnum = 843, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Meat Locker", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 842, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [844] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 844, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Kala'uun Starport : Warrens", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 845, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 826, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "Hollowed out of stone, the hallway is lighted by glowrods attached to the\
ceiling. \
", 
      }, 
      [845] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 845, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Kala'uun Starport : Warrens", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 846, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 844, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "Hollowed out of stone, the hallway is lighted by glowrods attached to the\
ceiling. \
", 
      }, 
      [846] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 846, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Kala'uun Starport : Warrens", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 845, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 817, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 847, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "Hollowed out of stone, the hallway is lighted by glowrods attached to the\
ceiling. \
", 
      }, 
      [847] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 847, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Kala'uun Starport : Warrens", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 846, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 819, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 848, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "Hollowed out of stone, the hallway is lighted by glowrods attached to the\
ceiling. \
", 
      }, 
      [848] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 848, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Kala'uun Starport : Warrens", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 847, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 818, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 849, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "Hollowed out of stone, the hallway is lighted by glowrods attached to the\
ceiling. \
", 
      }, 
      [849] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 849, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Kala'uun Starport : Warrens", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 848, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 812, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "Hollowed out of stone, the hallway is lighted by glowrods attached to the\
ceiling. \
", 
      }, 
      [850] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 850, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Kala'uun Starport : Work Area", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 851, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 875, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 826, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The stair case you climb brings you to a hallway. Hollowed out of stone,\
the hallway is lighted by glowrods attached to the ceiling. Thousands of\
twi'leks move in and out of this area, where things are built and pieces\
of hardware are sold.\
", 
      }, 
      [851] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 851, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Kala'uun Starport : Work Area", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 852, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 850, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 853, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The stair case you climb brings you to a hallway. Hollowed out of stone,\
the hallway is lighted by glowrods attached to the ceiling. Thousands of\
twi'leks move in and out of this area, where things are built and pieces\
of hardware are sold.\
", 
      }, 
      [852] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
            [26] = "Factory", 
            [2] = "NoMob", 
         }, 
         Vnum = 852, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Workshop", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 879, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 851, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [853] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
            [26] = "Factory", 
            [2] = "NoMob", 
         }, 
         Vnum = 853, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Hardware", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 851, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [854] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [0] = "Dark", 
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 854, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "A Dark Tunnel", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 855, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 825, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [855] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [0] = "Dark", 
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 855, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "A Dark Tunnel", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 856, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 854, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [856] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [0] = "Dark", 
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 856, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "A Dark Tunnel", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 857, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 855, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [857] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [0] = "Dark", 
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 857, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "A Dark Tunnel", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 858, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 856, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [858] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [0] = "Dark", 
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 858, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "A Dark Tunnel", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 859, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 857, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [859] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [0] = "Dark", 
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 859, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "A Dark Tunnel", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 858, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Flags = 
               {
                  [19] = "Auto", 
               }, 
               Description = "", 
               Direction = "somewhere", 
               Key = -1, 
               DestinationVnum = 860, 
               Distance = 0, 
               Keyword = "Mines", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [860] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [0] = "Dark", 
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 860, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Ryll Mines", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 861, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 859, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 863, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [861] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [0] = "Dark", 
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 861, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Ryll Mines", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 862, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 860, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 865, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [862] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [0] = "Dark", 
            [25] = "Refinery", 
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 862, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Ryll Mines", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 861, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [863] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [0] = "Dark", 
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 863, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Ryll Mines", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 860, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 864, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 867, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [864] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [0] = "Dark", 
            [25] = "Refinery", 
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 864, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Ryll Mines", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 863, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [865] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [0] = "Dark", 
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 865, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Ryll Mines", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 866, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 861, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 872, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [866] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [0] = "Dark", 
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 866, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Ryll Mines", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 865, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [867] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [0] = "Dark", 
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 867, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Ryll Mines", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 868, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 863, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 870, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [868] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [0] = "Dark", 
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 868, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Ryll Mines", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 867, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [869] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [0] = "Dark", 
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 869, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Ryll Mines", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 870, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [870] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [0] = "Dark", 
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 870, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Ryll Mines", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 871, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 869, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 867, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [871] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [0] = "Dark", 
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 871, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Ryll Mines", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 872, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 870, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [872] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [0] = "Dark", 
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 872, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Ryll Mines", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 873, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 871, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 865, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [873] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [0] = "Dark", 
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 873, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Ryll Mines", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 872, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [874] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [0] = "Dark", 
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 874, 
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
      [875] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 875, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Kala'uun Starport : Academy", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 876, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 850, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The stair case you climb brings you to a hallway. Hollowed out of stone,\
the hallway is lighted by glowrods attached to the ceiling. Twi'leks come\
here to train before going out into the world. \
", 
      }, 
      [876] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 876, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Kala'uun Starport : Academy", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 878, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 875, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 877, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The stair case you climb brings you to a hallway. Hollowed out of stone,\
the hallway is lighted by glowrods attached to the ceiling. Twi'leks come\
here to train before going out into the world. \
", 
      }, 
      [877] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 877, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Kala'uun Starport : Academy Training", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 876, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [878] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 878, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Kala'uun Starport : Combat Skills", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 876, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [879] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 879, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Compactor", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 852, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [880] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 880, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Hostel Commons", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 882, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 821, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The hostel commons is simply an area where travelers can get food and drink\
for cheap prices. It is small and crowded with tables.  A fireplace sits\
near the bar, and a bartender waits on your order. \
", 
      }, 
      [881] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
            [2] = "NoMob", 
            [23] = "Hotel", 
         }, 
         Vnum = 881, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Hostel Room", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 821, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "Small and cramped, the room will fit a family of 4 in 2 beds, with little\
space to spare.\
", 
      }, 
      [882] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
            [2] = "NoMob", 
            [23] = "Hotel", 
         }, 
         Vnum = 882, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Hostel Room", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 880, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "Small and cramped, the room will fit a family of 4 in 2 beds, with little\
space to spare. \
", 
      }, 
      [883] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 883, 
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
      [884] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 884, 
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
      [885] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 885, 
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
      [886] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 886, 
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
      [887] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 887, 
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
      [888] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 888, 
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
      [889] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 889, 
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
      [890] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 890, 
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
      [891] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 891, 
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
      [892] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 892, 
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
      [893] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 893, 
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
      [894] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Vnum = 894, 
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
      [895] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 895, 
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
   }, 
   FileFormatVersion = 1, 
   LowEconomy = 4483179, 
   Resets = 
   {
      [1] = 
      {
         MiscData = 1, 
         Arg1 = 891, 
         Command = "M", 
         Arg3 = 801, 
         Arg2 = 5, 
      }, 
      [2] = 
      {
         MiscData = 1, 
         Arg1 = 890, 
         Command = "M", 
         Arg3 = 808, 
         Arg2 = 3, 
      }, 
      [3] = 
      {
         MiscData = 1, 
         Arg1 = 893, 
         Command = "M", 
         Arg3 = 808, 
         Arg2 = 1, 
      }, 
      [4] = 
      {
         MiscData = 1, 
         Arg1 = 898, 
         Command = "M", 
         Arg3 = 809, 
         Arg2 = 1, 
      }, 
      [5] = 
      {
         MiscData = 1, 
         Arg1 = 890, 
         Command = "M", 
         Arg3 = 813, 
         Arg2 = 3, 
      }, 
      [6] = 
      {
         MiscData = 1, 
         Arg1 = 894, 
         Command = "M", 
         Arg3 = 814, 
         Arg2 = 2, 
      }, 
      [7] = 
      {
         MiscData = 1, 
         Arg1 = 894, 
         Command = "M", 
         Arg3 = 814, 
         Arg2 = 2, 
      }, 
      [8] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 32230, 
         Command = "G", 
      }, 
      [9] = 
      {
         MiscData = 1, 
         Arg1 = 895, 
         Command = "M", 
         Arg3 = 815, 
         Arg2 = 1, 
      }, 
      [10] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 302, 
         Command = "G", 
      }, 
      [11] = 
      {
         MiscData = 1, 
         Arg1 = 890, 
         Command = "M", 
         Arg3 = 815, 
         Arg2 = 3, 
      }, 
      [12] = 
      {
         MiscData = 1, 
         Arg1 = 32259, 
         Command = "O", 
         Arg3 = 816, 
         Arg2 = 1, 
      }, 
      [13] = 
      {
         MiscData = 1, 
         Arg1 = 326, 
         Command = "O", 
         Arg3 = 820, 
         Arg2 = 1, 
      }, 
      [14] = 
      {
         MiscData = 1, 
         Arg1 = 90, 
         Command = "O", 
         Arg3 = 805, 
         Arg2 = 1, 
      }, 
      [15] = 
      {
         MiscData = 1, 
         Arg1 = 800, 
         Command = "M", 
         Arg3 = 864, 
         Arg2 = 1, 
      }, 
      [16] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 326, 
         Command = "G", 
      }, 
      [17] = 
      {
         MiscData = 1, 
         Arg1 = 880, 
         Command = "O", 
         Arg3 = 864, 
         Arg2 = 1, 
      }, 
      [18] = 
      {
         MiscData = 1, 
         Arg1 = 800, 
         Command = "M", 
         Arg3 = 862, 
         Arg2 = 2, 
      }, 
      [19] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 326, 
         Command = "G", 
      }, 
      [20] = 
      {
         MiscData = 1, 
         Arg1 = 880, 
         Command = "O", 
         Arg3 = 862, 
         Arg2 = 1, 
      }, 
      [21] = 
      {
         MiscData = 1, 
         Arg1 = 326, 
         Command = "O", 
         Arg3 = 873, 
         Arg2 = 1, 
      }, 
      [22] = 
      {
         MiscData = 1, 
         Arg1 = 326, 
         Command = "O", 
         Arg3 = 872, 
         Arg2 = 1, 
      }, 
      [23] = 
      {
         MiscData = 1, 
         Arg1 = 326, 
         Command = "O", 
         Arg3 = 871, 
         Arg2 = 1, 
      }, 
      [24] = 
      {
         MiscData = 1, 
         Arg1 = 326, 
         Command = "O", 
         Arg3 = 869, 
         Arg2 = 1, 
      }, 
      [25] = 
      {
         MiscData = 1, 
         Arg1 = 326, 
         Command = "O", 
         Arg3 = 870, 
         Arg2 = 1, 
      }, 
      [26] = 
      {
         MiscData = 1, 
         Arg1 = 801, 
         Command = "M", 
         Arg3 = 853, 
         Arg2 = 1, 
      }, 
      [27] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 32210, 
         Command = "G", 
      }, 
      [28] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 32234, 
         Command = "G", 
      }, 
      [29] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 10494, 
         Command = "G", 
      }, 
      [30] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 324, 
         Command = "G", 
      }, 
      [31] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 10497, 
         Command = "G", 
      }, 
      [32] = 
      {
         MiscData = 1, 
         Arg1 = 802, 
         Command = "M", 
         Arg3 = 877, 
         Arg2 = 1, 
      }, 
      [33] = 
      {
         MiscData = 1, 
         Arg1 = 10509, 
         Command = "M", 
         Arg3 = 878, 
         Arg2 = 3, 
      }, 
      [34] = 
      {
         MiscData = 1, 
         Arg1 = 803, 
         Command = "M", 
         Arg3 = 879, 
         Arg2 = 1, 
      }, 
      [35] = 
      {
         MiscData = 1, 
         Arg1 = 899, 
         Command = "M", 
         Arg3 = 880, 
         Arg2 = 1, 
      }, 
      [36] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 3, 
         Command = "G", 
      }, 
      [37] = 
      {
         MiscData = 1, 
         Arg1 = 895, 
         Command = "M", 
         Arg3 = 842, 
         Arg2 = 1, 
      }, 
      [38] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 302, 
         Command = "G", 
      }, 
      [39] = 
      {
         MiscData = 1, 
         Arg1 = 889, 
         Command = "M", 
         Arg3 = 818, 
         Arg2 = 1, 
      }, 
      [40] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 900, 
         Command = "G", 
      }, 
      [41] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 32234, 
         Command = "G", 
      }, 
      [42] = 
      {
         MiscData = 1, 
         Arg1 = 892, 
         Command = "M", 
         Arg3 = 817, 
         Arg2 = 1, 
      }, 
      [43] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 32229, 
         Command = "G", 
      }, 
      [44] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 10424, 
         Command = "G", 
      }, 
      [45] = 
      {
         MiscData = 1, 
         Arg1 = 822, 
         Command = "M", 
         Arg3 = 822, 
         Arg2 = 1, 
      }, 
      [46] = 
      {
         MiscData = 1, 
         Arg1 = 891, 
         Command = "M", 
         Arg3 = 821, 
         Arg2 = 11, 
      }, 
      [47] = 
      {
         MiscData = 1, 
         Arg1 = 891, 
         Command = "M", 
         Arg3 = 821, 
         Arg2 = 11, 
      }, 
      [48] = 
      {
         MiscData = 1, 
         Arg1 = 891, 
         Command = "M", 
         Arg3 = 821, 
         Arg2 = 11, 
      }, 
      [49] = 
      {
         MiscData = 1, 
         Arg1 = 891, 
         Command = "M", 
         Arg3 = 821, 
         Arg2 = 11, 
      }, 
      [50] = 
      {
         MiscData = 1, 
         Arg1 = 891, 
         Command = "M", 
         Arg3 = 821, 
         Arg2 = 11, 
      }, 
      [51] = 
      {
         MiscData = 1, 
         Arg1 = 891, 
         Command = "M", 
         Arg3 = 821, 
         Arg2 = 11, 
      }, 
      [52] = 
      {
         MiscData = 1, 
         Arg1 = 891, 
         Command = "M", 
         Arg3 = 824, 
         Arg2 = 18, 
      }, 
      [53] = 
      {
         MiscData = 1, 
         Arg1 = 891, 
         Command = "M", 
         Arg3 = 824, 
         Arg2 = 18, 
      }, 
      [54] = 
      {
         MiscData = 1, 
         Arg1 = 891, 
         Command = "M", 
         Arg3 = 824, 
         Arg2 = 18, 
      }, 
      [55] = 
      {
         MiscData = 1, 
         Arg1 = 891, 
         Command = "M", 
         Arg3 = 824, 
         Arg2 = 18, 
      }, 
      [56] = 
      {
         MiscData = 1, 
         Arg1 = 891, 
         Command = "M", 
         Arg3 = 824, 
         Arg2 = 18, 
      }, 
      [57] = 
      {
         MiscData = 1, 
         Arg1 = 891, 
         Command = "M", 
         Arg3 = 824, 
         Arg2 = 18, 
      }, 
      [58] = 
      {
         MiscData = 1, 
         Arg1 = 891, 
         Command = "M", 
         Arg3 = 824, 
         Arg2 = 18, 
      }, 
      [59] = 
      {
         MiscData = 1, 
         Arg1 = 891, 
         Command = "M", 
         Arg3 = 823, 
         Arg2 = 26, 
      }, 
      [60] = 
      {
         MiscData = 1, 
         Arg1 = 891, 
         Command = "M", 
         Arg3 = 823, 
         Arg2 = 26, 
      }, 
      [61] = 
      {
         MiscData = 1, 
         Arg1 = 891, 
         Command = "M", 
         Arg3 = 823, 
         Arg2 = 26, 
      }, 
      [62] = 
      {
         MiscData = 1, 
         Arg1 = 891, 
         Command = "M", 
         Arg3 = 823, 
         Arg2 = 26, 
      }, 
      [63] = 
      {
         MiscData = 1, 
         Arg1 = 891, 
         Command = "M", 
         Arg3 = 823, 
         Arg2 = 26, 
      }, 
      [64] = 
      {
         MiscData = 1, 
         Arg1 = 891, 
         Command = "M", 
         Arg3 = 823, 
         Arg2 = 26, 
      }, 
      [65] = 
      {
         MiscData = 1, 
         Arg1 = 891, 
         Command = "M", 
         Arg3 = 823, 
         Arg2 = 26, 
      }, 
      [66] = 
      {
         MiscData = 1, 
         Arg1 = 891, 
         Command = "M", 
         Arg3 = 823, 
         Arg2 = 26, 
      }, 
      [67] = 
      {
         MiscData = 1, 
         Arg1 = 891, 
         Command = "M", 
         Arg3 = 825, 
         Arg2 = 34, 
      }, 
      [68] = 
      {
         MiscData = 1, 
         Arg1 = 891, 
         Command = "M", 
         Arg3 = 825, 
         Arg2 = 34, 
      }, 
      [69] = 
      {
         MiscData = 1, 
         Arg1 = 891, 
         Command = "M", 
         Arg3 = 825, 
         Arg2 = 34, 
      }, 
      [70] = 
      {
         MiscData = 1, 
         Arg1 = 891, 
         Command = "M", 
         Arg3 = 825, 
         Arg2 = 34, 
      }, 
      [71] = 
      {
         MiscData = 1, 
         Arg1 = 891, 
         Command = "M", 
         Arg3 = 825, 
         Arg2 = 34, 
      }, 
      [72] = 
      {
         MiscData = 1, 
         Arg1 = 891, 
         Command = "M", 
         Arg3 = 825, 
         Arg2 = 34, 
      }, 
      [73] = 
      {
         MiscData = 1, 
         Arg1 = 891, 
         Command = "M", 
         Arg3 = 825, 
         Arg2 = 34, 
      }, 
      [74] = 
      {
         MiscData = 1, 
         Arg1 = 891, 
         Command = "M", 
         Arg3 = 825, 
         Arg2 = 34, 
      }, 
      [75] = 
      {
         MiscData = 1, 
         Arg1 = 891, 
         Command = "M", 
         Arg3 = 826, 
         Arg2 = 37, 
      }, 
      [76] = 
      {
         MiscData = 1, 
         Arg1 = 891, 
         Command = "M", 
         Arg3 = 826, 
         Arg2 = 37, 
      }, 
      [77] = 
      {
         MiscData = 1, 
         Arg1 = 891, 
         Command = "M", 
         Arg3 = 826, 
         Arg2 = 37, 
      }, 
      [78] = 
      {
         MiscData = 1, 
         Arg1 = 891, 
         Command = "M", 
         Arg3 = 845, 
         Arg2 = 41, 
      }, 
      [79] = 
      {
         MiscData = 1, 
         Arg1 = 891, 
         Command = "M", 
         Arg3 = 845, 
         Arg2 = 41, 
      }, 
      [80] = 
      {
         MiscData = 1, 
         Arg1 = 891, 
         Command = "M", 
         Arg3 = 845, 
         Arg2 = 41, 
      }, 
      [81] = 
      {
         MiscData = 1, 
         Arg1 = 891, 
         Command = "M", 
         Arg3 = 845, 
         Arg2 = 41, 
      }, 
      [82] = 
      {
         MiscData = 1, 
         Arg1 = 891, 
         Command = "M", 
         Arg3 = 828, 
         Arg2 = 45, 
      }, 
      [83] = 
      {
         MiscData = 1, 
         Arg1 = 891, 
         Command = "M", 
         Arg3 = 828, 
         Arg2 = 45, 
      }, 
      [84] = 
      {
         MiscData = 1, 
         Arg1 = 891, 
         Command = "M", 
         Arg3 = 828, 
         Arg2 = 45, 
      }, 
      [85] = 
      {
         MiscData = 1, 
         Arg1 = 891, 
         Command = "M", 
         Arg3 = 828, 
         Arg2 = 45, 
      }, 
      [86] = 
      {
         MiscData = 1, 
         Arg1 = 893, 
         Command = "M", 
         Arg3 = 819, 
         Arg2 = 1, 
      }, 
   }, 
   ResetMessage = "", 
   Author = "Darrik", 
   Name = "Ryloth", 
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
   Filename = "ryloth.lua", 
   Mobiles = 
   {
      [800] = 
      {
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 10, 
         }, 
         Position = "standing", 
         HitChance = 
         {
            HitPlus = 1050, 
            HitSizeDice = 10, 
            HitNoDice = 21, 
         }, 
         ShortDescr = "a twi'lek", 
         Race = "Twi'lek", 
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
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
               [2] = "twileki", 
            }, 
            Speaking = 
            {
               [0] = "basic", 
               [2] = "twileki", 
            }, 
         }, 
         NumberOfAttacks = 0, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         HitRoll = 23, 
         Vnum = 800, 
         Height = 0, 
         DefaultPosition = "standing", 
         DamRoll = 21, 
         Credits = 0, 
         Sex = "undistinguished", 
         Level = 104, 
         AffectedBy = 
         {
            [9] = "Infrared", 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         Name = "twi'lek", 
         Weight = 0, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         LongDescr = "A twi'lek works hard refining ryll here.\
", 
         ArmorClass = -160, 
      }, 
      [801] = 
      {
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 10, 
         }, 
         Position = "standing", 
         HitChance = 
         {
            HitPlus = 1050, 
            HitSizeDice = 10, 
            HitNoDice = 21, 
         }, 
         ShortDescr = "a twi'lek", 
         Race = "Twi'lek", 
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
         Shop = 
         {
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            ProfitBuy = 120, 
            ProfitSell = 90, 
            KeeperShortDescr = "a twi'lek", 
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
         }, 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
               [2] = "twileki", 
            }, 
            Speaking = 
            {
               [2] = "twileki", 
            }, 
         }, 
         NumberOfAttacks = 0, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         HitRoll = 0, 
         Vnum = 801, 
         Height = 0, 
         DefaultPosition = "standing", 
         DamRoll = 0, 
         Credits = 0, 
         Sex = "undistinguished", 
         Level = 104, 
         AffectedBy = 
         {
            [9] = "Infrared", 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [30] = "Prototype", 
         }, 
         Name = "twi'lek", 
         Weight = 0, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         LongDescr = "A twi'lek sells hardware equipment while he works.\
", 
         ArmorClass = -160, 
      }, 
      [802] = 
      {
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 10, 
         }, 
         Position = "standing", 
         HitChance = 
         {
            HitPlus = 1050, 
            HitSizeDice = 10, 
            HitNoDice = 21, 
         }, 
         ShortDescr = "a twi'lek", 
         Race = "Twi'lek", 
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
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
               [2] = "twileki", 
            }, 
            Speaking = 
            {
               [2] = "twileki", 
            }, 
         }, 
         NumberOfAttacks = 0, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         HitRoll = 0, 
         Vnum = 802, 
         Height = 0, 
         DefaultPosition = "standing", 
         DamRoll = 0, 
         Credits = 0, 
         Sex = "undistinguished", 
         Level = 104, 
         AffectedBy = 
         {
            [9] = "Infrared", 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [9] = "Train", 
            [30] = "Prototype", 
         }, 
         Name = "a twi'lek stat trainer", 
         Weight = 0, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         LongDescr = "A twi'lek is here to help develop your abilities\
", 
         ArmorClass = -160, 
      }, 
      [803] = 
      {
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 10, 
         }, 
         Position = "standing", 
         HitChance = 
         {
            HitPlus = 1050, 
            HitSizeDice = 10, 
            HitNoDice = 21, 
         }, 
         ShortDescr = "a twi'lek", 
         Race = "Twi'lek", 
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
         Sex = "undistinguished", 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
               [2] = "twileki", 
            }, 
            Speaking = 
            {
               [2] = "twileki", 
            }, 
         }, 
         NumberOfAttacks = 0, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
            ParaPetri = 0, 
         }, 
         HitRoll = 0, 
         Vnum = 803, 
         Height = 0, 
         DefaultPosition = "standing", 
         DamRoll = 0, 
         Credits = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "speech_prog", 
               Code = "mpecho The Janitor ushers you out as the walls begin to close\
mppurge\
mpecho You are allowed back in after the cycle is complete. \
", 
               Arguments = "compact", 
               ScriptType = "MProg", 
            }, 
            [2] = 
            {
               MudProgType = "rand_prog", 
               Code = "mpecho The janitor ushers you out as the walls begin to close.\
mppurge\
mpecho You are allowed back in after the cycle is complete.\
", 
               Arguments = "25", 
               ScriptType = "MProg", 
            }, 
         }, 
         Level = 104, 
         AffectedBy = 
         {
            [9] = "Infrared", 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         Name = "a twilek janitor", 
         Weight = 0, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         LongDescr = "A twi'lek goes through the trash, preparing for compaction.\
", 
         ArmorClass = -160, 
      }, 
      [899] = 
      {
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 7, 
         }, 
         Position = "standing", 
         HitChance = 
         {
            HitPlus = 700, 
            HitSizeDice = 10, 
            HitNoDice = 14, 
         }, 
         ShortDescr = "Gira'haad the Bartender", 
         Race = "Twi'lek", 
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
         Description = "Gira'haad is a weathered Twi'lek female.  You can tell she has been running\
this cantina for a long time and is fed up with the everyday scum that\
comes here. What keeps that lovely smile on her face?\
", 
         Alignment = 0, 
         Shop = 
         {
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            ProfitBuy = 120, 
            ProfitSell = 50, 
            KeeperShortDescr = "Gira'haad the Bartender", 
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
         }, 
         DamRoll = 14, 
         NumberOfAttacks = 0, 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
               [2] = "twileki", 
            }, 
            Speaking = 
            {
               [0] = "basic", 
               [2] = "twileki", 
            }, 
         }, 
         HitRoll = 14, 
         Vnum = 899, 
         Height = 0, 
         Sex = "female", 
         Immune = 
         {
            [20] = "magic", 
            [11] = "charm", 
         }, 
         Credits = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "bribe_prog", 
               Code = "say ooh, thanks Honey.  Here...\
,reaches down under the counter and rises with a stim of ryll.\
mpoload 32230\
give ryll to $n\
say This'll make you feel real good!\
cackle\
", 
               Arguments = "50", 
               ScriptType = "MProg", 
            }, 
            [2] = 
            {
               MudProgType = "speech_prog", 
               Code = ",looks up from the counter.\
say Hello there, $n.  Can I get you something?  Some alcohol perhaps?\
mpechoat $n Is that Ryll in her cloak pocket?\
", 
               Arguments = "Hi hello hey sup konichiwa shalom aloha hola", 
               ScriptType = "MProg", 
            }, 
            [3] = 
            {
               MudProgType = "act_prog", 
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
               Arguments = "gives", 
               ScriptType = "MProg", 
            }, 
         }, 
         Level = 70, 
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
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [30] = "Prototype", 
         }, 
         Name = "Gira'haad", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "Gira'haad waits to take your order.\
", 
         ArmorClass = -75, 
      }, 
      [898] = 
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
         ShortDescr = "A Twi'lek Banker", 
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
         Alignment = -500, 
         DamRoll = 10, 
         NumberOfAttacks = 0, 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
               [2] = "twileki", 
            }, 
            Speaking = 
            {
               [0] = "basic", 
               [2] = "twileki", 
            }, 
         }, 
         HitRoll = 10, 
         Vnum = 898, 
         Height = 0, 
         Sex = "male", 
         VipFlags = 
         {
            [2] = "Ryloth", 
         }, 
         Credits = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "bribe_prog", 
               Code = "snicker\
say Thanks, Bud.  Your credits are mine now.\
muha\
", 
               Arguments = "1", 
               ScriptType = "MProg", 
            }, 
            [2] = 
            {
               MudProgType = "speech_prog", 
               Code = "say Oh, hello there. \
,peers around nervously.\
evilgrin\
say Care to make a little transaction?\
cough\
", 
               Arguments = "hi hello sup aloha konichiwa shalom hola bonjour utini", 
               ScriptType = "MProg", 
            }, 
            [3] = 
            {
               MudProgType = "speech_prog", 
               Code = "grin\
sat Yes, Ryll is grown here.  I never take it.  I have enough to worry\
about.\
mutter\
", 
               Arguments = "ryll spice", 
               ScriptType = "MProg", 
            }, 
            [4] = 
            {
               MudProgType = "all_greet_prog", 
               Code = "chuckle\
'Hello there.  You got credits?  Give them\
mpecho &Chere'&c\
grin\
", 
               Arguments = "100", 
               ScriptType = "MProg", 
            }, 
         }, 
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
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Name = "A Fat Twi'lek Banker", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A Fat Twi'lek Banker is here smelling credits.\
", 
         ArmorClass = 0, 
      }, 
      [822] = 
      {
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 9, 
         }, 
         Position = "standing", 
         HitChance = 
         {
            HitPlus = 950, 
            HitSizeDice = 10, 
            HitNoDice = 19, 
         }, 
         ShortDescr = "Koh'shak", 
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
         DamRoll = 20, 
         HitRoll = 20, 
         Vnum = 822, 
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
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "act_prog", 
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
               Arguments = "gives", 
               ScriptType = "MProg", 
            }, 
            [2] = 
            {
               MudProgType = "speech_prog", 
               Code = "say I had an odd customer in here the other day.\
emote shakes her head.\
say They asked if I could acquire the queens jewels.\
emote blinks.\
say You're not going to believe which queen.\
say The Queen Mother of Hapes! Ha!\
say I'd pay anyone who got them enormously though.\
", 
               Arguments = "p queen", 
               ScriptType = "MProg", 
            }, 
         }, 
         Level = 95, 
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
            [30] = "Prototype", 
         }, 
         Name = "Koh'shak, starport master", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "Koh'shak, starport master\
", 
         ArmorClass = -137, 
      }, 
      [897] = 
      {
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 7, 
         }, 
         Position = "standing", 
         HitChance = 
         {
            HitPlus = 750, 
            HitSizeDice = 10, 
            HitNoDice = 15, 
         }, 
         ShortDescr = "Triad Armor Repairman", 
         RepairShop = 
         {
            ShopType = 1, 
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
            ProfitFix = 50, 
            KeeperShortDescr = "Triad Armor Repairman", 
            FixTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [0] = "none", 
            }, 
         }, 
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
         HitRoll = 15, 
         Vnum = 897, 
         Height = 0, 
         Sex = "male", 
         Immune = 
         {
            [11] = "charm", 
         }, 
         Credits = 0, 
         DamRoll = 15, 
         Level = 75, 
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
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Name = "Faro the Triad Armor Guy", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "Faro, the Triad Armorer is fixing armor for members\
", 
         ArmorClass = -87, 
      }, 
      [896] = 
      {
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 5, 
         }, 
         Position = "standing", 
         HitChance = 
         {
            HitPlus = 550, 
            HitSizeDice = 10, 
            HitNoDice = 11, 
         }, 
         ShortDescr = "Fal'vira", 
         Race = "Twi'lek", 
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
         DamRoll = 11, 
         HitRoll = 11, 
         Vnum = 896, 
         Height = 0, 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
               [2] = "twileki", 
            }, 
            Speaking = 
            {
               [0] = "basic", 
               [2] = "twileki", 
            }, 
         }, 
         Sex = "male", 
         Credits = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "all_greet_prog", 
               Code = "smile $n\
'Welcome.  Are you wounded?\
exam $n\
'Come relax in my Ryll tank.  Only 100 credits.\
comfort $n\
", 
               Arguments = "100", 
               ScriptType = "MProg", 
            }, 
            [2] = 
            {
               MudProgType = "bribe_prog", 
               Code = "'Oh dear, you are hurt, aren't you?  Well, we'll have you fixed up.\
smile\
,gestures downwards and lowers you into the tank.\
mptransfer $n 812\
", 
               Arguments = "100", 
               ScriptType = "MProg", 
            }, 
            [3] = 
            {
               MudProgType = "speech_prog", 
               Code = "'Yes, it's true.  Some evil Twi'leks have changed the purpose of\
mpecho &Cryll.\
sigh\
'They use it as a drug.  But ryll is meant strictly for\
mpecho &chealing.\
", 
               Arguments = "ryll spice drugs", 
               ScriptType = "MProg", 
            }, 
            [4] = 
            {
               MudProgType = "speech_prog", 
               Code = "'Bacta??\
snort\
'Bacta is for human wimps who must get rid of their pain faster.\
chuckle\
'We Twi'leks are strong enough to only need Ryll to heal our wounds.\
'In fact, using Bacta is seen as a weakness here on Ryloth.\
laugh\
'Bacta...silly tourists...\
", 
               Arguments = "bacta", 
               ScriptType = "MProg", 
            }, 
         }, 
         Level = 55, 
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
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Name = "Fal'vira is renting out RYLL tanks??", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "Fal'vira is renting out RYLL tanks??\
", 
         ArmorClass = -37, 
      }, 
      [889] = 
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
         ShortDescr = "a newly created A Twi'lek Merchant", 
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
         Shop = 
         {
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            ProfitBuy = 120, 
            ProfitSell = 90, 
            KeeperShortDescr = "a newly created A Twi'lek Merchant", 
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
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
         HitRoll = 0, 
         Vnum = 889, 
         Height = 0, 
         Sex = "undistinguished", 
         Immune = 
         {
            [20] = "magic", 
            [11] = "charm", 
         }, 
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
            [25] = "NoKill", 
            [30] = "Prototype", 
         }, 
         Name = "A Twi'lek Merchant", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A Twi'lek Merchant\
", 
         ArmorClass = 0, 
      }, 
      [890] = 
      {
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 2, 
         }, 
         Position = "standing", 
         HitChance = 
         {
            HitPlus = 240, 
            HitSizeDice = 10, 
            HitNoDice = 4, 
         }, 
         ShortDescr = "A Twi'lek Cop", 
         Race = "Human", 
         SpecFuns = 
         {
            [1] = "spec_guardian", 
            [0] = "spec_police_attack", 
         }, 
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
         DamRoll = 4, 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
               [2] = "twileki", 
            }, 
            Speaking = 
            {
               [0] = "basic", 
               [2] = "twileki", 
            }, 
         }, 
         NumberOfAttacks = 0, 
         Sex = "undistinguished", 
         HitRoll = 4, 
         Vnum = 890, 
         Height = 0, 
         VipFlags = 
         {
            [2] = "Ryloth", 
         }, 
         Immune = 
         {
            [11] = "charm", 
         }, 
         Credits = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "fight_prog", 
               Code = "", 
               Arguments = "100", 
               ScriptType = "MProg", 
            }, 
         }, 
         Level = 24, 
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
            [30] = "Prototype", 
         }, 
         Name = "A Twi'lek Police", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A Twi'lek Peace Official is protecting the innocent.\
", 
         ArmorClass = 40, 
      }, 
      [891] = 
      {
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 0, 
         }, 
         Position = "standing", 
         HitChance = 
         {
            HitPlus = 50, 
            HitSizeDice = 10, 
            HitNoDice = 1, 
         }, 
         ShortDescr = "Twi'lek Male", 
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
         Description = "This is your everyday Twi'lek, really.  He stands 2 meters tall, with his\
lekku hanging behind his\
head.\
", 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         Languages = 
         {
            Speaks = 
            {
               [2] = "twileki", 
            }, 
            Speaking = 
            {
               [2] = "twileki", 
            }, 
         }, 
         HitRoll = 1, 
         Vnum = 891, 
         Height = 0, 
         Sex = "undistinguished", 
         VipFlags = 
         {
            [2] = "Ryloth", 
         }, 
         Credits = 0, 
         DamRoll = 1, 
         Level = 5, 
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
         Name = "twi'lek twilek citizen", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A twi'lek moves around Kala'uun on business.\
", 
         ArmorClass = 87, 
      }, 
      [892] = 
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
         ShortDescr = "Kookab'urra", 
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
         Shop = 
         {
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            ProfitBuy = 120, 
            ProfitSell = 90, 
            KeeperShortDescr = "Kookab'urra", 
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
         }, 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
               [2] = "twileki", 
            }, 
            Speaking = 
            {
               [0] = "basic", 
               [2] = "twileki", 
            }, 
         }, 
         NumberOfAttacks = 0, 
         Sex = "undistinguished", 
         HitRoll = 0, 
         Vnum = 892, 
         Height = 0, 
         VipFlags = 
         {
            [2] = "Ryloth", 
         }, 
         Immune = 
         {
            [20] = "magic", 
            [11] = "charm", 
         }, 
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
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [30] = "Prototype", 
         }, 
         Name = "Kookab'urra", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "Kookab'urra is selling comlinks\
", 
         ArmorClass = 0, 
      }, 
      [893] = 
      {
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 6, 
         }, 
         Position = "standing", 
         HitChance = 
         {
            HitPlus = 650, 
            HitSizeDice = 10, 
            HitNoDice = 13, 
         }, 
         ShortDescr = "Sal'mara the Vendor", 
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
         Shop = 
         {
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            ProfitBuy = 120, 
            ProfitSell = 0, 
            KeeperShortDescr = "Sal'mara the Vendor", 
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
         }, 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
               [2] = "twileki", 
            }, 
            Speaking = 
            {
               [0] = "basic", 
               [2] = "twileki", 
            }, 
         }, 
         NumberOfAttacks = 0, 
         Sex = "undistinguished", 
         HitRoll = 13, 
         Vnum = 893, 
         Height = 0, 
         VipFlags = 
         {
            [2] = "Ryloth", 
         }, 
         Immune = 
         {
            [20] = "magic", 
            [11] = "charm", 
         }, 
         Credits = 0, 
         DamRoll = 13, 
         Level = 65, 
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
            [25] = "NoKill", 
            [30] = "Prototype", 
         }, 
         Name = "Sal'mara", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "Sal'mara is here looking to unload some shields\
", 
         ArmorClass = -62, 
      }, 
      [894] = 
      {
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 4, 
         }, 
         Position = "standing", 
         HitChance = 
         {
            HitPlus = 450, 
            HitSizeDice = 10, 
            HitNoDice = 4, 
         }, 
         ShortDescr = "A Twi'lek Junkie", 
         SpecFuns = 
         {
            [0] = "spec_janitor", 
         }, 
         Race = "Human", 
         DamRoll = 11, 
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
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
               [2] = "twileki", 
            }, 
            Speaking = 
            {
               [0] = "basic", 
               [2] = "twileki", 
            }, 
         }, 
         Sex = "male", 
         NumberOfAttacks = 0, 
         VipFlags = 
         {
            [2] = "Ryloth", 
         }, 
         HitRoll = 11, 
         Vnum = 894, 
         Height = 0, 
         DefaultPosition = "standing", 
         AttackFlags = 
         {
            [1] = "claws", 
         }, 
         Credits = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "all_greet_prog", 
               Code = "mpechoat $n &cA Twi'lek Junkie looks at you with utter contempt.\
'Get out of here!  This is our Ryll!\
", 
               Arguments = "100", 
               ScriptType = "MProg", 
            }, 
            [2] = 
            {
               MudProgType = "death_prog", 
               Code = "mpmload 894\
", 
               Arguments = "100", 
               ScriptType = "MProg", 
            }, 
         }, 
         Level = 45, 
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
            [1] = "Sentinel", 
            [0] = "Npc", 
            [5] = "Aggressive", 
            [10] = "Practice", 
         }, 
         Name = "A Twi'lek Junkie", 
         Weight = 0, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         LongDescr = "A Twi'lek Junkie is hoarding Ryll.\
", 
         ArmorClass = -12, 
      }, 
      [895] = 
      {
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 2, 
         }, 
         Position = "standing", 
         HitChance = 
         {
            HitPlus = 250, 
            HitSizeDice = 10, 
            HitNoDice = 5, 
         }, 
         ShortDescr = "Lavar'inaa the cook", 
         Race = "Twi'lek", 
         Shop = 
         {
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            ProfitBuy = 120, 
            ProfitSell = 75, 
            KeeperShortDescr = "Lavar'inaa the cook", 
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
         }, 
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
         DamRoll = 5, 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
               [2] = "twileki", 
            }, 
            Speaking = 
            {
               [0] = "basic", 
               [2] = "twileki", 
            }, 
         }, 
         NumberOfAttacks = 0, 
         Sex = "female", 
         HitRoll = 5, 
         Vnum = 895, 
         Height = 0, 
         VipFlags = 
         {
            [2] = "Ryloth", 
         }, 
         Immune = 
         {
            [20] = "magic", 
            [11] = "charm", 
         }, 
         Credits = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "all_greet_prog", 
               Code = "smile $n\
'Uncle Tam'arr isn't feeling well so I'm watching the cafe today.\
giggle\
'Would you like something to eat?\
flirt $n\
", 
               Arguments = "100", 
               ScriptType = "MProg", 
            }, 
            [2] = 
            {
               MudProgType = "speech_prog", 
               Code = "'Well in that case, pull up a seat.\
mpecho &cLavar'inaa leans on the greasy counter.\
'We got a lot of good stuff\
here.\
giggle\
", 
               Arguments = "yes yeah yup yep oui si sure", 
               ScriptType = "MProg", 
            }, 
            [3] = 
            {
               MudProgType = "speech_prog", 
               Code = "'The food?\
mpecho &cLavar'inaa laughs nervously.\
'Well...they're not exactly Twi'lek delicacies.\
inno $n\
'Listen, Uncle Tam'arr is sick.  This is the best I can do.\
", 
               Arguments = "food", 
               ScriptType = "MProg", 
            }, 
            [4] = 
            {
               MudProgType = "bribe_prog", 
               Code = "mpechoat $n &cLavar'inaa takes your credits.\
'A tip?  Thanks, $n.  You're a doll.\
mpecho &cLavar'inaa puts some credits in her pocket.\
smile $n\
thank $n\
", 
               Arguments = "1", 
               ScriptType = "MProg", 
            }, 
         }, 
         Level = 25, 
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
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
         }, 
         Name = "Lavar'inaa", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "Lavar'inaa is serving Twi'lek delicacies.\
", 
         ArmorClass = 37, 
      }, 
   }, 
}
