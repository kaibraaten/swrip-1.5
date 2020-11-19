-- Gamorr
-- Last saved Thursday 19-Nov-2020 14:31:09

AreaEntry
{
   VnumRanges = 
   {
      Mob = 
      {
         First = 28000, 
         Last = 28139, 
      }, 
      Object = 
      {
         First = 28000, 
         Last = 28199, 
      }, 
      Room = 
      {
         First = 28000, 
         Last = 28199, 
      }, 
   }, 
   Objects = 
   {
      [28100] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [1] = "Hum", 
            [30] = "Prototype", 
         }, 
         Vnum = 28100, 
         Cost = 0, 
         ShortDescr = "A Noghri Blaster", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "use_prog", 
               Code = "mpechoat $n The power of this weapon flows into your soul.\
mpechoaround $n You wet yourself when $n wields a Noghri blaster\
", 
               Arguments = "100", 
               ScriptType = "MProg", 
            }, 
         }, 
         Affects = 
         {
            [1] = 
            {
               Modifier = 5, 
               Location = 19, 
            }, 
            [2] = 
            {
               Modifier = 5, 
               Location = 18, 
            }, 
         }, 
         Layers = 0, 
         Weight = 1, 
         Description = "A sleak and deadly blaster lies on the ground here.", 
         ActionDescription = "", 
         ItemType = "trash", 
         Name = "SUPER noghri blaster thingy", 
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
      [28120] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         Vnum = 28120, 
         Cost = 0, 
         ShortDescr = "A large Morrt", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "wear_prog", 
               Code = "mpechoat $n The Morrt tears into your flesh.\
mpechoaround $n A morrt is tearing into $n's flash!!\
mpdamage $n 10\
", 
               Arguments = "100", 
               ScriptType = "MProg", 
            }, 
            [2] = 
            {
               MudProgType = "remove_prog", 
               Code = "mpechoat $n You rip a morrt from you neck.\
mpechoaround $n Blood runs down $n's neck.\
mpdamage $n 20\
", 
               Arguments = "100", 
               ScriptType = "MProg", 
            }, 
            [3] = 
            {
               MudProgType = "damage_prog", 
               Code = "mpechoat $n Your morrt gets injured and bites you harder. OUCH!!\
mpdamage $n 5\
mpechoaround $n $n's Morrt Screams in pain!\
", 
               Arguments = "100", 
               ScriptType = "MProg", 
            }, 
         }, 
         Weight = 10, 
         Layers = 8, 
         Name = "morrt", 
         Description = "A hungry Morrt is crawling on the ground here.", 
         ActionDescription = "", 
         ItemType = "armor", 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
         }, 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
      }, 
      [28187] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28187, 
         Cost = 0, 
         ShortDescr = "mountain clan insignia", 
         Weight = 1, 
         Layers = 0, 
         Name = "mountain clan insignia", 
         Description = "A clan insignia is collecting dust on the ground here.", 
         ActionDescription = "", 
         ItemType = "armor", 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
         }, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
      }, 
      [28188] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [0] = "Glow", 
            [8] = "Bless", 
         }, 
         Vnum = 28188, 
         Cost = 0, 
         ShortDescr = "a mountain clan helm", 
         Weight = 1, 
         Layers = 128, 
         Name = "mountain clan helm helmet", 
         Description = "A helmet is lying on the ground attracting flies.", 
         ActionDescription = "", 
         ItemType = "armor", 
         WearFlags = 
         {
            [0] = "Take", 
            [4] = "Head", 
         }, 
         ObjectValues = 
         {
            [1] = 20, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 20, 
         }, 
      }, 
      [28189] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         Vnum = 28189, 
         Cost = 20000, 
         ShortDescr = "a Large battle axe", 
         Affects = 
         {
            [1] = 
            {
               Modifier = 3, 
               Location = 18, 
            }, 
            [2] = 
            {
               Modifier = 3, 
               Location = 19, 
            }, 
         }, 
         Weight = 10, 
         Layers = 0, 
         Name = "a Large battle axe", 
         Description = "A very large battle axe gleams in the dirt.", 
         ActionDescription = "", 
         ItemType = "weapon", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 3, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 12, 
         }, 
      }, 
      [28000] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28000, 
         Cost = 0, 
         ShortDescr = "White contact lenses.", 
         Weight = 1, 
         Layers = 0, 
         Name = "white contacts blites", 
         Description = "Blite has dropped his colour contacts here.", 
         ActionDescription = "", 
         ItemType = "trash", 
         WearFlags = 
         {
            [17] = "Eyes", 
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
      [28001] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28001, 
         Cost = 0, 
         ShortDescr = "A baby Gamorrean", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Code = "mpecho The baby Gamorrean squeals loudly!\
", 
               Arguments = "100", 
               ScriptType = "MProg", 
            }, 
            [2] = 
            {
               MudProgType = "use_prog", 
               Code = "mpechoat $n The Gamorrean baby SCREAMS in terror as you swallow it whole\
mpechoaround $n The Gamorrean baby SCREAMS in shear terror as $n eats it!!!!\
", 
               Arguments = "100", 
               ScriptType = "MProg", 
            }, 
         }, 
         Weight = 1, 
         Layers = 0, 
         Name = "baby gamorrean pig piglet piggy swine", 
         Description = "A baby Gamorrean is lying here.", 
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
      [28002] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28002, 
         Cost = 0, 
         ShortDescr = "A Blue lightsaber ", 
         Affects = 
         {
            [1] = 
            {
               Modifier = 4, 
               Location = 19, 
            }, 
            [2] = 
            {
               Modifier = 3, 
               Location = 18, 
            }, 
         }, 
         Weight = 1, 
         Layers = 0, 
         Name = "A Blue Lightsaber", 
         Description = "A Blue lightsaber glows here.", 
         ActionDescription = "", 
         ItemType = "weapon", 
         WearFlags = 
         {
            [13] = "Wield", 
         }, 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 6, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
      }, 
      [28003] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28003, 
         Cost = 100, 
         ShortDescr = "A Small leather cap ", 
         Layers = 0, 
         Weight = 10, 
         Name = "A Leather cap", 
         ActionDescription = "", 
         ItemType = "armor", 
         Description = "A Small leather cap is lying here ", 
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
      [28004] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28004, 
         Cost = 10000, 
         ShortDescr = "a war hammer", 
         Affects = 
         {
            [1] = 
            {
               Modifier = 2, 
               Location = 19, 
            }, 
            [2] = 
            {
               Modifier = 2, 
               Location = 18, 
            }, 
         }, 
         Weight = 15, 
         Layers = 0, 
         Name = "war hammer", 
         Description = "A heavy looking hammer lies on the ground.", 
         ActionDescription = "", 
         ItemType = "weapon", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 5, 
            [3] = 7, 
            [4] = 0, 
            [5] = 0, 
            [0] = 100, 
         }, 
      }, 
      [28005] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28005, 
         Cost = 100, 
         ShortDescr = "a pair of leather boots", 
         Weight = 1, 
         Layers = 128, 
         Name = "leather boots", 
         Description = "A pair of boots lay crumpled on the ground.", 
         ActionDescription = "", 
         ItemType = "armor", 
         WearFlags = 
         {
            [0] = "Take", 
            [6] = "Feet", 
         }, 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
      }, 
      [28006] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28006, 
         Cost = 100, 
         ShortDescr = "a large wooden shield", 
         Weight = 5, 
         Layers = 128, 
         Name = "large wooden shield", 
         Description = "Someone has carelessly drop a wooden shield here.", 
         ActionDescription = "", 
         ItemType = "armor", 
         WearFlags = 
         {
            [0] = "Take", 
            [9] = "Shield", 
         }, 
         ObjectValues = 
         {
            [1] = 10, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
      }, 
      [28007] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [8] = "Bless", 
            [13] = "Inventory", 
            [0] = "Glow", 
            [19] = "LargeSize", 
         }, 
         Vnum = 28007, 
         Cost = 0, 
         ShortDescr = "a war axe", 
         Affects = 
         {
            [1] = 
            {
               Modifier = -3, 
               Location = 2, 
            }, 
            [2] = 
            {
               Modifier = 10, 
               Location = 46, 
            }, 
            [3] = 
            {
               Modifier = 4, 
               Location = 19, 
            }, 
            [4] = 
            {
               Modifier = 50, 
               Location = 11, 
            }, 
            [5] = 
            {
               Modifier = -10, 
               Location = 51, 
            }, 
            [6] = 
            {
               Modifier = -100, 
               Location = 14, 
            }, 
         }, 
         Weight = 10, 
         Layers = 0, 
         Name = "war axe", 
         Description = "A magnificent looking axe has been carlessly drop here.", 
         ActionDescription = "", 
         ItemType = "weapon", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         ObjectValues = 
         {
            [1] = 8, 
            [2] = 4, 
            [3] = 1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 12, 
         }, 
      }, 
      [28008] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         Vnum = 28008, 
         Cost = 0, 
         ShortDescr = "15 morrts", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "wear_prog", 
               Code = "mpechoat $n You cover you body with 15 Morrts.\
mpdamage $n 50\
mpechoaround $n $n covers $s body with Morrts!\
", 
               Arguments = "100", 
               ScriptType = "MProg", 
            }, 
            [2] = 
            {
               MudProgType = "remove_prog", 
               Code = "mpechoat $n You slowly remove the Morrts from you body.\
mpdamage $n 75\
mpechoaround $n $n slowly removes 15 morrts from $s body\
", 
               Arguments = "100", 
               ScriptType = "MProg", 
            }, 
         }, 
         Weight = 5, 
         Layers = 4, 
         Name = "morrts 15", 
         Description = "A small group of Morrts are here relaxing.", 
         ActionDescription = "", 
         ItemType = "armor", 
         WearFlags = 
         {
            [0] = "Take", 
            [3] = "Body", 
         }, 
         ObjectValues = 
         {
            [1] = 3, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 3, 
         }, 
      }, 
      [28009] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28009, 
         Cost = 0, 
         ShortDescr = "20 morrts", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "wear_prog", 
               Code = "mpechoat $n You cover your body with 20 Morrts.\
mpdamage $n 80\
mpechoaround $n $n covers $s body with 20 Morrts!\
", 
               Arguments = "100", 
               ScriptType = "MProg", 
            }, 
            [2] = 
            {
               MudProgType = "remove_prog", 
               Code = "mpechoat $n You slowly remove the Morrts from your body.\
mpdamage $n 85\
mpechoaround $n $n  slowly remove 20 morrts $s body.\
", 
               Arguments = "100", 
               ScriptType = "MProg", 
            }, 
         }, 
         Weight = 5, 
         Layers = 8, 
         Name = "morrts 20", 
         Description = "A large group of Morrts are huddled together here", 
         ActionDescription = "", 
         ItemType = "armor", 
         WearFlags = 
         {
            [0] = "Take", 
            [3] = "Body", 
         }, 
         ObjectValues = 
         {
            [1] = 3, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 3, 
         }, 
      }, 
      [28010] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         Vnum = 28010, 
         Cost = 0, 
         ShortDescr = "25 Morrts", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "wear_prog", 
               Code = "mpechoat $n You cover your body with 25 Morrts.\
mpdamage $n 250\
mpechoaround $n $n covers $s body with Morrts!\
", 
               Arguments = "100", 
               ScriptType = "MProg", 
            }, 
            [2] = 
            {
               MudProgType = "remove_prog", 
               Code = "mpechoat $n You slowly remove the morrts from you body.\
mpdamage $n 300\
mpechoaround $n $n slowly removes 25 morrts from $s body.\
mpechoaround $n You feel $s pain.\
", 
               Arguments = "100", 
               ScriptType = "MProg", 
            }, 
         }, 
         Weight = 5, 
         Layers = 12, 
         Name = "morrts 25", 
         Description = "A bunch of Morrts lay huddled together", 
         ActionDescription = "", 
         ItemType = "armor", 
         WearFlags = 
         {
            [0] = "Take", 
            [3] = "Body", 
         }, 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
      }, 
      [28011] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28011, 
         Cost = 10, 
         ShortDescr = "Gurda skin", 
         Weight = 2, 
         Layers = 12, 
         Name = "skin", 
         Description = "A piece of fur is lying here collecting flies.", 
         ActionDescription = "", 
         ItemType = "armor", 
         WearFlags = 
         {
            [0] = "Take", 
            [11] = "Waist", 
         }, 
         ObjectValues = 
         {
            [1] = 10, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
      }, 
      [28012] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         Vnum = 28012, 
         Cost = 0, 
         ShortDescr = "a pike", 
         Weight = 1, 
         Layers = 0, 
         Name = "pike", 
         Description = "A pike is lying in your way here.", 
         ActionDescription = "", 
         ItemType = "weapon", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
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
      [28013] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28013, 
         Cost = 0, 
         ShortDescr = "An arm of a tourist", 
         Layers = 0, 
         Weight = 1, 
         Name = "arm limb", 
         ActionDescription = "", 
         ItemType = "trash", 
         Description = "An arm of a tourist", 
         ObjectValues = 
         {
            [1] = 13, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 13, 
         }, 
      }, 
      [28014] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28014, 
         Cost = 0, 
         ShortDescr = "&r a pool of blood&Y", 
         Layers = 0, 
         Weight = 1, 
         Name = "blood", 
         ActionDescription = "", 
         ItemType = "trash", 
         Description = "&r a pool of blood&Y", 
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
      [28015] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         Vnum = 28015, 
         Cost = 120, 
         ShortDescr = "a metal helm", 
         Weight = 3, 
         Layers = 128, 
         Name = "metal helmet gamorrean", 
         Description = "Some clumsy Gamorrean has drop his helmet", 
         ActionDescription = "", 
         ItemType = "armor", 
         WearFlags = 
         {
            [0] = "Take", 
            [4] = "Head", 
         }, 
         ObjectValues = 
         {
            [1] = 6, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 6, 
         }, 
      }, 
      [28016] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         Vnum = 28016, 
         Cost = 150, 
         ShortDescr = "metal boots", 
         Weight = 1, 
         Layers = 0, 
         Name = "metal boots", 
         Description = "A pair of metal boots are attracting flies here.", 
         ActionDescription = "", 
         ItemType = "armor", 
         WearFlags = 
         {
            [0] = "Take", 
            [6] = "Feet", 
         }, 
         ObjectValues = 
         {
            [1] = 7, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 7, 
         }, 
      }, 
      [28017] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         Vnum = 28017, 
         Cost = 200, 
         ShortDescr = "wrist guards", 
         Weight = 3, 
         Layers = 64, 
         Name = "wrist guards", 
         Description = "Some clumsy Gamorrean has drop his wrist guards here", 
         ActionDescription = "", 
         ItemType = "armor", 
         WearFlags = 
         {
            [0] = "Take", 
            [12] = "Wrist", 
         }, 
         ObjectValues = 
         {
            [1] = 7, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 7, 
         }, 
      }, 
      [28018] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28018, 
         Cost = 0, 
         ShortDescr = "Imperial cargo ship", 
         Layers = 0, 
         Weight = 1, 
         Name = "imperial cargo cruiser", 
         ActionDescription = "", 
         ItemType = "trash", 
         Description = "An Imperial cargo ship has landed here.", 
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
      [28019] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         Vnum = 28019, 
         Cost = 0, 
         ShortDescr = "a pink wig", 
         Weight = 1, 
         Layers = 0, 
         Name = "pink wig", 
         Description = "A dirty, bright pink wig is being trampled by people here.", 
         ActionDescription = "", 
         ItemType = "armor", 
         WearFlags = 
         {
            [0] = "Take", 
            [4] = "Head", 
         }, 
         ObjectValues = 
         {
            [1] = 3, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 3, 
         }, 
      }, 
      [28020] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28020, 
         Cost = 100, 
         ShortDescr = "a hand axe", 
         Weight = 3, 
         Layers = 0, 
         Name = "hand axe", 
         Description = "A clumsy gamorrean has carlessly drop his axe here.", 
         ActionDescription = "", 
         ItemType = "weapon", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
            [14] = "Hold", 
         }, 
         ObjectValues = 
         {
            [1] = 4, 
            [2] = 3, 
            [3] = 3, 
            [4] = 0, 
            [5] = 0, 
            [0] = 12, 
         }, 
      }, 
      [28021] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28021, 
         Cost = 0, 
         ShortDescr = "a crate", 
         Layers = 0, 
         Weight = 100, 
         Name = "crate box", 
         ActionDescription = "", 
         ItemType = "container", 
         Description = "A large crate is here.", 
         ObjectValues = 
         {
            [1] = 1, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 500, 
         }, 
      }, 
      [28022] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28022, 
         Cost = 0, 
         ShortDescr = "an infant watch-beast", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "get_prog", 
               Code = "mpechoat $n An infant watch-beast claws at you!\
mpdamage $n 10\
mpechoaround $n An infant watch-beast claws at $n!\
mpforce $n put infant crate\
", 
               Arguments = "100", 
               ScriptType = "MProg", 
            }, 
         }, 
         Layers = 0, 
         Weight = 1, 
         Name = "infant gamorrean watch beats", 
         ActionDescription = "", 
         ItemType = "trash", 
         Description = "An infant watch-beast is sitting here.", 
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
      [28023] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28023, 
         Cost = 0, 
         ShortDescr = "The Gamorrean cube ship Zireex", 
         Layers = 0, 
         Weight = 1, 
         Name = "ship cube zicreex", 
         ActionDescription = "", 
         ItemType = "spacecraft", 
         Description = "The gamorrean cube ship Zicreex is parked here.", 
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
      [28024] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         Vnum = 28024, 
         Cost = 0, 
         ShortDescr = "metal shoulder plates", 
         Weight = 3, 
         Layers = 0, 
         Name = "metal shoulder plates", 
         Description = "Metal shoulder plates have been carelessly drop here.", 
         ActionDescription = "", 
         ItemType = "armor", 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
         }, 
         ObjectValues = 
         {
            [1] = 6, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
      }, 
      [28025] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [4] = "Contraband", 
            [19] = "LargeSize", 
         }, 
         Vnum = 28025, 
         Cost = 500, 
         ShortDescr = "a vibro-axe", 
         Affects = 
         {
            [1] = 
            {
               Modifier = 3, 
               Location = 18, 
            }, 
            [2] = 
            {
               Modifier = 3, 
               Location = 19, 
            }, 
         }, 
         Weight = 10, 
         Layers = 0, 
         Name = "vibro axe", 
         Description = "A vibro-axe vibro axe is here collecting dust.", 
         ActionDescription = "", 
         ItemType = "weapon", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 3, 
            [3] = 1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 12, 
         }, 
      }, 
      [28026] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28026, 
         Cost = 0, 
         ShortDescr = "scraps of a ship", 
         Weight = 1, 
         Layers = 0, 
         Name = "ship scraps", 
         Description = "The scraps of a ship lie here.", 
         ActionDescription = "", 
         ItemType = "durasteel", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
      }, 
      [28027] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28027, 
         Cost = 0, 
         ShortDescr = "a mud hole", 
         Layers = 0, 
         Weight = 1, 
         Name = "mud hole", 
         ActionDescription = "", 
         ItemType = "trash", 
         Description = "A rather large mud hole.", 
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
      [28028] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [0] = "Glow", 
         }, 
         Vnum = 28028, 
         Cost = 0, 
         ShortDescr = "a beautiful axe", 
         Layers = 0, 
         Weight = 1, 
         Description = "A beautifuly crafted axe is on a pedestal here.", 
         ActionDescription = "", 
         ItemType = "government", 
         Name = "cerimonial axe", 
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
      [28029] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28029, 
         Cost = 0, 
         ShortDescr = "a cerimonial shield", 
         Layers = 0, 
         Weight = 1, 
         Name = "cerimonial shield", 
         ActionDescription = "", 
         ItemType = "government", 
         Description = "A fine shield is being displayed on a mantel.", 
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
      [28030] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28030, 
         Cost = 0, 
         ShortDescr = "a sacred stone", 
         Layers = 0, 
         Weight = 1, 
         Name = "sacred stone", 
         ActionDescription = "", 
         ItemType = "government", 
         Description = "The sacred stone of the Mountains is here.", 
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
      [28199] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28199, 
         Cost = 0, 
         ShortDescr = "a newly created chair", 
         Layers = 0, 
         Weight = 1, 
         Name = "chair", 
         ActionDescription = "", 
         ItemType = "furniture", 
         Description = "Some god dropped a newly created chair here.", 
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
      [28160] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28160, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "This is a small hut. Its main purpose in life is to shealter the males\
from the rain or the harsh rays of the afternoon sun. The Hut is made\
from wood scavenged from the near by forest and held together with\
mud and clay. It is also stune with blankets and there is the odd\
hamock streched out from wall to post here and there. \
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28151, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A hut.", 
      }, 
      [28161] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28161, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "This is a small hut. Its main purpose in life is to shealter the males\
from the rain or the harsh rays of the afternoon sun. The Hut is made\
from wood scavenged from the near by forest and held together with\
mud and clay. It is also stune with blankets and there is the odd\
hamock streched out from wall to post here and there. \
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28151, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A hut.", 
      }, 
      [28162] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28162, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "This is a small hut. Its main purpose in life is to shealter the males\
from the rain or the harsh rays of the afternoon sun. The Hut is made\
from wood scavenged from the near by forest and held together with\
mud and clay. It is also stune with blankets and there is the odd\
hamock streched out from wall to post here and there. \
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28151, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A hut.", 
      }, 
      [28163] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28163, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "The Gamorrean deset stretches on for miles. It is hot and you start to\
sweat almost immediatly. You can see the odd cactus here and there,\
as well as  the odd corpino scurrying past you in search of some\
shade. The relentless sun beats down on you neck causeing you to\
start gasping for some water, it is a wonder how anything could\
possibly live in such a harsh enviornment, but then again the\
gamorreans are a harsh people.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28127, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28164, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Desert plains of Gamorr.", 
      }, 
      [28164] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28164, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "The Gamorrean deset stretches on for miles. It is hot and you start to\
sweat almost immediatly. You can see the odd cactus here and there,\
as well as  the odd corpino scurrying past you in search of some\
shade. The relentless sun beats down on you neck causeing you to\
start gasping for some water, it is a wonder how anything could\
possibly live in such a harsh enviornment, but then again the\
gamorreans are a harsh people. \
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28165, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28163, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Desert plains.", 
      }, 
      [28165] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28165, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "The Gamorrean deset stretches on for miles. It is hot and you start to\
sweat almost immediatly. You can see the odd cactus here and there,\
as well as  the odd corpino scurrying past you in search of some\
shade. The relentless sun beats down on you neck causeing you to\
start gasping for some water, it is a wonder how anything could\
possibly live in such a harsh enviornment, but then again the\
gamorreans are a harsh people. \
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28025, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28164, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28166, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Desert path.", 
      }, 
      [28166] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28166, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "You are standing on what might have been, at one point, a very well\
put together walkway, but over time has eroded to a few stones the\
have with stood the test of time and seem to be on there last legs,\
since the elements here, at times, sand blast everything that stands\
and leaves it in a crumbling mass of useless rubble. The path turns\
and you notice ahead that it keeps twisting and turning. You aren't\
sure if it was made that way or if it was one time a large and\
straight path. \
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28167, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28165, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "An eroding walkway.", 
      }, 
      [28167] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28167, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "You are standing on what might have been, at one point, a very well\
put together walkway, but over time has eroded to a few stones the\
have with stood the test of time and seem to be on there last legs,\
since the elements here, at times, sand blast everything that stands\
and leaves it in a crumbling mass of useless rubble. The path turns\
and you notice ahead that it keeps twisting and turning. You aren't\
sure if it was made that way or if it was one time a large and\
straight path. \
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28166, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28168, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "More of the eroding walkway.", 
      }, 
      [28168] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28168, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "You are standing on what might have been, at one point, a very well\
put together walkway, but over time has eroded to a few stones the\
have with stood the test of time and seem to be on there last legs,\
since the elements here, at times, sand blast everything that stands\
and leaves it in a crumbling mass of useless rubble. The path turns\
and you notice ahead that it keeps twisting and turning. You aren't\
sure if it was made that way or if it was one time a large and\
straight path. \
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28167, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28169, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "End of the walkway.", 
      }, 
      [28169] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28169, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "You stand in front of an old entrance, once you look through it you\
see nothing but more desert and the odd post of what might have been\
at one time an old house. You come to the conclusion that this at one\
point was the plains area abut has now been over taken by the\
constant shifting sands of the relentless desert. In due time all teh\
plains will be just like this barren and devoid of semi intellegent\
life... \
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28168, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Entrance to the Desert town.", 
      }, 
      [28170] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Vnum = 28170, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Mud Hole", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Code = "mpechoat $n The soothing mud eases your pain.\
feel heal $n\
", 
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
                  [18] = "CanLeave", 
                  [11] = "Hidden", 
               }, 
               Description = "", 
               Direction = "somewhere", 
               Key = -1, 
               DestinationVnum = 28036, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The mud bubbles and gurggles all around you, the bubbles tickling you as\
they rise to the top. The mud is very refreshing to your aches and pains\
and seems  to ease all the sores you have accumulated from your travels.\
The only problem is, There are other gamorreans here with you and you\
don't know if the bubbles are from the underground or from them, and the\
slight smell is starting to make you wonder. \
", 
      }, 
      [28171] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Vnum = 28171, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "floating in the void", 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [28172] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Vnum = 28172, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "floating in the void", 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [28173] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Vnum = 28173, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "floating in the void", 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [28174] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Vnum = 28174, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "floating in the void", 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [28175] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Vnum = 28175, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "floating in the void", 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [28176] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Vnum = 28176, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "floating in the void", 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [28177] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Vnum = 28177, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "floating in the void", 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [28178] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Vnum = 28178, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "floating in the void", 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [28179] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Vnum = 28179, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "floating in the void", 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [28180] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Vnum = 28180, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "floating in the void", 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [28181] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Vnum = 28181, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Inside the Zicreex", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28183, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28182, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Flags = 
               {
                  [18] = "CanLeave", 
                  [11] = "Hidden", 
               }, 
               Description = "", 
               Direction = "somewhere", 
               Key = -1, 
               DestinationVnum = 28038, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "You are standing in the infamous Zicreex. Which is owned by Ugmush and\
it has a slight stench to it, could possible be from her husbands as\
well as the other ship men she has to maintain can help pilot her\
beloved ship. It isn't exactlly the best of ships but how often do\
you get to sit in a Gamorrean Cube ship?\
", 
      }, 
      [28182] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28182, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "This is the cockpit of the Zicreex. it isn't as bad as it seems to be\
from outside appearences, it does get its passengers from a to b with\
very little problems. The lights on the controls blink on and off and\
you here some bits and pieces of communication going back and forth\
over the comm system.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28181, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Cockpit", 
      }, 
      [28183] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28183, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "This is where the crew put all its scavenge good the score from debris\
the find floating around in space, mostly from destroyed ships and\
such. There are bits and pieces of useless scraps cluttering the\
floor here.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28181, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Large storage compartment", 
      }, 
      [28184] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Vnum = 28184, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "floating in the void", 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [28185] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Vnum = 28185, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "floating in the void", 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [28186] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28186, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "This Path is almost impossible to notice due to the lack of traffic\
flowing to the mountains. You sit and wonder why the Gammoreans\
wouldn'y use the path and come to the conclusion that maybe there is\
another clan up in the mountains and this might not be the season for\
the wars in fact as you look up the path you notice there is some\
spires of smoke rising from what you think could be home fires\
burning.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28187, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "northeast", 
               Key = -1, 
               DestinationVnum = 28110, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Pathway to the Mountains", 
      }, 
      [28187] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Vnum = 28187, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Mountain trail.", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28186, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 28188, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The trail is scattered with pebbels and bits of grass and wild\
flowers, you also see insects scurrying out of you way as well as the\
odd foot print leading up to what seems to be a mountain village. As\
you keep ascending the mountain the smells and sounds of village\
living gets stronger and stronger ecspecially the smells peewww it\
stinks. but you plug you nose and stick to the trail and keep\
climbing.\
", 
      }, 
      [28188] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Vnum = 28188, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Steep path.", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 28189, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 28187, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The trail is scattered with pebbels and bits of grass and wild\
flowers, you also see insects scurrying out of you way as well as the\
odd foot print leading up to what seems to be a mountain village. As\
you keep ascending the mountain the smells and sounds of village\
living gets stronger and stronger ecspecially the smells peewww it\
stinks. but you plug you nose and stick to the trail and keep\
climbing.\
", 
      }, 
      [28189] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28189, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "You can see for miles when you look over the ledge. In the distance\
you can see lush rain forests, further south you see a vast desert as\
well as the Huntbird in the village below While you were admiring the\
view, You completly forgot to check the stability of the ledge and it\
doesn't look to strong, you can notice a huge crack about three feet\
behind you where the ledge looks like it is about to colapse. Maybe\
you should get to safer ground.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28190, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28191, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 28188, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Cliff Ledge", 
      }, 
      [28190] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [1] = "_Reserved", 
         }, 
         Vnum = 28190, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Weak Cliff Lip", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28189, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "While admiring the view, you completly forgot to check the stablity of\
the cliff. You feel a slight rumble, and the lip of the cliff gives\
way to ou weight you fall for hundreds of feet clipping your head off\
of large rock jutting out from the cliff face. Trying to save\
yourself you try to grab for a anything else  that might be sticking\
out but you hit your head again and the light go out.\
 \
YOU ARE DEAD......\
 \
", 
      }, 
      [28191] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28191, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "You can see alomost the whole planet from here, it looks great. You\
have a cool breeze blowing past you face making you feel refreshed\
after that long climb you can here what sounds like gamorreans\
getting ready to do something, you have no idea what, but it sounds\
very important or dangerous the way they sound. \
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28189, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28192, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Cliff Ledge", 
      }, 
      [28192] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28192, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "You can see alomost the whole planet from here, it looks great. You\
have a cool breeze blowing past you face making you feel refreshed\
after that long climb you can here what sounds like gamorreans\
getting ready to do something, you have no idea what, but it sounds\
very important or dangerous the way they sound. \
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28193, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28191, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Cliff Ledge", 
      }, 
      [28193] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28193, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "Now you can see where all the noise was comeing from. The mountain\
clan seems to be in a bit of a tizzy, something seems to have come\
into their area, and they don't seem to be happy about it, some even\
look afraid at what has invaded their homes, and it seems to be\
around the mine shaft that is in the center of  the village .\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28194, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28192, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Mountain Pathway", 
      }, 
      [28194] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28194, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "You are standing in the entrance and no gamorrean seems to have\
noticed you, They are far to busy trying to rid themselve of this\
small problem that it has left them open to unwanted visitors. From\
the mine shaft in the ground you hear a viscious groweling and it\
doesn't sound to pleasent to teh ears. You have heard of the Gurdas\
that have been known to snatch the odd child from its cribs and now\
it seems you are gonna witness one from a distance.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28195, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28193, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Entrance to the Mountain Clan", 
      }, 
      [28195] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28195, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "The village is in chaos, there seems to be only one gamorrean with his\
thoughts straight and the is the shammon to the south. The groweling\
is still very  loud and promenent as still very viscious. Hear the\
scream of a child as it sound as if it has been captured by a gurda.\
You think and hope to yourself  that they dont hunt in packs cause\
then this place could be surrounded by them.  the thought sends\
shivers up and down you spine..\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28198, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28194, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 28196, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Path in the Clan Village", 
      }, 
      [28196] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Vnum = 28196, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Small Cave Entrance", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 28195, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This is the home to the Gamorreans only known shammon, he has his\
place in good order for a Gamorrean, and the smell isn't as bad as\
you had the pleaseue of smelling in the main village. The Shammon has\
an assortment of small trinkets lying around his abode everything\
from small and large gems to the odd credit and you think you see a\
hilt of some sort but, that would not be a surprise even for a\
Gamorrean of his age.\
", 
      }, 
      [28197] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28197, 
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
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 28198, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Large Cave Entrance", 
      }, 
      [28198] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28198, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "The chaos and the groweling is getting worse as time goes on, you see\
of blood comeing from the cave and going north and you also see a\
babies little booty in the trail, seems like the panic has its\
reasons, something has got a baby and it is most likely a gurda that\
has it too. The mother is standing here screaming for her babies safe\
return, she's looking at you as if you might be the only one who can\
do it.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28199, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28195, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 28197, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Mountain Path", 
      }, 
      [28199] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28199, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "You walk along a mountain pass there are steep ledges all around you.\
The path you are on seems sturdy though if not carefull you could get\
harmed. There are some large boulders around the path that could\
start a cool rock slide at anytime. Birds are cherping in the\
distance and there are soem other animals making noise around you.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28000, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28198, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Mountain Path", 
      }, 
      [28000] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28000, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "You walk along a mountain pass there are steep ledges all around you. The path \
you are on seems sturdy though if not carefull you could get harmed. There are \
some large boulders around the path that could start a cool rock slide at\
anytime. Birds are cherping in the distance and there are soem other animals\
making noise around you.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28001, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28199, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Mountain Path", 
      }, 
      [28001] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28001, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "You have finaly reached the center of the chaos, everyone is holding\
spears and wielding axes and looking down what looks to be an\
abandoned mine, the source of the growling and the squeals of an\
injured and scared baby. The sounds pull on your hart and a tear\
trickles down you cheeck as you feel the urge to help the baby and\
destroy the evil gurda that has absolutly no care for the child.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28000, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 28002, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 28004, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Mountain Path", 
      }, 
      [28002] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28002, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "You Stand in front of a rather large cave that the Alpha female has\
designated as her own, It is really big, it reminds you of a black\
hole. When the wind blows past the opening it makes a rather eriy\
howl that make your skin crawl with fear for some strange reason.\
Strangly though, no one is around here, they all seem to be\
preoccupied with the gurda and the baby, leaveing the large cave\
defenseless.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 28003, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 28001, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Steep Trail", 
      }, 
      [28003] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28003, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "This is the cave of the mountain clans matron. It seems to be a little\
messed up, there is what looks like would be the nest of a gurda on\
the floor, could it be the she owns the gurda?, it would make sense\
since only the matron is allowd to have childern and no other female\
can because the would defeat the purpose of haveing the social\
structure the gamorreans have adopted as their own. You come to the\
conclusion that the matron sent the gurda after the other females\
child, to kill t or to bring it back, only the matron knows.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 28002, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Alpha-Cave", 
      }, 
      [28004] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Vnum = 28004, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Mine Shaft", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 28001, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Flags = 
               {
                  [16] = "CanClimb", 
               }, 
               Description = "", 
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 28005, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "There is a very weak wooden ledge here, it doesn't look as if it is\
able to support the weight of anything your size. The boards start to\
groan under your feet and you start to here them snap and crack,\
splinters of wood start to fly through the air and you here a snap as\
they give way\
", 
      }, 
      [28005] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [0] = "Dark", 
            [3] = "Indoors", 
         }, 
         Vnum = 28005, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Mine Shaft", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28031, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 28004, 
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
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 28006, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "There is a very weak wooden ledge here, it doesn't look as if it is\
able to support the weight of anything your size. The boards start to\
groan under your feet and you start to here them snap and crack,\
splinters of wood start to fly through the air and you here a snap as\
they give way\
", 
      }, 
      [28006] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [0] = "Dark", 
            [3] = "Indoors", 
         }, 
         Vnum = 28006, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Mine Shaft", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28032, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 28005, 
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
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 28007, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "There is a very weak wooden ledge here, it doesn't look as if it is\
able to support the weight of anything your size. The boards start to\
groan under your feet and you start to here them snap and crack,\
splinters of wood start to fly through the air and you here a snap as\
they give way\
", 
      }, 
      [28007] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [0] = "Dark", 
            [3] = "Indoors", 
         }, 
         Vnum = 28007, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Bottom of the Shaft.", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28033, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 28006, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [28008] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [10] = "Safe", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 28008, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Entrance to a Corridor.", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28100, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28009, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "You are standing in the Gamorr safe house. Far to the south\
you can here the loud chatter of fellow visitors and natives\
takeing time out and haveing some refreshments to easy the \
pressure of everyday life.\
", 
      }, 
      [28009] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [10] = "Safe", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 28009, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Long corridor.", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28008, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28010, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This is one long and straight corridor, its very well kept\
and from the sounds of it, very peaceful meaning no sounds \
of fighting what so ever. This is good new, cause now you\
can really sit back and relax.\
", 
      }, 
      [28010] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [10] = "Safe", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 28010, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Long corridor.", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28009, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28011, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This is one long and straight corridor, its very well kept\
and from the sounds of it, very peaceful meaning no sounds \
of fighting what so ever. This is good new, cause now you\
can really sit back and relax.\
", 
      }, 
      [28011] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [23] = "Hotel", 
            [10] = "Safe", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 28011, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Lounge area", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28010, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28038, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28015, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28012, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The lounge is very nicely built. It is very large, with tables\
spread in a nice orderly fashion. The tabels themselves are \
quite a sight to see, they are all supported by large beams of\
dark blue light which comes from the floor and into the ceiling.\
There is a refreshments stand that stands in the middle of the\
whole area.\
", 
      }, 
      [28012] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Vnum = 28012, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Lounge area", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28013, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28011, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28016, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The lounge has a very relaxed atmosphere, with soft music playing\
and quiet conversations going on here and there. You stand here\
waiting for a waitress, and during this time you take a look\
at some of the patrons here, and notice that they seem to be very\
friendly people, all have smiles and are very relaxed you too\
decide its time to have a drink and a rest.\
", 
      }, 
      [28013] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Vnum = 28013, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Lounge area", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28014, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28012, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28016, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The lounge has a very relaxed atmosphere, with soft music playing\
and quiet conversations going on here and there. You stand here\
waiting for a waitress, and during this time you take a look\
at some of the patrons here, and notice that they seem to be very\
friendly people, all have smiles and are very relaxed you too\
decide its time to have a drink and a rest.\
", 
      }, 
      [28014] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Vnum = 28014, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Lounge area", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28016, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28015, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28013, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The lounge has a very relaxed atmosphere, with soft music playing\
and quiet conversations going on here and there. You stand here\
waiting for a waitress, and during this time you take a look\
at some of the patrons here, and notice that they seem to be very\
friendly people, all have smiles and are very relaxed you too\
decide its time to have a drink and a rest.\
", 
      }, 
      [28015] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         Vnum = 28015, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Lounge area", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28011, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28016, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28014, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The lounge has a very relaxed atmosphere, with soft music playing\
and quiet conversations going on here and there. You stand here\
waiting for a waitress, and during this time you take a look\
at some of the patrons here, and notice that they seem to be very\
friendly people, all have smiles and are very relaxed you too\
decide its time to have a drink and a rest.\
", 
      }, 
      [28016] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Vnum = 28016, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Refreshments Stand.", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28012, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28013, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28014, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28015, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This is a nicely put together stand, as far as stands go, because\
it is made from a rare wood not found anywhere on this planet\
and it has been very well cut aswell as the designs cut into it\
make it seem as though it has a little story scrolling across its \
edge. The stand has a nice odour to it, due to the variety of drinks\
and snacks that are being sold to its patrons.\
", 
      }, 
      [28017] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28017, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "The Forest seems to go on forever. A slight breeze seduces your nose\
with its beautiful armoas and cool touch, Wild birds, of some kind\
fill the air with a musical ensamble like you never heard before. but\
deep in the forest you hey the preditors of the  land hunting and\
capturing their prey and the prey scream their last breath. You can\
also hear the beast haveing a feast of some sort might be a good\
chance to sneak up on one and catch a glimps of what the ferocious\
beast look like, but you remember warnings of caution and be ready to\
run at the drop of a hat these, beast are nothing to be messed with.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28018, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28120, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Deep in the Forest.", 
      }, 
      [28018] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28018, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "The forest seems to go on forever, the breeze still blow on you face\
and the sounds of the wild surround you. You also notice that the\
forest is getting thicker and thicker as well as darker and darker.\
You notice red eyes peeking at you from behind trees and under roots.\
The smell of rotting flesh mixed with rotting vegitables hits your\
nose, you can just barely see you hand in front of your face its\
getting darker You light up your flashlight and hear the hidden\
creaturs flee from the sudden brightness and you feel as if you have\
just lit up a bright sigh flashing free fresh meat come and get it!!\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28017, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "northwest", 
               Key = -1, 
               DestinationVnum = 28019, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "The Darkend Forest.", 
      }, 
      [28019] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28019, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "The forest seems to go on forever, the breeze still blow on you face\
and the sounds of the wild surround you. You also notice that the\
forest is getting thicker and thicker as well as darker and darker.\
You notice red eyes peeking at you from behind trees and under roots.\
The smell of rotting flesh mixed with rotting vegitables hits your\
nose, you can just barely see you hand in front of your face its\
getting darker You light up your flashlight and hear the hidden\
creaturs flee from the sudden brightness and you feel as if you have\
just lit up a bright sigh flashing free fresh meat come and get it!!\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28036, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28020, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "southeast", 
               Key = -1, 
               DestinationVnum = 28018, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Uncharted Forest area.", 
      }, 
      [28020] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28020, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "The forest seems to go on forever, the breeze still blow on you face\
and the sounds of the wild surround you. You also notice that the\
forest is getting thicker and thicker as well as darker and darker.\
You notice red eyes peeking at you from behind trees and under roots.\
The smell of rotting flesh mixed with rotting vegitables hits your\
nose, you can just barely see you hand in front of your face its\
getting darker You light up your flashlight and hear the hidden\
creaturs flee from the sudden brightness and you feel as if you have\
just lit up a bright sigh flashing free fresh meat come and get it!!\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28019, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 28021, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Forest Ravine", 
      }, 
      [28021] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28021, 
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
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 28020, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Sudden Drop off.", 
      }, 
      [28022] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28022, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "The Forest seems to go on forever. A slight breeze seduces your nose\
with its beautiful armoas and cool touch, Wild birds, of some kind\
fill the air with a musical ensamble like you never heard before. but\
deep in the forest you hey the preditors of the  land hunting and\
capturing their prey and the prey scream their last breath. You can\
also hear the beast haveing a feast of some sort might be a good\
chance to sneak up on one and catch a glimps of what the ferocious\
beast look like, but you remember warnings of caution and be ready to\
run at the drop of a hat, these beasts are nothing to be messed with.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28137, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28023, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "northwest", 
               Key = -1, 
               DestinationVnum = 28036, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Deep in the forest.", 
      }, 
      [28023] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Vnum = 28023, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Near the Edge of a Ravine", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28022, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 28024, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The Forest seems to go on forever. A slight breeze seduces your nose\
with its beautiful armoas and cool touch, Wild birds, of some kind\
fill the air with a musical ensamble like you never heard before. but\
deep in the forest you hey the preditors of the land hunting and\
capturing their prey and the prey scream their last breath. You can\
also hear the beast haveing a feast of some sort might be a good\
chance to sneak up on one and catch a glimps of what the ferocious\
beast look like, but you remember warnings of caution and be ready to\
run at the drop of a hat, these beasts are nothing to be messed with.\
", 
      }, 
      [28024] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28024, 
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
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 28023, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Sudden Drop.", 
      }, 
      [28025] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28025, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "The Gamorrean deset stretches on for miles. It is hot and you start to\
sweat almost immediatly. You can see the odd cactus here and there,\
as well as  the odd corpino scurrying past you in search of some\
shade. The relentless sun beats down on you neck causeing you to\
start gasping for some water, it is a wonder how anything could\
possibly live in such a harsh enviornment, but then again the\
gamorreans are a harsh people. \
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28165, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "northeast", 
               Key = -1, 
               DestinationVnum = 28026, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "The Desert.", 
      }, 
      [28026] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28026, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "The Gamorrean deset stretches on for miles. It is hot and you start to\
sweat almost immediatly. You can see the odd cactus here and there,\
as well as  the odd corpino scurrying past you in search of some\
shade. The relentless sun beats down on you neck causeing you to\
start gasping for some water, it is a wonder how anything could\
possibly live in such a harsh enviornment, but then again the\
gamorreans are a harsh people.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28027, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28028, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "southwest", 
               Key = -1, 
               DestinationVnum = 28025, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Deep in the Gamorr Desert.", 
      }, 
      [28027] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [1] = "_Reserved", 
            [2] = "NoMob", 
         }, 
         Vnum = 28027, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Lost in The Deserts of Gamorr.", 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Description = "You have completly lost you way. You cant seem to get you dirctions\
straight, everything  is looking the same to you you think you see a\
path to your right, you go to it and it vanishes you start\
hallucinating you see fire all around you, you collapse to you knees \
you dying of thirst, your water is empty you food is gone, you feel\
tired, you see your pillow you used to have when you were a child as\
well as you bed right in front of you you decide it is a nice time to\
go to sleep, mom will wake you up in the morning...  \
 \
You never wake up again.....\
 \
", 
      }, 
      [28028] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28028, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "You are standing in the infamous land of no return. It would be in\
your best interests to turn back now, it has earned its name and has\
never give up any of its helpless wonderers, and anyone who dares to\
enter find out fast how deadly the sink holes can be and even the\
desert creatures seem to be avoiding this area it would be a good\
idea if you followed their example. \
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28029, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28030, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28026, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "The Land of no Return.", 
      }, 
      [28029] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [24] = "NoFloor", 
         }, 
         Vnum = 28029, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "A SINK HOLE!!", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28028, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 28131, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "You are standing on the soft sands of the land of no return. The gound\
seems to open up  right under you and you start to slowly sink down.\
You try to grasp for something  but there is nothing to hold except\
for the sand itself. You life flashes before your eyes. the sand is\
now up to your neck, it slowly move to your chin and eventually your\
mouth where you ingest a mouthful. You try to gasp for breath but\
fill you lungs with the hot sands.\
", 
      }, 
      [28030] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28030, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "You are standing in the infamous land of no return. It would be in\
your best interests to turn back now, it has earned its name and has\
never give up any of its helpless wonderers, and anyone who dares to\
enter find out fast how deadly the sink holes can be and even the\
desert creatures seem to be avoiding this area it would be a good\
idea if you followed their example. \
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28028, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Sands of the soft Sink Holes.", 
      }, 
      [28031] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Vnum = 28031, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Mine Tunnel", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28005, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The tunnel end abruptly, and the stench from the gurda has filled the\
tunnel with a mind numbing sickening smell that makes you wanna blow\
chunks everywhere, to think that the gamorreans wear the gurdas skin as a\
prize, The tunnel itself is realy to dark to make heads or tails of what\
might be on the walls, from what you can tell  its just cuts made from the\
tools of mining.\
", 
      }, 
      [28032] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [0] = "Dark", 
            [3] = "Indoors", 
         }, 
         Vnum = 28032, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Short tunnel.", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28006, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The tunnel end abruptly, and the stench from the gurda has filled the\
tunnel with a mind numbing sickening smell that makes you wanna blow\
chunks everywhere, to think that the gamorreans wear the gurdas skin as a\
prize, The tunnel itself is realy to dark to make heads or tails of what\
might be on the walls, from what you can tell  its just cuts made from the\
tools of mining.\
", 
      }, 
      [28033] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [0] = "Dark", 
            [3] = "Indoors", 
         }, 
         Vnum = 28033, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Long tunnel.", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28034, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28007, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [28034] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [0] = "Dark", 
            [3] = "Indoors", 
         }, 
         Vnum = 28034, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "More of the Tunnel.", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28035, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28033, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [28035] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [0] = "Dark", 
            [3] = "Indoors", 
         }, 
         Vnum = 28035, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "End of the Tunnel.", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28034, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [28036] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [10] = "Safe", 
         }, 
         Vnum = 28036, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Small Clearing.", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28019, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Flags = 
               {
                  [17] = "CanEnter", 
                  [11] = "Hidden", 
               }, 
               Description = "", 
               Direction = "somewhere", 
               Key = -1, 
               DestinationVnum = 28170, 
               Distance = 0, 
               Keyword = "mud hole", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The small clearing has a rather large mudhole in it that the gamorreans\
have classified as the sacred land, where no fighting can take place. They\
come here to relax and heal there sore and swollen muscles after a hard\
days battle. The place smells like a sewer on coruscant, but it does look\
inviting.\
", 
      }, 
      [28037] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Vnum = 28037, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Large Mud Hole.", 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [28038] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [4] = "CanLand", 
         }, 
         Vnum = 28038, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Landing Area", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28011, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Flags = 
               {
                  [17] = "CanEnter", 
                  [11] = "Hidden", 
               }, 
               Description = "", 
               Direction = "somewhere", 
               Key = -1, 
               DestinationVnum = 28181, 
               Distance = 0, 
               Keyword = "ship zicreex", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The landing area is rather large, it looks as though it can hold and\
Imperial Star Destroyer, but how often do you see that. The area has\
the odd small cargo ship parked here and there as well as one or two\
stock light freighters loading and unloading so stuff you don't want\
to get involved with. You even see a ship loading a couple of infant\
Gamorrean watch-beasts with extream caution\
", 
      }, 
      [28054] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Vnum = 28054, 
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
      [28100] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [10] = "Safe", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 28100, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "The Huntbird.", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28103, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28008, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 28101, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "You stand in the entrance to the Wreckage of the Huntbird\
Its is a rather large hunk of junk that even thought its\
real old it seems to be holding up to the elements of the \
planet and has not rusted through. In here you will find\
all the comforts you will need to get rested and or hide\
from aggressive natives or evil visitor that might want\
to do you some harm, don't worry your safe here.\
", 
      }, 
      [28101] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [10] = "Safe", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 28101, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Upperdeck of the Huntbird.", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28102, 
               Distance = 0, 
               Keyword = "door", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 28100, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The Upperdeck of the wreck is, well, boring, the walls are empty\
except for the dust the is creatively decorated with finger \
prints and writting simply stateing \"WASH ME!\" other then \
that this is one barren place.\
", 
      }, 
      [28102] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 28102, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Cockpit.", 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28101, 
               Distance = 0, 
               Keyword = "door", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "Through the cockpit window, you can see for miles, well you\
would be able to if that mountain wasn't in the way! But it \
looks to be a very beautiful planet with lush vegitation\
a desert in the distance and an old man sitting on the floor \
watching everything you do with hauntingly knowing eyes.\
", 
      }, 
      [28103] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28103, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "You wonder through the village streets wondering where to go\
the sight here are very pleasant to thte eye, well it would be\
if the Gamorreans would stop fighting to keep the places looking \
helf descent, but other then that the sights here are very \
pleaseing to the eye. The street carries on to the north, east\
and west or you can go south back to the Huntbird.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28108, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28104, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28100, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28107, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Village Street.", 
      }, 
      [28104] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28104, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "You wonder through the village streets wondering where to go the sight\
here are very pleasant to thte eye, well it would be if the\
Gamorreans would stop fighting to keep the places looking  helf\
descent, but other then that the sights here are very  pleaseing to\
the eye. The street carries on the the south and back to the west, to\
the north is a gamorrean house.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28105, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28121, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28103, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Village street.", 
      }, 
      [28105] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28105, 
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
               DestinationVnum = 28106, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28104, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Gamorrean House Hold.", 
      }, 
      [28106] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28106, 
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
               DestinationVnum = 28105, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Backroom.", 
      }, 
      [28107] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [7] = "NoMagic", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Vnum = 28107, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Black Smithy and Leather Workshop.", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28103, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "You are standing in the the Black smith and leather work shop of the\
village. The smell of burning metals and drying hides fills the air\
in a sickening mixture of sents. There is the shop owner standing\
in the corner of the smithy looking over at some of the things she\
crafted.\
", 
      }, 
      [28108] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28108, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "Wondering through the street, the strong smell of the male half of\
the Gamorrean race hits your nose like a ton of bricks. It is a \
very strong smell of urine as well as some other stench you really\
aren't to interested in finding out its origins. The street travels\
east, west and north as well as the way you came.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28109, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28112, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28103, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28111, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Village Street.", 
      }, 
      [28109] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28109, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "The smell from the house you just past still makes your eyes burn,\
The street keeps going north and south but up ahead you notice it\
bend to the southwest. You are unable to see past that distance\
due to the houses and huts blocking your view. You just hope where\
ever this road leads you its to a place that smells better then this\
this village, then again nothing could smell worse then this.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28110, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28108, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Village Street.", 
      }, 
      [28110] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28110, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "The street doesn't appear to be well used. There are no surounding\
houses or huts that you can see. The area looks to have been abandond\
for some reason that is unknown to you. You can smell the fragrance of\
a variety of different flowers as well as different types of trees, you \
also feel a nice cool breeze brush across your face. Street bends to\
the southwest and leads to a pathway.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28109, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "southwest", 
               Key = -1, 
               DestinationVnum = 28186, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Village Street.", 
      }, 
      [28111] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28111, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "This pathways seems to be well used by the gammoreans of this tribe.\
You are thankfull that you have gotten away from the fowl odur of the\
males and pray to yourself that you never go through torture like\
that again. You can here the sounds from the main part of the village\
off in the distance as well as the wild birds and other animals that\
make the village there home.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28108, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28113, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Village Pathway.", 
      }, 
      [28112] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28112, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "The house is filthy and it needs some deoderant sprayed around, now\
you know where the smell from out in the street was coming from PEEW!\
You can't find anything of any interest in here and you feel the stench \
start burning you nostrils and making you stomach spin.\
", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "entry_prog", 
               Code = "if race($n) != gamorrean\
mpforce $n puke\
else\
mpforce $n grunt\
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
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28108, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A house.", 
      }, 
      [28113] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28113, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "You now stand in front of the matrons house of the Plains clan. The\
house is very nice compared to the huts and the other poor excusses\
for houses you've seen so far The trim around the doors and windows\
is a pretty bright pink, the roof is made  of clay that has a pinkish\
hue to it in fact you notice that most of the house is well, pink The\
matron seems to like the colour pink so much that she decided to have\
her house pink after all it is a very femminin colour....\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28111, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28117, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28115, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Front of The Alpha House.", 
      }, 
      [28114] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28114, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "This is the Alph-Females nursery. It smells absolutly fowl with these\
babies squirming  around in their little pens, the stench burns you\
nose nad the squealing is giving you a massive headache, though the\
babies do look a little appatising to you you moral judgment is\
telling you not to eat one but you hunger is telling you whet the\
heck why not!\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28115, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Alpha Nursery.", 
      }, 
      [28115] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28115, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "&Y You look around at the inside of the small house and see that &P\
pink &Y &Y is absolutly everywhere, no matter where you look its &P\
pink &Y this and &P pink &Y that. It for some reason is makeing you\
feel a little nauseaus You hear the sound of babies to the south and\
quite frankly smell them too and to the north looks to be where the\
matron herself stays.\
", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "entry_prog", 
               Code = "if race($n) == gamorrean\
mpforce $n comb\
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
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28116, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28113, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28114, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Alpha House", 
      }, 
      [28116] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28116, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "You are standing in the quarters of the Alfa-Female, Ugmush. She is\
well known for her fierceness and she might not be to happy about\
intruders in her home. The house has a semi-pleasent odour to it\
considering the fact that its owned by a Gamorrean. You hear the\
comotion of the children in there bedrooms as well as the  adults\
outside the house.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28115, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Alpha Females Quarters.", 
      }, 
      [28117] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28117, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "The pathway is hardly used, As you keep walking you can see the mountain is\
the distance getting bigger and bigger as you draw closer to it's base.\
From here you can see the forest crawls up the mountains bottom and\
reaches about one quarter of the way up until it tappers off into a\
spattering of trees here and there.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28113, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28118, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A Pathway in the Village.", 
      }, 
      [28118] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28118, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "The pathway is hardly used, As you keep walking you can see the mountain is\
the distance getting bigger and bigger as you draw closer to it's base.\
From here you can see the forest crawls up the mountains bottom and\
reaches about one quarter of the way up until it tappers off into a\
spattering of trees here and there.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28117, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28119, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "More of the Path", 
      }, 
      [28119] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Vnum = 28119, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "End of the Path", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28118, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28120, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The pathway is hardly used, As you keep walking you can see the mountain is\
the distance getting bigger and bigger as you draw closer to it's base.\
From here you can see the forest crawls up the mountains bottom and\
reaches about one quarter of the way up until it tappers off into a\
spattering of trees here and there.\
", 
      }, 
      [28120] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28120, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "The Forest seems to go on forever. A slight breeze seduces your nose\
with its beautiful armoas and cool touch, Wild birds, of some kind\
fill the air with a musical ensamble like you never heard before. but\
deep in the forest you hey the preditors of the  land hunting and\
capturing their prey and the prey scream their last breath. You can\
also hear the beast haveing a feast of some sort might be a good\
chance to sneak up on one and catch a glimps of what the ferocious\
beast look like, but you remember warnings of caution and be ready to\
run at the drop of a hat these, beast are nothing to be messed with.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28017, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28137, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28119, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "In the Forest.", 
      }, 
      [28121] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28121, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "Wondering through the streets, you notice to the east and west are \
small huts for the males of the tribe. To the south is more of the\
village street. You also see the streets full of various levels of\
females in the hierarchy of the Gamorrean society, you also notice \
that there is no sign of the Alpha Female anywhere to be seen.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28104, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28123, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28124, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28122, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Village Street.", 
      }, 
      [28122] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28122, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "This is a small hut. Its main purpose in life is to shealter the \
males from the rain or the harsh rays of the afternoon sun. The Hut\
is made from wood scavenged from the near by forest and held \
together with mud and clay. It is also stune with blankets and \
there is the odd hamock streched out from wall to post here and \
there.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28121, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A hut", 
      }, 
      [28123] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28123, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "This is a small hut. Its main purpose in life is to shealter the \
males from the rain or the harsh rays of the afternoon sun. The Hut\
is made from wood scavenged from the near by forest and held \
together with mud and clay. It is also stune with blankets and \
there is the odd hamock streched out from wall to post here and \
there.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28121, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A hut", 
      }, 
      [28124] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28124, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "Wondering through the streets, you notice to the east and west are\
small huts for the males of the tribe. To the south is more of the\
village street. You also see the streets full of various levels of\
females in the hierarchy of the Gamorrean society, you also notice\
that there is no sign of the Alpha Female anywhere to be seen.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28121, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28128, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28125, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28130, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Village street.", 
      }, 
      [28125] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28125, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "Wondering through the streets, you notice to the east and west are\
small huts for the males of the tribe. To the south is more of the\
village street. You also see the streets full of various levels of\
females in the hierarchy of the Gamorrean society, you also notice\
that there is no sign of the Alpha Female anywhere to be seen.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28124, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28126, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Village Street.", 
      }, 
      [28126] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Vnum = 28126, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "End of The road.", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28125, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28127, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "You stand at the abrupt end of the village road. Seems as the the\
desert is encroching on the main village and probably has been for a\
very long time. You can feel the heat from the desert even from just\
standing at its edge, and it looks very unforgiving to the happless\
wonderer. Roumors have been floating around that some huge beast\
thing lives out in the desert eatting anything and everything it\
wants and its has been known to wander into the village from time to\
time to snatch the odd gamorrean. \
", 
      }, 
      [28127] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28127, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "The Gamorrean deset stretches on for miles. It is hot and you start to\
sweat almost immediatly. You can see the odd cactus here and there,\
as well as  the odd corpino scurrying past you in search of some\
shade. The relentless sun beats down on you neck causeing you to\
start gasping for some water, it is a wonder how anything could\
possibly live in such a harsh enviornment, but then again the\
gamorreans are a harsh people.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28126, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28163, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Out in the desert.", 
      }, 
      [28128] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28128, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "Wondering through the streets, you notice to the east and west are\
small huts for the males of the tribe. To the south is more of the\
village street. You also see the streets full of various levels of\
females in the hierarchy of the Gamorrean society, you also notice\
that there is no sign of the Alpha Female anywhere to be seen.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28135, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28136, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28129, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28124, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Village path.", 
      }, 
      [28129] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28129, 
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
               DestinationVnum = 28128, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "End of the Village Path.", 
      }, 
      [28130] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28130, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "Wondering through the streets, you notice to the east and west are\
small huts for the males of the tribe. To the south is more of the\
village street. You also see the streets full of various levels of\
females in the hierarchy of the Gamorrean society, you also notice\
that there is no sign of the Alpha Female anywhere to be seen. \
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28124, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28133, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28132, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A path in the village.", 
      }, 
      [28131] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [1] = "_Reserved", 
            [2] = "NoMob", 
         }, 
         Vnum = 28131, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Buried alive", 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Description = "You slowly sufficate to death....\
 \
 \
", 
      }, 
      [28132] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28132, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "This is another small hut. much like the others, its main purpose in\
life is to shealter the boars from the rain or the harsh rays of the\
afternoon sun. The hut is made from wood scavenged from the forest\
perimeter and held together with mud, clay and some what looks like\
leather bindings. It is also strune with blankets and the odd hamock\
stretched from wall to post.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28130, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A Hut", 
      }, 
      [28133] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28133, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "This is another small hut. much like the others, its main purpose in\
life is to shealter the boars from the rain or the harsh rays of the\
afternoon sun. The hut is made from wood scavenged from the forest\
perimeter and held together with mud, clay and some what looks like\
leather bindings. It is also strune with blankets and the odd hamock\
stretched from wall to post.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28130, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A Hut.", 
      }, 
      [28134] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28134, 
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
               DestinationVnum = 28128, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A Hut.", 
      }, 
      [28135] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28135, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "This is another small hut. much like the others, its main purpose in\
life is to shealter the boars from the rain or the harsh rays of the\
afternoon sun. The hut is made from wood scavenged from the forest\
perimeter and held together with mud, clay and some what looks like\
leather bindings. It is also strune with blankets and the odd hamock\
stretched from wall to post.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28128, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A Hut.", 
      }, 
      [28136] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28136, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "This is another small hut. much like the others, its main purpose in\
life is to shealter the boars from the rain or the harsh rays of the\
afternoon sun. The hut is made from wood scavenged from the forest\
perimeter and held together with mud, clay and some what looks like\
leather bindings. It is also strune with blankets and the odd hamock\
stretched from wall to post.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28128, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A Hut.", 
      }, 
      [28137] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28137, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "The Forest seems to go on forever. A slight breeze seduces your nose\
with its beautiful armoas and cool touch, Wild birds, of some kind\
fill the air with a musical ensamble like you never heard before. but\
deep in the forest you hey the preditors of the  land hunting and\
capturing their prey and the prey scream their last breath. You can\
also hear the beast haveing a feast of some sort might be a good\
chance to sneak up on one and catch a glimps of what the ferocious\
beast look like, but you remember warnings of caution and be ready to\
run at the drop of a hat, these beast are nothing to be messed with.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28120, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28022, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28138, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Within the Forest", 
      }, 
      [28138] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28138, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "The forest seems to go on forever. Slight breeze seduces you nose with\
its beautiful aromas and cool touch. Wild birds , of some kind fill\
the air with a musical ensamble like you never heard before, but deep\
in the forest you hear the preditors of the land hunting and\
capturing their prey as well as the prey screaming their last breath.\
You can also hear a beast having a feast of some sort, Might be a\
good chance to sneak up on one and catch a glimps of what the\
ferocious beast might look like, but you remember warnings of caution\
and to be ready to run at the drop of a hat, these beasts are nothing\
to be messed with.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28140, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28137, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A path in the Forest.", 
      }, 
      [28139] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28139, 
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
               DestinationVnum = 28120, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "in the Forest.", 
      }, 
      [28140] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28140, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "The forest seems to go on forever. Slight breeze seduces you nose with\
its beautiful aromas and cool touch. Wild birds , of some kind fill\
the air with a musical ensamble like you never heard before, but deep\
in the forest you hear the preditors of the land hunting and\
capturing their  prey as well as the prey screaming their last\
breath. You can also hear a beast having a feast of some sort, Might\
be a good chance to sneak up on one and catch a glimps of what the\
ferocious beast might look like, but you remember warnings of caution\
and to be ready to run at the drop of a hat, these beasts are nothing\
to be messed with.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28141, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28138, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "More of the Path.", 
      }, 
      [28141] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28141, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "The forest seems to go on forever. A slight breeze seduces your nose\
with its beautiful aromas and cool touch. Wild birds, of some kind\
fill  the air with their musical ensamble like you've never heard\
before, but deep in the forest you hear the preditors of the land\
hunting and capturing their prey as well as the prey screaming their\
last breath. \
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28142, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28140, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Crocked Path.", 
      }, 
      [28142] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28142, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "The forest seems to go on forever. A slight breeze seduces your nose\
with its beautiful aromas and cool touch. Wild birds, of some kind\
fill the air with their musical ensamble like you've never heard\
before, but deep in the forest you hear the preditors of the land\
hunting and capturing their prey as well as the prey screaming their\
last breath. \
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28143, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28141, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "The Paths end.", 
      }, 
      [28143] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28143, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "The forest seems to go on forever. A slight breeze seduces your nose\
with its beautiful aromas and cool touch. Wild birds, of some kind\
fill the air with their musical ensamble like you've never heard\
before, but deep in the forest you hear the preditors of the land\
hunting and capturing their prey as well as the prey screaming their\
last breath. \
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28144, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28142, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A Clearing.", 
      }, 
      [28144] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Vnum = 28144, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "An Old Path.", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28145, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28143, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This clearing leads you straight in to a villages entrance. Of course\
it is swarming with gamorreans and for some stange reason they are\
what is causing the strange noises in most of the forest. With what\
looks like a feast in honour of the Matron herself The smell of\
barbaque and some other thing fill the air with a wierd aroma. \
", 
      }, 
      [28145] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28145, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "This is the entrance to the Forest clans village. The entrance is\
guarded by two large coloumns made from a concrete type of matierial\
and stnads at least fifteen feet high and three feet wide. Inside the\
entrance it is swarming with gamorreans and for some strange reason\
they are what is causing the strange noises in most of the forest.\
With what looks like a feast in honour of the Matron herself The\
smell of barbaque and some other thing fill the air with a wierd\
aroma. \
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28146, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28144, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Entrance to a Village.", 
      }, 
      [28146] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28146, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "The smell from the house you just past still makes your eyes burn, The\
street keeps going north and south but up ahead you notice it bend to\
the southwest. You are unable to see past that distance due to the\
houses and huts blocking your view. You just hope where ever this\
road leads you its to a place that smells better then this this\
village, then again nothing could smell worse then this.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28145, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28152, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28147, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Village Street.", 
      }, 
      [28147] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28147, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "The smell from the house you just past still makes your eyes burn, The\
street keeps going north and south but up ahead you notice it bend to\
the southwest. You are unable to see past that distance due to the\
houses and huts blocking your view. You just hope where ever this\
road leads you its to a place that smells better then this this\
village, then again nothing could smell worse then this.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28146, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28155, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28148, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28154, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Village Street.", 
      }, 
      [28148] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28148, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "The smell from the house you just past still makes your eyes burn, The\
street keeps going north and south but up ahead you notice it bend to\
the southwest. You are unable to see past that distance due to the\
houses and huts blocking your view. You just hope where ever this\
road leads you its to a place that smells better then this this\
village, then again nothing could smell worse then this.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28147, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28149, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28156, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Village Street.", 
      }, 
      [28149] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28149, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "The smell from the house you just past still makes your eyes burn, The\
street keeps going north and south but up ahead you notice it bend to\
the southwest. You are unable to see past that distance due to the\
houses and huts blocking your view. You just hope where ever this\
road leads you its to a place that smells better then this this\
village, then again nothing could smell worse then this.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28148, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28157, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28150, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Village Street.", 
      }, 
      [28150] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28150, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "The street to the west ends on a semi circle of huts where you presume\
the male gamorreans sleep and gather for there clan war meetings.\
This part of the street turns west to this little ending and from\
there it goes no where but back to the spot. You can return back to\
the east and go back into the heart of the village or head into the\
dead end. \
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28149, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28151, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A turn in the Village Street.", 
      }, 
      [28151] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Vnum = 28151, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "End of the Village Street.", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28161, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28150, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28160, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28162, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This little semi circle is surrounded by the male gamorreans huts. And\
you can tell by the smell they dont take good care of their living\
quarters, the smell of urine fills the air and burns your nose.\
Though the smell of the forest you were travelling in had such a\
sweet sent to it, the smell from these huts completly cancels out any\
presence of the forest with surrounds the entire village.\
", 
      }, 
      [28152] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28152, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "This small path leads looks like it leads away from the village and\
straight back into the forest for some unknown reason. maybe its for\
future expansion of the village you have no idea nor do you really\
care. The path leads east and from what you can tell ends right there\
and right back into the forest.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28153, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28146, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Small path in the Village.", 
      }, 
      [28153] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28153, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "This small path leads looks like it leads away from the village and\
straight back into the forest for some unknown reason. maybe its for\
future expansion of the village you have no idea nor do you really\
care. The path leads east and from what you can tell ends right there\
and right back into the forest.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28152, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Small path.", 
      }, 
      [28154] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [10] = "Safe", 
         }, 
         Vnum = 28154, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "General Store.", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28147, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This store has all its supplies on the wall behind the counter, to prevent\
slippery little hands from snatching the goods that might have been on\
shelves in the middle of the store.  The gamorrean behind the counter\
doesnt look to pleasent either she looks like she was hit by a swoop and\
draged for a few light years on her face.\
", 
      }, 
      [28155] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [10] = "Safe", 
         }, 
         Vnum = 28155, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Water shop.", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 28147, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "You are standing in the forest clans water supply shop, the funny thing is,\
it seems that the clan members dont have to pay for their water and oddly\
enough the off worlders have to pay the highest prices for something as\
abundent as water. You come the the conclusion the these clan people are\
nothing but crooks. The walls in the shop are lind with different types of\
ancient canteens, this place is almost like a canteen museum.\
", 
      }, 
      [28156] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [10] = "Safe", 
         }, 
         Vnum = 28156, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Arms for Sale.", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 28148, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "These walls are lined with very well crafted axes that look as though the\
gamorrean who crafted them might have taken her time and put alot of care\
into makeing them because they all have real nice intricate designs\
covering the blades and the war hammers look like they could fetch a\
bundle in the black market.  this Gamorrean much like the rest enjoys her\
work and takes alot of pride in what she does and she looks like the type\
of gamorrean that will not hesitate to hack off a hand or two to protect\
her goods.\
", 
      }, 
      [28157] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28157, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "This path is wider then most of the other paths you have encountered thus\
far, to the south you notice that the path comes to an end and leads\
straight to the alpha females house. The path is also loaded with\
gamorreans coming and going to and from the matrons house, paying homage\
and mostly the males are trying to find out when the next mateing battles\
will take place.\
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28149, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28158, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "A Wide Path.", 
      }, 
      [28158] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 28158, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "This path is wider then most of the other paths you have encountered thus\
far, to the south you notice that the path comes to an end and leads\
straight to the alpha females house. The path is also loaded with\
gamorreans coming and going to and from the matrons house, paying homage\
and mostly the males are trying to find out when the next mateing battles\
will take place. \
", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28157, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 28159, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "End of the path.", 
      }, 
      [28159] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Vnum = 28159, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "House of the Alfa female.", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 28158, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This is the home of the matron, the house is made a little better then the\
other huts made from stick and such, this one is made from trees that were\
cut into palnks and held together with mud and nails and its real sturdy\
which is the obvious reason why the matron has made it her home.\
", 
      }, 
   }, 
   FileFormatVersion = 1, 
   LowEconomy = 99930509, 
   Resets = 
   {
      [1] = 
      {
         MiscData = 1, 
         Arg1 = 28001, 
         Command = "M", 
         Arg3 = 28000, 
         Arg2 = 41, 
      }, 
      [2] = 
      {
         MiscData = 1, 
         Arg1 = 28001, 
         Command = "M", 
         Arg3 = 28000, 
         Arg2 = 41, 
      }, 
      [3] = 
      {
         MiscData = 1, 
         Arg1 = 28015, 
         Command = "M", 
         Arg3 = 28003, 
         Arg2 = 1, 
      }, 
      [4] = 
      {
         MiscData = 1, 
         Arg1 = 28010, 
         Command = "M", 
         Arg3 = 28010, 
         Arg2 = 1, 
      }, 
      [5] = 
      {
         MiscData = 1, 
         Arg1 = 28012, 
         Command = "E", 
         Arg3 = 16, 
         Arg2 = 1, 
      }, 
      [6] = 
      {
         MiscData = 1, 
         Arg1 = 28020, 
         Command = "M", 
         Arg3 = 28014, 
         Arg2 = 1, 
      }, 
      [7] = 
      {
         MiscData = 1, 
         Arg1 = 28021, 
         Command = "M", 
         Arg3 = 28015, 
         Arg2 = 1, 
      }, 
      [8] = 
      {
         MiscData = 1, 
         Arg1 = 28011, 
         Command = "M", 
         Arg3 = 28016, 
         Arg2 = 1, 
      }, 
      [9] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 32253, 
         Command = "G", 
      }, 
      [10] = 
      {
         MiscData = 1, 
         Arg1 = 28003, 
         Command = "M", 
         Arg3 = 28023, 
         Arg2 = 1, 
      }, 
      [11] = 
      {
         MiscData = 1, 
         Arg1 = 28013, 
         Command = "O", 
         Arg3 = 28023, 
         Arg2 = 1, 
      }, 
      [12] = 
      {
         MiscData = 1, 
         Arg1 = 28014, 
         Command = "O", 
         Arg3 = 28023, 
         Arg2 = 1, 
      }, 
      [13] = 
      {
         MiscData = 1, 
         Arg1 = 28006, 
         Command = "M", 
         Arg3 = 28031, 
         Arg2 = 1, 
      }, 
      [14] = 
      {
         MiscData = 1, 
         Arg1 = 28001, 
         Command = "O", 
         Arg3 = 28031, 
         Arg2 = 1, 
      }, 
      [15] = 
      {
         MiscData = 1, 
         Arg1 = 28027, 
         Command = "O", 
         Arg3 = 28036, 
         Arg2 = 1, 
      }, 
      [16] = 
      {
         MiscData = 1, 
         Arg1 = 28000, 
         Command = "M", 
         Arg3 = 28102, 
         Arg2 = 1, 
      }, 
      [17] = 
      {
         MiscData = 0, 
         Arg1 = 28102, 
         Command = "D", 
         Arg3 = 0, 
         Arg2 = 1, 
      }, 
      [18] = 
      {
         MiscData = 1, 
         Arg1 = 28013, 
         Command = "M", 
         Arg3 = 28103, 
         Arg2 = 10, 
      }, 
      [19] = 
      {
         MiscData = 1, 
         Arg1 = 28002, 
         Command = "M", 
         Arg3 = 28103, 
         Arg2 = 4, 
      }, 
      [20] = 
      {
         MiscData = 1, 
         Arg1 = 28001, 
         Command = "M", 
         Arg3 = 28103, 
         Arg2 = 41, 
      }, 
      [21] = 
      {
         MiscData = 1, 
         Arg1 = 28013, 
         Command = "M", 
         Arg3 = 28103, 
         Arg2 = 10, 
      }, 
      [22] = 
      {
         MiscData = 1, 
         Arg1 = 28001, 
         Command = "M", 
         Arg3 = 28106, 
         Arg2 = 41, 
      }, 
      [23] = 
      {
         MiscData = 1, 
         Arg1 = 28107, 
         Command = "M", 
         Arg3 = 28107, 
         Arg2 = 1, 
      }, 
      [24] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 28003, 
         Command = "G", 
      }, 
      [25] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 28016, 
         Command = "G", 
      }, 
      [26] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 28015, 
         Command = "G", 
      }, 
      [27] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 28017, 
         Command = "G", 
      }, 
      [28] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 28011, 
         Command = "G", 
      }, 
      [29] = 
      {
         MiscData = 1, 
         Arg1 = 28002, 
         Command = "M", 
         Arg3 = 28112, 
         Arg2 = 4, 
      }, 
      [30] = 
      {
         MiscData = 1, 
         Arg1 = 28001, 
         Command = "M", 
         Arg3 = 28113, 
         Arg2 = 41, 
      }, 
      [31] = 
      {
         MiscData = 1, 
         Arg1 = 28002, 
         Command = "M", 
         Arg3 = 28113, 
         Arg2 = 4, 
      }, 
      [32] = 
      {
         MiscData = 1, 
         Arg1 = 28001, 
         Command = "O", 
         Arg3 = 28114, 
         Arg2 = 1, 
      }, 
      [33] = 
      {
         MiscData = 1, 
         Arg1 = 28116, 
         Command = "M", 
         Arg3 = 28116, 
         Arg2 = 1, 
      }, 
      [34] = 
      {
         MiscData = 1, 
         Arg1 = 28008, 
         Command = "E", 
         Arg3 = 5, 
         Arg2 = 1, 
      }, 
      [35] = 
      {
         MiscData = 1, 
         Arg1 = 28019, 
         Command = "E", 
         Arg3 = 6, 
         Arg2 = 1, 
      }, 
      [36] = 
      {
         MiscData = 1, 
         Arg1 = 28013, 
         Command = "M", 
         Arg3 = 28117, 
         Arg2 = 10, 
      }, 
      [37] = 
      {
         MiscData = 1, 
         Arg1 = 28013, 
         Command = "M", 
         Arg3 = 28117, 
         Arg2 = 10, 
      }, 
      [38] = 
      {
         MiscData = 1, 
         Arg1 = 28013, 
         Command = "M", 
         Arg3 = 28117, 
         Arg2 = 10, 
      }, 
      [39] = 
      {
         MiscData = 1, 
         Arg1 = 28002, 
         Command = "M", 
         Arg3 = 28118, 
         Arg2 = 4, 
      }, 
      [40] = 
      {
         MiscData = 1, 
         Arg1 = 28001, 
         Command = "M", 
         Arg3 = 28121, 
         Arg2 = 41, 
      }, 
      [41] = 
      {
         MiscData = 1, 
         Arg1 = 28005, 
         Command = "M", 
         Arg3 = 28122, 
         Arg2 = 1, 
      }, 
      [42] = 
      {
         MiscData = 1, 
         Arg1 = 28189, 
         Command = "E", 
         Arg3 = 16, 
         Arg2 = 1, 
      }, 
      [43] = 
      {
         MiscData = 1, 
         Arg1 = 28010, 
         Command = "E", 
         Arg3 = 5, 
         Arg2 = 1, 
      }, 
      [44] = 
      {
         MiscData = 1, 
         Arg1 = 28015, 
         Command = "E", 
         Arg3 = 6, 
         Arg2 = 1, 
      }, 
      [45] = 
      {
         MiscData = 1, 
         Arg1 = 28016, 
         Command = "E", 
         Arg3 = 8, 
         Arg2 = 1, 
      }, 
      [46] = 
      {
         MiscData = 1, 
         Arg1 = 28017, 
         Command = "E", 
         Arg3 = 14, 
         Arg2 = 1, 
      }, 
      [47] = 
      {
         MiscData = 1, 
         Arg1 = 28017, 
         Command = "E", 
         Arg3 = 15, 
         Arg2 = 1, 
      }, 
      [48] = 
      {
         MiscData = 1, 
         Arg1 = 28011, 
         Command = "E", 
         Arg3 = 13, 
         Arg2 = 1, 
      }, 
      [49] = 
      {
         MiscData = 1, 
         Arg1 = 28024, 
         Command = "E", 
         Arg3 = 3, 
         Arg2 = 1, 
      }, 
      [50] = 
      {
         MiscData = 1, 
         Arg1 = 28024, 
         Command = "E", 
         Arg3 = 4, 
         Arg2 = 1, 
      }, 
      [51] = 
      {
         MiscData = 1, 
         Arg1 = 28001, 
         Command = "M", 
         Arg3 = 28122, 
         Arg2 = 41, 
      }, 
      [52] = 
      {
         MiscData = 1, 
         Arg1 = 28013, 
         Command = "M", 
         Arg3 = 28123, 
         Arg2 = 10, 
      }, 
      [53] = 
      {
         MiscData = 1, 
         Arg1 = 28001, 
         Command = "M", 
         Arg3 = 28124, 
         Arg2 = 41, 
      }, 
      [54] = 
      {
         MiscData = 1, 
         Arg1 = 28013, 
         Command = "M", 
         Arg3 = 28125, 
         Arg2 = 10, 
      }, 
      [55] = 
      {
         MiscData = 1, 
         Arg1 = 28013, 
         Command = "M", 
         Arg3 = 28130, 
         Arg2 = 10, 
      }, 
      [56] = 
      {
         MiscData = 1, 
         Arg1 = 28013, 
         Command = "M", 
         Arg3 = 28131, 
         Arg2 = 10, 
      }, 
      [57] = 
      {
         MiscData = 1, 
         Arg1 = 28013, 
         Command = "M", 
         Arg3 = 28131, 
         Arg2 = 10, 
      }, 
      [58] = 
      {
         MiscData = 1, 
         Arg1 = 28001, 
         Command = "M", 
         Arg3 = 28133, 
         Arg2 = 41, 
      }, 
      [59] = 
      {
         MiscData = 1, 
         Arg1 = 28001, 
         Command = "M", 
         Arg3 = 28145, 
         Arg2 = 41, 
      }, 
      [60] = 
      {
         MiscData = 1, 
         Arg1 = 28001, 
         Command = "M", 
         Arg3 = 28150, 
         Arg2 = 41, 
      }, 
      [61] = 
      {
         MiscData = 1, 
         Arg1 = 28001, 
         Command = "M", 
         Arg3 = 28150, 
         Arg2 = 41, 
      }, 
      [62] = 
      {
         MiscData = 1, 
         Arg1 = 28001, 
         Command = "M", 
         Arg3 = 28151, 
         Arg2 = 41, 
      }, 
      [63] = 
      {
         MiscData = 1, 
         Arg1 = 28001, 
         Command = "M", 
         Arg3 = 28151, 
         Arg2 = 41, 
      }, 
      [64] = 
      {
         MiscData = 1, 
         Arg1 = 28001, 
         Command = "M", 
         Arg3 = 28151, 
         Arg2 = 41, 
      }, 
      [65] = 
      {
         MiscData = 1, 
         Arg1 = 28001, 
         Command = "M", 
         Arg3 = 28151, 
         Arg2 = 41, 
      }, 
      [66] = 
      {
         MiscData = 1, 
         Arg1 = 28001, 
         Command = "M", 
         Arg3 = 28151, 
         Arg2 = 41, 
      }, 
      [67] = 
      {
         MiscData = 1, 
         Arg1 = 28001, 
         Command = "M", 
         Arg3 = 28151, 
         Arg2 = 41, 
      }, 
      [68] = 
      {
         MiscData = 1, 
         Arg1 = 28001, 
         Command = "M", 
         Arg3 = 28151, 
         Arg2 = 41, 
      }, 
      [69] = 
      {
         MiscData = 1, 
         Arg1 = 28001, 
         Command = "M", 
         Arg3 = 28151, 
         Arg2 = 41, 
      }, 
      [70] = 
      {
         MiscData = 1, 
         Arg1 = 28001, 
         Command = "M", 
         Arg3 = 28152, 
         Arg2 = 41, 
      }, 
      [71] = 
      {
         MiscData = 1, 
         Arg1 = 28018, 
         Command = "M", 
         Arg3 = 28154, 
         Arg2 = 1, 
      }, 
      [72] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 10313, 
         Command = "G", 
      }, 
      [73] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 25, 
         Command = "G", 
      }, 
      [74] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 10317, 
         Command = "G", 
      }, 
      [75] = 
      {
         MiscData = 1, 
         Arg1 = 28017, 
         Command = "M", 
         Arg3 = 28155, 
         Arg2 = 1, 
      }, 
      [76] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 32253, 
         Command = "G", 
      }, 
      [77] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 10314, 
         Command = "G", 
      }, 
      [78] = 
      {
         MiscData = 1, 
         Arg1 = 28019, 
         Command = "M", 
         Arg3 = 28156, 
         Arg2 = 1, 
      }, 
      [79] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 28020, 
         Command = "G", 
      }, 
      [80] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 28004, 
         Command = "G", 
      }, 
      [81] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 28006, 
         Command = "G", 
      }, 
      [82] = 
      {
         MiscData = 1, 
         Arg1 = 28001, 
         Command = "M", 
         Arg3 = 28156, 
         Arg2 = 41, 
      }, 
      [83] = 
      {
         MiscData = 1, 
         Arg1 = 28001, 
         Command = "M", 
         Arg3 = 28156, 
         Arg2 = 41, 
      }, 
      [84] = 
      {
         MiscData = 1, 
         Arg1 = 28001, 
         Command = "M", 
         Arg3 = 28157, 
         Arg2 = 41, 
      }, 
      [85] = 
      {
         MiscData = 1, 
         Arg1 = 28001, 
         Command = "M", 
         Arg3 = 28158, 
         Arg2 = 41, 
      }, 
      [86] = 
      {
         MiscData = 1, 
         Arg1 = 28023, 
         Command = "M", 
         Arg3 = 28159, 
         Arg2 = 1, 
      }, 
      [87] = 
      {
         MiscData = 1, 
         Arg1 = 28001, 
         Command = "M", 
         Arg3 = 28160, 
         Arg2 = 41, 
      }, 
      [88] = 
      {
         MiscData = 1, 
         Arg1 = 28001, 
         Command = "M", 
         Arg3 = 28160, 
         Arg2 = 41, 
      }, 
      [89] = 
      {
         MiscData = 1, 
         Arg1 = 28004, 
         Command = "M", 
         Arg3 = 28168, 
         Arg2 = 1, 
      }, 
      [90] = 
      {
         MiscData = 1, 
         Arg1 = 28007, 
         Command = "O", 
         Arg3 = 28168, 
         Arg2 = 1, 
      }, 
      [91] = 
      {
         MiscData = 1, 
         Arg1 = 28012, 
         Command = "M", 
         Arg3 = 28181, 
         Arg2 = 1, 
      }, 
      [92] = 
      {
         MiscData = 1, 
         Arg1 = 28015, 
         Command = "E", 
         Arg3 = 6, 
         Arg2 = 1, 
      }, 
      [93] = 
      {
         MiscData = 1, 
         Arg1 = 28016, 
         Command = "E", 
         Arg3 = 8, 
         Arg2 = 1, 
      }, 
      [94] = 
      {
         MiscData = 1, 
         Arg1 = 28017, 
         Command = "E", 
         Arg3 = 14, 
         Arg2 = 1, 
      }, 
      [95] = 
      {
         MiscData = 1, 
         Arg1 = 28011, 
         Command = "E", 
         Arg3 = 13, 
         Arg2 = 1, 
      }, 
      [96] = 
      {
         MiscData = 1, 
         Arg1 = 28017, 
         Command = "E", 
         Arg3 = 15, 
         Arg2 = 1, 
      }, 
      [97] = 
      {
         MiscData = 1, 
         Arg1 = 28009, 
         Command = "E", 
         Arg3 = 5, 
         Arg2 = 1, 
      }, 
      [98] = 
      {
         MiscData = 1, 
         Arg1 = 28024, 
         Command = "E", 
         Arg3 = 3, 
         Arg2 = 1, 
      }, 
      [99] = 
      {
         MiscData = 1, 
         Arg1 = 28024, 
         Command = "E", 
         Arg3 = 4, 
         Arg2 = 1, 
      }, 
      [100] = 
      {
         MiscData = 1, 
         Arg1 = 28025, 
         Command = "E", 
         Arg3 = 16, 
         Arg2 = 1, 
      }, 
      [101] = 
      {
         MiscData = 1, 
         Arg1 = 28026, 
         Command = "O", 
         Arg3 = 28183, 
         Arg2 = 1, 
      }, 
      [102] = 
      {
         MiscData = 1, 
         Arg1 = 28009, 
         Command = "M", 
         Arg3 = 28186, 
         Arg2 = 1, 
      }, 
      [103] = 
      {
         MiscData = 1, 
         Arg1 = 28008, 
         Command = "E", 
         Arg3 = 5, 
         Arg2 = 1, 
      }, 
      [104] = 
      {
         MiscData = 1, 
         Arg1 = 28011, 
         Command = "E", 
         Arg3 = 13, 
         Arg2 = 1, 
      }, 
      [105] = 
      {
         MiscData = 1, 
         Arg1 = 28015, 
         Command = "E", 
         Arg3 = 6, 
         Arg2 = 1, 
      }, 
      [106] = 
      {
         MiscData = 1, 
         Arg1 = 28016, 
         Command = "E", 
         Arg3 = 8, 
         Arg2 = 1, 
      }, 
      [107] = 
      {
         MiscData = 1, 
         Arg1 = 28017, 
         Command = "E", 
         Arg3 = 14, 
         Arg2 = 1, 
      }, 
      [108] = 
      {
         MiscData = 1, 
         Arg1 = 28120, 
         Command = "E", 
         Arg3 = 3, 
         Arg2 = 1, 
      }, 
      [109] = 
      {
         MiscData = 1, 
         Arg1 = 28017, 
         Command = "E", 
         Arg3 = 15, 
         Arg2 = 1, 
      }, 
      [110] = 
      {
         MiscData = 1, 
         Arg1 = 28020, 
         Command = "E", 
         Arg3 = 16, 
         Arg2 = 1, 
      }, 
      [111] = 
      {
         MiscData = 1, 
         Arg1 = 28020, 
         Command = "E", 
         Arg3 = 18, 
         Arg2 = 1, 
      }, 
      [112] = 
      {
         MiscData = 1, 
         Arg1 = 28001, 
         Command = "M", 
         Arg3 = 28189, 
         Arg2 = 41, 
      }, 
      [113] = 
      {
         MiscData = 1, 
         Arg1 = 28001, 
         Command = "M", 
         Arg3 = 28191, 
         Arg2 = 41, 
      }, 
      [114] = 
      {
         MiscData = 1, 
         Arg1 = 28001, 
         Command = "M", 
         Arg3 = 28191, 
         Arg2 = 41, 
      }, 
      [115] = 
      {
         MiscData = 1, 
         Arg1 = 28001, 
         Command = "M", 
         Arg3 = 28193, 
         Arg2 = 41, 
      }, 
      [116] = 
      {
         MiscData = 1, 
         Arg1 = 28001, 
         Command = "M", 
         Arg3 = 28195, 
         Arg2 = 41, 
      }, 
      [117] = 
      {
         MiscData = 1, 
         Arg1 = 28016, 
         Command = "M", 
         Arg3 = 28196, 
         Arg2 = 1, 
      }, 
      [118] = 
      {
         MiscData = 1, 
         Arg1 = 28001, 
         Command = "M", 
         Arg3 = 28196, 
         Arg2 = 41, 
      }, 
      [119] = 
      {
         MiscData = 1, 
         Arg1 = 28001, 
         Command = "M", 
         Arg3 = 28196, 
         Arg2 = 41, 
      }, 
      [120] = 
      {
         MiscData = 1, 
         Arg1 = 28001, 
         Command = "M", 
         Arg3 = 28196, 
         Arg2 = 41, 
      }, 
      [121] = 
      {
         MiscData = 1, 
         Arg1 = 28001, 
         Command = "M", 
         Arg3 = 28197, 
         Arg2 = 41, 
      }, 
      [122] = 
      {
         MiscData = 1, 
         Arg1 = 28001, 
         Command = "M", 
         Arg3 = 28197, 
         Arg2 = 41, 
      }, 
      [123] = 
      {
         MiscData = 1, 
         Arg1 = 28014, 
         Command = "O", 
         Arg3 = 28197, 
         Arg2 = 1, 
      }, 
      [124] = 
      {
         MiscData = 1, 
         Arg1 = 28001, 
         Command = "M", 
         Arg3 = 28198, 
         Arg2 = 41, 
      }, 
      [125] = 
      {
         MiscData = 1, 
         Arg1 = 28001, 
         Command = "M", 
         Arg3 = 28198, 
         Arg2 = 41, 
      }, 
      [126] = 
      {
         MiscData = 1, 
         Arg1 = 28001, 
         Command = "M", 
         Arg3 = 28198, 
         Arg2 = 41, 
      }, 
      [127] = 
      {
         MiscData = 1, 
         Arg1 = 28001, 
         Command = "M", 
         Arg3 = 28198, 
         Arg2 = 41, 
      }, 
      [128] = 
      {
         MiscData = 0, 
         Arg1 = 28025, 
         Command = "M", 
         Arg3 = 28003, 
         Arg2 = 30, 
      }, 
      [129] = 
      {
         MiscData = 0, 
         Arg1 = 28025, 
         Command = "M", 
         Arg3 = 28128, 
         Arg2 = 30, 
      }, 
      [130] = 
      {
         MiscData = 0, 
         Arg1 = 28025, 
         Command = "M", 
         Arg3 = 28148, 
         Arg2 = 30, 
      }, 
      [131] = 
      {
         MiscData = 1, 
         Arg1 = 28021, 
         Command = "O", 
         Arg3 = 28038, 
         Arg2 = 1, 
      }, 
      [132] = 
      {
         MiscData = 0, 
         Arg1 = 28022, 
         Command = "P", 
         Arg3 = 0, 
         Arg2 = 1, 
      }, 
      [133] = 
      {
         MiscData = 1, 
         Arg1 = 28023, 
         Command = "O", 
         Arg3 = 28038, 
         Arg2 = 1, 
      }, 
   }, 
   ResetMessage = "A warm breeze blows softly across your face.", 
   Author = "Thrawn", 
   Name = "Gamorr", 
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
   Filename = "gamorr.lua", 
   Mobiles = 
   {
      [28000] = 
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
         ShortDescr = "A Strange man ", 
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
         Alignment = 1000, 
         NumberOfAttacks = 3, 
         DamRoll = 5, 
         HitRoll = 5, 
         Vnum = 28000, 
         Height = 0, 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
               [18] = "_clan", 
            }, 
            Speaking = 
            {
               [0] = "basic", 
               [18] = "_clan", 
            }, 
         }, 
         Sex = "undistinguished", 
         Credits = 5000, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "greet_prog", 
               Code = "smile\
'Hello, welcome to my home\
", 
               Arguments = "100", 
               ScriptType = "MProg", 
            }, 
         }, 
         Level = 100, 
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
         Name = "A Strange man ", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A strange man is sitting here meditating.\
", 
         ArmorClass = -50, 
      }, 
      [28001] = 
      {
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 6, 
            DamNoDice = 2, 
         }, 
         Position = "standing", 
         HitChance = 
         {
            HitPlus = 100, 
            HitSizeDice = 10, 
            HitNoDice = 2, 
         }, 
         ShortDescr = "A Gamorrean male", 
         Race = "Gamorrean", 
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
         NumberOfAttacks = 2, 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
               [14] = "gamorrese", 
            }, 
            Speaking = 
            {
               [14] = "gamorrese", 
            }, 
         }, 
         HitRoll = 0, 
         Vnum = 28001, 
         Height = 0, 
         Sex = "male", 
         VipFlags = 
         {
            [7] = "Gamorr", 
         }, 
         Credits = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Code = "grunt\
", 
               Arguments = "5", 
               ScriptType = "MProg", 
            }, 
            [2] = 
            {
               MudProgType = "fight_prog", 
               Code = "mpechoat $n The Gamorrean head butts you!\
mpechoaround $n The Gamorrean headbutts $n!\
mpdamage $n 15\
", 
               Arguments = "30", 
               ScriptType = "MProg", 
            }, 
         }, 
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
            [30] = "Prototype", 
         }, 
         Name = "A Gamorrean male", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A Gamorrean male wanders around here.\
", 
         ArmorClass = 10, 
      }, 
      [28002] = 
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
         ShortDescr = "A Gamorrean child", 
         Race = "Gamorrean", 
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
         HitRoll = 0, 
         Vnum = 28002, 
         Height = 0, 
         Languages = 
         {
            Speaks = 
            {
               [14] = "gamorrese", 
            }, 
            Speaking = 
            {
               [14] = "gamorrese", 
            }, 
         }, 
         Sex = "male", 
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
         Name = "gamorrean child kid piglet", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A Gamorrean child is playing around here\
", 
         ArmorClass = 0, 
      }, 
      [28003] = 
      {
         Damage = 
         {
            DamPlus = 6, 
            DamSizeDice = 6, 
            DamNoDice = 6, 
         }, 
         Position = "standing", 
         HitChance = 
         {
            HitPlus = 1000, 
            HitSizeDice = 1, 
            HitNoDice = 1, 
         }, 
         ShortDescr = "A Gamorreans watch-beast", 
         Race = "Gamorrean", 
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
         Description = "You've heard about these guys they are nothing to be messed with, they\
are cunning evil and like to eat living flesh. nothing on this planet\
has the same reputation as the watch-beast so watch you step it could\
be you last!\
 \
", 
         Alignment = 0, 
         NumberOfAttacks = 3, 
         HitRoll = 15, 
         Vnum = 28003, 
         Height = 0, 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
               [14] = "gamorrese", 
            }, 
            Speaking = 
            {
               [14] = "gamorrese", 
            }, 
         }, 
         Sex = "undistinguished", 
         Credits = 0, 
         DamRoll = 10, 
         Level = 60, 
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
         }, 
         Name = "gamorrean watch beast big pig ", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A Gamorreans watch-beast is eatting a freshly killed tourist\
", 
         ArmorClass = 0, 
      }, 
      [28004] = 
      {
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 4, 
            DamNoDice = 4, 
         }, 
         Position = "standing", 
         HitChance = 
         {
            HitPlus = 300, 
            HitSizeDice = 10, 
            HitNoDice = 6, 
         }, 
         ShortDescr = "a Desert Beitl", 
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
         DamRoll = 6, 
         HitRoll = 6, 
         Vnum = 28004, 
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
               MudProgType = "rand_prog", 
               Code = "grow\
", 
               Arguments = "5", 
               ScriptType = "MProg", 
            }, 
         }, 
         Level = 30, 
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
            [18] = "Mountable", 
         }, 
         Name = "Beitl beast terrible run RUN RUN AWAY", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A ferocious Desert Beitl is basking in the desert sun.\
", 
         ArmorClass = 25, 
      }, 
      [28005] = 
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
         ShortDescr = "Shushgu", 
         Race = "Gamorrean", 
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
         HitRoll = 12, 
         Vnum = 28005, 
         Height = 0, 
         Languages = 
         {
            Speaks = 
            {
               [14] = "gamorrese", 
            }, 
            Speaking = 
            {
               [14] = "gamorrese", 
            }, 
         }, 
         Sex = "male", 
         Credits = 420, 
         DamRoll = 11, 
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
            [25] = "NoKill", 
         }, 
         Name = "boar head shushgu", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "It's Shushgu, One of the Alpha-females Husbands.\
", 
         ArmorClass = -76, 
      }, 
      [28006] = 
      {
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 6, 
            DamNoDice = 1, 
         }, 
         Position = "standing", 
         HitChance = 
         {
            HitPlus = 100, 
            HitSizeDice = 10, 
            HitNoDice = 2, 
         }, 
         ShortDescr = "A Gurda Beast", 
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
         Sex = "undistinguished", 
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
         Vnum = 28006, 
         Height = 0, 
         AttackFlags = 
         {
            [1] = "claws", 
         }, 
         DamRoll = 2, 
         Credits = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "all_greet_prog", 
               Code = "get baby\
grow\
l $n\
eat baby\
", 
               Arguments = "100", 
               ScriptType = "MProg", 
            }, 
         }, 
         Level = 10, 
         AffectedBy = 
         {
            [1] = "Invisible", 
            [15] = "Sneak", 
            [9] = "Infrared", 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [5] = "Aggressive", 
         }, 
         Name = "gurda beast ", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A Gurda Beast is prowling around in the mountain shadows.\
", 
         ArmorClass = 75, 
      }, 
      [28007] = 
      {
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 6, 
            DamNoDice = 1, 
         }, 
         Position = "standing", 
         HitChance = 
         {
            HitPlus = 100, 
            HitSizeDice = 10, 
            HitNoDice = 2, 
         }, 
         ShortDescr = "An Imperial Stormtrooper", 
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
         HitRoll = 2, 
         Vnum = 28007, 
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
         Sex = "male", 
         Credits = 0, 
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
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Name = "Imperial stormtrooper", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "An Imperial Stormtrooper is loading infant Gamorrean watch-beasts\
", 
         ArmorClass = 77, 
      }, 
      [28008] = 
      {
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 6, 
            DamNoDice = 1, 
         }, 
         Position = "standing", 
         HitChance = 
         {
            HitPlus = 100, 
            HitSizeDice = 10, 
            HitNoDice = 2, 
         }, 
         ShortDescr = "An Imperial Stormtrooper", 
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
         HitRoll = 2, 
         Vnum = 28008, 
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
         Sex = "male", 
         Credits = 0, 
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
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Name = "Imperial stormtrooper", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "An Imperial Stormtrooper has his blaster aimed at the watch-beasts.\
", 
         ArmorClass = 77, 
      }, 
      [28009] = 
      {
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 7, 
            DamNoDice = 4, 
         }, 
         Position = "standing", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         ShortDescr = "Jos", 
         Race = "Gamorrean", 
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
         HitRoll = 7, 
         Vnum = 28009, 
         Height = 0, 
         Languages = 
         {
            Speaks = 
            {
               [14] = "gamorrese", 
            }, 
            Speaking = 
            {
               [14] = "gamorrese", 
            }, 
         }, 
         Sex = "male", 
         Credits = 0, 
         DamRoll = 7, 
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
            [0] = "Npc", 
            [25] = "NoKill", 
         }, 
         Name = "Jos third husband", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "Jos, The Alpha-females third Husband\
", 
         ArmorClass = 0, 
      }, 
      [28010] = 
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
         ShortDescr = "A Gamorrean guard", 
         Race = "Gamorrean", 
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
         DamRoll = 0, 
         HitRoll = 0, 
         Vnum = 28010, 
         Height = 0, 
         Languages = 
         {
            Speaks = 
            {
               [14] = "gamorrese", 
            }, 
            Speaking = 
            {
               [14] = "gamorrese", 
            }, 
         }, 
         Sex = "male", 
         Credits = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "greet_prog", 
               Code = "sigh\
say Welcome to Gamorr may you stay be...\
grunt\
say pleasing.\
smirk\
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
            [2] = "Scavenger", 
            [0] = "Npc", 
         }, 
         Name = "gamorrean guard", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A Gamorrean stands guard here\
", 
         ArmorClass = 0, 
      }, 
      [28011] = 
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
         ShortDescr = "The shop owner", 
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
            KeeperShortDescr = "The shop owner", 
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
         }, 
         HitRoll = 0, 
         Vnum = 28011, 
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
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Name = "stand owner ", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "The Small stands owner is selling refreshing drinks here\
", 
         ArmorClass = 0, 
      }, 
      [28012] = 
      {
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 4, 
            DamNoDice = 8, 
         }, 
         Position = "standing", 
         HitChance = 
         {
            HitPlus = 100, 
            HitSizeDice = 10, 
            HitNoDice = 10, 
         }, 
         ShortDescr = "Fruck", 
         Race = "Gamorrean", 
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
         HitRoll = 15, 
         Vnum = 28012, 
         Height = 0, 
         Languages = 
         {
            Speaks = 
            {
               [14] = "gamorrese", 
            }, 
            Speaking = 
            {
               [14] = "gamorrese", 
            }, 
         }, 
         Sex = "male", 
         Credits = 240, 
         DamRoll = 15, 
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
            [0] = "Npc", 
            [25] = "NoKill", 
         }, 
         Name = "Fruck", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "Fruck is here keeping watch over Ugmush's ship.\
", 
         ArmorClass = -30, 
      }, 
      [28013] = 
      {
         Damage = 
         {
            DamPlus = 3, 
            DamSizeDice = 1, 
            DamNoDice = 3, 
         }, 
         Position = "standing", 
         HitChance = 
         {
            HitPlus = 30, 
            HitSizeDice = 1, 
            HitNoDice = 1, 
         }, 
         ShortDescr = "a raxe pest", 
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
         SpecFuns = 
         {
            [0] = "spec_fido", 
         }, 
         HitRoll = 0, 
         Vnum = 28013, 
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
         Level = 3, 
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
         Name = "raxe pest ", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A raxe pest is scurrying around here.\
", 
         ArmorClass = 0, 
      }, 
      [28014] = 
      {
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 4, 
            DamNoDice = 4, 
         }, 
         Position = "standing", 
         HitChance = 
         {
            HitPlus = 300, 
            HitSizeDice = 10, 
            HitNoDice = 6, 
         }, 
         ShortDescr = "a zicreex beast ", 
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
         Description = "This is the Zicreex, well known around Gamorr for its hunting of the\
natives most gamorreans keep a safe distance from these hungry beasts\
and with good reason too the Zicreexs diet mainly consists of\
gamorreans.\
 \
", 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         HitRoll = 0, 
         Vnum = 28014, 
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
         Level = 30, 
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
            [5] = "Aggressive", 
         }, 
         Name = "zicreex beast", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A Zicreex beast is on the hunt here.\
", 
         ArmorClass = 0, 
      }, 
      [28015] = 
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
         ShortDescr = "Shaga", 
         Race = "Gamorrean", 
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
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
               [14] = "gamorrese", 
            }, 
            Speaking = 
            {
               [14] = "gamorrese", 
            }, 
         }, 
         NumberOfAttacks = 2, 
         Sex = "female", 
         HitRoll = 0, 
         Vnum = 28015, 
         Height = 0, 
         VipFlags = 
         {
            [7] = "Gamorr", 
         }, 
         AttackFlags = 
         {
            [9] = "_09", 
            [4] = "punch", 
            [5] = "kick", 
            [6] = "_06", 
            [7] = "_07", 
         }, 
         Credits = 450, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "death_prog", 
               Code = "mpecho With her last bit of strength, Shaga desperatly tries to hold\
mpecho onto the clans sacred stone.\
mpoload 28030\
drop all\
", 
               Arguments = "100", 
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
         }, 
         Name = "shaga mountain matron", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "Shaga the mountain clan matron is standing here.\
", 
         ArmorClass = -74, 
      }, 
      [28016] = 
      {
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Position = "sitting", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         ShortDescr = "a gamorrean shaman", 
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
         Description = "This old human man seems to be content just gazing at the stars. He is\
dressed in a long hooded cloak and old brown boots. from the scars on\
his face you think that this man has seen a fair share of action in\
his days.\
Maybe he could teach you a thing or two....\
", 
         Alignment = 0, 
         NumberOfAttacks = 0, 
         HitRoll = 0, 
         Vnum = 28016, 
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
         Level = 103, 
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
            [10] = "Practice", 
            [20] = "Scholar", 
         }, 
         Name = "shaman gamorrean healer", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A gamorrean shaman is sitting here.\
", 
         ArmorClass = 0, 
      }, 
      [28017] = 
      {
         Damage = 
         {
            DamPlus = 10, 
            DamSizeDice = 5, 
            DamNoDice = 10, 
         }, 
         Position = "standing", 
         HitChance = 
         {
            HitPlus = 12998, 
            HitSizeDice = 1, 
            HitNoDice = 1, 
         }, 
         ShortDescr = "a gamorrean shop keeper", 
         Race = "Gamorrean", 
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
            KeeperShortDescr = "a gamorrean shop keeper", 
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
         }, 
         HitRoll = 0, 
         Vnum = 28017, 
         Height = 0, 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
               [14] = "gamorrese", 
            }, 
            Speaking = 
            {
               [14] = "gamorrese", 
            }, 
         }, 
         Sex = "female", 
         Credits = 0, 
         DamRoll = 0, 
         Level = 20, 
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
         Name = "gamorrean shop owner", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A gamorrean shop keeper is selling some water goods.\
", 
         ArmorClass = 0, 
      }, 
      [28018] = 
      {
         Damage = 
         {
            DamPlus = 10, 
            DamSizeDice = 5, 
            DamNoDice = 10, 
         }, 
         Position = "standing", 
         HitChance = 
         {
            HitPlus = 12998, 
            HitSizeDice = 1, 
            HitNoDice = 1, 
         }, 
         ShortDescr = "The Gamorrean Shop keeper", 
         Race = "Gamorrean", 
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
            KeeperShortDescr = "The Gamorrean Shop keeper", 
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
         }, 
         HitRoll = 0, 
         Vnum = 28018, 
         Height = 0, 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
               [14] = "gamorrese", 
            }, 
            Speaking = 
            {
               [14] = "gamorrese", 
            }, 
         }, 
         Sex = "female", 
         Credits = 0, 
         DamRoll = 0, 
         Level = 20, 
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
         Name = "gamorrean shop owner", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A gamorrean shop keeper is selling some goods here.\
", 
         ArmorClass = 0, 
      }, 
      [28019] = 
      {
         Damage = 
         {
            DamPlus = 10, 
            DamSizeDice = 5, 
            DamNoDice = 10, 
         }, 
         Position = "standing", 
         HitChance = 
         {
            HitPlus = 12998, 
            HitSizeDice = 1, 
            HitNoDice = 1, 
         }, 
         ShortDescr = "The Gamorrean Shop keeper", 
         Race = "Gamorrean", 
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
            KeeperShortDescr = "The Gamorrean Shop keeper", 
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
         }, 
         HitRoll = 0, 
         Vnum = 28019, 
         Height = 0, 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
               [14] = "gamorrese", 
            }, 
            Speaking = 
            {
               [14] = "gamorrese", 
            }, 
         }, 
         Sex = "female", 
         Credits = 0, 
         DamRoll = 0, 
         Level = 20, 
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
         Name = "gamorrean shop owner", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A gamorrean shop keeper is selling some of her weapons here.\
", 
         ArmorClass = 0, 
      }, 
      [28020] = 
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
         ShortDescr = "a noghri", 
         Race = "Shistavanen", 
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
         Vnum = 28020, 
         Height = 0, 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
               [6] = "shistavanen", 
            }, 
            Speaking = 
            {
               [6] = "shistavanen", 
            }, 
         }, 
         Sex = "male", 
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
         }, 
         Name = "noghri patron", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A noghri is sitting here minding his own business.\
", 
         ArmorClass = 0, 
      }, 
      [28021] = 
      {
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 3, 
            DamNoDice = 8, 
         }, 
         Position = "standing", 
         HitChance = 
         {
            HitPlus = 450, 
            HitSizeDice = 9, 
            HitNoDice = 10, 
         }, 
         ShortDescr = "A trandoshan hunter", 
         Race = "Trandoshan", 
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
         DamRoll = 9, 
         HitRoll = 9, 
         Vnum = 28021, 
         Height = 0, 
         Languages = 
         {
            Speaks = 
            {
               [22] = "dosh", 
            }, 
            Speaking = 
            {
               [22] = "dosh", 
            }, 
         }, 
         Sex = "male", 
         Credits = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "all_greet_prog", 
               Code = "if race($n) == wookiee\
' Wookiee Scum!!\
mpkill $n\
endif\
", 
               Arguments = "100", 
               ScriptType = "MProg", 
            }, 
         }, 
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
         }, 
         Name = "trandoshan hunter", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A trandoshan hunter is sitting here watching out for something.\
", 
         ArmorClass = 0, 
      }, 
      [28022] = 
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
         ShortDescr = "a newly created wookiee", 
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
         HitRoll = 0, 
         Vnum = 28022, 
         Height = 0, 
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
         Name = "wookiee", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "Some god abandoned a newly created wookiee here.\
", 
         ArmorClass = 0, 
      }, 
      [28023] = 
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
         ShortDescr = "Shugsha", 
         Race = "Gamorrean", 
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
         NumberOfAttacks = 6, 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
               [14] = "gamorrese", 
            }, 
            Speaking = 
            {
               [14] = "gamorrese", 
            }, 
         }, 
         HitRoll = 0, 
         Vnum = 28023, 
         Height = 0, 
         Sex = "female", 
         AttackFlags = 
         {
            [9] = "_09", 
            [4] = "punch", 
            [5] = "kick", 
            [6] = "_06", 
            [7] = "_07", 
         }, 
         Credits = 450, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "death_prog", 
               Code = "mpecho Shugsha drops a shield as she collapses to the ground.\
mpoload 28029\
", 
               Arguments = "100", 
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
         }, 
         Name = "Shugsha", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "Shugsha the forest clan matron is here.\
", 
         ArmorClass = -74, 
      }, 
      [28025] = 
      {
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 6, 
            DamNoDice = 2, 
         }, 
         Position = "standing", 
         HitChance = 
         {
            HitPlus = 100, 
            HitSizeDice = 10, 
            HitNoDice = 2, 
         }, 
         ShortDescr = "A Female Gamorrean", 
         Race = "Gamorrean", 
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
         NumberOfAttacks = 2, 
         HitRoll = 0, 
         Vnum = 28025, 
         Height = 0, 
         Languages = 
         {
            Speaks = 
            {
               [14] = "gamorrese", 
            }, 
            Speaking = 
            {
               [14] = "gamorrese", 
            }, 
         }, 
         Sex = "male", 
         Credits = 0, 
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
         Name = "female gamorrean", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A Female Gamorrean is going to collect the crops.\
", 
         ArmorClass = 10, 
      }, 
      [28139] = 
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
            HitPlus = 100, 
            HitSizeDice = 1, 
            HitNoDice = 1, 
         }, 
         ShortDescr = "A large Morrt", 
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
         DamRoll = 10, 
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
         Vnum = 28139, 
         Height = 0, 
         Sex = "undistinguished", 
         AttackFlags = 
         {
            [0] = "bite", 
         }, 
         Credits = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Code = "drool\
", 
               Arguments = "10", 
               ScriptType = "MProg", 
            }, 
         }, 
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
            [5] = "Aggressive", 
            [2] = "Scavenger", 
            [6] = "StayArea", 
         }, 
         Name = "morrt", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A hungery Morrt is crawling around the ground here.\
", 
         ArmorClass = 0, 
      }, 
      [28116] = 
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
         ShortDescr = "Ugmush", 
         Race = "Gamorrean", 
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
         Description = "Ugmush is a Beauty to the Gamorreans, she has a long pink wig and her\
heavy muscled arms and breasts are sporting fifteen parasitic morrts\
to demonstrate her strength and endurance.   \
 \
", 
         Alignment = 0, 
         DamRoll = 14, 
         NumberOfAttacks = 6, 
         Languages = 
         {
            Speaks = 
            {
               [14] = "gamorrese", 
            }, 
            Speaking = 
            {
               [14] = "gamorrese", 
            }, 
         }, 
         HitRoll = 14, 
         Vnum = 28116, 
         Height = 0, 
         Sex = "female", 
         AttackFlags = 
         {
            [9] = "_09", 
            [4] = "punch", 
            [5] = "kick", 
            [6] = "_06", 
            [7] = "_07", 
         }, 
         Credits = 450, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "death_prog", 
               Code = "mpecho &YWith her dying breath Ugmush drops a cerimonial axe.\
mpoload 28028\
", 
               Arguments = "100", 
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
         }, 
         Name = "Ugmush alpha female", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "The Alpha-Female Ugmush stands before you.\
", 
         ArmorClass = -74, 
      }, 
      [28107] = 
      {
         Damage = 
         {
            DamPlus = 10, 
            DamSizeDice = 5, 
            DamNoDice = 10, 
         }, 
         Position = "standing", 
         HitChance = 
         {
            HitPlus = 12998, 
            HitSizeDice = 1, 
            HitNoDice = 1, 
         }, 
         ShortDescr = "The Gamorrean Shop keeper", 
         Race = "Gamorrean", 
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
            KeeperShortDescr = "The Gamorrean Shop keeper", 
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
         }, 
         NumberOfAttacks = 0, 
         DamRoll = 0, 
         HitRoll = 0, 
         Vnum = 28107, 
         Height = 0, 
         Languages = 
         {
            Speaks = 
            {
               [2] = "twileki", 
               [3] = "rodese", 
               [4] = "huttese", 
               [6] = "shistavanen", 
               [7] = "ewokese", 
               [8] = "ithorese", 
               [9] = "antarian", 
               [10] = "devaronese", 
               [11] = "barabel", 
               [15] = "togorian", 
               [0] = "basic", 
               [17] = "jawaese", 
            }, 
            Speaking = 
            {
               [14] = "gamorrese", 
            }, 
         }, 
         Sex = "female", 
         Credits = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "greet_prog", 
               Code = "say I have very many usefull things you might like \
", 
               Arguments = "100 ", 
               ScriptType = "MProg", 
            }, 
         }, 
         Level = 20, 
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
         Name = "Gamorrean Shop keeper.", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "The Gamorrean shop keeper is selling her weapons.\
", 
         ArmorClass = 0, 
      }, 
   }, 
}
