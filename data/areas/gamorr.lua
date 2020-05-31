-- Gamorr
-- Last saved Sunday 31-May-2020 15:51:33

AreaEntry
{
   ResetFrequency = 0, 
   FileFormatVersion = 1, 
   LowEconomy = 99979579, 
   Author = "Thrawn", 
   ResetMessage = "A warm breeze blows softly across your face.", 
   Objects = 
   {
      [28100] = 
      {
         Flags = 
         {
            [1] = "Hum", 
            [30] = "Prototype", 
         }, 
         Cost = 0, 
         ItemType = "trash", 
         Vnum = 28100, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "use_prog", 
               Code = "mpechoat $n The power of this weapon flows into your soul.\
mpechoaround $n You wet yourself when $n wields a Noghri blaster\
", 
               Arguments = "100", 
            }, 
         }, 
         Affects = 
         {
            [1] = 
            {
               Modifier = 5, 
               Location = 18, 
            }, 
            [2] = 
            {
               Modifier = 5, 
               Location = 19, 
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
         Name = "SUPER noghri blaster thingy", 
         ShortDescr = "A Noghri Blaster", 
         Description = "A sleak and deadly blaster lies on the ground here.", 
         Weight = 1, 
         ActionDescription = "", 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28120] = 
      {
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         Cost = 0, 
         ItemType = "armor", 
         Vnum = 28120, 
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
            }, 
            [2] = 
            {
               MudProgType = "remove_prog", 
               Code = "mpechoat $n You rip a morrt from you neck.\
mpechoaround $n Blood runs down $n's neck.\
mpdamage $n 20\
", 
               Arguments = "100", 
            }, 
            [3] = 
            {
               MudProgType = "damage_prog", 
               Code = "mpechoat $n Your morrt gets injured and bites you harder. OUCH!!\
mpdamage $n 5\
mpechoaround $n $n's Morrt Screams in pain!\
", 
               Arguments = "100", 
            }, 
         }, 
         ShortDescr = "A large Morrt", 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         Name = "morrt", 
         Weight = 10, 
         Description = "A hungry Morrt is crawling on the ground here.", 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
         }, 
         ActionDescription = "", 
         Layers = 8, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28187] = 
      {
         Cost = 0, 
         ItemType = "armor", 
         Vnum = 28187, 
         ShortDescr = "mountain clan insignia", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         Name = "mountain clan insignia", 
         Weight = 1, 
         Description = "A clan insignia is collecting dust on the ground here.", 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
         }, 
         ActionDescription = "", 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28188] = 
      {
         Flags = 
         {
            [0] = "Glow", 
            [8] = "Bless", 
         }, 
         Cost = 0, 
         ItemType = "armor", 
         Vnum = 28188, 
         ShortDescr = "a mountain clan helm", 
         ObjectValues = 
         {
            [1] = 20, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 20, 
         }, 
         Name = "mountain clan helm helmet", 
         Weight = 1, 
         Description = "A helmet is lying on the ground attracting flies.", 
         WearFlags = 
         {
            [0] = "Take", 
            [4] = "Head", 
         }, 
         ActionDescription = "", 
         Layers = 128, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28189] = 
      {
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         Cost = 20000, 
         ItemType = "weapon", 
         Vnum = 28189, 
         Affects = 
         {
            [1] = 
            {
               Modifier = 3, 
               Location = 19, 
            }, 
            [2] = 
            {
               Modifier = 3, 
               Location = 18, 
            }, 
         }, 
         ShortDescr = "a Large battle axe", 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 3, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 12, 
         }, 
         Name = "a Large battle axe", 
         Weight = 10, 
         Description = "A very large battle axe gleams in the dirt.", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         ActionDescription = "", 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28000] = 
      {
         Cost = 0, 
         ItemType = "trash", 
         Vnum = 28000, 
         ShortDescr = "White contact lenses.", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Name = "white contacts blites", 
         Weight = 1, 
         Description = "Blite has dropped his colour contacts here.", 
         WearFlags = 
         {
            [17] = "Eyes", 
         }, 
         ActionDescription = "", 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28001] = 
      {
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "use_prog", 
               Code = "mpechoat $n The Gamorrean baby SCREAMS in terror as you swallow it whole\
mpechoaround $n The Gamorrean baby SCREAMS in shear terror as $n eats it!!!!\
", 
               Arguments = "100", 
            }, 
            [2] = 
            {
               MudProgType = "rand_prog", 
               Code = "mpecho The baby Gamorrean squeals loudly!\
", 
               Arguments = "100", 
            }, 
         }, 
         Cost = 0, 
         ItemType = "food", 
         Vnum = 28001, 
         ShortDescr = "A baby Gamorrean", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 15, 
         }, 
         Name = "baby gamorrean pig piglet piggy swine", 
         Weight = 1, 
         Description = "A baby Gamorrean is lying here.", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ActionDescription = "", 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28002] = 
      {
         Cost = 0, 
         ItemType = "weapon", 
         Vnum = 28002, 
         Affects = 
         {
            [1] = 
            {
               Modifier = 3, 
               Location = 18, 
            }, 
            [2] = 
            {
               Modifier = 4, 
               Location = 19, 
            }, 
         }, 
         ShortDescr = "A Blue lightsaber ", 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 6, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Name = "A Blue Lightsaber", 
         Weight = 1, 
         Description = "A Blue lightsaber glows here.", 
         WearFlags = 
         {
            [13] = "Wield", 
         }, 
         ActionDescription = "", 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28003] = 
      {
         Cost = 100, 
         ItemType = "armor", 
         Vnum = 28003, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Name = "A Leather cap", 
         ShortDescr = "A Small leather cap ", 
         Description = "A Small leather cap is lying here ", 
         Weight = 10, 
         ActionDescription = "", 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28004] = 
      {
         Cost = 10000, 
         ItemType = "weapon", 
         Vnum = 28004, 
         Affects = 
         {
            [1] = 
            {
               Modifier = 2, 
               Location = 18, 
            }, 
            [2] = 
            {
               Modifier = 2, 
               Location = 19, 
            }, 
         }, 
         ShortDescr = "a war hammer", 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 5, 
            [3] = 7, 
            [4] = 0, 
            [5] = 0, 
            [0] = 100, 
         }, 
         Name = "war hammer", 
         Weight = 15, 
         Description = "A heavy looking hammer lies on the ground.", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         ActionDescription = "", 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28005] = 
      {
         Cost = 100, 
         ItemType = "armor", 
         Vnum = 28005, 
         ShortDescr = "a pair of leather boots", 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         Name = "leather boots", 
         Weight = 1, 
         Description = "A pair of boots lay crumpled on the ground.", 
         WearFlags = 
         {
            [0] = "Take", 
            [6] = "Feet", 
         }, 
         ActionDescription = "", 
         Layers = 128, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28006] = 
      {
         Cost = 100, 
         ItemType = "armor", 
         Vnum = 28006, 
         ShortDescr = "a large wooden shield", 
         ObjectValues = 
         {
            [1] = 10, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         Name = "large wooden shield", 
         Weight = 5, 
         Description = "Someone has carelessly drop a wooden shield here.", 
         WearFlags = 
         {
            [0] = "Take", 
            [9] = "Shield", 
         }, 
         ActionDescription = "", 
         Layers = 128, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28007] = 
      {
         Flags = 
         {
            [8] = "Bless", 
            [13] = "Inventory", 
            [0] = "Glow", 
            [19] = "LargeSize", 
         }, 
         Cost = 0, 
         ItemType = "weapon", 
         Vnum = 28007, 
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
         ShortDescr = "a war axe", 
         ObjectValues = 
         {
            [1] = 8, 
            [2] = 4, 
            [3] = 1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 12, 
         }, 
         Name = "war axe", 
         Weight = 10, 
         Description = "A magnificent looking axe has been carlessly drop here.", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         ActionDescription = "", 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28008] = 
      {
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         Cost = 0, 
         ItemType = "armor", 
         Vnum = 28008, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "remove_prog", 
               Code = "mpechoat $n You slowly remove the Morrts from you body.\
mpdamage $n 75\
mpechoaround $n $n slowly removes 15 morrts from $s body\
", 
               Arguments = "100", 
            }, 
            [2] = 
            {
               MudProgType = "wear_prog", 
               Code = "mpechoat $n You cover you body with 15 Morrts.\
mpdamage $n 50\
mpechoaround $n $n covers $s body with Morrts!\
", 
               Arguments = "100", 
            }, 
         }, 
         ShortDescr = "15 morrts", 
         ObjectValues = 
         {
            [1] = 3, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 3, 
         }, 
         Name = "morrts 15", 
         Weight = 5, 
         Description = "A small group of Morrts are here relaxing.", 
         WearFlags = 
         {
            [0] = "Take", 
            [3] = "Body", 
         }, 
         ActionDescription = "", 
         Layers = 4, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28009] = 
      {
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "remove_prog", 
               Code = "mpechoat $n You slowly remove the Morrts from your body.\
mpdamage $n 85\
mpechoaround $n $n  slowly remove 20 morrts $s body.\
", 
               Arguments = "100", 
            }, 
            [2] = 
            {
               MudProgType = "wear_prog", 
               Code = "mpechoat $n You cover your body with 20 Morrts.\
mpdamage $n 80\
mpechoaround $n $n covers $s body with 20 Morrts!\
", 
               Arguments = "100", 
            }, 
         }, 
         Cost = 0, 
         ItemType = "armor", 
         Vnum = 28009, 
         ShortDescr = "20 morrts", 
         ObjectValues = 
         {
            [1] = 3, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 3, 
         }, 
         Name = "morrts 20", 
         Weight = 5, 
         Description = "A large group of Morrts are huddled together here", 
         WearFlags = 
         {
            [0] = "Take", 
            [3] = "Body", 
         }, 
         ActionDescription = "", 
         Layers = 8, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28010] = 
      {
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         Cost = 0, 
         ItemType = "armor", 
         Vnum = 28010, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "remove_prog", 
               Code = "mpechoat $n You slowly remove the morrts from you body.\
mpdamage $n 300\
mpechoaround $n $n slowly removes 25 morrts from $s body.\
mpechoaround $n You feel $s pain.\
", 
               Arguments = "100", 
            }, 
            [2] = 
            {
               MudProgType = "wear_prog", 
               Code = "mpechoat $n You cover your body with 25 Morrts.\
mpdamage $n 250\
mpechoaround $n $n covers $s body with Morrts!\
", 
               Arguments = "100", 
            }, 
         }, 
         ShortDescr = "25 Morrts", 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         Name = "morrts 25", 
         Weight = 5, 
         Description = "A bunch of Morrts lay huddled together", 
         WearFlags = 
         {
            [0] = "Take", 
            [3] = "Body", 
         }, 
         ActionDescription = "", 
         Layers = 12, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28011] = 
      {
         Cost = 10, 
         ItemType = "armor", 
         Vnum = 28011, 
         ShortDescr = "Gurda skin", 
         ObjectValues = 
         {
            [1] = 10, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         Name = "skin", 
         Weight = 2, 
         Description = "A piece of fur is lying here collecting flies.", 
         WearFlags = 
         {
            [0] = "Take", 
            [11] = "Waist", 
         }, 
         ActionDescription = "", 
         Layers = 12, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28012] = 
      {
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         Cost = 0, 
         ItemType = "weapon", 
         Vnum = 28012, 
         ShortDescr = "a pike", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Name = "pike", 
         Weight = 1, 
         Description = "A pike is lying in your way here.", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         ActionDescription = "", 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28013] = 
      {
         Cost = 0, 
         ItemType = "trash", 
         Vnum = 28013, 
         ObjectValues = 
         {
            [1] = 13, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 13, 
         }, 
         Name = "arm limb", 
         ShortDescr = "An arm of a tourist", 
         Description = "An arm of a tourist", 
         Weight = 1, 
         ActionDescription = "", 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28014] = 
      {
         Cost = 0, 
         ItemType = "trash", 
         Vnum = 28014, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Name = "blood", 
         ShortDescr = "&r a pool of blood&Y", 
         Description = "&r a pool of blood&Y", 
         Weight = 1, 
         ActionDescription = "", 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28015] = 
      {
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         Cost = 120, 
         ItemType = "armor", 
         Vnum = 28015, 
         ShortDescr = "a metal helm", 
         ObjectValues = 
         {
            [1] = 6, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 6, 
         }, 
         Name = "metal helmet gamorrean", 
         Weight = 3, 
         Description = "Some clumsy Gamorrean has drop his helmet", 
         WearFlags = 
         {
            [0] = "Take", 
            [4] = "Head", 
         }, 
         ActionDescription = "", 
         Layers = 128, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28016] = 
      {
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         Cost = 150, 
         ItemType = "armor", 
         Vnum = 28016, 
         ShortDescr = "metal boots", 
         ObjectValues = 
         {
            [1] = 7, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 7, 
         }, 
         Name = "metal boots", 
         Weight = 1, 
         Description = "A pair of metal boots are attracting flies here.", 
         WearFlags = 
         {
            [0] = "Take", 
            [6] = "Feet", 
         }, 
         ActionDescription = "", 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28017] = 
      {
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         Cost = 200, 
         ItemType = "armor", 
         Vnum = 28017, 
         ShortDescr = "wrist guards", 
         ObjectValues = 
         {
            [1] = 7, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 7, 
         }, 
         Name = "wrist guards", 
         Weight = 3, 
         Description = "Some clumsy Gamorrean has drop his wrist guards here", 
         WearFlags = 
         {
            [0] = "Take", 
            [12] = "Wrist", 
         }, 
         ActionDescription = "", 
         Layers = 64, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28018] = 
      {
         Cost = 0, 
         ItemType = "trash", 
         Vnum = 28018, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Name = "imperial cargo cruiser", 
         ShortDescr = "Imperial cargo ship", 
         Description = "An Imperial cargo ship has landed here.", 
         Weight = 1, 
         ActionDescription = "", 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28019] = 
      {
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         Cost = 0, 
         ItemType = "armor", 
         Vnum = 28019, 
         ShortDescr = "a pink wig", 
         ObjectValues = 
         {
            [1] = 3, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 3, 
         }, 
         Name = "pink wig", 
         Weight = 1, 
         Description = "A dirty, bright pink wig is being trampled by people here.", 
         WearFlags = 
         {
            [0] = "Take", 
            [4] = "Head", 
         }, 
         ActionDescription = "", 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28020] = 
      {
         Cost = 100, 
         ItemType = "weapon", 
         Vnum = 28020, 
         ShortDescr = "a hand axe", 
         ObjectValues = 
         {
            [1] = 4, 
            [2] = 3, 
            [3] = 3, 
            [4] = 0, 
            [5] = 0, 
            [0] = 12, 
         }, 
         Name = "hand axe", 
         Weight = 3, 
         Description = "A clumsy gamorrean has carlessly drop his axe here.", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
            [14] = "Hold", 
         }, 
         ActionDescription = "", 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28021] = 
      {
         Cost = 0, 
         ItemType = "container", 
         Vnum = 28021, 
         ObjectValues = 
         {
            [1] = 1, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 500, 
         }, 
         Name = "crate box", 
         ShortDescr = "a crate", 
         Description = "A large crate is here.", 
         Weight = 100, 
         ActionDescription = "", 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28022] = 
      {
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
            }, 
         }, 
         Cost = 0, 
         ItemType = "trash", 
         Vnum = 28022, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Name = "infant gamorrean watch beats", 
         ShortDescr = "an infant watch-beast", 
         Description = "An infant watch-beast is sitting here.", 
         Weight = 1, 
         ActionDescription = "", 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28023] = 
      {
         Cost = 0, 
         ItemType = "spacecraft", 
         Vnum = 28023, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Name = "ship cube zicreex", 
         ShortDescr = "The Gamorrean cube ship Zireex", 
         Description = "The gamorrean cube ship Zicreex is parked here.", 
         Weight = 1, 
         ActionDescription = "", 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28024] = 
      {
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         Cost = 0, 
         ItemType = "armor", 
         Vnum = 28024, 
         ShortDescr = "metal shoulder plates", 
         ObjectValues = 
         {
            [1] = 6, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Name = "metal shoulder plates", 
         Weight = 3, 
         Description = "Metal shoulder plates have been carelessly drop here.", 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
         }, 
         ActionDescription = "", 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28025] = 
      {
         Flags = 
         {
            [4] = "Contraband", 
            [19] = "LargeSize", 
         }, 
         Cost = 500, 
         ItemType = "weapon", 
         Vnum = 28025, 
         Affects = 
         {
            [1] = 
            {
               Modifier = 3, 
               Location = 19, 
            }, 
            [2] = 
            {
               Modifier = 3, 
               Location = 18, 
            }, 
         }, 
         ShortDescr = "a vibro-axe", 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 3, 
            [3] = 1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 12, 
         }, 
         Name = "vibro axe", 
         Weight = 10, 
         Description = "A vibro-axe vibro axe is here collecting dust.", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         ActionDescription = "", 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28026] = 
      {
         Cost = 0, 
         ItemType = "durasteel", 
         Vnum = 28026, 
         ShortDescr = "scraps of a ship", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         Name = "ship scraps", 
         Weight = 1, 
         Description = "The scraps of a ship lie here.", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ActionDescription = "", 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28027] = 
      {
         Cost = 0, 
         ItemType = "trash", 
         Vnum = 28027, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Name = "mud hole", 
         ShortDescr = "a mud hole", 
         Description = "A rather large mud hole.", 
         Weight = 1, 
         ActionDescription = "", 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28028] = 
      {
         Flags = 
         {
            [0] = "Glow", 
         }, 
         Cost = 0, 
         ItemType = "government", 
         Vnum = 28028, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Name = "cerimonial axe", 
         ShortDescr = "a beautiful axe", 
         Description = "A beautifuly crafted axe is on a pedestal here.", 
         Weight = 1, 
         ActionDescription = "", 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28029] = 
      {
         Cost = 0, 
         ItemType = "government", 
         Vnum = 28029, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Name = "cerimonial shield", 
         ShortDescr = "a cerimonial shield", 
         Description = "A fine shield is being displayed on a mantel.", 
         Weight = 1, 
         ActionDescription = "", 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28030] = 
      {
         Cost = 0, 
         ItemType = "government", 
         Vnum = 28030, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Name = "sacred stone", 
         ShortDescr = "a sacred stone", 
         Description = "The sacred stone of the Mountains is here.", 
         Weight = 1, 
         ActionDescription = "", 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28199] = 
      {
         Cost = 0, 
         ItemType = "furniture", 
         Vnum = 28199, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Name = "chair", 
         ShortDescr = "a newly created chair", 
         Description = "Some god dropped a newly created chair here.", 
         Weight = 1, 
         ActionDescription = "", 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
   }, 
   Rooms = 
   {
      [28160] = 
      {
         Tunnel = 0, 
         Vnum = 28160, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 28151, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "A hut.", 
         Description = "This is a small hut. Its main purpose in life is to shealter the males\
from the rain or the harsh rays of the afternoon sun. The Hut is made\
from wood scavenged from the near by forest and held together with\
mud and clay. It is also stune with blankets and there is the odd\
hamock streched out from wall to post here and there. \
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28161] = 
      {
         Tunnel = 0, 
         Vnum = 28161, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 28151, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "A hut.", 
         Description = "This is a small hut. Its main purpose in life is to shealter the males\
from the rain or the harsh rays of the afternoon sun. The Hut is made\
from wood scavenged from the near by forest and held together with\
mud and clay. It is also stune with blankets and there is the odd\
hamock streched out from wall to post here and there. \
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28162] = 
      {
         Tunnel = 0, 
         Vnum = 28162, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 28151, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "A hut.", 
         Description = "This is a small hut. Its main purpose in life is to shealter the males\
from the rain or the harsh rays of the afternoon sun. The Hut is made\
from wood scavenged from the near by forest and held together with\
mud and clay. It is also stune with blankets and there is the odd\
hamock streched out from wall to post here and there. \
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28163] = 
      {
         Tunnel = 0, 
         Vnum = 28163, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 28127, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 28164, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "Desert plains of Gamorr.", 
         Description = "The Gamorrean deset stretches on for miles. It is hot and you start to\
sweat almost immediatly. You can see the odd cactus here and there,\
as well as  the odd corpino scurrying past you in search of some\
shade. The relentless sun beats down on you neck causeing you to\
start gasping for some water, it is a wonder how anything could\
possibly live in such a harsh enviornment, but then again the\
gamorreans are a harsh people.\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28164] = 
      {
         Tunnel = 0, 
         Vnum = 28164, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 28165, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 28163, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "Desert plains.", 
         Description = "The Gamorrean deset stretches on for miles. It is hot and you start to\
sweat almost immediatly. You can see the odd cactus here and there,\
as well as  the odd corpino scurrying past you in search of some\
shade. The relentless sun beats down on you neck causeing you to\
start gasping for some water, it is a wonder how anything could\
possibly live in such a harsh enviornment, but then again the\
gamorreans are a harsh people. \
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28165] = 
      {
         Tunnel = 0, 
         Vnum = 28165, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 28025, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 28164, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 28166, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "Desert path.", 
         Description = "The Gamorrean deset stretches on for miles. It is hot and you start to\
sweat almost immediatly. You can see the odd cactus here and there,\
as well as  the odd corpino scurrying past you in search of some\
shade. The relentless sun beats down on you neck causeing you to\
start gasping for some water, it is a wonder how anything could\
possibly live in such a harsh enviornment, but then again the\
gamorreans are a harsh people. \
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28166] = 
      {
         Tunnel = 0, 
         Vnum = 28166, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 28167, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 28165, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "An eroding walkway.", 
         Description = "You are standing on what might have been, at one point, a very well\
put together walkway, but over time has eroded to a few stones the\
have with stood the test of time and seem to be on there last legs,\
since the elements here, at times, sand blast everything that stands\
and leaves it in a crumbling mass of useless rubble. The path turns\
and you notice ahead that it keeps twisting and turning. You aren't\
sure if it was made that way or if it was one time a large and\
straight path. \
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28167] = 
      {
         Tunnel = 0, 
         Vnum = 28167, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 28166, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 28168, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "More of the eroding walkway.", 
         Description = "You are standing on what might have been, at one point, a very well\
put together walkway, but over time has eroded to a few stones the\
have with stood the test of time and seem to be on there last legs,\
since the elements here, at times, sand blast everything that stands\
and leaves it in a crumbling mass of useless rubble. The path turns\
and you notice ahead that it keeps twisting and turning. You aren't\
sure if it was made that way or if it was one time a large and\
straight path. \
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28168] = 
      {
         Tunnel = 0, 
         Vnum = 28168, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 28167, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 28169, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "End of the walkway.", 
         Description = "You are standing on what might have been, at one point, a very well\
put together walkway, but over time has eroded to a few stones the\
have with stood the test of time and seem to be on there last legs,\
since the elements here, at times, sand blast everything that stands\
and leaves it in a crumbling mass of useless rubble. The path turns\
and you notice ahead that it keeps twisting and turning. You aren't\
sure if it was made that way or if it was one time a large and\
straight path. \
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28169] = 
      {
         Tunnel = 0, 
         Vnum = 28169, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 28168, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "Entrance to the Desert town.", 
         Description = "You stand in front of an old entrance, once you look through it you\
see nothing but more desert and the odd post of what might have been\
at one time an old house. You come to the conclusion that this at one\
point was the plains area abut has now been over taken by the\
constant shifting sands of the relentless desert. In due time all teh\
plains will be just like this barren and devoid of semi intellegent\
life... \
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28170] = 
      {
         Tunnel = 0, 
         Vnum = 28170, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [11] = "Hidden", 
               }, 
               Description = "", 
               Distance = 0, 
               Direction = "somewhere", 
               DestinationVnum = 28036, 
               Key = -1, 
            }, 
         }, 
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
            }, 
         }, 
         TeleDelay = 0, 
         Description = "The mud bubbles and gurggles all around you, the bubbles tickling you as\
they rise to the top. The mud is very refreshing to your aches and pains\
and seems  to ease all the sores you have accumulated from your travels.\
The only problem is, There are other gamorreans here with you and you\
don't know if the bubbles are from the underground or from them, and the\
slight smell is starting to make you wonder. \
", 
         TeleVnum = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28171] = 
      {
         Tunnel = 0, 
         Vnum = 28171, 
         Exits = 
         {
         }, 
         Sector = "city", 
         Name = "floating in the void", 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28172] = 
      {
         Tunnel = 0, 
         Vnum = 28172, 
         Exits = 
         {
         }, 
         Sector = "city", 
         Name = "floating in the void", 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28173] = 
      {
         Tunnel = 0, 
         Vnum = 28173, 
         Exits = 
         {
         }, 
         Sector = "city", 
         Name = "floating in the void", 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28174] = 
      {
         Tunnel = 0, 
         Vnum = 28174, 
         Exits = 
         {
         }, 
         Sector = "city", 
         Name = "floating in the void", 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28175] = 
      {
         Tunnel = 0, 
         Vnum = 28175, 
         Exits = 
         {
         }, 
         Sector = "city", 
         Name = "floating in the void", 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28176] = 
      {
         Tunnel = 0, 
         Vnum = 28176, 
         Exits = 
         {
         }, 
         Sector = "city", 
         Name = "floating in the void", 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28177] = 
      {
         Tunnel = 0, 
         Vnum = 28177, 
         Exits = 
         {
         }, 
         Sector = "city", 
         Name = "floating in the void", 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28178] = 
      {
         Tunnel = 0, 
         Vnum = 28178, 
         Exits = 
         {
         }, 
         Sector = "city", 
         Name = "floating in the void", 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28179] = 
      {
         Tunnel = 0, 
         Vnum = 28179, 
         Exits = 
         {
         }, 
         Sector = "city", 
         Name = "floating in the void", 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28180] = 
      {
         Tunnel = 0, 
         Vnum = 28180, 
         Exits = 
         {
         }, 
         Sector = "city", 
         Name = "floating in the void", 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28181] = 
      {
         Tunnel = 0, 
         Vnum = 28181, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 28183, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 28182, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [11] = "Hidden", 
               }, 
               Description = "", 
               Distance = 0, 
               Direction = "somewhere", 
               DestinationVnum = 28038, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "Inside the Zicreex", 
         TeleDelay = 0, 
         Description = "You are standing in the infamous Zicreex. Which is owned by Ugmush and\
it has a slight stench to it, could possible be from her husbands as\
well as the other ship men she has to maintain can help pilot her\
beloved ship. It isn't exactlly the best of ships but how often do\
you get to sit in a Gamorrean Cube ship?\
", 
         TeleVnum = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28182] = 
      {
         Tunnel = 0, 
         Vnum = 28182, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 28181, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "Cockpit", 
         Description = "This is the cockpit of the Zicreex. it isn't as bad as it seems to be\
from outside appearences, it does get its passengers from a to b with\
very little problems. The lights on the controls blink on and off and\
you here some bits and pieces of communication going back and forth\
over the comm system.\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28183] = 
      {
         Tunnel = 0, 
         Vnum = 28183, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 28181, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "Large storage compartment", 
         Description = "This is where the crew put all its scavenge good the score from debris\
the find floating around in space, mostly from destroyed ships and\
such. There are bits and pieces of useless scraps cluttering the\
floor here.\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28184] = 
      {
         Tunnel = 0, 
         Vnum = 28184, 
         Exits = 
         {
         }, 
         Sector = "city", 
         Name = "floating in the void", 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28185] = 
      {
         Tunnel = 0, 
         Vnum = 28185, 
         Exits = 
         {
         }, 
         Sector = "city", 
         Name = "floating in the void", 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28186] = 
      {
         Tunnel = 0, 
         Vnum = 28186, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 28187, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "northeast", 
               DestinationVnum = 28110, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "Pathway to the Mountains", 
         Description = "This Path is almost impossible to notice due to the lack of traffic\
flowing to the mountains. You sit and wonder why the Gammoreans\
wouldn'y use the path and come to the conclusion that maybe there is\
another clan up in the mountains and this might not be the season for\
the wars in fact as you look up the path you notice there is some\
spires of smoke rising from what you think could be home fires\
burning.\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28187] = 
      {
         Tunnel = 0, 
         Vnum = 28187, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 28186, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "up", 
               DestinationVnum = 28188, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "Mountain trail.", 
         TeleDelay = 0, 
         Description = "The trail is scattered with pebbels and bits of grass and wild\
flowers, you also see insects scurrying out of you way as well as the\
odd foot print leading up to what seems to be a mountain village. As\
you keep ascending the mountain the smells and sounds of village\
living gets stronger and stronger ecspecially the smells peewww it\
stinks. but you plug you nose and stick to the trail and keep\
climbing.\
", 
         TeleVnum = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28188] = 
      {
         Tunnel = 0, 
         Vnum = 28188, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "up", 
               DestinationVnum = 28189, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "down", 
               DestinationVnum = 28187, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "Steep path.", 
         TeleDelay = 0, 
         Description = "The trail is scattered with pebbels and bits of grass and wild\
flowers, you also see insects scurrying out of you way as well as the\
odd foot print leading up to what seems to be a mountain village. As\
you keep ascending the mountain the smells and sounds of village\
living gets stronger and stronger ecspecially the smells peewww it\
stinks. but you plug you nose and stick to the trail and keep\
climbing.\
", 
         TeleVnum = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28189] = 
      {
         Tunnel = 0, 
         Vnum = 28189, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 28190, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 28191, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "down", 
               DestinationVnum = 28188, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "Cliff Ledge", 
         Description = "You can see for miles when you look over the ledge. In the distance\
you can see lush rain forests, further south you see a vast desert as\
well as the Huntbird in the village below While you were admiring the\
view, You completly forgot to check the stability of the ledge and it\
doesn't look to strong, you can notice a huge crack about three feet\
behind you where the ledge looks like it is about to colapse. Maybe\
you should get to safer ground.\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28190] = 
      {
         Tunnel = 0, 
         Vnum = 28190, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 28189, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "Weak Cliff Lip", 
         TeleDelay = 0, 
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
         TeleVnum = 0, 
         Flags = 
         {
            [1] = "_Reserved", 
         }, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28191] = 
      {
         Tunnel = 0, 
         Vnum = 28191, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 28189, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 28192, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "Cliff Ledge", 
         Description = "You can see alomost the whole planet from here, it looks great. You\
have a cool breeze blowing past you face making you feel refreshed\
after that long climb you can here what sounds like gamorreans\
getting ready to do something, you have no idea what, but it sounds\
very important or dangerous the way they sound. \
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28192] = 
      {
         Tunnel = 0, 
         Vnum = 28192, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 28193, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 28191, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "Cliff Ledge", 
         Description = "You can see alomost the whole planet from here, it looks great. You\
have a cool breeze blowing past you face making you feel refreshed\
after that long climb you can here what sounds like gamorreans\
getting ready to do something, you have no idea what, but it sounds\
very important or dangerous the way they sound. \
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28193] = 
      {
         Tunnel = 0, 
         Vnum = 28193, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 28194, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 28192, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "Mountain Pathway", 
         Description = "Now you can see where all the noise was comeing from. The mountain\
clan seems to be in a bit of a tizzy, something seems to have come\
into their area, and they don't seem to be happy about it, some even\
look afraid at what has invaded their homes, and it seems to be\
around the mine shaft that is in the center of  the village .\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28194] = 
      {
         Tunnel = 0, 
         Vnum = 28194, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 28195, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 28193, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "Entrance to the Mountain Clan", 
         Description = "You are standing in the entrance and no gamorrean seems to have\
noticed you, They are far to busy trying to rid themselve of this\
small problem that it has left them open to unwanted visitors. From\
the mine shaft in the ground you hear a viscious groweling and it\
doesn't sound to pleasent to teh ears. You have heard of the Gurdas\
that have been known to snatch the odd child from its cribs and now\
it seems you are gonna witness one from a distance.\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28195] = 
      {
         Tunnel = 0, 
         Vnum = 28195, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 28198, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 28194, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "up", 
               DestinationVnum = 28196, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "Path in the Clan Village", 
         Description = "The village is in chaos, there seems to be only one gamorrean with his\
thoughts straight and the is the shammon to the south. The groweling\
is still very  loud and promenent as still very viscious. Hear the\
scream of a child as it sound as if it has been captured by a gurda.\
You think and hope to yourself  that they dont hunt in packs cause\
then this place could be surrounded by them.  the thought sends\
shivers up and down you spine..\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28196] = 
      {
         Tunnel = 0, 
         Vnum = 28196, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "down", 
               DestinationVnum = 28195, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "Small Cave Entrance", 
         TeleDelay = 0, 
         Description = "This is the home to the Gamorreans only known shammon, he has his\
place in good order for a Gamorrean, and the smell isn't as bad as\
you had the pleaseue of smelling in the main village. The Shammon has\
an assortment of small trinkets lying around his abode everything\
from small and large gems to the odd credit and you think you see a\
hilt of some sort but, that would not be a surprise even for a\
Gamorrean of his age.\
", 
         TeleVnum = 0, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28197] = 
      {
         Tunnel = 0, 
         Vnum = 28197, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "up", 
               DestinationVnum = 28198, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "Large Cave Entrance", 
         Description = "", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28198] = 
      {
         Tunnel = 0, 
         Vnum = 28198, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 28199, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 28195, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "down", 
               DestinationVnum = 28197, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "Mountain Path", 
         Description = "The chaos and the groweling is getting worse as time goes on, you see\
of blood comeing from the cave and going north and you also see a\
babies little booty in the trail, seems like the panic has its\
reasons, something has got a baby and it is most likely a gurda that\
has it too. The mother is standing here screaming for her babies safe\
return, she's looking at you as if you might be the only one who can\
do it.\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28199] = 
      {
         Tunnel = 0, 
         Vnum = 28199, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 28000, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 28198, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "Mountain Path", 
         Description = "You walk along a mountain pass there are steep ledges all around you.\
The path you are on seems sturdy though if not carefull you could get\
harmed. There are some large boulders around the path that could\
start a cool rock slide at anytime. Birds are cherping in the\
distance and there are soem other animals making noise around you.\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28000] = 
      {
         Tunnel = 0, 
         Vnum = 28000, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 28001, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 28199, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "Mountain Path", 
         Description = "You walk along a mountain pass there are steep ledges all around you. The path \
you are on seems sturdy though if not carefull you could get harmed. There are \
some large boulders around the path that could start a cool rock slide at\
anytime. Birds are cherping in the distance and there are soem other animals\
making noise around you.\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28001] = 
      {
         Tunnel = 0, 
         Vnum = 28001, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 28000, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "up", 
               DestinationVnum = 28002, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "down", 
               DestinationVnum = 28004, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "Mountain Path", 
         Description = "You have finaly reached the center of the chaos, everyone is holding\
spears and wielding axes and looking down what looks to be an\
abandoned mine, the source of the growling and the squeals of an\
injured and scared baby. The sounds pull on your hart and a tear\
trickles down you cheeck as you feel the urge to help the baby and\
destroy the evil gurda that has absolutly no care for the child.\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28002] = 
      {
         Tunnel = 0, 
         Vnum = 28002, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "up", 
               DestinationVnum = 28003, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "down", 
               DestinationVnum = 28001, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "Steep Trail", 
         Description = "You Stand in front of a rather large cave that the Alpha female has\
designated as her own, It is really big, it reminds you of a black\
hole. When the wind blows past the opening it makes a rather eriy\
howl that make your skin crawl with fear for some strange reason.\
Strangly though, no one is around here, they all seem to be\
preoccupied with the gurda and the baby, leaveing the large cave\
defenseless.\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28003] = 
      {
         Tunnel = 0, 
         Vnum = 28003, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "down", 
               DestinationVnum = 28002, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "Alpha-Cave", 
         Description = "This is the cave of the mountain clans matron. It seems to be a little\
messed up, there is what looks like would be the nest of a gurda on\
the floor, could it be the she owns the gurda?, it would make sense\
since only the matron is allowd to have childern and no other female\
can because the would defeat the purpose of haveing the social\
structure the gamorreans have adopted as their own. You come to the\
conclusion that the matron sent the gurda after the other females\
child, to kill t or to bring it back, only the matron knows.\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28004] = 
      {
         Tunnel = 0, 
         Vnum = 28004, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "up", 
               DestinationVnum = 28001, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Flags = 
               {
                  [16] = "CanClimb", 
               }, 
               Description = "", 
               Distance = 0, 
               Direction = "down", 
               DestinationVnum = 28005, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "Mine Shaft", 
         TeleDelay = 0, 
         Description = "There is a very weak wooden ledge here, it doesn't look as if it is\
able to support the weight of anything your size. The boards start to\
groan under your feet and you start to here them snap and crack,\
splinters of wood start to fly through the air and you here a snap as\
they give way\
", 
         TeleVnum = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28005] = 
      {
         Tunnel = 0, 
         Vnum = 28005, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 28031, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "up", 
               DestinationVnum = 28004, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Flags = 
               {
                  [16] = "CanClimb", 
               }, 
               Description = "", 
               Distance = 0, 
               Direction = "down", 
               DestinationVnum = 28006, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "Mine Shaft", 
         TeleDelay = 0, 
         Description = "There is a very weak wooden ledge here, it doesn't look as if it is\
able to support the weight of anything your size. The boards start to\
groan under your feet and you start to here them snap and crack,\
splinters of wood start to fly through the air and you here a snap as\
they give way\
", 
         TeleVnum = 0, 
         Flags = 
         {
            [0] = "Dark", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28006] = 
      {
         Tunnel = 0, 
         Vnum = 28006, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 28032, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "up", 
               DestinationVnum = 28005, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Flags = 
               {
                  [16] = "CanClimb", 
               }, 
               Description = "", 
               Distance = 0, 
               Direction = "down", 
               DestinationVnum = 28007, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "Mine Shaft", 
         TeleDelay = 0, 
         Description = "There is a very weak wooden ledge here, it doesn't look as if it is\
able to support the weight of anything your size. The boards start to\
groan under your feet and you start to here them snap and crack,\
splinters of wood start to fly through the air and you here a snap as\
they give way\
", 
         TeleVnum = 0, 
         Flags = 
         {
            [0] = "Dark", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28007] = 
      {
         Tunnel = 0, 
         Vnum = 28007, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 28033, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "up", 
               DestinationVnum = 28006, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "Bottom of the Shaft.", 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
         Flags = 
         {
            [0] = "Dark", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28008] = 
      {
         Tunnel = 0, 
         Vnum = 28008, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 28100, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 28009, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "Entrance to a Corridor.", 
         TeleDelay = 0, 
         Description = "You are standing in the Gamorr safe house. Far to the south\
you can here the loud chatter of fellow visitors and natives\
takeing time out and haveing some refreshments to easy the \
pressure of everyday life.\
", 
         TeleVnum = 0, 
         Flags = 
         {
            [10] = "Safe", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28009] = 
      {
         Tunnel = 0, 
         Vnum = 28009, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 28008, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 28010, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "Long corridor.", 
         TeleDelay = 0, 
         Description = "This is one long and straight corridor, its very well kept\
and from the sounds of it, very peaceful meaning no sounds \
of fighting what so ever. This is good new, cause now you\
can really sit back and relax.\
", 
         TeleVnum = 0, 
         Flags = 
         {
            [10] = "Safe", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28010] = 
      {
         Tunnel = 0, 
         Vnum = 28010, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 28009, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 28011, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "Long corridor.", 
         TeleDelay = 0, 
         Description = "This is one long and straight corridor, its very well kept\
and from the sounds of it, very peaceful meaning no sounds \
of fighting what so ever. This is good new, cause now you\
can really sit back and relax.\
", 
         TeleVnum = 0, 
         Flags = 
         {
            [10] = "Safe", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28011] = 
      {
         Tunnel = 0, 
         Vnum = 28011, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 28010, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 28038, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 28015, 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 28012, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "Lounge area", 
         TeleDelay = 0, 
         Description = "The lounge is very nicely built. It is very large, with tables\
spread in a nice orderly fashion. The tabels themselves are \
quite a sight to see, they are all supported by large beams of\
dark blue light which comes from the floor and into the ceiling.\
There is a refreshments stand that stands in the middle of the\
whole area.\
", 
         TeleVnum = 0, 
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
      }, 
      [28012] = 
      {
         Tunnel = 0, 
         Vnum = 28012, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 28013, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 28011, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 28016, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "Lounge area", 
         TeleDelay = 0, 
         Description = "The lounge has a very relaxed atmosphere, with soft music playing\
and quiet conversations going on here and there. You stand here\
waiting for a waitress, and during this time you take a look\
at some of the patrons here, and notice that they seem to be very\
friendly people, all have smiles and are very relaxed you too\
decide its time to have a drink and a rest.\
", 
         TeleVnum = 0, 
         Flags = 
         {
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28013] = 
      {
         Tunnel = 0, 
         Vnum = 28013, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 28014, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 28012, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 28016, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "Lounge area", 
         TeleDelay = 0, 
         Description = "The lounge has a very relaxed atmosphere, with soft music playing\
and quiet conversations going on here and there. You stand here\
waiting for a waitress, and during this time you take a look\
at some of the patrons here, and notice that they seem to be very\
friendly people, all have smiles and are very relaxed you too\
decide its time to have a drink and a rest.\
", 
         TeleVnum = 0, 
         Flags = 
         {
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28014] = 
      {
         Tunnel = 0, 
         Vnum = 28014, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 28016, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 28015, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 28013, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "Lounge area", 
         TeleDelay = 0, 
         Description = "The lounge has a very relaxed atmosphere, with soft music playing\
and quiet conversations going on here and there. You stand here\
waiting for a waitress, and during this time you take a look\
at some of the patrons here, and notice that they seem to be very\
friendly people, all have smiles and are very relaxed you too\
decide its time to have a drink and a rest.\
", 
         TeleVnum = 0, 
         Flags = 
         {
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28015] = 
      {
         Tunnel = 0, 
         Vnum = 28015, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 28011, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 28016, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 28014, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "Lounge area", 
         TeleDelay = 0, 
         Description = "The lounge has a very relaxed atmosphere, with soft music playing\
and quiet conversations going on here and there. You stand here\
waiting for a waitress, and during this time you take a look\
at some of the patrons here, and notice that they seem to be very\
friendly people, all have smiles and are very relaxed you too\
decide its time to have a drink and a rest.\
", 
         TeleVnum = 0, 
         Flags = 
         {
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28016] = 
      {
         Tunnel = 0, 
         Vnum = 28016, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 28012, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 28013, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 28014, 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 28015, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "Refreshments Stand.", 
         TeleDelay = 0, 
         Description = "This is a nicely put together stand, as far as stands go, because\
it is made from a rare wood not found anywhere on this planet\
and it has been very well cut aswell as the designs cut into it\
make it seem as though it has a little story scrolling across its \
edge. The stand has a nice odour to it, due to the variety of drinks\
and snacks that are being sold to its patrons.\
", 
         TeleVnum = 0, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28017] = 
      {
         Tunnel = 0, 
         Vnum = 28017, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 28018, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 28120, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "Deep in the Forest.", 
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
         TeleVnum = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28018] = 
      {
         Tunnel = 0, 
         Vnum = 28018, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 28017, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "northwest", 
               DestinationVnum = 28019, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "The Darkend Forest.", 
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
         TeleVnum = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28019] = 
      {
         Tunnel = 0, 
         Vnum = 28019, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 28036, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 28020, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "southeast", 
               DestinationVnum = 28018, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "Uncharted Forest area.", 
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
         TeleVnum = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28020] = 
      {
         Tunnel = 0, 
         Vnum = 28020, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 28019, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "down", 
               DestinationVnum = 28021, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "Forest Ravine", 
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
         TeleVnum = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28021] = 
      {
         Tunnel = 0, 
         Vnum = 28021, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "up", 
               DestinationVnum = 28020, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "Sudden Drop off.", 
         Description = "", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28022] = 
      {
         Tunnel = 0, 
         Vnum = 28022, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 28137, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 28023, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "northwest", 
               DestinationVnum = 28036, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "Deep in the forest.", 
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
         TeleVnum = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28023] = 
      {
         Tunnel = 0, 
         Vnum = 28023, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 28022, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "down", 
               DestinationVnum = 28024, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "Near the Edge of a Ravine", 
         TeleDelay = 0, 
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
         TeleVnum = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28024] = 
      {
         Tunnel = 0, 
         Vnum = 28024, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "up", 
               DestinationVnum = 28023, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "Sudden Drop.", 
         Description = "", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28025] = 
      {
         Tunnel = 0, 
         Vnum = 28025, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 28165, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "northeast", 
               DestinationVnum = 28026, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "The Desert.", 
         Description = "The Gamorrean deset stretches on for miles. It is hot and you start to\
sweat almost immediatly. You can see the odd cactus here and there,\
as well as  the odd corpino scurrying past you in search of some\
shade. The relentless sun beats down on you neck causeing you to\
start gasping for some water, it is a wonder how anything could\
possibly live in such a harsh enviornment, but then again the\
gamorreans are a harsh people. \
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28026] = 
      {
         Tunnel = 0, 
         Vnum = 28026, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 28027, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 28028, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "southwest", 
               DestinationVnum = 28025, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "Deep in the Gamorr Desert.", 
         Description = "The Gamorrean deset stretches on for miles. It is hot and you start to\
sweat almost immediatly. You can see the odd cactus here and there,\
as well as  the odd corpino scurrying past you in search of some\
shade. The relentless sun beats down on you neck causeing you to\
start gasping for some water, it is a wonder how anything could\
possibly live in such a harsh enviornment, but then again the\
gamorreans are a harsh people.\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28027] = 
      {
         Tunnel = 0, 
         Vnum = 28027, 
         Exits = 
         {
         }, 
         Sector = "city", 
         Name = "Lost in The Deserts of Gamorr.", 
         TeleDelay = 0, 
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
         TeleVnum = 0, 
         Flags = 
         {
            [1] = "_Reserved", 
            [2] = "NoMob", 
         }, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28028] = 
      {
         Tunnel = 0, 
         Vnum = 28028, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 28029, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 28030, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 28026, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "The Land of no Return.", 
         Description = "You are standing in the infamous land of no return. It would be in\
your best interests to turn back now, it has earned its name and has\
never give up any of its helpless wonderers, and anyone who dares to\
enter find out fast how deadly the sink holes can be and even the\
desert creatures seem to be avoiding this area it would be a good\
idea if you followed their example. \
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28029] = 
      {
         Tunnel = 0, 
         Vnum = 28029, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 28028, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "down", 
               DestinationVnum = 28131, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "A SINK HOLE!!", 
         TeleDelay = 0, 
         Description = "You are standing on the soft sands of the land of no return. The gound\
seems to open up  right under you and you start to slowly sink down.\
You try to grasp for something  but there is nothing to hold except\
for the sand itself. You life flashes before your eyes. the sand is\
now up to your neck, it slowly move to your chin and eventually your\
mouth where you ingest a mouthful. You try to gasp for breath but\
fill you lungs with the hot sands.\
", 
         TeleVnum = 0, 
         Flags = 
         {
            [24] = "NoFloor", 
         }, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28030] = 
      {
         Tunnel = 0, 
         Vnum = 28030, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 28028, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "Sands of the soft Sink Holes.", 
         Description = "You are standing in the infamous land of no return. It would be in\
your best interests to turn back now, it has earned its name and has\
never give up any of its helpless wonderers, and anyone who dares to\
enter find out fast how deadly the sink holes can be and even the\
desert creatures seem to be avoiding this area it would be a good\
idea if you followed their example. \
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28031] = 
      {
         Tunnel = 0, 
         Vnum = 28031, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 28005, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "Mine Tunnel", 
         TeleDelay = 0, 
         Description = "The tunnel end abruptly, and the stench from the gurda has filled the\
tunnel with a mind numbing sickening smell that makes you wanna blow\
chunks everywhere, to think that the gamorreans wear the gurdas skin as a\
prize, The tunnel itself is realy to dark to make heads or tails of what\
might be on the walls, from what you can tell  its just cuts made from the\
tools of mining.\
", 
         TeleVnum = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28032] = 
      {
         Tunnel = 0, 
         Vnum = 28032, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 28006, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "Short tunnel.", 
         TeleDelay = 0, 
         Description = "The tunnel end abruptly, and the stench from the gurda has filled the\
tunnel with a mind numbing sickening smell that makes you wanna blow\
chunks everywhere, to think that the gamorreans wear the gurdas skin as a\
prize, The tunnel itself is realy to dark to make heads or tails of what\
might be on the walls, from what you can tell  its just cuts made from the\
tools of mining.\
", 
         TeleVnum = 0, 
         Flags = 
         {
            [0] = "Dark", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28033] = 
      {
         Tunnel = 0, 
         Vnum = 28033, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 28034, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 28007, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "Long tunnel.", 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
         Flags = 
         {
            [0] = "Dark", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28034] = 
      {
         Tunnel = 0, 
         Vnum = 28034, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 28035, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 28033, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "More of the Tunnel.", 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
         Flags = 
         {
            [0] = "Dark", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28035] = 
      {
         Tunnel = 0, 
         Vnum = 28035, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 28034, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "End of the Tunnel.", 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
         Flags = 
         {
            [0] = "Dark", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28036] = 
      {
         Tunnel = 0, 
         Vnum = 28036, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 28019, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "mud hole", 
               Flags = 
               {
                  [17] = "CanEnter", 
                  [11] = "Hidden", 
               }, 
               Description = "", 
               Distance = 0, 
               Direction = "somewhere", 
               DestinationVnum = 28170, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "Small Clearing.", 
         TeleDelay = 0, 
         Description = "The small clearing has a rather large mudhole in it that the gamorreans\
have classified as the sacred land, where no fighting can take place. They\
come here to relax and heal there sore and swollen muscles after a hard\
days battle. The place smells like a sewer on coruscant, but it does look\
inviting.\
", 
         TeleVnum = 0, 
         Flags = 
         {
            [10] = "Safe", 
         }, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28037] = 
      {
         Tunnel = 0, 
         Vnum = 28037, 
         Exits = 
         {
         }, 
         Sector = "city", 
         Name = "Large Mud Hole.", 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28038] = 
      {
         Tunnel = 0, 
         Vnum = 28038, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 28011, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "ship zicreex", 
               Flags = 
               {
                  [17] = "CanEnter", 
                  [11] = "Hidden", 
               }, 
               Description = "", 
               Distance = 0, 
               Direction = "somewhere", 
               DestinationVnum = 28181, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "Landing Area", 
         TeleDelay = 0, 
         Description = "The landing area is rather large, it looks as though it can hold and\
Imperial Star Destroyer, but how often do you see that. The area has\
the odd small cargo ship parked here and there as well as one or two\
stock light freighters loading and unloading so stuff you don't want\
to get involved with. You even see a ship loading a couple of infant\
Gamorrean watch-beasts with extream caution\
", 
         TeleVnum = 0, 
         Flags = 
         {
            [4] = "CanLand", 
         }, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28054] = 
      {
         Tunnel = 0, 
         Vnum = 28054, 
         Exits = 
         {
         }, 
         Sector = "city", 
         Name = "Floating in a void", 
         TeleDelay = 0, 
         Description = "", 
         TeleVnum = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28100] = 
      {
         Tunnel = 0, 
         Vnum = 28100, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 28103, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 28008, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "up", 
               DestinationVnum = 28101, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "The Huntbird.", 
         TeleDelay = 0, 
         Description = "You stand in the entrance to the Wreckage of the Huntbird\
Its is a rather large hunk of junk that even thought its\
real old it seems to be holding up to the elements of the \
planet and has not rusted through. In here you will find\
all the comforts you will need to get rested and or hide\
from aggressive natives or evil visitor that might want\
to do you some harm, don't worry your safe here.\
", 
         TeleVnum = 0, 
         Flags = 
         {
            [10] = "Safe", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28101] = 
      {
         Tunnel = 0, 
         Vnum = 28101, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "door", 
               Description = "", 
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 28102, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "down", 
               DestinationVnum = 28100, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "Upperdeck of the Huntbird.", 
         TeleDelay = 0, 
         Description = "The Upperdeck of the wreck is, well, boring, the walls are empty\
except for the dust the is creatively decorated with finger \
prints and writting simply stateing \"WASH ME!\" other then \
that this is one barren place.\
", 
         TeleVnum = 0, 
         Flags = 
         {
            [10] = "Safe", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28102] = 
      {
         Tunnel = 0, 
         Vnum = 28102, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "door", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Description = "", 
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 28101, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "Cockpit.", 
         TeleDelay = 0, 
         Description = "Through the cockpit window, you can see for miles, well you\
would be able to if that mountain wasn't in the way! But it \
looks to be a very beautiful planet with lush vegitation\
a desert in the distance and an old man sitting on the floor \
watching everything you do with hauntingly knowing eyes.\
", 
         TeleVnum = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28103] = 
      {
         Tunnel = 0, 
         Vnum = 28103, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 28108, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 28104, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 28100, 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 28107, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "Village Street.", 
         Description = "You wonder through the village streets wondering where to go\
the sight here are very pleasant to thte eye, well it would be\
if the Gamorreans would stop fighting to keep the places looking \
helf descent, but other then that the sights here are very \
pleaseing to the eye. The street carries on to the north, east\
and west or you can go south back to the Huntbird.\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28104] = 
      {
         Tunnel = 0, 
         Vnum = 28104, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 28105, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 28121, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 28103, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "Village street.", 
         Description = "You wonder through the village streets wondering where to go the sight\
here are very pleasant to thte eye, well it would be if the\
Gamorreans would stop fighting to keep the places looking  helf\
descent, but other then that the sights here are very  pleaseing to\
the eye. The street carries on the the south and back to the west, to\
the north is a gamorrean house.\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28105] = 
      {
         Tunnel = 0, 
         Vnum = 28105, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 28106, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 28104, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "Gamorrean House Hold.", 
         Description = "", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28106] = 
      {
         Tunnel = 0, 
         Vnum = 28106, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 28105, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "Backroom.", 
         Description = "", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28107] = 
      {
         Tunnel = 0, 
         Vnum = 28107, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 28103, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "Black Smithy and Leather Workshop.", 
         TeleDelay = 0, 
         Description = "You are standing in the the Black smith and leather work shop of the\
village. The smell of burning metals and drying hides fills the air\
in a sickening mixture of sents. There is the shop owner standing\
in the corner of the smithy looking over at some of the things she\
crafted.\
", 
         TeleVnum = 0, 
         Flags = 
         {
            [7] = "NoMagic", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28108] = 
      {
         Tunnel = 0, 
         Vnum = 28108, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 28109, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 28112, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 28103, 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 28111, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "Village Street.", 
         Description = "Wondering through the street, the strong smell of the male half of\
the Gamorrean race hits your nose like a ton of bricks. It is a \
very strong smell of urine as well as some other stench you really\
aren't to interested in finding out its origins. The street travels\
east, west and north as well as the way you came.\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28109] = 
      {
         Tunnel = 0, 
         Vnum = 28109, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 28110, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 28108, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "Village Street.", 
         Description = "The smell from the house you just past still makes your eyes burn,\
The street keeps going north and south but up ahead you notice it\
bend to the southwest. You are unable to see past that distance\
due to the houses and huts blocking your view. You just hope where\
ever this road leads you its to a place that smells better then this\
this village, then again nothing could smell worse then this.\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28110] = 
      {
         Tunnel = 0, 
         Vnum = 28110, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 28109, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "southwest", 
               DestinationVnum = 28186, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "Village Street.", 
         Description = "The street doesn't appear to be well used. There are no surounding\
houses or huts that you can see. The area looks to have been abandond\
for some reason that is unknown to you. You can smell the fragrance of\
a variety of different flowers as well as different types of trees, you \
also feel a nice cool breeze brush across your face. Street bends to\
the southwest and leads to a pathway.\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28111] = 
      {
         Tunnel = 0, 
         Vnum = 28111, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 28108, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 28113, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "Village Pathway.", 
         Description = "This pathways seems to be well used by the gammoreans of this tribe.\
You are thankfull that you have gotten away from the fowl odur of the\
males and pray to yourself that you never go through torture like\
that again. You can here the sounds from the main part of the village\
off in the distance as well as the wild birds and other animals that\
make the village there home.\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28112] = 
      {
         Tunnel = 0, 
         Vnum = 28112, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 28108, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "A house.", 
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
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28113] = 
      {
         Tunnel = 0, 
         Vnum = 28113, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 28111, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 28117, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 28115, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "Front of The Alpha House.", 
         Description = "You now stand in front of the matrons house of the Plains clan. The\
house is very nice compared to the huts and the other poor excusses\
for houses you've seen so far The trim around the doors and windows\
is a pretty bright pink, the roof is made  of clay that has a pinkish\
hue to it in fact you notice that most of the house is well, pink The\
matron seems to like the colour pink so much that she decided to have\
her house pink after all it is a very femminin colour....\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28114] = 
      {
         Tunnel = 0, 
         Vnum = 28114, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 28115, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "Alpha Nursery.", 
         Description = "This is the Alph-Females nursery. It smells absolutly fowl with these\
babies squirming  around in their little pens, the stench burns you\
nose nad the squealing is giving you a massive headache, though the\
babies do look a little appatising to you you moral judgment is\
telling you not to eat one but you hunger is telling you whet the\
heck why not!\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28115] = 
      {
         Tunnel = 0, 
         Vnum = 28115, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 28116, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 28113, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 28114, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "Alpha House", 
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
            }, 
         }, 
         TeleVnum = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28116] = 
      {
         Tunnel = 0, 
         Vnum = 28116, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 28115, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "Alpha Females Quarters.", 
         Description = "You are standing in the quarters of the Alfa-Female, Ugmush. She is\
well known for her fierceness and she might not be to happy about\
intruders in her home. The house has a semi-pleasent odour to it\
considering the fact that its owned by a Gamorrean. You hear the\
comotion of the children in there bedrooms as well as the  adults\
outside the house.\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28117] = 
      {
         Tunnel = 0, 
         Vnum = 28117, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 28113, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 28118, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "A Pathway in the Village.", 
         Description = "The pathway is hardly used, As you keep walking you can see the mountain is\
the distance getting bigger and bigger as you draw closer to it's base.\
From here you can see the forest crawls up the mountains bottom and\
reaches about one quarter of the way up until it tappers off into a\
spattering of trees here and there.\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28118] = 
      {
         Tunnel = 0, 
         Vnum = 28118, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 28117, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 28119, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "More of the Path", 
         Description = "The pathway is hardly used, As you keep walking you can see the mountain is\
the distance getting bigger and bigger as you draw closer to it's base.\
From here you can see the forest crawls up the mountains bottom and\
reaches about one quarter of the way up until it tappers off into a\
spattering of trees here and there.\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28119] = 
      {
         Tunnel = 0, 
         Vnum = 28119, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 28118, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 28120, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "End of the Path", 
         TeleDelay = 0, 
         Description = "The pathway is hardly used, As you keep walking you can see the mountain is\
the distance getting bigger and bigger as you draw closer to it's base.\
From here you can see the forest crawls up the mountains bottom and\
reaches about one quarter of the way up until it tappers off into a\
spattering of trees here and there.\
", 
         TeleVnum = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28120] = 
      {
         Tunnel = 0, 
         Vnum = 28120, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 28017, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 28137, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 28119, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "In the Forest.", 
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
         TeleVnum = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28121] = 
      {
         Tunnel = 0, 
         Vnum = 28121, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 28104, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 28123, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 28124, 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 28122, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "Village Street.", 
         Description = "Wondering through the streets, you notice to the east and west are \
small huts for the males of the tribe. To the south is more of the\
village street. You also see the streets full of various levels of\
females in the hierarchy of the Gamorrean society, you also notice \
that there is no sign of the Alpha Female anywhere to be seen.\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28122] = 
      {
         Tunnel = 0, 
         Vnum = 28122, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 28121, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "A hut", 
         Description = "This is a small hut. Its main purpose in life is to shealter the \
males from the rain or the harsh rays of the afternoon sun. The Hut\
is made from wood scavenged from the near by forest and held \
together with mud and clay. It is also stune with blankets and \
there is the odd hamock streched out from wall to post here and \
there.\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28123] = 
      {
         Tunnel = 0, 
         Vnum = 28123, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 28121, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "A hut", 
         Description = "This is a small hut. Its main purpose in life is to shealter the \
males from the rain or the harsh rays of the afternoon sun. The Hut\
is made from wood scavenged from the near by forest and held \
together with mud and clay. It is also stune with blankets and \
there is the odd hamock streched out from wall to post here and \
there.\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28124] = 
      {
         Tunnel = 0, 
         Vnum = 28124, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 28121, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 28128, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 28125, 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 28130, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "Village street.", 
         Description = "Wondering through the streets, you notice to the east and west are\
small huts for the males of the tribe. To the south is more of the\
village street. You also see the streets full of various levels of\
females in the hierarchy of the Gamorrean society, you also notice\
that there is no sign of the Alpha Female anywhere to be seen.\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28125] = 
      {
         Tunnel = 0, 
         Vnum = 28125, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 28124, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 28126, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "Village Street.", 
         Description = "Wondering through the streets, you notice to the east and west are\
small huts for the males of the tribe. To the south is more of the\
village street. You also see the streets full of various levels of\
females in the hierarchy of the Gamorrean society, you also notice\
that there is no sign of the Alpha Female anywhere to be seen.\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28126] = 
      {
         Tunnel = 0, 
         Vnum = 28126, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 28125, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 28127, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "End of The road.", 
         TeleDelay = 0, 
         Description = "You stand at the abrupt end of the village road. Seems as the the\
desert is encroching on the main village and probably has been for a\
very long time. You can feel the heat from the desert even from just\
standing at its edge, and it looks very unforgiving to the happless\
wonderer. Roumors have been floating around that some huge beast\
thing lives out in the desert eatting anything and everything it\
wants and its has been known to wander into the village from time to\
time to snatch the odd gamorrean. \
", 
         TeleVnum = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28127] = 
      {
         Tunnel = 0, 
         Vnum = 28127, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 28126, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 28163, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "Out in the desert.", 
         Description = "The Gamorrean deset stretches on for miles. It is hot and you start to\
sweat almost immediatly. You can see the odd cactus here and there,\
as well as  the odd corpino scurrying past you in search of some\
shade. The relentless sun beats down on you neck causeing you to\
start gasping for some water, it is a wonder how anything could\
possibly live in such a harsh enviornment, but then again the\
gamorreans are a harsh people.\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28128] = 
      {
         Tunnel = 0, 
         Vnum = 28128, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 28135, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 28136, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 28129, 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 28124, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "Village path.", 
         Description = "Wondering through the streets, you notice to the east and west are\
small huts for the males of the tribe. To the south is more of the\
village street. You also see the streets full of various levels of\
females in the hierarchy of the Gamorrean society, you also notice\
that there is no sign of the Alpha Female anywhere to be seen.\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28129] = 
      {
         Tunnel = 0, 
         Vnum = 28129, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 28128, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "End of the Village Path.", 
         Description = "", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28130] = 
      {
         Tunnel = 0, 
         Vnum = 28130, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 28124, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 28133, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 28132, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "A path in the village.", 
         Description = "Wondering through the streets, you notice to the east and west are\
small huts for the males of the tribe. To the south is more of the\
village street. You also see the streets full of various levels of\
females in the hierarchy of the Gamorrean society, you also notice\
that there is no sign of the Alpha Female anywhere to be seen. \
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28131] = 
      {
         Tunnel = 0, 
         Vnum = 28131, 
         Exits = 
         {
         }, 
         Sector = "city", 
         Name = "Buried alive", 
         TeleDelay = 0, 
         Description = "You slowly sufficate to death....\
 \
 \
", 
         TeleVnum = 0, 
         Flags = 
         {
            [1] = "_Reserved", 
            [2] = "NoMob", 
         }, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28132] = 
      {
         Tunnel = 0, 
         Vnum = 28132, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 28130, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "A Hut", 
         Description = "This is another small hut. much like the others, its main purpose in\
life is to shealter the boars from the rain or the harsh rays of the\
afternoon sun. The hut is made from wood scavenged from the forest\
perimeter and held together with mud, clay and some what looks like\
leather bindings. It is also strune with blankets and the odd hamock\
stretched from wall to post.\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28133] = 
      {
         Tunnel = 0, 
         Vnum = 28133, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 28130, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "A Hut.", 
         Description = "This is another small hut. much like the others, its main purpose in\
life is to shealter the boars from the rain or the harsh rays of the\
afternoon sun. The hut is made from wood scavenged from the forest\
perimeter and held together with mud, clay and some what looks like\
leather bindings. It is also strune with blankets and the odd hamock\
stretched from wall to post.\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28134] = 
      {
         Tunnel = 0, 
         Vnum = 28134, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 28128, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "A Hut.", 
         Description = "", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28135] = 
      {
         Tunnel = 0, 
         Vnum = 28135, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 28128, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "A Hut.", 
         Description = "This is another small hut. much like the others, its main purpose in\
life is to shealter the boars from the rain or the harsh rays of the\
afternoon sun. The hut is made from wood scavenged from the forest\
perimeter and held together with mud, clay and some what looks like\
leather bindings. It is also strune with blankets and the odd hamock\
stretched from wall to post.\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28136] = 
      {
         Tunnel = 0, 
         Vnum = 28136, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 28128, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "A Hut.", 
         Description = "This is another small hut. much like the others, its main purpose in\
life is to shealter the boars from the rain or the harsh rays of the\
afternoon sun. The hut is made from wood scavenged from the forest\
perimeter and held together with mud, clay and some what looks like\
leather bindings. It is also strune with blankets and the odd hamock\
stretched from wall to post.\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28137] = 
      {
         Tunnel = 0, 
         Vnum = 28137, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 28120, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 28022, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 28138, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "Within the Forest", 
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
         TeleVnum = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28138] = 
      {
         Tunnel = 0, 
         Vnum = 28138, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 28140, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 28137, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "A path in the Forest.", 
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
         TeleVnum = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28139] = 
      {
         Tunnel = 0, 
         Vnum = 28139, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 28120, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "in the Forest.", 
         Description = "", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28140] = 
      {
         Tunnel = 0, 
         Vnum = 28140, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 28141, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 28138, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "More of the Path.", 
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
         TeleVnum = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28141] = 
      {
         Tunnel = 0, 
         Vnum = 28141, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 28142, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 28140, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "Crocked Path.", 
         Description = "The forest seems to go on forever. A slight breeze seduces your nose\
with its beautiful aromas and cool touch. Wild birds, of some kind\
fill  the air with their musical ensamble like you've never heard\
before, but deep in the forest you hear the preditors of the land\
hunting and capturing their prey as well as the prey screaming their\
last breath. \
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28142] = 
      {
         Tunnel = 0, 
         Vnum = 28142, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 28143, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 28141, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "The Paths end.", 
         Description = "The forest seems to go on forever. A slight breeze seduces your nose\
with its beautiful aromas and cool touch. Wild birds, of some kind\
fill the air with their musical ensamble like you've never heard\
before, but deep in the forest you hear the preditors of the land\
hunting and capturing their prey as well as the prey screaming their\
last breath. \
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28143] = 
      {
         Tunnel = 0, 
         Vnum = 28143, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 28144, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 28142, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "A Clearing.", 
         Description = "The forest seems to go on forever. A slight breeze seduces your nose\
with its beautiful aromas and cool touch. Wild birds, of some kind\
fill the air with their musical ensamble like you've never heard\
before, but deep in the forest you hear the preditors of the land\
hunting and capturing their prey as well as the prey screaming their\
last breath. \
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28144] = 
      {
         Tunnel = 0, 
         Vnum = 28144, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 28145, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 28143, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "An Old Path.", 
         TeleDelay = 0, 
         Description = "This clearing leads you straight in to a villages entrance. Of course\
it is swarming with gamorreans and for some stange reason they are\
what is causing the strange noises in most of the forest. With what\
looks like a feast in honour of the Matron herself The smell of\
barbaque and some other thing fill the air with a wierd aroma. \
", 
         TeleVnum = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28145] = 
      {
         Tunnel = 0, 
         Vnum = 28145, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 28146, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 28144, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "Entrance to a Village.", 
         Description = "This is the entrance to the Forest clans village. The entrance is\
guarded by two large coloumns made from a concrete type of matierial\
and stnads at least fifteen feet high and three feet wide. Inside the\
entrance it is swarming with gamorreans and for some strange reason\
they are what is causing the strange noises in most of the forest.\
With what looks like a feast in honour of the Matron herself The\
smell of barbaque and some other thing fill the air with a wierd\
aroma. \
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28146] = 
      {
         Tunnel = 0, 
         Vnum = 28146, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 28145, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 28152, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 28147, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "Village Street.", 
         Description = "The smell from the house you just past still makes your eyes burn, The\
street keeps going north and south but up ahead you notice it bend to\
the southwest. You are unable to see past that distance due to the\
houses and huts blocking your view. You just hope where ever this\
road leads you its to a place that smells better then this this\
village, then again nothing could smell worse then this.\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28147] = 
      {
         Tunnel = 0, 
         Vnum = 28147, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 28146, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 28155, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 28148, 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 28154, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "Village Street.", 
         Description = "The smell from the house you just past still makes your eyes burn, The\
street keeps going north and south but up ahead you notice it bend to\
the southwest. You are unable to see past that distance due to the\
houses and huts blocking your view. You just hope where ever this\
road leads you its to a place that smells better then this this\
village, then again nothing could smell worse then this.\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28148] = 
      {
         Tunnel = 0, 
         Vnum = 28148, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 28147, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 28149, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 28156, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "Village Street.", 
         Description = "The smell from the house you just past still makes your eyes burn, The\
street keeps going north and south but up ahead you notice it bend to\
the southwest. You are unable to see past that distance due to the\
houses and huts blocking your view. You just hope where ever this\
road leads you its to a place that smells better then this this\
village, then again nothing could smell worse then this.\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28149] = 
      {
         Tunnel = 0, 
         Vnum = 28149, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 28148, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 28157, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 28150, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "Village Street.", 
         Description = "The smell from the house you just past still makes your eyes burn, The\
street keeps going north and south but up ahead you notice it bend to\
the southwest. You are unable to see past that distance due to the\
houses and huts blocking your view. You just hope where ever this\
road leads you its to a place that smells better then this this\
village, then again nothing could smell worse then this.\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28150] = 
      {
         Tunnel = 0, 
         Vnum = 28150, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 28149, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 28151, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "A turn in the Village Street.", 
         Description = "The street to the west ends on a semi circle of huts where you presume\
the male gamorreans sleep and gather for there clan war meetings.\
This part of the street turns west to this little ending and from\
there it goes no where but back to the spot. You can return back to\
the east and go back into the heart of the village or head into the\
dead end. \
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28151] = 
      {
         Tunnel = 0, 
         Vnum = 28151, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 28161, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 28150, 
               Key = -1, 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 28160, 
               Key = -1, 
            }, 
            [4] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 28162, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "End of the Village Street.", 
         TeleDelay = 0, 
         Description = "This little semi circle is surrounded by the male gamorreans huts. And\
you can tell by the smell they dont take good care of their living\
quarters, the smell of urine fills the air and burns your nose.\
Though the smell of the forest you were travelling in had such a\
sweet sent to it, the smell from these huts completly cancels out any\
presence of the forest with surrounds the entire village.\
", 
         TeleVnum = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28152] = 
      {
         Tunnel = 0, 
         Vnum = 28152, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 28153, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 28146, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "Small path in the Village.", 
         Description = "This small path leads looks like it leads away from the village and\
straight back into the forest for some unknown reason. maybe its for\
future expansion of the village you have no idea nor do you really\
care. The path leads east and from what you can tell ends right there\
and right back into the forest.\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28153] = 
      {
         Tunnel = 0, 
         Vnum = 28153, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 28152, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "Small path.", 
         Description = "This small path leads looks like it leads away from the village and\
straight back into the forest for some unknown reason. maybe its for\
future expansion of the village you have no idea nor do you really\
care. The path leads east and from what you can tell ends right there\
and right back into the forest.\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28154] = 
      {
         Tunnel = 0, 
         Vnum = 28154, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 28147, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "General Store.", 
         TeleDelay = 0, 
         Description = "This store has all its supplies on the wall behind the counter, to prevent\
slippery little hands from snatching the goods that might have been on\
shelves in the middle of the store.  The gamorrean behind the counter\
doesnt look to pleasent either she looks like she was hit by a swoop and\
draged for a few light years on her face.\
", 
         TeleVnum = 0, 
         Flags = 
         {
            [10] = "Safe", 
         }, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28155] = 
      {
         Tunnel = 0, 
         Vnum = 28155, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "west", 
               DestinationVnum = 28147, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "Water shop.", 
         TeleDelay = 0, 
         Description = "You are standing in the forest clans water supply shop, the funny thing is,\
it seems that the clan members dont have to pay for their water and oddly\
enough the off worlders have to pay the highest prices for something as\
abundent as water. You come the the conclusion the these clan people are\
nothing but crooks. The walls in the shop are lind with different types of\
ancient canteens, this place is almost like a canteen museum.\
", 
         TeleVnum = 0, 
         Flags = 
         {
            [10] = "Safe", 
         }, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28156] = 
      {
         Tunnel = 0, 
         Vnum = 28156, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "east", 
               DestinationVnum = 28148, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "Arms for Sale.", 
         TeleDelay = 0, 
         Description = "These walls are lined with very well crafted axes that look as though the\
gamorrean who crafted them might have taken her time and put alot of care\
into makeing them because they all have real nice intricate designs\
covering the blades and the war hammers look like they could fetch a\
bundle in the black market.  this Gamorrean much like the rest enjoys her\
work and takes alot of pride in what she does and she looks like the type\
of gamorrean that will not hesitate to hack off a hand or two to protect\
her goods.\
", 
         TeleVnum = 0, 
         Flags = 
         {
            [10] = "Safe", 
         }, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28157] = 
      {
         Tunnel = 0, 
         Vnum = 28157, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 28149, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 28158, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "A Wide Path.", 
         Description = "This path is wider then most of the other paths you have encountered thus\
far, to the south you notice that the path comes to an end and leads\
straight to the alpha females house. The path is also loaded with\
gamorreans coming and going to and from the matrons house, paying homage\
and mostly the males are trying to find out when the next mateing battles\
will take place.\
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28158] = 
      {
         Tunnel = 0, 
         Vnum = 28158, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 28157, 
               Key = -1, 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "south", 
               DestinationVnum = 28159, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "End of the path.", 
         Description = "This path is wider then most of the other paths you have encountered thus\
far, to the south you notice that the path comes to an end and leads\
straight to the alpha females house. The path is also loaded with\
gamorreans coming and going to and from the matrons house, paying homage\
and mostly the males are trying to find out when the next mateing battles\
will take place. \
", 
         TeleVnum = 0, 
         TeleDelay = 0, 
         ExtraDescriptions = 
         {
         }, 
      }, 
      [28159] = 
      {
         Tunnel = 0, 
         Vnum = 28159, 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Direction = "north", 
               DestinationVnum = 28158, 
               Key = -1, 
            }, 
         }, 
         Sector = "city", 
         Name = "House of the Alfa female.", 
         TeleDelay = 0, 
         Description = "This is the home of the matron, the house is made a little better then the\
other huts made from stick and such, this one is made from trees that were\
cut into palnks and held together with mud and nails and its real sturdy\
which is the obvious reason why the matron has made it her home.\
", 
         TeleVnum = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         ExtraDescriptions = 
         {
         }, 
      }, 
   }, 
   Name = "Gamorr", 
   VnumRanges = 
   {
      Room = 
      {
         First = 28000, 
         Last = 28199, 
      }, 
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
   }, 
   Resets = 
   {
      [1] = 
      {
         Command = "M", 
         Arg2 = 41, 
         Arg3 = 28000, 
         Arg1 = 28001, 
         MiscData = 1, 
      }, 
      [2] = 
      {
         Command = "M", 
         Arg2 = 41, 
         Arg3 = 28000, 
         Arg1 = 28001, 
         MiscData = 1, 
      }, 
      [3] = 
      {
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 28003, 
         Arg1 = 28015, 
         MiscData = 1, 
      }, 
      [4] = 
      {
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 28010, 
         Arg1 = 28010, 
         MiscData = 1, 
      }, 
      [5] = 
      {
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 16, 
         Arg1 = 28012, 
         MiscData = 1, 
      }, 
      [6] = 
      {
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 28014, 
         Arg1 = 28020, 
         MiscData = 1, 
      }, 
      [7] = 
      {
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 28015, 
         Arg1 = 28021, 
         MiscData = 1, 
      }, 
      [8] = 
      {
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 28016, 
         Arg1 = 28011, 
         MiscData = 1, 
      }, 
      [9] = 
      {
         Arg1 = 32253, 
         Command = "G", 
         Arg2 = 1, 
         MiscData = 1, 
      }, 
      [10] = 
      {
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 28023, 
         Arg1 = 28003, 
         MiscData = 1, 
      }, 
      [11] = 
      {
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 28023, 
         Arg1 = 28013, 
         MiscData = 1, 
      }, 
      [12] = 
      {
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 28023, 
         Arg1 = 28014, 
         MiscData = 1, 
      }, 
      [13] = 
      {
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 28031, 
         Arg1 = 28006, 
         MiscData = 1, 
      }, 
      [14] = 
      {
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 28031, 
         Arg1 = 28001, 
         MiscData = 1, 
      }, 
      [15] = 
      {
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 28036, 
         Arg1 = 28027, 
         MiscData = 1, 
      }, 
      [16] = 
      {
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 28102, 
         Arg1 = 28000, 
         MiscData = 1, 
      }, 
      [17] = 
      {
         Command = "D", 
         Arg2 = 1, 
         Arg3 = 0, 
         Arg1 = 28102, 
         MiscData = 0, 
      }, 
      [18] = 
      {
         Command = "M", 
         Arg2 = 10, 
         Arg3 = 28103, 
         Arg1 = 28013, 
         MiscData = 1, 
      }, 
      [19] = 
      {
         Command = "M", 
         Arg2 = 4, 
         Arg3 = 28103, 
         Arg1 = 28002, 
         MiscData = 1, 
      }, 
      [20] = 
      {
         Command = "M", 
         Arg2 = 41, 
         Arg3 = 28103, 
         Arg1 = 28001, 
         MiscData = 1, 
      }, 
      [21] = 
      {
         Command = "M", 
         Arg2 = 10, 
         Arg3 = 28103, 
         Arg1 = 28013, 
         MiscData = 1, 
      }, 
      [22] = 
      {
         Command = "M", 
         Arg2 = 41, 
         Arg3 = 28106, 
         Arg1 = 28001, 
         MiscData = 1, 
      }, 
      [23] = 
      {
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 28107, 
         Arg1 = 28107, 
         MiscData = 1, 
      }, 
      [24] = 
      {
         Arg1 = 28003, 
         Command = "G", 
         Arg2 = 1, 
         MiscData = 1, 
      }, 
      [25] = 
      {
         Arg1 = 28016, 
         Command = "G", 
         Arg2 = 1, 
         MiscData = 1, 
      }, 
      [26] = 
      {
         Arg1 = 28015, 
         Command = "G", 
         Arg2 = 1, 
         MiscData = 1, 
      }, 
      [27] = 
      {
         Arg1 = 28017, 
         Command = "G", 
         Arg2 = 1, 
         MiscData = 1, 
      }, 
      [28] = 
      {
         Arg1 = 28011, 
         Command = "G", 
         Arg2 = 1, 
         MiscData = 1, 
      }, 
      [29] = 
      {
         Command = "M", 
         Arg2 = 4, 
         Arg3 = 28112, 
         Arg1 = 28002, 
         MiscData = 1, 
      }, 
      [30] = 
      {
         Command = "M", 
         Arg2 = 41, 
         Arg3 = 28113, 
         Arg1 = 28001, 
         MiscData = 1, 
      }, 
      [31] = 
      {
         Command = "M", 
         Arg2 = 4, 
         Arg3 = 28113, 
         Arg1 = 28002, 
         MiscData = 1, 
      }, 
      [32] = 
      {
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 28114, 
         Arg1 = 28001, 
         MiscData = 1, 
      }, 
      [33] = 
      {
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 28116, 
         Arg1 = 28116, 
         MiscData = 1, 
      }, 
      [34] = 
      {
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 5, 
         Arg1 = 28008, 
         MiscData = 1, 
      }, 
      [35] = 
      {
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 6, 
         Arg1 = 28019, 
         MiscData = 1, 
      }, 
      [36] = 
      {
         Command = "M", 
         Arg2 = 10, 
         Arg3 = 28117, 
         Arg1 = 28013, 
         MiscData = 1, 
      }, 
      [37] = 
      {
         Command = "M", 
         Arg2 = 10, 
         Arg3 = 28117, 
         Arg1 = 28013, 
         MiscData = 1, 
      }, 
      [38] = 
      {
         Command = "M", 
         Arg2 = 10, 
         Arg3 = 28117, 
         Arg1 = 28013, 
         MiscData = 1, 
      }, 
      [39] = 
      {
         Command = "M", 
         Arg2 = 4, 
         Arg3 = 28118, 
         Arg1 = 28002, 
         MiscData = 1, 
      }, 
      [40] = 
      {
         Command = "M", 
         Arg2 = 41, 
         Arg3 = 28121, 
         Arg1 = 28001, 
         MiscData = 1, 
      }, 
      [41] = 
      {
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 28122, 
         Arg1 = 28005, 
         MiscData = 1, 
      }, 
      [42] = 
      {
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 16, 
         Arg1 = 28189, 
         MiscData = 1, 
      }, 
      [43] = 
      {
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 5, 
         Arg1 = 28010, 
         MiscData = 1, 
      }, 
      [44] = 
      {
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 6, 
         Arg1 = 28015, 
         MiscData = 1, 
      }, 
      [45] = 
      {
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 8, 
         Arg1 = 28016, 
         MiscData = 1, 
      }, 
      [46] = 
      {
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 14, 
         Arg1 = 28017, 
         MiscData = 1, 
      }, 
      [47] = 
      {
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 15, 
         Arg1 = 28017, 
         MiscData = 1, 
      }, 
      [48] = 
      {
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 13, 
         Arg1 = 28011, 
         MiscData = 1, 
      }, 
      [49] = 
      {
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 3, 
         Arg1 = 28024, 
         MiscData = 1, 
      }, 
      [50] = 
      {
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 4, 
         Arg1 = 28024, 
         MiscData = 1, 
      }, 
      [51] = 
      {
         Command = "M", 
         Arg2 = 41, 
         Arg3 = 28122, 
         Arg1 = 28001, 
         MiscData = 1, 
      }, 
      [52] = 
      {
         Command = "M", 
         Arg2 = 10, 
         Arg3 = 28123, 
         Arg1 = 28013, 
         MiscData = 1, 
      }, 
      [53] = 
      {
         Command = "M", 
         Arg2 = 41, 
         Arg3 = 28124, 
         Arg1 = 28001, 
         MiscData = 1, 
      }, 
      [54] = 
      {
         Command = "M", 
         Arg2 = 10, 
         Arg3 = 28125, 
         Arg1 = 28013, 
         MiscData = 1, 
      }, 
      [55] = 
      {
         Command = "M", 
         Arg2 = 10, 
         Arg3 = 28130, 
         Arg1 = 28013, 
         MiscData = 1, 
      }, 
      [56] = 
      {
         Command = "M", 
         Arg2 = 10, 
         Arg3 = 28131, 
         Arg1 = 28013, 
         MiscData = 1, 
      }, 
      [57] = 
      {
         Command = "M", 
         Arg2 = 10, 
         Arg3 = 28131, 
         Arg1 = 28013, 
         MiscData = 1, 
      }, 
      [58] = 
      {
         Command = "M", 
         Arg2 = 41, 
         Arg3 = 28133, 
         Arg1 = 28001, 
         MiscData = 1, 
      }, 
      [59] = 
      {
         Command = "M", 
         Arg2 = 41, 
         Arg3 = 28145, 
         Arg1 = 28001, 
         MiscData = 1, 
      }, 
      [60] = 
      {
         Command = "M", 
         Arg2 = 41, 
         Arg3 = 28150, 
         Arg1 = 28001, 
         MiscData = 1, 
      }, 
      [61] = 
      {
         Command = "M", 
         Arg2 = 41, 
         Arg3 = 28150, 
         Arg1 = 28001, 
         MiscData = 1, 
      }, 
      [62] = 
      {
         Command = "M", 
         Arg2 = 41, 
         Arg3 = 28151, 
         Arg1 = 28001, 
         MiscData = 1, 
      }, 
      [63] = 
      {
         Command = "M", 
         Arg2 = 41, 
         Arg3 = 28151, 
         Arg1 = 28001, 
         MiscData = 1, 
      }, 
      [64] = 
      {
         Command = "M", 
         Arg2 = 41, 
         Arg3 = 28151, 
         Arg1 = 28001, 
         MiscData = 1, 
      }, 
      [65] = 
      {
         Command = "M", 
         Arg2 = 41, 
         Arg3 = 28151, 
         Arg1 = 28001, 
         MiscData = 1, 
      }, 
      [66] = 
      {
         Command = "M", 
         Arg2 = 41, 
         Arg3 = 28151, 
         Arg1 = 28001, 
         MiscData = 1, 
      }, 
      [67] = 
      {
         Command = "M", 
         Arg2 = 41, 
         Arg3 = 28151, 
         Arg1 = 28001, 
         MiscData = 1, 
      }, 
      [68] = 
      {
         Command = "M", 
         Arg2 = 41, 
         Arg3 = 28151, 
         Arg1 = 28001, 
         MiscData = 1, 
      }, 
      [69] = 
      {
         Command = "M", 
         Arg2 = 41, 
         Arg3 = 28151, 
         Arg1 = 28001, 
         MiscData = 1, 
      }, 
      [70] = 
      {
         Command = "M", 
         Arg2 = 41, 
         Arg3 = 28152, 
         Arg1 = 28001, 
         MiscData = 1, 
      }, 
      [71] = 
      {
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 28154, 
         Arg1 = 28018, 
         MiscData = 1, 
      }, 
      [72] = 
      {
         Arg1 = 10313, 
         Command = "G", 
         Arg2 = 1, 
         MiscData = 1, 
      }, 
      [73] = 
      {
         Arg1 = 25, 
         Command = "G", 
         Arg2 = 1, 
         MiscData = 1, 
      }, 
      [74] = 
      {
         Arg1 = 10317, 
         Command = "G", 
         Arg2 = 1, 
         MiscData = 1, 
      }, 
      [75] = 
      {
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 28155, 
         Arg1 = 28017, 
         MiscData = 1, 
      }, 
      [76] = 
      {
         Arg1 = 32253, 
         Command = "G", 
         Arg2 = 1, 
         MiscData = 1, 
      }, 
      [77] = 
      {
         Arg1 = 10314, 
         Command = "G", 
         Arg2 = 1, 
         MiscData = 1, 
      }, 
      [78] = 
      {
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 28156, 
         Arg1 = 28019, 
         MiscData = 1, 
      }, 
      [79] = 
      {
         Arg1 = 28020, 
         Command = "G", 
         Arg2 = 1, 
         MiscData = 1, 
      }, 
      [80] = 
      {
         Arg1 = 28004, 
         Command = "G", 
         Arg2 = 1, 
         MiscData = 1, 
      }, 
      [81] = 
      {
         Arg1 = 28006, 
         Command = "G", 
         Arg2 = 1, 
         MiscData = 1, 
      }, 
      [82] = 
      {
         Command = "M", 
         Arg2 = 41, 
         Arg3 = 28156, 
         Arg1 = 28001, 
         MiscData = 1, 
      }, 
      [83] = 
      {
         Command = "M", 
         Arg2 = 41, 
         Arg3 = 28156, 
         Arg1 = 28001, 
         MiscData = 1, 
      }, 
      [84] = 
      {
         Command = "M", 
         Arg2 = 41, 
         Arg3 = 28157, 
         Arg1 = 28001, 
         MiscData = 1, 
      }, 
      [85] = 
      {
         Command = "M", 
         Arg2 = 41, 
         Arg3 = 28158, 
         Arg1 = 28001, 
         MiscData = 1, 
      }, 
      [86] = 
      {
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 28159, 
         Arg1 = 28023, 
         MiscData = 1, 
      }, 
      [87] = 
      {
         Command = "M", 
         Arg2 = 41, 
         Arg3 = 28160, 
         Arg1 = 28001, 
         MiscData = 1, 
      }, 
      [88] = 
      {
         Command = "M", 
         Arg2 = 41, 
         Arg3 = 28160, 
         Arg1 = 28001, 
         MiscData = 1, 
      }, 
      [89] = 
      {
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 28168, 
         Arg1 = 28004, 
         MiscData = 1, 
      }, 
      [90] = 
      {
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 28168, 
         Arg1 = 28007, 
         MiscData = 1, 
      }, 
      [91] = 
      {
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 28181, 
         Arg1 = 28012, 
         MiscData = 1, 
      }, 
      [92] = 
      {
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 6, 
         Arg1 = 28015, 
         MiscData = 1, 
      }, 
      [93] = 
      {
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 8, 
         Arg1 = 28016, 
         MiscData = 1, 
      }, 
      [94] = 
      {
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 14, 
         Arg1 = 28017, 
         MiscData = 1, 
      }, 
      [95] = 
      {
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 13, 
         Arg1 = 28011, 
         MiscData = 1, 
      }, 
      [96] = 
      {
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 15, 
         Arg1 = 28017, 
         MiscData = 1, 
      }, 
      [97] = 
      {
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 5, 
         Arg1 = 28009, 
         MiscData = 1, 
      }, 
      [98] = 
      {
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 3, 
         Arg1 = 28024, 
         MiscData = 1, 
      }, 
      [99] = 
      {
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 4, 
         Arg1 = 28024, 
         MiscData = 1, 
      }, 
      [100] = 
      {
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 16, 
         Arg1 = 28025, 
         MiscData = 1, 
      }, 
      [101] = 
      {
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 28183, 
         Arg1 = 28026, 
         MiscData = 1, 
      }, 
      [102] = 
      {
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 28186, 
         Arg1 = 28009, 
         MiscData = 1, 
      }, 
      [103] = 
      {
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 5, 
         Arg1 = 28008, 
         MiscData = 1, 
      }, 
      [104] = 
      {
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 13, 
         Arg1 = 28011, 
         MiscData = 1, 
      }, 
      [105] = 
      {
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 6, 
         Arg1 = 28015, 
         MiscData = 1, 
      }, 
      [106] = 
      {
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 8, 
         Arg1 = 28016, 
         MiscData = 1, 
      }, 
      [107] = 
      {
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 14, 
         Arg1 = 28017, 
         MiscData = 1, 
      }, 
      [108] = 
      {
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 3, 
         Arg1 = 28120, 
         MiscData = 1, 
      }, 
      [109] = 
      {
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 15, 
         Arg1 = 28017, 
         MiscData = 1, 
      }, 
      [110] = 
      {
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 16, 
         Arg1 = 28020, 
         MiscData = 1, 
      }, 
      [111] = 
      {
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 18, 
         Arg1 = 28020, 
         MiscData = 1, 
      }, 
      [112] = 
      {
         Command = "M", 
         Arg2 = 41, 
         Arg3 = 28189, 
         Arg1 = 28001, 
         MiscData = 1, 
      }, 
      [113] = 
      {
         Command = "M", 
         Arg2 = 41, 
         Arg3 = 28191, 
         Arg1 = 28001, 
         MiscData = 1, 
      }, 
      [114] = 
      {
         Command = "M", 
         Arg2 = 41, 
         Arg3 = 28191, 
         Arg1 = 28001, 
         MiscData = 1, 
      }, 
      [115] = 
      {
         Command = "M", 
         Arg2 = 41, 
         Arg3 = 28193, 
         Arg1 = 28001, 
         MiscData = 1, 
      }, 
      [116] = 
      {
         Command = "M", 
         Arg2 = 41, 
         Arg3 = 28195, 
         Arg1 = 28001, 
         MiscData = 1, 
      }, 
      [117] = 
      {
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 28196, 
         Arg1 = 28016, 
         MiscData = 1, 
      }, 
      [118] = 
      {
         Command = "M", 
         Arg2 = 41, 
         Arg3 = 28196, 
         Arg1 = 28001, 
         MiscData = 1, 
      }, 
      [119] = 
      {
         Command = "M", 
         Arg2 = 41, 
         Arg3 = 28196, 
         Arg1 = 28001, 
         MiscData = 1, 
      }, 
      [120] = 
      {
         Command = "M", 
         Arg2 = 41, 
         Arg3 = 28196, 
         Arg1 = 28001, 
         MiscData = 1, 
      }, 
      [121] = 
      {
         Command = "M", 
         Arg2 = 41, 
         Arg3 = 28197, 
         Arg1 = 28001, 
         MiscData = 1, 
      }, 
      [122] = 
      {
         Command = "M", 
         Arg2 = 41, 
         Arg3 = 28197, 
         Arg1 = 28001, 
         MiscData = 1, 
      }, 
      [123] = 
      {
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 28197, 
         Arg1 = 28014, 
         MiscData = 1, 
      }, 
      [124] = 
      {
         Command = "M", 
         Arg2 = 41, 
         Arg3 = 28198, 
         Arg1 = 28001, 
         MiscData = 1, 
      }, 
      [125] = 
      {
         Command = "M", 
         Arg2 = 41, 
         Arg3 = 28198, 
         Arg1 = 28001, 
         MiscData = 1, 
      }, 
      [126] = 
      {
         Command = "M", 
         Arg2 = 41, 
         Arg3 = 28198, 
         Arg1 = 28001, 
         MiscData = 1, 
      }, 
      [127] = 
      {
         Command = "M", 
         Arg2 = 41, 
         Arg3 = 28198, 
         Arg1 = 28001, 
         MiscData = 1, 
      }, 
      [128] = 
      {
         Command = "M", 
         Arg2 = 30, 
         Arg3 = 28003, 
         Arg1 = 28025, 
         MiscData = 0, 
      }, 
      [129] = 
      {
         Command = "M", 
         Arg2 = 30, 
         Arg3 = 28128, 
         Arg1 = 28025, 
         MiscData = 0, 
      }, 
      [130] = 
      {
         Command = "M", 
         Arg2 = 30, 
         Arg3 = 28148, 
         Arg1 = 28025, 
         MiscData = 0, 
      }, 
      [131] = 
      {
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 28038, 
         Arg1 = 28021, 
         MiscData = 1, 
      }, 
      [132] = 
      {
         Command = "P", 
         Arg2 = 1, 
         Arg3 = 0, 
         Arg1 = 28022, 
         MiscData = 0, 
      }, 
      [133] = 
      {
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 28038, 
         Arg1 = 28023, 
         MiscData = 1, 
      }, 
   }, 
   HighEconomy = 0, 
   Mobiles = 
   {
      [28000] = 
      {
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "greet_prog", 
               Code = "smile\
'Hello, welcome to my home\
", 
               Arguments = "100", 
            }, 
         }, 
         Sex = "undistinguished", 
         Credits = 5000, 
         ShortDescr = "A Strange man ", 
         DamRoll = 5, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         HitRoll = 5, 
         Description = "", 
         ArmorClass = -50, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Position = "standing", 
         Race = "Human", 
         Alignment = 1000, 
         Weight = 0, 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
               [18] = "_clan", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [18] = "_clan", 
            }, 
         }, 
         DefaultPosition = "standing", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         Stats = 
         {
            Charisma = 0, 
            Wisdom = 0, 
            Strength = 0, 
            Luck = 0, 
            Force = 0, 
            Dexterity = 0, 
            Constitution = 0, 
            Intelligence = 0, 
         }, 
         Name = "A Strange man ", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         LongDescr = "A strange man is sitting here meditating.\
", 
         Height = 0, 
         NumberOfAttacks = 3, 
         Vnum = 28000, 
         Level = 100, 
      }, 
      [28001] = 
      {
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "fight_prog", 
               Code = "mpechoat $n The Gamorrean head butts you!\
mpechoaround $n The Gamorrean headbutts $n!\
mpdamage $n 15\
", 
               Arguments = "30", 
            }, 
            [2] = 
            {
               MudProgType = "rand_prog", 
               Code = "grunt\
", 
               Arguments = "5", 
            }, 
         }, 
         VipFlags = 
         {
            [7] = "Gamorr", 
         }, 
         Sex = "male", 
         Credits = 0, 
         ShortDescr = "A Gamorrean male", 
         DamRoll = 0, 
         Damage = 
         {
            DamSizeDice = 6, 
            DamPlus = 0, 
            DamNoDice = 2, 
         }, 
         HitRoll = 0, 
         Description = "", 
         ArmorClass = 10, 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         Position = "standing", 
         Race = "Gamorrean", 
         Alignment = 0, 
         Weight = 0, 
         Languages = 
         {
            Speaking = 
            {
               [14] = "gamorrese", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [14] = "gamorrese", 
            }, 
         }, 
         DefaultPosition = "standing", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         Stats = 
         {
            Charisma = 0, 
            Wisdom = 0, 
            Strength = 0, 
            Luck = 0, 
            Force = 0, 
            Dexterity = 0, 
            Constitution = 0, 
            Intelligence = 0, 
         }, 
         Name = "A Gamorrean male", 
         HitChance = 
         {
            HitPlus = 100, 
            HitSizeDice = 10, 
            HitNoDice = 2, 
         }, 
         LongDescr = "A Gamorrean male wanders around here.\
", 
         Height = 0, 
         NumberOfAttacks = 2, 
         Vnum = 28001, 
         Level = 10, 
      }, 
      [28002] = 
      {
         Sex = "male", 
         Credits = 0, 
         ShortDescr = "A Gamorrean child", 
         DamRoll = 0, 
         Damage = 
         {
            DamSizeDice = 3, 
            DamPlus = 3, 
            DamNoDice = 1, 
         }, 
         HitRoll = 0, 
         Description = "", 
         ArmorClass = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [7] = "Wimpy", 
         }, 
         Position = "standing", 
         Race = "Gamorrean", 
         Alignment = 0, 
         Weight = 0, 
         Languages = 
         {
            Speaking = 
            {
               [14] = "gamorrese", 
            }, 
            Speaks = 
            {
               [14] = "gamorrese", 
            }, 
         }, 
         DefaultPosition = "standing", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         Stats = 
         {
            Charisma = 0, 
            Wisdom = 0, 
            Strength = 0, 
            Luck = 0, 
            Force = 0, 
            Dexterity = 0, 
            Constitution = 0, 
            Intelligence = 0, 
         }, 
         Name = "gamorrean child kid piglet", 
         HitChance = 
         {
            HitPlus = 30, 
            HitSizeDice = 1, 
            HitNoDice = 1, 
         }, 
         LongDescr = "A Gamorrean child is playing around here\
", 
         Height = 0, 
         NumberOfAttacks = 1, 
         Vnum = 28002, 
         Level = 1, 
      }, 
      [28003] = 
      {
         Sex = "undistinguished", 
         Credits = 0, 
         ShortDescr = "A Gamorreans watch-beast", 
         DamRoll = 10, 
         Damage = 
         {
            DamSizeDice = 6, 
            DamPlus = 6, 
            DamNoDice = 6, 
         }, 
         HitRoll = 15, 
         Description = "You've heard about these guys they are nothing to be messed with, they\
are cunning evil and like to eat living flesh. nothing on this planet\
has the same reputation as the watch-beast so watch you step it could\
be you last!\
 \
", 
         ArmorClass = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [5] = "Aggressive", 
         }, 
         Position = "standing", 
         Race = "Gamorrean", 
         Alignment = 0, 
         Weight = 0, 
         Languages = 
         {
            Speaking = 
            {
               [14] = "gamorrese", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [14] = "gamorrese", 
            }, 
         }, 
         DefaultPosition = "standing", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         Stats = 
         {
            Charisma = 0, 
            Wisdom = 0, 
            Strength = 0, 
            Luck = 0, 
            Force = 0, 
            Dexterity = 0, 
            Constitution = 0, 
            Intelligence = 0, 
         }, 
         Name = "gamorrean watch beast big pig ", 
         HitChance = 
         {
            HitPlus = 1000, 
            HitSizeDice = 1, 
            HitNoDice = 1, 
         }, 
         LongDescr = "A Gamorreans watch-beast is eatting a freshly killed tourist\
", 
         Height = 0, 
         NumberOfAttacks = 3, 
         Vnum = 28003, 
         Level = 60, 
      }, 
      [28004] = 
      {
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Code = "grow\
", 
               Arguments = "5", 
            }, 
         }, 
         Sex = "undistinguished", 
         Credits = 0, 
         ShortDescr = "a Desert Beitl", 
         DamRoll = 6, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamPlus = 0, 
            DamNoDice = 4, 
         }, 
         HitRoll = 6, 
         Description = "", 
         ArmorClass = 25, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [5] = "Aggressive", 
            [18] = "Mountable", 
         }, 
         Position = "standing", 
         Race = "Human", 
         Alignment = 0, 
         Weight = 0, 
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
         DefaultPosition = "standing", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         Stats = 
         {
            Charisma = 0, 
            Wisdom = 0, 
            Strength = 0, 
            Luck = 0, 
            Force = 0, 
            Dexterity = 0, 
            Constitution = 0, 
            Intelligence = 0, 
         }, 
         Name = "Beitl beast terrible run RUN RUN AWAY", 
         HitChance = 
         {
            HitPlus = 300, 
            HitSizeDice = 10, 
            HitNoDice = 6, 
         }, 
         LongDescr = "A ferocious Desert Beitl is basking in the desert sun.\
", 
         Height = 0, 
         NumberOfAttacks = 0, 
         Vnum = 28004, 
         Level = 30, 
      }, 
      [28005] = 
      {
         Sex = "male", 
         Credits = 420, 
         ShortDescr = "Shushgu", 
         DamRoll = 11, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamPlus = 0, 
            DamNoDice = 11, 
         }, 
         HitRoll = 12, 
         Description = "", 
         ArmorClass = -76, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
         }, 
         Position = "standing", 
         Race = "Gamorrean", 
         Alignment = 0, 
         Weight = 0, 
         Languages = 
         {
            Speaking = 
            {
               [14] = "gamorrese", 
            }, 
            Speaks = 
            {
               [14] = "gamorrese", 
            }, 
         }, 
         DefaultPosition = "standing", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         Stats = 
         {
            Charisma = 0, 
            Wisdom = 0, 
            Strength = 0, 
            Luck = 0, 
            Force = 0, 
            Dexterity = 0, 
            Constitution = 0, 
            Intelligence = 0, 
         }, 
         Name = "boar head shushgu", 
         HitChance = 
         {
            HitPlus = 900, 
            HitSizeDice = 10, 
            HitNoDice = 18, 
         }, 
         LongDescr = "It's Shushgu, One of the Alpha-females Husbands.\
", 
         Height = 0, 
         NumberOfAttacks = 0, 
         Vnum = 28005, 
         Level = 90, 
      }, 
      [28006] = 
      {
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
            }, 
         }, 
         Sex = "undistinguished", 
         Credits = 0, 
         ShortDescr = "A Gurda Beast", 
         DamRoll = 2, 
         Damage = 
         {
            DamSizeDice = 6, 
            DamPlus = 0, 
            DamNoDice = 1, 
         }, 
         HitRoll = 0, 
         Description = "", 
         ArmorClass = 75, 
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
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [5] = "Aggressive", 
         }, 
         Position = "standing", 
         Race = "Human", 
         Alignment = 0, 
         Weight = 0, 
         Stats = 
         {
            Charisma = 0, 
            Wisdom = 0, 
            Strength = 0, 
            Luck = 0, 
            Force = 0, 
            Dexterity = 0, 
            Constitution = 0, 
            Intelligence = 0, 
         }, 
         DefaultPosition = "standing", 
         AttackFlags = 
         {
            [1] = "claws", 
         }, 
         AffectedBy = 
         {
            [1] = "Invisible", 
            [15] = "Sneak", 
            [9] = "Infrared", 
         }, 
         Name = "gurda beast ", 
         Level = 10, 
         LongDescr = "A Gurda Beast is prowling around in the mountain shadows.\
", 
         Height = 0, 
         NumberOfAttacks = 0, 
         Vnum = 28006, 
         HitChance = 
         {
            HitPlus = 100, 
            HitSizeDice = 10, 
            HitNoDice = 2, 
         }, 
      }, 
      [28007] = 
      {
         Sex = "male", 
         Credits = 0, 
         ShortDescr = "An Imperial Stormtrooper", 
         DamRoll = 2, 
         Damage = 
         {
            DamSizeDice = 6, 
            DamPlus = 0, 
            DamNoDice = 1, 
         }, 
         HitRoll = 2, 
         Description = "", 
         ArmorClass = 77, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Position = "standing", 
         Race = "Human", 
         Alignment = 0, 
         Weight = 0, 
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
         DefaultPosition = "standing", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         Stats = 
         {
            Charisma = 0, 
            Wisdom = 0, 
            Strength = 0, 
            Luck = 0, 
            Force = 0, 
            Dexterity = 0, 
            Constitution = 0, 
            Intelligence = 0, 
         }, 
         Name = "Imperial stormtrooper", 
         HitChance = 
         {
            HitPlus = 100, 
            HitSizeDice = 10, 
            HitNoDice = 2, 
         }, 
         LongDescr = "An Imperial Stormtrooper is loading infant Gamorrean watch-beasts\
", 
         Height = 0, 
         NumberOfAttacks = 0, 
         Vnum = 28007, 
         Level = 10, 
      }, 
      [28008] = 
      {
         Sex = "male", 
         Credits = 0, 
         ShortDescr = "An Imperial Stormtrooper", 
         DamRoll = 2, 
         Damage = 
         {
            DamSizeDice = 6, 
            DamPlus = 0, 
            DamNoDice = 1, 
         }, 
         HitRoll = 2, 
         Description = "", 
         ArmorClass = 77, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Position = "standing", 
         Race = "Human", 
         Alignment = 0, 
         Weight = 0, 
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
         DefaultPosition = "standing", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         Stats = 
         {
            Charisma = 0, 
            Wisdom = 0, 
            Strength = 0, 
            Luck = 0, 
            Force = 0, 
            Dexterity = 0, 
            Constitution = 0, 
            Intelligence = 0, 
         }, 
         Name = "Imperial stormtrooper", 
         HitChance = 
         {
            HitPlus = 100, 
            HitSizeDice = 10, 
            HitNoDice = 2, 
         }, 
         LongDescr = "An Imperial Stormtrooper has his blaster aimed at the watch-beasts.\
", 
         Height = 0, 
         NumberOfAttacks = 0, 
         Vnum = 28008, 
         Level = 10, 
      }, 
      [28009] = 
      {
         Sex = "male", 
         Credits = 0, 
         ShortDescr = "Jos", 
         DamRoll = 7, 
         Damage = 
         {
            DamSizeDice = 7, 
            DamPlus = 0, 
            DamNoDice = 4, 
         }, 
         HitRoll = 7, 
         Description = "", 
         ArmorClass = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [25] = "NoKill", 
         }, 
         Position = "standing", 
         Race = "Gamorrean", 
         Alignment = 0, 
         Weight = 0, 
         Languages = 
         {
            Speaking = 
            {
               [14] = "gamorrese", 
            }, 
            Speaks = 
            {
               [14] = "gamorrese", 
            }, 
         }, 
         DefaultPosition = "standing", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         Stats = 
         {
            Charisma = 0, 
            Wisdom = 0, 
            Strength = 0, 
            Luck = 0, 
            Force = 0, 
            Dexterity = 0, 
            Constitution = 0, 
            Intelligence = 0, 
         }, 
         Name = "Jos third husband", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         LongDescr = "Jos, The Alpha-females third Husband\
", 
         Height = 0, 
         NumberOfAttacks = 0, 
         Vnum = 28009, 
         Level = 70, 
      }, 
      [28010] = 
      {
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
            }, 
         }, 
         Sex = "male", 
         Credits = 0, 
         ShortDescr = "A Gamorrean guard", 
         DamRoll = 0, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         HitRoll = 0, 
         Description = "", 
         ArmorClass = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [2] = "Scavenger", 
            [0] = "Npc", 
         }, 
         Position = "standing", 
         Race = "Gamorrean", 
         Alignment = 0, 
         Weight = 0, 
         Languages = 
         {
            Speaking = 
            {
               [14] = "gamorrese", 
            }, 
            Speaks = 
            {
               [14] = "gamorrese", 
            }, 
         }, 
         DefaultPosition = "standing", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         Stats = 
         {
            Charisma = 0, 
            Wisdom = 0, 
            Strength = 0, 
            Luck = 0, 
            Force = 0, 
            Dexterity = 0, 
            Constitution = 0, 
            Intelligence = 0, 
         }, 
         Name = "gamorrean guard", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         LongDescr = "A Gamorrean stands guard here\
", 
         Height = 0, 
         NumberOfAttacks = 0, 
         Vnum = 28010, 
         Level = 1, 
      }, 
      [28011] = 
      {
         Sex = "undistinguished", 
         Credits = 0, 
         ShortDescr = "The shop owner", 
         DamRoll = 0, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         HitRoll = 0, 
         Description = "", 
         ArmorClass = 0, 
         Shop = 
         {
            ProfitBuy = 120, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            KeeperShortDescr = "The shop owner", 
            ProfitSell = 90, 
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Position = "standing", 
         Race = "Human", 
         Alignment = 0, 
         Weight = 0, 
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
         DefaultPosition = "standing", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         Stats = 
         {
            Charisma = 0, 
            Wisdom = 0, 
            Strength = 0, 
            Luck = 0, 
            Force = 0, 
            Dexterity = 0, 
            Constitution = 0, 
            Intelligence = 0, 
         }, 
         Name = "stand owner ", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         LongDescr = "The Small stands owner is selling refreshing drinks here\
", 
         Height = 0, 
         NumberOfAttacks = 0, 
         Vnum = 28011, 
         Level = 1, 
      }, 
      [28012] = 
      {
         Sex = "male", 
         Credits = 240, 
         ShortDescr = "Fruck", 
         DamRoll = 15, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamPlus = 0, 
            DamNoDice = 8, 
         }, 
         HitRoll = 15, 
         Description = "", 
         ArmorClass = -30, 
         Flags = 
         {
            [0] = "Npc", 
            [25] = "NoKill", 
         }, 
         Position = "standing", 
         Race = "Gamorrean", 
         Alignment = 0, 
         Weight = 0, 
         Languages = 
         {
            Speaking = 
            {
               [14] = "gamorrese", 
            }, 
            Speaks = 
            {
               [14] = "gamorrese", 
            }, 
         }, 
         DefaultPosition = "standing", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         Stats = 
         {
            Charisma = 0, 
            Wisdom = 0, 
            Strength = 0, 
            Luck = 0, 
            Force = 0, 
            Dexterity = 0, 
            Constitution = 0, 
            Intelligence = 0, 
         }, 
         Name = "Fruck", 
         HitChance = 
         {
            HitPlus = 100, 
            HitSizeDice = 10, 
            HitNoDice = 10, 
         }, 
         LongDescr = "Fruck is here keeping watch over Ugmush's ship.\
", 
         Height = 0, 
         NumberOfAttacks = 0, 
         Vnum = 28012, 
         Level = 70, 
      }, 
      [28013] = 
      {
         Sex = "undistinguished", 
         Credits = 0, 
         ShortDescr = "a raxe pest", 
         DamRoll = 0, 
         Damage = 
         {
            DamSizeDice = 1, 
            DamPlus = 3, 
            DamNoDice = 3, 
         }, 
         HitRoll = 0, 
         Description = "", 
         ArmorClass = 0, 
         SpecFuns = 
         {
            [0] = "spec_fido", 
         }, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Position = "standing", 
         Race = "Human", 
         Alignment = 0, 
         Weight = 0, 
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
         DefaultPosition = "standing", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         Stats = 
         {
            Charisma = 0, 
            Wisdom = 0, 
            Strength = 0, 
            Luck = 0, 
            Force = 0, 
            Dexterity = 0, 
            Constitution = 0, 
            Intelligence = 0, 
         }, 
         Name = "raxe pest ", 
         HitChance = 
         {
            HitPlus = 30, 
            HitSizeDice = 1, 
            HitNoDice = 1, 
         }, 
         LongDescr = "A raxe pest is scurrying around here.\
", 
         Height = 0, 
         NumberOfAttacks = 0, 
         Vnum = 28013, 
         Level = 3, 
      }, 
      [28014] = 
      {
         Sex = "undistinguished", 
         Credits = 0, 
         ShortDescr = "a zicreex beast ", 
         DamRoll = 0, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamPlus = 0, 
            DamNoDice = 4, 
         }, 
         HitRoll = 0, 
         Description = "This is the Zicreex, well known around Gamorr for its hunting of the\
natives most gamorreans keep a safe distance from these hungry beasts\
and with good reason too the Zicreexs diet mainly consists of\
gamorreans.\
 \
", 
         ArmorClass = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [5] = "Aggressive", 
         }, 
         Position = "standing", 
         Race = "Human", 
         Alignment = 0, 
         Weight = 0, 
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
         DefaultPosition = "standing", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         Stats = 
         {
            Charisma = 0, 
            Wisdom = 0, 
            Strength = 0, 
            Luck = 0, 
            Force = 0, 
            Dexterity = 0, 
            Constitution = 0, 
            Intelligence = 0, 
         }, 
         Name = "zicreex beast", 
         HitChance = 
         {
            HitPlus = 300, 
            HitSizeDice = 10, 
            HitNoDice = 6, 
         }, 
         LongDescr = "A Zicreex beast is on the hunt here.\
", 
         Height = 0, 
         NumberOfAttacks = 0, 
         Vnum = 28014, 
         Level = 30, 
      }, 
      [28015] = 
      {
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
            }, 
         }, 
         VipFlags = 
         {
            [7] = "Gamorr", 
         }, 
         Sex = "female", 
         Credits = 450, 
         ShortDescr = "Shaga", 
         DamRoll = 0, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamPlus = 0, 
            DamNoDice = 11, 
         }, 
         HitRoll = 0, 
         Description = "", 
         ArmorClass = -74, 
         Languages = 
         {
            Speaking = 
            {
               [14] = "gamorrese", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [14] = "gamorrese", 
            }, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Position = "standing", 
         Race = "Gamorrean", 
         Alignment = 0, 
         Weight = 0, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Stats = 
         {
            Charisma = 0, 
            Wisdom = 0, 
            Strength = 0, 
            Luck = 0, 
            Force = 0, 
            Dexterity = 0, 
            Constitution = 0, 
            Intelligence = 0, 
         }, 
         AttackFlags = 
         {
            [9] = "_09", 
            [4] = "punch", 
            [5] = "kick", 
            [6] = "_06", 
            [7] = "_07", 
         }, 
         Name = "shaga mountain matron", 
         HitChance = 
         {
            HitPlus = 900, 
            HitSizeDice = 10, 
            HitNoDice = 18, 
         }, 
         LongDescr = "Shaga the mountain clan matron is standing here.\
", 
         Height = 0, 
         NumberOfAttacks = 2, 
         Vnum = 28015, 
         Level = 90, 
      }, 
      [28016] = 
      {
         Sex = "undistinguished", 
         Credits = 0, 
         ShortDescr = "a gamorrean shaman", 
         DamRoll = 0, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         HitRoll = 0, 
         Description = "This old human man seems to be content just gazing at the stars. He is\
dressed in a long hooded cloak and old brown boots. from the scars on\
his face you think that this man has seen a fair share of action in\
his days.\
Maybe he could teach you a thing or two....\
", 
         ArmorClass = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [10] = "Practice", 
            [20] = "Scholar", 
         }, 
         Position = "sitting", 
         Race = "Human", 
         Alignment = 0, 
         Weight = 0, 
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
         DefaultPosition = "standing", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         Stats = 
         {
            Charisma = 0, 
            Wisdom = 0, 
            Strength = 0, 
            Luck = 0, 
            Force = 0, 
            Dexterity = 0, 
            Constitution = 0, 
            Intelligence = 0, 
         }, 
         Name = "shaman gamorrean healer", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         LongDescr = "A gamorrean shaman is sitting here.\
", 
         Height = 0, 
         NumberOfAttacks = 0, 
         Vnum = 28016, 
         Level = 103, 
      }, 
      [28017] = 
      {
         Sex = "female", 
         Credits = 0, 
         ShortDescr = "a gamorrean shop keeper", 
         DamRoll = 0, 
         Damage = 
         {
            DamSizeDice = 5, 
            DamPlus = 10, 
            DamNoDice = 10, 
         }, 
         HitRoll = 0, 
         Description = "", 
         ArmorClass = 0, 
         Shop = 
         {
            ProfitBuy = 120, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            KeeperShortDescr = "a gamorrean shop keeper", 
            ProfitSell = 90, 
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Position = "standing", 
         Race = "Gamorrean", 
         Alignment = 0, 
         Weight = 0, 
         Languages = 
         {
            Speaking = 
            {
               [14] = "gamorrese", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [14] = "gamorrese", 
            }, 
         }, 
         DefaultPosition = "standing", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         Stats = 
         {
            Charisma = 0, 
            Wisdom = 0, 
            Strength = 0, 
            Luck = 0, 
            Force = 0, 
            Dexterity = 0, 
            Constitution = 0, 
            Intelligence = 0, 
         }, 
         Name = "gamorrean shop owner", 
         HitChance = 
         {
            HitPlus = 12998, 
            HitSizeDice = 1, 
            HitNoDice = 1, 
         }, 
         LongDescr = "A gamorrean shop keeper is selling some water goods.\
", 
         Height = 0, 
         NumberOfAttacks = 0, 
         Vnum = 28017, 
         Level = 20, 
      }, 
      [28018] = 
      {
         Sex = "female", 
         Credits = 0, 
         ShortDescr = "The Gamorrean Shop keeper", 
         DamRoll = 0, 
         Damage = 
         {
            DamSizeDice = 5, 
            DamPlus = 10, 
            DamNoDice = 10, 
         }, 
         HitRoll = 0, 
         Description = "", 
         ArmorClass = 0, 
         Shop = 
         {
            ProfitBuy = 120, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            KeeperShortDescr = "The Gamorrean Shop keeper", 
            ProfitSell = 90, 
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Position = "standing", 
         Race = "Gamorrean", 
         Alignment = 0, 
         Weight = 0, 
         Languages = 
         {
            Speaking = 
            {
               [14] = "gamorrese", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [14] = "gamorrese", 
            }, 
         }, 
         DefaultPosition = "standing", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         Stats = 
         {
            Charisma = 0, 
            Wisdom = 0, 
            Strength = 0, 
            Luck = 0, 
            Force = 0, 
            Dexterity = 0, 
            Constitution = 0, 
            Intelligence = 0, 
         }, 
         Name = "gamorrean shop owner", 
         HitChance = 
         {
            HitPlus = 12998, 
            HitSizeDice = 1, 
            HitNoDice = 1, 
         }, 
         LongDescr = "A gamorrean shop keeper is selling some goods here.\
", 
         Height = 0, 
         NumberOfAttacks = 0, 
         Vnum = 28018, 
         Level = 20, 
      }, 
      [28019] = 
      {
         Sex = "female", 
         Credits = 0, 
         ShortDescr = "The Gamorrean Shop keeper", 
         DamRoll = 0, 
         Damage = 
         {
            DamSizeDice = 5, 
            DamPlus = 10, 
            DamNoDice = 10, 
         }, 
         HitRoll = 0, 
         Description = "", 
         ArmorClass = 0, 
         Shop = 
         {
            ProfitBuy = 120, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            KeeperShortDescr = "The Gamorrean Shop keeper", 
            ProfitSell = 90, 
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Position = "standing", 
         Race = "Gamorrean", 
         Alignment = 0, 
         Weight = 0, 
         Languages = 
         {
            Speaking = 
            {
               [14] = "gamorrese", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [14] = "gamorrese", 
            }, 
         }, 
         DefaultPosition = "standing", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         Stats = 
         {
            Charisma = 0, 
            Wisdom = 0, 
            Strength = 0, 
            Luck = 0, 
            Force = 0, 
            Dexterity = 0, 
            Constitution = 0, 
            Intelligence = 0, 
         }, 
         Name = "gamorrean shop owner", 
         HitChance = 
         {
            HitPlus = 12998, 
            HitSizeDice = 1, 
            HitNoDice = 1, 
         }, 
         LongDescr = "A gamorrean shop keeper is selling some of her weapons here.\
", 
         Height = 0, 
         NumberOfAttacks = 0, 
         Vnum = 28019, 
         Level = 20, 
      }, 
      [28020] = 
      {
         Sex = "male", 
         Credits = 0, 
         ShortDescr = "a noghri", 
         DamRoll = 0, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         HitRoll = 0, 
         Description = "", 
         ArmorClass = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Position = "standing", 
         Race = "Shistavanen", 
         Alignment = 0, 
         Weight = 0, 
         Languages = 
         {
            Speaking = 
            {
               [6] = "shistavanen", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [6] = "shistavanen", 
            }, 
         }, 
         DefaultPosition = "standing", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         Stats = 
         {
            Charisma = 0, 
            Wisdom = 0, 
            Strength = 0, 
            Luck = 0, 
            Force = 0, 
            Dexterity = 0, 
            Constitution = 0, 
            Intelligence = 0, 
         }, 
         Name = "noghri patron", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         LongDescr = "A noghri is sitting here minding his own business.\
", 
         Height = 0, 
         NumberOfAttacks = 0, 
         Vnum = 28020, 
         Level = 1, 
      }, 
      [28021] = 
      {
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
            }, 
         }, 
         Sex = "male", 
         Credits = 0, 
         ShortDescr = "A trandoshan hunter", 
         DamRoll = 9, 
         Damage = 
         {
            DamSizeDice = 3, 
            DamPlus = 0, 
            DamNoDice = 8, 
         }, 
         HitRoll = 9, 
         Description = "", 
         ArmorClass = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Position = "standing", 
         Race = "Trandoshan", 
         Alignment = 0, 
         Weight = 0, 
         Languages = 
         {
            Speaking = 
            {
               [22] = "dosh", 
            }, 
            Speaks = 
            {
               [22] = "dosh", 
            }, 
         }, 
         DefaultPosition = "standing", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         Stats = 
         {
            Charisma = 0, 
            Wisdom = 0, 
            Strength = 0, 
            Luck = 0, 
            Force = 0, 
            Dexterity = 0, 
            Constitution = 0, 
            Intelligence = 0, 
         }, 
         Name = "trandoshan hunter", 
         HitChance = 
         {
            HitPlus = 450, 
            HitSizeDice = 9, 
            HitNoDice = 10, 
         }, 
         LongDescr = "A trandoshan hunter is sitting here watching out for something.\
", 
         Height = 0, 
         NumberOfAttacks = 0, 
         Vnum = 28021, 
         Level = 40, 
      }, 
      [28022] = 
      {
         Sex = "undistinguished", 
         Credits = 0, 
         ShortDescr = "a newly created wookiee", 
         DamRoll = 0, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         HitRoll = 0, 
         Description = "", 
         ArmorClass = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Position = "standing", 
         Race = "Wookiee", 
         Alignment = 0, 
         Weight = 0, 
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
         DefaultPosition = "standing", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         Stats = 
         {
            Charisma = 0, 
            Wisdom = 0, 
            Strength = 0, 
            Luck = 0, 
            Force = 0, 
            Dexterity = 0, 
            Constitution = 0, 
            Intelligence = 0, 
         }, 
         Name = "wookiee", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 0, 
            HitNoDice = 0, 
         }, 
         LongDescr = "Some god abandoned a newly created wookiee here.\
", 
         Height = 0, 
         NumberOfAttacks = 0, 
         Vnum = 28022, 
         Level = 1, 
      }, 
      [28023] = 
      {
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "death_prog", 
               Code = "mpecho Shugsha drops a shield as she collapses to the ground.\
mpoload 28029\
", 
               Arguments = "100", 
            }, 
         }, 
         Sex = "female", 
         Credits = 450, 
         ShortDescr = "Shugsha", 
         DamRoll = 0, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamPlus = 0, 
            DamNoDice = 11, 
         }, 
         HitRoll = 0, 
         Description = "", 
         ArmorClass = -74, 
         Languages = 
         {
            Speaking = 
            {
               [14] = "gamorrese", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [14] = "gamorrese", 
            }, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Position = "standing", 
         Race = "Gamorrean", 
         Alignment = 0, 
         Weight = 0, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Stats = 
         {
            Charisma = 0, 
            Wisdom = 0, 
            Strength = 0, 
            Luck = 0, 
            Force = 0, 
            Dexterity = 0, 
            Constitution = 0, 
            Intelligence = 0, 
         }, 
         AttackFlags = 
         {
            [9] = "_09", 
            [4] = "punch", 
            [5] = "kick", 
            [6] = "_06", 
            [7] = "_07", 
         }, 
         Name = "Shugsha", 
         HitChance = 
         {
            HitPlus = 900, 
            HitSizeDice = 10, 
            HitNoDice = 18, 
         }, 
         LongDescr = "Shugsha the forest clan matron is here.\
", 
         Height = 0, 
         NumberOfAttacks = 6, 
         Vnum = 28023, 
         Level = 90, 
      }, 
      [28025] = 
      {
         Sex = "male", 
         Credits = 0, 
         ShortDescr = "A Female Gamorrean", 
         DamRoll = 0, 
         Damage = 
         {
            DamSizeDice = 6, 
            DamPlus = 0, 
            DamNoDice = 2, 
         }, 
         HitRoll = 0, 
         Description = "", 
         ArmorClass = 10, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Position = "standing", 
         Race = "Gamorrean", 
         Alignment = 0, 
         Weight = 0, 
         Languages = 
         {
            Speaking = 
            {
               [14] = "gamorrese", 
            }, 
            Speaks = 
            {
               [14] = "gamorrese", 
            }, 
         }, 
         DefaultPosition = "standing", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         Stats = 
         {
            Charisma = 0, 
            Wisdom = 0, 
            Strength = 0, 
            Luck = 0, 
            Force = 0, 
            Dexterity = 0, 
            Constitution = 0, 
            Intelligence = 0, 
         }, 
         Name = "female gamorrean", 
         HitChance = 
         {
            HitPlus = 100, 
            HitSizeDice = 10, 
            HitNoDice = 2, 
         }, 
         LongDescr = "A Female Gamorrean is going to collect the crops.\
", 
         Height = 0, 
         NumberOfAttacks = 2, 
         Vnum = 28025, 
         Level = 10, 
      }, 
      [28139] = 
      {
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Code = "drool\
", 
               Arguments = "10", 
            }, 
         }, 
         Sex = "undistinguished", 
         Credits = 0, 
         ShortDescr = "A large Morrt", 
         DamRoll = 10, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         HitRoll = 0, 
         Description = "", 
         ArmorClass = 0, 
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
         Flags = 
         {
            [0] = "Npc", 
            [5] = "Aggressive", 
            [2] = "Scavenger", 
            [6] = "StayArea", 
         }, 
         Position = "standing", 
         Race = "Human", 
         Alignment = 0, 
         Weight = 0, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Stats = 
         {
            Charisma = 0, 
            Wisdom = 0, 
            Strength = 0, 
            Luck = 0, 
            Force = 0, 
            Dexterity = 0, 
            Constitution = 0, 
            Intelligence = 0, 
         }, 
         AttackFlags = 
         {
            [0] = "bite", 
         }, 
         Name = "morrt", 
         HitChance = 
         {
            HitPlus = 100, 
            HitSizeDice = 1, 
            HitNoDice = 1, 
         }, 
         LongDescr = "A hungery Morrt is crawling around the ground here.\
", 
         Height = 0, 
         NumberOfAttacks = 0, 
         Vnum = 28139, 
         Level = 10, 
      }, 
      [28116] = 
      {
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "death_prog", 
               Code = "mpecho &YWith her dying breath Ugmush drops a cerimonial axe.\
mpoload 28028\
", 
               Arguments = "100", 
            }, 
         }, 
         Sex = "female", 
         Credits = 450, 
         ShortDescr = "Ugmush", 
         DamRoll = 14, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamPlus = 0, 
            DamNoDice = 11, 
         }, 
         HitRoll = 14, 
         Description = "Ugmush is a Beauty to the Gamorreans, she has a long pink wig and her\
heavy muscled arms and breasts are sporting fifteen parasitic morrts\
to demonstrate her strength and endurance.   \
 \
", 
         ArmorClass = -74, 
         Languages = 
         {
            Speaking = 
            {
               [14] = "gamorrese", 
            }, 
            Speaks = 
            {
               [14] = "gamorrese", 
            }, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Position = "standing", 
         Race = "Gamorrean", 
         Alignment = 0, 
         Weight = 0, 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         DefaultPosition = "standing", 
         Stats = 
         {
            Charisma = 0, 
            Wisdom = 0, 
            Strength = 0, 
            Luck = 0, 
            Force = 0, 
            Dexterity = 0, 
            Constitution = 0, 
            Intelligence = 0, 
         }, 
         AttackFlags = 
         {
            [9] = "_09", 
            [4] = "punch", 
            [5] = "kick", 
            [6] = "_06", 
            [7] = "_07", 
         }, 
         Name = "Ugmush alpha female", 
         HitChance = 
         {
            HitPlus = 900, 
            HitSizeDice = 10, 
            HitNoDice = 18, 
         }, 
         LongDescr = "The Alpha-Female Ugmush stands before you.\
", 
         Height = 0, 
         NumberOfAttacks = 6, 
         Vnum = 28116, 
         Level = 90, 
      }, 
      [28107] = 
      {
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "greet_prog", 
               Code = "say I have very many usefull things you might like \
", 
               Arguments = "100 ", 
            }, 
         }, 
         Sex = "female", 
         Credits = 0, 
         ShortDescr = "The Gamorrean Shop keeper", 
         DamRoll = 0, 
         Damage = 
         {
            DamSizeDice = 5, 
            DamPlus = 10, 
            DamNoDice = 10, 
         }, 
         HitRoll = 0, 
         Description = "", 
         ArmorClass = 0, 
         Shop = 
         {
            ProfitBuy = 120, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            KeeperShortDescr = "The Gamorrean Shop keeper", 
            ProfitSell = 90, 
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Position = "standing", 
         Race = "Gamorrean", 
         Alignment = 0, 
         Weight = 0, 
         Languages = 
         {
            Speaking = 
            {
               [14] = "gamorrese", 
            }, 
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
         }, 
         DefaultPosition = "standing", 
         SaveVs = 
         {
            SpellStaff = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            PoisonDeath = 0, 
            Wand = 0, 
         }, 
         Stats = 
         {
            Charisma = 0, 
            Wisdom = 0, 
            Strength = 0, 
            Luck = 0, 
            Force = 0, 
            Dexterity = 0, 
            Constitution = 0, 
            Intelligence = 0, 
         }, 
         Name = "Gamorrean Shop keeper.", 
         HitChance = 
         {
            HitPlus = 12998, 
            HitSizeDice = 1, 
            HitNoDice = 1, 
         }, 
         LongDescr = "The Gamorrean shop keeper is selling her weapons.\
", 
         Height = 0, 
         NumberOfAttacks = 0, 
         Vnum = 28107, 
         Level = 20, 
      }, 
   }, 
   Filename = "gamorr.lua", 
   LevelRanges = 
   {
      Hard = 
      {
         Low = 0, 
         High = 105, 
      }, 
      Soft = 
      {
         Low = 1, 
         High = 100, 
      }, 
   }, 
}
