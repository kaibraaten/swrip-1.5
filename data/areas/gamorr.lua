-- Gamorr
-- Last saved Thursday 09-Jul-2020 23:19:12

AreaEntry
{
   ResetMessage = "A warm breeze blows softly across your face.", 
   Objects = 
   {
      [28100] = 
      {
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
         Description = "A sleak and deadly blaster lies on the ground here.", 
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
         Flags = 
         {
            [1] = "Hum", 
            [30] = "Prototype", 
         }, 
         Vnum = 28100, 
         ShortDescr = "A Noghri Blaster", 
         ItemType = "trash", 
         Name = "SUPER noghri blaster thingy", 
      }, 
      [28120] = 
      {
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
         Description = "A hungry Morrt is crawling on the ground here.", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 10, 
         Cost = 0, 
         ActionDescription = "", 
         Layers = 8, 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         ShortDescr = "A large Morrt", 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         Vnum = 28120, 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
         }, 
         ItemType = "armor", 
         Name = "morrt", 
      }, 
      [28187] = 
      {
         Description = "A clan insignia is collecting dust on the ground here.", 
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
            [0] = 5, 
         }, 
         ShortDescr = "mountain clan insignia", 
         Vnum = 28187, 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
         }, 
         ItemType = "armor", 
         Name = "mountain clan insignia", 
      }, 
      [28188] = 
      {
         Description = "A helmet is lying on the ground attracting flies.", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 1, 
         Cost = 0, 
         ActionDescription = "", 
         Layers = 128, 
         ObjectValues = 
         {
            [1] = 20, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 20, 
         }, 
         ShortDescr = "a mountain clan helm", 
         Flags = 
         {
            [0] = "Glow", 
            [8] = "Bless", 
         }, 
         Vnum = 28188, 
         WearFlags = 
         {
            [0] = "Take", 
            [4] = "Head", 
         }, 
         ItemType = "armor", 
         Name = "mountain clan helm helmet", 
      }, 
      [28189] = 
      {
         Description = "A very large battle axe gleams in the dirt.", 
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
         ExtraDescriptions = 
         {
         }, 
         Weight = 10, 
         Cost = 20000, 
         ActionDescription = "", 
         Layers = 0, 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 3, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 12, 
         }, 
         ShortDescr = "a Large battle axe", 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         Vnum = 28189, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         ItemType = "weapon", 
         Name = "a Large battle axe", 
      }, 
      [28000] = 
      {
         Description = "Blite has dropped his colour contacts here.", 
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
         ShortDescr = "White contact lenses.", 
         Vnum = 28000, 
         WearFlags = 
         {
            [17] = "Eyes", 
         }, 
         ItemType = "trash", 
         Name = "white contacts blites", 
      }, 
      [28001] = 
      {
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Code = "mpecho The baby Gamorrean squeals loudly!\
", 
               Arguments = "100", 
            }, 
            [2] = 
            {
               MudProgType = "use_prog", 
               Code = "mpechoat $n The Gamorrean baby SCREAMS in terror as you swallow it whole\
mpechoaround $n The Gamorrean baby SCREAMS in shear terror as $n eats it!!!!\
", 
               Arguments = "100", 
            }, 
         }, 
         Description = "A baby Gamorrean is lying here.", 
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
            [0] = 15, 
         }, 
         ShortDescr = "A baby Gamorrean", 
         Vnum = 28001, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ItemType = "food", 
         Name = "baby gamorrean pig piglet piggy swine", 
      }, 
      [28002] = 
      {
         Description = "A Blue lightsaber glows here.", 
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
         Cost = 0, 
         ActionDescription = "", 
         Layers = 0, 
         ExtraDescriptions = 
         {
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
         ShortDescr = "A Blue lightsaber ", 
         Vnum = 28002, 
         WearFlags = 
         {
            [13] = "Wield", 
         }, 
         ItemType = "weapon", 
         Name = "A Blue Lightsaber", 
      }, 
      [28003] = 
      {
         Description = "A Small leather cap is lying here ", 
         Weight = 10, 
         Cost = 100, 
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
         Vnum = 28003, 
         ShortDescr = "A Small leather cap ", 
         ItemType = "armor", 
         Name = "A Leather cap", 
      }, 
      [28004] = 
      {
         Description = "A heavy looking hammer lies on the ground.", 
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
         Cost = 10000, 
         ActionDescription = "", 
         Layers = 0, 
         ExtraDescriptions = 
         {
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
         ShortDescr = "a war hammer", 
         Vnum = 28004, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         ItemType = "weapon", 
         Name = "war hammer", 
      }, 
      [28005] = 
      {
         Description = "A pair of boots lay crumpled on the ground.", 
         Weight = 1, 
         Cost = 100, 
         ActionDescription = "", 
         Layers = 128, 
         ExtraDescriptions = 
         {
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
         ShortDescr = "a pair of leather boots", 
         Vnum = 28005, 
         WearFlags = 
         {
            [0] = "Take", 
            [6] = "Feet", 
         }, 
         ItemType = "armor", 
         Name = "leather boots", 
      }, 
      [28006] = 
      {
         Description = "Someone has carelessly drop a wooden shield here.", 
         Weight = 5, 
         Cost = 100, 
         ActionDescription = "", 
         Layers = 128, 
         ExtraDescriptions = 
         {
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
         ShortDescr = "a large wooden shield", 
         Vnum = 28006, 
         WearFlags = 
         {
            [0] = "Take", 
            [9] = "Shield", 
         }, 
         ItemType = "armor", 
         Name = "large wooden shield", 
      }, 
      [28007] = 
      {
         Description = "A magnificent looking axe has been carlessly drop here.", 
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
         ExtraDescriptions = 
         {
         }, 
         Weight = 10, 
         Cost = 0, 
         ActionDescription = "", 
         Layers = 0, 
         ObjectValues = 
         {
            [1] = 8, 
            [2] = 4, 
            [3] = 1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 12, 
         }, 
         ShortDescr = "a war axe", 
         Flags = 
         {
            [8] = "Bless", 
            [13] = "Inventory", 
            [0] = "Glow", 
            [19] = "LargeSize", 
         }, 
         Vnum = 28007, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         ItemType = "weapon", 
         Name = "war axe", 
      }, 
      [28008] = 
      {
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
            }, 
            [2] = 
            {
               MudProgType = "remove_prog", 
               Code = "mpechoat $n You slowly remove the Morrts from you body.\
mpdamage $n 75\
mpechoaround $n $n slowly removes 15 morrts from $s body\
", 
               Arguments = "100", 
            }, 
         }, 
         Description = "A small group of Morrts are here relaxing.", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 5, 
         Cost = 0, 
         ActionDescription = "", 
         Layers = 4, 
         ObjectValues = 
         {
            [1] = 3, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 3, 
         }, 
         ShortDescr = "15 morrts", 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         Vnum = 28008, 
         WearFlags = 
         {
            [0] = "Take", 
            [3] = "Body", 
         }, 
         ItemType = "armor", 
         Name = "morrts 15", 
      }, 
      [28009] = 
      {
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
            }, 
            [2] = 
            {
               MudProgType = "remove_prog", 
               Code = "mpechoat $n You slowly remove the Morrts from your body.\
mpdamage $n 85\
mpechoaround $n $n  slowly remove 20 morrts $s body.\
", 
               Arguments = "100", 
            }, 
         }, 
         Description = "A large group of Morrts are huddled together here", 
         Weight = 5, 
         Cost = 0, 
         ActionDescription = "", 
         Layers = 8, 
         ExtraDescriptions = 
         {
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
         ShortDescr = "20 morrts", 
         Vnum = 28009, 
         WearFlags = 
         {
            [0] = "Take", 
            [3] = "Body", 
         }, 
         ItemType = "armor", 
         Name = "morrts 20", 
      }, 
      [28010] = 
      {
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
            }, 
         }, 
         Description = "A bunch of Morrts lay huddled together", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 5, 
         Cost = 0, 
         ActionDescription = "", 
         Layers = 12, 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         ShortDescr = "25 Morrts", 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         Vnum = 28010, 
         WearFlags = 
         {
            [0] = "Take", 
            [3] = "Body", 
         }, 
         ItemType = "armor", 
         Name = "morrts 25", 
      }, 
      [28011] = 
      {
         Description = "A piece of fur is lying here collecting flies.", 
         Weight = 2, 
         Cost = 10, 
         ActionDescription = "", 
         Layers = 12, 
         ExtraDescriptions = 
         {
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
         ShortDescr = "Gurda skin", 
         Vnum = 28011, 
         WearFlags = 
         {
            [0] = "Take", 
            [11] = "Waist", 
         }, 
         ItemType = "armor", 
         Name = "skin", 
      }, 
      [28012] = 
      {
         Description = "A pike is lying in your way here.", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 1, 
         Cost = 0, 
         ActionDescription = "", 
         Layers = 0, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "a pike", 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         Vnum = 28012, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         ItemType = "weapon", 
         Name = "pike", 
      }, 
      [28013] = 
      {
         Description = "An arm of a tourist", 
         Weight = 1, 
         Cost = 0, 
         ActionDescription = "", 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
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
         ShortDescr = "An arm of a tourist", 
         ItemType = "trash", 
         Name = "arm limb", 
      }, 
      [28014] = 
      {
         Description = "&r a pool of blood&Y", 
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
         Vnum = 28014, 
         ShortDescr = "&r a pool of blood&Y", 
         ItemType = "trash", 
         Name = "blood", 
      }, 
      [28015] = 
      {
         Description = "Some clumsy Gamorrean has drop his helmet", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 3, 
         Cost = 120, 
         ActionDescription = "", 
         Layers = 128, 
         ObjectValues = 
         {
            [1] = 6, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 6, 
         }, 
         ShortDescr = "a metal helm", 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         Vnum = 28015, 
         WearFlags = 
         {
            [0] = "Take", 
            [4] = "Head", 
         }, 
         ItemType = "armor", 
         Name = "metal helmet gamorrean", 
      }, 
      [28016] = 
      {
         Description = "A pair of metal boots are attracting flies here.", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 1, 
         Cost = 150, 
         ActionDescription = "", 
         Layers = 0, 
         ObjectValues = 
         {
            [1] = 7, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 7, 
         }, 
         ShortDescr = "metal boots", 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         Vnum = 28016, 
         WearFlags = 
         {
            [0] = "Take", 
            [6] = "Feet", 
         }, 
         ItemType = "armor", 
         Name = "metal boots", 
      }, 
      [28017] = 
      {
         Description = "Some clumsy Gamorrean has drop his wrist guards here", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 3, 
         Cost = 200, 
         ActionDescription = "", 
         Layers = 64, 
         ObjectValues = 
         {
            [1] = 7, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 7, 
         }, 
         ShortDescr = "wrist guards", 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         Vnum = 28017, 
         WearFlags = 
         {
            [0] = "Take", 
            [12] = "Wrist", 
         }, 
         ItemType = "armor", 
         Name = "wrist guards", 
      }, 
      [28018] = 
      {
         Description = "An Imperial cargo ship has landed here.", 
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
         Vnum = 28018, 
         ShortDescr = "Imperial cargo ship", 
         ItemType = "trash", 
         Name = "imperial cargo cruiser", 
      }, 
      [28019] = 
      {
         Description = "A dirty, bright pink wig is being trampled by people here.", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 1, 
         Cost = 0, 
         ActionDescription = "", 
         Layers = 0, 
         ObjectValues = 
         {
            [1] = 3, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 3, 
         }, 
         ShortDescr = "a pink wig", 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         Vnum = 28019, 
         WearFlags = 
         {
            [0] = "Take", 
            [4] = "Head", 
         }, 
         ItemType = "armor", 
         Name = "pink wig", 
      }, 
      [28020] = 
      {
         Description = "A clumsy gamorrean has carlessly drop his axe here.", 
         Weight = 3, 
         Cost = 100, 
         ActionDescription = "", 
         Layers = 0, 
         ExtraDescriptions = 
         {
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
         ShortDescr = "a hand axe", 
         Vnum = 28020, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
            [14] = "Hold", 
         }, 
         ItemType = "weapon", 
         Name = "hand axe", 
      }, 
      [28021] = 
      {
         Description = "A large crate is here.", 
         Weight = 100, 
         Cost = 0, 
         ActionDescription = "", 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
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
         ShortDescr = "a crate", 
         ItemType = "container", 
         Name = "crate box", 
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
         Description = "An infant watch-beast is sitting here.", 
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
         Vnum = 28022, 
         ShortDescr = "an infant watch-beast", 
         ItemType = "trash", 
         Name = "infant gamorrean watch beats", 
      }, 
      [28023] = 
      {
         Description = "The gamorrean cube ship Zicreex is parked here.", 
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
         Vnum = 28023, 
         ShortDescr = "The Gamorrean cube ship Zireex", 
         ItemType = "spacecraft", 
         Name = "ship cube zicreex", 
      }, 
      [28024] = 
      {
         Description = "Metal shoulder plates have been carelessly drop here.", 
         ExtraDescriptions = 
         {
         }, 
         Weight = 3, 
         Cost = 0, 
         ActionDescription = "", 
         Layers = 0, 
         ObjectValues = 
         {
            [1] = 6, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "metal shoulder plates", 
         Flags = 
         {
            [19] = "LargeSize", 
         }, 
         Vnum = 28024, 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
         }, 
         ItemType = "armor", 
         Name = "metal shoulder plates", 
      }, 
      [28025] = 
      {
         Description = "A vibro-axe vibro axe is here collecting dust.", 
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
         ExtraDescriptions = 
         {
         }, 
         Weight = 10, 
         Cost = 500, 
         ActionDescription = "", 
         Layers = 0, 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 3, 
            [3] = 1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 12, 
         }, 
         ShortDescr = "a vibro-axe", 
         Flags = 
         {
            [4] = "Contraband", 
            [19] = "LargeSize", 
         }, 
         Vnum = 28025, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         ItemType = "weapon", 
         Name = "vibro axe", 
      }, 
      [28026] = 
      {
         Description = "The scraps of a ship lie here.", 
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
            [3] = 1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         ShortDescr = "scraps of a ship", 
         Vnum = 28026, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ItemType = "durasteel", 
         Name = "ship scraps", 
      }, 
      [28027] = 
      {
         Description = "A rather large mud hole.", 
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
         Vnum = 28027, 
         ShortDescr = "a mud hole", 
         ItemType = "trash", 
         Name = "mud hole", 
      }, 
      [28028] = 
      {
         Description = "A beautifuly crafted axe is on a pedestal here.", 
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
         Flags = 
         {
            [0] = "Glow", 
         }, 
         Vnum = 28028, 
         ShortDescr = "a beautiful axe", 
         ItemType = "government", 
         Name = "cerimonial axe", 
      }, 
      [28029] = 
      {
         Description = "A fine shield is being displayed on a mantel.", 
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
         Vnum = 28029, 
         ShortDescr = "a cerimonial shield", 
         ItemType = "government", 
         Name = "cerimonial shield", 
      }, 
      [28030] = 
      {
         Description = "The sacred stone of the Mountains is here.", 
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
         Vnum = 28030, 
         ShortDescr = "a sacred stone", 
         ItemType = "government", 
         Name = "sacred stone", 
      }, 
      [28199] = 
      {
         Description = "Some god dropped a newly created chair here.", 
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
         Vnum = 28199, 
         ShortDescr = "a newly created chair", 
         ItemType = "furniture", 
         Name = "chair", 
      }, 
   }, 
   ResetFrequency = 0, 
   Author = "Thrawn", 
   Resets = 
   {
      [1] = 
      {
         Arg2 = 41, 
         Arg1 = 28001, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28000, 
      }, 
      [2] = 
      {
         Arg2 = 41, 
         Arg1 = 28001, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28000, 
      }, 
      [3] = 
      {
         Arg2 = 1, 
         Arg1 = 28015, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28003, 
      }, 
      [4] = 
      {
         Arg2 = 1, 
         Arg1 = 28010, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28010, 
      }, 
      [5] = 
      {
         Arg2 = 1, 
         Arg1 = 28012, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 16, 
      }, 
      [6] = 
      {
         Arg2 = 1, 
         Arg1 = 28020, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28014, 
      }, 
      [7] = 
      {
         Arg2 = 1, 
         Arg1 = 28021, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28015, 
      }, 
      [8] = 
      {
         Arg2 = 1, 
         Arg1 = 28011, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28016, 
      }, 
      [9] = 
      {
         Arg1 = 32253, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [10] = 
      {
         Arg2 = 1, 
         Arg1 = 28003, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28023, 
      }, 
      [11] = 
      {
         Arg2 = 1, 
         Arg1 = 28013, 
         Command = "O", 
         MiscData = 1, 
         Arg3 = 28023, 
      }, 
      [12] = 
      {
         Arg2 = 1, 
         Arg1 = 28014, 
         Command = "O", 
         MiscData = 1, 
         Arg3 = 28023, 
      }, 
      [13] = 
      {
         Arg2 = 1, 
         Arg1 = 28006, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28031, 
      }, 
      [14] = 
      {
         Arg2 = 1, 
         Arg1 = 28001, 
         Command = "O", 
         MiscData = 1, 
         Arg3 = 28031, 
      }, 
      [15] = 
      {
         Arg2 = 1, 
         Arg1 = 28027, 
         Command = "O", 
         MiscData = 1, 
         Arg3 = 28036, 
      }, 
      [16] = 
      {
         Arg2 = 1, 
         Arg1 = 28000, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28102, 
      }, 
      [17] = 
      {
         Arg2 = 1, 
         Arg1 = 28102, 
         Command = "D", 
         MiscData = 0, 
         Arg3 = 0, 
      }, 
      [18] = 
      {
         Arg2 = 10, 
         Arg1 = 28013, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28103, 
      }, 
      [19] = 
      {
         Arg2 = 4, 
         Arg1 = 28002, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28103, 
      }, 
      [20] = 
      {
         Arg2 = 41, 
         Arg1 = 28001, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28103, 
      }, 
      [21] = 
      {
         Arg2 = 10, 
         Arg1 = 28013, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28103, 
      }, 
      [22] = 
      {
         Arg2 = 41, 
         Arg1 = 28001, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28106, 
      }, 
      [23] = 
      {
         Arg2 = 1, 
         Arg1 = 28107, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28107, 
      }, 
      [24] = 
      {
         Arg1 = 28003, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [25] = 
      {
         Arg1 = 28016, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [26] = 
      {
         Arg1 = 28015, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [27] = 
      {
         Arg1 = 28017, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [28] = 
      {
         Arg1 = 28011, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [29] = 
      {
         Arg2 = 4, 
         Arg1 = 28002, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28112, 
      }, 
      [30] = 
      {
         Arg2 = 41, 
         Arg1 = 28001, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28113, 
      }, 
      [31] = 
      {
         Arg2 = 4, 
         Arg1 = 28002, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28113, 
      }, 
      [32] = 
      {
         Arg2 = 1, 
         Arg1 = 28001, 
         Command = "O", 
         MiscData = 1, 
         Arg3 = 28114, 
      }, 
      [33] = 
      {
         Arg2 = 1, 
         Arg1 = 28116, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28116, 
      }, 
      [34] = 
      {
         Arg2 = 1, 
         Arg1 = 28008, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 5, 
      }, 
      [35] = 
      {
         Arg2 = 1, 
         Arg1 = 28019, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 6, 
      }, 
      [36] = 
      {
         Arg2 = 10, 
         Arg1 = 28013, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28117, 
      }, 
      [37] = 
      {
         Arg2 = 10, 
         Arg1 = 28013, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28117, 
      }, 
      [38] = 
      {
         Arg2 = 10, 
         Arg1 = 28013, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28117, 
      }, 
      [39] = 
      {
         Arg2 = 4, 
         Arg1 = 28002, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28118, 
      }, 
      [40] = 
      {
         Arg2 = 41, 
         Arg1 = 28001, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28121, 
      }, 
      [41] = 
      {
         Arg2 = 1, 
         Arg1 = 28005, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28122, 
      }, 
      [42] = 
      {
         Arg2 = 1, 
         Arg1 = 28189, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 16, 
      }, 
      [43] = 
      {
         Arg2 = 1, 
         Arg1 = 28010, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 5, 
      }, 
      [44] = 
      {
         Arg2 = 1, 
         Arg1 = 28015, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 6, 
      }, 
      [45] = 
      {
         Arg2 = 1, 
         Arg1 = 28016, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 8, 
      }, 
      [46] = 
      {
         Arg2 = 1, 
         Arg1 = 28017, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 14, 
      }, 
      [47] = 
      {
         Arg2 = 1, 
         Arg1 = 28017, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 15, 
      }, 
      [48] = 
      {
         Arg2 = 1, 
         Arg1 = 28011, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 13, 
      }, 
      [49] = 
      {
         Arg2 = 1, 
         Arg1 = 28024, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 3, 
      }, 
      [50] = 
      {
         Arg2 = 1, 
         Arg1 = 28024, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 4, 
      }, 
      [51] = 
      {
         Arg2 = 41, 
         Arg1 = 28001, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28122, 
      }, 
      [52] = 
      {
         Arg2 = 10, 
         Arg1 = 28013, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28123, 
      }, 
      [53] = 
      {
         Arg2 = 41, 
         Arg1 = 28001, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28124, 
      }, 
      [54] = 
      {
         Arg2 = 10, 
         Arg1 = 28013, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28125, 
      }, 
      [55] = 
      {
         Arg2 = 10, 
         Arg1 = 28013, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28130, 
      }, 
      [56] = 
      {
         Arg2 = 10, 
         Arg1 = 28013, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28131, 
      }, 
      [57] = 
      {
         Arg2 = 10, 
         Arg1 = 28013, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28131, 
      }, 
      [58] = 
      {
         Arg2 = 41, 
         Arg1 = 28001, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28133, 
      }, 
      [59] = 
      {
         Arg2 = 41, 
         Arg1 = 28001, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28145, 
      }, 
      [60] = 
      {
         Arg2 = 41, 
         Arg1 = 28001, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28150, 
      }, 
      [61] = 
      {
         Arg2 = 41, 
         Arg1 = 28001, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28150, 
      }, 
      [62] = 
      {
         Arg2 = 41, 
         Arg1 = 28001, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28151, 
      }, 
      [63] = 
      {
         Arg2 = 41, 
         Arg1 = 28001, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28151, 
      }, 
      [64] = 
      {
         Arg2 = 41, 
         Arg1 = 28001, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28151, 
      }, 
      [65] = 
      {
         Arg2 = 41, 
         Arg1 = 28001, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28151, 
      }, 
      [66] = 
      {
         Arg2 = 41, 
         Arg1 = 28001, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28151, 
      }, 
      [67] = 
      {
         Arg2 = 41, 
         Arg1 = 28001, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28151, 
      }, 
      [68] = 
      {
         Arg2 = 41, 
         Arg1 = 28001, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28151, 
      }, 
      [69] = 
      {
         Arg2 = 41, 
         Arg1 = 28001, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28151, 
      }, 
      [70] = 
      {
         Arg2 = 41, 
         Arg1 = 28001, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28152, 
      }, 
      [71] = 
      {
         Arg2 = 1, 
         Arg1 = 28018, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28154, 
      }, 
      [72] = 
      {
         Arg1 = 10313, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [73] = 
      {
         Arg1 = 25, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [74] = 
      {
         Arg1 = 10317, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [75] = 
      {
         Arg2 = 1, 
         Arg1 = 28017, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28155, 
      }, 
      [76] = 
      {
         Arg1 = 32253, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [77] = 
      {
         Arg1 = 10314, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [78] = 
      {
         Arg2 = 1, 
         Arg1 = 28019, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28156, 
      }, 
      [79] = 
      {
         Arg1 = 28020, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [80] = 
      {
         Arg1 = 28004, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [81] = 
      {
         Arg1 = 28006, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [82] = 
      {
         Arg2 = 41, 
         Arg1 = 28001, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28156, 
      }, 
      [83] = 
      {
         Arg2 = 41, 
         Arg1 = 28001, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28156, 
      }, 
      [84] = 
      {
         Arg2 = 41, 
         Arg1 = 28001, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28157, 
      }, 
      [85] = 
      {
         Arg2 = 41, 
         Arg1 = 28001, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28158, 
      }, 
      [86] = 
      {
         Arg2 = 1, 
         Arg1 = 28023, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28159, 
      }, 
      [87] = 
      {
         Arg2 = 41, 
         Arg1 = 28001, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28160, 
      }, 
      [88] = 
      {
         Arg2 = 41, 
         Arg1 = 28001, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28160, 
      }, 
      [89] = 
      {
         Arg2 = 1, 
         Arg1 = 28004, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28168, 
      }, 
      [90] = 
      {
         Arg2 = 1, 
         Arg1 = 28007, 
         Command = "O", 
         MiscData = 1, 
         Arg3 = 28168, 
      }, 
      [91] = 
      {
         Arg2 = 1, 
         Arg1 = 28012, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28181, 
      }, 
      [92] = 
      {
         Arg2 = 1, 
         Arg1 = 28015, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 6, 
      }, 
      [93] = 
      {
         Arg2 = 1, 
         Arg1 = 28016, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 8, 
      }, 
      [94] = 
      {
         Arg2 = 1, 
         Arg1 = 28017, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 14, 
      }, 
      [95] = 
      {
         Arg2 = 1, 
         Arg1 = 28011, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 13, 
      }, 
      [96] = 
      {
         Arg2 = 1, 
         Arg1 = 28017, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 15, 
      }, 
      [97] = 
      {
         Arg2 = 1, 
         Arg1 = 28009, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 5, 
      }, 
      [98] = 
      {
         Arg2 = 1, 
         Arg1 = 28024, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 3, 
      }, 
      [99] = 
      {
         Arg2 = 1, 
         Arg1 = 28024, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 4, 
      }, 
      [100] = 
      {
         Arg2 = 1, 
         Arg1 = 28025, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 16, 
      }, 
      [101] = 
      {
         Arg2 = 1, 
         Arg1 = 28026, 
         Command = "O", 
         MiscData = 1, 
         Arg3 = 28183, 
      }, 
      [102] = 
      {
         Arg2 = 1, 
         Arg1 = 28009, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28186, 
      }, 
      [103] = 
      {
         Arg2 = 1, 
         Arg1 = 28008, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 5, 
      }, 
      [104] = 
      {
         Arg2 = 1, 
         Arg1 = 28011, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 13, 
      }, 
      [105] = 
      {
         Arg2 = 1, 
         Arg1 = 28015, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 6, 
      }, 
      [106] = 
      {
         Arg2 = 1, 
         Arg1 = 28016, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 8, 
      }, 
      [107] = 
      {
         Arg2 = 1, 
         Arg1 = 28017, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 14, 
      }, 
      [108] = 
      {
         Arg2 = 1, 
         Arg1 = 28120, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 3, 
      }, 
      [109] = 
      {
         Arg2 = 1, 
         Arg1 = 28017, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 15, 
      }, 
      [110] = 
      {
         Arg2 = 1, 
         Arg1 = 28020, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 16, 
      }, 
      [111] = 
      {
         Arg2 = 1, 
         Arg1 = 28020, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 18, 
      }, 
      [112] = 
      {
         Arg2 = 41, 
         Arg1 = 28001, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28189, 
      }, 
      [113] = 
      {
         Arg2 = 41, 
         Arg1 = 28001, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28191, 
      }, 
      [114] = 
      {
         Arg2 = 41, 
         Arg1 = 28001, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28191, 
      }, 
      [115] = 
      {
         Arg2 = 41, 
         Arg1 = 28001, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28193, 
      }, 
      [116] = 
      {
         Arg2 = 41, 
         Arg1 = 28001, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28195, 
      }, 
      [117] = 
      {
         Arg2 = 1, 
         Arg1 = 28016, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28196, 
      }, 
      [118] = 
      {
         Arg2 = 41, 
         Arg1 = 28001, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28196, 
      }, 
      [119] = 
      {
         Arg2 = 41, 
         Arg1 = 28001, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28196, 
      }, 
      [120] = 
      {
         Arg2 = 41, 
         Arg1 = 28001, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28196, 
      }, 
      [121] = 
      {
         Arg2 = 41, 
         Arg1 = 28001, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28197, 
      }, 
      [122] = 
      {
         Arg2 = 41, 
         Arg1 = 28001, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28197, 
      }, 
      [123] = 
      {
         Arg2 = 1, 
         Arg1 = 28014, 
         Command = "O", 
         MiscData = 1, 
         Arg3 = 28197, 
      }, 
      [124] = 
      {
         Arg2 = 41, 
         Arg1 = 28001, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28198, 
      }, 
      [125] = 
      {
         Arg2 = 41, 
         Arg1 = 28001, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28198, 
      }, 
      [126] = 
      {
         Arg2 = 41, 
         Arg1 = 28001, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28198, 
      }, 
      [127] = 
      {
         Arg2 = 41, 
         Arg1 = 28001, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 28198, 
      }, 
      [128] = 
      {
         Arg2 = 30, 
         Arg1 = 28025, 
         Command = "M", 
         MiscData = 0, 
         Arg3 = 28003, 
      }, 
      [129] = 
      {
         Arg2 = 30, 
         Arg1 = 28025, 
         Command = "M", 
         MiscData = 0, 
         Arg3 = 28128, 
      }, 
      [130] = 
      {
         Arg2 = 30, 
         Arg1 = 28025, 
         Command = "M", 
         MiscData = 0, 
         Arg3 = 28148, 
      }, 
      [131] = 
      {
         Arg2 = 1, 
         Arg1 = 28021, 
         Command = "O", 
         MiscData = 1, 
         Arg3 = 28038, 
      }, 
      [132] = 
      {
         Arg2 = 1, 
         Arg1 = 28022, 
         Command = "P", 
         MiscData = 0, 
         Arg3 = 0, 
      }, 
      [133] = 
      {
         Arg2 = 1, 
         Arg1 = 28023, 
         Command = "O", 
         MiscData = 1, 
         Arg3 = 28038, 
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
      [28160] = 
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
               DestinationVnum = 28151, 
               Direction = "north", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "This is a small hut. Its main purpose in life is to shealter the males\
from the rain or the harsh rays of the afternoon sun. The Hut is made\
from wood scavenged from the near by forest and held together with\
mud and clay. It is also stune with blankets and there is the odd\
hamock streched out from wall to post here and there. \
", 
         Vnum = 28160, 
         Name = "A hut.", 
      }, 
      [28161] = 
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
               DestinationVnum = 28151, 
               Direction = "south", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "This is a small hut. Its main purpose in life is to shealter the males\
from the rain or the harsh rays of the afternoon sun. The Hut is made\
from wood scavenged from the near by forest and held together with\
mud and clay. It is also stune with blankets and there is the odd\
hamock streched out from wall to post here and there. \
", 
         Vnum = 28161, 
         Name = "A hut.", 
      }, 
      [28162] = 
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
               DestinationVnum = 28151, 
               Direction = "east", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "This is a small hut. Its main purpose in life is to shealter the males\
from the rain or the harsh rays of the afternoon sun. The Hut is made\
from wood scavenged from the near by forest and held together with\
mud and clay. It is also stune with blankets and there is the odd\
hamock streched out from wall to post here and there. \
", 
         Vnum = 28162, 
         Name = "A hut.", 
      }, 
      [28163] = 
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
               DestinationVnum = 28127, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28164, 
               Direction = "east", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "The Gamorrean deset stretches on for miles. It is hot and you start to\
sweat almost immediatly. You can see the odd cactus here and there,\
as well as  the odd corpino scurrying past you in search of some\
shade. The relentless sun beats down on you neck causeing you to\
start gasping for some water, it is a wonder how anything could\
possibly live in such a harsh enviornment, but then again the\
gamorreans are a harsh people.\
", 
         Vnum = 28163, 
         Name = "Desert plains of Gamorr.", 
      }, 
      [28164] = 
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
               DestinationVnum = 28165, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28163, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "The Gamorrean deset stretches on for miles. It is hot and you start to\
sweat almost immediatly. You can see the odd cactus here and there,\
as well as  the odd corpino scurrying past you in search of some\
shade. The relentless sun beats down on you neck causeing you to\
start gasping for some water, it is a wonder how anything could\
possibly live in such a harsh enviornment, but then again the\
gamorreans are a harsh people. \
", 
         Vnum = 28164, 
         Name = "Desert plains.", 
      }, 
      [28165] = 
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
               DestinationVnum = 28025, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28164, 
               Direction = "south", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28166, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "The Gamorrean deset stretches on for miles. It is hot and you start to\
sweat almost immediatly. You can see the odd cactus here and there,\
as well as  the odd corpino scurrying past you in search of some\
shade. The relentless sun beats down on you neck causeing you to\
start gasping for some water, it is a wonder how anything could\
possibly live in such a harsh enviornment, but then again the\
gamorreans are a harsh people. \
", 
         Vnum = 28165, 
         Name = "Desert path.", 
      }, 
      [28166] = 
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
               DestinationVnum = 28167, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28165, 
               Direction = "east", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "You are standing on what might have been, at one point, a very well\
put together walkway, but over time has eroded to a few stones the\
have with stood the test of time and seem to be on there last legs,\
since the elements here, at times, sand blast everything that stands\
and leaves it in a crumbling mass of useless rubble. The path turns\
and you notice ahead that it keeps twisting and turning. You aren't\
sure if it was made that way or if it was one time a large and\
straight path. \
", 
         Vnum = 28166, 
         Name = "An eroding walkway.", 
      }, 
      [28167] = 
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
               DestinationVnum = 28166, 
               Direction = "south", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28168, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "You are standing on what might have been, at one point, a very well\
put together walkway, but over time has eroded to a few stones the\
have with stood the test of time and seem to be on there last legs,\
since the elements here, at times, sand blast everything that stands\
and leaves it in a crumbling mass of useless rubble. The path turns\
and you notice ahead that it keeps twisting and turning. You aren't\
sure if it was made that way or if it was one time a large and\
straight path. \
", 
         Vnum = 28167, 
         Name = "More of the eroding walkway.", 
      }, 
      [28168] = 
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
               DestinationVnum = 28167, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28169, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "You are standing on what might have been, at one point, a very well\
put together walkway, but over time has eroded to a few stones the\
have with stood the test of time and seem to be on there last legs,\
since the elements here, at times, sand blast everything that stands\
and leaves it in a crumbling mass of useless rubble. The path turns\
and you notice ahead that it keeps twisting and turning. You aren't\
sure if it was made that way or if it was one time a large and\
straight path. \
", 
         Vnum = 28168, 
         Name = "End of the walkway.", 
      }, 
      [28169] = 
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
               DestinationVnum = 28168, 
               Direction = "east", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "You stand in front of an old entrance, once you look through it you\
see nothing but more desert and the odd post of what might have been\
at one time an old house. You come to the conclusion that this at one\
point was the plains area abut has now been over taken by the\
constant shifting sands of the relentless desert. In due time all teh\
plains will be just like this barren and devoid of semi intellegent\
life... \
", 
         Vnum = 28169, 
         Name = "Entrance to the Desert town.", 
      }, 
      [28170] = 
      {
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
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "The mud bubbles and gurggles all around you, the bubbles tickling you as\
they rise to the top. The mud is very refreshing to your aches and pains\
and seems  to ease all the sores you have accumulated from your travels.\
The only problem is, There are other gamorreans here with you and you\
don't know if the bubbles are from the underground or from them, and the\
slight smell is starting to make you wonder. \
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
               DestinationVnum = 28036, 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [11] = "Hidden", 
               }, 
               Direction = "somewhere", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28170, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Name = "Mud Hole", 
      }, 
      [28171] = 
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
         Vnum = 28171, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Name = "floating in the void", 
      }, 
      [28172] = 
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
         Vnum = 28172, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Name = "floating in the void", 
      }, 
      [28173] = 
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
         Vnum = 28173, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Name = "floating in the void", 
      }, 
      [28174] = 
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
         Vnum = 28174, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Name = "floating in the void", 
      }, 
      [28175] = 
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
         Vnum = 28175, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Name = "floating in the void", 
      }, 
      [28176] = 
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
         Vnum = 28176, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Name = "floating in the void", 
      }, 
      [28177] = 
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
         Vnum = 28177, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Name = "floating in the void", 
      }, 
      [28178] = 
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
         Vnum = 28178, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Name = "floating in the void", 
      }, 
      [28179] = 
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
         Vnum = 28179, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Name = "floating in the void", 
      }, 
      [28180] = 
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
         Vnum = 28180, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Name = "floating in the void", 
      }, 
      [28181] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "You are standing in the infamous Zicreex. Which is owned by Ugmush and\
it has a slight stench to it, could possible be from her husbands as\
well as the other ship men she has to maintain can help pilot her\
beloved ship. It isn't exactlly the best of ships but how often do\
you get to sit in a Gamorrean Cube ship?\
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
               DestinationVnum = 28183, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28182, 
               Direction = "west", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28038, 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [11] = "Hidden", 
               }, 
               Direction = "somewhere", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28181, 
         Flags = 
         {
            [29] = "Spacecraft", 
         }, 
         Name = "Inside the Zicreex", 
      }, 
      [28182] = 
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
               DestinationVnum = 28181, 
               Direction = "east", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "This is the cockpit of the Zicreex. it isn't as bad as it seems to be\
from outside appearences, it does get its passengers from a to b with\
very little problems. The lights on the controls blink on and off and\
you here some bits and pieces of communication going back and forth\
over the comm system.\
", 
         Vnum = 28182, 
         Name = "Cockpit", 
      }, 
      [28183] = 
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
               DestinationVnum = 28181, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "This is where the crew put all its scavenge good the score from debris\
the find floating around in space, mostly from destroyed ships and\
such. There are bits and pieces of useless scraps cluttering the\
floor here.\
", 
         Vnum = 28183, 
         Name = "Large storage compartment", 
      }, 
      [28184] = 
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
         Vnum = 28184, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Name = "floating in the void", 
      }, 
      [28185] = 
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
         Vnum = 28185, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Name = "floating in the void", 
      }, 
      [28186] = 
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
               DestinationVnum = 28187, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28110, 
               Direction = "northeast", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "This Path is almost impossible to notice due to the lack of traffic\
flowing to the mountains. You sit and wonder why the Gammoreans\
wouldn'y use the path and come to the conclusion that maybe there is\
another clan up in the mountains and this might not be the season for\
the wars in fact as you look up the path you notice there is some\
spires of smoke rising from what you think could be home fires\
burning.\
", 
         Vnum = 28186, 
         Name = "Pathway to the Mountains", 
      }, 
      [28187] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
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
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28186, 
               Direction = "south", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28188, 
               Direction = "up", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28187, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Name = "Mountain trail.", 
      }, 
      [28188] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
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
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28189, 
               Direction = "up", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28187, 
               Direction = "down", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28188, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Name = "Steep path.", 
      }, 
      [28189] = 
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
               DestinationVnum = 28190, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28191, 
               Direction = "west", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28188, 
               Direction = "down", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "You can see for miles when you look over the ledge. In the distance\
you can see lush rain forests, further south you see a vast desert as\
well as the Huntbird in the village below While you were admiring the\
view, You completly forgot to check the stability of the ledge and it\
doesn't look to strong, you can notice a huge crack about three feet\
behind you where the ledge looks like it is about to colapse. Maybe\
you should get to safer ground.\
", 
         Vnum = 28189, 
         Name = "Cliff Ledge", 
      }, 
      [28190] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
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
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28189, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28190, 
         Flags = 
         {
            [1] = "_Reserved", 
         }, 
         Name = "Weak Cliff Lip", 
      }, 
      [28191] = 
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
               DestinationVnum = 28189, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28192, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "You can see alomost the whole planet from here, it looks great. You\
have a cool breeze blowing past you face making you feel refreshed\
after that long climb you can here what sounds like gamorreans\
getting ready to do something, you have no idea what, but it sounds\
very important or dangerous the way they sound. \
", 
         Vnum = 28191, 
         Name = "Cliff Ledge", 
      }, 
      [28192] = 
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
               DestinationVnum = 28193, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28191, 
               Direction = "east", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "You can see alomost the whole planet from here, it looks great. You\
have a cool breeze blowing past you face making you feel refreshed\
after that long climb you can here what sounds like gamorreans\
getting ready to do something, you have no idea what, but it sounds\
very important or dangerous the way they sound. \
", 
         Vnum = 28192, 
         Name = "Cliff Ledge", 
      }, 
      [28193] = 
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
               DestinationVnum = 28194, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28192, 
               Direction = "south", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "Now you can see where all the noise was comeing from. The mountain\
clan seems to be in a bit of a tizzy, something seems to have come\
into their area, and they don't seem to be happy about it, some even\
look afraid at what has invaded their homes, and it seems to be\
around the mine shaft that is in the center of  the village .\
", 
         Vnum = 28193, 
         Name = "Mountain Pathway", 
      }, 
      [28194] = 
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
               DestinationVnum = 28195, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28193, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "You are standing in the entrance and no gamorrean seems to have\
noticed you, They are far to busy trying to rid themselve of this\
small problem that it has left them open to unwanted visitors. From\
the mine shaft in the ground you hear a viscious groweling and it\
doesn't sound to pleasent to teh ears. You have heard of the Gurdas\
that have been known to snatch the odd child from its cribs and now\
it seems you are gonna witness one from a distance.\
", 
         Vnum = 28194, 
         Name = "Entrance to the Mountain Clan", 
      }, 
      [28195] = 
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
               DestinationVnum = 28198, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28194, 
               Direction = "south", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28196, 
               Direction = "up", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "The village is in chaos, there seems to be only one gamorrean with his\
thoughts straight and the is the shammon to the south. The groweling\
is still very  loud and promenent as still very viscious. Hear the\
scream of a child as it sound as if it has been captured by a gurda.\
You think and hope to yourself  that they dont hunt in packs cause\
then this place could be surrounded by them.  the thought sends\
shivers up and down you spine..\
", 
         Vnum = 28195, 
         Name = "Path in the Clan Village", 
      }, 
      [28196] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
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
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28195, 
               Direction = "down", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28196, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "Small Cave Entrance", 
      }, 
      [28197] = 
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
               DestinationVnum = 28198, 
               Direction = "up", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "", 
         Vnum = 28197, 
         Name = "Large Cave Entrance", 
      }, 
      [28198] = 
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
               DestinationVnum = 28199, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28195, 
               Direction = "south", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28197, 
               Direction = "down", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "The chaos and the groweling is getting worse as time goes on, you see\
of blood comeing from the cave and going north and you also see a\
babies little booty in the trail, seems like the panic has its\
reasons, something has got a baby and it is most likely a gurda that\
has it too. The mother is standing here screaming for her babies safe\
return, she's looking at you as if you might be the only one who can\
do it.\
", 
         Vnum = 28198, 
         Name = "Mountain Path", 
      }, 
      [28199] = 
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
               DestinationVnum = 28000, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28198, 
               Direction = "south", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "You walk along a mountain pass there are steep ledges all around you.\
The path you are on seems sturdy though if not carefull you could get\
harmed. There are some large boulders around the path that could\
start a cool rock slide at anytime. Birds are cherping in the\
distance and there are soem other animals making noise around you.\
", 
         Vnum = 28199, 
         Name = "Mountain Path", 
      }, 
      [28000] = 
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
               DestinationVnum = 28001, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28199, 
               Direction = "south", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "You walk along a mountain pass there are steep ledges all around you. The path \
you are on seems sturdy though if not carefull you could get harmed. There are \
some large boulders around the path that could start a cool rock slide at\
anytime. Birds are cherping in the distance and there are soem other animals\
making noise around you.\
", 
         Vnum = 28000, 
         Name = "Mountain Path", 
      }, 
      [28001] = 
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
               DestinationVnum = 28000, 
               Direction = "south", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28002, 
               Direction = "up", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28004, 
               Direction = "down", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "You have finaly reached the center of the chaos, everyone is holding\
spears and wielding axes and looking down what looks to be an\
abandoned mine, the source of the growling and the squeals of an\
injured and scared baby. The sounds pull on your hart and a tear\
trickles down you cheeck as you feel the urge to help the baby and\
destroy the evil gurda that has absolutly no care for the child.\
", 
         Vnum = 28001, 
         Name = "Mountain Path", 
      }, 
      [28002] = 
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
               DestinationVnum = 28003, 
               Direction = "up", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28001, 
               Direction = "down", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "You Stand in front of a rather large cave that the Alpha female has\
designated as her own, It is really big, it reminds you of a black\
hole. When the wind blows past the opening it makes a rather eriy\
howl that make your skin crawl with fear for some strange reason.\
Strangly though, no one is around here, they all seem to be\
preoccupied with the gurda and the baby, leaveing the large cave\
defenseless.\
", 
         Vnum = 28002, 
         Name = "Steep Trail", 
      }, 
      [28003] = 
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
               DestinationVnum = 28002, 
               Direction = "down", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "This is the cave of the mountain clans matron. It seems to be a little\
messed up, there is what looks like would be the nest of a gurda on\
the floor, could it be the she owns the gurda?, it would make sense\
since only the matron is allowd to have childern and no other female\
can because the would defeat the purpose of haveing the social\
structure the gamorreans have adopted as their own. You come to the\
conclusion that the matron sent the gurda after the other females\
child, to kill t or to bring it back, only the matron knows.\
", 
         Vnum = 28003, 
         Name = "Alpha-Cave", 
      }, 
      [28004] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "There is a very weak wooden ledge here, it doesn't look as if it is\
able to support the weight of anything your size. The boards start to\
groan under your feet and you start to here them snap and crack,\
splinters of wood start to fly through the air and you here a snap as\
they give way\
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
               DestinationVnum = 28001, 
               Direction = "up", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28005, 
               Flags = 
               {
                  [16] = "CanClimb", 
               }, 
               Direction = "down", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28004, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Name = "Mine Shaft", 
      }, 
      [28005] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "There is a very weak wooden ledge here, it doesn't look as if it is\
able to support the weight of anything your size. The boards start to\
groan under your feet and you start to here them snap and crack,\
splinters of wood start to fly through the air and you here a snap as\
they give way\
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
               DestinationVnum = 28031, 
               Direction = "south", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28004, 
               Direction = "up", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28006, 
               Flags = 
               {
                  [16] = "CanClimb", 
               }, 
               Direction = "down", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28005, 
         Flags = 
         {
            [0] = "Dark", 
            [3] = "Indoors", 
         }, 
         Name = "Mine Shaft", 
      }, 
      [28006] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "There is a very weak wooden ledge here, it doesn't look as if it is\
able to support the weight of anything your size. The boards start to\
groan under your feet and you start to here them snap and crack,\
splinters of wood start to fly through the air and you here a snap as\
they give way\
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
               DestinationVnum = 28032, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28005, 
               Direction = "up", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28007, 
               Flags = 
               {
                  [16] = "CanClimb", 
               }, 
               Direction = "down", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28006, 
         Flags = 
         {
            [0] = "Dark", 
            [3] = "Indoors", 
         }, 
         Name = "Mine Shaft", 
      }, 
      [28007] = 
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
               DestinationVnum = 28033, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28006, 
               Direction = "up", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28007, 
         Flags = 
         {
            [0] = "Dark", 
            [3] = "Indoors", 
         }, 
         Name = "Bottom of the Shaft.", 
      }, 
      [28008] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "You are standing in the Gamorr safe house. Far to the south\
you can here the loud chatter of fellow visitors and natives\
takeing time out and haveing some refreshments to easy the \
pressure of everyday life.\
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
               DestinationVnum = 28100, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28009, 
               Direction = "south", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28008, 
         Flags = 
         {
            [10] = "Safe", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Name = "Entrance to a Corridor.", 
      }, 
      [28009] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "This is one long and straight corridor, its very well kept\
and from the sounds of it, very peaceful meaning no sounds \
of fighting what so ever. This is good new, cause now you\
can really sit back and relax.\
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
               DestinationVnum = 28008, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28010, 
               Direction = "south", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28009, 
         Flags = 
         {
            [10] = "Safe", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Name = "Long corridor.", 
      }, 
      [28010] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "This is one long and straight corridor, its very well kept\
and from the sounds of it, very peaceful meaning no sounds \
of fighting what so ever. This is good new, cause now you\
can really sit back and relax.\
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
               DestinationVnum = 28009, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28011, 
               Direction = "south", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28010, 
         Flags = 
         {
            [10] = "Safe", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Name = "Long corridor.", 
      }, 
      [28011] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "The lounge is very nicely built. It is very large, with tables\
spread in a nice orderly fashion. The tabels themselves are \
quite a sight to see, they are all supported by large beams of\
dark blue light which comes from the floor and into the ceiling.\
There is a refreshments stand that stands in the middle of the\
whole area.\
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
               DestinationVnum = 28010, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28038, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28015, 
               Direction = "south", 
            }, 
            [4] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28012, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28011, 
         Flags = 
         {
            [23] = "Hotel", 
            [10] = "Safe", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Name = "Lounge area", 
      }, 
      [28012] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "The lounge has a very relaxed atmosphere, with soft music playing\
and quiet conversations going on here and there. You stand here\
waiting for a waitress, and during this time you take a look\
at some of the patrons here, and notice that they seem to be very\
friendly people, all have smiles and are very relaxed you too\
decide its time to have a drink and a rest.\
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
               DestinationVnum = 28013, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28011, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28016, 
               Direction = "south", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28012, 
         Flags = 
         {
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "Lounge area", 
      }, 
      [28013] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "The lounge has a very relaxed atmosphere, with soft music playing\
and quiet conversations going on here and there. You stand here\
waiting for a waitress, and during this time you take a look\
at some of the patrons here, and notice that they seem to be very\
friendly people, all have smiles and are very relaxed you too\
decide its time to have a drink and a rest.\
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
               DestinationVnum = 28014, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28012, 
               Direction = "south", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28016, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28013, 
         Flags = 
         {
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "Lounge area", 
      }, 
      [28014] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "The lounge has a very relaxed atmosphere, with soft music playing\
and quiet conversations going on here and there. You stand here\
waiting for a waitress, and during this time you take a look\
at some of the patrons here, and notice that they seem to be very\
friendly people, all have smiles and are very relaxed you too\
decide its time to have a drink and a rest.\
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
               DestinationVnum = 28016, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28015, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28013, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28014, 
         Flags = 
         {
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "Lounge area", 
      }, 
      [28015] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "The lounge has a very relaxed atmosphere, with soft music playing\
and quiet conversations going on here and there. You stand here\
waiting for a waitress, and during this time you take a look\
at some of the patrons here, and notice that they seem to be very\
friendly people, all have smiles and are very relaxed you too\
decide its time to have a drink and a rest.\
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
               DestinationVnum = 28011, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28016, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28014, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28015, 
         Flags = 
         {
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         Name = "Lounge area", 
      }, 
      [28016] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "This is a nicely put together stand, as far as stands go, because\
it is made from a rare wood not found anywhere on this planet\
and it has been very well cut aswell as the designs cut into it\
make it seem as though it has a little story scrolling across its \
edge. The stand has a nice odour to it, due to the variety of drinks\
and snacks that are being sold to its patrons.\
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
               DestinationVnum = 28012, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28013, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28014, 
               Direction = "south", 
            }, 
            [4] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28015, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28016, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "Refreshments Stand.", 
      }, 
      [28017] = 
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
               DestinationVnum = 28018, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28120, 
               Direction = "south", 
            }, 
         }, 
         TeleDelay = 0, 
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
         Vnum = 28017, 
         Name = "Deep in the Forest.", 
      }, 
      [28018] = 
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
               DestinationVnum = 28017, 
               Direction = "west", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28019, 
               Direction = "northwest", 
            }, 
         }, 
         TeleDelay = 0, 
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
         Vnum = 28018, 
         Name = "The Darkend Forest.", 
      }, 
      [28019] = 
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
               DestinationVnum = 28036, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28020, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28018, 
               Direction = "southeast", 
            }, 
         }, 
         TeleDelay = 0, 
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
         Vnum = 28019, 
         Name = "Uncharted Forest area.", 
      }, 
      [28020] = 
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
               DestinationVnum = 28019, 
               Direction = "west", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28021, 
               Direction = "down", 
            }, 
         }, 
         TeleDelay = 0, 
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
         Vnum = 28020, 
         Name = "Forest Ravine", 
      }, 
      [28021] = 
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
               DestinationVnum = 28020, 
               Direction = "up", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "", 
         Vnum = 28021, 
         Name = "Sudden Drop off.", 
      }, 
      [28022] = 
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
               DestinationVnum = 28137, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28023, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28036, 
               Direction = "northwest", 
            }, 
         }, 
         TeleDelay = 0, 
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
         Vnum = 28022, 
         Name = "Deep in the forest.", 
      }, 
      [28023] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
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
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28022, 
               Direction = "west", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28024, 
               Direction = "down", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28023, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Name = "Near the Edge of a Ravine", 
      }, 
      [28024] = 
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
               DestinationVnum = 28023, 
               Direction = "up", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "", 
         Vnum = 28024, 
         Name = "Sudden Drop.", 
      }, 
      [28025] = 
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
               DestinationVnum = 28165, 
               Direction = "south", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28026, 
               Direction = "northeast", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "The Gamorrean deset stretches on for miles. It is hot and you start to\
sweat almost immediatly. You can see the odd cactus here and there,\
as well as  the odd corpino scurrying past you in search of some\
shade. The relentless sun beats down on you neck causeing you to\
start gasping for some water, it is a wonder how anything could\
possibly live in such a harsh enviornment, but then again the\
gamorreans are a harsh people. \
", 
         Vnum = 28025, 
         Name = "The Desert.", 
      }, 
      [28026] = 
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
               DestinationVnum = 28027, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28028, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28025, 
               Direction = "southwest", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "The Gamorrean deset stretches on for miles. It is hot and you start to\
sweat almost immediatly. You can see the odd cactus here and there,\
as well as  the odd corpino scurrying past you in search of some\
shade. The relentless sun beats down on you neck causeing you to\
start gasping for some water, it is a wonder how anything could\
possibly live in such a harsh enviornment, but then again the\
gamorreans are a harsh people.\
", 
         Vnum = 28026, 
         Name = "Deep in the Gamorr Desert.", 
      }, 
      [28027] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
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
         Sector = "city", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 28027, 
         Flags = 
         {
            [1] = "_Reserved", 
            [2] = "NoMob", 
         }, 
         Name = "Lost in The Deserts of Gamorr.", 
      }, 
      [28028] = 
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
               DestinationVnum = 28029, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28030, 
               Direction = "south", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28026, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "You are standing in the infamous land of no return. It would be in\
your best interests to turn back now, it has earned its name and has\
never give up any of its helpless wonderers, and anyone who dares to\
enter find out fast how deadly the sink holes can be and even the\
desert creatures seem to be avoiding this area it would be a good\
idea if you followed their example. \
", 
         Vnum = 28028, 
         Name = "The Land of no Return.", 
      }, 
      [28029] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
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
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28028, 
               Direction = "west", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28131, 
               Direction = "down", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28029, 
         Flags = 
         {
            [24] = "NoFloor", 
         }, 
         Name = "A SINK HOLE!!", 
      }, 
      [28030] = 
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
               DestinationVnum = 28028, 
               Direction = "north", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "You are standing in the infamous land of no return. It would be in\
your best interests to turn back now, it has earned its name and has\
never give up any of its helpless wonderers, and anyone who dares to\
enter find out fast how deadly the sink holes can be and even the\
desert creatures seem to be avoiding this area it would be a good\
idea if you followed their example. \
", 
         Vnum = 28030, 
         Name = "Sands of the soft Sink Holes.", 
      }, 
      [28031] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "The tunnel end abruptly, and the stench from the gurda has filled the\
tunnel with a mind numbing sickening smell that makes you wanna blow\
chunks everywhere, to think that the gamorreans wear the gurdas skin as a\
prize, The tunnel itself is realy to dark to make heads or tails of what\
might be on the walls, from what you can tell  its just cuts made from the\
tools of mining.\
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
               DestinationVnum = 28005, 
               Direction = "north", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28031, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Name = "Mine Tunnel", 
      }, 
      [28032] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "The tunnel end abruptly, and the stench from the gurda has filled the\
tunnel with a mind numbing sickening smell that makes you wanna blow\
chunks everywhere, to think that the gamorreans wear the gurdas skin as a\
prize, The tunnel itself is realy to dark to make heads or tails of what\
might be on the walls, from what you can tell  its just cuts made from the\
tools of mining.\
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
               DestinationVnum = 28006, 
               Direction = "south", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28032, 
         Flags = 
         {
            [0] = "Dark", 
            [3] = "Indoors", 
         }, 
         Name = "Short tunnel.", 
      }, 
      [28033] = 
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
               DestinationVnum = 28034, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28007, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28033, 
         Flags = 
         {
            [0] = "Dark", 
            [3] = "Indoors", 
         }, 
         Name = "Long tunnel.", 
      }, 
      [28034] = 
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
               DestinationVnum = 28035, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28033, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28034, 
         Flags = 
         {
            [0] = "Dark", 
            [3] = "Indoors", 
         }, 
         Name = "More of the Tunnel.", 
      }, 
      [28035] = 
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
               DestinationVnum = 28034, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28035, 
         Flags = 
         {
            [0] = "Dark", 
            [3] = "Indoors", 
         }, 
         Name = "End of the Tunnel.", 
      }, 
      [28036] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "The small clearing has a rather large mudhole in it that the gamorreans\
have classified as the sacred land, where no fighting can take place. They\
come here to relax and heal there sore and swollen muscles after a hard\
days battle. The place smells like a sewer on coruscant, but it does look\
inviting.\
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
               DestinationVnum = 28019, 
               Direction = "south", 
            }, 
            [2] = 
            {
               Keyword = "mud hole", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28170, 
               Flags = 
               {
                  [17] = "CanEnter", 
                  [11] = "Hidden", 
               }, 
               Direction = "somewhere", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28036, 
         Flags = 
         {
            [10] = "Safe", 
         }, 
         Name = "Small Clearing.", 
      }, 
      [28037] = 
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
         Vnum = 28037, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Name = "Large Mud Hole.", 
      }, 
      [28038] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "The landing area is rather large, it looks as though it can hold and\
Imperial Star Destroyer, but how often do you see that. The area has\
the odd small cargo ship parked here and there as well as one or two\
stock light freighters loading and unloading so stuff you don't want\
to get involved with. You even see a ship loading a couple of infant\
Gamorrean watch-beasts with extream caution\
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
               DestinationVnum = 28011, 
               Direction = "west", 
            }, 
            [2] = 
            {
               Keyword = "ship zicreex", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28181, 
               Flags = 
               {
                  [17] = "CanEnter", 
                  [11] = "Hidden", 
               }, 
               Direction = "somewhere", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28038, 
         Flags = 
         {
            [4] = "CanLand", 
         }, 
         Name = "Landing Area", 
      }, 
      [28054] = 
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
         Vnum = 28054, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Name = "Floating in a void", 
      }, 
      [28100] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
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
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28103, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28008, 
               Direction = "south", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28101, 
               Direction = "up", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28100, 
         Flags = 
         {
            [10] = "Safe", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Name = "The Huntbird.", 
      }, 
      [28101] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "The Upperdeck of the wreck is, well, boring, the walls are empty\
except for the dust the is creatively decorated with finger \
prints and writting simply stateing \"WASH ME!\" other then \
that this is one barren place.\
", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "door", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28102, 
               Direction = "west", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28100, 
               Direction = "down", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28101, 
         Flags = 
         {
            [10] = "Safe", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Name = "Upperdeck of the Huntbird.", 
      }, 
      [28102] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "Through the cockpit window, you can see for miles, well you\
would be able to if that mountain wasn't in the way! But it \
looks to be a very beautiful planet with lush vegitation\
a desert in the distance and an old man sitting on the floor \
watching everything you do with hauntingly knowing eyes.\
", 
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "door", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28101, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Direction = "east", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28102, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Name = "Cockpit.", 
      }, 
      [28103] = 
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
               DestinationVnum = 28108, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28104, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28100, 
               Direction = "south", 
            }, 
            [4] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28107, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "You wonder through the village streets wondering where to go\
the sight here are very pleasant to thte eye, well it would be\
if the Gamorreans would stop fighting to keep the places looking \
helf descent, but other then that the sights here are very \
pleaseing to the eye. The street carries on to the north, east\
and west or you can go south back to the Huntbird.\
", 
         Vnum = 28103, 
         Name = "Village Street.", 
      }, 
      [28104] = 
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
               DestinationVnum = 28105, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28121, 
               Direction = "south", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28103, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "You wonder through the village streets wondering where to go the sight\
here are very pleasant to thte eye, well it would be if the\
Gamorreans would stop fighting to keep the places looking  helf\
descent, but other then that the sights here are very  pleaseing to\
the eye. The street carries on the the south and back to the west, to\
the north is a gamorrean house.\
", 
         Vnum = 28104, 
         Name = "Village street.", 
      }, 
      [28105] = 
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
               DestinationVnum = 28106, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28104, 
               Direction = "south", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "", 
         Vnum = 28105, 
         Name = "Gamorrean House Hold.", 
      }, 
      [28106] = 
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
               DestinationVnum = 28105, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "", 
         Vnum = 28106, 
         Name = "Backroom.", 
      }, 
      [28107] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "You are standing in the the Black smith and leather work shop of the\
village. The smell of burning metals and drying hides fills the air\
in a sickening mixture of sents. There is the shop owner standing\
in the corner of the smithy looking over at some of the things she\
crafted.\
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
               DestinationVnum = 28103, 
               Direction = "east", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28107, 
         Flags = 
         {
            [7] = "NoMagic", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "Black Smithy and Leather Workshop.", 
      }, 
      [28108] = 
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
               DestinationVnum = 28109, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28112, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28103, 
               Direction = "south", 
            }, 
            [4] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28111, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "Wondering through the street, the strong smell of the male half of\
the Gamorrean race hits your nose like a ton of bricks. It is a \
very strong smell of urine as well as some other stench you really\
aren't to interested in finding out its origins. The street travels\
east, west and north as well as the way you came.\
", 
         Vnum = 28108, 
         Name = "Village Street.", 
      }, 
      [28109] = 
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
               DestinationVnum = 28110, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28108, 
               Direction = "south", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "The smell from the house you just past still makes your eyes burn,\
The street keeps going north and south but up ahead you notice it\
bend to the southwest. You are unable to see past that distance\
due to the houses and huts blocking your view. You just hope where\
ever this road leads you its to a place that smells better then this\
this village, then again nothing could smell worse then this.\
", 
         Vnum = 28109, 
         Name = "Village Street.", 
      }, 
      [28110] = 
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
               DestinationVnum = 28109, 
               Direction = "south", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28186, 
               Direction = "southwest", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "The street doesn't appear to be well used. There are no surounding\
houses or huts that you can see. The area looks to have been abandond\
for some reason that is unknown to you. You can smell the fragrance of\
a variety of different flowers as well as different types of trees, you \
also feel a nice cool breeze brush across your face. Street bends to\
the southwest and leads to a pathway.\
", 
         Vnum = 28110, 
         Name = "Village Street.", 
      }, 
      [28111] = 
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
               DestinationVnum = 28108, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28113, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "This pathways seems to be well used by the gammoreans of this tribe.\
You are thankfull that you have gotten away from the fowl odur of the\
males and pray to yourself that you never go through torture like\
that again. You can here the sounds from the main part of the village\
off in the distance as well as the wild birds and other animals that\
make the village there home.\
", 
         Vnum = 28111, 
         Name = "Village Pathway.", 
      }, 
      [28112] = 
      {
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
               DestinationVnum = 28108, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "The house is filthy and it needs some deoderant sprayed around, now\
you know where the smell from out in the street was coming from PEEW!\
You can't find anything of any interest in here and you feel the stench \
start burning you nostrils and making you stomach spin.\
", 
         Vnum = 28112, 
         Name = "A house.", 
      }, 
      [28113] = 
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
               DestinationVnum = 28111, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28117, 
               Direction = "south", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28115, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "You now stand in front of the matrons house of the Plains clan. The\
house is very nice compared to the huts and the other poor excusses\
for houses you've seen so far The trim around the doors and windows\
is a pretty bright pink, the roof is made  of clay that has a pinkish\
hue to it in fact you notice that most of the house is well, pink The\
matron seems to like the colour pink so much that she decided to have\
her house pink after all it is a very femminin colour....\
", 
         Vnum = 28113, 
         Name = "Front of The Alpha House.", 
      }, 
      [28114] = 
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
               DestinationVnum = 28115, 
               Direction = "north", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "This is the Alph-Females nursery. It smells absolutly fowl with these\
babies squirming  around in their little pens, the stench burns you\
nose nad the squealing is giving you a massive headache, though the\
babies do look a little appatising to you you moral judgment is\
telling you not to eat one but you hunger is telling you whet the\
heck why not!\
", 
         Vnum = 28114, 
         Name = "Alpha Nursery.", 
      }, 
      [28115] = 
      {
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
               DestinationVnum = 28116, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28113, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28114, 
               Direction = "south", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "&Y You look around at the inside of the small house and see that &P\
pink &Y &Y is absolutly everywhere, no matter where you look its &P\
pink &Y this and &P pink &Y that. It for some reason is makeing you\
feel a little nauseaus You hear the sound of babies to the south and\
quite frankly smell them too and to the north looks to be where the\
matron herself stays.\
", 
         Vnum = 28115, 
         Name = "Alpha House", 
      }, 
      [28116] = 
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
               DestinationVnum = 28115, 
               Direction = "south", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "You are standing in the quarters of the Alfa-Female, Ugmush. She is\
well known for her fierceness and she might not be to happy about\
intruders in her home. The house has a semi-pleasent odour to it\
considering the fact that its owned by a Gamorrean. You hear the\
comotion of the children in there bedrooms as well as the  adults\
outside the house.\
", 
         Vnum = 28116, 
         Name = "Alpha Females Quarters.", 
      }, 
      [28117] = 
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
               DestinationVnum = 28113, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28118, 
               Direction = "south", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "The pathway is hardly used, As you keep walking you can see the mountain is\
the distance getting bigger and bigger as you draw closer to it's base.\
From here you can see the forest crawls up the mountains bottom and\
reaches about one quarter of the way up until it tappers off into a\
spattering of trees here and there.\
", 
         Vnum = 28117, 
         Name = "A Pathway in the Village.", 
      }, 
      [28118] = 
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
               DestinationVnum = 28117, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28119, 
               Direction = "south", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "The pathway is hardly used, As you keep walking you can see the mountain is\
the distance getting bigger and bigger as you draw closer to it's base.\
From here you can see the forest crawls up the mountains bottom and\
reaches about one quarter of the way up until it tappers off into a\
spattering of trees here and there.\
", 
         Vnum = 28118, 
         Name = "More of the Path", 
      }, 
      [28119] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "The pathway is hardly used, As you keep walking you can see the mountain is\
the distance getting bigger and bigger as you draw closer to it's base.\
From here you can see the forest crawls up the mountains bottom and\
reaches about one quarter of the way up until it tappers off into a\
spattering of trees here and there.\
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
               DestinationVnum = 28118, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28120, 
               Direction = "east", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28119, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Name = "End of the Path", 
      }, 
      [28120] = 
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
               DestinationVnum = 28017, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28137, 
               Direction = "south", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28119, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
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
         Vnum = 28120, 
         Name = "In the Forest.", 
      }, 
      [28121] = 
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
               DestinationVnum = 28104, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28123, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28124, 
               Direction = "south", 
            }, 
            [4] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28122, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "Wondering through the streets, you notice to the east and west are \
small huts for the males of the tribe. To the south is more of the\
village street. You also see the streets full of various levels of\
females in the hierarchy of the Gamorrean society, you also notice \
that there is no sign of the Alpha Female anywhere to be seen.\
", 
         Vnum = 28121, 
         Name = "Village Street.", 
      }, 
      [28122] = 
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
               DestinationVnum = 28121, 
               Direction = "east", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "This is a small hut. Its main purpose in life is to shealter the \
males from the rain or the harsh rays of the afternoon sun. The Hut\
is made from wood scavenged from the near by forest and held \
together with mud and clay. It is also stune with blankets and \
there is the odd hamock streched out from wall to post here and \
there.\
", 
         Vnum = 28122, 
         Name = "A hut", 
      }, 
      [28123] = 
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
               DestinationVnum = 28121, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "This is a small hut. Its main purpose in life is to shealter the \
males from the rain or the harsh rays of the afternoon sun. The Hut\
is made from wood scavenged from the near by forest and held \
together with mud and clay. It is also stune with blankets and \
there is the odd hamock streched out from wall to post here and \
there.\
", 
         Vnum = 28123, 
         Name = "A hut", 
      }, 
      [28124] = 
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
               DestinationVnum = 28121, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28128, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28125, 
               Direction = "south", 
            }, 
            [4] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28130, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "Wondering through the streets, you notice to the east and west are\
small huts for the males of the tribe. To the south is more of the\
village street. You also see the streets full of various levels of\
females in the hierarchy of the Gamorrean society, you also notice\
that there is no sign of the Alpha Female anywhere to be seen.\
", 
         Vnum = 28124, 
         Name = "Village street.", 
      }, 
      [28125] = 
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
               DestinationVnum = 28124, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28126, 
               Direction = "south", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "Wondering through the streets, you notice to the east and west are\
small huts for the males of the tribe. To the south is more of the\
village street. You also see the streets full of various levels of\
females in the hierarchy of the Gamorrean society, you also notice\
that there is no sign of the Alpha Female anywhere to be seen.\
", 
         Vnum = 28125, 
         Name = "Village Street.", 
      }, 
      [28126] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
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
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28125, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28127, 
               Direction = "south", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28126, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Name = "End of The road.", 
      }, 
      [28127] = 
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
               DestinationVnum = 28126, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28163, 
               Direction = "south", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "The Gamorrean deset stretches on for miles. It is hot and you start to\
sweat almost immediatly. You can see the odd cactus here and there,\
as well as  the odd corpino scurrying past you in search of some\
shade. The relentless sun beats down on you neck causeing you to\
start gasping for some water, it is a wonder how anything could\
possibly live in such a harsh enviornment, but then again the\
gamorreans are a harsh people.\
", 
         Vnum = 28127, 
         Name = "Out in the desert.", 
      }, 
      [28128] = 
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
               DestinationVnum = 28135, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28136, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28129, 
               Direction = "south", 
            }, 
            [4] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28124, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "Wondering through the streets, you notice to the east and west are\
small huts for the males of the tribe. To the south is more of the\
village street. You also see the streets full of various levels of\
females in the hierarchy of the Gamorrean society, you also notice\
that there is no sign of the Alpha Female anywhere to be seen.\
", 
         Vnum = 28128, 
         Name = "Village path.", 
      }, 
      [28129] = 
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
               DestinationVnum = 28128, 
               Direction = "north", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "", 
         Vnum = 28129, 
         Name = "End of the Village Path.", 
      }, 
      [28130] = 
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
               DestinationVnum = 28124, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28133, 
               Direction = "south", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28132, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "Wondering through the streets, you notice to the east and west are\
small huts for the males of the tribe. To the south is more of the\
village street. You also see the streets full of various levels of\
females in the hierarchy of the Gamorrean society, you also notice\
that there is no sign of the Alpha Female anywhere to be seen. \
", 
         Vnum = 28130, 
         Name = "A path in the village.", 
      }, 
      [28131] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "You slowly sufficate to death....\
 \
 \
", 
         Sector = "city", 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Vnum = 28131, 
         Flags = 
         {
            [1] = "_Reserved", 
            [2] = "NoMob", 
         }, 
         Name = "Buried alive", 
      }, 
      [28132] = 
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
               DestinationVnum = 28130, 
               Direction = "east", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "This is another small hut. much like the others, its main purpose in\
life is to shealter the boars from the rain or the harsh rays of the\
afternoon sun. The hut is made from wood scavenged from the forest\
perimeter and held together with mud, clay and some what looks like\
leather bindings. It is also strune with blankets and the odd hamock\
stretched from wall to post.\
", 
         Vnum = 28132, 
         Name = "A Hut", 
      }, 
      [28133] = 
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
               DestinationVnum = 28130, 
               Direction = "north", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "This is another small hut. much like the others, its main purpose in\
life is to shealter the boars from the rain or the harsh rays of the\
afternoon sun. The hut is made from wood scavenged from the forest\
perimeter and held together with mud, clay and some what looks like\
leather bindings. It is also strune with blankets and the odd hamock\
stretched from wall to post.\
", 
         Vnum = 28133, 
         Name = "A Hut.", 
      }, 
      [28134] = 
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
               DestinationVnum = 28128, 
               Direction = "north", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "", 
         Vnum = 28134, 
         Name = "A Hut.", 
      }, 
      [28135] = 
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
               DestinationVnum = 28128, 
               Direction = "south", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "This is another small hut. much like the others, its main purpose in\
life is to shealter the boars from the rain or the harsh rays of the\
afternoon sun. The hut is made from wood scavenged from the forest\
perimeter and held together with mud, clay and some what looks like\
leather bindings. It is also strune with blankets and the odd hamock\
stretched from wall to post.\
", 
         Vnum = 28135, 
         Name = "A Hut.", 
      }, 
      [28136] = 
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
               DestinationVnum = 28128, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "This is another small hut. much like the others, its main purpose in\
life is to shealter the boars from the rain or the harsh rays of the\
afternoon sun. The hut is made from wood scavenged from the forest\
perimeter and held together with mud, clay and some what looks like\
leather bindings. It is also strune with blankets and the odd hamock\
stretched from wall to post.\
", 
         Vnum = 28136, 
         Name = "A Hut.", 
      }, 
      [28137] = 
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
               DestinationVnum = 28120, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28022, 
               Direction = "south", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28138, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
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
         Vnum = 28137, 
         Name = "Within the Forest", 
      }, 
      [28138] = 
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
               DestinationVnum = 28140, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28137, 
               Direction = "east", 
            }, 
         }, 
         TeleDelay = 0, 
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
         Vnum = 28138, 
         Name = "A path in the Forest.", 
      }, 
      [28139] = 
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
               DestinationVnum = 28120, 
               Direction = "north", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "", 
         Vnum = 28139, 
         Name = "in the Forest.", 
      }, 
      [28140] = 
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
               DestinationVnum = 28141, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28138, 
               Direction = "south", 
            }, 
         }, 
         TeleDelay = 0, 
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
         Vnum = 28140, 
         Name = "More of the Path.", 
      }, 
      [28141] = 
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
               DestinationVnum = 28142, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28140, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "The forest seems to go on forever. A slight breeze seduces your nose\
with its beautiful aromas and cool touch. Wild birds, of some kind\
fill  the air with their musical ensamble like you've never heard\
before, but deep in the forest you hear the preditors of the land\
hunting and capturing their prey as well as the prey screaming their\
last breath. \
", 
         Vnum = 28141, 
         Name = "Crocked Path.", 
      }, 
      [28142] = 
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
               DestinationVnum = 28143, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28141, 
               Direction = "south", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "The forest seems to go on forever. A slight breeze seduces your nose\
with its beautiful aromas and cool touch. Wild birds, of some kind\
fill the air with their musical ensamble like you've never heard\
before, but deep in the forest you hear the preditors of the land\
hunting and capturing their prey as well as the prey screaming their\
last breath. \
", 
         Vnum = 28142, 
         Name = "The Paths end.", 
      }, 
      [28143] = 
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
               DestinationVnum = 28144, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28142, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "The forest seems to go on forever. A slight breeze seduces your nose\
with its beautiful aromas and cool touch. Wild birds, of some kind\
fill the air with their musical ensamble like you've never heard\
before, but deep in the forest you hear the preditors of the land\
hunting and capturing their prey as well as the prey screaming their\
last breath. \
", 
         Vnum = 28143, 
         Name = "A Clearing.", 
      }, 
      [28144] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "This clearing leads you straight in to a villages entrance. Of course\
it is swarming with gamorreans and for some stange reason they are\
what is causing the strange noises in most of the forest. With what\
looks like a feast in honour of the Matron herself The smell of\
barbaque and some other thing fill the air with a wierd aroma. \
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
               DestinationVnum = 28145, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28143, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28144, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Name = "An Old Path.", 
      }, 
      [28145] = 
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
               DestinationVnum = 28146, 
               Direction = "south", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28144, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "This is the entrance to the Forest clans village. The entrance is\
guarded by two large coloumns made from a concrete type of matierial\
and stnads at least fifteen feet high and three feet wide. Inside the\
entrance it is swarming with gamorreans and for some strange reason\
they are what is causing the strange noises in most of the forest.\
With what looks like a feast in honour of the Matron herself The\
smell of barbaque and some other thing fill the air with a wierd\
aroma. \
", 
         Vnum = 28145, 
         Name = "Entrance to a Village.", 
      }, 
      [28146] = 
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
               DestinationVnum = 28145, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28152, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28147, 
               Direction = "south", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "The smell from the house you just past still makes your eyes burn, The\
street keeps going north and south but up ahead you notice it bend to\
the southwest. You are unable to see past that distance due to the\
houses and huts blocking your view. You just hope where ever this\
road leads you its to a place that smells better then this this\
village, then again nothing could smell worse then this.\
", 
         Vnum = 28146, 
         Name = "Village Street.", 
      }, 
      [28147] = 
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
               DestinationVnum = 28146, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28155, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28148, 
               Direction = "south", 
            }, 
            [4] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28154, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "The smell from the house you just past still makes your eyes burn, The\
street keeps going north and south but up ahead you notice it bend to\
the southwest. You are unable to see past that distance due to the\
houses and huts blocking your view. You just hope where ever this\
road leads you its to a place that smells better then this this\
village, then again nothing could smell worse then this.\
", 
         Vnum = 28147, 
         Name = "Village Street.", 
      }, 
      [28148] = 
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
               DestinationVnum = 28147, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28149, 
               Direction = "south", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28156, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "The smell from the house you just past still makes your eyes burn, The\
street keeps going north and south but up ahead you notice it bend to\
the southwest. You are unable to see past that distance due to the\
houses and huts blocking your view. You just hope where ever this\
road leads you its to a place that smells better then this this\
village, then again nothing could smell worse then this.\
", 
         Vnum = 28148, 
         Name = "Village Street.", 
      }, 
      [28149] = 
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
               DestinationVnum = 28148, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28157, 
               Direction = "south", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28150, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "The smell from the house you just past still makes your eyes burn, The\
street keeps going north and south but up ahead you notice it bend to\
the southwest. You are unable to see past that distance due to the\
houses and huts blocking your view. You just hope where ever this\
road leads you its to a place that smells better then this this\
village, then again nothing could smell worse then this.\
", 
         Vnum = 28149, 
         Name = "Village Street.", 
      }, 
      [28150] = 
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
               DestinationVnum = 28149, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28151, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "The street to the west ends on a semi circle of huts where you presume\
the male gamorreans sleep and gather for there clan war meetings.\
This part of the street turns west to this little ending and from\
there it goes no where but back to the spot. You can return back to\
the east and go back into the heart of the village or head into the\
dead end. \
", 
         Vnum = 28150, 
         Name = "A turn in the Village Street.", 
      }, 
      [28151] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "This little semi circle is surrounded by the male gamorreans huts. And\
you can tell by the smell they dont take good care of their living\
quarters, the smell of urine fills the air and burns your nose.\
Though the smell of the forest you were travelling in had such a\
sweet sent to it, the smell from these huts completly cancels out any\
presence of the forest with surrounds the entire village.\
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
               DestinationVnum = 28161, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28150, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28160, 
               Direction = "south", 
            }, 
            [4] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28162, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28151, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Name = "End of the Village Street.", 
      }, 
      [28152] = 
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
               DestinationVnum = 28153, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28146, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "This small path leads looks like it leads away from the village and\
straight back into the forest for some unknown reason. maybe its for\
future expansion of the village you have no idea nor do you really\
care. The path leads east and from what you can tell ends right there\
and right back into the forest.\
", 
         Vnum = 28152, 
         Name = "Small path in the Village.", 
      }, 
      [28153] = 
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
               DestinationVnum = 28152, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "This small path leads looks like it leads away from the village and\
straight back into the forest for some unknown reason. maybe its for\
future expansion of the village you have no idea nor do you really\
care. The path leads east and from what you can tell ends right there\
and right back into the forest.\
", 
         Vnum = 28153, 
         Name = "Small path.", 
      }, 
      [28154] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "This store has all its supplies on the wall behind the counter, to prevent\
slippery little hands from snatching the goods that might have been on\
shelves in the middle of the store.  The gamorrean behind the counter\
doesnt look to pleasent either she looks like she was hit by a swoop and\
draged for a few light years on her face.\
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
               DestinationVnum = 28147, 
               Direction = "east", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28154, 
         Flags = 
         {
            [10] = "Safe", 
         }, 
         Name = "General Store.", 
      }, 
      [28155] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "You are standing in the forest clans water supply shop, the funny thing is,\
it seems that the clan members dont have to pay for their water and oddly\
enough the off worlders have to pay the highest prices for something as\
abundent as water. You come the the conclusion the these clan people are\
nothing but crooks. The walls in the shop are lind with different types of\
ancient canteens, this place is almost like a canteen museum.\
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
               DestinationVnum = 28147, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28155, 
         Flags = 
         {
            [10] = "Safe", 
         }, 
         Name = "Water shop.", 
      }, 
      [28156] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
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
         Sector = "city", 
         Exits = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28148, 
               Direction = "east", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28156, 
         Flags = 
         {
            [10] = "Safe", 
         }, 
         Name = "Arms for Sale.", 
      }, 
      [28157] = 
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
               DestinationVnum = 28149, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28158, 
               Direction = "south", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "This path is wider then most of the other paths you have encountered thus\
far, to the south you notice that the path comes to an end and leads\
straight to the alpha females house. The path is also loaded with\
gamorreans coming and going to and from the matrons house, paying homage\
and mostly the males are trying to find out when the next mateing battles\
will take place.\
", 
         Vnum = 28157, 
         Name = "A Wide Path.", 
      }, 
      [28158] = 
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
               DestinationVnum = 28157, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 28159, 
               Direction = "south", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "This path is wider then most of the other paths you have encountered thus\
far, to the south you notice that the path comes to an end and leads\
straight to the alpha females house. The path is also loaded with\
gamorreans coming and going to and from the matrons house, paying homage\
and mostly the males are trying to find out when the next mateing battles\
will take place. \
", 
         Vnum = 28158, 
         Name = "End of the path.", 
      }, 
      [28159] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "This is the home of the matron, the house is made a little better then the\
other huts made from stick and such, this one is made from trees that were\
cut into palnks and held together with mud and nails and its real sturdy\
which is the obvious reason why the matron has made it her home.\
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
               DestinationVnum = 28158, 
               Direction = "north", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 28159, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Name = "House of the Alfa female.", 
      }, 
   }, 
   Mobiles = 
   {
      [28000] = 
      {
         HitRoll = 5, 
         Description = "", 
         Level = 100, 
         Credits = 5000, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Vnum = 28000, 
         DefaultPosition = "standing", 
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
         ShortDescr = "A Strange man ", 
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
         Race = "Human", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         NumberOfAttacks = 3, 
         LongDescr = "A strange man is sitting here meditating.\
", 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
         Weight = 0, 
         Position = "standing", 
         Sex = "undistinguished", 
         DamRoll = 5, 
         Height = 0, 
         Alignment = 1000, 
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
         ArmorClass = -50, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Name = "A Strange man ", 
      }, 
      [28001] = 
      {
         HitRoll = 0, 
         Description = "", 
         Level = 10, 
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
               MudProgType = "rand_prog", 
               Code = "grunt\
", 
               Arguments = "5", 
            }, 
            [2] = 
            {
               MudProgType = "fight_prog", 
               Code = "mpechoat $n The Gamorrean head butts you!\
mpechoaround $n The Gamorrean headbutts $n!\
mpdamage $n 15\
", 
               Arguments = "30", 
            }, 
         }, 
         Vnum = 28001, 
         DefaultPosition = "standing", 
         ShortDescr = "A Gamorrean male", 
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
         Race = "Gamorrean", 
         HitChance = 
         {
            HitNoDice = 2, 
            HitSizeDice = 10, 
            HitPlus = 100, 
         }, 
         NumberOfAttacks = 2, 
         LongDescr = "A Gamorrean male wanders around here.\
", 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 2, 
            DamSizeDice = 6, 
         }, 
         VipFlags = 
         {
            [7] = "Gamorr", 
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
               [14] = "gamorrese", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [14] = "gamorrese", 
            }, 
         }, 
         ArmorClass = 10, 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         Name = "A Gamorrean male", 
      }, 
      [28002] = 
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
         Vnum = 28002, 
         DefaultPosition = "standing", 
         ShortDescr = "A Gamorrean child", 
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
         Race = "Gamorrean", 
         HitChance = 
         {
            HitNoDice = 1, 
            HitSizeDice = 1, 
            HitPlus = 30, 
         }, 
         NumberOfAttacks = 1, 
         LongDescr = "A Gamorrean child is playing around here\
", 
         Damage = 
         {
            DamPlus = 3, 
            DamNoDice = 1, 
            DamSizeDice = 3, 
         }, 
         Weight = 0, 
         Position = "standing", 
         Sex = "male", 
         DamRoll = 0, 
         Height = 0, 
         Alignment = 0, 
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
         ArmorClass = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [7] = "Wimpy", 
         }, 
         Name = "gamorrean child kid piglet", 
      }, 
      [28003] = 
      {
         HitRoll = 15, 
         Description = "You've heard about these guys they are nothing to be messed with, they\
are cunning evil and like to eat living flesh. nothing on this planet\
has the same reputation as the watch-beast so watch you step it could\
be you last!\
 \
", 
         Level = 60, 
         Credits = 0, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Vnum = 28003, 
         DefaultPosition = "standing", 
         ShortDescr = "A Gamorreans watch-beast", 
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
         Race = "Gamorrean", 
         HitChance = 
         {
            HitNoDice = 1, 
            HitSizeDice = 1, 
            HitPlus = 1000, 
         }, 
         NumberOfAttacks = 3, 
         LongDescr = "A Gamorreans watch-beast is eatting a freshly killed tourist\
", 
         Damage = 
         {
            DamPlus = 6, 
            DamNoDice = 6, 
            DamSizeDice = 6, 
         }, 
         Weight = 0, 
         Position = "standing", 
         Sex = "undistinguished", 
         DamRoll = 10, 
         Height = 0, 
         Alignment = 0, 
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
         ArmorClass = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [5] = "Aggressive", 
         }, 
         Name = "gamorrean watch beast big pig ", 
      }, 
      [28004] = 
      {
         HitRoll = 6, 
         Description = "", 
         Level = 30, 
         Credits = 0, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Vnum = 28004, 
         DefaultPosition = "standing", 
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
         ShortDescr = "a Desert Beitl", 
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
         Race = "Human", 
         HitChance = 
         {
            HitNoDice = 6, 
            HitSizeDice = 10, 
            HitPlus = 300, 
         }, 
         NumberOfAttacks = 0, 
         LongDescr = "A ferocious Desert Beitl is basking in the desert sun.\
", 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 4, 
            DamSizeDice = 4, 
         }, 
         Weight = 0, 
         Position = "standing", 
         Sex = "undistinguished", 
         DamRoll = 6, 
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
               [0] = "basic", 
            }, 
         }, 
         ArmorClass = 25, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [5] = "Aggressive", 
            [18] = "Mountable", 
         }, 
         Name = "Beitl beast terrible run RUN RUN AWAY", 
      }, 
      [28005] = 
      {
         HitRoll = 12, 
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
         Vnum = 28005, 
         DefaultPosition = "standing", 
         ShortDescr = "Shushgu", 
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
         Race = "Gamorrean", 
         HitChance = 
         {
            HitNoDice = 18, 
            HitSizeDice = 10, 
            HitPlus = 900, 
         }, 
         NumberOfAttacks = 0, 
         LongDescr = "It's Shushgu, One of the Alpha-females Husbands.\
", 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 11, 
            DamSizeDice = 4, 
         }, 
         Weight = 0, 
         Position = "standing", 
         Sex = "male", 
         DamRoll = 11, 
         Height = 0, 
         Alignment = 0, 
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
         ArmorClass = -76, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
         }, 
         Name = "boar head shushgu", 
      }, 
      [28006] = 
      {
         HitRoll = 0, 
         Description = "", 
         Level = 10, 
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
               Code = "get baby\
grow\
l $n\
eat baby\
", 
               Arguments = "100", 
            }, 
         }, 
         HitChance = 
         {
            HitNoDice = 2, 
            HitSizeDice = 10, 
            HitPlus = 100, 
         }, 
         Vnum = 28006, 
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
         AffectedBy = 
         {
            [1] = "Invisible", 
            [15] = "Sneak", 
            [9] = "Infrared", 
         }, 
         AttackFlags = 
         {
            [1] = "claws", 
         }, 
         Race = "Human", 
         ShortDescr = "A Gurda Beast", 
         NumberOfAttacks = 0, 
         LongDescr = "A Gurda Beast is prowling around in the mountain shadows.\
", 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 1, 
            DamSizeDice = 6, 
         }, 
         Weight = 0, 
         Position = "standing", 
         Sex = "undistinguished", 
         DamRoll = 2, 
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
               [0] = "basic", 
            }, 
         }, 
         ArmorClass = 75, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [5] = "Aggressive", 
         }, 
         Name = "gurda beast ", 
      }, 
      [28007] = 
      {
         HitRoll = 2, 
         Description = "", 
         Level = 10, 
         Credits = 0, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Vnum = 28007, 
         DefaultPosition = "standing", 
         ShortDescr = "An Imperial Stormtrooper", 
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
         Race = "Human", 
         HitChance = 
         {
            HitNoDice = 2, 
            HitSizeDice = 10, 
            HitPlus = 100, 
         }, 
         NumberOfAttacks = 0, 
         LongDescr = "An Imperial Stormtrooper is loading infant Gamorrean watch-beasts\
", 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 1, 
            DamSizeDice = 6, 
         }, 
         Weight = 0, 
         Position = "standing", 
         Sex = "male", 
         DamRoll = 2, 
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
               [0] = "basic", 
            }, 
         }, 
         ArmorClass = 77, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Name = "Imperial stormtrooper", 
      }, 
      [28008] = 
      {
         HitRoll = 2, 
         Description = "", 
         Level = 10, 
         Credits = 0, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Vnum = 28008, 
         DefaultPosition = "standing", 
         ShortDescr = "An Imperial Stormtrooper", 
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
         Race = "Human", 
         HitChance = 
         {
            HitNoDice = 2, 
            HitSizeDice = 10, 
            HitPlus = 100, 
         }, 
         NumberOfAttacks = 0, 
         LongDescr = "An Imperial Stormtrooper has his blaster aimed at the watch-beasts.\
", 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 1, 
            DamSizeDice = 6, 
         }, 
         Weight = 0, 
         Position = "standing", 
         Sex = "male", 
         DamRoll = 2, 
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
               [0] = "basic", 
            }, 
         }, 
         ArmorClass = 77, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Name = "Imperial stormtrooper", 
      }, 
      [28009] = 
      {
         HitRoll = 7, 
         Description = "", 
         Level = 70, 
         Credits = 0, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Vnum = 28009, 
         DefaultPosition = "standing", 
         ShortDescr = "Jos", 
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
         Race = "Gamorrean", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         NumberOfAttacks = 0, 
         LongDescr = "Jos, The Alpha-females third Husband\
", 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 4, 
            DamSizeDice = 7, 
         }, 
         Weight = 0, 
         Position = "standing", 
         Sex = "male", 
         DamRoll = 7, 
         Height = 0, 
         Alignment = 0, 
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
         ArmorClass = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [25] = "NoKill", 
         }, 
         Name = "Jos third husband", 
      }, 
      [28010] = 
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
         Vnum = 28010, 
         DefaultPosition = "standing", 
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
         ShortDescr = "A Gamorrean guard", 
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
         Race = "Gamorrean", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         NumberOfAttacks = 0, 
         LongDescr = "A Gamorrean stands guard here\
", 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
         Weight = 0, 
         Position = "standing", 
         Sex = "male", 
         DamRoll = 0, 
         Height = 0, 
         Alignment = 0, 
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
         ArmorClass = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [2] = "Scavenger", 
            [0] = "Npc", 
         }, 
         Name = "gamorrean guard", 
      }, 
      [28011] = 
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
         Vnum = 28011, 
         DefaultPosition = "standing", 
         Shop = 
         {
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            ProfitBuy = 120, 
            ProfitSell = 90, 
            KeeperShortDescr = "The shop owner", 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
         }, 
         ShortDescr = "The shop owner", 
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
         Race = "Human", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         NumberOfAttacks = 0, 
         LongDescr = "The Small stands owner is selling refreshing drinks here\
", 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
         Weight = 0, 
         Position = "standing", 
         Sex = "undistinguished", 
         DamRoll = 0, 
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
               [0] = "basic", 
            }, 
         }, 
         ArmorClass = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Name = "stand owner ", 
      }, 
      [28012] = 
      {
         HitRoll = 15, 
         Description = "", 
         Level = 70, 
         Credits = 240, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Vnum = 28012, 
         DefaultPosition = "standing", 
         ShortDescr = "Fruck", 
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
         Race = "Gamorrean", 
         HitChance = 
         {
            HitNoDice = 10, 
            HitSizeDice = 10, 
            HitPlus = 100, 
         }, 
         NumberOfAttacks = 0, 
         LongDescr = "Fruck is here keeping watch over Ugmush's ship.\
", 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 8, 
            DamSizeDice = 4, 
         }, 
         Weight = 0, 
         Position = "standing", 
         Sex = "male", 
         DamRoll = 15, 
         Height = 0, 
         Alignment = 0, 
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
         ArmorClass = -30, 
         Flags = 
         {
            [0] = "Npc", 
            [25] = "NoKill", 
         }, 
         Name = "Fruck", 
      }, 
      [28013] = 
      {
         HitRoll = 0, 
         Description = "", 
         Level = 3, 
         Credits = 0, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Vnum = 28013, 
         DefaultPosition = "standing", 
         SpecFuns = 
         {
            [0] = "spec_fido", 
         }, 
         ShortDescr = "a raxe pest", 
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
         Race = "Human", 
         HitChance = 
         {
            HitNoDice = 1, 
            HitSizeDice = 1, 
            HitPlus = 30, 
         }, 
         NumberOfAttacks = 0, 
         LongDescr = "A raxe pest is scurrying around here.\
", 
         Damage = 
         {
            DamPlus = 3, 
            DamNoDice = 3, 
            DamSizeDice = 1, 
         }, 
         Weight = 0, 
         Position = "standing", 
         Sex = "undistinguished", 
         DamRoll = 0, 
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
               [0] = "basic", 
            }, 
         }, 
         ArmorClass = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Name = "raxe pest ", 
      }, 
      [28014] = 
      {
         HitRoll = 0, 
         Description = "This is the Zicreex, well known around Gamorr for its hunting of the\
natives most gamorreans keep a safe distance from these hungry beasts\
and with good reason too the Zicreexs diet mainly consists of\
gamorreans.\
 \
", 
         Level = 30, 
         Credits = 0, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Vnum = 28014, 
         DefaultPosition = "standing", 
         ShortDescr = "a zicreex beast ", 
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
         Race = "Human", 
         HitChance = 
         {
            HitNoDice = 6, 
            HitSizeDice = 10, 
            HitPlus = 300, 
         }, 
         NumberOfAttacks = 0, 
         LongDescr = "A Zicreex beast is on the hunt here.\
", 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 4, 
            DamSizeDice = 4, 
         }, 
         Weight = 0, 
         Position = "standing", 
         Sex = "undistinguished", 
         DamRoll = 0, 
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
               [0] = "basic", 
            }, 
         }, 
         ArmorClass = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [5] = "Aggressive", 
         }, 
         Name = "zicreex beast", 
      }, 
      [28015] = 
      {
         HitRoll = 0, 
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
               Code = "mpecho With her last bit of strength, Shaga desperatly tries to hold\
mpecho onto the clans sacred stone.\
mpoload 28030\
drop all\
", 
               Arguments = "100", 
            }, 
         }, 
         ShortDescr = "Shaga", 
         Vnum = 28015, 
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
         Weight = 0, 
         AttackFlags = 
         {
            [9] = "_09", 
            [4] = "punch", 
            [5] = "kick", 
            [6] = "_06", 
            [7] = "_07", 
         }, 
         Race = "Gamorrean", 
         HitChance = 
         {
            HitNoDice = 18, 
            HitSizeDice = 10, 
            HitPlus = 900, 
         }, 
         NumberOfAttacks = 2, 
         LongDescr = "Shaga the mountain clan matron is standing here.\
", 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 11, 
            DamSizeDice = 4, 
         }, 
         VipFlags = 
         {
            [7] = "Gamorr", 
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
               [14] = "gamorrese", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [14] = "gamorrese", 
            }, 
         }, 
         ArmorClass = -74, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Name = "shaga mountain matron", 
      }, 
      [28016] = 
      {
         HitRoll = 0, 
         Description = "This old human man seems to be content just gazing at the stars. He is\
dressed in a long hooded cloak and old brown boots. from the scars on\
his face you think that this man has seen a fair share of action in\
his days.\
Maybe he could teach you a thing or two....\
", 
         Level = 103, 
         Credits = 0, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Vnum = 28016, 
         DefaultPosition = "standing", 
         ShortDescr = "a gamorrean shaman", 
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
         Race = "Human", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         NumberOfAttacks = 0, 
         LongDescr = "A gamorrean shaman is sitting here.\
", 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
         Weight = 0, 
         Position = "sitting", 
         Sex = "undistinguished", 
         DamRoll = 0, 
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
               [0] = "basic", 
            }, 
         }, 
         ArmorClass = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [10] = "Practice", 
            [20] = "Scholar", 
         }, 
         Name = "shaman gamorrean healer", 
      }, 
      [28017] = 
      {
         HitRoll = 0, 
         Description = "", 
         Level = 20, 
         Credits = 0, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Vnum = 28017, 
         DefaultPosition = "standing", 
         Shop = 
         {
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            ProfitBuy = 120, 
            ProfitSell = 90, 
            KeeperShortDescr = "a gamorrean shop keeper", 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
         }, 
         ShortDescr = "a gamorrean shop keeper", 
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
         Race = "Gamorrean", 
         HitChance = 
         {
            HitNoDice = 1, 
            HitSizeDice = 1, 
            HitPlus = 12998, 
         }, 
         NumberOfAttacks = 0, 
         LongDescr = "A gamorrean shop keeper is selling some water goods.\
", 
         Damage = 
         {
            DamPlus = 10, 
            DamNoDice = 10, 
            DamSizeDice = 5, 
         }, 
         Weight = 0, 
         Position = "standing", 
         Sex = "female", 
         DamRoll = 0, 
         Height = 0, 
         Alignment = 0, 
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
         ArmorClass = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Name = "gamorrean shop owner", 
      }, 
      [28018] = 
      {
         HitRoll = 0, 
         Description = "", 
         Level = 20, 
         Credits = 0, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Vnum = 28018, 
         DefaultPosition = "standing", 
         Shop = 
         {
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            ProfitBuy = 120, 
            ProfitSell = 90, 
            KeeperShortDescr = "The Gamorrean Shop keeper", 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
         }, 
         ShortDescr = "The Gamorrean Shop keeper", 
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
         Race = "Gamorrean", 
         HitChance = 
         {
            HitNoDice = 1, 
            HitSizeDice = 1, 
            HitPlus = 12998, 
         }, 
         NumberOfAttacks = 0, 
         LongDescr = "A gamorrean shop keeper is selling some goods here.\
", 
         Damage = 
         {
            DamPlus = 10, 
            DamNoDice = 10, 
            DamSizeDice = 5, 
         }, 
         Weight = 0, 
         Position = "standing", 
         Sex = "female", 
         DamRoll = 0, 
         Height = 0, 
         Alignment = 0, 
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
         ArmorClass = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Name = "gamorrean shop owner", 
      }, 
      [28019] = 
      {
         HitRoll = 0, 
         Description = "", 
         Level = 20, 
         Credits = 0, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Vnum = 28019, 
         DefaultPosition = "standing", 
         Shop = 
         {
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            ProfitBuy = 120, 
            ProfitSell = 90, 
            KeeperShortDescr = "The Gamorrean Shop keeper", 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
         }, 
         ShortDescr = "The Gamorrean Shop keeper", 
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
         Race = "Gamorrean", 
         HitChance = 
         {
            HitNoDice = 1, 
            HitSizeDice = 1, 
            HitPlus = 12998, 
         }, 
         NumberOfAttacks = 0, 
         LongDescr = "A gamorrean shop keeper is selling some of her weapons here.\
", 
         Damage = 
         {
            DamPlus = 10, 
            DamNoDice = 10, 
            DamSizeDice = 5, 
         }, 
         Weight = 0, 
         Position = "standing", 
         Sex = "female", 
         DamRoll = 0, 
         Height = 0, 
         Alignment = 0, 
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
         ArmorClass = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Name = "gamorrean shop owner", 
      }, 
      [28020] = 
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
         Vnum = 28020, 
         DefaultPosition = "standing", 
         ShortDescr = "a noghri", 
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
         Race = "Shistavanen", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         NumberOfAttacks = 0, 
         LongDescr = "A noghri is sitting here minding his own business.\
", 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
         Weight = 0, 
         Position = "standing", 
         Sex = "male", 
         DamRoll = 0, 
         Height = 0, 
         Alignment = 0, 
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
         ArmorClass = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Name = "noghri patron", 
      }, 
      [28021] = 
      {
         HitRoll = 9, 
         Description = "", 
         Level = 40, 
         Credits = 0, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Vnum = 28021, 
         DefaultPosition = "standing", 
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
         ShortDescr = "A trandoshan hunter", 
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
         Race = "Trandoshan", 
         HitChance = 
         {
            HitNoDice = 10, 
            HitSizeDice = 9, 
            HitPlus = 450, 
         }, 
         NumberOfAttacks = 0, 
         LongDescr = "A trandoshan hunter is sitting here watching out for something.\
", 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 8, 
            DamSizeDice = 3, 
         }, 
         Weight = 0, 
         Position = "standing", 
         Sex = "male", 
         DamRoll = 9, 
         Height = 0, 
         Alignment = 0, 
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
         ArmorClass = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Name = "trandoshan hunter", 
      }, 
      [28022] = 
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
         Vnum = 28022, 
         DefaultPosition = "standing", 
         ShortDescr = "a newly created wookiee", 
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
         Race = "Wookiee", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         NumberOfAttacks = 0, 
         LongDescr = "Some god abandoned a newly created wookiee here.\
", 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
         Weight = 0, 
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
               [0] = "basic", 
            }, 
         }, 
         ArmorClass = 0, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Name = "wookiee", 
      }, 
      [28023] = 
      {
         HitRoll = 0, 
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
               Code = "mpecho Shugsha drops a shield as she collapses to the ground.\
mpoload 28029\
", 
               Arguments = "100", 
            }, 
         }, 
         Vnum = 28023, 
         DefaultPosition = "standing", 
         ShortDescr = "Shugsha", 
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
         AttackFlags = 
         {
            [9] = "_09", 
            [4] = "punch", 
            [5] = "kick", 
            [6] = "_06", 
            [7] = "_07", 
         }, 
         Race = "Gamorrean", 
         HitChance = 
         {
            HitNoDice = 18, 
            HitSizeDice = 10, 
            HitPlus = 900, 
         }, 
         NumberOfAttacks = 6, 
         LongDescr = "Shugsha the forest clan matron is here.\
", 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 11, 
            DamSizeDice = 4, 
         }, 
         Weight = 0, 
         Position = "standing", 
         Sex = "female", 
         DamRoll = 0, 
         Height = 0, 
         Alignment = 0, 
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
         ArmorClass = -74, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Name = "Shugsha", 
      }, 
      [28025] = 
      {
         HitRoll = 0, 
         Description = "", 
         Level = 10, 
         Credits = 0, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Vnum = 28025, 
         DefaultPosition = "standing", 
         ShortDescr = "A Female Gamorrean", 
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
         Race = "Gamorrean", 
         HitChance = 
         {
            HitNoDice = 2, 
            HitSizeDice = 10, 
            HitPlus = 100, 
         }, 
         NumberOfAttacks = 2, 
         LongDescr = "A Female Gamorrean is going to collect the crops.\
", 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 2, 
            DamSizeDice = 6, 
         }, 
         Weight = 0, 
         Position = "standing", 
         Sex = "male", 
         DamRoll = 0, 
         Height = 0, 
         Alignment = 0, 
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
         ArmorClass = 10, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Name = "female gamorrean", 
      }, 
      [28139] = 
      {
         HitRoll = 0, 
         Description = "", 
         Level = 10, 
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
               MudProgType = "rand_prog", 
               Code = "drool\
", 
               Arguments = "10", 
            }, 
         }, 
         Vnum = 28139, 
         DefaultPosition = "standing", 
         ShortDescr = "A large Morrt", 
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
         AttackFlags = 
         {
            [0] = "bite", 
         }, 
         Race = "Human", 
         HitChance = 
         {
            HitNoDice = 1, 
            HitSizeDice = 1, 
            HitPlus = 100, 
         }, 
         NumberOfAttacks = 0, 
         LongDescr = "A hungery Morrt is crawling around the ground here.\
", 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 0, 
            DamSizeDice = 0, 
         }, 
         Weight = 0, 
         Position = "standing", 
         Sex = "undistinguished", 
         DamRoll = 10, 
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
               [0] = "basic", 
            }, 
         }, 
         ArmorClass = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [5] = "Aggressive", 
            [2] = "Scavenger", 
            [6] = "StayArea", 
         }, 
         Name = "morrt", 
      }, 
      [28116] = 
      {
         HitRoll = 14, 
         Description = "Ugmush is a Beauty to the Gamorreans, she has a long pink wig and her\
heavy muscled arms and breasts are sporting fifteen parasitic morrts\
to demonstrate her strength and endurance.   \
 \
", 
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
               Code = "mpecho &YWith her dying breath Ugmush drops a cerimonial axe.\
mpoload 28028\
", 
               Arguments = "100", 
            }, 
         }, 
         Vnum = 28116, 
         DefaultPosition = "standing", 
         ShortDescr = "Ugmush", 
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
         AttackFlags = 
         {
            [9] = "_09", 
            [4] = "punch", 
            [5] = "kick", 
            [6] = "_06", 
            [7] = "_07", 
         }, 
         Race = "Gamorrean", 
         HitChance = 
         {
            HitNoDice = 18, 
            HitSizeDice = 10, 
            HitPlus = 900, 
         }, 
         NumberOfAttacks = 6, 
         LongDescr = "The Alpha-Female Ugmush stands before you.\
", 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 11, 
            DamSizeDice = 4, 
         }, 
         Weight = 0, 
         Position = "standing", 
         Sex = "female", 
         DamRoll = 14, 
         Height = 0, 
         Alignment = 0, 
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
         ArmorClass = -74, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Name = "Ugmush alpha female", 
      }, 
      [28107] = 
      {
         HitRoll = 0, 
         Description = "", 
         Level = 20, 
         Credits = 0, 
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
            KeeperShortDescr = "The Gamorrean Shop keeper", 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
         }, 
         Vnum = 28107, 
         DefaultPosition = "standing", 
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
         ShortDescr = "The Gamorrean Shop keeper", 
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
         Race = "Gamorrean", 
         HitChance = 
         {
            HitNoDice = 1, 
            HitSizeDice = 1, 
            HitPlus = 12998, 
         }, 
         NumberOfAttacks = 0, 
         LongDescr = "The Gamorrean shop keeper is selling her weapons.\
", 
         Damage = 
         {
            DamPlus = 10, 
            DamNoDice = 10, 
            DamSizeDice = 5, 
         }, 
         Weight = 0, 
         Position = "standing", 
         Sex = "female", 
         DamRoll = 0, 
         Height = 0, 
         Alignment = 0, 
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
         ArmorClass = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Name = "Gamorrean Shop keeper.", 
      }, 
   }, 
   VnumRanges = 
   {
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
      Mob = 
      {
         First = 28000, 
         Last = 28139, 
      }, 
   }, 
   HighEconomy = 0, 
   FileFormatVersion = 1, 
   LowEconomy = 99944529, 
   Filename = "gamorr.lua", 
   Name = "Gamorr", 
}
