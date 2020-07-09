-- kashyyyk
-- Last saved Thursday 09-Jul-2020 23:19:12

AreaEntry
{
   ResetMessage = "The wind blows throw the leaves of the Worshyr trees.", 
   Objects = 
   {
      [28610] = 
      {
         Description = "The corpse of Kueshlin lies here.", 
         Weight = 300, 
         Cost = 0, 
         ActionDescription = "", 
         Layers = 0, 
         ExtraDescriptions = 
         {
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
         ShortDescr = "The corpse of Kueshlin", 
         Vnum = 28610, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ItemType = "trash", 
         Name = "Corpse of Kueshlin", 
      }, 
      [28600] = 
      {
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "wear_prog", 
               Code = "if race($n) != wookiee\
mpechoat $n Only wookiees can handle bowcasters.\
mpechoaround $n $n tries to figure out what to do with a bowcaster.\
mpforce $n remove bowcaster\
endif\
", 
               Arguments = "100", 
            }, 
         }, 
         Description = "A crossbow type weapon has been carelessly left here.", 
         Affects = 
         {
            [1] = 
            {
               Modifier = 1, 
               Location = 18, 
            }, 
            [2] = 
            {
               Modifier = 1, 
               Location = 19, 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Weight = 10, 
         Cost = 4100, 
         ActionDescription = "", 
         Layers = 0, 
         ObjectValues = 
         {
            [1] = 6, 
            [2] = 7, 
            [3] = 9, 
            [4] = 110, 
            [5] = 110, 
            [0] = 12, 
         }, 
         ShortDescr = "a bowcaster", 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         Vnum = 28600, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         ItemType = "weapon", 
         Name = "bowcaster", 
      }, 
      [28601] = 
      {
         Description = "A bowcaster quarrel is here.", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 1, 
         Cost = 50, 
         ActionDescription = "", 
         Layers = 0, 
         ObjectValues = 
         {
            [1] = 500, 
            [2] = 0, 
            [3] = 0, 
            [4] = 100, 
            [5] = 100, 
            [0] = 100, 
         }, 
         ShortDescr = "a quarrel", 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         Vnum = 28601, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ItemType = "bolt", 
         Name = "quarrel", 
      }, 
      [28602] = 
      {
         Description = "A wookiee bandolier has been dropped here.", 
         Affects = 
         {
            [1] = 
            {
               Modifier = 1, 
               Location = 27, 
            }, 
            [2] = 
            {
               Modifier = 8, 
               Location = 27, 
            }, 
            [3] = 
            {
               Modifier = 1, 
               Location = 18, 
            }, 
            [4] = 
            {
               Modifier = -3, 
               Location = 17, 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Weight = 1, 
         Cost = 0, 
         ActionDescription = "", 
         Layers = 32, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         ShortDescr = "a wookiee bandolier", 
         Flags = 
         {
            [19] = "LargeSize", 
            [13] = "Inventory", 
         }, 
         Vnum = 28602, 
         WearFlags = 
         {
            [0] = "Take", 
            [10] = "About", 
         }, 
         ItemType = "container", 
         Name = "bandolier", 
      }, 
      [28603] = 
      {
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "wear_prog", 
               Code = "if race($n) != wookiee\
mpechoat $n Only wookiees can handle this bowcaster!\
mpechoaround $n $n tries to figure out what to do with a bowcster.\
mpforce $n remove bowcaster\
endif\
", 
               Arguments = "100", 
            }, 
         }, 
         Description = "A large and wierd looking bowcaster is lying here.", 
         Affects = 
         {
            [1] = 
            {
               Modifier = 1, 
               Location = 18, 
            }, 
            [2] = 
            {
               Modifier = 1, 
               Location = 19, 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Weight = 10, 
         Cost = 5000, 
         ActionDescription = "", 
         Layers = 0, 
         ObjectValues = 
         {
            [1] = 6, 
            [2] = 8, 
            [3] = 9, 
            [4] = 0, 
            [5] = 0, 
            [0] = 12, 
         }, 
         ShortDescr = "double barreled bowcaster", 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         Vnum = 28603, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         ItemType = "weapon", 
         Name = "dual double barreled bowcaster", 
      }, 
      [28604] = 
      {
         Description = "The seed to a worshyr tree is lying here.", 
         Weight = 1, 
         Cost = 0, 
         ActionDescription = "", 
         Layers = 0, 
         ExtraDescriptions = 
         {
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
         Vnum = 28604, 
         ShortDescr = "a worshyr tree seed", 
         ItemType = "government", 
         Name = "worshyr seed", 
      }, 
      [28605] = 
      {
         Description = "A piece of smoked gundar meat is attracting flies ", 
         Weight = 1, 
         Cost = 20, 
         ActionDescription = "", 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 15, 
         }, 
         ShortDescr = "smoked gundar", 
         Vnum = 28605, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ItemType = "food", 
         Name = "smoked gundar meat", 
      }, 
      [28606] = 
      {
         Description = "A package is here for the wookiee known as Ralra on Kashyyyk.", 
         Weight = 1, 
         Cost = 0, 
         ActionDescription = "", 
         Layers = 0, 
         ExtraDescriptions = 
         {
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
         ShortDescr = "a package addressed to the wookiee Ralra", 
         Vnum = 28606, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ItemType = "container", 
         Name = "package ralra", 
      }, 
      [28607] = 
      {
         Description = "&bA Fountain is hollowed out of a tree trunk here.&R&W", 
         Weight = 1, 
         Cost = 0, 
         ActionDescription = "", 
         Layers = 0, 
         ExtraDescriptions = 
         {
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
         Vnum = 28607, 
         ShortDescr = "&bA Fountain&R&W", 
         ItemType = "fountain", 
         Name = "&bA Fountain&R&W", 
      }, 
   }, 
   ResetFrequency = 20, 
   Author = "Thrawn", 
   Resets = 
   {
      [1] = 
      {
         Arg2 = 13, 
         Arg1 = 28601, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28601, 
      }, 
      [2] = 
      {
         Arg2 = 6, 
         Arg1 = 28604, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28602, 
      }, 
      [3] = 
      {
         Arg2 = 6, 
         Arg1 = 28604, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28602, 
      }, 
      [4] = 
      {
         Arg2 = 6, 
         Arg1 = 28604, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28602, 
      }, 
      [5] = 
      {
         Arg2 = 6, 
         Arg1 = 28604, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28602, 
      }, 
      [6] = 
      {
         Arg2 = 6, 
         Arg1 = 28604, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28602, 
      }, 
      [7] = 
      {
         Arg2 = 6, 
         Arg1 = 28604, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28602, 
      }, 
      [8] = 
      {
         Arg2 = 1, 
         Arg1 = 28602, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28609, 
      }, 
      [9] = 
      {
         Arg2 = 13, 
         Arg1 = 28601, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28610, 
      }, 
      [10] = 
      {
         Arg2 = 12, 
         Arg1 = 28603, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28610, 
      }, 
      [11] = 
      {
         Arg2 = 13, 
         Arg1 = 28601, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28610, 
      }, 
      [12] = 
      {
         Arg2 = 12, 
         Arg1 = 28603, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28610, 
      }, 
      [13] = 
      {
         Arg2 = 13, 
         Arg1 = 28601, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28610, 
      }, 
      [14] = 
      {
         Arg2 = 12, 
         Arg1 = 28603, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28610, 
      }, 
      [15] = 
      {
         Arg2 = 13, 
         Arg1 = 28601, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28610, 
      }, 
      [16] = 
      {
         Arg2 = 12, 
         Arg1 = 28603, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28610, 
      }, 
      [17] = 
      {
         Arg2 = 13, 
         Arg1 = 28601, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28610, 
      }, 
      [18] = 
      {
         Arg2 = 12, 
         Arg1 = 28603, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28610, 
      }, 
      [19] = 
      {
         Arg2 = 13, 
         Arg1 = 28601, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28610, 
      }, 
      [20] = 
      {
         Arg2 = 12, 
         Arg1 = 28603, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28610, 
      }, 
      [21] = 
      {
         Arg2 = 13, 
         Arg1 = 28601, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28611, 
      }, 
      [22] = 
      {
         Arg2 = 12, 
         Arg1 = 28603, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28611, 
      }, 
      [23] = 
      {
         Arg2 = 13, 
         Arg1 = 28601, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28611, 
      }, 
      [24] = 
      {
         Arg2 = 12, 
         Arg1 = 28603, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28611, 
      }, 
      [25] = 
      {
         Arg2 = 13, 
         Arg1 = 28601, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28611, 
      }, 
      [26] = 
      {
         Arg2 = 12, 
         Arg1 = 28603, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28611, 
      }, 
      [27] = 
      {
         Arg2 = 13, 
         Arg1 = 28601, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28611, 
      }, 
      [28] = 
      {
         Arg2 = 12, 
         Arg1 = 28603, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28611, 
      }, 
      [29] = 
      {
         Arg2 = 13, 
         Arg1 = 28601, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28611, 
      }, 
      [30] = 
      {
         Arg2 = 12, 
         Arg1 = 28603, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28611, 
      }, 
      [31] = 
      {
         Arg2 = 13, 
         Arg1 = 28601, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28611, 
      }, 
      [32] = 
      {
         Arg2 = 12, 
         Arg1 = 28603, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28611, 
      }, 
      [33] = 
      {
         Arg2 = 1, 
         Arg1 = 28608, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28615, 
      }, 
      [34] = 
      {
         Arg1 = 305, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [35] = 
      {
         Arg1 = 32261, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [36] = 
      {
         Arg1 = 31522, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [37] = 
      {
         Arg1 = 10314, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [38] = 
      {
         Arg1 = 28605, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [39] = 
      {
         Arg2 = 1, 
         Arg1 = 28600, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28617, 
      }, 
      [40] = 
      {
         Arg1 = 28603, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [41] = 
      {
         Arg1 = 28600, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [42] = 
      {
         Arg1 = 28602, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [43] = 
      {
         Arg1 = 28601, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [44] = 
      {
         Arg2 = 1, 
         Arg1 = 28606, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28629, 
      }, 
      [45] = 
      {
         Arg2 = 1, 
         Arg1 = 28602, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 12, 
      }, 
      [46] = 
      {
         Arg2 = 1, 
         Arg1 = 10424, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 17, 
      }, 
      [47] = 
      {
         Arg1 = 28602, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [48] = 
      {
         Arg2 = 1, 
         Arg1 = 28601, 
         Command = "P", 
         MiscData = 0, 
         Arg3 = 0, 
      }, 
      [49] = 
      {
         Arg2 = 1, 
         Arg1 = 28600, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 16, 
      }, 
      [50] = 
      {
         Arg2 = 1, 
         Arg1 = 28607, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28634, 
      }, 
      [51] = 
      {
         Arg2 = 1, 
         Arg1 = 28602, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 12, 
      }, 
      [52] = 
      {
         Arg2 = 1, 
         Arg1 = 28601, 
         Command = "P", 
         MiscData = 0, 
         Arg3 = 0, 
      }, 
      [53] = 
      {
         Arg2 = 1, 
         Arg1 = 28600, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 16, 
      }, 
      [54] = 
      {
         Arg2 = 1, 
         Arg1 = 32229, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 19, 
      }, 
      [55] = 
      {
         Arg2 = 1, 
         Arg1 = 28605, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28636, 
      }, 
      [56] = 
      {
         Arg2 = 1, 
         Arg1 = 10424, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 17, 
      }, 
      [57] = 
      {
         Arg2 = 1, 
         Arg1 = 28610, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28638, 
      }, 
      [58] = 
      {
         Arg2 = 1, 
         Arg1 = 90, 
         Command = "O", 
         MiscData = 1, 
         Arg3 = 28612, 
      }, 
      [59] = 
      {
         Arg2 = 1, 
         Arg1 = 28607, 
         Command = "O", 
         MiscData = 1, 
         Arg3 = 28619, 
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
   Rooms = 
   {
      [28672] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28671, 
               Direction = "southwest", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28672, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Name = "Floating in a void", 
      }, 
      [28673] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28671, 
               Direction = "northwest", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28673, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Name = "Floating in a void", 
      }, 
      [28674] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28675, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28676, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28677, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28674, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Name = "Floating in a void", 
      }, 
      [28675] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28674, 
               Direction = "south", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28675, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Name = "Floating in a void", 
      }, 
      [28676] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28674, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28676, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Name = "Floating in a void", 
      }, 
      [28677] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28674, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "crack", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28678, 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [19] = "Auto", 
                  [11] = "Hidden", 
                  [7] = "Climb", 
               }, 
               Direction = "somewhere", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28677, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Name = "Floating in a void", 
      }, 
      [28678] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28652, 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [7] = "Climb", 
               }, 
               Direction = "up", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28678, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Name = "Floating in a void", 
      }, 
      [28679] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 28679, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Name = "Floating in a void", 
      }, 
      [28680] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 28680, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Name = "Floating in a void", 
      }, 
      [28681] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 28681, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Name = "Floating in a void", 
      }, 
      [28682] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 28682, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Name = "Floating in a void", 
      }, 
      [28683] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 28683, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Name = "Floating in a void", 
      }, 
      [28684] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 28684, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Name = "Floating in a void", 
      }, 
      [28685] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 28685, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Name = "Floating in a void", 
      }, 
      [28686] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 28686, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Name = "Floating in a void", 
      }, 
      [28687] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 28687, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Name = "Floating in a void", 
      }, 
      [28688] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 28688, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Name = "Floating in a void", 
      }, 
      [28689] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 28689, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Name = "Floating in a void", 
      }, 
      [28690] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 28690, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Name = "Floating in a void", 
      }, 
      [28691] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 28691, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Name = "Floating in a void", 
      }, 
      [28692] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 28692, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Name = "Floating in a void", 
      }, 
      [28693] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 28693, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Name = "Floating in a void", 
      }, 
      [28694] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 28694, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Name = "Floating in a void", 
      }, 
      [28695] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 28695, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Name = "Floating in a void", 
      }, 
      [28696] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 28696, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Name = "Floating in a void", 
      }, 
      [28697] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 28697, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Name = "Floating in a void", 
      }, 
      [28698] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 28698, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Name = "Floating in a void", 
      }, 
      [28699] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 28699, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Name = "Floating in a void", 
      }, 
      [28600] = 
      {
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Code = "mpechoat $n The music soothes you into a light slumber.\
mpforce $n sleep\
mpdream $n You dream of little sheep hopping fences, awwwww!\
feel cure critical $n\
", 
               Arguments = "100", 
            }, 
         }, 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "You are in the northernmost side of Rwookrrorro's nursery ring.  This is\
where  all young Wookiees start thier lives.  Baby Wookiee's are being\
nursed here and slightly larger Wookiee children are sleeping here. You\
also here soothing music being played over an intercom. \
", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28601, 
               Direction = "south", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28600, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Name = "Northern Nursery Ring", 
      }, 
      [28601] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "You are standing in the central nursery ring.  This is where Wookiee\
toddlers are allowed to stumble around.  The floors and walls are padded\
to prevent injury.  Elderly Wookiee ladies are here to comfort the\
toddlers and urge them into walking upright.  All around the room are\
branches which have been bolted into the floor to allow young Wookiees to\
test their climbing ability.  Younger Wookiees rest to the North and Older\
ones perfect their climbing to the South.\
", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28600, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28602, 
               Direction = "south", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28608, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28601, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Name = "Central Nursery Ring", 
      }, 
      [28602] = 
      {
         TeleVnum = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28601, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28604, 
               Direction = "south", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28603, 
               Flags = 
               {
                  [16] = "CanClimb", 
               }, 
               Direction = "up", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "You are standing in the southernmost nursery ring where Wookiee children\
are perfecting their climbing skills.  All around you, small Wookiees are\
climbing the branches which this room has been built around.  They dangle\
from often frightening heights, trusting their instructors to catch them\
should they fall. You can Climb up with the Wookiee children, you can go\
north the the toddler's area, or you can go South to a lift which will\
take you to Rwookrrorro's lower  levels.\
", 
         Vnum = 28602, 
         Name = "Southern Nursery Ring", 
      }, 
      [28603] = 
      {
         TeleVnum = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28602, 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [7] = "Climb", 
               }, 
               Direction = "down", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "You are holding tightly to a high branch above the nursery ring's climbing\
practice area.  All around you Wookiee children hang from branches, well\
most of them hang, a few have already fallen and had to be caught by the\
strong Wookiees standing below.  You just hope you have the strength to\
keep yourself  up.  The only exit is down, to the lower practice area.\
", 
         Vnum = 28603, 
         Name = "Upper level of the Nursery Climbing Area", 
      }, 
      [28604] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "You are in a liftcar at the top level of Rwookrrorro.  This level is\
dedicated to the nursery rings where young Wookiees are nursed and live\
until they can  climb and walk well enough to get around the city\
themselves.  You can exit to  the nursery rings to the north or you can\
ride the lift down.\
", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28602, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28605, 
               Direction = "down", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28604, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Name = "Litfcar", 
      }, 
      [28605] = 
      {
         TeleVnum = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28610, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28604, 
               Direction = "up", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28606, 
               Direction = "down", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "You are in a liftcar at the middle level of Rwookrrorro.  This level is\
primarily residential.  As you look out of the lift you can see many doors\
carved into the main city's wroshyr tree to the west.  You can go North to\
the residential area or ride the liftcar up or down.\
", 
         Vnum = 28605, 
         Name = "Liftcar", 
      }, 
      [28606] = 
      {
         TeleVnum = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28611, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28605, 
               Direction = "up", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28607, 
               Direction = "down", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "You are in a liftcar at the lowest level of the city of Rwookrrorro.  This\
level has a large commercial area as well as a residential area and access\
to the landing pad.  You can exit the liftcar to the east or you can ride\
the liftcar up or down. \
", 
         Vnum = 28606, 
         Name = "Liftcar", 
      }, 
      [28607] = 
      {
         TeleVnum = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28638, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28606, 
               Direction = "up", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "You are in a liftcar below the lowest level of Rwookrrorro.  From here you\
have an amazing view, well two amazing views really.  One below you, into\
the deep green forrests of Kashyyyk. Above you is another amazing sight,\
the underside of the great Wookiee city Rwookrrorro.  The branches of the\
worshyr trees support the city kilometers off the ground.  They form\
spiderweb like patterns  because of their unique bonding properties, when\
two branches meet, they bond and send out more branches in new directions.\
 You can only ride the liftcar up.\
", 
         Vnum = 28607, 
         Name = "Liftcar", 
      }, 
      [28608] = 
      {
         TeleVnum = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28601, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28609, 
               Direction = "south", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "You are standing in the naughty children's corner.  Have you been\
naughty?? Bad little Wookiee children stand here facing the wall.\
As you stare at the wall you notice that the corner didn't actually \
settle down all the bad little children, one scratched something into the\
wall with his claw: it says,\"There once was a man from Corellia.\" The rest\
is too scuffed up to read.  From here you can go east to the Middle Nursery\
ring or south to the classroom.\
", 
         Vnum = 28608, 
         Name = "The \"Corner\"", 
      }, 
      [28609] = 
      {
         TeleVnum = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28608, 
               Direction = "north", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "You stand in the middle of a room filled with chairs.  One wall is\
almost entirely covered by an electronic chalkboard.  This is where\
the young Wookiees are taught to read and write.  Some children run\
around the room playing tag.  A teacher stands at the front of the room\
trying to settle down the children.\
", 
         Vnum = 28609, 
         Name = "The Classroom", 
      }, 
      [28610] = 
      {
         TeleVnum = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28619, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28605, 
               Direction = "south", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "The residential area is, obviously, loaded with houses of the wookiee\
people they are made from the natural material that surrounds the entire\
wookie world whish is wood, and some houses have plasteel windows.\
Wookiees pass you by, not to surprisingly this place is fairly crowded\
with wookiees and the wookiee children running about  seem to be playing a\
game of hide and seak with each other.\
", 
         Vnum = 28610, 
         Name = "Residential Area", 
      }, 
      [28611] = 
      {
         TeleVnum = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28612, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28618, 
               Direction = "south", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28606, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "This place is crawling with wookiees as well as some other forms of beings,\
they seem to be to busy to even notice you getting off the lift car even\
though your pack to the gills with illegal weapons. The wookiee are far to\
interested with thier lives to have to pay any attention to you and your\
petty adventure through their home world. A word of advice, don't get them\
angry. \
", 
         Vnum = 28611, 
         Name = "Commercial Area", 
      }, 
      [28612] = 
      {
         TeleVnum = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28613, 
               Direction = "south", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28611, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "This place is crawling with wookiees as well as some other forms of beings,\
they seem to be to busy to even notice you getting off the lift car even\
though your pack to the gills with illegal weapons. The wookiee are far to\
interested with thier lives to have to pay any attention to you and your\
petty adventure through their home world. A word of advice, don't get them\
angry. \
", 
         Vnum = 28612, 
         Name = "Commercial Area", 
      }, 
      [28613] = 
      {
         TeleVnum = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28612, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28639, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "The landing pad is not to crowded, but it does have the odd technician\
working on ships that are in dire need of repair or tune ups. The place\
has the smell of the forest lingering in it as well as the smell of\
polished metal, coolant, and wet wookiee,  nothing entirely pleasant but\
livable. The walls that partially surround  the pad have the tools that\
the techs use for the repairs as well as some pictures of female wookiees\
in compromising positions. The only way out is back the way you came.\
", 
         Vnum = 28613, 
         Name = "Landing Pad", 
      }, 
      [28614] = 
      {
         TeleVnum = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28616, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28615, 
               Direction = "south", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "This place seems to be crawling with wookiees as well as some other forms\
of beings, they seem to be to busy to even notice you enter the area even\
though you area loaded to the  gills with some of the more sofisticated\
weapons they have seen, besides their bowcasters. The wookiees are far to\
interested with their own lives to have to pay attention to you and your\
petty adventure through their home world. A word of advice, don't get them\
angery. The place is starting to get the smell of some freshly cooked food\
comeing from the south of here.\
", 
         Vnum = 28614, 
         Name = "Commercial Area", 
      }, 
      [28615] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "The shop has a very pleasent odur to it. With the carcuses of freshly\
skined animals packed on ice under the glass counter and some dried foods\
lining the walls you start to hear your stomach rumble with hunger. The\
wookiee behind the glass counter is very large andfor all you know he\
could be packing heat just in case someone like you decided to come in\
here and \"borrow\" some of her goods.\
", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28614, 
               Direction = "north", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28615, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Name = "Delicious Foods and Drinks", 
      }, 
      [28616] = 
      {
         TeleVnum = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28618, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28614, 
               Direction = "south", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28617, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "This place is crawling with wookiees as well as some other forms of beings,\
they seem to be to busy to even notice you getting off the lift car even\
though your pack to the gills with illegal weapons. The wookiee are far to\
interested with thier lives to have to pay any attention to you and your\
petty adventure through their home world. A word of advice, don't get them\
angry.\
", 
         Vnum = 28616, 
         Name = "Commercial Area", 
      }, 
      [28617] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "You stand in the cocked bowcaster, where bowcasters are the specialty and\
they don't come cheap. the walls are lined with many of the wookiee's\
preferd weapon and there are different colours as well as different shapes\
to them as well. The ones that really catch you eyes are the double\
barreled ones they look powerful as well as expensive. The owner has one\
straped onto his waist and has his hand resting  easily on the hair\
trigger. \
", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28616, 
               Direction = "east", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28617, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Name = "The Cocked Bowcaster", 
      }, 
      [28618] = 
      {
         TeleVnum = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28611, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28616, 
               Direction = "south", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "This place is crawling with wookiees as well as some other forms of beings,\
they seem to be to busy to even notice you getting off the lift car even\
though your pack to the gills with illegal weapons. The wookiee are far to\
interested with thier lives to have to pay any attention to you and your\
petty adventure through their home world. A word of advice, don't get them\
angry. \
", 
         Vnum = 28618, 
         Name = "Commercial Area", 
      }, 
      [28619] = 
      {
         TeleVnum = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28625, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28620, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28626, 
               Direction = "south", 
            }, 
            [4] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28610, 
               Direction = "west", 
            }, 
            [5] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28627, 
               Direction = "up", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "The residential area is, obviously, loaded with houses of the wookiee\
people they are made from the natural material that surrounds the entire\
wookie world whish is wood, and some houses have plasteel windows.\
Wookiees pass you by, not to surprisingly this place is fairly crowded\
with wookiees and the wookiee children running about  seem to be playing a\
game of hide and seak with each other. \
", 
         Vnum = 28619, 
         Name = "Residential Area", 
      }, 
      [28620] = 
      {
         TeleVnum = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28622, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28624, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28621, 
               Direction = "south", 
            }, 
            [4] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28619, 
               Direction = "west", 
            }, 
            [5] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28623, 
               Direction = "up", 
            }, 
            [6] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28635, 
               Direction = "southwest", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "The residential area is, obviously, loaded with houses of the wookiee\
people they are made from the natural material that surrounds the entire\
wookie world whish is wood, and some houses have plasteel windows.\
Wookiees pass you by, not to surprisingly this place is fairly crowded\
with wookiees and the wookiee children running about  seem to be playing a\
game of hide and seak with each other. \
", 
         Vnum = 28620, 
         Name = "Residential Area", 
      }, 
      [28621] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "This place has the smell of wookiees in as well as tons of wookiee fur has\
been shed over the funiture, which looks like it can fit a giant due to\
the size of them The place is well lit and has the cool breeze from teh\
open windows blowing through. There are stairs to this house which lead\
up.\
", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28620, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28628, 
               Direction = "up", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28621, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Name = "Worshyr Guests Trees House", 
      }, 
      [28622] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "This place has the smell of wookiees in as well as tons of wookiee fur has\
been shed over the funiture, which looks like it can fit a giant due to\
the size of them The place is well lit and has the cool breeze from teh\
open windows blowing through. There are stairs to this house which lead\
up.\
", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28620, 
               Direction = "south", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28629, 
               Direction = "up", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28622, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Name = "Worshyr Tree House", 
      }, 
      [28623] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "This place has the smell of wookiees in as well as tons of wookiee fur has\
been shed over the funiture, which looks like it can fit a giant due to\
the size of them The place is well lit and has the cool breeze from teh\
open windows blowing through. There are stairs to this house which lead\
up.\
", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28630, 
               Direction = "up", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28620, 
               Direction = "down", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28623, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Name = "Worshyr Tree House", 
      }, 
      [28624] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "This place has the smell of wookiees in as well as tons of wookiee fur has\
been shed over the funiture, which looks like it can fit a giant due to\
the size of them The place is well lit and has the cool breeze from teh\
open windows blowing through. There are stairs to this house which lead\
up.\
", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28620, 
               Direction = "west", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28631, 
               Direction = "up", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28624, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Name = "Worshyr Tree House", 
      }, 
      [28625] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "This place has the smell of wookiees in as well as tons of wookiee fur has\
been shed over the funiture, which looks like it can fit a giant due to\
the size of them The place is well lit and has the cool breeze from teh\
open windows blowing through. There are stairs to this house which lead\
up.\
", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28619, 
               Direction = "south", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28632, 
               Direction = "up", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28625, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Name = "Worshyr Tree House", 
      }, 
      [28626] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "This place has the smell of wookiees in as well as tons of wookiee fur has\
been shed over the funiture, which looks like it can fit a giant due to\
the size of them The place is well lit and has the cool breeze from teh\
open windows blowing through. There are stairs to this house which lead\
up.\
", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28619, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28633, 
               Direction = "up", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28626, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Name = "Worshyr Tree House", 
      }, 
      [28627] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "This place has the smell of wookiees in as well as tons of wookiee fur has\
been shed over the funiture, which looks like it can fit a giant due to\
the size of them The place is well lit and has the cool breeze from teh\
open windows blowing through. There are stairs to this house which lead\
up.\
", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28634, 
               Direction = "up", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28619, 
               Direction = "down", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28627, 
         Flags = 
         {
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         Name = "Worshyr Tree House", 
      }, 
      [28628] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "The room, like downstairs is very well lit from the outside lights. The\
branches from the trees leave haunting shadows on the walls as well as tap\
on the window once in awhile. The room has a large bed that can fit at\
least 6 human sized people comfortabley and probably two wookiees\
comfortably. The bed like the funiture downstairs is covered with shed fur\
but other then that it is made and looks inviting. Other then the bedroom\
funiture the room is empty. \
", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28621, 
               Direction = "down", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28628, 
         Flags = 
         {
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         Name = "Guests room", 
      }, 
      [28629] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "The room, like downstairs is very well lit from the outside lights. The\
branches from the trees leave haunting shadows on the walls as well as tap\
on the window once in awhile. The room has a large bed that can fit at\
least 6 human sized people comfortabley and probably two wookiees\
comfortably. The bed like the funiture downstairs is covered with shed fur\
but other then that it is made and looks inviting. Other then the bedroom\
funiture the room is empty.\
", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28622, 
               Direction = "down", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28629, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Name = "Upstairs Room", 
      }, 
      [28630] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28623, 
               Direction = "down", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28630, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Name = "An Empty Home", 
      }, 
      [28631] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28624, 
               Direction = "down", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28631, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Name = "An Empty Home", 
      }, 
      [28632] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28625, 
               Direction = "down", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28632, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Name = "An Empty Home", 
      }, 
      [28633] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Sector = "inside", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28626, 
               Direction = "down", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28633, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Name = "An Empty Home", 
      }, 
      [28634] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "The room, like downstairs is very well lit from the outside lights. The\
branches from the trees leave haunting shadows on the walls as well as tap\
on the window once in awhile. The room has a large bed that can fit at\
least 6 human sized people comfortabley and probably two wookiees\
comfortably. The bed like the funiture downstairs is covered with shed fur\
but other then that it is made and looks inviting. Other then the bedroom\
funiture the room is empty. \
", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28627, 
               Direction = "down", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28634, 
         Flags = 
         {
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         Name = "Upstairs Room", 
      }, 
      [28635] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "This place has the smell of wookiees in as well as tons of wookiee fur has\
been shed over the funiture, which looks like it can fit a giant due to\
the size of them The place is well lit and has the cool breeze from teh\
open windows blowing through. There are stairs to this house which lead\
up.\
", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28636, 
               Direction = "up", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28620, 
               Direction = "northeast", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28635, 
         Flags = 
         {
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         Name = "Worshyr Tree House", 
      }, 
      [28636] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "This place has the smell of wookiees in as well as tons of wookiee fur has\
been shed over the funiture, which looks like it can fit a giant due to\
the size of them The place is well lit and has the cool breeze from teh\
open windows blowing through. There are stairs to this house which lead\
up.\
", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28635, 
               Direction = "down", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28636, 
         Flags = 
         {
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         Name = "Upstairs Room", 
      }, 
      [28637] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "You have been placed into a Kashyyk Prison Net. The rope is created from a\
a laser and blaster proof twine. Unfortunetly there seems to be no way\
down from these traps. As you glance across the horizon you notice that\
Kashyyyk is an incredibly attractive planet. To bad (unless you find\
someone to let you down) you will spend the rest of your life here.\
", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28638, 
               Flags = 
               {
                  [21] = "Searchable", 
                  [11] = "Hidden", 
               }, 
               Direction = "down", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28637, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Name = "Prison Net", 
      }, 
      [28638] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "You are standing on tree branches that have grown years and years toghther\
to create a rather strong branch floor. As you look up you can see a small\
rope prison left here apparently by the ruling force here.\
", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28607, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28638, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Name = "Tree Branch Covering", 
      }, 
      [28639] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28613, 
               Direction = "east", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28639, 
         Flags = 
         {
            [4] = "CanLand", 
            [5] = "CanFly", 
         }, 
         Name = "Landing Pad", 
      }, 
      [28640] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28641, 
               Direction = "east", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28640, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Name = "Floating in a void", 
      }, 
      [28641] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28640, 
               Direction = "west", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28642, 
               Direction = "northeast", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28641, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Name = "Floating in a void", 
      }, 
      [28642] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28643, 
               Direction = "south", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28646, 
               Direction = "northeast", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28641, 
               Direction = "southwest", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28642, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Name = "Floating in a void", 
      }, 
      [28643] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28642, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28644, 
               Direction = "southwest", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28643, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Name = "Floating in a void", 
      }, 
      [28644] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28645, 
               Direction = "west", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28643, 
               Direction = "northeast", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28644, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Name = "Floating in a void", 
      }, 
      [28645] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28644, 
               Direction = "east", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28645, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Name = "Floating in a void", 
      }, 
      [28646] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28647, 
               Direction = "southeast", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28642, 
               Direction = "southwest", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28646, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Name = "Floating in a void", 
      }, 
      [28647] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28648, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28662, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28655, 
               Direction = "south", 
            }, 
            [4] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28646, 
               Direction = "northwest", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28647, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Name = "Floating in a void", 
      }, 
      [28648] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28649, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28647, 
               Direction = "south", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28651, 
               Direction = "northeast", 
            }, 
            [4] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28652, 
               Direction = "northwest", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28648, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Name = "Floating in a void", 
      }, 
      [28649] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28650, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28648, 
               Direction = "south", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28674, 
               Direction = "down", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28649, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Name = "Floating in a void", 
      }, 
      [28650] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28654, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28649, 
               Direction = "south", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28653, 
               Direction = "west", 
            }, 
            [4] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28651, 
               Direction = "southeast", 
            }, 
            [5] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28652, 
               Direction = "southwest", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28650, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Name = "Floating in a void", 
      }, 
      [28651] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28650, 
               Direction = "northwest", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28648, 
               Direction = "southwest", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28651, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Name = "Floating in a void", 
      }, 
      [28652] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28650, 
               Direction = "northeast", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28648, 
               Direction = "southeast", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28652, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Name = "Floating in a void", 
      }, 
      [28653] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28650, 
               Direction = "east", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28653, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Name = "Floating in a void", 
      }, 
      [28654] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28650, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28654, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Name = "Floating in a void", 
      }, 
      [28655] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28647, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28661, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28659, 
               Direction = "south", 
            }, 
            [4] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28656, 
               Direction = "northwest", 
            }, 
            [5] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28660, 
               Direction = "southeast", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28655, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Name = "Floating in a void", 
      }, 
      [28656] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28657, 
               Direction = "south", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28655, 
               Direction = "southeast", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28656, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Name = "Floating in a void", 
      }, 
      [28657] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28656, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28658, 
               Direction = "south", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28657, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Name = "Floating in a void", 
      }, 
      [28658] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28657, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28659, 
               Direction = "east", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28658, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Name = "Floating in a void", 
      }, 
      [28659] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28655, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28660, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28658, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28659, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Name = "Floating in a void", 
      }, 
      [28660] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28661, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28659, 
               Direction = "west", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28655, 
               Direction = "northwest", 
            }, 
            [4] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28662, 
               Direction = "southwest", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28660, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Name = "Floating in a void", 
      }, 
      [28661] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28660, 
               Direction = "south", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28655, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28661, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Name = "Floating in a void", 
      }, 
      [28662] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28663, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28647, 
               Direction = "west", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28660, 
               Direction = "northeast", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28662, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Name = "Floating in a void", 
      }, 
      [28663] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28664, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28662, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28663, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Name = "Floating in a void", 
      }, 
      [28664] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28668, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28671, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28665, 
               Direction = "south", 
            }, 
            [4] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28663, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28664, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Name = "Floating in a void", 
      }, 
      [28665] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28664, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28666, 
               Direction = "south", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28667, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28665, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Name = "Floating in a void", 
      }, 
      [28666] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28665, 
               Direction = "north", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28666, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Name = "Floating in a void", 
      }, 
      [28667] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28665, 
               Direction = "east", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28667, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Name = "Floating in a void", 
      }, 
      [28668] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28669, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28664, 
               Direction = "south", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28670, 
               Direction = "northeast", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28668, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Name = "Floating in a void", 
      }, 
      [28669] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28668, 
               Direction = "south", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28669, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Name = "Floating in a void", 
      }, 
      [28670] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28668, 
               Direction = "southwest", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28670, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Name = "Floating in a void", 
      }, 
      [28671] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28664, 
               Direction = "west", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28672, 
               Direction = "northeast", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28673, 
               Direction = "southeast", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28671, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Name = "Floating in a void", 
      }, 
   }, 
   Mobiles = 
   {
      [28608] = 
      {
         HitRoll = 4, 
         Description = "", 
         Immune = 
         {
            [20] = "magic", 
            [11] = "charm", 
         }, 
         Level = 40, 
         Credits = 200, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Shop = 
         {
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            ProfitBuy = 120, 
            ProfitSell = 90, 
            KeeperShortDescr = "a female wookiee", 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
         }, 
         Vnum = 28608, 
         DefaultPosition = "standing", 
         ShortDescr = "a female wookiee", 
         Stats = 
         {
            Strength = 10, 
            Dexterity = 10, 
            Intelligence = 10, 
            Charisma = 10, 
            Force = 0, 
            Luck = 10, 
            Constitution = 10, 
            Wisdom = 10, 
         }, 
         Weight = 0, 
         Race = "Wookiee", 
         HitChance = 
         {
            HitNoDice = 8, 
            HitSizeDice = 10, 
            HitPlus = 400, 
         }, 
         NumberOfAttacks = 0, 
         LongDescr = "A wookiee female minds the shop.\
", 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 5, 
            DamSizeDice = 4, 
         }, 
         VipFlags = 
         {
            [1] = "Kashyyyk", 
         }, 
         Position = "standing", 
         Sex = "male", 
         DamRoll = 4, 
         Height = 0, 
         Alignment = 0, 
         Languages = 
         {
            Speaking = 
            {
               [1] = "shyriiwook", 
            }, 
            Speaks = 
            {
               [1] = "shyriiwook", 
               [0] = "basic", 
            }, 
         }, 
         ArmorClass = 20, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
         }, 
         Name = "female wookiee shop owner", 
      }, 
      [28610] = 
      {
         HitRoll = 21, 
         Description = "", 
         Level = 105, 
         Credits = 0, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "death_prog", 
               Code = "mpmload 329\
mpforce mobslave mpoload 28610\
mpforce mobslave drop all\
mppurge mobslav\
", 
               Arguments = "100", 
            }, 
         }, 
         ShortDescr = "Kueshlin", 
         Vnum = 28610, 
         DefaultPosition = "standing", 
         Stats = 
         {
            Strength = 10, 
            Dexterity = 10, 
            Intelligence = 10, 
            Charisma = 10, 
            Force = 0, 
            Luck = 10, 
            Constitution = 10, 
            Wisdom = 10, 
         }, 
         Resistant = 
         {
            [5] = "pierce", 
            [6] = "slash", 
            [11] = "charm", 
         }, 
         AttackFlags = 
         {
            [1] = "claws", 
            [4] = "punch", 
            [5] = "kick", 
            [0] = "bite", 
         }, 
         Race = "Wookiee", 
         HitChance = 
         {
            HitNoDice = 21, 
            HitSizeDice = 10, 
            HitPlus = 1050, 
         }, 
         NumberOfAttacks = 2, 
         LongDescr = "A fierce wookie lurks near the tree trunk.\
", 
         Damage = 
         {
            DamPlus = 2, 
            DamNoDice = 10, 
            DamSizeDice = 4, 
         }, 
         Weight = 0, 
         Position = "standing", 
         Sex = "undistinguished", 
         DamRoll = 21, 
         Height = 0, 
         Alignment = 0, 
         Languages = 
         {
            Speaking = 
            {
               [1] = "shyriiwook", 
            }, 
            Speaks = 
            {
               [1] = "shyriiwook", 
               [0] = "basic", 
            }, 
         }, 
         ArmorClass = -162, 
         Flags = 
         {
            [0] = "Npc", 
            [27] = "NoCorpse", 
         }, 
         Name = "Kueshlin", 
      }, 
      [28600] = 
      {
         HitRoll = 8, 
         Description = "", 
         Immune = 
         {
            [20] = "magic", 
            [11] = "charm", 
         }, 
         Level = 40, 
         Credits = 200, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Shop = 
         {
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            ProfitBuy = 120, 
            ProfitSell = 90, 
            KeeperShortDescr = "a wookiee shop owner", 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
         }, 
         Vnum = 28600, 
         DefaultPosition = "standing", 
         ShortDescr = "a wookiee shop owner", 
         Stats = 
         {
            Strength = 10, 
            Dexterity = 10, 
            Intelligence = 10, 
            Charisma = 10, 
            Force = 0, 
            Luck = 10, 
            Constitution = 10, 
            Wisdom = 10, 
         }, 
         Weight = 0, 
         Race = "Wookiee", 
         HitChance = 
         {
            HitNoDice = 8, 
            HitSizeDice = 10, 
            HitPlus = 400, 
         }, 
         NumberOfAttacks = 0, 
         LongDescr = "A rather large wookiee is behind the counter here.\
", 
         Damage = 
         {
            DamPlus = 2, 
            DamNoDice = 5, 
            DamSizeDice = 4, 
         }, 
         VipFlags = 
         {
            [1] = "Kashyyyk", 
         }, 
         Position = "standing", 
         Sex = "male", 
         DamRoll = 8, 
         Height = 0, 
         Alignment = 0, 
         Languages = 
         {
            Speaking = 
            {
               [1] = "shyriiwook", 
               [0] = "basic", 
            }, 
            Speaks = 
            {
               [1] = "shyriiwook", 
            }, 
         }, 
         ArmorClass = 20, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
         }, 
         Name = "Wookiee shop owner", 
      }, 
      [28601] = 
      {
         HitRoll = 0, 
         Description = "", 
         Level = 10, 
         Credits = 20, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Vnum = 28601, 
         DefaultPosition = "standing", 
         ShortDescr = "a female wookiee ", 
         Stats = 
         {
            Strength = 10, 
            Dexterity = 10, 
            Intelligence = 10, 
            Charisma = 10, 
            Force = 0, 
            Luck = 10, 
            Constitution = 10, 
            Wisdom = 10, 
         }, 
         Weight = 0, 
         Race = "Wookiee", 
         HitChance = 
         {
            HitNoDice = 2, 
            HitSizeDice = 10, 
            HitPlus = 120, 
         }, 
         NumberOfAttacks = 0, 
         LongDescr = "A female wookiee is walking around.\
", 
         Damage = 
         {
            DamPlus = 2, 
            DamNoDice = 1, 
            DamSizeDice = 4, 
         }, 
         VipFlags = 
         {
            [1] = "Kashyyyk", 
         }, 
         Position = "standing", 
         Sex = "undistinguished", 
         DamRoll = 2, 
         Height = 0, 
         Alignment = 0, 
         Languages = 
         {
            Speaking = 
            {
               [1] = "shyriiwook", 
            }, 
            Speaks = 
            {
               [1] = "shyriiwook", 
            }, 
         }, 
         ArmorClass = 67, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Name = "wookiee female", 
      }, 
      [28602] = 
      {
         HitRoll = 0, 
         Description = "", 
         Level = 50, 
         Credits = 0, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "all_greet_prog", 
               Code = "if race($n) == wookiee\
say Hello $n, Are you ready for your lessons?\
else\
say I'm sorry $n I only teach my people\
endif\
", 
               Arguments = "100", 
            }, 
         }, 
         Vnum = 28602, 
         DefaultPosition = "standing", 
         ShortDescr = "A Wookiee Teacher", 
         Stats = 
         {
            Strength = 10, 
            Dexterity = 10, 
            Intelligence = 10, 
            Charisma = 10, 
            Force = 0, 
            Luck = 10, 
            Constitution = 10, 
            Wisdom = 10, 
         }, 
         Weight = 0, 
         Race = "Wookiee", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         NumberOfAttacks = 0, 
         LongDescr = "A teacher stands here trying to make the rowdy children learn something.\
", 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
         VipFlags = 
         {
            [1] = "Kashyyyk", 
         }, 
         Position = "standing", 
         Sex = "female", 
         DamRoll = 0, 
         Height = 0, 
         Alignment = 0, 
         Languages = 
         {
            Speaking = 
            {
               [1] = "shyriiwook", 
            }, 
            Speaks = 
            {
               [1] = "shyriiwook", 
               [0] = "basic", 
            }, 
         }, 
         ArmorClass = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [10] = "Practice", 
         }, 
         Name = "A Wookiee Teacher", 
      }, 
      [28603] = 
      {
         HitRoll = 0, 
         Description = "", 
         Level = 10, 
         Credits = 20, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Vnum = 28603, 
         DefaultPosition = "standing", 
         ShortDescr = "a wookiee male", 
         Stats = 
         {
            Strength = 10, 
            Dexterity = 10, 
            Intelligence = 10, 
            Charisma = 10, 
            Force = 0, 
            Luck = 10, 
            Constitution = 10, 
            Wisdom = 10, 
         }, 
         Weight = 0, 
         Race = "Wookiee", 
         HitChance = 
         {
            HitNoDice = 2, 
            HitSizeDice = 10, 
            HitPlus = 120, 
         }, 
         NumberOfAttacks = 0, 
         LongDescr = "A wookiee male is looking around here.\
", 
         Damage = 
         {
            DamPlus = 2, 
            DamNoDice = 1, 
            DamSizeDice = 4, 
         }, 
         VipFlags = 
         {
            [1] = "Kashyyyk", 
         }, 
         Position = "standing", 
         Sex = "undistinguished", 
         DamRoll = 0, 
         Height = 0, 
         Alignment = 0, 
         Languages = 
         {
            Speaking = 
            {
               [1] = "shyriiwook", 
            }, 
            Speaks = 
            {
               [1] = "shyriiwook", 
            }, 
         }, 
         ArmorClass = 67, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Name = "wookiee male", 
      }, 
      [28604] = 
      {
         HitRoll = 0, 
         Description = "", 
         Level = 1, 
         Credits = 0, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Vnum = 28604, 
         DefaultPosition = "standing", 
         ShortDescr = "a wookiee child", 
         Stats = 
         {
            Strength = 10, 
            Dexterity = 10, 
            Intelligence = 10, 
            Charisma = 10, 
            Force = 0, 
            Luck = 10, 
            Constitution = 10, 
            Wisdom = 10, 
         }, 
         Weight = 0, 
         Race = "Wookiee", 
         HitChance = 
         {
            HitNoDice = 1, 
            HitSizeDice = 1, 
            HitPlus = 30, 
         }, 
         NumberOfAttacks = 1, 
         LongDescr = "A wookiee child is playing around here.\
", 
         Damage = 
         {
            DamPlus = 3, 
            DamNoDice = 1, 
            DamSizeDice = 3, 
         }, 
         VipFlags = 
         {
            [1] = "Kashyyyk", 
         }, 
         Position = "standing", 
         Sex = "male", 
         DamRoll = 0, 
         Height = 0, 
         Alignment = 0, 
         Languages = 
         {
            Speaking = 
            {
               [1] = "shyriiwook", 
            }, 
            Speaks = 
            {
               [1] = "shyriiwook", 
               [0] = "basic", 
            }, 
         }, 
         ArmorClass = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [7] = "Wimpy", 
         }, 
         Name = "wookiee child", 
      }, 
      [28605] = 
      {
         HitRoll = 18, 
         Description = "", 
         Level = 90, 
         Credits = 450, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "death_prog", 
               Code = "mpecho Ralra clasps his chest as he falls to the ground.\
mpecho As he hits the ground something rolls out from his open hand\
mpoload 28604\
", 
               Arguments = "100", 
            }, 
            [2] = 
            {
               MudProgType = "act_prog", 
               Code = "if ovnuminv(28606) >= 1\
say Thank you.\
mpwithdraw 2500\
give 2500 credits $n\
drop 2500 credits\
mpgain $n 6 100000\
else\
say Hmmm... Thanks, but this isn't addressed to me.\
drop all\
endif\
mpat 10299 drop all\
mpat 10299 mppurge\
", 
               Arguments = "package", 
            }, 
         }, 
         Vnum = 28605, 
         DefaultPosition = "standing", 
         ShortDescr = "Ralra", 
         Stats = 
         {
            Strength = 10, 
            Dexterity = 10, 
            Intelligence = 10, 
            Charisma = 10, 
            Force = 0, 
            Luck = 10, 
            Constitution = 10, 
            Wisdom = 10, 
         }, 
         Weight = 0, 
         Race = "Wookiee", 
         HitChance = 
         {
            HitNoDice = 18, 
            HitSizeDice = 10, 
            HitPlus = 900, 
         }, 
         NumberOfAttacks = 0, 
         LongDescr = "The wookiee Ralra is here.\
", 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 11, 
            DamSizeDice = 4, 
         }, 
         VipFlags = 
         {
            [1] = "Kashyyyk", 
         }, 
         Position = "standing", 
         Sex = "male", 
         DamRoll = 17, 
         Height = 0, 
         Alignment = 0, 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
            }, 
            Speaks = 
            {
               [1] = "shyriiwook", 
               [0] = "basic", 
            }, 
         }, 
         ArmorClass = -125, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         Name = "Ralra", 
      }, 
      [28606] = 
      {
         HitRoll = 0, 
         Description = "", 
         Level = 90, 
         Credits = 420, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Vnum = 28606, 
         DefaultPosition = "standing", 
         ShortDescr = "Rwookrrorro", 
         Stats = 
         {
            Strength = 10, 
            Dexterity = 10, 
            Intelligence = 10, 
            Charisma = 10, 
            Force = 0, 
            Luck = 10, 
            Constitution = 10, 
            Wisdom = 10, 
         }, 
         Weight = 0, 
         Race = "Wookiee", 
         HitChance = 
         {
            HitNoDice = 18, 
            HitSizeDice = 10, 
            HitPlus = 900, 
         }, 
         NumberOfAttacks = 0, 
         LongDescr = "The wookiee Rwookrrorro is sitting here.\
", 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 11, 
            DamSizeDice = 4, 
         }, 
         VipFlags = 
         {
            [1] = "Kashyyyk", 
         }, 
         Position = "standing", 
         Sex = "male", 
         DamRoll = 0, 
         Height = 0, 
         Alignment = 0, 
         Languages = 
         {
            Speaking = 
            {
               [1] = "shyriiwook", 
            }, 
            Speaks = 
            {
               [1] = "shyriiwook", 
            }, 
         }, 
         ArmorClass = -76, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Name = "Rwookrrorro", 
      }, 
      [28607] = 
      {
         HitRoll = 18, 
         Description = "", 
         Level = 90, 
         Credits = 420, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Vnum = 28607, 
         DefaultPosition = "standing", 
         ShortDescr = "Chenlembec", 
         Stats = 
         {
            Strength = 10, 
            Dexterity = 10, 
            Intelligence = 10, 
            Charisma = 10, 
            Force = 0, 
            Luck = 10, 
            Constitution = 10, 
            Wisdom = 10, 
         }, 
         Weight = 0, 
         Race = "Wookiee", 
         HitChance = 
         {
            HitNoDice = 18, 
            HitSizeDice = 10, 
            HitPlus = 900, 
         }, 
         NumberOfAttacks = 0, 
         LongDescr = "Chenlembec is standing here.\
", 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 11, 
            DamSizeDice = 4, 
         }, 
         VipFlags = 
         {
            [1] = "Kashyyyk", 
         }, 
         Position = "standing", 
         Sex = "male", 
         DamRoll = 17, 
         Height = 0, 
         Alignment = 0, 
         Languages = 
         {
            Speaking = 
            {
               [1] = "shyriiwook", 
            }, 
            Speaks = 
            {
               [1] = "shyriiwook", 
            }, 
         }, 
         ArmorClass = -76, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Name = "Chenlembec", 
      }, 
   }, 
   VnumRanges = 
   {
      Object = 
      {
         First = 28600, 
         Last = 28610, 
      }, 
      Room = 
      {
         First = 28600, 
         Last = 28699, 
      }, 
      Mob = 
      {
         First = 28600, 
         Last = 28610, 
      }, 
   }, 
   HighEconomy = 0, 
   FileFormatVersion = 1, 
   LowEconomy = 120907678, 
   Filename = "kashyyyk.lua", 
   Name = "kashyyyk", 
}
