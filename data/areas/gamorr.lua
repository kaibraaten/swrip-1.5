-- Gamorr
-- Last saved Thursday 26-Nov-2020 15:24:24

AreaEntry
{
   HighEconomy = 0, 
   Objects = 
   {
      [28100] = 
      {
         Layers = 0, 
         Description = "A sleak and deadly blaster lies on the ground here.", 
         ShortDescr = "A Noghri Blaster", 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "use_prog", 
               Arguments = "100", 
               Code = "mpechoat $n The power of this weapon flows into your soul.\
mpechoaround $n You wet yourself when $n wields a Noghri blaster\
", 
               ScriptType = "MProg", 
            }, 
         }, 
         ItemType = "trash", 
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
         Flags = 
         {
            [1] = "Hum", 
            [30] = "Prototype", 
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
         Vnum = 28100, 
         ActionDescription = "", 
         Tag = "", 
         Name = "SUPER noghri blaster thingy", 
      }, 
      [28120] = 
      {
         Layers = 8, 
         Description = "A hungry Morrt is crawling on the ground here.", 
         ShortDescr = "A large Morrt", 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "wear_prog", 
               Arguments = "100", 
               Code = "mpechoat $n The Morrt tears into your flesh.\
mpechoaround $n A morrt is tearing into $n's flash!!\
mpdamage $n 10\
", 
               ScriptType = "MProg", 
            }, 
            [2] = 
            {
               MudProgType = "remove_prog", 
               Arguments = "100", 
               Code = "mpechoat $n You rip a morrt from you neck.\
mpechoaround $n Blood runs down $n's neck.\
mpdamage $n 20\
", 
               ScriptType = "MProg", 
            }, 
            [3] = 
            {
               MudProgType = "damage_prog", 
               Arguments = "100", 
               Code = "mpechoat $n Your morrt gets injured and bites you harder. OUCH!!\
mpdamage $n 5\
mpechoaround $n $n's Morrt Screams in pain!\
", 
               ScriptType = "MProg", 
            }, 
         }, 
         ItemType = "armor", 
         Weight = 10, 
         Flags = 
         {
            [19] = "LargeSize", 
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
         Vnum = 28120, 
         ActionDescription = "", 
         Tag = "", 
         Name = "morrt", 
      }, 
      [28187] = 
      {
         Layers = 0, 
         Description = "A clan insignia is collecting dust on the ground here.", 
         ShortDescr = "mountain clan insignia", 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ItemType = "armor", 
         Weight = 1, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         Vnum = 28187, 
         ActionDescription = "", 
         Tag = "", 
         Name = "mountain clan insignia", 
      }, 
      [28188] = 
      {
         Layers = 128, 
         Description = "A helmet is lying on the ground attracting flies.", 
         ShortDescr = "a mountain clan helm", 
         WearFlags = 
         {
            [0] = "Take", 
            [4] = "Head", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ItemType = "armor", 
         Weight = 1, 
         Flags = 
         {
            [0] = "Glow", 
            [8] = "Bless", 
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
         Vnum = 28188, 
         ActionDescription = "", 
         Tag = "", 
         Name = "mountain clan helm helmet", 
      }, 
      [28189] = 
      {
         Layers = 0, 
         Description = "A very large battle axe gleams in the dirt.", 
         ShortDescr = "a Large battle axe", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 20000, 
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
         ItemType = "weapon", 
         Weight = 10, 
         Flags = 
         {
            [19] = "LargeSize", 
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
         Vnum = 28189, 
         ActionDescription = "", 
         Tag = "", 
         Name = "a Large battle axe", 
      }, 
      [28000] = 
      {
         Layers = 0, 
         Description = "Blite has dropped his colour contacts here.", 
         ShortDescr = "White contact lenses.", 
         WearFlags = 
         {
            [17] = "Eyes", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ItemType = "trash", 
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
         Vnum = 28000, 
         ActionDescription = "", 
         Tag = "", 
         Name = "white contacts blites", 
      }, 
      [28001] = 
      {
         Layers = 0, 
         Description = "A baby Gamorrean is lying here.", 
         ShortDescr = "A baby Gamorrean", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ItemType = "food", 
         Weight = 1, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "100", 
               Code = "mpecho The baby Gamorrean squeals loudly!\
", 
               ScriptType = "MProg", 
            }, 
            [2] = 
            {
               MudProgType = "use_prog", 
               Arguments = "100", 
               Code = "mpechoat $n The Gamorrean baby SCREAMS in terror as you swallow it whole\
mpechoaround $n The Gamorrean baby SCREAMS in shear terror as $n eats it!!!!\
", 
               ScriptType = "MProg", 
            }, 
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
         Vnum = 28001, 
         ActionDescription = "", 
         Tag = "", 
         Name = "baby gamorrean pig piglet piggy swine", 
      }, 
      [28002] = 
      {
         Layers = 0, 
         Description = "A Blue lightsaber glows here.", 
         ShortDescr = "A Blue lightsaber ", 
         WearFlags = 
         {
            [13] = "Wield", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ItemType = "weapon", 
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
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 6, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Vnum = 28002, 
         ActionDescription = "", 
         Tag = "", 
         Name = "A Blue Lightsaber", 
      }, 
      [28003] = 
      {
         Layers = 0, 
         Description = "A Small leather cap is lying here ", 
         ShortDescr = "A Small leather cap ", 
         Weight = 10, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 100, 
         ItemType = "armor", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Vnum = 28003, 
         ActionDescription = "", 
         Tag = "", 
         Name = "A Leather cap", 
      }, 
      [28004] = 
      {
         Layers = 0, 
         Description = "A heavy looking hammer lies on the ground.", 
         ShortDescr = "a war hammer", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 10000, 
         ItemType = "weapon", 
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
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 5, 
            [3] = 7, 
            [4] = 0, 
            [5] = 0, 
            [0] = 100, 
         }, 
         Vnum = 28004, 
         ActionDescription = "", 
         Tag = "", 
         Name = "war hammer", 
      }, 
      [28005] = 
      {
         Layers = 128, 
         Description = "A pair of boots lay crumpled on the ground.", 
         ShortDescr = "a pair of leather boots", 
         WearFlags = 
         {
            [0] = "Take", 
            [6] = "Feet", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 100, 
         ItemType = "armor", 
         Weight = 1, 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         Vnum = 28005, 
         ActionDescription = "", 
         Tag = "", 
         Name = "leather boots", 
      }, 
      [28006] = 
      {
         Layers = 128, 
         Description = "Someone has carelessly drop a wooden shield here.", 
         ShortDescr = "a large wooden shield", 
         WearFlags = 
         {
            [0] = "Take", 
            [9] = "Shield", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 100, 
         ItemType = "armor", 
         Weight = 5, 
         ObjectValues = 
         {
            [1] = 10, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         Vnum = 28006, 
         ActionDescription = "", 
         Tag = "", 
         Name = "large wooden shield", 
      }, 
      [28007] = 
      {
         Layers = 0, 
         Description = "A magnificent looking axe has been carlessly drop here.", 
         ShortDescr = "a war axe", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
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
         ItemType = "weapon", 
         Weight = 10, 
         Flags = 
         {
            [8] = "Bless", 
            [13] = "Inventory", 
            [0] = "Glow", 
            [19] = "LargeSize", 
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
         Vnum = 28007, 
         ActionDescription = "", 
         Tag = "", 
         Name = "war axe", 
      }, 
      [28008] = 
      {
         Layers = 4, 
         Description = "A small group of Morrts are here relaxing.", 
         ShortDescr = "15 morrts", 
         WearFlags = 
         {
            [0] = "Take", 
            [3] = "Body", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "wear_prog", 
               Arguments = "100", 
               Code = "mpechoat $n You cover you body with 15 Morrts.\
mpdamage $n 50\
mpechoaround $n $n covers $s body with Morrts!\
", 
               ScriptType = "MProg", 
            }, 
            [2] = 
            {
               MudProgType = "remove_prog", 
               Arguments = "100", 
               Code = "mpechoat $n You slowly remove the Morrts from you body.\
mpdamage $n 75\
mpechoaround $n $n slowly removes 15 morrts from $s body\
", 
               ScriptType = "MProg", 
            }, 
         }, 
         ItemType = "armor", 
         Weight = 5, 
         Flags = 
         {
            [19] = "LargeSize", 
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
         Vnum = 28008, 
         ActionDescription = "", 
         Tag = "", 
         Name = "morrts 15", 
      }, 
      [28009] = 
      {
         Layers = 8, 
         Description = "A large group of Morrts are huddled together here", 
         ShortDescr = "20 morrts", 
         WearFlags = 
         {
            [0] = "Take", 
            [3] = "Body", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ItemType = "armor", 
         Weight = 5, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "wear_prog", 
               Arguments = "100", 
               Code = "mpechoat $n You cover your body with 20 Morrts.\
mpdamage $n 80\
mpechoaround $n $n covers $s body with 20 Morrts!\
", 
               ScriptType = "MProg", 
            }, 
            [2] = 
            {
               MudProgType = "remove_prog", 
               Arguments = "100", 
               Code = "mpechoat $n You slowly remove the Morrts from your body.\
mpdamage $n 85\
mpechoaround $n $n  slowly remove 20 morrts $s body.\
", 
               ScriptType = "MProg", 
            }, 
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
         Vnum = 28009, 
         ActionDescription = "", 
         Tag = "", 
         Name = "morrts 20", 
      }, 
      [28010] = 
      {
         Layers = 12, 
         Description = "A bunch of Morrts lay huddled together", 
         ShortDescr = "25 Morrts", 
         WearFlags = 
         {
            [0] = "Take", 
            [3] = "Body", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "wear_prog", 
               Arguments = "100", 
               Code = "mpechoat $n You cover your body with 25 Morrts.\
mpdamage $n 250\
mpechoaround $n $n covers $s body with Morrts!\
", 
               ScriptType = "MProg", 
            }, 
            [2] = 
            {
               MudProgType = "remove_prog", 
               Arguments = "100", 
               Code = "mpechoat $n You slowly remove the morrts from you body.\
mpdamage $n 300\
mpechoaround $n $n slowly removes 25 morrts from $s body.\
mpechoaround $n You feel $s pain.\
", 
               ScriptType = "MProg", 
            }, 
         }, 
         ItemType = "armor", 
         Weight = 5, 
         Flags = 
         {
            [19] = "LargeSize", 
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
         Vnum = 28010, 
         ActionDescription = "", 
         Tag = "", 
         Name = "morrts 25", 
      }, 
      [28011] = 
      {
         Layers = 12, 
         Description = "A piece of fur is lying here collecting flies.", 
         ShortDescr = "Gurda skin", 
         WearFlags = 
         {
            [0] = "Take", 
            [11] = "Waist", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 10, 
         ItemType = "armor", 
         Weight = 2, 
         ObjectValues = 
         {
            [1] = 10, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         Vnum = 28011, 
         ActionDescription = "", 
         Tag = "", 
         Name = "skin", 
      }, 
      [28012] = 
      {
         Layers = 0, 
         Description = "A pike is lying in your way here.", 
         ShortDescr = "a pike", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ItemType = "weapon", 
         Weight = 1, 
         Flags = 
         {
            [19] = "LargeSize", 
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
         Vnum = 28012, 
         ActionDescription = "", 
         Tag = "", 
         Name = "pike", 
      }, 
      [28013] = 
      {
         Layers = 0, 
         Description = "An arm of a tourist", 
         ShortDescr = "An arm of a tourist", 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ItemType = "trash", 
         ObjectValues = 
         {
            [1] = 13, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 13, 
         }, 
         Vnum = 28013, 
         ActionDescription = "", 
         Tag = "", 
         Name = "arm limb", 
      }, 
      [28014] = 
      {
         Layers = 0, 
         Description = "&r a pool of blood&Y", 
         ShortDescr = "&r a pool of blood&Y", 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ItemType = "trash", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Vnum = 28014, 
         ActionDescription = "", 
         Tag = "", 
         Name = "blood", 
      }, 
      [28015] = 
      {
         Layers = 128, 
         Description = "Some clumsy Gamorrean has drop his helmet", 
         ShortDescr = "a metal helm", 
         WearFlags = 
         {
            [0] = "Take", 
            [4] = "Head", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 120, 
         ItemType = "armor", 
         Weight = 3, 
         Flags = 
         {
            [19] = "LargeSize", 
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
         Vnum = 28015, 
         ActionDescription = "", 
         Tag = "", 
         Name = "metal helmet gamorrean", 
      }, 
      [28016] = 
      {
         Layers = 0, 
         Description = "A pair of metal boots are attracting flies here.", 
         ShortDescr = "metal boots", 
         WearFlags = 
         {
            [0] = "Take", 
            [6] = "Feet", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 150, 
         ItemType = "armor", 
         Weight = 1, 
         Flags = 
         {
            [19] = "LargeSize", 
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
         Vnum = 28016, 
         ActionDescription = "", 
         Tag = "", 
         Name = "metal boots", 
      }, 
      [28017] = 
      {
         Layers = 64, 
         Description = "Some clumsy Gamorrean has drop his wrist guards here", 
         ShortDescr = "wrist guards", 
         WearFlags = 
         {
            [0] = "Take", 
            [12] = "Wrist", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 200, 
         ItemType = "armor", 
         Weight = 3, 
         Flags = 
         {
            [19] = "LargeSize", 
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
         Vnum = 28017, 
         ActionDescription = "", 
         Tag = "", 
         Name = "wrist guards", 
      }, 
      [28018] = 
      {
         Layers = 0, 
         Description = "An Imperial cargo ship has landed here.", 
         ShortDescr = "Imperial cargo ship", 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ItemType = "trash", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Vnum = 28018, 
         ActionDescription = "", 
         Tag = "", 
         Name = "imperial cargo cruiser", 
      }, 
      [28019] = 
      {
         Layers = 0, 
         Description = "A dirty, bright pink wig is being trampled by people here.", 
         ShortDescr = "a pink wig", 
         WearFlags = 
         {
            [0] = "Take", 
            [4] = "Head", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ItemType = "armor", 
         Weight = 1, 
         Flags = 
         {
            [19] = "LargeSize", 
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
         Vnum = 28019, 
         ActionDescription = "", 
         Tag = "", 
         Name = "pink wig", 
      }, 
      [28020] = 
      {
         Layers = 0, 
         Description = "A clumsy gamorrean has carlessly drop his axe here.", 
         ShortDescr = "a hand axe", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
            [14] = "Hold", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 100, 
         ItemType = "weapon", 
         Weight = 3, 
         ObjectValues = 
         {
            [1] = 4, 
            [2] = 3, 
            [3] = 3, 
            [4] = 0, 
            [5] = 0, 
            [0] = 12, 
         }, 
         Vnum = 28020, 
         ActionDescription = "", 
         Tag = "", 
         Name = "hand axe", 
      }, 
      [28021] = 
      {
         Layers = 0, 
         Description = "A large crate is here.", 
         ShortDescr = "a crate", 
         Weight = 100, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ItemType = "container", 
         ObjectValues = 
         {
            [1] = 1, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 500, 
         }, 
         Vnum = 28021, 
         ActionDescription = "", 
         Tag = "", 
         Name = "crate box", 
      }, 
      [28022] = 
      {
         Layers = 0, 
         Description = "An infant watch-beast is sitting here.", 
         ShortDescr = "an infant watch-beast", 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ItemType = "trash", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "get_prog", 
               Arguments = "100", 
               Code = "mpechoat $n An infant watch-beast claws at you!\
mpdamage $n 10\
mpechoaround $n An infant watch-beast claws at $n!\
mpforce $n put infant crate\
", 
               ScriptType = "MProg", 
            }, 
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
         Vnum = 28022, 
         ActionDescription = "", 
         Tag = "", 
         Name = "infant gamorrean watch beats", 
      }, 
      [28023] = 
      {
         Layers = 0, 
         Description = "The gamorrean cube ship Zicreex is parked here.", 
         ShortDescr = "The Gamorrean cube ship Zireex", 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ItemType = "spacecraft", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Vnum = 28023, 
         ActionDescription = "", 
         Tag = "", 
         Name = "ship cube zicreex", 
      }, 
      [28024] = 
      {
         Layers = 0, 
         Description = "Metal shoulder plates have been carelessly drop here.", 
         ShortDescr = "metal shoulder plates", 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ItemType = "armor", 
         Weight = 3, 
         Flags = 
         {
            [19] = "LargeSize", 
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
         Vnum = 28024, 
         ActionDescription = "", 
         Tag = "", 
         Name = "metal shoulder plates", 
      }, 
      [28025] = 
      {
         Layers = 0, 
         Description = "A vibro-axe vibro axe is here collecting dust.", 
         ShortDescr = "a vibro-axe", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 500, 
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
         ItemType = "weapon", 
         Weight = 10, 
         Flags = 
         {
            [4] = "Contraband", 
            [19] = "LargeSize", 
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
         Vnum = 28025, 
         ActionDescription = "", 
         Tag = "", 
         Name = "vibro axe", 
      }, 
      [28026] = 
      {
         Layers = 0, 
         Description = "The scraps of a ship lie here.", 
         ShortDescr = "scraps of a ship", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ItemType = "durasteel", 
         Weight = 1, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         Vnum = 28026, 
         ActionDescription = "", 
         Tag = "", 
         Name = "ship scraps", 
      }, 
      [28027] = 
      {
         Layers = 0, 
         Description = "A rather large mud hole.", 
         ShortDescr = "a mud hole", 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ItemType = "trash", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Vnum = 28027, 
         ActionDescription = "", 
         Tag = "", 
         Name = "mud hole", 
      }, 
      [28028] = 
      {
         Layers = 0, 
         Description = "A beautifuly crafted axe is on a pedestal here.", 
         ShortDescr = "a beautiful axe", 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ItemType = "government", 
         Flags = 
         {
            [0] = "Glow", 
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
         Vnum = 28028, 
         ActionDescription = "", 
         Tag = "", 
         Name = "cerimonial axe", 
      }, 
      [28029] = 
      {
         Layers = 0, 
         Description = "A fine shield is being displayed on a mantel.", 
         ShortDescr = "a cerimonial shield", 
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
         Vnum = 28029, 
         ActionDescription = "", 
         Tag = "", 
         Name = "cerimonial shield", 
      }, 
      [28030] = 
      {
         Layers = 0, 
         Description = "The sacred stone of the Mountains is here.", 
         ShortDescr = "a sacred stone", 
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
         Vnum = 28030, 
         ActionDescription = "", 
         Tag = "", 
         Name = "sacred stone", 
      }, 
      [28199] = 
      {
         Layers = 0, 
         Description = "Some god dropped a newly created chair here.", 
         ShortDescr = "a newly created chair", 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ItemType = "furniture", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Vnum = 28199, 
         ActionDescription = "", 
         Tag = "", 
         Name = "chair", 
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
         Last = 28199, 
         First = 28000, 
      }, 
      Mob = 
      {
         Last = 28139, 
         First = 28000, 
      }, 
      Room = 
      {
         Last = 28199, 
         First = 28000, 
      }, 
   }, 
   ResetMessage = "A warm breeze blows softly across your face.", 
   ResetFrequency = 0, 
   Resets = 
   {
      [1] = 
      {
         Arg3 = 28000, 
         Arg1 = 28001, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 41, 
      }, 
      [2] = 
      {
         Arg3 = 28000, 
         Arg1 = 28001, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 41, 
      }, 
      [3] = 
      {
         Arg3 = 28003, 
         Arg1 = 28015, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [4] = 
      {
         Arg3 = 28010, 
         Arg1 = 28010, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [5] = 
      {
         Arg3 = 16, 
         Arg1 = 28012, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [6] = 
      {
         Arg3 = 28014, 
         Arg1 = 28020, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [7] = 
      {
         Arg3 = 28015, 
         Arg1 = 28021, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [8] = 
      {
         Arg3 = 28016, 
         Arg1 = 28011, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [9] = 
      {
         Arg3 = 0, 
         Arg1 = 32253, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [10] = 
      {
         Arg3 = 28023, 
         Arg1 = 28003, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [11] = 
      {
         Arg3 = 28023, 
         Arg1 = 28013, 
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [12] = 
      {
         Arg3 = 28023, 
         Arg1 = 28014, 
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [13] = 
      {
         Arg3 = 28031, 
         Arg1 = 28006, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [14] = 
      {
         Arg3 = 28031, 
         Arg1 = 28001, 
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [15] = 
      {
         Arg3 = 28036, 
         Arg1 = 28027, 
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [16] = 
      {
         Arg3 = 28102, 
         Arg1 = 28000, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [17] = 
      {
         Arg3 = 0, 
         Arg1 = 28102, 
         Command = "D", 
         MiscData = 0, 
         Arg2 = 1, 
      }, 
      [18] = 
      {
         Arg3 = 28103, 
         Arg1 = 28013, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 10, 
      }, 
      [19] = 
      {
         Arg3 = 28103, 
         Arg1 = 28002, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 4, 
      }, 
      [20] = 
      {
         Arg3 = 28103, 
         Arg1 = 28001, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 41, 
      }, 
      [21] = 
      {
         Arg3 = 28103, 
         Arg1 = 28013, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 10, 
      }, 
      [22] = 
      {
         Arg3 = 28106, 
         Arg1 = 28001, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 41, 
      }, 
      [23] = 
      {
         Arg3 = 28107, 
         Arg1 = 28107, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [24] = 
      {
         Arg3 = 0, 
         Arg1 = 28003, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [25] = 
      {
         Arg3 = 0, 
         Arg1 = 28016, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [26] = 
      {
         Arg3 = 0, 
         Arg1 = 28015, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [27] = 
      {
         Arg3 = 0, 
         Arg1 = 28017, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [28] = 
      {
         Arg3 = 0, 
         Arg1 = 28011, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [29] = 
      {
         Arg3 = 28112, 
         Arg1 = 28002, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 4, 
      }, 
      [30] = 
      {
         Arg3 = 28113, 
         Arg1 = 28001, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 41, 
      }, 
      [31] = 
      {
         Arg3 = 28113, 
         Arg1 = 28002, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 4, 
      }, 
      [32] = 
      {
         Arg3 = 28114, 
         Arg1 = 28001, 
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [33] = 
      {
         Arg3 = 28116, 
         Arg1 = 28116, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [34] = 
      {
         Arg3 = 5, 
         Arg1 = 28008, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [35] = 
      {
         Arg3 = 6, 
         Arg1 = 28019, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [36] = 
      {
         Arg3 = 28117, 
         Arg1 = 28013, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 10, 
      }, 
      [37] = 
      {
         Arg3 = 28117, 
         Arg1 = 28013, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 10, 
      }, 
      [38] = 
      {
         Arg3 = 28117, 
         Arg1 = 28013, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 10, 
      }, 
      [39] = 
      {
         Arg3 = 28118, 
         Arg1 = 28002, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 4, 
      }, 
      [40] = 
      {
         Arg3 = 28121, 
         Arg1 = 28001, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 41, 
      }, 
      [41] = 
      {
         Arg3 = 28122, 
         Arg1 = 28005, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [42] = 
      {
         Arg3 = 16, 
         Arg1 = 28189, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [43] = 
      {
         Arg3 = 5, 
         Arg1 = 28010, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [44] = 
      {
         Arg3 = 6, 
         Arg1 = 28015, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [45] = 
      {
         Arg3 = 8, 
         Arg1 = 28016, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [46] = 
      {
         Arg3 = 14, 
         Arg1 = 28017, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [47] = 
      {
         Arg3 = 15, 
         Arg1 = 28017, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [48] = 
      {
         Arg3 = 13, 
         Arg1 = 28011, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [49] = 
      {
         Arg3 = 3, 
         Arg1 = 28024, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [50] = 
      {
         Arg3 = 4, 
         Arg1 = 28024, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [51] = 
      {
         Arg3 = 28122, 
         Arg1 = 28001, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 41, 
      }, 
      [52] = 
      {
         Arg3 = 28123, 
         Arg1 = 28013, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 10, 
      }, 
      [53] = 
      {
         Arg3 = 28124, 
         Arg1 = 28001, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 41, 
      }, 
      [54] = 
      {
         Arg3 = 28125, 
         Arg1 = 28013, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 10, 
      }, 
      [55] = 
      {
         Arg3 = 28130, 
         Arg1 = 28013, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 10, 
      }, 
      [56] = 
      {
         Arg3 = 28131, 
         Arg1 = 28013, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 10, 
      }, 
      [57] = 
      {
         Arg3 = 28131, 
         Arg1 = 28013, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 10, 
      }, 
      [58] = 
      {
         Arg3 = 28133, 
         Arg1 = 28001, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 41, 
      }, 
      [59] = 
      {
         Arg3 = 28145, 
         Arg1 = 28001, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 41, 
      }, 
      [60] = 
      {
         Arg3 = 28150, 
         Arg1 = 28001, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 41, 
      }, 
      [61] = 
      {
         Arg3 = 28150, 
         Arg1 = 28001, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 41, 
      }, 
      [62] = 
      {
         Arg3 = 28151, 
         Arg1 = 28001, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 41, 
      }, 
      [63] = 
      {
         Arg3 = 28151, 
         Arg1 = 28001, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 41, 
      }, 
      [64] = 
      {
         Arg3 = 28151, 
         Arg1 = 28001, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 41, 
      }, 
      [65] = 
      {
         Arg3 = 28151, 
         Arg1 = 28001, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 41, 
      }, 
      [66] = 
      {
         Arg3 = 28151, 
         Arg1 = 28001, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 41, 
      }, 
      [67] = 
      {
         Arg3 = 28151, 
         Arg1 = 28001, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 41, 
      }, 
      [68] = 
      {
         Arg3 = 28151, 
         Arg1 = 28001, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 41, 
      }, 
      [69] = 
      {
         Arg3 = 28151, 
         Arg1 = 28001, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 41, 
      }, 
      [70] = 
      {
         Arg3 = 28152, 
         Arg1 = 28001, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 41, 
      }, 
      [71] = 
      {
         Arg3 = 28154, 
         Arg1 = 28018, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [72] = 
      {
         Arg3 = 0, 
         Arg1 = 10313, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [73] = 
      {
         Arg3 = 0, 
         Arg1 = 25, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [74] = 
      {
         Arg3 = 0, 
         Arg1 = 10317, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [75] = 
      {
         Arg3 = 28155, 
         Arg1 = 28017, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [76] = 
      {
         Arg3 = 0, 
         Arg1 = 32253, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [77] = 
      {
         Arg3 = 0, 
         Arg1 = 10314, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [78] = 
      {
         Arg3 = 28156, 
         Arg1 = 28019, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [79] = 
      {
         Arg3 = 0, 
         Arg1 = 28020, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [80] = 
      {
         Arg3 = 0, 
         Arg1 = 28004, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [81] = 
      {
         Arg3 = 0, 
         Arg1 = 28006, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [82] = 
      {
         Arg3 = 28156, 
         Arg1 = 28001, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 41, 
      }, 
      [83] = 
      {
         Arg3 = 28156, 
         Arg1 = 28001, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 41, 
      }, 
      [84] = 
      {
         Arg3 = 28157, 
         Arg1 = 28001, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 41, 
      }, 
      [85] = 
      {
         Arg3 = 28158, 
         Arg1 = 28001, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 41, 
      }, 
      [86] = 
      {
         Arg3 = 28159, 
         Arg1 = 28023, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [87] = 
      {
         Arg3 = 28160, 
         Arg1 = 28001, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 41, 
      }, 
      [88] = 
      {
         Arg3 = 28160, 
         Arg1 = 28001, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 41, 
      }, 
      [89] = 
      {
         Arg3 = 28168, 
         Arg1 = 28004, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [90] = 
      {
         Arg3 = 28168, 
         Arg1 = 28007, 
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [91] = 
      {
         Arg3 = 28181, 
         Arg1 = 28012, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [92] = 
      {
         Arg3 = 6, 
         Arg1 = 28015, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [93] = 
      {
         Arg3 = 8, 
         Arg1 = 28016, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [94] = 
      {
         Arg3 = 14, 
         Arg1 = 28017, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [95] = 
      {
         Arg3 = 13, 
         Arg1 = 28011, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [96] = 
      {
         Arg3 = 15, 
         Arg1 = 28017, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [97] = 
      {
         Arg3 = 5, 
         Arg1 = 28009, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [98] = 
      {
         Arg3 = 3, 
         Arg1 = 28024, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [99] = 
      {
         Arg3 = 4, 
         Arg1 = 28024, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [100] = 
      {
         Arg3 = 16, 
         Arg1 = 28025, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [101] = 
      {
         Arg3 = 28183, 
         Arg1 = 28026, 
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [102] = 
      {
         Arg3 = 28186, 
         Arg1 = 28009, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [103] = 
      {
         Arg3 = 5, 
         Arg1 = 28008, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [104] = 
      {
         Arg3 = 13, 
         Arg1 = 28011, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [105] = 
      {
         Arg3 = 6, 
         Arg1 = 28015, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [106] = 
      {
         Arg3 = 8, 
         Arg1 = 28016, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [107] = 
      {
         Arg3 = 14, 
         Arg1 = 28017, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [108] = 
      {
         Arg3 = 3, 
         Arg1 = 28120, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [109] = 
      {
         Arg3 = 15, 
         Arg1 = 28017, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [110] = 
      {
         Arg3 = 16, 
         Arg1 = 28020, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [111] = 
      {
         Arg3 = 18, 
         Arg1 = 28020, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [112] = 
      {
         Arg3 = 28189, 
         Arg1 = 28001, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 41, 
      }, 
      [113] = 
      {
         Arg3 = 28191, 
         Arg1 = 28001, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 41, 
      }, 
      [114] = 
      {
         Arg3 = 28191, 
         Arg1 = 28001, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 41, 
      }, 
      [115] = 
      {
         Arg3 = 28193, 
         Arg1 = 28001, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 41, 
      }, 
      [116] = 
      {
         Arg3 = 28195, 
         Arg1 = 28001, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 41, 
      }, 
      [117] = 
      {
         Arg3 = 28196, 
         Arg1 = 28016, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [118] = 
      {
         Arg3 = 28196, 
         Arg1 = 28001, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 41, 
      }, 
      [119] = 
      {
         Arg3 = 28196, 
         Arg1 = 28001, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 41, 
      }, 
      [120] = 
      {
         Arg3 = 28196, 
         Arg1 = 28001, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 41, 
      }, 
      [121] = 
      {
         Arg3 = 28197, 
         Arg1 = 28001, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 41, 
      }, 
      [122] = 
      {
         Arg3 = 28197, 
         Arg1 = 28001, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 41, 
      }, 
      [123] = 
      {
         Arg3 = 28197, 
         Arg1 = 28014, 
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [124] = 
      {
         Arg3 = 28198, 
         Arg1 = 28001, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 41, 
      }, 
      [125] = 
      {
         Arg3 = 28198, 
         Arg1 = 28001, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 41, 
      }, 
      [126] = 
      {
         Arg3 = 28198, 
         Arg1 = 28001, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 41, 
      }, 
      [127] = 
      {
         Arg3 = 28198, 
         Arg1 = 28001, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 41, 
      }, 
      [128] = 
      {
         Arg3 = 28003, 
         Arg1 = 28025, 
         Command = "M", 
         MiscData = 0, 
         Arg2 = 30, 
      }, 
      [129] = 
      {
         Arg3 = 28128, 
         Arg1 = 28025, 
         Command = "M", 
         MiscData = 0, 
         Arg2 = 30, 
      }, 
      [130] = 
      {
         Arg3 = 28148, 
         Arg1 = 28025, 
         Command = "M", 
         MiscData = 0, 
         Arg2 = 30, 
      }, 
      [131] = 
      {
         Arg3 = 28038, 
         Arg1 = 28021, 
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [132] = 
      {
         Arg3 = 0, 
         Arg1 = 28022, 
         Command = "P", 
         MiscData = 0, 
         Arg2 = 1, 
      }, 
      [133] = 
      {
         Arg3 = 28038, 
         Arg1 = 28023, 
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
   }, 
   Author = "Thrawn", 
   Rooms = 
   {
      [28160] = 
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
               DestinationVnum = 28151, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28160, 
         Description = "This is a small hut. Its main purpose in life is to shealter the males\
from the rain or the harsh rays of the afternoon sun. The Hut is made\
from wood scavenged from the near by forest and held together with\
mud and clay. It is also stune with blankets and there is the odd\
hamock streched out from wall to post here and there. \
", 
         Tag = "", 
         Name = "A hut.", 
      }, 
      [28161] = 
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
               DestinationVnum = 28151, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28161, 
         Description = "This is a small hut. Its main purpose in life is to shealter the males\
from the rain or the harsh rays of the afternoon sun. The Hut is made\
from wood scavenged from the near by forest and held together with\
mud and clay. It is also stune with blankets and there is the odd\
hamock streched out from wall to post here and there. \
", 
         Tag = "", 
         Name = "A hut.", 
      }, 
      [28162] = 
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
               DestinationVnum = 28151, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28162, 
         Description = "This is a small hut. Its main purpose in life is to shealter the males\
from the rain or the harsh rays of the afternoon sun. The Hut is made\
from wood scavenged from the near by forest and held together with\
mud and clay. It is also stune with blankets and there is the odd\
hamock streched out from wall to post here and there. \
", 
         Tag = "", 
         Name = "A hut.", 
      }, 
      [28163] = 
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
               DestinationVnum = 28127, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 28164, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28163, 
         Description = "The Gamorrean deset stretches on for miles. It is hot and you start to\
sweat almost immediatly. You can see the odd cactus here and there,\
as well as  the odd corpino scurrying past you in search of some\
shade. The relentless sun beats down on you neck causeing you to\
start gasping for some water, it is a wonder how anything could\
possibly live in such a harsh enviornment, but then again the\
gamorreans are a harsh people.\
", 
         Tag = "", 
         Name = "Desert plains of Gamorr.", 
      }, 
      [28164] = 
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
               DestinationVnum = 28165, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 28163, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28164, 
         Description = "The Gamorrean deset stretches on for miles. It is hot and you start to\
sweat almost immediatly. You can see the odd cactus here and there,\
as well as  the odd corpino scurrying past you in search of some\
shade. The relentless sun beats down on you neck causeing you to\
start gasping for some water, it is a wonder how anything could\
possibly live in such a harsh enviornment, but then again the\
gamorreans are a harsh people. \
", 
         Tag = "", 
         Name = "Desert plains.", 
      }, 
      [28165] = 
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
               DestinationVnum = 28025, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 28164, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 28166, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28165, 
         Description = "The Gamorrean deset stretches on for miles. It is hot and you start to\
sweat almost immediatly. You can see the odd cactus here and there,\
as well as  the odd corpino scurrying past you in search of some\
shade. The relentless sun beats down on you neck causeing you to\
start gasping for some water, it is a wonder how anything could\
possibly live in such a harsh enviornment, but then again the\
gamorreans are a harsh people. \
", 
         Tag = "", 
         Name = "Desert path.", 
      }, 
      [28166] = 
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
               DestinationVnum = 28167, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 28165, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28166, 
         Description = "You are standing on what might have been, at one point, a very well\
put together walkway, but over time has eroded to a few stones the\
have with stood the test of time and seem to be on there last legs,\
since the elements here, at times, sand blast everything that stands\
and leaves it in a crumbling mass of useless rubble. The path turns\
and you notice ahead that it keeps twisting and turning. You aren't\
sure if it was made that way or if it was one time a large and\
straight path. \
", 
         Tag = "", 
         Name = "An eroding walkway.", 
      }, 
      [28167] = 
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
               DestinationVnum = 28166, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 28168, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28167, 
         Description = "You are standing on what might have been, at one point, a very well\
put together walkway, but over time has eroded to a few stones the\
have with stood the test of time and seem to be on there last legs,\
since the elements here, at times, sand blast everything that stands\
and leaves it in a crumbling mass of useless rubble. The path turns\
and you notice ahead that it keeps twisting and turning. You aren't\
sure if it was made that way or if it was one time a large and\
straight path. \
", 
         Tag = "", 
         Name = "More of the eroding walkway.", 
      }, 
      [28168] = 
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
               DestinationVnum = 28167, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 28169, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28168, 
         Description = "You are standing on what might have been, at one point, a very well\
put together walkway, but over time has eroded to a few stones the\
have with stood the test of time and seem to be on there last legs,\
since the elements here, at times, sand blast everything that stands\
and leaves it in a crumbling mass of useless rubble. The path turns\
and you notice ahead that it keeps twisting and turning. You aren't\
sure if it was made that way or if it was one time a large and\
straight path. \
", 
         Tag = "", 
         Name = "End of the walkway.", 
      }, 
      [28169] = 
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
               DestinationVnum = 28168, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28169, 
         Description = "You stand in front of an old entrance, once you look through it you\
see nothing but more desert and the odd post of what might have been\
at one time an old house. You come to the conclusion that this at one\
point was the plains area abut has now been over taken by the\
constant shifting sands of the relentless desert. In due time all teh\
plains will be just like this barren and devoid of semi intellegent\
life... \
", 
         Tag = "", 
         Name = "Entrance to the Desert town.", 
      }, 
      [28170] = 
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
               Code = "mpechoat $n The soothing mud eases your pain.\
feel heal $n\
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
               Flags = 
               {
                  [18] = "CanLeave", 
                  [11] = "Hidden", 
               }, 
               Key = -1, 
               Direction = "somewhere", 
               DestinationVnum = 28036, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28170, 
         Description = "The mud bubbles and gurggles all around you, the bubbles tickling you as\
they rise to the top. The mud is very refreshing to your aches and pains\
and seems  to ease all the sores you have accumulated from your travels.\
The only problem is, There are other gamorreans here with you and you\
don't know if the bubbles are from the underground or from them, and the\
slight smell is starting to make you wonder. \
", 
         Tag = "", 
         Name = "Mud Hole", 
      }, 
      [28171] = 
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
         }, 
         Vnum = 28171, 
         Description = "", 
         Tag = "", 
         Name = "floating in the void", 
      }, 
      [28172] = 
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
         }, 
         Vnum = 28172, 
         Description = "", 
         Tag = "", 
         Name = "floating in the void", 
      }, 
      [28173] = 
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
         }, 
         Vnum = 28173, 
         Description = "", 
         Tag = "", 
         Name = "floating in the void", 
      }, 
      [28174] = 
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
         }, 
         Vnum = 28174, 
         Description = "", 
         Tag = "", 
         Name = "floating in the void", 
      }, 
      [28175] = 
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
         }, 
         Vnum = 28175, 
         Description = "", 
         Tag = "", 
         Name = "floating in the void", 
      }, 
      [28176] = 
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
         }, 
         Vnum = 28176, 
         Description = "", 
         Tag = "", 
         Name = "floating in the void", 
      }, 
      [28177] = 
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
         }, 
         Vnum = 28177, 
         Description = "", 
         Tag = "", 
         Name = "floating in the void", 
      }, 
      [28178] = 
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
         }, 
         Vnum = 28178, 
         Description = "", 
         Tag = "", 
         Name = "floating in the void", 
      }, 
      [28179] = 
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
         }, 
         Vnum = 28179, 
         Description = "", 
         Tag = "", 
         Name = "floating in the void", 
      }, 
      [28180] = 
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
         }, 
         Vnum = 28180, 
         Description = "", 
         Tag = "", 
         Name = "floating in the void", 
      }, 
      [28181] = 
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
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 28183, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 28182, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [11] = "Hidden", 
               }, 
               Key = -1, 
               Direction = "somewhere", 
               DestinationVnum = 28038, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28181, 
         Description = "You are standing in the infamous Zicreex. Which is owned by Ugmush and\
it has a slight stench to it, could possible be from her husbands as\
well as the other ship men she has to maintain can help pilot her\
beloved ship. It isn't exactlly the best of ships but how often do\
you get to sit in a Gamorrean Cube ship?\
", 
         Tag = "", 
         Name = "Inside the Zicreex", 
      }, 
      [28182] = 
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
               DestinationVnum = 28181, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28182, 
         Description = "This is the cockpit of the Zicreex. it isn't as bad as it seems to be\
from outside appearences, it does get its passengers from a to b with\
very little problems. The lights on the controls blink on and off and\
you here some bits and pieces of communication going back and forth\
over the comm system.\
", 
         Tag = "", 
         Name = "Cockpit", 
      }, 
      [28183] = 
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
               Direction = "west", 
               DestinationVnum = 28181, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28183, 
         Description = "This is where the crew put all its scavenge good the score from debris\
the find floating around in space, mostly from destroyed ships and\
such. There are bits and pieces of useless scraps cluttering the\
floor here.\
", 
         Tag = "", 
         Name = "Large storage compartment", 
      }, 
      [28184] = 
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
         }, 
         Vnum = 28184, 
         Description = "", 
         Tag = "", 
         Name = "floating in the void", 
      }, 
      [28185] = 
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
         }, 
         Vnum = 28185, 
         Description = "", 
         Tag = "", 
         Name = "floating in the void", 
      }, 
      [28186] = 
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
               DestinationVnum = 28187, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "northeast", 
               DestinationVnum = 28110, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28186, 
         Description = "This Path is almost impossible to notice due to the lack of traffic\
flowing to the mountains. You sit and wonder why the Gammoreans\
wouldn'y use the path and come to the conclusion that maybe there is\
another clan up in the mountains and this might not be the season for\
the wars in fact as you look up the path you notice there is some\
spires of smoke rising from what you think could be home fires\
burning.\
", 
         Tag = "", 
         Name = "Pathway to the Mountains", 
      }, 
      [28187] = 
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
               Direction = "south", 
               DestinationVnum = 28186, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 28188, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28187, 
         Description = "The trail is scattered with pebbels and bits of grass and wild\
flowers, you also see insects scurrying out of you way as well as the\
odd foot print leading up to what seems to be a mountain village. As\
you keep ascending the mountain the smells and sounds of village\
living gets stronger and stronger ecspecially the smells peewww it\
stinks. but you plug you nose and stick to the trail and keep\
climbing.\
", 
         Tag = "", 
         Name = "Mountain trail.", 
      }, 
      [28188] = 
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
               Direction = "up", 
               DestinationVnum = 28189, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 28187, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28188, 
         Description = "The trail is scattered with pebbels and bits of grass and wild\
flowers, you also see insects scurrying out of you way as well as the\
odd foot print leading up to what seems to be a mountain village. As\
you keep ascending the mountain the smells and sounds of village\
living gets stronger and stronger ecspecially the smells peewww it\
stinks. but you plug you nose and stick to the trail and keep\
climbing.\
", 
         Tag = "", 
         Name = "Steep path.", 
      }, 
      [28189] = 
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
               DestinationVnum = 28190, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 28191, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 28188, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28189, 
         Description = "You can see for miles when you look over the ledge. In the distance\
you can see lush rain forests, further south you see a vast desert as\
well as the Huntbird in the village below While you were admiring the\
view, You completly forgot to check the stability of the ledge and it\
doesn't look to strong, you can notice a huge crack about three feet\
behind you where the ledge looks like it is about to colapse. Maybe\
you should get to safer ground.\
", 
         Tag = "", 
         Name = "Cliff Ledge", 
      }, 
      [28190] = 
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
            [1] = "_Reserved", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 28189, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28190, 
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
         Tag = "", 
         Name = "Weak Cliff Lip", 
      }, 
      [28191] = 
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
               DestinationVnum = 28189, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 28192, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28191, 
         Description = "You can see alomost the whole planet from here, it looks great. You\
have a cool breeze blowing past you face making you feel refreshed\
after that long climb you can here what sounds like gamorreans\
getting ready to do something, you have no idea what, but it sounds\
very important or dangerous the way they sound. \
", 
         Tag = "", 
         Name = "Cliff Ledge", 
      }, 
      [28192] = 
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
               DestinationVnum = 28193, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 28191, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28192, 
         Description = "You can see alomost the whole planet from here, it looks great. You\
have a cool breeze blowing past you face making you feel refreshed\
after that long climb you can here what sounds like gamorreans\
getting ready to do something, you have no idea what, but it sounds\
very important or dangerous the way they sound. \
", 
         Tag = "", 
         Name = "Cliff Ledge", 
      }, 
      [28193] = 
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
               DestinationVnum = 28194, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 28192, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28193, 
         Description = "Now you can see where all the noise was comeing from. The mountain\
clan seems to be in a bit of a tizzy, something seems to have come\
into their area, and they don't seem to be happy about it, some even\
look afraid at what has invaded their homes, and it seems to be\
around the mine shaft that is in the center of  the village .\
", 
         Tag = "", 
         Name = "Mountain Pathway", 
      }, 
      [28194] = 
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
               DestinationVnum = 28195, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 28193, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28194, 
         Description = "You are standing in the entrance and no gamorrean seems to have\
noticed you, They are far to busy trying to rid themselve of this\
small problem that it has left them open to unwanted visitors. From\
the mine shaft in the ground you hear a viscious groweling and it\
doesn't sound to pleasent to teh ears. You have heard of the Gurdas\
that have been known to snatch the odd child from its cribs and now\
it seems you are gonna witness one from a distance.\
", 
         Tag = "", 
         Name = "Entrance to the Mountain Clan", 
      }, 
      [28195] = 
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
               DestinationVnum = 28198, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 28194, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 28196, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28195, 
         Description = "The village is in chaos, there seems to be only one gamorrean with his\
thoughts straight and the is the shammon to the south. The groweling\
is still very  loud and promenent as still very viscious. Hear the\
scream of a child as it sound as if it has been captured by a gurda.\
You think and hope to yourself  that they dont hunt in packs cause\
then this place could be surrounded by them.  the thought sends\
shivers up and down you spine..\
", 
         Tag = "", 
         Name = "Path in the Clan Village", 
      }, 
      [28196] = 
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
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 28195, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28196, 
         Description = "This is the home to the Gamorreans only known shammon, he has his\
place in good order for a Gamorrean, and the smell isn't as bad as\
you had the pleaseue of smelling in the main village. The Shammon has\
an assortment of small trinkets lying around his abode everything\
from small and large gems to the odd credit and you think you see a\
hilt of some sort but, that would not be a surprise even for a\
Gamorrean of his age.\
", 
         Tag = "", 
         Name = "Small Cave Entrance", 
      }, 
      [28197] = 
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
               Direction = "up", 
               DestinationVnum = 28198, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28197, 
         Description = "", 
         Tag = "", 
         Name = "Large Cave Entrance", 
      }, 
      [28198] = 
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
               DestinationVnum = 28199, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 28195, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 28197, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28198, 
         Description = "The chaos and the groweling is getting worse as time goes on, you see\
of blood comeing from the cave and going north and you also see a\
babies little booty in the trail, seems like the panic has its\
reasons, something has got a baby and it is most likely a gurda that\
has it too. The mother is standing here screaming for her babies safe\
return, she's looking at you as if you might be the only one who can\
do it.\
", 
         Tag = "", 
         Name = "Mountain Path", 
      }, 
      [28199] = 
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
               DestinationVnum = 28000, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 28198, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28199, 
         Description = "You walk along a mountain pass there are steep ledges all around you.\
The path you are on seems sturdy though if not carefull you could get\
harmed. There are some large boulders around the path that could\
start a cool rock slide at anytime. Birds are cherping in the\
distance and there are soem other animals making noise around you.\
", 
         Tag = "", 
         Name = "Mountain Path", 
      }, 
      [28000] = 
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
               DestinationVnum = 28001, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 28199, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28000, 
         Description = "You walk along a mountain pass there are steep ledges all around you. The path \
you are on seems sturdy though if not carefull you could get harmed. There are \
some large boulders around the path that could start a cool rock slide at\
anytime. Birds are cherping in the distance and there are soem other animals\
making noise around you.\
", 
         Tag = "", 
         Name = "Mountain Path", 
      }, 
      [28001] = 
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
               DestinationVnum = 28000, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 28002, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 28004, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28001, 
         Description = "You have finaly reached the center of the chaos, everyone is holding\
spears and wielding axes and looking down what looks to be an\
abandoned mine, the source of the growling and the squeals of an\
injured and scared baby. The sounds pull on your hart and a tear\
trickles down you cheeck as you feel the urge to help the baby and\
destroy the evil gurda that has absolutly no care for the child.\
", 
         Tag = "", 
         Name = "Mountain Path", 
      }, 
      [28002] = 
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
               Direction = "up", 
               DestinationVnum = 28003, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 28001, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28002, 
         Description = "You Stand in front of a rather large cave that the Alpha female has\
designated as her own, It is really big, it reminds you of a black\
hole. When the wind blows past the opening it makes a rather eriy\
howl that make your skin crawl with fear for some strange reason.\
Strangly though, no one is around here, they all seem to be\
preoccupied with the gurda and the baby, leaveing the large cave\
defenseless.\
", 
         Tag = "", 
         Name = "Steep Trail", 
      }, 
      [28003] = 
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
               Direction = "down", 
               DestinationVnum = 28002, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28003, 
         Description = "This is the cave of the mountain clans matron. It seems to be a little\
messed up, there is what looks like would be the nest of a gurda on\
the floor, could it be the she owns the gurda?, it would make sense\
since only the matron is allowd to have childern and no other female\
can because the would defeat the purpose of haveing the social\
structure the gamorreans have adopted as their own. You come to the\
conclusion that the matron sent the gurda after the other females\
child, to kill t or to bring it back, only the matron knows.\
", 
         Tag = "", 
         Name = "Alpha-Cave", 
      }, 
      [28004] = 
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
               Direction = "up", 
               DestinationVnum = 28001, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Flags = 
               {
                  [16] = "CanClimb", 
               }, 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 28005, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28004, 
         Description = "There is a very weak wooden ledge here, it doesn't look as if it is\
able to support the weight of anything your size. The boards start to\
groan under your feet and you start to here them snap and crack,\
splinters of wood start to fly through the air and you here a snap as\
they give way\
", 
         Tag = "", 
         Name = "Mine Shaft", 
      }, 
      [28005] = 
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
            [0] = "Dark", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 28031, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 28004, 
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
               Direction = "down", 
               DestinationVnum = 28006, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28005, 
         Description = "There is a very weak wooden ledge here, it doesn't look as if it is\
able to support the weight of anything your size. The boards start to\
groan under your feet and you start to here them snap and crack,\
splinters of wood start to fly through the air and you here a snap as\
they give way\
", 
         Tag = "", 
         Name = "Mine Shaft", 
      }, 
      [28006] = 
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
            [0] = "Dark", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 28032, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 28005, 
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
               Direction = "down", 
               DestinationVnum = 28007, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28006, 
         Description = "There is a very weak wooden ledge here, it doesn't look as if it is\
able to support the weight of anything your size. The boards start to\
groan under your feet and you start to here them snap and crack,\
splinters of wood start to fly through the air and you here a snap as\
they give way\
", 
         Tag = "", 
         Name = "Mine Shaft", 
      }, 
      [28007] = 
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
            [0] = "Dark", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 28033, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 28006, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28007, 
         Description = "", 
         Tag = "", 
         Name = "Bottom of the Shaft.", 
      }, 
      [28008] = 
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
            [10] = "Safe", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 28100, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 28009, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28008, 
         Description = "You are standing in the Gamorr safe house. Far to the south\
you can here the loud chatter of fellow visitors and natives\
takeing time out and haveing some refreshments to easy the \
pressure of everyday life.\
", 
         Tag = "", 
         Name = "Entrance to a Corridor.", 
      }, 
      [28009] = 
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
            [10] = "Safe", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 28008, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 28010, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28009, 
         Description = "This is one long and straight corridor, its very well kept\
and from the sounds of it, very peaceful meaning no sounds \
of fighting what so ever. This is good new, cause now you\
can really sit back and relax.\
", 
         Tag = "", 
         Name = "Long corridor.", 
      }, 
      [28010] = 
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
            [10] = "Safe", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 28009, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 28011, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28010, 
         Description = "This is one long and straight corridor, its very well kept\
and from the sounds of it, very peaceful meaning no sounds \
of fighting what so ever. This is good new, cause now you\
can really sit back and relax.\
", 
         Tag = "", 
         Name = "Long corridor.", 
      }, 
      [28011] = 
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
            [10] = "Safe", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 28010, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 28038, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 28015, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 28012, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28011, 
         Description = "The lounge is very nicely built. It is very large, with tables\
spread in a nice orderly fashion. The tabels themselves are \
quite a sight to see, they are all supported by large beams of\
dark blue light which comes from the floor and into the ceiling.\
There is a refreshments stand that stands in the middle of the\
whole area.\
", 
         Tag = "", 
         Name = "Lounge area", 
      }, 
      [28012] = 
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
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 28013, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 28011, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 28016, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28012, 
         Description = "The lounge has a very relaxed atmosphere, with soft music playing\
and quiet conversations going on here and there. You stand here\
waiting for a waitress, and during this time you take a look\
at some of the patrons here, and notice that they seem to be very\
friendly people, all have smiles and are very relaxed you too\
decide its time to have a drink and a rest.\
", 
         Tag = "", 
         Name = "Lounge area", 
      }, 
      [28013] = 
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
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 28014, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 28012, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 28016, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28013, 
         Description = "The lounge has a very relaxed atmosphere, with soft music playing\
and quiet conversations going on here and there. You stand here\
waiting for a waitress, and during this time you take a look\
at some of the patrons here, and notice that they seem to be very\
friendly people, all have smiles and are very relaxed you too\
decide its time to have a drink and a rest.\
", 
         Tag = "", 
         Name = "Lounge area", 
      }, 
      [28014] = 
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
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 28016, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 28015, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 28013, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28014, 
         Description = "The lounge has a very relaxed atmosphere, with soft music playing\
and quiet conversations going on here and there. You stand here\
waiting for a waitress, and during this time you take a look\
at some of the patrons here, and notice that they seem to be very\
friendly people, all have smiles and are very relaxed you too\
decide its time to have a drink and a rest.\
", 
         Tag = "", 
         Name = "Lounge area", 
      }, 
      [28015] = 
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
               Direction = "north", 
               DestinationVnum = 28011, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 28016, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 28014, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28015, 
         Description = "The lounge has a very relaxed atmosphere, with soft music playing\
and quiet conversations going on here and there. You stand here\
waiting for a waitress, and during this time you take a look\
at some of the patrons here, and notice that they seem to be very\
friendly people, all have smiles and are very relaxed you too\
decide its time to have a drink and a rest.\
", 
         Tag = "", 
         Name = "Lounge area", 
      }, 
      [28016] = 
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
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 28012, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 28013, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 28014, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 28015, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28016, 
         Description = "This is a nicely put together stand, as far as stands go, because\
it is made from a rare wood not found anywhere on this planet\
and it has been very well cut aswell as the designs cut into it\
make it seem as though it has a little story scrolling across its \
edge. The stand has a nice odour to it, due to the variety of drinks\
and snacks that are being sold to its patrons.\
", 
         Tag = "", 
         Name = "Refreshments Stand.", 
      }, 
      [28017] = 
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
               DestinationVnum = 28018, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 28120, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28017, 
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
         Tag = "", 
         Name = "Deep in the Forest.", 
      }, 
      [28018] = 
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
               Direction = "west", 
               DestinationVnum = 28017, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "northwest", 
               DestinationVnum = 28019, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28018, 
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
         Tag = "", 
         Name = "The Darkend Forest.", 
      }, 
      [28019] = 
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
               DestinationVnum = 28036, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 28020, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "southeast", 
               DestinationVnum = 28018, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28019, 
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
         Tag = "", 
         Name = "Uncharted Forest area.", 
      }, 
      [28020] = 
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
               Direction = "west", 
               DestinationVnum = 28019, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 28021, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28020, 
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
         Tag = "", 
         Name = "Forest Ravine", 
      }, 
      [28021] = 
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
               Direction = "up", 
               DestinationVnum = 28020, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28021, 
         Description = "", 
         Tag = "", 
         Name = "Sudden Drop off.", 
      }, 
      [28022] = 
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
               DestinationVnum = 28137, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 28023, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "northwest", 
               DestinationVnum = 28036, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28022, 
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
         Tag = "", 
         Name = "Deep in the forest.", 
      }, 
      [28023] = 
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
               Direction = "west", 
               DestinationVnum = 28022, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 28024, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28023, 
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
         Tag = "", 
         Name = "Near the Edge of a Ravine", 
      }, 
      [28024] = 
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
               Direction = "up", 
               DestinationVnum = 28023, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28024, 
         Description = "", 
         Tag = "", 
         Name = "Sudden Drop.", 
      }, 
      [28025] = 
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
               DestinationVnum = 28165, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "northeast", 
               DestinationVnum = 28026, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28025, 
         Description = "The Gamorrean deset stretches on for miles. It is hot and you start to\
sweat almost immediatly. You can see the odd cactus here and there,\
as well as  the odd corpino scurrying past you in search of some\
shade. The relentless sun beats down on you neck causeing you to\
start gasping for some water, it is a wonder how anything could\
possibly live in such a harsh enviornment, but then again the\
gamorreans are a harsh people. \
", 
         Tag = "", 
         Name = "The Desert.", 
      }, 
      [28026] = 
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
               DestinationVnum = 28027, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 28028, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "southwest", 
               DestinationVnum = 28025, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28026, 
         Description = "The Gamorrean deset stretches on for miles. It is hot and you start to\
sweat almost immediatly. You can see the odd cactus here and there,\
as well as  the odd corpino scurrying past you in search of some\
shade. The relentless sun beats down on you neck causeing you to\
start gasping for some water, it is a wonder how anything could\
possibly live in such a harsh enviornment, but then again the\
gamorreans are a harsh people.\
", 
         Tag = "", 
         Name = "Deep in the Gamorr Desert.", 
      }, 
      [28027] = 
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
            [1] = "_Reserved", 
            [2] = "NoMob", 
         }, 
         Exits = 
         {
         }, 
         Vnum = 28027, 
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
         Tag = "", 
         Name = "Lost in The Deserts of Gamorr.", 
      }, 
      [28028] = 
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
               DestinationVnum = 28029, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 28030, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 28026, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28028, 
         Description = "You are standing in the infamous land of no return. It would be in\
your best interests to turn back now, it has earned its name and has\
never give up any of its helpless wonderers, and anyone who dares to\
enter find out fast how deadly the sink holes can be and even the\
desert creatures seem to be avoiding this area it would be a good\
idea if you followed their example. \
", 
         Tag = "", 
         Name = "The Land of no Return.", 
      }, 
      [28029] = 
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
            [24] = "NoFloor", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 28028, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 28131, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28029, 
         Description = "You are standing on the soft sands of the land of no return. The gound\
seems to open up  right under you and you start to slowly sink down.\
You try to grasp for something  but there is nothing to hold except\
for the sand itself. You life flashes before your eyes. the sand is\
now up to your neck, it slowly move to your chin and eventually your\
mouth where you ingest a mouthful. You try to gasp for breath but\
fill you lungs with the hot sands.\
", 
         Tag = "", 
         Name = "A SINK HOLE!!", 
      }, 
      [28030] = 
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
               DestinationVnum = 28028, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28030, 
         Description = "You are standing in the infamous land of no return. It would be in\
your best interests to turn back now, it has earned its name and has\
never give up any of its helpless wonderers, and anyone who dares to\
enter find out fast how deadly the sink holes can be and even the\
desert creatures seem to be avoiding this area it would be a good\
idea if you followed their example. \
", 
         Tag = "", 
         Name = "Sands of the soft Sink Holes.", 
      }, 
      [28031] = 
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
               DestinationVnum = 28005, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28031, 
         Description = "The tunnel end abruptly, and the stench from the gurda has filled the\
tunnel with a mind numbing sickening smell that makes you wanna blow\
chunks everywhere, to think that the gamorreans wear the gurdas skin as a\
prize, The tunnel itself is realy to dark to make heads or tails of what\
might be on the walls, from what you can tell  its just cuts made from the\
tools of mining.\
", 
         Tag = "", 
         Name = "Mine Tunnel", 
      }, 
      [28032] = 
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
            [0] = "Dark", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 28006, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28032, 
         Description = "The tunnel end abruptly, and the stench from the gurda has filled the\
tunnel with a mind numbing sickening smell that makes you wanna blow\
chunks everywhere, to think that the gamorreans wear the gurdas skin as a\
prize, The tunnel itself is realy to dark to make heads or tails of what\
might be on the walls, from what you can tell  its just cuts made from the\
tools of mining.\
", 
         Tag = "", 
         Name = "Short tunnel.", 
      }, 
      [28033] = 
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
            [0] = "Dark", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 28034, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 28007, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28033, 
         Description = "", 
         Tag = "", 
         Name = "Long tunnel.", 
      }, 
      [28034] = 
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
            [0] = "Dark", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 28035, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 28033, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28034, 
         Description = "", 
         Tag = "", 
         Name = "More of the Tunnel.", 
      }, 
      [28035] = 
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
            [0] = "Dark", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 28034, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28035, 
         Description = "", 
         Tag = "", 
         Name = "End of the Tunnel.", 
      }, 
      [28036] = 
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
            [10] = "Safe", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 28019, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Flags = 
               {
                  [17] = "CanEnter", 
                  [11] = "Hidden", 
               }, 
               Key = -1, 
               Direction = "somewhere", 
               DestinationVnum = 28170, 
               Keyword = "mud hole", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28036, 
         Description = "The small clearing has a rather large mudhole in it that the gamorreans\
have classified as the sacred land, where no fighting can take place. They\
come here to relax and heal there sore and swollen muscles after a hard\
days battle. The place smells like a sewer on coruscant, but it does look\
inviting.\
", 
         Tag = "", 
         Name = "Small Clearing.", 
      }, 
      [28037] = 
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
         }, 
         Vnum = 28037, 
         Description = "", 
         Tag = "", 
         Name = "Large Mud Hole.", 
      }, 
      [28038] = 
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
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 28011, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Flags = 
               {
                  [17] = "CanEnter", 
                  [11] = "Hidden", 
               }, 
               Key = -1, 
               Direction = "somewhere", 
               DestinationVnum = 28181, 
               Keyword = "ship zicreex", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28038, 
         Description = "The landing area is rather large, it looks as though it can hold and\
Imperial Star Destroyer, but how often do you see that. The area has\
the odd small cargo ship parked here and there as well as one or two\
stock light freighters loading and unloading so stuff you don't want\
to get involved with. You even see a ship loading a couple of infant\
Gamorrean watch-beasts with extream caution\
", 
         Tag = "gamorr_landing", 
         Name = "Landing Area", 
      }, 
      [28054] = 
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
         }, 
         Vnum = 28054, 
         Description = "", 
         Tag = "", 
         Name = "Floating in a void", 
      }, 
      [28100] = 
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
            [10] = "Safe", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 28103, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 28008, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 28101, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28100, 
         Description = "You stand in the entrance to the Wreckage of the Huntbird\
Its is a rather large hunk of junk that even thought its\
real old it seems to be holding up to the elements of the \
planet and has not rusted through. In here you will find\
all the comforts you will need to get rested and or hide\
from aggressive natives or evil visitor that might want\
to do you some harm, don't worry your safe here.\
", 
         Tag = "", 
         Name = "The Huntbird.", 
      }, 
      [28101] = 
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
            [10] = "Safe", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 28102, 
               Keyword = "door", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 28100, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28101, 
         Description = "The Upperdeck of the wreck is, well, boring, the walls are empty\
except for the dust the is creatively decorated with finger \
prints and writting simply stateing \"WASH ME!\" other then \
that this is one barren place.\
", 
         Tag = "", 
         Name = "Upperdeck of the Huntbird.", 
      }, 
      [28102] = 
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
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 28101, 
               Keyword = "door", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28102, 
         Description = "Through the cockpit window, you can see for miles, well you\
would be able to if that mountain wasn't in the way! But it \
looks to be a very beautiful planet with lush vegitation\
a desert in the distance and an old man sitting on the floor \
watching everything you do with hauntingly knowing eyes.\
", 
         Tag = "", 
         Name = "Cockpit.", 
      }, 
      [28103] = 
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
               DestinationVnum = 28108, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 28104, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 28100, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 28107, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28103, 
         Description = "You wonder through the village streets wondering where to go\
the sight here are very pleasant to thte eye, well it would be\
if the Gamorreans would stop fighting to keep the places looking \
helf descent, but other then that the sights here are very \
pleaseing to the eye. The street carries on to the north, east\
and west or you can go south back to the Huntbird.\
", 
         Tag = "", 
         Name = "Village Street.", 
      }, 
      [28104] = 
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
               DestinationVnum = 28105, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 28121, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 28103, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28104, 
         Description = "You wonder through the village streets wondering where to go the sight\
here are very pleasant to thte eye, well it would be if the\
Gamorreans would stop fighting to keep the places looking  helf\
descent, but other then that the sights here are very  pleaseing to\
the eye. The street carries on the the south and back to the west, to\
the north is a gamorrean house.\
", 
         Tag = "", 
         Name = "Village street.", 
      }, 
      [28105] = 
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
               DestinationVnum = 28106, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 28104, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28105, 
         Description = "", 
         Tag = "", 
         Name = "Gamorrean House Hold.", 
      }, 
      [28106] = 
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
               Direction = "west", 
               DestinationVnum = 28105, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28106, 
         Description = "", 
         Tag = "", 
         Name = "Backroom.", 
      }, 
      [28107] = 
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
            [7] = "NoMagic", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 28103, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28107, 
         Description = "You are standing in the the Black smith and leather work shop of the\
village. The smell of burning metals and drying hides fills the air\
in a sickening mixture of sents. There is the shop owner standing\
in the corner of the smithy looking over at some of the things she\
crafted.\
", 
         Tag = "", 
         Name = "Black Smithy and Leather Workshop.", 
      }, 
      [28108] = 
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
               DestinationVnum = 28109, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 28112, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 28103, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 28111, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28108, 
         Description = "Wondering through the street, the strong smell of the male half of\
the Gamorrean race hits your nose like a ton of bricks. It is a \
very strong smell of urine as well as some other stench you really\
aren't to interested in finding out its origins. The street travels\
east, west and north as well as the way you came.\
", 
         Tag = "", 
         Name = "Village Street.", 
      }, 
      [28109] = 
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
               DestinationVnum = 28110, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 28108, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28109, 
         Description = "The smell from the house you just past still makes your eyes burn,\
The street keeps going north and south but up ahead you notice it\
bend to the southwest. You are unable to see past that distance\
due to the houses and huts blocking your view. You just hope where\
ever this road leads you its to a place that smells better then this\
this village, then again nothing could smell worse then this.\
", 
         Tag = "", 
         Name = "Village Street.", 
      }, 
      [28110] = 
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
               DestinationVnum = 28109, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "southwest", 
               DestinationVnum = 28186, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28110, 
         Description = "The street doesn't appear to be well used. There are no surounding\
houses or huts that you can see. The area looks to have been abandond\
for some reason that is unknown to you. You can smell the fragrance of\
a variety of different flowers as well as different types of trees, you \
also feel a nice cool breeze brush across your face. Street bends to\
the southwest and leads to a pathway.\
", 
         Tag = "", 
         Name = "Village Street.", 
      }, 
      [28111] = 
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
               DestinationVnum = 28108, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 28113, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28111, 
         Description = "This pathways seems to be well used by the gammoreans of this tribe.\
You are thankfull that you have gotten away from the fowl odur of the\
males and pray to yourself that you never go through torture like\
that again. You can here the sounds from the main part of the village\
off in the distance as well as the wild birds and other animals that\
make the village there home.\
", 
         Tag = "", 
         Name = "Village Pathway.", 
      }, 
      [28112] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "entry_prog", 
               Arguments = "100", 
               Code = "if race($n) != gamorrean\
mpforce $n puke\
else\
mpforce $n grunt\
endif\
", 
               ScriptType = "MProg", 
            }, 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 28108, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28112, 
         Description = "The house is filthy and it needs some deoderant sprayed around, now\
you know where the smell from out in the street was coming from PEEW!\
You can't find anything of any interest in here and you feel the stench \
start burning you nostrils and making you stomach spin.\
", 
         Tag = "", 
         Name = "A house.", 
      }, 
      [28113] = 
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
               DestinationVnum = 28111, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 28117, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 28115, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28113, 
         Description = "You now stand in front of the matrons house of the Plains clan. The\
house is very nice compared to the huts and the other poor excusses\
for houses you've seen so far The trim around the doors and windows\
is a pretty bright pink, the roof is made  of clay that has a pinkish\
hue to it in fact you notice that most of the house is well, pink The\
matron seems to like the colour pink so much that she decided to have\
her house pink after all it is a very femminin colour....\
", 
         Tag = "", 
         Name = "Front of The Alpha House.", 
      }, 
      [28114] = 
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
               DestinationVnum = 28115, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28114, 
         Description = "This is the Alph-Females nursery. It smells absolutly fowl with these\
babies squirming  around in their little pens, the stench burns you\
nose nad the squealing is giving you a massive headache, though the\
babies do look a little appatising to you you moral judgment is\
telling you not to eat one but you hunger is telling you whet the\
heck why not!\
", 
         Tag = "", 
         Name = "Alpha Nursery.", 
      }, 
      [28115] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
         }, 
         TeleDelay = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "entry_prog", 
               Arguments = "100", 
               Code = "if race($n) == gamorrean\
mpforce $n comb\
endif\
", 
               ScriptType = "MProg", 
            }, 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 28116, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 28113, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 28114, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28115, 
         Description = "&Y You look around at the inside of the small house and see that &P\
pink &Y &Y is absolutly everywhere, no matter where you look its &P\
pink &Y this and &P pink &Y that. It for some reason is makeing you\
feel a little nauseaus You hear the sound of babies to the south and\
quite frankly smell them too and to the north looks to be where the\
matron herself stays.\
", 
         Tag = "", 
         Name = "Alpha House", 
      }, 
      [28116] = 
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
               DestinationVnum = 28115, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28116, 
         Description = "You are standing in the quarters of the Alfa-Female, Ugmush. She is\
well known for her fierceness and she might not be to happy about\
intruders in her home. The house has a semi-pleasent odour to it\
considering the fact that its owned by a Gamorrean. You hear the\
comotion of the children in there bedrooms as well as the  adults\
outside the house.\
", 
         Tag = "", 
         Name = "Alpha Females Quarters.", 
      }, 
      [28117] = 
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
               DestinationVnum = 28113, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 28118, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28117, 
         Description = "The pathway is hardly used, As you keep walking you can see the mountain is\
the distance getting bigger and bigger as you draw closer to it's base.\
From here you can see the forest crawls up the mountains bottom and\
reaches about one quarter of the way up until it tappers off into a\
spattering of trees here and there.\
", 
         Tag = "", 
         Name = "A Pathway in the Village.", 
      }, 
      [28118] = 
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
               DestinationVnum = 28117, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 28119, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28118, 
         Description = "The pathway is hardly used, As you keep walking you can see the mountain is\
the distance getting bigger and bigger as you draw closer to it's base.\
From here you can see the forest crawls up the mountains bottom and\
reaches about one quarter of the way up until it tappers off into a\
spattering of trees here and there.\
", 
         Tag = "", 
         Name = "More of the Path", 
      }, 
      [28119] = 
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
               DestinationVnum = 28118, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 28120, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28119, 
         Description = "The pathway is hardly used, As you keep walking you can see the mountain is\
the distance getting bigger and bigger as you draw closer to it's base.\
From here you can see the forest crawls up the mountains bottom and\
reaches about one quarter of the way up until it tappers off into a\
spattering of trees here and there.\
", 
         Tag = "", 
         Name = "End of the Path", 
      }, 
      [28120] = 
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
               DestinationVnum = 28017, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 28137, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 28119, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28120, 
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
         Tag = "", 
         Name = "In the Forest.", 
      }, 
      [28121] = 
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
               DestinationVnum = 28104, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 28123, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 28124, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 28122, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28121, 
         Description = "Wondering through the streets, you notice to the east and west are \
small huts for the males of the tribe. To the south is more of the\
village street. You also see the streets full of various levels of\
females in the hierarchy of the Gamorrean society, you also notice \
that there is no sign of the Alpha Female anywhere to be seen.\
", 
         Tag = "", 
         Name = "Village Street.", 
      }, 
      [28122] = 
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
               DestinationVnum = 28121, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28122, 
         Description = "This is a small hut. Its main purpose in life is to shealter the \
males from the rain or the harsh rays of the afternoon sun. The Hut\
is made from wood scavenged from the near by forest and held \
together with mud and clay. It is also stune with blankets and \
there is the odd hamock streched out from wall to post here and \
there.\
", 
         Tag = "", 
         Name = "A hut", 
      }, 
      [28123] = 
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
               Direction = "west", 
               DestinationVnum = 28121, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28123, 
         Description = "This is a small hut. Its main purpose in life is to shealter the \
males from the rain or the harsh rays of the afternoon sun. The Hut\
is made from wood scavenged from the near by forest and held \
together with mud and clay. It is also stune with blankets and \
there is the odd hamock streched out from wall to post here and \
there.\
", 
         Tag = "", 
         Name = "A hut", 
      }, 
      [28124] = 
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
               DestinationVnum = 28121, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 28128, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 28125, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 28130, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28124, 
         Description = "Wondering through the streets, you notice to the east and west are\
small huts for the males of the tribe. To the south is more of the\
village street. You also see the streets full of various levels of\
females in the hierarchy of the Gamorrean society, you also notice\
that there is no sign of the Alpha Female anywhere to be seen.\
", 
         Tag = "", 
         Name = "Village street.", 
      }, 
      [28125] = 
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
               DestinationVnum = 28124, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 28126, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28125, 
         Description = "Wondering through the streets, you notice to the east and west are\
small huts for the males of the tribe. To the south is more of the\
village street. You also see the streets full of various levels of\
females in the hierarchy of the Gamorrean society, you also notice\
that there is no sign of the Alpha Female anywhere to be seen.\
", 
         Tag = "", 
         Name = "Village Street.", 
      }, 
      [28126] = 
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
               DestinationVnum = 28125, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 28127, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28126, 
         Description = "You stand at the abrupt end of the village road. Seems as the the\
desert is encroching on the main village and probably has been for a\
very long time. You can feel the heat from the desert even from just\
standing at its edge, and it looks very unforgiving to the happless\
wonderer. Roumors have been floating around that some huge beast\
thing lives out in the desert eatting anything and everything it\
wants and its has been known to wander into the village from time to\
time to snatch the odd gamorrean. \
", 
         Tag = "", 
         Name = "End of The road.", 
      }, 
      [28127] = 
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
               DestinationVnum = 28126, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 28163, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28127, 
         Description = "The Gamorrean deset stretches on for miles. It is hot and you start to\
sweat almost immediatly. You can see the odd cactus here and there,\
as well as  the odd corpino scurrying past you in search of some\
shade. The relentless sun beats down on you neck causeing you to\
start gasping for some water, it is a wonder how anything could\
possibly live in such a harsh enviornment, but then again the\
gamorreans are a harsh people.\
", 
         Tag = "", 
         Name = "Out in the desert.", 
      }, 
      [28128] = 
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
               DestinationVnum = 28135, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 28136, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 28129, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 28124, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28128, 
         Description = "Wondering through the streets, you notice to the east and west are\
small huts for the males of the tribe. To the south is more of the\
village street. You also see the streets full of various levels of\
females in the hierarchy of the Gamorrean society, you also notice\
that there is no sign of the Alpha Female anywhere to be seen.\
", 
         Tag = "", 
         Name = "Village path.", 
      }, 
      [28129] = 
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
               DestinationVnum = 28128, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28129, 
         Description = "", 
         Tag = "", 
         Name = "End of the Village Path.", 
      }, 
      [28130] = 
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
               DestinationVnum = 28124, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 28133, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 28132, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28130, 
         Description = "Wondering through the streets, you notice to the east and west are\
small huts for the males of the tribe. To the south is more of the\
village street. You also see the streets full of various levels of\
females in the hierarchy of the Gamorrean society, you also notice\
that there is no sign of the Alpha Female anywhere to be seen. \
", 
         Tag = "", 
         Name = "A path in the village.", 
      }, 
      [28131] = 
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
            [1] = "_Reserved", 
            [2] = "NoMob", 
         }, 
         Exits = 
         {
         }, 
         Vnum = 28131, 
         Description = "You slowly sufficate to death....\
 \
 \
", 
         Tag = "", 
         Name = "Buried alive", 
      }, 
      [28132] = 
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
               DestinationVnum = 28130, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28132, 
         Description = "This is another small hut. much like the others, its main purpose in\
life is to shealter the boars from the rain or the harsh rays of the\
afternoon sun. The hut is made from wood scavenged from the forest\
perimeter and held together with mud, clay and some what looks like\
leather bindings. It is also strune with blankets and the odd hamock\
stretched from wall to post.\
", 
         Tag = "", 
         Name = "A Hut", 
      }, 
      [28133] = 
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
               DestinationVnum = 28130, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28133, 
         Description = "This is another small hut. much like the others, its main purpose in\
life is to shealter the boars from the rain or the harsh rays of the\
afternoon sun. The hut is made from wood scavenged from the forest\
perimeter and held together with mud, clay and some what looks like\
leather bindings. It is also strune with blankets and the odd hamock\
stretched from wall to post.\
", 
         Tag = "", 
         Name = "A Hut.", 
      }, 
      [28134] = 
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
               DestinationVnum = 28128, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28134, 
         Description = "", 
         Tag = "", 
         Name = "A Hut.", 
      }, 
      [28135] = 
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
               DestinationVnum = 28128, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28135, 
         Description = "This is another small hut. much like the others, its main purpose in\
life is to shealter the boars from the rain or the harsh rays of the\
afternoon sun. The hut is made from wood scavenged from the forest\
perimeter and held together with mud, clay and some what looks like\
leather bindings. It is also strune with blankets and the odd hamock\
stretched from wall to post.\
", 
         Tag = "", 
         Name = "A Hut.", 
      }, 
      [28136] = 
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
               Direction = "west", 
               DestinationVnum = 28128, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28136, 
         Description = "This is another small hut. much like the others, its main purpose in\
life is to shealter the boars from the rain or the harsh rays of the\
afternoon sun. The hut is made from wood scavenged from the forest\
perimeter and held together with mud, clay and some what looks like\
leather bindings. It is also strune with blankets and the odd hamock\
stretched from wall to post.\
", 
         Tag = "", 
         Name = "A Hut.", 
      }, 
      [28137] = 
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
               DestinationVnum = 28120, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 28022, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 28138, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28137, 
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
         Tag = "", 
         Name = "Within the Forest", 
      }, 
      [28138] = 
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
               DestinationVnum = 28140, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 28137, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28138, 
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
         Tag = "", 
         Name = "A path in the Forest.", 
      }, 
      [28139] = 
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
               DestinationVnum = 28120, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28139, 
         Description = "", 
         Tag = "", 
         Name = "in the Forest.", 
      }, 
      [28140] = 
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
               DestinationVnum = 28141, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 28138, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28140, 
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
         Tag = "", 
         Name = "More of the Path.", 
      }, 
      [28141] = 
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
               DestinationVnum = 28142, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 28140, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28141, 
         Description = "The forest seems to go on forever. A slight breeze seduces your nose\
with its beautiful aromas and cool touch. Wild birds, of some kind\
fill  the air with their musical ensamble like you've never heard\
before, but deep in the forest you hear the preditors of the land\
hunting and capturing their prey as well as the prey screaming their\
last breath. \
", 
         Tag = "", 
         Name = "Crocked Path.", 
      }, 
      [28142] = 
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
               DestinationVnum = 28143, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 28141, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28142, 
         Description = "The forest seems to go on forever. A slight breeze seduces your nose\
with its beautiful aromas and cool touch. Wild birds, of some kind\
fill the air with their musical ensamble like you've never heard\
before, but deep in the forest you hear the preditors of the land\
hunting and capturing their prey as well as the prey screaming their\
last breath. \
", 
         Tag = "", 
         Name = "The Paths end.", 
      }, 
      [28143] = 
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
               DestinationVnum = 28144, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 28142, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28143, 
         Description = "The forest seems to go on forever. A slight breeze seduces your nose\
with its beautiful aromas and cool touch. Wild birds, of some kind\
fill the air with their musical ensamble like you've never heard\
before, but deep in the forest you hear the preditors of the land\
hunting and capturing their prey as well as the prey screaming their\
last breath. \
", 
         Tag = "", 
         Name = "A Clearing.", 
      }, 
      [28144] = 
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
               Direction = "east", 
               DestinationVnum = 28145, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 28143, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28144, 
         Description = "This clearing leads you straight in to a villages entrance. Of course\
it is swarming with gamorreans and for some stange reason they are\
what is causing the strange noises in most of the forest. With what\
looks like a feast in honour of the Matron herself The smell of\
barbaque and some other thing fill the air with a wierd aroma. \
", 
         Tag = "", 
         Name = "An Old Path.", 
      }, 
      [28145] = 
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
               DestinationVnum = 28146, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 28144, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28145, 
         Description = "This is the entrance to the Forest clans village. The entrance is\
guarded by two large coloumns made from a concrete type of matierial\
and stnads at least fifteen feet high and three feet wide. Inside the\
entrance it is swarming with gamorreans and for some strange reason\
they are what is causing the strange noises in most of the forest.\
With what looks like a feast in honour of the Matron herself The\
smell of barbaque and some other thing fill the air with a wierd\
aroma. \
", 
         Tag = "", 
         Name = "Entrance to a Village.", 
      }, 
      [28146] = 
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
               DestinationVnum = 28145, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 28152, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 28147, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28146, 
         Description = "The smell from the house you just past still makes your eyes burn, The\
street keeps going north and south but up ahead you notice it bend to\
the southwest. You are unable to see past that distance due to the\
houses and huts blocking your view. You just hope where ever this\
road leads you its to a place that smells better then this this\
village, then again nothing could smell worse then this.\
", 
         Tag = "", 
         Name = "Village Street.", 
      }, 
      [28147] = 
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
               DestinationVnum = 28146, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 28155, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 28148, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 28154, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28147, 
         Description = "The smell from the house you just past still makes your eyes burn, The\
street keeps going north and south but up ahead you notice it bend to\
the southwest. You are unable to see past that distance due to the\
houses and huts blocking your view. You just hope where ever this\
road leads you its to a place that smells better then this this\
village, then again nothing could smell worse then this.\
", 
         Tag = "", 
         Name = "Village Street.", 
      }, 
      [28148] = 
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
               DestinationVnum = 28147, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 28149, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 28156, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28148, 
         Description = "The smell from the house you just past still makes your eyes burn, The\
street keeps going north and south but up ahead you notice it bend to\
the southwest. You are unable to see past that distance due to the\
houses and huts blocking your view. You just hope where ever this\
road leads you its to a place that smells better then this this\
village, then again nothing could smell worse then this.\
", 
         Tag = "", 
         Name = "Village Street.", 
      }, 
      [28149] = 
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
               DestinationVnum = 28148, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 28157, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 28150, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28149, 
         Description = "The smell from the house you just past still makes your eyes burn, The\
street keeps going north and south but up ahead you notice it bend to\
the southwest. You are unable to see past that distance due to the\
houses and huts blocking your view. You just hope where ever this\
road leads you its to a place that smells better then this this\
village, then again nothing could smell worse then this.\
", 
         Tag = "", 
         Name = "Village Street.", 
      }, 
      [28150] = 
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
               DestinationVnum = 28149, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 28151, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28150, 
         Description = "The street to the west ends on a semi circle of huts where you presume\
the male gamorreans sleep and gather for there clan war meetings.\
This part of the street turns west to this little ending and from\
there it goes no where but back to the spot. You can return back to\
the east and go back into the heart of the village or head into the\
dead end. \
", 
         Tag = "", 
         Name = "A turn in the Village Street.", 
      }, 
      [28151] = 
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
               DestinationVnum = 28161, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 28150, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 28160, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 28162, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28151, 
         Description = "This little semi circle is surrounded by the male gamorreans huts. And\
you can tell by the smell they dont take good care of their living\
quarters, the smell of urine fills the air and burns your nose.\
Though the smell of the forest you were travelling in had such a\
sweet sent to it, the smell from these huts completly cancels out any\
presence of the forest with surrounds the entire village.\
", 
         Tag = "", 
         Name = "End of the Village Street.", 
      }, 
      [28152] = 
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
               DestinationVnum = 28153, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 28146, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28152, 
         Description = "This small path leads looks like it leads away from the village and\
straight back into the forest for some unknown reason. maybe its for\
future expansion of the village you have no idea nor do you really\
care. The path leads east and from what you can tell ends right there\
and right back into the forest.\
", 
         Tag = "", 
         Name = "Small path in the Village.", 
      }, 
      [28153] = 
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
               Direction = "west", 
               DestinationVnum = 28152, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28153, 
         Description = "This small path leads looks like it leads away from the village and\
straight back into the forest for some unknown reason. maybe its for\
future expansion of the village you have no idea nor do you really\
care. The path leads east and from what you can tell ends right there\
and right back into the forest.\
", 
         Tag = "", 
         Name = "Small path.", 
      }, 
      [28154] = 
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
            [10] = "Safe", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 28147, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28154, 
         Description = "This store has all its supplies on the wall behind the counter, to prevent\
slippery little hands from snatching the goods that might have been on\
shelves in the middle of the store.  The gamorrean behind the counter\
doesnt look to pleasent either she looks like she was hit by a swoop and\
draged for a few light years on her face.\
", 
         Tag = "", 
         Name = "General Store.", 
      }, 
      [28155] = 
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
            [10] = "Safe", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 28147, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28155, 
         Description = "You are standing in the forest clans water supply shop, the funny thing is,\
it seems that the clan members dont have to pay for their water and oddly\
enough the off worlders have to pay the highest prices for something as\
abundent as water. You come the the conclusion the these clan people are\
nothing but crooks. The walls in the shop are lind with different types of\
ancient canteens, this place is almost like a canteen museum.\
", 
         Tag = "", 
         Name = "Water shop.", 
      }, 
      [28156] = 
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
            [10] = "Safe", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 28148, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28156, 
         Description = "These walls are lined with very well crafted axes that look as though the\
gamorrean who crafted them might have taken her time and put alot of care\
into makeing them because they all have real nice intricate designs\
covering the blades and the war hammers look like they could fetch a\
bundle in the black market.  this Gamorrean much like the rest enjoys her\
work and takes alot of pride in what she does and she looks like the type\
of gamorrean that will not hesitate to hack off a hand or two to protect\
her goods.\
", 
         Tag = "", 
         Name = "Arms for Sale.", 
      }, 
      [28157] = 
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
               DestinationVnum = 28149, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 28158, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28157, 
         Description = "This path is wider then most of the other paths you have encountered thus\
far, to the south you notice that the path comes to an end and leads\
straight to the alpha females house. The path is also loaded with\
gamorreans coming and going to and from the matrons house, paying homage\
and mostly the males are trying to find out when the next mateing battles\
will take place.\
", 
         Tag = "", 
         Name = "A Wide Path.", 
      }, 
      [28158] = 
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
               DestinationVnum = 28157, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 28159, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28158, 
         Description = "This path is wider then most of the other paths you have encountered thus\
far, to the south you notice that the path comes to an end and leads\
straight to the alpha females house. The path is also loaded with\
gamorreans coming and going to and from the matrons house, paying homage\
and mostly the males are trying to find out when the next mateing battles\
will take place. \
", 
         Tag = "", 
         Name = "End of the path.", 
      }, 
      [28159] = 
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
               DestinationVnum = 28158, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 28159, 
         Description = "This is the home of the matron, the house is made a little better then the\
other huts made from stick and such, this one is made from trees that were\
cut into palnks and held together with mud and nails and its real sturdy\
which is the obvious reason why the matron has made it her home.\
", 
         Tag = "", 
         Name = "House of the Alfa female.", 
      }, 
   }, 
   FileFormatVersion = 1, 
   Filename = "gamorr.lua", 
   Mobiles = 
   {
      [28000] = 
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
         Race = "Human", 
         Alignment = 1000, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         NumberOfAttacks = 3, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "greet_prog", 
               Arguments = "100", 
               Code = "smile\
'Hello, welcome to my home\
", 
               ScriptType = "MProg", 
            }, 
         }, 
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
         DamRoll = 5, 
         Description = "", 
         ShortDescr = "A Strange man ", 
         Weight = 0, 
         HitRoll = 5, 
         Sex = "undistinguished", 
         LongDescr = "A strange man is sitting here meditating.\
", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         DefaultPosition = "standing", 
         Credits = 5000, 
         Level = 100, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         Vnum = 28000, 
         ArmorClass = -50, 
         Tag = "", 
         Name = "A Strange man ", 
      }, 
      [28001] = 
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
         Race = "Gamorrean", 
         Alignment = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         NumberOfAttacks = 2, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "5", 
               Code = "grunt\
", 
               ScriptType = "MProg", 
            }, 
            [2] = 
            {
               MudProgType = "fight_prog", 
               Arguments = "30", 
               Code = "mpechoat $n The Gamorrean head butts you!\
mpechoaround $n The Gamorrean headbutts $n!\
mpdamage $n 15\
", 
               ScriptType = "MProg", 
            }, 
         }, 
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
         VipFlags = 
         {
            [7] = "Gamorr", 
         }, 
         DamRoll = 0, 
         Description = "", 
         ShortDescr = "A Gamorrean male", 
         Weight = 0, 
         HitRoll = 0, 
         Sex = "male", 
         LongDescr = "A Gamorrean male wanders around here.\
", 
         HitChance = 
         {
            HitNoDice = 2, 
            HitSizeDice = 10, 
            HitPlus = 100, 
         }, 
         DefaultPosition = "standing", 
         Credits = 0, 
         Level = 10, 
         Damage = 
         {
            DamSizeDice = 6, 
            DamNoDice = 2, 
            DamPlus = 0, 
         }, 
         Vnum = 28001, 
         ArmorClass = 10, 
         Tag = "", 
         Name = "A Gamorrean male", 
      }, 
      [28002] = 
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
         Race = "Gamorrean", 
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
               [14] = "gamorrese", 
            }, 
            Speaking = 
            {
               [14] = "gamorrese", 
            }, 
         }, 
         DamRoll = 0, 
         Description = "", 
         ShortDescr = "A Gamorrean child", 
         Weight = 0, 
         HitRoll = 0, 
         Sex = "male", 
         LongDescr = "A Gamorrean child is playing around here\
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
         Vnum = 28002, 
         ArmorClass = 0, 
         Tag = "", 
         Name = "gamorrean child kid piglet", 
      }, 
      [28003] = 
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
         Race = "Gamorrean", 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [5] = "Aggressive", 
         }, 
         NumberOfAttacks = 3, 
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
         DamRoll = 10, 
         Description = "You've heard about these guys they are nothing to be messed with, they\
are cunning evil and like to eat living flesh. nothing on this planet\
has the same reputation as the watch-beast so watch you step it could\
be you last!\
 \
", 
         ShortDescr = "A Gamorreans watch-beast", 
         Weight = 0, 
         HitRoll = 15, 
         Sex = "undistinguished", 
         LongDescr = "A Gamorreans watch-beast is eatting a freshly killed tourist\
", 
         HitChance = 
         {
            HitNoDice = 1, 
            HitSizeDice = 1, 
            HitPlus = 1000, 
         }, 
         DefaultPosition = "standing", 
         Credits = 0, 
         Level = 60, 
         Damage = 
         {
            DamSizeDice = 6, 
            DamNoDice = 6, 
            DamPlus = 6, 
         }, 
         Vnum = 28003, 
         ArmorClass = 0, 
         Tag = "", 
         Name = "gamorrean watch beast big pig ", 
      }, 
      [28004] = 
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
         Race = "Human", 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [5] = "Aggressive", 
            [18] = "Mountable", 
         }, 
         NumberOfAttacks = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "5", 
               Code = "grow\
", 
               ScriptType = "MProg", 
            }, 
         }, 
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
         DamRoll = 6, 
         Description = "", 
         ShortDescr = "a Desert Beitl", 
         Weight = 0, 
         HitRoll = 6, 
         Sex = "undistinguished", 
         LongDescr = "A ferocious Desert Beitl is basking in the desert sun.\
", 
         HitChance = 
         {
            HitNoDice = 6, 
            HitSizeDice = 10, 
            HitPlus = 300, 
         }, 
         DefaultPosition = "standing", 
         Credits = 0, 
         Level = 30, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamNoDice = 4, 
            DamPlus = 0, 
         }, 
         Vnum = 28004, 
         ArmorClass = 25, 
         Tag = "", 
         Name = "Beitl beast terrible run RUN RUN AWAY", 
      }, 
      [28005] = 
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
         Race = "Gamorrean", 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
         }, 
         NumberOfAttacks = 0, 
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
         DamRoll = 11, 
         Description = "", 
         ShortDescr = "Shushgu", 
         Weight = 0, 
         HitRoll = 12, 
         Sex = "male", 
         LongDescr = "It's Shushgu, One of the Alpha-females Husbands.\
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
         Vnum = 28005, 
         ArmorClass = -76, 
         Tag = "", 
         Name = "boar head shushgu", 
      }, 
      [28006] = 
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
         Race = "Human", 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [5] = "Aggressive", 
         }, 
         NumberOfAttacks = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "all_greet_prog", 
               Arguments = "100", 
               Code = "get baby\
grow\
l $n\
eat baby\
", 
               ScriptType = "MProg", 
            }, 
         }, 
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
         AttackFlags = 
         {
            [1] = "claws", 
         }, 
         DamRoll = 2, 
         HitRoll = 0, 
         Description = "", 
         ShortDescr = "A Gurda Beast", 
         Weight = 0, 
         Sex = "undistinguished", 
         DefaultPosition = "standing", 
         AffectedBy = 
         {
            [1] = "Invisible", 
            [15] = "Sneak", 
            [9] = "Infrared", 
         }, 
         HitChance = 
         {
            HitNoDice = 2, 
            HitSizeDice = 10, 
            HitPlus = 100, 
         }, 
         Credits = 0, 
         Damage = 
         {
            DamSizeDice = 6, 
            DamNoDice = 1, 
            DamPlus = 0, 
         }, 
         Level = 10, 
         LongDescr = "A Gurda Beast is prowling around in the mountain shadows.\
", 
         Vnum = 28006, 
         ArmorClass = 75, 
         Tag = "", 
         Name = "gurda beast ", 
      }, 
      [28007] = 
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
         Race = "Human", 
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
               [0] = "basic", 
            }, 
            Speaking = 
            {
               [0] = "basic", 
            }, 
         }, 
         DamRoll = 2, 
         Description = "", 
         ShortDescr = "An Imperial Stormtrooper", 
         Weight = 0, 
         HitRoll = 2, 
         Sex = "male", 
         LongDescr = "An Imperial Stormtrooper is loading infant Gamorrean watch-beasts\
", 
         HitChance = 
         {
            HitNoDice = 2, 
            HitSizeDice = 10, 
            HitPlus = 100, 
         }, 
         DefaultPosition = "standing", 
         Credits = 0, 
         Level = 10, 
         Damage = 
         {
            DamSizeDice = 6, 
            DamNoDice = 1, 
            DamPlus = 0, 
         }, 
         Vnum = 28007, 
         ArmorClass = 77, 
         Tag = "", 
         Name = "Imperial stormtrooper", 
      }, 
      [28008] = 
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
         Race = "Human", 
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
               [0] = "basic", 
            }, 
            Speaking = 
            {
               [0] = "basic", 
            }, 
         }, 
         DamRoll = 2, 
         Description = "", 
         ShortDescr = "An Imperial Stormtrooper", 
         Weight = 0, 
         HitRoll = 2, 
         Sex = "male", 
         LongDescr = "An Imperial Stormtrooper has his blaster aimed at the watch-beasts.\
", 
         HitChance = 
         {
            HitNoDice = 2, 
            HitSizeDice = 10, 
            HitPlus = 100, 
         }, 
         DefaultPosition = "standing", 
         Credits = 0, 
         Level = 10, 
         Damage = 
         {
            DamSizeDice = 6, 
            DamNoDice = 1, 
            DamPlus = 0, 
         }, 
         Vnum = 28008, 
         ArmorClass = 77, 
         Tag = "", 
         Name = "Imperial stormtrooper", 
      }, 
      [28009] = 
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
         Race = "Gamorrean", 
         Alignment = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [25] = "NoKill", 
         }, 
         NumberOfAttacks = 0, 
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
         DamRoll = 7, 
         Description = "", 
         ShortDescr = "Jos", 
         Weight = 0, 
         HitRoll = 7, 
         Sex = "male", 
         LongDescr = "Jos, The Alpha-females third Husband\
", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         DefaultPosition = "standing", 
         Credits = 0, 
         Level = 70, 
         Damage = 
         {
            DamSizeDice = 7, 
            DamNoDice = 4, 
            DamPlus = 0, 
         }, 
         Vnum = 28009, 
         ArmorClass = 0, 
         Tag = "", 
         Name = "Jos third husband", 
      }, 
      [28010] = 
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
         Race = "Gamorrean", 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [2] = "Scavenger", 
            [0] = "Npc", 
         }, 
         NumberOfAttacks = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "greet_prog", 
               Arguments = "100", 
               Code = "sigh\
say Welcome to Gamorr may you stay be...\
grunt\
say pleasing.\
smirk\
", 
               ScriptType = "MProg", 
            }, 
         }, 
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
         DamRoll = 0, 
         Description = "", 
         ShortDescr = "A Gamorrean guard", 
         Weight = 0, 
         HitRoll = 0, 
         Sex = "male", 
         LongDescr = "A Gamorrean stands guard here\
", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         DefaultPosition = "standing", 
         Credits = 0, 
         Level = 1, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         Vnum = 28010, 
         ArmorClass = 0, 
         Tag = "", 
         Name = "gamorrean guard", 
      }, 
      [28011] = 
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
         Race = "Human", 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         NumberOfAttacks = 0, 
         DamRoll = 0, 
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
         Shop = 
         {
            KeeperShortDescr = "The shop owner", 
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
         ShortDescr = "The shop owner", 
         Weight = 0, 
         HitRoll = 0, 
         Sex = "undistinguished", 
         LongDescr = "The Small stands owner is selling refreshing drinks here\
", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         DefaultPosition = "standing", 
         Credits = 0, 
         Level = 1, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         Vnum = 28011, 
         ArmorClass = 0, 
         Tag = "", 
         Name = "stand owner ", 
      }, 
      [28012] = 
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
         Race = "Gamorrean", 
         Alignment = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [25] = "NoKill", 
         }, 
         NumberOfAttacks = 0, 
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
         DamRoll = 15, 
         Description = "", 
         ShortDescr = "Fruck", 
         Weight = 0, 
         HitRoll = 15, 
         Sex = "male", 
         LongDescr = "Fruck is here keeping watch over Ugmush's ship.\
", 
         HitChance = 
         {
            HitNoDice = 10, 
            HitSizeDice = 10, 
            HitPlus = 100, 
         }, 
         DefaultPosition = "standing", 
         Credits = 240, 
         Level = 70, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamNoDice = 8, 
            DamPlus = 0, 
         }, 
         Vnum = 28012, 
         ArmorClass = -30, 
         Tag = "", 
         Name = "Fruck", 
      }, 
      [28013] = 
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
         Race = "Human", 
         Alignment = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         NumberOfAttacks = 0, 
         SpecFuns = 
         {
            [0] = "spec_fido", 
         }, 
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
         DamRoll = 0, 
         Description = "", 
         ShortDescr = "a raxe pest", 
         Weight = 0, 
         HitRoll = 0, 
         Sex = "undistinguished", 
         LongDescr = "A raxe pest is scurrying around here.\
", 
         HitChance = 
         {
            HitNoDice = 1, 
            HitSizeDice = 1, 
            HitPlus = 30, 
         }, 
         DefaultPosition = "standing", 
         Credits = 0, 
         Level = 3, 
         Damage = 
         {
            DamSizeDice = 1, 
            DamNoDice = 3, 
            DamPlus = 3, 
         }, 
         Vnum = 28013, 
         ArmorClass = 0, 
         Tag = "", 
         Name = "raxe pest ", 
      }, 
      [28014] = 
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
         Race = "Human", 
         Alignment = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [5] = "Aggressive", 
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
         DamRoll = 0, 
         Description = "This is the Zicreex, well known around Gamorr for its hunting of the\
natives most gamorreans keep a safe distance from these hungry beasts\
and with good reason too the Zicreexs diet mainly consists of\
gamorreans.\
 \
", 
         ShortDescr = "a zicreex beast ", 
         Weight = 0, 
         HitRoll = 0, 
         Sex = "undistinguished", 
         LongDescr = "A Zicreex beast is on the hunt here.\
", 
         HitChance = 
         {
            HitNoDice = 6, 
            HitSizeDice = 10, 
            HitPlus = 300, 
         }, 
         DefaultPosition = "standing", 
         Credits = 0, 
         Level = 30, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamNoDice = 4, 
            DamPlus = 0, 
         }, 
         Vnum = 28014, 
         ArmorClass = 0, 
         Tag = "", 
         Name = "zicreex beast", 
      }, 
      [28015] = 
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
         Race = "Gamorrean", 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         NumberOfAttacks = 2, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "death_prog", 
               Arguments = "100", 
               Code = "mpecho With her last bit of strength, Shaga desperatly tries to hold\
mpecho onto the clans sacred stone.\
mpoload 28030\
drop all\
", 
               ScriptType = "MProg", 
            }, 
         }, 
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
         DamRoll = 0, 
         Description = "", 
         ShortDescr = "Shaga", 
         Weight = 0, 
         HitRoll = 0, 
         Sex = "female", 
         LongDescr = "Shaga the mountain clan matron is standing here.\
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
         Vnum = 28015, 
         ArmorClass = -74, 
         Tag = "", 
         Name = "shaga mountain matron", 
      }, 
      [28016] = 
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
         Position = "sitting", 
         Height = 0, 
         SaveVs = 
         {
            SpellStaff = 0, 
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
         }, 
         Race = "Human", 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [10] = "Practice", 
            [20] = "Scholar", 
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
         DamRoll = 0, 
         Description = "This old human man seems to be content just gazing at the stars. He is\
dressed in a long hooded cloak and old brown boots. from the scars on\
his face you think that this man has seen a fair share of action in\
his days.\
Maybe he could teach you a thing or two....\
", 
         ShortDescr = "a gamorrean shaman", 
         Weight = 0, 
         HitRoll = 0, 
         Sex = "undistinguished", 
         LongDescr = "A gamorrean shaman is sitting here.\
", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         DefaultPosition = "standing", 
         Credits = 0, 
         Level = 103, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         Vnum = 28016, 
         ArmorClass = 0, 
         Tag = "", 
         Name = "shaman gamorrean healer", 
      }, 
      [28017] = 
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
         Race = "Gamorrean", 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         NumberOfAttacks = 0, 
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
         Shop = 
         {
            KeeperShortDescr = "a gamorrean shop keeper", 
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
         ShortDescr = "a gamorrean shop keeper", 
         Weight = 0, 
         HitRoll = 0, 
         Sex = "female", 
         LongDescr = "A gamorrean shop keeper is selling some water goods.\
", 
         HitChance = 
         {
            HitNoDice = 1, 
            HitSizeDice = 1, 
            HitPlus = 12998, 
         }, 
         DefaultPosition = "standing", 
         Credits = 0, 
         Level = 20, 
         Damage = 
         {
            DamSizeDice = 5, 
            DamNoDice = 10, 
            DamPlus = 10, 
         }, 
         Vnum = 28017, 
         ArmorClass = 0, 
         Tag = "", 
         Name = "gamorrean shop owner", 
      }, 
      [28018] = 
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
         Race = "Gamorrean", 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         NumberOfAttacks = 0, 
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
         Shop = 
         {
            KeeperShortDescr = "The Gamorrean Shop keeper", 
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
         ShortDescr = "The Gamorrean Shop keeper", 
         Weight = 0, 
         HitRoll = 0, 
         Sex = "female", 
         LongDescr = "A gamorrean shop keeper is selling some goods here.\
", 
         HitChance = 
         {
            HitNoDice = 1, 
            HitSizeDice = 1, 
            HitPlus = 12998, 
         }, 
         DefaultPosition = "standing", 
         Credits = 0, 
         Level = 20, 
         Damage = 
         {
            DamSizeDice = 5, 
            DamNoDice = 10, 
            DamPlus = 10, 
         }, 
         Vnum = 28018, 
         ArmorClass = 0, 
         Tag = "", 
         Name = "gamorrean shop owner", 
      }, 
      [28019] = 
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
         Race = "Gamorrean", 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         NumberOfAttacks = 0, 
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
         Shop = 
         {
            KeeperShortDescr = "The Gamorrean Shop keeper", 
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
         ShortDescr = "The Gamorrean Shop keeper", 
         Weight = 0, 
         HitRoll = 0, 
         Sex = "female", 
         LongDescr = "A gamorrean shop keeper is selling some of her weapons here.\
", 
         HitChance = 
         {
            HitNoDice = 1, 
            HitSizeDice = 1, 
            HitPlus = 12998, 
         }, 
         DefaultPosition = "standing", 
         Credits = 0, 
         Level = 20, 
         Damage = 
         {
            DamSizeDice = 5, 
            DamNoDice = 10, 
            DamPlus = 10, 
         }, 
         Vnum = 28019, 
         ArmorClass = 0, 
         Tag = "", 
         Name = "gamorrean shop owner", 
      }, 
      [28020] = 
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
         Race = "Shistavanen", 
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
               [0] = "basic", 
               [6] = "shistavanen", 
            }, 
            Speaking = 
            {
               [6] = "shistavanen", 
            }, 
         }, 
         DamRoll = 0, 
         Description = "", 
         ShortDescr = "a noghri", 
         Weight = 0, 
         HitRoll = 0, 
         Sex = "male", 
         LongDescr = "A noghri is sitting here minding his own business.\
", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         DefaultPosition = "standing", 
         Credits = 0, 
         Level = 1, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         Vnum = 28020, 
         ArmorClass = 0, 
         Tag = "", 
         Name = "noghri patron", 
      }, 
      [28021] = 
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
         Race = "Trandoshan", 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         NumberOfAttacks = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "all_greet_prog", 
               Arguments = "100", 
               Code = "if race($n) == wookiee\
' Wookiee Scum!!\
mpkill $n\
endif\
", 
               ScriptType = "MProg", 
            }, 
         }, 
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
         DamRoll = 9, 
         Description = "", 
         ShortDescr = "A trandoshan hunter", 
         Weight = 0, 
         HitRoll = 9, 
         Sex = "male", 
         LongDescr = "A trandoshan hunter is sitting here watching out for something.\
", 
         HitChance = 
         {
            HitNoDice = 10, 
            HitSizeDice = 9, 
            HitPlus = 450, 
         }, 
         DefaultPosition = "standing", 
         Credits = 0, 
         Level = 40, 
         Damage = 
         {
            DamSizeDice = 3, 
            DamNoDice = 8, 
            DamPlus = 0, 
         }, 
         Vnum = 28021, 
         ArmorClass = 0, 
         Tag = "", 
         Name = "trandoshan hunter", 
      }, 
      [28022] = 
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
               [0] = "basic", 
            }, 
            Speaking = 
            {
               [1] = "shyriiwook", 
            }, 
         }, 
         DamRoll = 0, 
         Description = "", 
         ShortDescr = "a newly created wookiee", 
         Weight = 0, 
         HitRoll = 0, 
         Sex = "undistinguished", 
         LongDescr = "Some god abandoned a newly created wookiee here.\
", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         DefaultPosition = "standing", 
         Credits = 0, 
         Level = 1, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         Vnum = 28022, 
         ArmorClass = 0, 
         Tag = "", 
         Name = "wookiee", 
      }, 
      [28023] = 
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
         Race = "Gamorrean", 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         NumberOfAttacks = 6, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "death_prog", 
               Arguments = "100", 
               Code = "mpecho Shugsha drops a shield as she collapses to the ground.\
mpoload 28029\
", 
               ScriptType = "MProg", 
            }, 
         }, 
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
         AttackFlags = 
         {
            [9] = "_09", 
            [4] = "punch", 
            [5] = "kick", 
            [6] = "_06", 
            [7] = "_07", 
         }, 
         DamRoll = 0, 
         Description = "", 
         ShortDescr = "Shugsha", 
         Weight = 0, 
         HitRoll = 0, 
         Sex = "female", 
         LongDescr = "Shugsha the forest clan matron is here.\
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
         Vnum = 28023, 
         ArmorClass = -74, 
         Tag = "", 
         Name = "Shugsha", 
      }, 
      [28025] = 
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
         Race = "Gamorrean", 
         Alignment = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         NumberOfAttacks = 2, 
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
         DamRoll = 0, 
         Description = "", 
         ShortDescr = "A Female Gamorrean", 
         Weight = 0, 
         HitRoll = 0, 
         Sex = "male", 
         LongDescr = "A Female Gamorrean is going to collect the crops.\
", 
         HitChance = 
         {
            HitNoDice = 2, 
            HitSizeDice = 10, 
            HitPlus = 100, 
         }, 
         DefaultPosition = "standing", 
         Credits = 0, 
         Level = 10, 
         Damage = 
         {
            DamSizeDice = 6, 
            DamNoDice = 2, 
            DamPlus = 0, 
         }, 
         Vnum = 28025, 
         ArmorClass = 10, 
         Tag = "", 
         Name = "female gamorrean", 
      }, 
      [28139] = 
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
         Race = "Human", 
         Alignment = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [5] = "Aggressive", 
            [2] = "Scavenger", 
            [6] = "StayArea", 
         }, 
         NumberOfAttacks = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "10", 
               Code = "drool\
", 
               ScriptType = "MProg", 
            }, 
         }, 
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
         AttackFlags = 
         {
            [0] = "bite", 
         }, 
         DamRoll = 10, 
         Description = "", 
         ShortDescr = "A large Morrt", 
         Weight = 0, 
         HitRoll = 0, 
         Sex = "undistinguished", 
         LongDescr = "A hungery Morrt is crawling around the ground here.\
", 
         HitChance = 
         {
            HitNoDice = 1, 
            HitSizeDice = 1, 
            HitPlus = 100, 
         }, 
         DefaultPosition = "standing", 
         Credits = 0, 
         Level = 10, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         Vnum = 28139, 
         ArmorClass = 0, 
         Tag = "", 
         Name = "morrt", 
      }, 
      [28116] = 
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
         Race = "Gamorrean", 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         NumberOfAttacks = 6, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "death_prog", 
               Arguments = "100", 
               Code = "mpecho &YWith her dying breath Ugmush drops a cerimonial axe.\
mpoload 28028\
", 
               ScriptType = "MProg", 
            }, 
         }, 
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
         AttackFlags = 
         {
            [9] = "_09", 
            [4] = "punch", 
            [5] = "kick", 
            [6] = "_06", 
            [7] = "_07", 
         }, 
         DamRoll = 14, 
         Description = "Ugmush is a Beauty to the Gamorreans, she has a long pink wig and her\
heavy muscled arms and breasts are sporting fifteen parasitic morrts\
to demonstrate her strength and endurance.   \
 \
", 
         ShortDescr = "Ugmush", 
         Weight = 0, 
         HitRoll = 14, 
         Sex = "female", 
         LongDescr = "The Alpha-Female Ugmush stands before you.\
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
         Vnum = 28116, 
         ArmorClass = -74, 
         Tag = "", 
         Name = "Ugmush alpha female", 
      }, 
      [28107] = 
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
         Race = "Gamorrean", 
         Alignment = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         NumberOfAttacks = 0, 
         DamRoll = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "greet_prog", 
               Arguments = "100 ", 
               Code = "say I have very many usefull things you might like \
", 
               ScriptType = "MProg", 
            }, 
         }, 
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
         Shop = 
         {
            KeeperShortDescr = "The Gamorrean Shop keeper", 
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
         ShortDescr = "The Gamorrean Shop keeper", 
         Weight = 0, 
         HitRoll = 0, 
         Sex = "female", 
         LongDescr = "The Gamorrean shop keeper is selling her weapons.\
", 
         HitChance = 
         {
            HitNoDice = 1, 
            HitSizeDice = 1, 
            HitPlus = 12998, 
         }, 
         DefaultPosition = "standing", 
         Credits = 0, 
         Level = 20, 
         Damage = 
         {
            DamSizeDice = 5, 
            DamNoDice = 10, 
            DamPlus = 10, 
         }, 
         Vnum = 28107, 
         ArmorClass = 0, 
         Tag = "", 
         Name = "Gamorrean Shop keeper.", 
      }, 
   }, 
   LowEconomy = 99916489, 
   Name = "Gamorr", 
}
