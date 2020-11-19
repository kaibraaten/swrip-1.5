-- kashyyyk
-- Last saved Thursday 19-Nov-2020 14:31:09

AreaEntry
{
   VnumRanges = 
   {
      Mob = 
      {
         First = 28600, 
         Last = 28610, 
      }, 
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
   }, 
   Objects = 
   {
      [28610] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28610, 
         Cost = 0, 
         ShortDescr = "The corpse of Kueshlin", 
         Weight = 300, 
         Layers = 0, 
         Name = "Corpse of Kueshlin", 
         Description = "The corpse of Kueshlin lies here.", 
         ActionDescription = "", 
         ItemType = "trash", 
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
      [28600] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         Vnum = 28600, 
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
         ShortDescr = "a bowcaster", 
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
               ScriptType = "MProg", 
            }, 
         }, 
         Weight = 10, 
         Layers = 0, 
         Name = "bowcaster", 
         Description = "A crossbow type weapon has been carelessly left here.", 
         ActionDescription = "", 
         ItemType = "weapon", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
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
      }, 
      [28601] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         Vnum = 28601, 
         Cost = 50, 
         ShortDescr = "a quarrel", 
         Weight = 1, 
         Layers = 0, 
         Name = "quarrel", 
         Description = "A bowcaster quarrel is here.", 
         ActionDescription = "", 
         ItemType = "bolt", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
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
      }, 
      [28602] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [19] = "LargeSize", 
            [13] = "Inventory", 
         }, 
         Vnum = 28602, 
         Cost = 0, 
         ShortDescr = "a wookiee bandolier", 
         Affects = 
         {
            [1] = 
            {
               Modifier = 1, 
               Location = 18, 
            }, 
            [2] = 
            {
               Modifier = -3, 
               Location = 17, 
            }, 
            [3] = 
            {
               Modifier = 1, 
               Location = 27, 
            }, 
            [4] = 
            {
               Modifier = 8, 
               Location = 27, 
            }, 
         }, 
         Weight = 1, 
         Layers = 32, 
         Name = "bandolier", 
         Description = "A wookiee bandolier has been dropped here.", 
         ActionDescription = "", 
         ItemType = "container", 
         WearFlags = 
         {
            [0] = "Take", 
            [10] = "About", 
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
      }, 
      [28603] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         Vnum = 28603, 
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
         ShortDescr = "double barreled bowcaster", 
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
               ScriptType = "MProg", 
            }, 
         }, 
         Weight = 10, 
         Layers = 0, 
         Name = "dual double barreled bowcaster", 
         Description = "A large and wierd looking bowcaster is lying here.", 
         ActionDescription = "", 
         ItemType = "weapon", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
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
      }, 
      [28604] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28604, 
         Cost = 0, 
         ShortDescr = "a worshyr tree seed", 
         Layers = 0, 
         Weight = 1, 
         Name = "worshyr seed", 
         ActionDescription = "", 
         ItemType = "government", 
         Description = "The seed to a worshyr tree is lying here.", 
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
      [28605] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28605, 
         Cost = 20, 
         ShortDescr = "smoked gundar", 
         Weight = 1, 
         Layers = 0, 
         Name = "smoked gundar meat", 
         Description = "A piece of smoked gundar meat is attracting flies ", 
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
            [0] = 15, 
         }, 
      }, 
      [28606] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28606, 
         Cost = 0, 
         ShortDescr = "a package addressed to the wookiee Ralra", 
         Weight = 1, 
         Layers = 0, 
         Name = "package ralra", 
         Description = "A package is here for the wookiee known as Ralra on Kashyyyk.", 
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
      [28607] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28607, 
         Cost = 0, 
         ShortDescr = "&bA Fountain&R&W", 
         Layers = 0, 
         Weight = 1, 
         Name = "&bA Fountain&R&W", 
         ActionDescription = "", 
         ItemType = "fountain", 
         Description = "&bA Fountain is hollowed out of a tree trunk here.&R&W", 
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
      [28672] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Vnum = 28672, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Floating in a void", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "southwest", 
               Key = -1, 
               DestinationVnum = 28671, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [28673] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Vnum = 28673, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Floating in a void", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "northwest", 
               Key = -1, 
               DestinationVnum = 28671, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [28674] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Vnum = 28674, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Floating in a void", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28675, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28676, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28677, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [28675] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Vnum = 28675, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Floating in a void", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28674, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [28676] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Vnum = 28676, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Floating in a void", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28674, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [28677] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Vnum = 28677, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Floating in a void", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28674, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Flags = 
               {
                  [16] = "CanClimb", 
                  [19] = "Auto", 
                  [11] = "Hidden", 
                  [7] = "Climb", 
               }, 
               Description = "", 
               Direction = "somewhere", 
               Key = -1, 
               DestinationVnum = 28678, 
               Distance = 0, 
               Keyword = "crack", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [28678] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Vnum = 28678, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Floating in a void", 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [16] = "CanClimb", 
                  [7] = "Climb", 
               }, 
               Description = "", 
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 28652, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [28679] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 28679, 
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
      [28680] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 28680, 
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
      [28681] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 28681, 
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
      [28682] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 28682, 
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
      [28683] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 28683, 
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
      [28684] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 28684, 
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
      [28685] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 28685, 
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
      [28686] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 28686, 
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
      [28687] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 28687, 
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
      [28688] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 28688, 
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
      [28689] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 28689, 
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
      [28690] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 28690, 
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
      [28691] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 28691, 
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
      [28692] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 28692, 
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
      [28693] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 28693, 
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
      [28694] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 28694, 
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
      [28695] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 28695, 
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
      [28696] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 28696, 
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
      [28697] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 28697, 
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
      [28698] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 28698, 
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
      [28699] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 28699, 
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
      [28600] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Vnum = 28600, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Northern Nursery Ring", 
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
               DestinationVnum = 28601, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "You are in the northernmost side of Rwookrrorro's nursery ring.  This is\
where  all young Wookiees start thier lives.  Baby Wookiee's are being\
nursed here and slightly larger Wookiee children are sleeping here. You\
also here soothing music being played over an intercom. \
", 
      }, 
      [28601] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Vnum = 28601, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Central Nursery Ring", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28600, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28602, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28608, 
               Distance = 0, 
               Keyword = "", 
            }, 
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
      }, 
      [28602] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28602, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "You are standing in the southernmost nursery ring where Wookiee children\
are perfecting their climbing skills.  All around you, small Wookiees are\
climbing the branches which this room has been built around.  They dangle\
from often frightening heights, trusting their instructors to catch them\
should they fall. You can Climb up with the Wookiee children, you can go\
north the the toddler's area, or you can go South to a lift which will\
take you to Rwookrrorro's lower  levels.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28601, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28604, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Flags = 
               {
                  [16] = "CanClimb", 
               }, 
               Description = "", 
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 28603, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Southern Nursery Ring", 
      }, 
      [28603] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28603, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "You are holding tightly to a high branch above the nursery ring's climbing\
practice area.  All around you Wookiee children hang from branches, well\
most of them hang, a few have already fallen and had to be caught by the\
strong Wookiees standing below.  You just hope you have the strength to\
keep yourself  up.  The only exit is down, to the lower practice area.\
", 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [16] = "CanClimb", 
                  [7] = "Climb", 
               }, 
               Description = "", 
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 28602, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Upper level of the Nursery Climbing Area", 
      }, 
      [28604] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Vnum = 28604, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Litfcar", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28602, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 28605, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "You are in a liftcar at the top level of Rwookrrorro.  This level is\
dedicated to the nursery rings where young Wookiees are nursed and live\
until they can  climb and walk well enough to get around the city\
themselves.  You can exit to  the nursery rings to the north or you can\
ride the lift down.\
", 
      }, 
      [28605] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28605, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "You are in a liftcar at the middle level of Rwookrrorro.  This level is\
primarily residential.  As you look out of the lift you can see many doors\
carved into the main city's wroshyr tree to the west.  You can go North to\
the residential area or ride the liftcar up or down.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28610, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 28604, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 28606, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Liftcar", 
      }, 
      [28606] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28606, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "You are in a liftcar at the lowest level of the city of Rwookrrorro.  This\
level has a large commercial area as well as a residential area and access\
to the landing pad.  You can exit the liftcar to the east or you can ride\
the liftcar up or down. \
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28611, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 28605, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 28607, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Liftcar", 
      }, 
      [28607] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28607, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "You are in a liftcar below the lowest level of Rwookrrorro.  From here you\
have an amazing view, well two amazing views really.  One below you, into\
the deep green forrests of Kashyyyk. Above you is another amazing sight,\
the underside of the great Wookiee city Rwookrrorro.  The branches of the\
worshyr trees support the city kilometers off the ground.  They form\
spiderweb like patterns  because of their unique bonding properties, when\
two branches meet, they bond and send out more branches in new directions.\
 You can only ride the liftcar up.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28638, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 28606, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Liftcar", 
      }, 
      [28608] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28608, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "You are standing in the naughty children's corner.  Have you been\
naughty?? Bad little Wookiee children stand here facing the wall.\
As you stare at the wall you notice that the corner didn't actually \
settle down all the bad little children, one scratched something into the\
wall with his claw: it says,\"There once was a man from Corellia.\" The rest\
is too scuffed up to read.  From here you can go east to the Middle Nursery\
ring or south to the classroom.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28601, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28609, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "The \"Corner\"", 
      }, 
      [28609] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28609, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "You stand in the middle of a room filled with chairs.  One wall is\
almost entirely covered by an electronic chalkboard.  This is where\
the young Wookiees are taught to read and write.  Some children run\
around the room playing tag.  A teacher stands at the front of the room\
trying to settle down the children.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28608, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "The Classroom", 
      }, 
      [28610] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28610, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "The residential area is, obviously, loaded with houses of the wookiee\
people they are made from the natural material that surrounds the entire\
wookie world whish is wood, and some houses have plasteel windows.\
Wookiees pass you by, not to surprisingly this place is fairly crowded\
with wookiees and the wookiee children running about  seem to be playing a\
game of hide and seak with each other.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28619, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28605, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Residential Area", 
      }, 
      [28611] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28611, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "This place is crawling with wookiees as well as some other forms of beings,\
they seem to be to busy to even notice you getting off the lift car even\
though your pack to the gills with illegal weapons. The wookiee are far to\
interested with thier lives to have to pay any attention to you and your\
petty adventure through their home world. A word of advice, don't get them\
angry. \
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28612, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28618, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28606, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Commercial Area", 
      }, 
      [28612] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28612, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "This place is crawling with wookiees as well as some other forms of beings,\
they seem to be to busy to even notice you getting off the lift car even\
though your pack to the gills with illegal weapons. The wookiee are far to\
interested with thier lives to have to pay any attention to you and your\
petty adventure through their home world. A word of advice, don't get them\
angry. \
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28613, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28611, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Commercial Area", 
      }, 
      [28613] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28613, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "The landing pad is not to crowded, but it does have the odd technician\
working on ships that are in dire need of repair or tune ups. The place\
has the smell of the forest lingering in it as well as the smell of\
polished metal, coolant, and wet wookiee,  nothing entirely pleasant but\
livable. The walls that partially surround  the pad have the tools that\
the techs use for the repairs as well as some pictures of female wookiees\
in compromising positions. The only way out is back the way you came.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28612, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28639, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Landing Pad", 
      }, 
      [28614] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28614, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "This place seems to be crawling with wookiees as well as some other forms\
of beings, they seem to be to busy to even notice you enter the area even\
though you area loaded to the  gills with some of the more sofisticated\
weapons they have seen, besides their bowcasters. The wookiees are far to\
interested with their own lives to have to pay attention to you and your\
petty adventure through their home world. A word of advice, don't get them\
angery. The place is starting to get the smell of some freshly cooked food\
comeing from the south of here.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28616, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28615, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Commercial Area", 
      }, 
      [28615] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Vnum = 28615, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Delicious Foods and Drinks", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28614, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The shop has a very pleasent odur to it. With the carcuses of freshly\
skined animals packed on ice under the glass counter and some dried foods\
lining the walls you start to hear your stomach rumble with hunger. The\
wookiee behind the glass counter is very large andfor all you know he\
could be packing heat just in case someone like you decided to come in\
here and \"borrow\" some of her goods.\
", 
      }, 
      [28616] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28616, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "This place is crawling with wookiees as well as some other forms of beings,\
they seem to be to busy to even notice you getting off the lift car even\
though your pack to the gills with illegal weapons. The wookiee are far to\
interested with thier lives to have to pay any attention to you and your\
petty adventure through their home world. A word of advice, don't get them\
angry.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28618, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28614, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28617, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Commercial Area", 
      }, 
      [28617] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Vnum = 28617, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "The Cocked Bowcaster", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28616, 
               Distance = 0, 
               Keyword = "", 
            }, 
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
      }, 
      [28618] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28618, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "This place is crawling with wookiees as well as some other forms of beings,\
they seem to be to busy to even notice you getting off the lift car even\
though your pack to the gills with illegal weapons. The wookiee are far to\
interested with thier lives to have to pay any attention to you and your\
petty adventure through their home world. A word of advice, don't get them\
angry. \
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28611, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28616, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Commercial Area", 
      }, 
      [28619] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28619, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "The residential area is, obviously, loaded with houses of the wookiee\
people they are made from the natural material that surrounds the entire\
wookie world whish is wood, and some houses have plasteel windows.\
Wookiees pass you by, not to surprisingly this place is fairly crowded\
with wookiees and the wookiee children running about  seem to be playing a\
game of hide and seak with each other. \
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28625, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28620, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28626, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28610, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [5] = 
            {
               Description = "", 
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 28627, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Residential Area", 
      }, 
      [28620] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28620, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "The residential area is, obviously, loaded with houses of the wookiee\
people they are made from the natural material that surrounds the entire\
wookie world whish is wood, and some houses have plasteel windows.\
Wookiees pass you by, not to surprisingly this place is fairly crowded\
with wookiees and the wookiee children running about  seem to be playing a\
game of hide and seak with each other. \
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28622, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28624, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28621, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28619, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [5] = 
            {
               Description = "", 
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 28623, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [6] = 
            {
               Description = "", 
               Direction = "southwest", 
               Key = -1, 
               DestinationVnum = 28635, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Residential Area", 
      }, 
      [28621] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Vnum = 28621, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Worshyr Guests Trees House", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28620, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 28628, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This place has the smell of wookiees in as well as tons of wookiee fur has\
been shed over the funiture, which looks like it can fit a giant due to\
the size of them The place is well lit and has the cool breeze from teh\
open windows blowing through. There are stairs to this house which lead\
up.\
", 
      }, 
      [28622] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Vnum = 28622, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Worshyr Tree House", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28620, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 28629, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This place has the smell of wookiees in as well as tons of wookiee fur has\
been shed over the funiture, which looks like it can fit a giant due to\
the size of them The place is well lit and has the cool breeze from teh\
open windows blowing through. There are stairs to this house which lead\
up.\
", 
      }, 
      [28623] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Vnum = 28623, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Worshyr Tree House", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 28630, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 28620, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This place has the smell of wookiees in as well as tons of wookiee fur has\
been shed over the funiture, which looks like it can fit a giant due to\
the size of them The place is well lit and has the cool breeze from teh\
open windows blowing through. There are stairs to this house which lead\
up.\
", 
      }, 
      [28624] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Vnum = 28624, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Worshyr Tree House", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28620, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 28631, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This place has the smell of wookiees in as well as tons of wookiee fur has\
been shed over the funiture, which looks like it can fit a giant due to\
the size of them The place is well lit and has the cool breeze from teh\
open windows blowing through. There are stairs to this house which lead\
up.\
", 
      }, 
      [28625] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Vnum = 28625, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Worshyr Tree House", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28619, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 28632, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This place has the smell of wookiees in as well as tons of wookiee fur has\
been shed over the funiture, which looks like it can fit a giant due to\
the size of them The place is well lit and has the cool breeze from teh\
open windows blowing through. There are stairs to this house which lead\
up.\
", 
      }, 
      [28626] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Vnum = 28626, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Worshyr Tree House", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28619, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 28633, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This place has the smell of wookiees in as well as tons of wookiee fur has\
been shed over the funiture, which looks like it can fit a giant due to\
the size of them The place is well lit and has the cool breeze from teh\
open windows blowing through. There are stairs to this house which lead\
up.\
", 
      }, 
      [28627] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         Vnum = 28627, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Worshyr Tree House", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 28634, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 28619, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This place has the smell of wookiees in as well as tons of wookiee fur has\
been shed over the funiture, which looks like it can fit a giant due to\
the size of them The place is well lit and has the cool breeze from teh\
open windows blowing through. There are stairs to this house which lead\
up.\
", 
      }, 
      [28628] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         Vnum = 28628, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Guests room", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 28621, 
               Distance = 0, 
               Keyword = "", 
            }, 
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
      }, 
      [28629] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Vnum = 28629, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Upstairs Room", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 28622, 
               Distance = 0, 
               Keyword = "", 
            }, 
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
      }, 
      [28630] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Vnum = 28630, 
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
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 28623, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
      }, 
      [28631] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Vnum = 28631, 
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
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 28624, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
      }, 
      [28632] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Vnum = 28632, 
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
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 28625, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
      }, 
      [28633] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Vnum = 28633, 
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
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 28626, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
      }, 
      [28634] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         Vnum = 28634, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Upstairs Room", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 28627, 
               Distance = 0, 
               Keyword = "", 
            }, 
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
      }, 
      [28635] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         Vnum = 28635, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Worshyr Tree House", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 28636, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "northeast", 
               Key = -1, 
               DestinationVnum = 28620, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This place has the smell of wookiees in as well as tons of wookiee fur has\
been shed over the funiture, which looks like it can fit a giant due to\
the size of them The place is well lit and has the cool breeze from teh\
open windows blowing through. There are stairs to this house which lead\
up.\
", 
      }, 
      [28636] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         Vnum = 28636, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Upstairs Room", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 28635, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This place has the smell of wookiees in as well as tons of wookiee fur has\
been shed over the funiture, which looks like it can fit a giant due to\
the size of them The place is well lit and has the cool breeze from teh\
open windows blowing through. There are stairs to this house which lead\
up.\
", 
      }, 
      [28637] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Vnum = 28637, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Prison Net", 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [21] = "Searchable", 
                  [11] = "Hidden", 
               }, 
               Description = "", 
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 28638, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "You have been placed into a Kashyyk Prison Net. The rope is created from a\
a laser and blaster proof twine. Unfortunetly there seems to be no way\
down from these traps. As you glance across the horizon you notice that\
Kashyyyk is an incredibly attractive planet. To bad (unless you find\
someone to let you down) you will spend the rest of your life here.\
", 
      }, 
      [28638] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Vnum = 28638, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Tree Branch Covering", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28607, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "You are standing on tree branches that have grown years and years toghther\
to create a rather strong branch floor. As you look up you can see a small\
rope prison left here apparently by the ruling force here.\
", 
      }, 
      [28639] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [4] = "CanLand", 
            [5] = "CanFly", 
         }, 
         Vnum = 28639, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Landing Pad", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28613, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [28640] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Vnum = 28640, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Floating in a void", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28641, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [28641] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Vnum = 28641, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Floating in a void", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28640, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "northeast", 
               Key = -1, 
               DestinationVnum = 28642, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [28642] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Vnum = 28642, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Floating in a void", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28643, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "northeast", 
               Key = -1, 
               DestinationVnum = 28646, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "southwest", 
               Key = -1, 
               DestinationVnum = 28641, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [28643] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Vnum = 28643, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Floating in a void", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28642, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "southwest", 
               Key = -1, 
               DestinationVnum = 28644, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [28644] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Vnum = 28644, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Floating in a void", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28645, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "northeast", 
               Key = -1, 
               DestinationVnum = 28643, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [28645] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Vnum = 28645, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Floating in a void", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28644, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [28646] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Vnum = 28646, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Floating in a void", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "southeast", 
               Key = -1, 
               DestinationVnum = 28647, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "southwest", 
               Key = -1, 
               DestinationVnum = 28642, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [28647] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Vnum = 28647, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Floating in a void", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28648, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28662, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28655, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               Direction = "northwest", 
               Key = -1, 
               DestinationVnum = 28646, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [28648] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Vnum = 28648, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Floating in a void", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28649, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28647, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "northeast", 
               Key = -1, 
               DestinationVnum = 28651, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               Direction = "northwest", 
               Key = -1, 
               DestinationVnum = 28652, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [28649] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Vnum = 28649, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Floating in a void", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28650, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28648, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 28674, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [28650] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Vnum = 28650, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Floating in a void", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28654, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28649, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28653, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               Direction = "southeast", 
               Key = -1, 
               DestinationVnum = 28651, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [5] = 
            {
               Description = "", 
               Direction = "southwest", 
               Key = -1, 
               DestinationVnum = 28652, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [28651] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Vnum = 28651, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Floating in a void", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "northwest", 
               Key = -1, 
               DestinationVnum = 28650, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "southwest", 
               Key = -1, 
               DestinationVnum = 28648, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [28652] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Vnum = 28652, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Floating in a void", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "northeast", 
               Key = -1, 
               DestinationVnum = 28650, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "southeast", 
               Key = -1, 
               DestinationVnum = 28648, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [28653] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Vnum = 28653, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Floating in a void", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28650, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [28654] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Vnum = 28654, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Floating in a void", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28650, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [28655] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Vnum = 28655, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Floating in a void", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28647, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28661, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28659, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               Direction = "northwest", 
               Key = -1, 
               DestinationVnum = 28656, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [5] = 
            {
               Description = "", 
               Direction = "southeast", 
               Key = -1, 
               DestinationVnum = 28660, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [28656] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Vnum = 28656, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Floating in a void", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28657, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "southeast", 
               Key = -1, 
               DestinationVnum = 28655, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [28657] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Vnum = 28657, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Floating in a void", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28656, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28658, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [28658] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Vnum = 28658, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Floating in a void", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28657, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28659, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [28659] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Vnum = 28659, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Floating in a void", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28655, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28660, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28658, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [28660] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Vnum = 28660, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Floating in a void", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28661, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28659, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "northwest", 
               Key = -1, 
               DestinationVnum = 28655, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               Direction = "southwest", 
               Key = -1, 
               DestinationVnum = 28662, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [28661] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Vnum = 28661, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Floating in a void", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28660, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28655, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [28662] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Vnum = 28662, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Floating in a void", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28663, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28647, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "northeast", 
               Key = -1, 
               DestinationVnum = 28660, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [28663] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Vnum = 28663, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Floating in a void", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28664, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28662, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [28664] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Vnum = 28664, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Floating in a void", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28668, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28671, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28665, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28663, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [28665] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Vnum = 28665, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Floating in a void", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28664, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28666, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28667, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [28666] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Vnum = 28666, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Floating in a void", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28665, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [28667] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Vnum = 28667, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Floating in a void", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28665, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [28668] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Vnum = 28668, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Floating in a void", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28669, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28664, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "northeast", 
               Key = -1, 
               DestinationVnum = 28670, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [28669] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Vnum = 28669, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Floating in a void", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28668, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [28670] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Vnum = 28670, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Floating in a void", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "southwest", 
               Key = -1, 
               DestinationVnum = 28668, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [28671] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Vnum = 28671, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Floating in a void", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28664, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "northeast", 
               Key = -1, 
               DestinationVnum = 28672, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "southeast", 
               Key = -1, 
               DestinationVnum = 28673, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
   }, 
   FileFormatVersion = 1, 
   LowEconomy = 120903298, 
   Resets = 
   {
      [1] = 
      {
         MiscData = 1, 
         Arg1 = 28601, 
         Command = "M", 
         Arg3 = 28601, 
         Arg2 = 13, 
      }, 
      [2] = 
      {
         MiscData = 1, 
         Arg1 = 28604, 
         Command = "M", 
         Arg3 = 28602, 
         Arg2 = 6, 
      }, 
      [3] = 
      {
         MiscData = 1, 
         Arg1 = 28604, 
         Command = "M", 
         Arg3 = 28602, 
         Arg2 = 6, 
      }, 
      [4] = 
      {
         MiscData = 1, 
         Arg1 = 28604, 
         Command = "M", 
         Arg3 = 28602, 
         Arg2 = 6, 
      }, 
      [5] = 
      {
         MiscData = 1, 
         Arg1 = 28604, 
         Command = "M", 
         Arg3 = 28602, 
         Arg2 = 6, 
      }, 
      [6] = 
      {
         MiscData = 1, 
         Arg1 = 28604, 
         Command = "M", 
         Arg3 = 28602, 
         Arg2 = 6, 
      }, 
      [7] = 
      {
         MiscData = 1, 
         Arg1 = 28604, 
         Command = "M", 
         Arg3 = 28602, 
         Arg2 = 6, 
      }, 
      [8] = 
      {
         MiscData = 1, 
         Arg1 = 28602, 
         Command = "M", 
         Arg3 = 28609, 
         Arg2 = 1, 
      }, 
      [9] = 
      {
         MiscData = 1, 
         Arg1 = 28601, 
         Command = "M", 
         Arg3 = 28610, 
         Arg2 = 13, 
      }, 
      [10] = 
      {
         MiscData = 1, 
         Arg1 = 28603, 
         Command = "M", 
         Arg3 = 28610, 
         Arg2 = 12, 
      }, 
      [11] = 
      {
         MiscData = 1, 
         Arg1 = 28601, 
         Command = "M", 
         Arg3 = 28610, 
         Arg2 = 13, 
      }, 
      [12] = 
      {
         MiscData = 1, 
         Arg1 = 28603, 
         Command = "M", 
         Arg3 = 28610, 
         Arg2 = 12, 
      }, 
      [13] = 
      {
         MiscData = 1, 
         Arg1 = 28601, 
         Command = "M", 
         Arg3 = 28610, 
         Arg2 = 13, 
      }, 
      [14] = 
      {
         MiscData = 1, 
         Arg1 = 28603, 
         Command = "M", 
         Arg3 = 28610, 
         Arg2 = 12, 
      }, 
      [15] = 
      {
         MiscData = 1, 
         Arg1 = 28601, 
         Command = "M", 
         Arg3 = 28610, 
         Arg2 = 13, 
      }, 
      [16] = 
      {
         MiscData = 1, 
         Arg1 = 28603, 
         Command = "M", 
         Arg3 = 28610, 
         Arg2 = 12, 
      }, 
      [17] = 
      {
         MiscData = 1, 
         Arg1 = 28601, 
         Command = "M", 
         Arg3 = 28610, 
         Arg2 = 13, 
      }, 
      [18] = 
      {
         MiscData = 1, 
         Arg1 = 28603, 
         Command = "M", 
         Arg3 = 28610, 
         Arg2 = 12, 
      }, 
      [19] = 
      {
         MiscData = 1, 
         Arg1 = 28601, 
         Command = "M", 
         Arg3 = 28610, 
         Arg2 = 13, 
      }, 
      [20] = 
      {
         MiscData = 1, 
         Arg1 = 28603, 
         Command = "M", 
         Arg3 = 28610, 
         Arg2 = 12, 
      }, 
      [21] = 
      {
         MiscData = 1, 
         Arg1 = 28601, 
         Command = "M", 
         Arg3 = 28611, 
         Arg2 = 13, 
      }, 
      [22] = 
      {
         MiscData = 1, 
         Arg1 = 28603, 
         Command = "M", 
         Arg3 = 28611, 
         Arg2 = 12, 
      }, 
      [23] = 
      {
         MiscData = 1, 
         Arg1 = 28601, 
         Command = "M", 
         Arg3 = 28611, 
         Arg2 = 13, 
      }, 
      [24] = 
      {
         MiscData = 1, 
         Arg1 = 28603, 
         Command = "M", 
         Arg3 = 28611, 
         Arg2 = 12, 
      }, 
      [25] = 
      {
         MiscData = 1, 
         Arg1 = 28601, 
         Command = "M", 
         Arg3 = 28611, 
         Arg2 = 13, 
      }, 
      [26] = 
      {
         MiscData = 1, 
         Arg1 = 28603, 
         Command = "M", 
         Arg3 = 28611, 
         Arg2 = 12, 
      }, 
      [27] = 
      {
         MiscData = 1, 
         Arg1 = 28601, 
         Command = "M", 
         Arg3 = 28611, 
         Arg2 = 13, 
      }, 
      [28] = 
      {
         MiscData = 1, 
         Arg1 = 28603, 
         Command = "M", 
         Arg3 = 28611, 
         Arg2 = 12, 
      }, 
      [29] = 
      {
         MiscData = 1, 
         Arg1 = 28601, 
         Command = "M", 
         Arg3 = 28611, 
         Arg2 = 13, 
      }, 
      [30] = 
      {
         MiscData = 1, 
         Arg1 = 28603, 
         Command = "M", 
         Arg3 = 28611, 
         Arg2 = 12, 
      }, 
      [31] = 
      {
         MiscData = 1, 
         Arg1 = 28601, 
         Command = "M", 
         Arg3 = 28611, 
         Arg2 = 13, 
      }, 
      [32] = 
      {
         MiscData = 1, 
         Arg1 = 28603, 
         Command = "M", 
         Arg3 = 28611, 
         Arg2 = 12, 
      }, 
      [33] = 
      {
         MiscData = 1, 
         Arg1 = 28608, 
         Command = "M", 
         Arg3 = 28615, 
         Arg2 = 1, 
      }, 
      [34] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 305, 
         Command = "G", 
      }, 
      [35] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 32261, 
         Command = "G", 
      }, 
      [36] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 31522, 
         Command = "G", 
      }, 
      [37] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 10314, 
         Command = "G", 
      }, 
      [38] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 28605, 
         Command = "G", 
      }, 
      [39] = 
      {
         MiscData = 1, 
         Arg1 = 28600, 
         Command = "M", 
         Arg3 = 28617, 
         Arg2 = 1, 
      }, 
      [40] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 28603, 
         Command = "G", 
      }, 
      [41] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 28600, 
         Command = "G", 
      }, 
      [42] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 28602, 
         Command = "G", 
      }, 
      [43] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 28601, 
         Command = "G", 
      }, 
      [44] = 
      {
         MiscData = 1, 
         Arg1 = 28606, 
         Command = "M", 
         Arg3 = 28629, 
         Arg2 = 1, 
      }, 
      [45] = 
      {
         MiscData = 1, 
         Arg1 = 28602, 
         Command = "E", 
         Arg3 = 12, 
         Arg2 = 1, 
      }, 
      [46] = 
      {
         MiscData = 1, 
         Arg1 = 10424, 
         Command = "E", 
         Arg3 = 17, 
         Arg2 = 1, 
      }, 
      [47] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 28602, 
         Command = "G", 
      }, 
      [48] = 
      {
         MiscData = 0, 
         Arg1 = 28601, 
         Command = "P", 
         Arg3 = 0, 
         Arg2 = 1, 
      }, 
      [49] = 
      {
         MiscData = 1, 
         Arg1 = 28600, 
         Command = "E", 
         Arg3 = 16, 
         Arg2 = 1, 
      }, 
      [50] = 
      {
         MiscData = 1, 
         Arg1 = 28607, 
         Command = "M", 
         Arg3 = 28634, 
         Arg2 = 1, 
      }, 
      [51] = 
      {
         MiscData = 1, 
         Arg1 = 28602, 
         Command = "E", 
         Arg3 = 12, 
         Arg2 = 1, 
      }, 
      [52] = 
      {
         MiscData = 0, 
         Arg1 = 28601, 
         Command = "P", 
         Arg3 = 0, 
         Arg2 = 1, 
      }, 
      [53] = 
      {
         MiscData = 1, 
         Arg1 = 28600, 
         Command = "E", 
         Arg3 = 16, 
         Arg2 = 1, 
      }, 
      [54] = 
      {
         MiscData = 1, 
         Arg1 = 32229, 
         Command = "E", 
         Arg3 = 19, 
         Arg2 = 1, 
      }, 
      [55] = 
      {
         MiscData = 1, 
         Arg1 = 28605, 
         Command = "M", 
         Arg3 = 28636, 
         Arg2 = 1, 
      }, 
      [56] = 
      {
         MiscData = 1, 
         Arg1 = 10424, 
         Command = "E", 
         Arg3 = 17, 
         Arg2 = 1, 
      }, 
      [57] = 
      {
         MiscData = 1, 
         Arg1 = 28610, 
         Command = "M", 
         Arg3 = 28638, 
         Arg2 = 1, 
      }, 
      [58] = 
      {
         MiscData = 1, 
         Arg1 = 90, 
         Command = "O", 
         Arg3 = 28612, 
         Arg2 = 1, 
      }, 
      [59] = 
      {
         MiscData = 1, 
         Arg1 = 28607, 
         Command = "O", 
         Arg3 = 28619, 
         Arg2 = 1, 
      }, 
   }, 
   ResetMessage = "The wind blows throw the leaves of the Worshyr trees.", 
   Author = "Thrawn", 
   Name = "kashyyyk", 
   ResetFrequency = 20, 
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
   Filename = "kashyyyk.lua", 
   Mobiles = 
   {
      [28608] = 
      {
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 4, 
            DamNoDice = 5, 
         }, 
         Position = "standing", 
         HitChance = 
         {
            HitPlus = 400, 
            HitSizeDice = 10, 
            HitNoDice = 8, 
         }, 
         ShortDescr = "a female wookiee", 
         Race = "Wookiee", 
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
            KeeperShortDescr = "a female wookiee", 
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
               [1] = "shyriiwook", 
               [0] = "basic", 
            }, 
            Speaking = 
            {
               [1] = "shyriiwook", 
            }, 
         }, 
         NumberOfAttacks = 0, 
         Sex = "male", 
         HitRoll = 4, 
         Vnum = 28608, 
         Height = 0, 
         VipFlags = 
         {
            [1] = "Kashyyyk", 
         }, 
         Immune = 
         {
            [20] = "magic", 
            [11] = "charm", 
         }, 
         Credits = 200, 
         DamRoll = 4, 
         Level = 40, 
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
         Name = "female wookiee shop owner", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A wookiee female minds the shop.\
", 
         ArmorClass = 20, 
      }, 
      [28610] = 
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
         ShortDescr = "Kueshlin", 
         Race = "Wookiee", 
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
         DamRoll = 21, 
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
         NumberOfAttacks = 2, 
         Sex = "undistinguished", 
         HitRoll = 21, 
         Vnum = 28610, 
         Height = 0, 
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
         Credits = 0, 
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
               ScriptType = "MProg", 
            }, 
         }, 
         Level = 105, 
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
            [27] = "NoCorpse", 
         }, 
         Name = "Kueshlin", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A fierce wookie lurks near the tree trunk.\
", 
         ArmorClass = -162, 
      }, 
      [28600] = 
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
            HitPlus = 400, 
            HitSizeDice = 10, 
            HitNoDice = 8, 
         }, 
         ShortDescr = "a wookiee shop owner", 
         Race = "Wookiee", 
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
            KeeperShortDescr = "a wookiee shop owner", 
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
               [1] = "shyriiwook", 
            }, 
            Speaking = 
            {
               [1] = "shyriiwook", 
               [0] = "basic", 
            }, 
         }, 
         NumberOfAttacks = 0, 
         Sex = "male", 
         HitRoll = 8, 
         Vnum = 28600, 
         Height = 0, 
         VipFlags = 
         {
            [1] = "Kashyyyk", 
         }, 
         Immune = 
         {
            [20] = "magic", 
            [11] = "charm", 
         }, 
         Credits = 200, 
         DamRoll = 8, 
         Level = 40, 
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
         Name = "Wookiee shop owner", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A rather large wookiee is behind the counter here.\
", 
         ArmorClass = 20, 
      }, 
      [28601] = 
      {
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 1, 
         }, 
         Position = "standing", 
         HitChance = 
         {
            HitPlus = 120, 
            HitSizeDice = 10, 
            HitNoDice = 2, 
         }, 
         ShortDescr = "a female wookiee ", 
         Race = "Wookiee", 
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
               [1] = "shyriiwook", 
            }, 
            Speaking = 
            {
               [1] = "shyriiwook", 
            }, 
         }, 
         HitRoll = 0, 
         Vnum = 28601, 
         Height = 0, 
         Sex = "undistinguished", 
         VipFlags = 
         {
            [1] = "Kashyyyk", 
         }, 
         Credits = 20, 
         DamRoll = 2, 
         Level = 10, 
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
         Name = "wookiee female", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A female wookiee is walking around.\
", 
         ArmorClass = 67, 
      }, 
      [28602] = 
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
         ShortDescr = "A Wookiee Teacher", 
         Race = "Wookiee", 
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
         DamRoll = 0, 
         NumberOfAttacks = 0, 
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
         HitRoll = 0, 
         Vnum = 28602, 
         Height = 0, 
         Sex = "female", 
         VipFlags = 
         {
            [1] = "Kashyyyk", 
         }, 
         Credits = 0, 
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
               ScriptType = "MProg", 
            }, 
         }, 
         Level = 50, 
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
            [10] = "Practice", 
         }, 
         Name = "A Wookiee Teacher", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A teacher stands here trying to make the rowdy children learn something.\
", 
         ArmorClass = 0, 
      }, 
      [28603] = 
      {
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 1, 
         }, 
         Position = "standing", 
         HitChance = 
         {
            HitPlus = 120, 
            HitSizeDice = 10, 
            HitNoDice = 2, 
         }, 
         ShortDescr = "a wookiee male", 
         Race = "Wookiee", 
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
               [1] = "shyriiwook", 
            }, 
            Speaking = 
            {
               [1] = "shyriiwook", 
            }, 
         }, 
         HitRoll = 0, 
         Vnum = 28603, 
         Height = 0, 
         Sex = "undistinguished", 
         VipFlags = 
         {
            [1] = "Kashyyyk", 
         }, 
         Credits = 20, 
         DamRoll = 0, 
         Level = 10, 
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
         Name = "wookiee male", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A wookiee male is looking around here.\
", 
         ArmorClass = 67, 
      }, 
      [28604] = 
      {
         Damage = 
         {
            DamPlus = 3, 
            DamSizeDice = 3, 
            DamNoDice = 1, 
         }, 
         Position = "standing", 
         HitChance = 
         {
            HitPlus = 30, 
            HitSizeDice = 1, 
            HitNoDice = 1, 
         }, 
         ShortDescr = "a wookiee child", 
         Race = "Wookiee", 
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
         HitRoll = 0, 
         Vnum = 28604, 
         Height = 0, 
         Sex = "male", 
         VipFlags = 
         {
            [1] = "Kashyyyk", 
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
            [7] = "Wimpy", 
         }, 
         Name = "wookiee child", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A wookiee child is playing around here.\
", 
         ArmorClass = 0, 
      }, 
      [28605] = 
      {
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 4, 
            DamNoDice = 11, 
         }, 
         Position = "standing", 
         HitChance = 
         {
            HitPlus = 900, 
            HitSizeDice = 10, 
            HitNoDice = 18, 
         }, 
         ShortDescr = "Ralra", 
         Race = "Wookiee", 
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
         DamRoll = 17, 
         NumberOfAttacks = 0, 
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
         HitRoll = 18, 
         Vnum = 28605, 
         Height = 0, 
         Sex = "male", 
         VipFlags = 
         {
            [1] = "Kashyyyk", 
         }, 
         Credits = 450, 
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
               ScriptType = "MProg", 
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
               ScriptType = "MProg", 
            }, 
         }, 
         Level = 90, 
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
            [30] = "Prototype", 
         }, 
         Name = "Ralra", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "The wookiee Ralra is here.\
", 
         ArmorClass = -125, 
      }, 
      [28606] = 
      {
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 4, 
            DamNoDice = 11, 
         }, 
         Position = "standing", 
         HitChance = 
         {
            HitPlus = 900, 
            HitSizeDice = 10, 
            HitNoDice = 18, 
         }, 
         ShortDescr = "Rwookrrorro", 
         Race = "Wookiee", 
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
               [1] = "shyriiwook", 
            }, 
            Speaking = 
            {
               [1] = "shyriiwook", 
            }, 
         }, 
         HitRoll = 0, 
         Vnum = 28606, 
         Height = 0, 
         Sex = "male", 
         VipFlags = 
         {
            [1] = "Kashyyyk", 
         }, 
         Credits = 420, 
         DamRoll = 0, 
         Level = 90, 
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
         Name = "Rwookrrorro", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "The wookiee Rwookrrorro is sitting here.\
", 
         ArmorClass = -76, 
      }, 
      [28607] = 
      {
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 4, 
            DamNoDice = 11, 
         }, 
         Position = "standing", 
         HitChance = 
         {
            HitPlus = 900, 
            HitSizeDice = 10, 
            HitNoDice = 18, 
         }, 
         ShortDescr = "Chenlembec", 
         Race = "Wookiee", 
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
               [1] = "shyriiwook", 
            }, 
            Speaking = 
            {
               [1] = "shyriiwook", 
            }, 
         }, 
         HitRoll = 18, 
         Vnum = 28607, 
         Height = 0, 
         Sex = "male", 
         VipFlags = 
         {
            [1] = "Kashyyyk", 
         }, 
         Credits = 420, 
         DamRoll = 17, 
         Level = 90, 
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
         Name = "Chenlembec", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "Chenlembec is standing here.\
", 
         ArmorClass = -76, 
      }, 
   }, 
}
