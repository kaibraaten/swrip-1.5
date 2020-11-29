-- kashyyyk
-- Last saved Thursday 26-Nov-2020 15:24:24

AreaEntry
{
   HighEconomy = 0, 
   Objects = 
   {
      [28610] = 
      {
         Layers = 0, 
         Description = "The corpse of Kueshlin lies here.", 
         ShortDescr = "The corpse of Kueshlin", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ItemType = "trash", 
         Weight = 300, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Vnum = 28610, 
         ActionDescription = "", 
         Tag = "", 
         Name = "Corpse of Kueshlin", 
      }, 
      [28600] = 
      {
         Layers = 0, 
         Description = "A crossbow type weapon has been carelessly left here.", 
         ShortDescr = "a bowcaster", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "wear_prog", 
               Arguments = "100", 
               Code = "if race($n) != wookiee\
mpechoat $n Only wookiees can handle bowcasters.\
mpechoaround $n $n tries to figure out what to do with a bowcaster.\
mpforce $n remove bowcaster\
endif\
", 
               ScriptType = "MProg", 
            }, 
         }, 
         Cost = 4100, 
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
         ItemType = "weapon", 
         Weight = 10, 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         ObjectValues = 
         {
            [1] = 6, 
            [2] = 7, 
            [3] = 9, 
            [4] = 110, 
            [5] = 110, 
            [0] = 12, 
         }, 
         Vnum = 28600, 
         ActionDescription = "", 
         Tag = "", 
         Name = "bowcaster", 
      }, 
      [28601] = 
      {
         Layers = 0, 
         Description = "A bowcaster quarrel is here.", 
         ShortDescr = "a quarrel", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 50, 
         ItemType = "bolt", 
         Weight = 1, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         ObjectValues = 
         {
            [1] = 500, 
            [2] = 0, 
            [3] = 0, 
            [4] = 100, 
            [5] = 100, 
            [0] = 100, 
         }, 
         Vnum = 28601, 
         ActionDescription = "", 
         Tag = "", 
         Name = "quarrel", 
      }, 
      [28602] = 
      {
         Layers = 32, 
         Description = "A wookiee bandolier has been dropped here.", 
         ShortDescr = "a wookiee bandolier", 
         WearFlags = 
         {
            [0] = "Take", 
            [10] = "About", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
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
         ItemType = "container", 
         Weight = 1, 
         Flags = 
         {
            [19] = "LargeSize", 
            [13] = "Inventory", 
         }, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         Vnum = 28602, 
         ActionDescription = "", 
         Tag = "", 
         Name = "bandolier", 
      }, 
      [28603] = 
      {
         Layers = 0, 
         Description = "A large and wierd looking bowcaster is lying here.", 
         ShortDescr = "double barreled bowcaster", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "wear_prog", 
               Arguments = "100", 
               Code = "if race($n) != wookiee\
mpechoat $n Only wookiees can handle this bowcaster!\
mpechoaround $n $n tries to figure out what to do with a bowcster.\
mpforce $n remove bowcaster\
endif\
", 
               ScriptType = "MProg", 
            }, 
         }, 
         Cost = 5000, 
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
         ItemType = "weapon", 
         Weight = 10, 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         ObjectValues = 
         {
            [1] = 6, 
            [2] = 8, 
            [3] = 9, 
            [4] = 0, 
            [5] = 0, 
            [0] = 12, 
         }, 
         Vnum = 28603, 
         ActionDescription = "", 
         Tag = "", 
         Name = "dual double barreled bowcaster", 
      }, 
      [28604] = 
      {
         Layers = 0, 
         Description = "The seed to a worshyr tree is lying here.", 
         ShortDescr = "a worshyr tree seed", 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ItemType = "government", 
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
         ActionDescription = "", 
         Tag = "", 
         Name = "worshyr seed", 
      }, 
      [28605] = 
      {
         Layers = 0, 
         Description = "A piece of smoked gundar meat is attracting flies ", 
         ShortDescr = "smoked gundar", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 20, 
         ItemType = "food", 
         Weight = 1, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 15, 
         }, 
         Vnum = 28605, 
         ActionDescription = "", 
         Tag = "", 
         Name = "smoked gundar meat", 
      }, 
      [28606] = 
      {
         Layers = 0, 
         Description = "A package is here for the wookiee known as Ralra on Kashyyyk.", 
         ShortDescr = "a package addressed to the wookiee Ralra", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ItemType = "container", 
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
         Vnum = 28606, 
         ActionDescription = "", 
         Tag = "", 
         Name = "package ralra", 
      }, 
      [28607] = 
      {
         Layers = 0, 
         Description = "&bA Fountain is hollowed out of a tree trunk here.&R&W", 
         ShortDescr = "&bA Fountain&R&W", 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ItemType = "fountain", 
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
         ActionDescription = "", 
         Tag = "", 
         Name = "&bA Fountain&R&W", 
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
         Last = 28610, 
         First = 28600, 
      }, 
      Mob = 
      {
         Last = 28610, 
         First = 28600, 
      }, 
      Room = 
      {
         Last = 28699, 
         First = 28600, 
      }, 
   }, 
   ResetMessage = "The wind blows throw the leaves of the Worshyr trees.", 
   ResetFrequency = 20, 
   Resets = 
   {
      [1] = 
      {
         Arg3 = 28601, 
         Arg1 = 28601, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 13, 
      }, 
      [2] = 
      {
         Arg3 = 28602, 
         Arg1 = 28604, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 6, 
      }, 
      [3] = 
      {
         Arg3 = 28602, 
         Arg1 = 28604, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 6, 
      }, 
      [4] = 
      {
         Arg3 = 28602, 
         Arg1 = 28604, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 6, 
      }, 
      [5] = 
      {
         Arg3 = 28602, 
         Arg1 = 28604, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 6, 
      }, 
      [6] = 
      {
         Arg3 = 28602, 
         Arg1 = 28604, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 6, 
      }, 
      [7] = 
      {
         Arg3 = 28602, 
         Arg1 = 28604, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 6, 
      }, 
      [8] = 
      {
         Arg3 = 28609, 
         Arg1 = 28602, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [9] = 
      {
         Arg3 = 28610, 
         Arg1 = 28601, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 13, 
      }, 
      [10] = 
      {
         Arg3 = 28610, 
         Arg1 = 28603, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 12, 
      }, 
      [11] = 
      {
         Arg3 = 28610, 
         Arg1 = 28601, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 13, 
      }, 
      [12] = 
      {
         Arg3 = 28610, 
         Arg1 = 28603, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 12, 
      }, 
      [13] = 
      {
         Arg3 = 28610, 
         Arg1 = 28601, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 13, 
      }, 
      [14] = 
      {
         Arg3 = 28610, 
         Arg1 = 28603, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 12, 
      }, 
      [15] = 
      {
         Arg3 = 28610, 
         Arg1 = 28601, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 13, 
      }, 
      [16] = 
      {
         Arg3 = 28610, 
         Arg1 = 28603, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 12, 
      }, 
      [17] = 
      {
         Arg3 = 28610, 
         Arg1 = 28601, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 13, 
      }, 
      [18] = 
      {
         Arg3 = 28610, 
         Arg1 = 28603, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 12, 
      }, 
      [19] = 
      {
         Arg3 = 28610, 
         Arg1 = 28601, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 13, 
      }, 
      [20] = 
      {
         Arg3 = 28610, 
         Arg1 = 28603, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 12, 
      }, 
      [21] = 
      {
         Arg3 = 28611, 
         Arg1 = 28601, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 13, 
      }, 
      [22] = 
      {
         Arg3 = 28611, 
         Arg1 = 28603, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 12, 
      }, 
      [23] = 
      {
         Arg3 = 28611, 
         Arg1 = 28601, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 13, 
      }, 
      [24] = 
      {
         Arg3 = 28611, 
         Arg1 = 28603, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 12, 
      }, 
      [25] = 
      {
         Arg3 = 28611, 
         Arg1 = 28601, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 13, 
      }, 
      [26] = 
      {
         Arg3 = 28611, 
         Arg1 = 28603, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 12, 
      }, 
      [27] = 
      {
         Arg3 = 28611, 
         Arg1 = 28601, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 13, 
      }, 
      [28] = 
      {
         Arg3 = 28611, 
         Arg1 = 28603, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 12, 
      }, 
      [29] = 
      {
         Arg3 = 28611, 
         Arg1 = 28601, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 13, 
      }, 
      [30] = 
      {
         Arg3 = 28611, 
         Arg1 = 28603, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 12, 
      }, 
      [31] = 
      {
         Arg3 = 28611, 
         Arg1 = 28601, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 13, 
      }, 
      [32] = 
      {
         Arg3 = 28611, 
         Arg1 = 28603, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 12, 
      }, 
      [33] = 
      {
         Arg3 = 28615, 
         Arg1 = 28608, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [34] = 
      {
         Arg3 = 0, 
         Arg1 = 8, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [35] = 
      {
         Arg3 = 0, 
         Arg1 = 32261, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [36] = 
      {
         Arg3 = 0, 
         Arg1 = 31522, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [37] = 
      {
         Arg3 = 0, 
         Arg1 = 10314, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [38] = 
      {
         Arg3 = 0, 
         Arg1 = 28605, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [39] = 
      {
         Arg3 = 28617, 
         Arg1 = 28600, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [40] = 
      {
         Arg3 = 0, 
         Arg1 = 28603, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [41] = 
      {
         Arg3 = 0, 
         Arg1 = 28600, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [42] = 
      {
         Arg3 = 0, 
         Arg1 = 28602, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [43] = 
      {
         Arg3 = 0, 
         Arg1 = 28601, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [44] = 
      {
         Arg3 = 28629, 
         Arg1 = 28606, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [45] = 
      {
         Arg3 = 12, 
         Arg1 = 28602, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [46] = 
      {
         Arg3 = 17, 
         Arg1 = 10424, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [47] = 
      {
         Arg3 = 0, 
         Arg1 = 28602, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [48] = 
      {
         Arg3 = 0, 
         Arg1 = 28601, 
         Command = "P", 
         MiscData = 0, 
         Arg2 = 1, 
      }, 
      [49] = 
      {
         Arg3 = 16, 
         Arg1 = 28600, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [50] = 
      {
         Arg3 = 28634, 
         Arg1 = 28607, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [51] = 
      {
         Arg3 = 12, 
         Arg1 = 28602, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [52] = 
      {
         Arg3 = 0, 
         Arg1 = 28601, 
         Command = "P", 
         MiscData = 0, 
         Arg2 = 1, 
      }, 
      [53] = 
      {
         Arg3 = 16, 
         Arg1 = 28600, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [54] = 
      {
         Arg3 = 19, 
         Arg1 = 32229, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [55] = 
      {
         Arg3 = 28636, 
         Arg1 = 28605, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [56] = 
      {
         Arg3 = 17, 
         Arg1 = 10424, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [57] = 
      {
         Arg3 = 28638, 
         Arg1 = 28610, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [58] = 
      {
         Arg3 = 28612, 
         Arg1 = 90, 
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [59] = 
      {
         Arg3 = 28619, 
         Arg1 = 28607, 
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
   }, 
   Author = "Thrawn", 
   Rooms = 
   {
      [28672] = 
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
            [30] = "Prototype", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "southwest", 
               DestinationVnum = 28671, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28672, 
         Description = "", 
         Tag = "", 
         Name = "Floating in a void", 
      }, 
      [28673] = 
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
            [30] = "Prototype", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "northwest", 
               DestinationVnum = 28671, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28673, 
         Description = "", 
         Tag = "", 
         Name = "Floating in a void", 
      }, 
      [28674] = 
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
            [30] = "Prototype", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 28675, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 28676, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 28677, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28674, 
         Description = "", 
         Tag = "", 
         Name = "Floating in a void", 
      }, 
      [28675] = 
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
            [30] = "Prototype", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 28674, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28675, 
         Description = "", 
         Tag = "", 
         Name = "Floating in a void", 
      }, 
      [28676] = 
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
            [30] = "Prototype", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 28674, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28676, 
         Description = "", 
         Tag = "", 
         Name = "Floating in a void", 
      }, 
      [28677] = 
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
            [30] = "Prototype", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 28674, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [19] = "Auto", 
                  [11] = "Hidden", 
                  [7] = "Climb", 
               }, 
               Key = -1, 
               Direction = "somewhere", 
               DestinationVnum = 28678, 
               Keyword = "crack", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28677, 
         Description = "", 
         Tag = "", 
         Name = "Floating in a void", 
      }, 
      [28678] = 
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
            [30] = "Prototype", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [7] = "Climb", 
               }, 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 28652, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28678, 
         Description = "", 
         Tag = "", 
         Name = "Floating in a void", 
      }, 
      [28679] = 
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
            [30] = "Prototype", 
         }, 
         Exits = 
         {
         }, 
         Vnum = 28679, 
         Description = "", 
         Tag = "", 
         Name = "Floating in a void", 
      }, 
      [28680] = 
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
            [30] = "Prototype", 
         }, 
         Exits = 
         {
         }, 
         Vnum = 28680, 
         Description = "", 
         Tag = "", 
         Name = "Floating in a void", 
      }, 
      [28681] = 
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
            [30] = "Prototype", 
         }, 
         Exits = 
         {
         }, 
         Vnum = 28681, 
         Description = "", 
         Tag = "", 
         Name = "Floating in a void", 
      }, 
      [28682] = 
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
            [30] = "Prototype", 
         }, 
         Exits = 
         {
         }, 
         Vnum = 28682, 
         Description = "", 
         Tag = "", 
         Name = "Floating in a void", 
      }, 
      [28683] = 
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
            [30] = "Prototype", 
         }, 
         Exits = 
         {
         }, 
         Vnum = 28683, 
         Description = "", 
         Tag = "", 
         Name = "Floating in a void", 
      }, 
      [28684] = 
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
            [30] = "Prototype", 
         }, 
         Exits = 
         {
         }, 
         Vnum = 28684, 
         Description = "", 
         Tag = "", 
         Name = "Floating in a void", 
      }, 
      [28685] = 
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
            [30] = "Prototype", 
         }, 
         Exits = 
         {
         }, 
         Vnum = 28685, 
         Description = "", 
         Tag = "", 
         Name = "Floating in a void", 
      }, 
      [28686] = 
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
            [30] = "Prototype", 
         }, 
         Exits = 
         {
         }, 
         Vnum = 28686, 
         Description = "", 
         Tag = "", 
         Name = "Floating in a void", 
      }, 
      [28687] = 
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
            [30] = "Prototype", 
         }, 
         Exits = 
         {
         }, 
         Vnum = 28687, 
         Description = "", 
         Tag = "", 
         Name = "Floating in a void", 
      }, 
      [28688] = 
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
            [30] = "Prototype", 
         }, 
         Exits = 
         {
         }, 
         Vnum = 28688, 
         Description = "", 
         Tag = "", 
         Name = "Floating in a void", 
      }, 
      [28689] = 
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
            [30] = "Prototype", 
         }, 
         Exits = 
         {
         }, 
         Vnum = 28689, 
         Description = "", 
         Tag = "", 
         Name = "Floating in a void", 
      }, 
      [28690] = 
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
            [30] = "Prototype", 
         }, 
         Exits = 
         {
         }, 
         Vnum = 28690, 
         Description = "", 
         Tag = "", 
         Name = "Floating in a void", 
      }, 
      [28691] = 
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
            [30] = "Prototype", 
         }, 
         Exits = 
         {
         }, 
         Vnum = 28691, 
         Description = "", 
         Tag = "", 
         Name = "Floating in a void", 
      }, 
      [28692] = 
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
            [30] = "Prototype", 
         }, 
         Exits = 
         {
         }, 
         Vnum = 28692, 
         Description = "", 
         Tag = "", 
         Name = "Floating in a void", 
      }, 
      [28693] = 
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
            [30] = "Prototype", 
         }, 
         Exits = 
         {
         }, 
         Vnum = 28693, 
         Description = "", 
         Tag = "", 
         Name = "Floating in a void", 
      }, 
      [28694] = 
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
            [30] = "Prototype", 
         }, 
         Exits = 
         {
         }, 
         Vnum = 28694, 
         Description = "", 
         Tag = "", 
         Name = "Floating in a void", 
      }, 
      [28695] = 
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
            [30] = "Prototype", 
         }, 
         Exits = 
         {
         }, 
         Vnum = 28695, 
         Description = "", 
         Tag = "", 
         Name = "Floating in a void", 
      }, 
      [28696] = 
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
            [30] = "Prototype", 
         }, 
         Exits = 
         {
         }, 
         Vnum = 28696, 
         Description = "", 
         Tag = "", 
         Name = "Floating in a void", 
      }, 
      [28697] = 
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
            [30] = "Prototype", 
         }, 
         Exits = 
         {
         }, 
         Vnum = 28697, 
         Description = "", 
         Tag = "", 
         Name = "Floating in a void", 
      }, 
      [28698] = 
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
            [30] = "Prototype", 
         }, 
         Exits = 
         {
         }, 
         Vnum = 28698, 
         Description = "", 
         Tag = "", 
         Name = "Floating in a void", 
      }, 
      [28699] = 
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
            [30] = "Prototype", 
         }, 
         Exits = 
         {
         }, 
         Vnum = 28699, 
         Description = "", 
         Tag = "", 
         Name = "Floating in a void", 
      }, 
      [28600] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "100", 
               Code = "mpechoat $n The music soothes you into a light slumber.\
mpforce $n sleep\
mpdream $n You dream of little sheep hopping fences, awwwww!\
feel cure critical $n\
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
            [2] = "NoMob", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 28601, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28600, 
         Description = "You are in the northernmost side of Rwookrrorro's nursery ring.  This is\
where  all young Wookiees start thier lives.  Baby Wookiee's are being\
nursed here and slightly larger Wookiee children are sleeping here. You\
also here soothing music being played over an intercom. \
", 
         Tag = "", 
         Name = "Northern Nursery Ring", 
      }, 
      [28601] = 
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
               Direction = "north", 
               DestinationVnum = 28600, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 28602, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 28608, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28601, 
         Description = "You are standing in the central nursery ring.  This is where Wookiee\
toddlers are allowed to stumble around.  The floors and walls are padded\
to prevent injury.  Elderly Wookiee ladies are here to comfort the\
toddlers and urge them into walking upright.  All around the room are\
branches which have been bolted into the floor to allow young Wookiees to\
test their climbing ability.  Younger Wookiees rest to the North and Older\
ones perfect their climbing to the South.\
", 
         Tag = "", 
         Name = "Central Nursery Ring", 
      }, 
      [28602] = 
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
               DestinationVnum = 28601, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 28604, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Flags = 
               {
                  [16] = "CanClimb", 
               }, 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 28603, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28602, 
         Description = "You are standing in the southernmost nursery ring where Wookiee children\
are perfecting their climbing skills.  All around you, small Wookiees are\
climbing the branches which this room has been built around.  They dangle\
from often frightening heights, trusting their instructors to catch them\
should they fall. You can Climb up with the Wookiee children, you can go\
north the the toddler's area, or you can go South to a lift which will\
take you to Rwookrrorro's lower  levels.\
", 
         Tag = "", 
         Name = "Southern Nursery Ring", 
      }, 
      [28603] = 
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
                  [16] = "CanClimb", 
                  [7] = "Climb", 
               }, 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 28602, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28603, 
         Description = "You are holding tightly to a high branch above the nursery ring's climbing\
practice area.  All around you Wookiee children hang from branches, well\
most of them hang, a few have already fallen and had to be caught by the\
strong Wookiees standing below.  You just hope you have the strength to\
keep yourself  up.  The only exit is down, to the lower practice area.\
", 
         Tag = "", 
         Name = "Upper level of the Nursery Climbing Area", 
      }, 
      [28604] = 
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
               Direction = "north", 
               DestinationVnum = 28602, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 28605, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28604, 
         Description = "You are in a liftcar at the top level of Rwookrrorro.  This level is\
dedicated to the nursery rings where young Wookiees are nursed and live\
until they can  climb and walk well enough to get around the city\
themselves.  You can exit to  the nursery rings to the north or you can\
ride the lift down.\
", 
         Tag = "", 
         Name = "Litfcar", 
      }, 
      [28605] = 
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
               DestinationVnum = 28610, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 28604, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 28606, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28605, 
         Description = "You are in a liftcar at the middle level of Rwookrrorro.  This level is\
primarily residential.  As you look out of the lift you can see many doors\
carved into the main city's wroshyr tree to the west.  You can go North to\
the residential area or ride the liftcar up or down.\
", 
         Tag = "", 
         Name = "Liftcar", 
      }, 
      [28606] = 
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
               DestinationVnum = 28611, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 28605, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 28607, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28606, 
         Description = "You are in a liftcar at the lowest level of the city of Rwookrrorro.  This\
level has a large commercial area as well as a residential area and access\
to the landing pad.  You can exit the liftcar to the east or you can ride\
the liftcar up or down. \
", 
         Tag = "", 
         Name = "Liftcar", 
      }, 
      [28607] = 
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
               DestinationVnum = 28638, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 28606, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28607, 
         Description = "You are in a liftcar below the lowest level of Rwookrrorro.  From here you\
have an amazing view, well two amazing views really.  One below you, into\
the deep green forrests of Kashyyyk. Above you is another amazing sight,\
the underside of the great Wookiee city Rwookrrorro.  The branches of the\
worshyr trees support the city kilometers off the ground.  They form\
spiderweb like patterns  because of their unique bonding properties, when\
two branches meet, they bond and send out more branches in new directions.\
 You can only ride the liftcar up.\
", 
         Tag = "", 
         Name = "Liftcar", 
      }, 
      [28608] = 
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
               DestinationVnum = 28601, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 28609, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28608, 
         Description = "You are standing in the naughty children's corner.  Have you been\
naughty?? Bad little Wookiee children stand here facing the wall.\
As you stare at the wall you notice that the corner didn't actually \
settle down all the bad little children, one scratched something into the\
wall with his claw: it says,\"There once was a man from Corellia.\" The rest\
is too scuffed up to read.  From here you can go east to the Middle Nursery\
ring or south to the classroom.\
", 
         Tag = "", 
         Name = "The \"Corner\"", 
      }, 
      [28609] = 
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
               DestinationVnum = 28608, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28609, 
         Description = "You stand in the middle of a room filled with chairs.  One wall is\
almost entirely covered by an electronic chalkboard.  This is where\
the young Wookiees are taught to read and write.  Some children run\
around the room playing tag.  A teacher stands at the front of the room\
trying to settle down the children.\
", 
         Tag = "", 
         Name = "The Classroom", 
      }, 
      [28610] = 
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
               DestinationVnum = 28619, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 28605, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28610, 
         Description = "The residential area is, obviously, loaded with houses of the wookiee\
people they are made from the natural material that surrounds the entire\
wookie world whish is wood, and some houses have plasteel windows.\
Wookiees pass you by, not to surprisingly this place is fairly crowded\
with wookiees and the wookiee children running about  seem to be playing a\
game of hide and seak with each other.\
", 
         Tag = "", 
         Name = "Residential Area", 
      }, 
      [28611] = 
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
               DestinationVnum = 28612, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 28618, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 28606, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28611, 
         Description = "This place is crawling with wookiees as well as some other forms of beings,\
they seem to be to busy to even notice you getting off the lift car even\
though your pack to the gills with illegal weapons. The wookiee are far to\
interested with thier lives to have to pay any attention to you and your\
petty adventure through their home world. A word of advice, don't get them\
angry. \
", 
         Tag = "", 
         Name = "Commercial Area", 
      }, 
      [28612] = 
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
               Direction = "south", 
               DestinationVnum = 28613, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 28611, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28612, 
         Description = "This place is crawling with wookiees as well as some other forms of beings,\
they seem to be to busy to even notice you getting off the lift car even\
though your pack to the gills with illegal weapons. The wookiee are far to\
interested with thier lives to have to pay any attention to you and your\
petty adventure through their home world. A word of advice, don't get them\
angry. \
", 
         Tag = "", 
         Name = "Commercial Area", 
      }, 
      [28613] = 
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
               DestinationVnum = 28612, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 28639, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28613, 
         Description = "The landing pad is not to crowded, but it does have the odd technician\
working on ships that are in dire need of repair or tune ups. The place\
has the smell of the forest lingering in it as well as the smell of\
polished metal, coolant, and wet wookiee,  nothing entirely pleasant but\
livable. The walls that partially surround  the pad have the tools that\
the techs use for the repairs as well as some pictures of female wookiees\
in compromising positions. The only way out is back the way you came.\
", 
         Tag = "kashyyyk_landing", 
         Name = "Landing Pad", 
      }, 
      [28614] = 
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
               DestinationVnum = 28616, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 28615, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28614, 
         Description = "This place seems to be crawling with wookiees as well as some other forms\
of beings, they seem to be to busy to even notice you enter the area even\
though you area loaded to the  gills with some of the more sofisticated\
weapons they have seen, besides their bowcasters. The wookiees are far to\
interested with their own lives to have to pay attention to you and your\
petty adventure through their home world. A word of advice, don't get them\
angery. The place is starting to get the smell of some freshly cooked food\
comeing from the south of here.\
", 
         Tag = "", 
         Name = "Commercial Area", 
      }, 
      [28615] = 
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
               DestinationVnum = 28614, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28615, 
         Description = "The shop has a very pleasent odur to it. With the carcuses of freshly\
skined animals packed on ice under the glass counter and some dried foods\
lining the walls you start to hear your stomach rumble with hunger. The\
wookiee behind the glass counter is very large andfor all you know he\
could be packing heat just in case someone like you decided to come in\
here and \"borrow\" some of her goods.\
", 
         Tag = "", 
         Name = "Delicious Foods and Drinks", 
      }, 
      [28616] = 
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
               DestinationVnum = 28618, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 28614, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 28617, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28616, 
         Description = "This place is crawling with wookiees as well as some other forms of beings,\
they seem to be to busy to even notice you getting off the lift car even\
though your pack to the gills with illegal weapons. The wookiee are far to\
interested with thier lives to have to pay any attention to you and your\
petty adventure through their home world. A word of advice, don't get them\
angry.\
", 
         Tag = "", 
         Name = "Commercial Area", 
      }, 
      [28617] = 
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
               Direction = "east", 
               DestinationVnum = 28616, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28617, 
         Description = "You stand in the cocked bowcaster, where bowcasters are the specialty and\
they don't come cheap. the walls are lined with many of the wookiee's\
preferd weapon and there are different colours as well as different shapes\
to them as well. The ones that really catch you eyes are the double\
barreled ones they look powerful as well as expensive. The owner has one\
straped onto his waist and has his hand resting  easily on the hair\
trigger. \
", 
         Tag = "", 
         Name = "The Cocked Bowcaster", 
      }, 
      [28618] = 
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
               DestinationVnum = 28611, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 28616, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28618, 
         Description = "This place is crawling with wookiees as well as some other forms of beings,\
they seem to be to busy to even notice you getting off the lift car even\
though your pack to the gills with illegal weapons. The wookiee are far to\
interested with thier lives to have to pay any attention to you and your\
petty adventure through their home world. A word of advice, don't get them\
angry. \
", 
         Tag = "", 
         Name = "Commercial Area", 
      }, 
      [28619] = 
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
               DestinationVnum = 28625, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 28620, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 28626, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 28610, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [5] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 28627, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28619, 
         Description = "The residential area is, obviously, loaded with houses of the wookiee\
people they are made from the natural material that surrounds the entire\
wookie world whish is wood, and some houses have plasteel windows.\
Wookiees pass you by, not to surprisingly this place is fairly crowded\
with wookiees and the wookiee children running about  seem to be playing a\
game of hide and seak with each other. \
", 
         Tag = "", 
         Name = "Residential Area", 
      }, 
      [28620] = 
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
               DestinationVnum = 28622, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 28624, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 28621, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 28619, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [5] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 28623, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [6] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "southwest", 
               DestinationVnum = 28635, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28620, 
         Description = "The residential area is, obviously, loaded with houses of the wookiee\
people they are made from the natural material that surrounds the entire\
wookie world whish is wood, and some houses have plasteel windows.\
Wookiees pass you by, not to surprisingly this place is fairly crowded\
with wookiees and the wookiee children running about  seem to be playing a\
game of hide and seak with each other. \
", 
         Tag = "", 
         Name = "Residential Area", 
      }, 
      [28621] = 
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
               DestinationVnum = 28620, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 28628, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28621, 
         Description = "This place has the smell of wookiees in as well as tons of wookiee fur has\
been shed over the funiture, which looks like it can fit a giant due to\
the size of them The place is well lit and has the cool breeze from teh\
open windows blowing through. There are stairs to this house which lead\
up.\
", 
         Tag = "", 
         Name = "Worshyr Guests Trees House", 
      }, 
      [28622] = 
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
               DestinationVnum = 28620, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 28629, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28622, 
         Description = "This place has the smell of wookiees in as well as tons of wookiee fur has\
been shed over the funiture, which looks like it can fit a giant due to\
the size of them The place is well lit and has the cool breeze from teh\
open windows blowing through. There are stairs to this house which lead\
up.\
", 
         Tag = "", 
         Name = "Worshyr Tree House", 
      }, 
      [28623] = 
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
               Direction = "up", 
               DestinationVnum = 28630, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 28620, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28623, 
         Description = "This place has the smell of wookiees in as well as tons of wookiee fur has\
been shed over the funiture, which looks like it can fit a giant due to\
the size of them The place is well lit and has the cool breeze from teh\
open windows blowing through. There are stairs to this house which lead\
up.\
", 
         Tag = "", 
         Name = "Worshyr Tree House", 
      }, 
      [28624] = 
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
               Direction = "west", 
               DestinationVnum = 28620, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 28631, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28624, 
         Description = "This place has the smell of wookiees in as well as tons of wookiee fur has\
been shed over the funiture, which looks like it can fit a giant due to\
the size of them The place is well lit and has the cool breeze from teh\
open windows blowing through. There are stairs to this house which lead\
up.\
", 
         Tag = "", 
         Name = "Worshyr Tree House", 
      }, 
      [28625] = 
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
               DestinationVnum = 28619, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 28632, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28625, 
         Description = "This place has the smell of wookiees in as well as tons of wookiee fur has\
been shed over the funiture, which looks like it can fit a giant due to\
the size of them The place is well lit and has the cool breeze from teh\
open windows blowing through. There are stairs to this house which lead\
up.\
", 
         Tag = "", 
         Name = "Worshyr Tree House", 
      }, 
      [28626] = 
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
               DestinationVnum = 28619, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 28633, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28626, 
         Description = "This place has the smell of wookiees in as well as tons of wookiee fur has\
been shed over the funiture, which looks like it can fit a giant due to\
the size of them The place is well lit and has the cool breeze from teh\
open windows blowing through. There are stairs to this house which lead\
up.\
", 
         Tag = "", 
         Name = "Worshyr Tree House", 
      }, 
      [28627] = 
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
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 28634, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 28619, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28627, 
         Description = "This place has the smell of wookiees in as well as tons of wookiee fur has\
been shed over the funiture, which looks like it can fit a giant due to\
the size of them The place is well lit and has the cool breeze from teh\
open windows blowing through. There are stairs to this house which lead\
up.\
", 
         Tag = "", 
         Name = "Worshyr Tree House", 
      }, 
      [28628] = 
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
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 28621, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28628, 
         Description = "The room, like downstairs is very well lit from the outside lights. The\
branches from the trees leave haunting shadows on the walls as well as tap\
on the window once in awhile. The room has a large bed that can fit at\
least 6 human sized people comfortabley and probably two wookiees\
comfortably. The bed like the funiture downstairs is covered with shed fur\
but other then that it is made and looks inviting. Other then the bedroom\
funiture the room is empty. \
", 
         Tag = "", 
         Name = "Guests room", 
      }, 
      [28629] = 
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
               Direction = "down", 
               DestinationVnum = 28622, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28629, 
         Description = "The room, like downstairs is very well lit from the outside lights. The\
branches from the trees leave haunting shadows on the walls as well as tap\
on the window once in awhile. The room has a large bed that can fit at\
least 6 human sized people comfortabley and probably two wookiees\
comfortably. The bed like the funiture downstairs is covered with shed fur\
but other then that it is made and looks inviting. Other then the bedroom\
funiture the room is empty.\
", 
         Tag = "", 
         Name = "Upstairs Room", 
      }, 
      [28630] = 
      {
         Sector = "inside", 
         TeleVnum = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 28623, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28630, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Tag = "", 
         Name = "An Empty Home", 
      }, 
      [28631] = 
      {
         Sector = "inside", 
         TeleVnum = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 28624, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28631, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Tag = "", 
         Name = "An Empty Home", 
      }, 
      [28632] = 
      {
         Sector = "inside", 
         TeleVnum = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 28625, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28632, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Tag = "", 
         Name = "An Empty Home", 
      }, 
      [28633] = 
      {
         Sector = "inside", 
         TeleVnum = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 28626, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28633, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Tag = "", 
         Name = "An Empty Home", 
      }, 
      [28634] = 
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
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 28627, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28634, 
         Description = "The room, like downstairs is very well lit from the outside lights. The\
branches from the trees leave haunting shadows on the walls as well as tap\
on the window once in awhile. The room has a large bed that can fit at\
least 6 human sized people comfortabley and probably two wookiees\
comfortably. The bed like the funiture downstairs is covered with shed fur\
but other then that it is made and looks inviting. Other then the bedroom\
funiture the room is empty. \
", 
         Tag = "", 
         Name = "Upstairs Room", 
      }, 
      [28635] = 
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
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 28636, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "northeast", 
               DestinationVnum = 28620, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28635, 
         Description = "This place has the smell of wookiees in as well as tons of wookiee fur has\
been shed over the funiture, which looks like it can fit a giant due to\
the size of them The place is well lit and has the cool breeze from teh\
open windows blowing through. There are stairs to this house which lead\
up.\
", 
         Tag = "", 
         Name = "Worshyr Tree House", 
      }, 
      [28636] = 
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
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 28635, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28636, 
         Description = "This place has the smell of wookiees in as well as tons of wookiee fur has\
been shed over the funiture, which looks like it can fit a giant due to\
the size of them The place is well lit and has the cool breeze from teh\
open windows blowing through. There are stairs to this house which lead\
up.\
", 
         Tag = "", 
         Name = "Upstairs Room", 
      }, 
      [28637] = 
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
            [30] = "Prototype", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Flags = 
               {
                  [21] = "Searchable", 
                  [11] = "Hidden", 
               }, 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 28638, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28637, 
         Description = "You have been placed into a Kashyyk Prison Net. The rope is created from a\
a laser and blaster proof twine. Unfortunetly there seems to be no way\
down from these traps. As you glance across the horizon you notice that\
Kashyyyk is an incredibly attractive planet. To bad (unless you find\
someone to let you down) you will spend the rest of your life here.\
", 
         Tag = "", 
         Name = "Prison Net", 
      }, 
      [28638] = 
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
            [30] = "Prototype", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 28607, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28638, 
         Description = "You are standing on tree branches that have grown years and years toghther\
to create a rather strong branch floor. As you look up you can see a small\
rope prison left here apparently by the ruling force here.\
", 
         Tag = "", 
         Name = "Tree Branch Covering", 
      }, 
      [28639] = 
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
            [4] = "CanLand", 
            [5] = "CanFly", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 28613, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28639, 
         Description = "", 
         Tag = "", 
         Name = "Landing Pad", 
      }, 
      [28640] = 
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
            [30] = "Prototype", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 28641, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28640, 
         Description = "", 
         Tag = "", 
         Name = "Floating in a void", 
      }, 
      [28641] = 
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
            [30] = "Prototype", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 28640, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "northeast", 
               DestinationVnum = 28642, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28641, 
         Description = "", 
         Tag = "", 
         Name = "Floating in a void", 
      }, 
      [28642] = 
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
            [30] = "Prototype", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 28643, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "northeast", 
               DestinationVnum = 28646, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "southwest", 
               DestinationVnum = 28641, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28642, 
         Description = "", 
         Tag = "", 
         Name = "Floating in a void", 
      }, 
      [28643] = 
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
               Direction = "north", 
               DestinationVnum = 28642, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "southwest", 
               DestinationVnum = 28644, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28643, 
         Description = "", 
         Tag = "", 
         Name = "Floating in a void", 
      }, 
      [28644] = 
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
            [30] = "Prototype", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 28645, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "northeast", 
               DestinationVnum = 28643, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28644, 
         Description = "", 
         Tag = "", 
         Name = "Floating in a void", 
      }, 
      [28645] = 
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
            [30] = "Prototype", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 28644, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28645, 
         Description = "", 
         Tag = "", 
         Name = "Floating in a void", 
      }, 
      [28646] = 
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
            [30] = "Prototype", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "southeast", 
               DestinationVnum = 28647, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "southwest", 
               DestinationVnum = 28642, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28646, 
         Description = "", 
         Tag = "", 
         Name = "Floating in a void", 
      }, 
      [28647] = 
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
            [30] = "Prototype", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 28648, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 28662, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 28655, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "northwest", 
               DestinationVnum = 28646, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28647, 
         Description = "", 
         Tag = "", 
         Name = "Floating in a void", 
      }, 
      [28648] = 
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
            [30] = "Prototype", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 28649, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 28647, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "northeast", 
               DestinationVnum = 28651, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "northwest", 
               DestinationVnum = 28652, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28648, 
         Description = "", 
         Tag = "", 
         Name = "Floating in a void", 
      }, 
      [28649] = 
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
            [30] = "Prototype", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 28650, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 28648, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 28674, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28649, 
         Description = "", 
         Tag = "", 
         Name = "Floating in a void", 
      }, 
      [28650] = 
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
            [30] = "Prototype", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 28654, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 28649, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 28653, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "southeast", 
               DestinationVnum = 28651, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [5] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "southwest", 
               DestinationVnum = 28652, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28650, 
         Description = "", 
         Tag = "", 
         Name = "Floating in a void", 
      }, 
      [28651] = 
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
            [30] = "Prototype", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "northwest", 
               DestinationVnum = 28650, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "southwest", 
               DestinationVnum = 28648, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28651, 
         Description = "", 
         Tag = "", 
         Name = "Floating in a void", 
      }, 
      [28652] = 
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
            [30] = "Prototype", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "northeast", 
               DestinationVnum = 28650, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "southeast", 
               DestinationVnum = 28648, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28652, 
         Description = "", 
         Tag = "", 
         Name = "Floating in a void", 
      }, 
      [28653] = 
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
            [30] = "Prototype", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 28650, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28653, 
         Description = "", 
         Tag = "", 
         Name = "Floating in a void", 
      }, 
      [28654] = 
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
            [30] = "Prototype", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 28650, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28654, 
         Description = "", 
         Tag = "", 
         Name = "Floating in a void", 
      }, 
      [28655] = 
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
            [30] = "Prototype", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 28647, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 28661, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 28659, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "northwest", 
               DestinationVnum = 28656, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [5] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "southeast", 
               DestinationVnum = 28660, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28655, 
         Description = "", 
         Tag = "", 
         Name = "Floating in a void", 
      }, 
      [28656] = 
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
            [30] = "Prototype", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 28657, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "southeast", 
               DestinationVnum = 28655, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28656, 
         Description = "", 
         Tag = "", 
         Name = "Floating in a void", 
      }, 
      [28657] = 
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
            [30] = "Prototype", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 28656, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 28658, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28657, 
         Description = "", 
         Tag = "", 
         Name = "Floating in a void", 
      }, 
      [28658] = 
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
            [30] = "Prototype", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 28657, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 28659, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28658, 
         Description = "", 
         Tag = "", 
         Name = "Floating in a void", 
      }, 
      [28659] = 
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
            [30] = "Prototype", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 28655, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 28660, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 28658, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28659, 
         Description = "", 
         Tag = "", 
         Name = "Floating in a void", 
      }, 
      [28660] = 
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
            [30] = "Prototype", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 28661, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 28659, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "northwest", 
               DestinationVnum = 28655, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "southwest", 
               DestinationVnum = 28662, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28660, 
         Description = "", 
         Tag = "", 
         Name = "Floating in a void", 
      }, 
      [28661] = 
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
            [30] = "Prototype", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 28660, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 28655, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28661, 
         Description = "", 
         Tag = "", 
         Name = "Floating in a void", 
      }, 
      [28662] = 
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
            [30] = "Prototype", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 28663, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 28647, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "northeast", 
               DestinationVnum = 28660, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28662, 
         Description = "", 
         Tag = "", 
         Name = "Floating in a void", 
      }, 
      [28663] = 
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
            [30] = "Prototype", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 28664, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 28662, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28663, 
         Description = "", 
         Tag = "", 
         Name = "Floating in a void", 
      }, 
      [28664] = 
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
            [30] = "Prototype", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 28668, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 28671, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 28665, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 28663, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28664, 
         Description = "", 
         Tag = "", 
         Name = "Floating in a void", 
      }, 
      [28665] = 
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
            [30] = "Prototype", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 28664, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 28666, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 28667, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28665, 
         Description = "", 
         Tag = "", 
         Name = "Floating in a void", 
      }, 
      [28666] = 
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
            [30] = "Prototype", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 28665, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28666, 
         Description = "", 
         Tag = "", 
         Name = "Floating in a void", 
      }, 
      [28667] = 
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
            [30] = "Prototype", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 28665, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28667, 
         Description = "", 
         Tag = "", 
         Name = "Floating in a void", 
      }, 
      [28668] = 
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
            [30] = "Prototype", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 28669, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 28664, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "northeast", 
               DestinationVnum = 28670, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28668, 
         Description = "", 
         Tag = "", 
         Name = "Floating in a void", 
      }, 
      [28669] = 
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
            [30] = "Prototype", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 28668, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28669, 
         Description = "", 
         Tag = "", 
         Name = "Floating in a void", 
      }, 
      [28670] = 
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
            [30] = "Prototype", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "southwest", 
               DestinationVnum = 28668, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28670, 
         Description = "", 
         Tag = "", 
         Name = "Floating in a void", 
      }, 
      [28671] = 
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
            [30] = "Prototype", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 28664, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "northeast", 
               DestinationVnum = 28672, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "southeast", 
               DestinationVnum = 28673, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28671, 
         Description = "", 
         Tag = "", 
         Name = "Floating in a void", 
      }, 
   }, 
   FileFormatVersion = 1, 
   Filename = "kashyyyk.lua", 
   Mobiles = 
   {
      [28608] = 
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
         Race = "Wookiee", 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
         }, 
         NumberOfAttacks = 0, 
         DamRoll = 4, 
         Languages = 
         {
            Speaks = 
            {
               [1] = "shyriiwook", 
               [0] = "basic", 
            }, 
            Speaking = 
            {
               [1] = "shyriiwook", 
            }, 
         }, 
         VipFlags = 
         {
            [1] = "Kashyyyk", 
         }, 
         Immune = 
         {
            [20] = "magic", 
            [11] = "charm", 
         }, 
         Shop = 
         {
            KeeperShortDescr = "a female wookiee", 
            ProfitBuy = 120, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            ProfitSell = 90, 
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
         }, 
         Description = "", 
         ShortDescr = "a female wookiee", 
         Weight = 0, 
         HitRoll = 4, 
         Sex = "male", 
         LongDescr = "A wookiee female minds the shop.\
", 
         HitChance = 
         {
            HitNoDice = 8, 
            HitSizeDice = 10, 
            HitPlus = 400, 
         }, 
         DefaultPosition = "standing", 
         Credits = 200, 
         Level = 40, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamNoDice = 5, 
            DamPlus = 0, 
         }, 
         Vnum = 28608, 
         ArmorClass = 20, 
         Tag = "", 
         Name = "female wookiee shop owner", 
      }, 
      [28610] = 
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
         Race = "Wookiee", 
         Alignment = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [27] = "NoCorpse", 
         }, 
         NumberOfAttacks = 2, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "death_prog", 
               Arguments = "100", 
               Code = "mpmload 329\
mpforce mobslave mpoload 28610\
mpforce mobslave drop all\
mppurge mobslav\
", 
               ScriptType = "MProg", 
            }, 
         }, 
         Languages = 
         {
            Speaks = 
            {
               [1] = "shyriiwook", 
               [0] = "basic", 
            }, 
            Speaking = 
            {
               [1] = "shyriiwook", 
            }, 
         }, 
         DefaultPosition = "standing", 
         AttackFlags = 
         {
            [1] = "claws", 
            [4] = "punch", 
            [5] = "kick", 
            [0] = "bite", 
         }, 
         DamRoll = 21, 
         Description = "", 
         ShortDescr = "Kueshlin", 
         Weight = 0, 
         HitRoll = 21, 
         Sex = "undistinguished", 
         LongDescr = "A fierce wookie lurks near the tree trunk.\
", 
         HitChance = 
         {
            HitNoDice = 21, 
            HitSizeDice = 10, 
            HitPlus = 1050, 
         }, 
         Resistant = 
         {
            [5] = "pierce", 
            [6] = "slash", 
            [11] = "charm", 
         }, 
         Credits = 0, 
         Level = 105, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamNoDice = 10, 
            DamPlus = 2, 
         }, 
         Vnum = 28610, 
         ArmorClass = -162, 
         Tag = "", 
         Name = "Kueshlin", 
      }, 
      [28600] = 
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
         Race = "Wookiee", 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
         }, 
         NumberOfAttacks = 0, 
         DamRoll = 8, 
         Languages = 
         {
            Speaks = 
            {
               [1] = "shyriiwook", 
            }, 
            Speaking = 
            {
               [1] = "shyriiwook", 
               [0] = "basic", 
            }, 
         }, 
         VipFlags = 
         {
            [1] = "Kashyyyk", 
         }, 
         Immune = 
         {
            [20] = "magic", 
            [11] = "charm", 
         }, 
         Shop = 
         {
            KeeperShortDescr = "a wookiee shop owner", 
            ProfitBuy = 120, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            ProfitSell = 90, 
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
         }, 
         Description = "", 
         ShortDescr = "a wookiee shop owner", 
         Weight = 0, 
         HitRoll = 8, 
         Sex = "male", 
         LongDescr = "A rather large wookiee is behind the counter here.\
", 
         HitChance = 
         {
            HitNoDice = 8, 
            HitSizeDice = 10, 
            HitPlus = 400, 
         }, 
         DefaultPosition = "standing", 
         Credits = 200, 
         Level = 40, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamNoDice = 5, 
            DamPlus = 2, 
         }, 
         Vnum = 28600, 
         ArmorClass = 20, 
         Tag = "", 
         Name = "Wookiee shop owner", 
      }, 
      [28601] = 
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
         Race = "Wookiee", 
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
               [1] = "shyriiwook", 
            }, 
            Speaking = 
            {
               [1] = "shyriiwook", 
            }, 
         }, 
         VipFlags = 
         {
            [1] = "Kashyyyk", 
         }, 
         DamRoll = 2, 
         Description = "", 
         ShortDescr = "a female wookiee ", 
         Weight = 0, 
         HitRoll = 0, 
         Sex = "undistinguished", 
         LongDescr = "A female wookiee is walking around.\
", 
         HitChance = 
         {
            HitNoDice = 2, 
            HitSizeDice = 10, 
            HitPlus = 120, 
         }, 
         DefaultPosition = "standing", 
         Credits = 20, 
         Level = 10, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamNoDice = 1, 
            DamPlus = 2, 
         }, 
         Vnum = 28601, 
         ArmorClass = 67, 
         Tag = "", 
         Name = "wookiee female", 
      }, 
      [28602] = 
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
         Race = "Wookiee", 
         Alignment = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [10] = "Practice", 
         }, 
         NumberOfAttacks = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "all_greet_prog", 
               Arguments = "100", 
               Code = "if race($n) == wookiee\
say Hello $n, Are you ready for your lessons?\
else\
say I'm sorry $n I only teach my people\
endif\
", 
               ScriptType = "MProg", 
            }, 
         }, 
         Languages = 
         {
            Speaks = 
            {
               [1] = "shyriiwook", 
               [0] = "basic", 
            }, 
            Speaking = 
            {
               [1] = "shyriiwook", 
            }, 
         }, 
         VipFlags = 
         {
            [1] = "Kashyyyk", 
         }, 
         DamRoll = 0, 
         Description = "", 
         ShortDescr = "A Wookiee Teacher", 
         Weight = 0, 
         HitRoll = 0, 
         Sex = "female", 
         LongDescr = "A teacher stands here trying to make the rowdy children learn something.\
", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         DefaultPosition = "standing", 
         Credits = 0, 
         Level = 50, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         Vnum = 28602, 
         ArmorClass = 0, 
         Tag = "", 
         Name = "A Wookiee Teacher", 
      }, 
      [28603] = 
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
         Race = "Wookiee", 
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
               [1] = "shyriiwook", 
            }, 
            Speaking = 
            {
               [1] = "shyriiwook", 
            }, 
         }, 
         VipFlags = 
         {
            [1] = "Kashyyyk", 
         }, 
         DamRoll = 0, 
         Description = "", 
         ShortDescr = "a wookiee male", 
         Weight = 0, 
         HitRoll = 0, 
         Sex = "undistinguished", 
         LongDescr = "A wookiee male is looking around here.\
", 
         HitChance = 
         {
            HitNoDice = 2, 
            HitSizeDice = 10, 
            HitPlus = 120, 
         }, 
         DefaultPosition = "standing", 
         Credits = 20, 
         Level = 10, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamNoDice = 1, 
            DamPlus = 2, 
         }, 
         Vnum = 28603, 
         ArmorClass = 67, 
         Tag = "", 
         Name = "wookiee male", 
      }, 
      [28604] = 
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
         Race = "Wookiee", 
         Alignment = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [7] = "Wimpy", 
         }, 
         NumberOfAttacks = 1, 
         Languages = 
         {
            Speaks = 
            {
               [1] = "shyriiwook", 
               [0] = "basic", 
            }, 
            Speaking = 
            {
               [1] = "shyriiwook", 
            }, 
         }, 
         VipFlags = 
         {
            [1] = "Kashyyyk", 
         }, 
         DamRoll = 0, 
         Description = "", 
         ShortDescr = "a wookiee child", 
         Weight = 0, 
         HitRoll = 0, 
         Sex = "male", 
         LongDescr = "A wookiee child is playing around here.\
", 
         HitChance = 
         {
            HitNoDice = 1, 
            HitSizeDice = 1, 
            HitPlus = 30, 
         }, 
         DefaultPosition = "standing", 
         Credits = 0, 
         Level = 1, 
         Damage = 
         {
            DamSizeDice = 3, 
            DamNoDice = 1, 
            DamPlus = 3, 
         }, 
         Vnum = 28604, 
         ArmorClass = 0, 
         Tag = "", 
         Name = "wookiee child", 
      }, 
      [28605] = 
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
         Race = "Wookiee", 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         NumberOfAttacks = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "death_prog", 
               Arguments = "100", 
               Code = "mpecho Ralra clasps his chest as he falls to the ground.\
mpecho As he hits the ground something rolls out from his open hand\
mpoload 28604\
", 
               ScriptType = "MProg", 
            }, 
            [2] = 
            {
               MudProgType = "act_prog", 
               Arguments = "package", 
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
               ScriptType = "MProg", 
            }, 
         }, 
         Languages = 
         {
            Speaks = 
            {
               [1] = "shyriiwook", 
               [0] = "basic", 
            }, 
            Speaking = 
            {
               [0] = "basic", 
            }, 
         }, 
         VipFlags = 
         {
            [1] = "Kashyyyk", 
         }, 
         DamRoll = 17, 
         Description = "", 
         ShortDescr = "Ralra", 
         Weight = 0, 
         HitRoll = 18, 
         Sex = "male", 
         LongDescr = "The wookiee Ralra is here.\
", 
         HitChance = 
         {
            HitNoDice = 18, 
            HitSizeDice = 10, 
            HitPlus = 900, 
         }, 
         DefaultPosition = "standing", 
         Credits = 450, 
         Level = 90, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamNoDice = 11, 
            DamPlus = 0, 
         }, 
         Vnum = 28605, 
         ArmorClass = -125, 
         Tag = "", 
         Name = "Ralra", 
      }, 
      [28606] = 
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
         Race = "Wookiee", 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         NumberOfAttacks = 0, 
         Languages = 
         {
            Speaks = 
            {
               [1] = "shyriiwook", 
            }, 
            Speaking = 
            {
               [1] = "shyriiwook", 
            }, 
         }, 
         VipFlags = 
         {
            [1] = "Kashyyyk", 
         }, 
         DamRoll = 0, 
         Description = "", 
         ShortDescr = "Rwookrrorro", 
         Weight = 0, 
         HitRoll = 0, 
         Sex = "male", 
         LongDescr = "The wookiee Rwookrrorro is sitting here.\
", 
         HitChance = 
         {
            HitNoDice = 18, 
            HitSizeDice = 10, 
            HitPlus = 900, 
         }, 
         DefaultPosition = "standing", 
         Credits = 420, 
         Level = 90, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamNoDice = 11, 
            DamPlus = 0, 
         }, 
         Vnum = 28606, 
         ArmorClass = -76, 
         Tag = "", 
         Name = "Rwookrrorro", 
      }, 
      [28607] = 
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
         Race = "Wookiee", 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         NumberOfAttacks = 0, 
         Languages = 
         {
            Speaks = 
            {
               [1] = "shyriiwook", 
            }, 
            Speaking = 
            {
               [1] = "shyriiwook", 
            }, 
         }, 
         VipFlags = 
         {
            [1] = "Kashyyyk", 
         }, 
         DamRoll = 17, 
         Description = "", 
         ShortDescr = "Chenlembec", 
         Weight = 0, 
         HitRoll = 18, 
         Sex = "male", 
         LongDescr = "Chenlembec is standing here.\
", 
         HitChance = 
         {
            HitNoDice = 18, 
            HitSizeDice = 10, 
            HitPlus = 900, 
         }, 
         DefaultPosition = "standing", 
         Credits = 420, 
         Level = 90, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamNoDice = 11, 
            DamPlus = 0, 
         }, 
         Vnum = 28607, 
         ArmorClass = -76, 
         Tag = "", 
         Name = "Chenlembec", 
      }, 
   }, 
   LowEconomy = 120898918, 
   Name = "kashyyyk", 
}
