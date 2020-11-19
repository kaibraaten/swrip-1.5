-- Coruscant Academy
-- Last saved Thursday 19-Nov-2020 14:31:09

AreaEntry
{
   VnumRanges = 
   {
      Mob = 
      {
         First = 10340, 
         Last = 10499, 
      }, 
      Object = 
      {
         First = 10300, 
         Last = 10499, 
      }, 
      Room = 
      {
         First = 10300, 
         Last = 10430, 
      }, 
   }, 
   Objects = 
   {
      [10304] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "This is a helmet made of fine iron, from the Darkhaven Academy.  It will\
\13protect you until you can find better.\
\13", 
               Keyword = "helmet iron", 
            }, 
         }, 
         Vnum = 10304, 
         Cost = 0, 
         Affects = 
         {
            [1] = 
            {
               Modifier = 1, 
               Location = 3, 
            }, 
         }, 
         ShortDescr = "an academy cap", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "drop_prog", 
               Code = "mpforce $n sac $o\
", 
               Arguments = "100", 
               ScriptType = "MProg", 
            }, 
         }, 
         Weight = 2, 
         Layers = 0, 
         Name = "academy cap", 
         Description = "A Coruscant Academy cap is here.", 
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
      [10305] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "This cape is made from a heavy brocade. It will offer you warmth and\
\13protection until you can find something better. You can find it at the\
\13Darkhave Academy.\
\13", 
               Keyword = "cape brocade", 
            }, 
         }, 
         Vnum = 10305, 
         Cost = 0, 
         ShortDescr = "a black brocade cape", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "drop_prog", 
               Code = "mpforce $n sac $o\
", 
               Arguments = "100", 
               ScriptType = "MProg", 
            }, 
         }, 
         Weight = 3, 
         Layers = 0, 
         Name = "cape brocade academy", 
         Description = "A black brocade cape from the academy", 
         ActionDescription = "", 
         ItemType = "armor", 
         WearFlags = 
         {
            [0] = "Take", 
            [10] = "About", 
         }, 
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
      }, 
      [10306] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "This collar fits closely around your neck. It is thick with spikes to\
\13protect you in battle. You can find it in the Darkhaven Academy\
\13", 
               Keyword = "collar metal ", 
            }, 
         }, 
         Vnum = 10306, 
         Cost = 0, 
         ShortDescr = "a strong metal collar", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "drop_prog", 
               Code = "mpforce $n sac $o\
", 
               Arguments = "100", 
               ScriptType = "MProg", 
            }, 
         }, 
         Weight = 5, 
         Layers = 0, 
         Name = "collar metal academy", 
         Description = "A strong metal collar from the academy", 
         ActionDescription = "", 
         ItemType = "armor", 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
         }, 
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 3, 
         }, 
      }, 
      [10307] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "Congratulations! You have completed the Darkhaven Academy and can now\
\13wear this visor with pride! It is magic too, type WEAR VISOR to use.\
\13", 
               Keyword = "visor completion", 
            }, 
         }, 
         Flags = 
         {
            [6] = "Magic", 
         }, 
         Vnum = 10307, 
         Cost = 0, 
         Affects = 
         {
            [1] = 
            {
               Modifier = 1, 
               Location = 4, 
            }, 
            [2] = 
            {
               Modifier = 1, 
               Location = 3, 
            }, 
         }, 
         ShortDescr = "a visor of completion", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "wear_prog", 
               Code = "mpechoat $n As you wear this visor, you feel more intelligent and wise!\
mpechoaround $n As $n wears the visor of completion, $e looks more complete!\
", 
               Arguments = "100", 
               ScriptType = "MProg", 
            }, 
         }, 
         Weight = 1, 
         Layers = 0, 
         Name = "visor completion academy", 
         Description = "A visor of completion is here, emitting a faint glow.", 
         ActionDescription = "", 
         ItemType = "armor", 
         WearFlags = 
         {
            [0] = "Take", 
            [17] = "Eyes", 
         }, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
      }, 
      [10308] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "This plate of armour will give you protection until you can find\
\13something better. \
\13", 
               Keyword = "plate armour", 
            }, 
         }, 
         Vnum = 10308, 
         Cost = 0, 
         ShortDescr = "an academy vest", 
         Weight = 5, 
         Layers = 0, 
         Name = "academy vest", 
         Description = "An academy vest was left here.", 
         ActionDescription = "", 
         ItemType = "armor", 
         WearFlags = 
         {
            [0] = "Take", 
            [3] = "Body", 
         }, 
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
      }, 
      [10309] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "This sleeves will protect your arms until you can find something better.\
\13You can find them in the Darkhaven Academy.\
\13", 
               Keyword = "sleeves tin", 
            }, 
         }, 
         Vnum = 10309, 
         Cost = 0, 
         Affects = 
         {
            [1] = 
            {
               Modifier = 1, 
               Location = 1, 
            }, 
         }, 
         ShortDescr = "lightweight tin sleeves", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "drop_prog", 
               Code = "mpforce $n sac $o\
", 
               Arguments = "100", 
               ScriptType = "MProg", 
            }, 
         }, 
         Weight = 1, 
         Layers = 0, 
         Name = "sleeves tin academy", 
         Description = "Lightweight tin sleeves from the academy", 
         ActionDescription = "", 
         ItemType = "armor", 
         WearFlags = 
         {
            [0] = "Take", 
            [8] = "Arms", 
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
      [10310] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "This is your first shield, it will help keep you safe until you can\
\13find something better.\
\13", 
               Keyword = "shield crest", 
            }, 
         }, 
         Vnum = 10310, 
         Cost = 0, 
         ShortDescr = "an energy shield", 
         Weight = 5, 
         Layers = 0, 
         Name = "forceshield energyshield shields shield", 
         Description = "An energy shield was dropped here.", 
         ActionDescription = "", 
         ItemType = "armor", 
         WearFlags = 
         {
            [0] = "Take", 
            [9] = "Shield", 
         }, 
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
      }, 
      [10311] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [0] = "Glow", 
            [13] = "Inventory", 
            [6] = "Magic", 
         }, 
         Vnum = 10311, 
         Cost = 5, 
         ShortDescr = "a glowrod", 
         Affects = 
         {
            [1] = 
            {
               Modifier = -1, 
               Location = 24, 
            }, 
         }, 
         Weight = 1, 
         Layers = 0, 
         Name = "light glowrod glowstick", 
         Description = "A glowrod would make a good light source.", 
         ActionDescription = "", 
         ItemType = "light", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 50, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
      }, 
      [10312] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [6] = "Magic", 
         }, 
         Vnum = 10312, 
         Cost = 250, 
         ShortDescr = "a vibro-blade", 
         Affects = 
         {
            [1] = 
            {
               Modifier = -2, 
               Location = 18, 
            }, 
         }, 
         Weight = 3, 
         Layers = 0, 
         Name = "academy vibro blade knife dagger vibro-blade", 
         Description = "You see a finely honed vibro-blade here.", 
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
            [2] = 4, 
            [3] = 2, 
            [4] = 1000, 
            [5] = 1000, 
            [0] = 12, 
         }, 
      }, 
      [10313] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         Vnum = 10313, 
         Cost = 5, 
         ShortDescr = "a packaged ration", 
         Weight = 2, 
         Layers = 0, 
         Name = "ration standard packaged", 
         Description = "A packaged ration is here, waiting to be eaten.", 
         ActionDescription = "", 
         ItemType = "food", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ObjectValues = 
         {
            [1] = 50, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 50, 
         }, 
      }, 
      [10314] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 10314, 
         Cost = 10, 
         ShortDescr = "a canteen", 
         Weight = 1, 
         Layers = 0, 
         Name = "canteen water grey stock", 
         Description = "A small grey canteen has been drooped here.", 
         ActionDescription = "", 
         ItemType = "drink_container", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ObjectValues = 
         {
            [1] = 40, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 40, 
         }, 
      }, 
      [10315] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 10315, 
         Cost = 0, 
         ShortDescr = "a fountain", 
         Layers = 0, 
         Weight = 1, 
         Name = "drinking fountain", 
         ActionDescription = "", 
         ItemType = "fountain", 
         Description = "A drinking fountain rests against the wall.", 
         ObjectValues = 
         {
            [1] = 1000, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 1000, 
         }, 
      }, 
      [10316] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         Vnum = 10316, 
         Cost = 5, 
         ShortDescr = "a pair of socks", 
         Weight = 1, 
         Layers = 1, 
         Name = "socks", 
         Description = "A pair of socks is in a ball on the floor.", 
         ActionDescription = "", 
         ItemType = "armor", 
         WearFlags = 
         {
            [0] = "Take", 
            [6] = "Feet", 
         }, 
         ObjectValues = 
         {
            [1] = 1, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
      }, 
      [10317] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 10317, 
         Cost = 5, 
         ShortDescr = "a backpack", 
         Affects = 
         {
            [1] = 
            {
               Modifier = -5, 
               Location = 17, 
            }, 
         }, 
         Weight = 1, 
         Layers = 64, 
         Name = "academy backpack", 
         Description = "An academy backpack was carelessly misplaced here.", 
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
            [0] = 20, 
         }, 
      }, 
      [10318] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 10318, 
         Cost = 0, 
         ShortDescr = "a button", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "push_prog", 
               Code = "mpoload 10316 1\
mpoload 10308 1\
mpoload 10303 1\
pull button\
drop all\
mpecho A small panel opens revealing several articles of clothing.\
", 
               Arguments = "100", 
               ScriptType = "MProg", 
            }, 
         }, 
         Layers = 0, 
         Weight = 1, 
         Name = "grey button", 
         ActionDescription = "", 
         ItemType = "button", 
         Description = "A small grey button seems out of place on the wall here.", 
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
      [10319] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 10319, 
         Cost = 0, 
         ShortDescr = "a box", 
         Weight = 1, 
         Layers = 0, 
         Name = "box", 
         Description = "A small box .. I wonder whats inside, maybe you should open it.", 
         ActionDescription = "", 
         ItemType = "container", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ObjectValues = 
         {
            [1] = 1, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
      }, 
      [10320] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 10320, 
         Cost = 0, 
         ShortDescr = "a Luke Skywalker action figure", 
         Weight = 1, 
         Layers = 0, 
         Name = "luke toy action figure doll", 
         Description = "A Luke Skywalker action figure was misplaced here.", 
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
      [10321] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 10321, 
         Cost = 0, 
         ShortDescr = "a diploma", 
         Weight = 1, 
         Layers = 0, 
         Name = "diploma academy coruscant graduation", 
         Description = "Someone dropped their coruscant academy graduation diploma here.", 
         ActionDescription = "", 
         ItemType = "paper", 
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
      [10322] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 10322, 
         Cost = 0, 
         ShortDescr = "a shuttle", 
         Layers = 0, 
         Weight = 1, 
         Name = "academy shuttle", 
         ActionDescription = "", 
         ItemType = "trash", 
         Description = "A small shuttle is docked here.", 
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
      [10323] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "Powered by a synthesized crystal, this weapon works like a real\
\13lightsaber, only significantly less powerful.\
\13", 
               Keyword = "practice lightsaber", 
            }, 
            [2] = 
            {
               Description = "Powered by a synthesized crystal, this weapon works like a real\
\13lightsaber, only significantly less powerful.\
\13", 
               Keyword = "practice lightsaber", 
            }, 
         }, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         Vnum = 10323, 
         Cost = 500, 
         ShortDescr = "a practice lightsaber", 
         Weight = 1, 
         Layers = 0, 
         Name = "practice lightsaber", 
         Description = "A practice lightsaber is here.", 
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
            [2] = 4, 
            [3] = 3, 
            [4] = 1000, 
            [5] = 1000, 
            [0] = 12, 
         }, 
      }, 
      [10324] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "This power cell, the size of a fingertip, is\
\13well suited for powering a lightsaber.\
\13", 
               Keyword = "lightsaber battery", 
            }, 
         }, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         Vnum = 10324, 
         Cost = 50, 
         ShortDescr = "a lightsaber battery", 
         Weight = 1, 
         Layers = 0, 
         Name = "battery", 
         Description = "A lightsaber battery is lying here.", 
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
            [0] = 1000, 
         }, 
      }, 
      [10499] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 10499, 
         Cost = 0, 
         ShortDescr = "a newly created final object", 
         Layers = 0, 
         Weight = 1, 
         Name = "final object", 
         ActionDescription = "", 
         ItemType = "trash", 
         Description = "Some god dropped a newly created final object here.", 
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
      [10498] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 10498, 
         Cost = 0, 
         ShortDescr = "a superconductor", 
         Weight = 1, 
         Layers = 0, 
         Name = "superconductor", 
         Description = "A superconductor is lying here.", 
         ActionDescription = "", 
         ItemType = "superconductor", 
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
      [10497] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 10497, 
         Cost = 120, 
         ShortDescr = "a circuit board", 
         Weight = 1, 
         Layers = 0, 
         Name = "circuit board", 
         Description = "A circuit board was dropped here.", 
         ActionDescription = "", 
         ItemType = "circuit", 
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
      [10496] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 10496, 
         Cost = 0, 
         ShortDescr = "a tiny, round mirror", 
         Weight = 1, 
         Layers = 0, 
         Name = "mirror", 
         Description = "A tiny, round mirror is lying here.", 
         ActionDescription = "", 
         ItemType = "mirror", 
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
      [10495] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 10495, 
         Cost = 0, 
         ShortDescr = "a non-adegan crystal", 
         Weight = 1, 
         Layers = 0, 
         Name = "non-adegan crystal", 
         Description = "A non-adegan crystal is lying here.", 
         ActionDescription = "", 
         ItemType = "crystal", 
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
      [10494] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         Vnum = 10494, 
         Cost = 50, 
         ShortDescr = "some scrap durasteel", 
         Weight = 1, 
         Layers = 0, 
         Name = "some scrap durasteel", 
         Description = "A scrap of some material lies here.", 
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
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
      }, 
      [10493] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 10493, 
         Cost = 0, 
         ShortDescr = "a portable oven", 
         Weight = 1, 
         Layers = 0, 
         Name = "portable oven", 
         Description = "A portable oven is here.", 
         ActionDescription = "", 
         ItemType = "oven", 
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
      [10492] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 10492, 
         Cost = 0, 
         ShortDescr = "a battery", 
         Weight = 1, 
         Layers = 0, 
         Name = "battery", 
         Description = "A battery is lying here.", 
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
            [0] = 0, 
         }, 
      }, 
      [10491] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 10491, 
         Cost = 0, 
         ShortDescr = "a durastaff", 
         Weight = 1, 
         Layers = 0, 
         Name = "staff durastaff", 
         Description = "A durastaff is lying here.", 
         ActionDescription = "", 
         ItemType = "staff", 
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
      [10490] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 10490, 
         Cost = 0, 
         ShortDescr = "a toolkit", 
         Weight = 1, 
         Layers = 0, 
         Name = "toolkit", 
         Description = "A toolkit is lying here.", 
         ActionDescription = "", 
         ItemType = "toolkit", 
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
      [10489] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 10489, 
         Cost = 0, 
         ShortDescr = "a small lens", 
         Weight = 1, 
         Layers = 0, 
         Name = "lens", 
         Description = "A small lens is lying here.", 
         ActionDescription = "", 
         ItemType = "lens", 
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
      [10488] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         Vnum = 10488, 
         Cost = 10, 
         ShortDescr = "an ammunition cell", 
         Weight = 1, 
         Layers = 0, 
         Name = "ammo cell amunition cartridge", 
         Description = "An ammunition cell was carelessly left here.", 
         ActionDescription = "", 
         ItemType = "ammo", 
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
            [4] = 0, 
            [5] = 0, 
            [0] = 500, 
         }, 
      }, 
      [10487] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 10487, 
         Cost = 200, 
         ShortDescr = "some poorly refined carsanum", 
         Weight = 1, 
         Layers = 0, 
         Name = "carsanum spice", 
         Description = "Some carsanum was dropped here.", 
         ActionDescription = "", 
         ItemType = "spice", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ObjectValues = 
         {
            [1] = 10, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 1, 
         }, 
      }, 
      [10435] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 10435, 
         Cost = 0, 
         ShortDescr = "a prototype spice", 
         Weight = 1, 
         Layers = 0, 
         Name = "prototype spice", 
         Description = "A prototype spice is here.", 
         ActionDescription = "", 
         ItemType = "spice", 
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
      [10434] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 10434, 
         Cost = 0, 
         ShortDescr = "a prototype disguise", 
         Weight = 1, 
         Layers = 0, 
         Name = "prototype disguise", 
         Description = "A prototype disguise is here.", 
         ActionDescription = "", 
         ItemType = "disguise", 
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
      [10433] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 10433, 
         Cost = 100, 
         ShortDescr = "a prototype armor", 
         Weight = 1, 
         Layers = 0, 
         Name = "prototype armor", 
         Description = "A prototype armor is here.", 
         ActionDescription = "", 
         ItemType = "armor", 
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
      [10414] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 10414, 
         Cost = 0, 
         ShortDescr = "a student message terminal", 
         Layers = 0, 
         Weight = 1, 
         Name = "student message terminal", 
         ActionDescription = "", 
         ItemType = "furniture", 
         Description = "A student message terminal is here for you to play with.", 
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
      [10432] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 10432, 
         Cost = 100, 
         ShortDescr = "a prototype container", 
         Weight = 1, 
         Layers = 0, 
         Name = "prototype container", 
         Description = "A prototype container is here.", 
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
      [10431] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 10431, 
         Cost = 0, 
         ShortDescr = "prototype bowcaster", 
         Weight = 1, 
         Layers = 0, 
         Name = "prototype bowcaster", 
         Description = "A proottype bowcaster is here", 
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
            [3] = 9, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
      }, 
      [10430] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 10430, 
         Cost = 0, 
         ShortDescr = "a newly created prototype comlink", 
         Layers = 0, 
         Weight = 1, 
         Name = "prototype comlink", 
         ActionDescription = "", 
         ItemType = "comlink", 
         Description = "Some god dropped a newly created prototype comlink here.", 
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
      [10429] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 10429, 
         Cost = 0, 
         ShortDescr = "a newly created prototype shield", 
         Weight = 1, 
         Layers = 0, 
         Name = "prototype shield", 
         Description = "Some god dropped a newly created prototype shield here.", 
         ActionDescription = "", 
         ItemType = "armor", 
         WearFlags = 
         {
            [0] = "Take", 
            [9] = "Shield", 
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
      [10428] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 10428, 
         Cost = 0, 
         ShortDescr = "a newly created prototype light", 
         Weight = 1, 
         Layers = 0, 
         Name = "prototype light", 
         Description = "Some god dropped a newly created prototype light here.", 
         ActionDescription = "", 
         ItemType = "light", 
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
      [10420] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 10420, 
         Cost = 0, 
         ShortDescr = "prototype blaster", 
         Weight = 1, 
         Layers = 0, 
         Name = "prototype blaster", 
         Description = "A prototype blaster is here", 
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
            [3] = 6, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
      }, 
      [10421] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [4] = "Contraband", 
         }, 
         Vnum = 10421, 
         Cost = 0, 
         ShortDescr = "a prototype lightsaber", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "use_prog", 
               Code = "mpechoat $n Your lightsaber ignites with a soft hum and a bright glow.\
mpechoaround $n $n's lightsaber seemingly jumps into $s hand.\
mpechoaround $n &WIt ignites with a hum and a bright glow.\
", 
               Arguments = "100", 
               ScriptType = "MProg", 
            }, 
         }, 
         Weight = 1, 
         Layers = 128, 
         Name = "prototype saber lightsaber", 
         Description = "A prototype lightsaber shouldn't be here", 
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
            [3] = 3, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
      }, 
      [10422] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 10422, 
         Cost = 0, 
         ShortDescr = "prototype vibro-blade", 
         Weight = 1, 
         Layers = 0, 
         Name = "prototype vibro-blade", 
         Description = "A prototype vibro-blade shouldn't be here", 
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
            [3] = 2, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
      }, 
      [10423] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 10423, 
         Cost = 0, 
         ShortDescr = "a key", 
         Weight = 1, 
         Layers = 0, 
         Name = "key", 
         Description = "An old fashioned mechanical key was left on the ground here.", 
         ActionDescription = "", 
         ItemType = "key", 
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
      [10424] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 10424, 
         Cost = 50, 
         ShortDescr = "a comlink", 
         Weight = 1, 
         Layers = 0, 
         Name = "comlink radio communicator", 
         Description = "A small hand-held comlink.", 
         ActionDescription = "", 
         ItemType = "comlink", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
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
      [10425] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 10425, 
         Cost = 0, 
         ShortDescr = "a newly created prototype grenade", 
         Layers = 0, 
         Weight = 1, 
         Name = "prototype grenade", 
         ActionDescription = "", 
         ItemType = "grenade", 
         Description = "Some god dropped a newly created prototype grenade here.", 
         ObjectValues = 
         {
            [1] = 350, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 200, 
         }, 
      }, 
      [10426] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         Vnum = 10426, 
         Cost = 0, 
         ShortDescr = "a newly created generic armor", 
         Layers = 0, 
         Weight = 1, 
         Description = "Some god dropped a newly created generic armor here.", 
         ActionDescription = "", 
         ItemType = "trash", 
         Name = "generic armor", 
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
      [10427] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 10427, 
         Cost = 0, 
         ShortDescr = "a newly created protoype landmine", 
         Weight = 1, 
         Layers = 0, 
         Name = "protoype landmine", 
         Description = "Some god dropped a newly created protoype landmine here.", 
         ActionDescription = "", 
         ItemType = "landmine", 
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
      [10300] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "This is a bracelet that will bring you luck in your travels. It can\
\13be found at the Darkhaven Acamdemy\
\13", 
               Keyword = "bracelet charm", 
            }, 
         }, 
         Vnum = 10300, 
         Cost = 0, 
         Affects = 
         {
            [1] = 
            {
               Modifier = 1, 
               Location = 31, 
            }, 
         }, 
         ShortDescr = "a charm bracelet", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "drop_prog", 
               Code = "mpforce $n sac $o\
", 
               Arguments = "100", 
               ScriptType = "MProg", 
            }, 
         }, 
         Weight = 2, 
         Layers = 0, 
         Name = "bracelet charm academy", 
         Description = "A charm bracelet from the academy lies here", 
         ActionDescription = "", 
         ItemType = "armor", 
         WearFlags = 
         {
            [0] = "Take", 
            [12] = "Wrist", 
         }, 
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
      }, 
      [10301] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "This boots are so comfortable and light, you feel you can walk a lot\
\13farther. The can be found at the Darkhaven Academy.\
\13", 
               Keyword = "combat boots", 
            }, 
         }, 
         Vnum = 10301, 
         Cost = 0, 
         Affects = 
         {
            [1] = 
            {
               Modifier = 100, 
               Location = 14, 
            }, 
         }, 
         ShortDescr = "a pair of black combat boots", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "drop_prog", 
               Code = "mpforce $n sac $o\
", 
               Arguments = "100", 
               ScriptType = "MProg", 
            }, 
         }, 
         Weight = 3, 
         Layers = 126, 
         Name = "combat boots academy", 
         Description = "A pair of black combat boots from the Academy lies here", 
         ActionDescription = "", 
         ItemType = "armor", 
         WearFlags = 
         {
            [0] = "Take", 
            [6] = "Feet", 
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
      [10302] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "This belt is made of a fine leather, braided for strength. You can get\
\13it at the Darkhaven Academy.\
\13", 
               Keyword = "belt leather", 
            }, 
         }, 
         Vnum = 10302, 
         Cost = 0, 
         Affects = 
         {
            [1] = 
            {
               Modifier = 1, 
               Location = 5, 
            }, 
         }, 
         ShortDescr = "a braided leather belt", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "drop_prog", 
               Code = "mpforce $n sac $o\
", 
               Arguments = "100", 
               ScriptType = "MProg", 
            }, 
         }, 
         Weight = 2, 
         Layers = 0, 
         Name = "belt leather academy", 
         Description = "A braided leather belt from the Academy lies here", 
         ActionDescription = "", 
         ItemType = "armor", 
         WearFlags = 
         {
            [0] = "Take", 
            [11] = "Waist", 
         }, 
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
      }, 
      [10303] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "These leggings will offer good protection until you can get better. They\
\13can be found at the Darkhaven Academy.\
\13", 
               Keyword = "leggings", 
            }, 
         }, 
         Vnum = 10303, 
         Cost = 0, 
         ShortDescr = "some leggings", 
         Weight = 3, 
         Layers = 0, 
         Name = "pants trousers slacks leggings", 
         Description = "A pair of academy leggings is here.", 
         ActionDescription = "", 
         ItemType = "armor", 
         WearFlags = 
         {
            [0] = "Take", 
            [5] = "Legs", 
         }, 
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
      }, 
   }, 
   HighEconomy = 0, 
   Rooms = 
   {
      [10304] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [3] = "Indoors", 
         }, 
         Vnum = 10304, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "The Reading Room", 
         Exits = 
         {
            [1] = 
            {
               Description = "A Marble Corridor\
", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 10314, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "A Stone Corridor\
", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 10301, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "Wandering the Academy\
", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 10307, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This is a silent room, which means while here you will not see any of the\
channels. In fact, you can only use socials, emotes and group tell here.\
The room was created to give you a quiet place to read our help files. You\
can reduce your own screen scroll by reducing the number of channels  you\
receive. You can get a full list of channels by typing CHAN. You may  turn\
off a channel by typing CHAN -<channel> and reactivate a channel by typing\
CHAN +all. Once you have finished reading, you are ready to test your\
ability to negotiate your way around. Going west will take you into\
another part of the Academy.  The test is to follow all the room\
descriptions until you can find your way back to this point. If you get\
lost at any time, type U to return here.  Once you have successfully\
returned here, please continue to the north to explore further.\
", 
      }, 
      [10305] = 
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
         Vnum = 10305, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "Chamber of Trials for Rangers", 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Description = "Here you will experience your first full combat against MOBILES, also known\
as MOBS. Mobile is the name used for monsters and the like in the game.\
All exits, except down, lead to a CAGE mob. Some of these cage mobs may be\
aggressive and will attack you upon entering their room. As you kill them, \
you will gain experience, as well as academy equipment and gold. Once you \
have defeated a mob, type GET ALL CORPSE to loot the coins and equipment.\
You may also type CONFIG +AUTOLOOT or CONFIG +AUTOGOLD. Autoloot will take\
everything from the corpse when you kill it. Autogold will take only the\
gold from the corpse. When you loot a corpse of equipment, the items are\
transferred to your inventory. You may suffer injury during the battle, so \
return here and type REST or SLEEP. This will speed your healing process. \
When you are finished healing, type WAKE or STAND to continue.\
", 
      }, 
      [10306] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Vnum = 10306, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "Abbigayle's Language Lessons", 
         Exits = 
         {
            [1] = 
            {
               Description = "A Stone Corridor\
", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 10301, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "UNTIL FURTHER NOTICE:  ALL LANGUAGES CAN BE LEARNED FROM THE OLD MAN ON THE\
PLUOGUS. Some information about languages:  Languages are learned\
differently from skills, spells and weapons, as you must be adept at a\
language before you may use it. To learn a language, type LANGUAGE LEARN\
<language type>.   For more information on how to learn a language, type\
HELP LANGUAGES. To learn how to use languages, type HELP SPEAK and HELP\
TONGUE.   It will cost some money each time you wish to increase your\
fluency in a language. Those who are intelligent, wise and lucky will find\
it takes fewer practices to become adept at a language. Wookiees can NEVER\
learn to speak common.\
", 
      }, 
      [10307] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "You see a solid oak door.\
\13", 
               Keyword = "Door", 
            }, 
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Vnum = 10307, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "Wandering the Academy", 
         Exits = 
         {
            [1] = 
            {
               Description = "The Reading Room\
", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 10304, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "Wandering Darkhaven Academy, it looks safe\
", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 10309, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "Back to the beginning\
", 
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 10304, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "Each player has a menu of items that the game controls automatically once\
it has been configured. To get a list of this menu, type CONFIG. For this\
part of your schooling, it is suggested you type CONFIG +AUTOEXIT. This\
will have the mud show you all obvious exits available to you. When you\
are moving around the game, EXIT is a very important command. When you\
type EXIT, it shows you the room names each exit shown under obvious exits.\
You can use this command to get hints of dangers and death traps that might\
be close by. You may also try to LOOK in adjoining rooms. You do this by\
typing LOOK <direction>. Your next move is to the west, to see what you\
are walking into, try typing EXIT and L W. \
", 
      }, 
      [10308] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Vnum = 10308, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "A Dank Pit", 
         Exits = 
         {
            [1] = 
            {
               Description = "A Dank Pit\
", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 10316, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "Here stands a Chadoyn.  He was captured trying to slaughter the students\
of the Academy, and the Immortals decided to spare his life and throw him\
in chains for use as a teaching aid.  With him you can practice attacking\
and fleeing, but hopefully not dying.  You will also want to make use of\
the 'consider' command.  This command compares your level and hitpoints\
to that of the creature.  To use here, type 'con chadoyn'.\
 \
To use the consider command elsewhere, type CON <MOBNAME>.  It is wise to\
ALWAYS consider a mob before fighting it the first time.  This will many\
times save your life, as mobs are often a lot more difficult then they\
outwardly appear.  Be careful and enjoy your fight.\
", 
      }, 
      [10309] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "You see a solid oak door.\
\13", 
               Keyword = "door", 
            }, 
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Vnum = 10309, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "Wandering Coruscant Academy", 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Description = "An Enclosed Room\
", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 10310, 
               Distance = 0, 
               Keyword = "door", 
            }, 
            [2] = 
            {
               Description = "Wandering the Academy\
", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 10307, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "Lost in Darkhaven Academy\
", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 10311, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "Back to the beginning\
", 
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 10304, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This is where you will start learning about exits not listed under \"Exits\".\
Doors are not seen on the game. You must read room description and LOOK\
<direction> to find them. Another method of finding a door is to \"bump\" into\
the walls. Type N. OUCH! You ran into the door. You want to be careful not\
to be affected with the pass door spell while using the bump method, as you\
may end up in a room you would rather not visit. Now, type OPEN N or OPEN\
DOOR. Next type EXIT, you will now see the north exit listed under \"Exits\".\
Type HELP OPEN to find out more information on doors.\
", 
      }, 
      [10310] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Vnum = 10310, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "An Enclosed Room", 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Description = "Wandering Darkhaven Academy\
", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 10309, 
               Distance = 0, 
               Keyword = "door", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "You did it! Well done. You will find many rooms such as this all over the\
game. Some are easy to find because of hints in the room descriptions.\
Some are very hard to find, as the clues could be rooms away. However, you\
are now armed with the tools to locate them. You know how to use \"look\", \
bump, and \"exit\". Many classes also get a spell called \"scry\". This spell\
will allow the person affected by it to see the into the adjoining rooms.\
It is used like \"look\", but gives you more detailed information. To see if\
you gain the scry spell at a later level, type SLIST. This will give you a\
list of all spells, skills and weapon types you may practice. Slist also\
gives you information on what level you may practice each, to what percent\
you are currently practiced in each, and what the maximum percent that you\
may practice each.\
", 
      }, 
      [10311] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Vnum = 10311, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "Lost in Coruscant Academy", 
         Exits = 
         {
            [1] = 
            {
               Description = "Lost in Darkhaven Academy\
", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 10312, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "Wandering Darkhaven Academy\
", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 10309, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "Back to the beginning\
", 
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 10304, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "There are several special exit types that you may encounter in your travels.\
You have experienced open exits and closed doors to this point. There are\
also hidden doors. The hidden door can not be found with the \"bump\" method.\
Often they will not show up with the \"look\" method either. These exits are\
found by reading room descriptions, mobiles descriptions and looking at\
objects. You are looking for words that stand out, those words will be the\
door name. You will also find doors that are locked. You may get past some\
locked doors with the pass door spell, the pick door skill or bash door skill.\
Some doors may only be passed by using the matching key. Other exits you\
may find require you to be skilled in climb or affected by the fly spell.\
All exits are in real directions that can be abbreviated to the following:\
N, E, W, S, NE, NW, SE, SW, U, or D. There are also SOMEWHERE exits that\
use \"leave\", \"climb\", \"enter\", or just a word to use. To the north you\
will experience a hidden exit, use the room description to find the door name.\
", 
      }, 
      [10312] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "Upon closer inspection you realise that this is not even a tapestry, but\
\13a cunningly camouflaged wall! You can see the outline of a door as you\
\13look closer.\
\13", 
               Keyword = "tapestry", 
            }, 
            [2] = 
            {
               Description = "You see a tapestry on the wall here, something just isn't right about it.\
\13", 
               Keyword = "west", 
            }, 
            [3] = 
            {
               Description = "You see a tapestry on the wall.\
\13", 
               Keyword = "w", 
            }, 
            [4] = 
            {
               Description = "You see a cleverly disguised door.\
\13", 
               Keyword = "door", 
            }, 
            [5] = 
            {
               Description = "This globes cast shadows in the corners. The shadows on the west\
\13tapestry almost appears to be an opening.\
\13", 
               Keyword = "Crystal globes", 
            }, 
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Vnum = 10312, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "Lost in Coruscant Academy", 
         Exits = 
         {
            [1] = 
            {
               Description = "Lost in Darkhaven Academy\
", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 10311, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
                  [3] = "Secret", 
               }, 
               Description = "door\
", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 10313, 
               Distance = 0, 
               Keyword = "tapestry door", 
            }, 
            [3] = 
            {
               Description = "Back to the beginning\
", 
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 10304, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "You are standing in a richly decorated room. A large oak table surrounded\
by twelve chairs dominates a large portion of the area. Crystal globes with\
continual light spells cast on them hover about the room, providing a soft\
comfortable light. The walls are adorned with tapestries of the finest\
quality. The tapestry on the west wall draws your attention more so than\
the others. Now, you have many clues on the possible exit. Try to find the\
right word by typing LOOK <word>. For example, try LOOK GLOBES. Sometimes\
looking at other things in the rooms description will lead you to the word\
that will open the exit. \
", 
      }, 
      [10313] = 
      {
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "This is a huge CRACK, you could probably squeeze through it. \
\13", 
               Keyword = "crack", 
            }, 
            [2] = 
            {
               Description = "This is a picture of fresh cut flowers in a glass vase. It seems to\
\13be hanging here just to cover a huge crack. That crack is so large, you\
\13can probably squeeze through it! Perhaps you should look closer at the\
\13crack. HINT: type CRACK.\
\13", 
               Keyword = "wall", 
            }, 
            [3] = 
            {
               Description = "You see an oak door.\
\13", 
               Keyword = "door", 
            }, 
            [4] = 
            {
               Description = "This is a picture of fresh cut flowers in a glass vase. It seems to\
\13be hanging here just to cover a huge crack. That crack is so large, you\
\13can probably squeeze through it! Perhaps you should look closer at the\
\13crack. HINT: type CRACK. \
\13", 
               Keyword = "picture", 
            }, 
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 10313, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "A Secret Alcove", 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Description = "Lost in Darkhaven Academy\
", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 10312, 
               Distance = 0, 
               Keyword = "door", 
            }, 
            [2] = 
            {
               Description = "Back to the beginning\
", 
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 10304, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Flags = 
               {
                  [19] = "Auto", 
                  [11] = "Hidden", 
               }, 
               Description = "", 
               Direction = "somewhere", 
               Key = -1, 
               DestinationVnum = 10302, 
               Distance = 0, 
               Keyword = "crack", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "Well Done! You have found this secret room. Sometimes these secret rooms\
will contain valuable items or will lead to other parts of the area you\
are exploring. Always pay close attention to room descriptions, mobiles\
descriptions and items, this will many times bring profitable results.\
This is a where you will experience a Somewhere exit. To find your way\
out, try looking at the picture on the wall. If you can not figure it out, \
you may leave by the up exit. Good luck!\
", 
      }, 
      [10314] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Vnum = 10314, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "A Marble Corridor", 
         Exits = 
         {
            [1] = 
            {
               Description = "Preparing for combat\
", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 10315, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "The Reading Room\
", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 10304, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This room will teach you several commands to check your statistics and \
character health. These commands are SCORE, EQUIPMENT, INVENTORY, and\
LEVEL. Score is used by typing SC, it tells you all the basic statistics\
about your character. Equipment is used by typing EQ, this shows you all \
the items you are currently wearing. Inventory is used by typing I, and \
shows you all items you are carrying other than your worn equipment.\
Level is used by typing LEVEL, it show your current level, your current\
experience points, and the experience needed for the next few levels.\
Use the help menu to get more information on the topics covered here,\
type HELP <subject>.\
", 
      }, 
      [10315] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Vnum = 10315, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "Preparing for combat", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 10317, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "A Marble Corridor\
", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 10314, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "A Dank Pit\
", 
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 10316, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The time is drawing near to experience combat.  Directly below you  is the\
Chadoyn Pit, the home of a creature which will assist you in learning how\
to initiate combat. The Chadoyn is not aggressive, which means you must\
begin the fight.  There are many ways to do so.  The quickest is KILL\
<mob>. As you gain skills and spells, you may find many of them are also\
capable of initiating combat.  Some of the more popular spells that do so\
are:  DISPEL FORCE, SLEEP, DOMINATE, WEAKEN and BLINDNESS. Some of the\
most popular skills used are STEAL and BACKSTAB.\
", 
      }, 
      [10316] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 10316, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "A Dank Pit", 
         Exits = 
         {
            [1] = 
            {
               Description = "A Dank Pit\
", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 10308, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "Preparing for combat\
", 
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 10315, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This room explains about WIMPY, FLEE, and RECALL as a way to leave from\
combat. Wimpy is an automatic withdrawal from a fight when your hitpoints\
reach a set minimum. To set your wimpy, type WIMPY or WIMPY <number>. The\
number being the amount of hitpoints you want remaining when you leave the\
battle. You will lose experience for wimpying out of a fight, but the\
amount of experience lost will generally be less then the amount lost from\
death. You may also manually withdraw from a fight with flee. To use flee,\
just type FLEE. You may flee out of the fight at any amount of hitpoints.\
Fleeing will cost you loss of experience. \
", 
      }, 
      [10317] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Vnum = 10317, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Time To Take A Break", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 10327, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 10315, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "After a long fight or even a long walk you character may need to rest. The\
safest way to do this is to type REST. You may also SLEEP but only do that\
in safe places as you will be more open to being attacked or robbed when\
you are sleeping. When you are done sleeping type WAKE, and when you are\
done resting type STAND.   You may find that occasionally your character\
begins to get hungry or thirsty as you travel around in Star Wars Reality.\
The droid in this room will give you food or a canteen if you ask it\
nicely. To use them type EAT <whatever> or DRINK <whatever>. If you are\
really hungry you might have to do this twice. There is also a fountain\
here you may drink out of or use to fill your canteen. (try: fill canteen\
fountain)\
", 
      }, 
      [10318] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Vnum = 10318, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "A Useless Item?", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 10322, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "Sometimes an item may appear useless at first.  There are many junk items\
that are just that, junk.  But some items can come in handy.  Try making\
small talk with this student. HE seems to have found something that might\
prove useful to you.  Sometimes one item may be found inside another.  To\
look in to an object that is a container use :  LOOK IN <container>.  To\
get an item from a container, use :  GET <item> FROM <container> as well. \
                          Hint:  say hello. \
", 
      }, 
      [10319] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Vnum = 10319, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Up in a Small Loft", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 10322, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "Sometimes items can be obtained by manipulating other items. Some classes\
can make items from other ones using skills such as MAKEBLASTER, MAKESPICE,\
or MAKELIGHTSABER. Other times it is as simple as opening a box or pushing\
a button as is the case in this room.\
", 
      }, 
      [10320] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Vnum = 10320, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Looting Your Kills", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 10322, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "The most common way in most muds to gain equipment is by looting the\
corpses of dead mobiles(monsters etc). After you kill this droid use\
EXAMINE CORPSE to see what it was carrying. Then use GET ALL FROM CORPSE\
to get the goodies from it. To automaticly loot corpses when you kill\
something you can set CONFIG +AUTOLOOT or CONFIG +AUTOCRED for just\
credits.\
", 
      }, 
      [10321] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Vnum = 10321, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Academy Store", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 10322, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "Shops are a great way of aquiring equipment and getting rid of extras.\
To get a list of what a shopkeeper is selling type LIST. To buy an item\
type BUY <objectname>. If you have extra equipment or have found something\
that you want to sell type SELL <object>. To find out how much a shopkeeper\
will buy something for type VALUE <object>.\
 \
One of the more useful items in this shop is the backpack. Once you have\
bought one you can put any extra items you have in it for safe keeping.\
You may also wear it. If you don't have enough credits to buy anything try\
getting some from the droid a couple of rooms to the east.\
", 
      }, 
      [10322] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Vnum = 10322, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Getting More Useful Items", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 10323, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 10320, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 10327, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 10321, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [5] = 
            {
               Description = "", 
               Direction = "up", 
               Key = -1, 
               DestinationVnum = 10319, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [6] = 
            {
               Description = "", 
               Direction = "down", 
               Key = -1, 
               DestinationVnum = 10318, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "One of the major goals you will have playing the mud, is finding better\
equipment to make your character's life safer and easier.  There are\
several ways of doing this. Two that you need to remember but won't yet be\
able to do, until you learn the skills, are SEARCHing and DIGging. \
STEALing is also a way to get items but only criminal characters who\
practice steal are able to do this. (Be warned: Even if you are not a\
criminal, this is a good way to lose eq.)   The rooms to the east and\
west, as well as the ones up and down from here, exhibit different ways of\
getting items. After exploring these four rooms and getting everything you\
need, you may move on to the next room to the north.\
", 
      }, 
      [10323] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Vnum = 10323, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "The Last Challenge", 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
               }, 
               Description = "", 
               Direction = "north", 
               Key = 10423, 
               DestinationVnum = 10324, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 10322, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "Congratulations, you're almost done. The graduation hall is just to the\
north. Only one problem though. The door's locked. Maybe this kid knows\
where the key is. If only he'd stop crying long enough for you to ask.\
hint: find his doll\
hint: give doll child\
hint: say where's the key\
", 
      }, 
      [10324] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [10] = "Safe", 
         }, 
         Vnum = 10324, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Graduating from the Academy", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "speech_prog", 
               Code = "if isimmort($n)\
mpechoat $n dumbass! trans yourself!\
else\
mptransfer $n 10325\
endif\
", 
               Arguments = "iamauthed", 
               ScriptType = "MProg", 
            }, 
         }, 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
                  [5] = "PickProof", 
               }, 
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 10323, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "Congratulations you did it... line up and get your diploma.   You are in a\
long wide hallway. The floor is covered in a plush red carpet. The walls\
are made of a tansparent duraplast and come together to form a dome over\
your head. Looking out the window you notice that the hallway is in fact a\
catwalk connecting the academy to a small landing platform at the end. You\
can't look much more than 20 or 30 levels into the city depths below, as\
many walkways criss-cross between the buildings, obscuring your view of\
the lower levels. Looking up you see several cloudcars slowly navigating\
Coruscant's many skyscrapers. A stairway at the end of the hall slopes up\
towards the docking bay. It is the only exit other than the door behind\
you, back into the academy. \
 \
&RSay 'iamauthed' and you will be authorized.&R&W\
PLEASE LOOK AT THE ROOM ONCE YOU HAVE SAID 'IAMAUTHED'!\
 \
When the schoolmaster shakes your hand, you are authed.\
", 
      }, 
      [10325] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Vnum = 10325, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Description = "Detached from the rest of the Academy to leave room for ships to manuever,\
this docking bay is large enough to hold four or five shuttles. The space\
above is clear and you can see the clouds above you. Anyone launching\
a shuttle from here would have to fly straight though as several larger\
buildings box in the sides of the docking bay no less 30 feet out on each\
side. The noise of the city is blends together forming a loud pulsing hum\
pushing in from all directions. There is a slight and very rare breeze\
blowing down beetween the buildings and across the pad. It is an odd\
feeling in such a boxed in environment.\
 \
There is a small shuttle here waiting to take you home. To board it type\
ENTER.\
", 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [17] = "CanEnter", 
                  [11] = "Hidden", 
               }, 
               Description = "", 
               Direction = "somewhere", 
               Key = -1, 
               DestinationVnum = 10326, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Name = "Academy Docking Bay", 
      }, 
      [10326] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Vnum = 10326, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "The Shuttle home", 
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
               DestinationVnum = 10325, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "You are in a small single compartment shuttle. The passenger seats are\
directly behind the pilots chair and slightly raised to give you a\
nice view for your journey. The seats recline back into a sleeping\
position in case you get tired. A small pantry and a restroom are at\
the back of the cabin.   The purpose of this shuttle is to take the\
newly graduated students home. Its a bit of a luxury compared to the\
rest of your stay at the academy. It must be as much for apearances\
as it is to honor the graduates. You will need to give your diploma\
to the driver before he will launch... Wouldn't want to spend this\
much money on drop outs. If you don't have a diploma yet type LEAVE,\
and then go look for the schoolmaster. \
", 
      }, 
      [10327] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [30] = "Prototype", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 10327, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "Some Important Words of Advice", 
         Exits = 
         {
            [1] = 
            {
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Description = "", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 10322, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 10317, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "A very important thing to learn about early is cloning. Death is permanent.\
When you die you loose everything. However... somewhere deep in the core\
worlds is a place that creates and stores the clones of those who are\
willing to pay a small fee. Having a clone makes a back up of your\
character at the moment of cloning that can be used in the event of an\
untimely death. My advice is to find the cloning facilities as soon as\
possible and make a new clone at least every five levels. Death is a lot\
less painful when you loose 5 levels as opposed to having to start over\
from the beginning.   To exit, open the door north of you by using the\
command open north. This can be used any place doors are located. Simply\
use 'open' and then the direction. \
", 
      }, 
      [10399] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Vnum = 10399, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "This Room is used by a Mob program do not delete.", 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [10400] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [26] = "Factory", 
         }, 
         Vnum = 10400, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "A test workshop", 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [10401] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [16] = "Silence", 
            [10] = "Safe", 
            [2] = "NoMob", 
         }, 
         Vnum = 10401, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "city", 
         Name = "a quiet place", 
         Exits = 
         {
         }, 
         Tunnel = 0, 
         Description = "", 
      }, 
      [10340] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 10340, 
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
      [10342] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 10342, 
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
      [10430] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [10] = "Safe", 
         }, 
         Vnum = 10430, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "Student Lounge", 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 10300, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "You stand in the player lounge.  It is the last safe zone in the galaxy.  \
Relax and have a cool drink, as this will be the last time you can let\
your guard down and not be marked for death.\
 \
A student message terminal is here for you to practice reading and writing\
messages.  Use NOTE LIST to get a list of the messages, and NOTE READ\
<message number> to read a specific message.\
Type HELP NOTE for more commands.\
", 
      }, 
      [10429] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Vnum = 10429, 
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
      [10300] = 
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
         Vnum = 10300, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "Coruscant Academy", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "act_prog", 
               Code = "mpat 122 mpecho $n has just begun life!\
mpat 101 mpecho $n has just entered the game.\
", 
               Arguments = "entered", 
               ScriptType = "MProg", 
            }, 
            [2] = 
            {
               MudProgType = "act_prog", 
               Code = "mpat 122 mpecho $n just slit his own throat at the creations room!\
mpat 101 mpecho $n just sucicided at the creations room.\
", 
               Arguments = "throat", 
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
               DestinationVnum = 10301, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 10430, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "You stand inside the Coruscant Academy, an establishment designed to teach\
the basics of survival within the galaxy. Each room has a specific purpose\
and contains information on the various commands available to you for\
maneuvering around and interacting with other players. We recommend you\
explore the Academy in full, taking the time to read the instructions in\
each room. Check out the bulletin board to the west by typing w.  Then\
come back and explore the rest of the Academy to the north. There is no\
need to ask for authorization. You will be authorized as you leave the\
academy.\
&C\
HOWEVER:  Bios and descriptions are required for anyone over the level of\
newbie.  Type help bio and help desc for further information on creating\
these important documents.\
 \
&RMake sure you have an acceptable name, or you are just wasting your time,\
we -will- have you recreate if you have a bad name.&R&W\
\
Names such as Nathan, Jeff, George, or any other RL name of the like are\
no longer acceptable on this mud. Don't use them.\
 \
&RHere is a good website on naming conventions:&R&W\
http://themudjournal.com/rp/ABCs-A.html\
", 
      }, 
      [10301] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Vnum = 10301, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "A Duraplast Corridor", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "leave_prog", 
               Code = "if isimmort($n)\
else\
  mpforce $n vis\
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
               Description = "Reading Room\
", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 10304, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [2] = 
            {
               Description = "The Laboratory of Skills.\
", 
               Direction = "east", 
               Key = -1, 
               DestinationVnum = 10303, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [3] = 
            {
               Description = "Entrance to Darkhaven Academy\
", 
               Direction = "south", 
               Key = -1, 
               DestinationVnum = 10300, 
               Distance = 0, 
               Keyword = "", 
            }, 
            [4] = 
            {
               Description = "Abbigayle's Language Lessons.\
", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 10306, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "To the west is Lady Abbigayle's room, and to the east is Domick.  Lady\
Abbigayle has information about languages, and Domick has information on\
practicing weapons and skills. When you are finished exploring these\
areas, come back here and continue north through the Academy.\
", 
      }, 
      [10302] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Vnum = 10302, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "Somewhere", 
         Exits = 
         {
            [1] = 
            {
               Description = "The Reading Room\
", 
               Direction = "north", 
               Key = -1, 
               DestinationVnum = 10304, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "You did it! You are an excellent student! To continue your education,\
please leave north. That will return you to the Reading room.\
", 
      }, 
      [10303] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Vnum = 10303, 
         TeleDelay = 0, 
         Tag = "", 
         TeleVnum = 0, 
         Sector = "inside", 
         Name = "The Laboratory of Skills", 
         Exits = 
         {
            [1] = 
            {
               Description = "A Stone Corridor\
", 
               Direction = "west", 
               Key = -1, 
               DestinationVnum = 10301, 
               Distance = 0, 
               Keyword = "", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This is where you will practice your arsenal of weapons and skills. Type\
PRACTICE to get a list of these currently available to you.  Everyone will\
have sections listing skills, weapons, and languages. You will also have\
an additional section for force powers. Force skills, including meditate,\
are taught elsewhere in the game. When training, there are some things you\
should know: When practicing a skill, one practice will earn you between\
15% and 20% proficiency. The amount is determined by the amount of wisdom\
you have. Additional knowledge is gained through usage of the skill/weapon\
until adepted. To see information about a specific skill or weapon, type\
HELP <skill or weapon style>.  For general questions on practicing, type\
HELP PRACTICE.\
", 
      }, 
   }, 
   FileFormatVersion = 1, 
   LowEconomy = 496052630, 
   Resets = 
   {
      [1] = 
      {
         MiscData = 0, 
         Arg1 = 10340, 
         Command = "M", 
         Arg3 = 10303, 
         Arg2 = 1, 
      }, 
      [2] = 
      {
         MiscData = 0, 
         Arg1 = 10394, 
         Command = "M", 
         Arg3 = 10306, 
         Arg2 = 1, 
      }, 
      [3] = 
      {
         MiscData = 0, 
         Arg1 = 10309, 
         Command = "D", 
         Arg3 = 1, 
         Arg2 = 0, 
      }, 
      [4] = 
      {
         MiscData = 0, 
         Arg1 = 10310, 
         Command = "D", 
         Arg3 = 1, 
         Arg2 = 2, 
      }, 
      [5] = 
      {
         MiscData = 0, 
         Arg1 = 10312, 
         Command = "D", 
         Arg3 = 1, 
         Arg2 = 3, 
      }, 
      [6] = 
      {
         MiscData = 0, 
         Arg1 = 10313, 
         Command = "D", 
         Arg3 = 1, 
         Arg2 = 1, 
      }, 
      [7] = 
      {
         MiscData = 1, 
         Arg1 = 10414, 
         Command = "O", 
         Arg3 = 10430, 
         Arg2 = 1, 
      }, 
      [8] = 
      {
         MiscData = 1, 
         Arg1 = 10345, 
         Command = "M", 
         Arg3 = 10308, 
         Arg2 = 1, 
      }, 
      [9] = 
      {
         MiscData = 1, 
         Arg1 = 10360, 
         Command = "M", 
         Arg3 = 10320, 
         Arg2 = 1, 
      }, 
      [10] = 
      {
         MiscData = 1, 
         Arg1 = 10301, 
         Command = "E", 
         Arg3 = 8, 
         Arg2 = 1, 
      }, 
      [11] = 
      {
         MiscData = 1, 
         Arg1 = 10302, 
         Command = "E", 
         Arg3 = 13, 
         Arg2 = 1, 
      }, 
      [12] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 10304, 
         Command = "G", 
      }, 
      [13] = 
      {
         MiscData = 1, 
         Arg1 = 10318, 
         Command = "O", 
         Arg3 = 10319, 
         Arg2 = 1, 
      }, 
      [14] = 
      {
         MiscData = 1, 
         Arg1 = 10342, 
         Command = "M", 
         Arg3 = 10318, 
         Arg2 = 1, 
      }, 
      [15] = 
      {
         MiscData = 1, 
         Arg1 = 10343, 
         Command = "M", 
         Arg3 = 10323, 
         Arg2 = 1, 
      }, 
      [16] = 
      {
         MiscData = 0, 
         Arg1 = 10323, 
         Command = "D", 
         Arg3 = 2, 
         Arg2 = 0, 
      }, 
      [17] = 
      {
         MiscData = 1, 
         Arg1 = 10355, 
         Command = "M", 
         Arg3 = 10326, 
         Arg2 = 1, 
      }, 
      [18] = 
      {
         MiscData = 1, 
         Arg1 = 10315, 
         Command = "O", 
         Arg3 = 10317, 
         Arg2 = 1, 
      }, 
      [19] = 
      {
         MiscData = 0, 
         Arg1 = 10365, 
         Command = "M", 
         Arg3 = 10317, 
         Arg2 = 1, 
      }, 
      [20] = 
      {
         MiscData = 1, 
         Arg1 = 10395, 
         Command = "M", 
         Arg3 = 10327, 
         Arg2 = 1, 
      }, 
      [21] = 
      {
         MiscData = 0, 
         Arg1 = 10327, 
         Command = "D", 
         Arg3 = 1, 
         Arg2 = 0, 
      }, 
      [22] = 
      {
         MiscData = 1, 
         Arg1 = 10370, 
         Command = "M", 
         Arg3 = 10321, 
         Arg2 = 1, 
      }, 
      [23] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 10317, 
         Command = "G", 
      }, 
      [24] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 10311, 
         Command = "G", 
      }, 
      [25] = 
      {
         MiscData = 1, 
         Arg1 = 10350, 
         Command = "M", 
         Arg3 = 10324, 
         Arg2 = 1, 
      }, 
      [26] = 
      {
         MiscData = 1, 
         Arg2 = 1, 
         Arg1 = 10423, 
         Command = "G", 
      }, 
      [27] = 
      {
         MiscData = 1, 
         Arg1 = 10414, 
         Command = "O", 
         Arg3 = 10324, 
         Arg2 = 1, 
      }, 
      [28] = 
      {
         MiscData = 0, 
         Arg1 = 10324, 
         Command = "D", 
         Arg3 = 1, 
         Arg2 = 2, 
      }, 
      [29] = 
      {
         MiscData = 1, 
         Arg1 = 10322, 
         Command = "O", 
         Arg3 = 10325, 
         Arg2 = 1, 
      }, 
   }, 
   ResetMessage = "You hear the hum of repulsorlifts powering up in the distance", 
   Author = "Scarab/Durga", 
   Name = "Coruscant Academy", 
   ResetFrequency = 3, 
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
   Filename = "newacad.lua", 
   Mobiles = 
   {
      [10370] = 
      {
         Damage = 
         {
            DamPlus = 10, 
            DamSizeDice = 10, 
            DamNoDice = 2, 
         }, 
         Position = "standing", 
         HitChance = 
         {
            HitPlus = 2, 
            HitSizeDice = 20, 
            HitNoDice = 2, 
         }, 
         ShortDescr = "a shopkeeper", 
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
            KeeperShortDescr = "a shopkeeper", 
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
               [2] = "twileki", 
               [4] = "huttese", 
               [5] = "mon calamarian", 
               [6] = "shistavanen", 
               [7] = "ewokese", 
               [9] = "antarian", 
               [10] = "devaronese", 
               [14] = "gamorrese", 
               [17] = "jawaese", 
               [19] = "adarese", 
               [20] = "verpine", 
               [21] = "defel", 
               [22] = "dosh", 
               [23] = "chadra-fan", 
               [24] = "quarrenese", 
               [25] = "sullustese", 
               [26] = "falleen", 
               [27] = "binary", 
               [0] = "basic", 
            }, 
            Speaking = 
            {
               [1] = "shyriiwook", 
               [2] = "twileki", 
               [4] = "huttese", 
               [5] = "mon calamarian", 
               [6] = "shistavanen", 
               [7] = "ewokese", 
               [0] = "basic", 
               [17] = "jawaese", 
               [18] = "_clan", 
               [19] = "adarese", 
               [20] = "verpine", 
               [21] = "defel", 
               [22] = "dosh", 
               [23] = "chadra-fan", 
               [24] = "quarrenese", 
               [25] = "sullustese", 
               [14] = "gamorrese", 
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
         HitRoll = 2, 
         Vnum = 10370, 
         Height = 0, 
         Immune = 
         {
            [20] = "magic", 
            [11] = "charm", 
         }, 
         DamRoll = 2, 
         Credits = 100, 
         Sex = "undistinguished", 
         Level = 20, 
         AffectedBy = 
         {
            [3] = "DetectInvis", 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [26] = "Droid", 
         }, 
         Name = "shopkeeper droid", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A droid is here selling useful items to students.\
", 
         ArmorClass = 80, 
      }, 
      [10355] = 
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
         ShortDescr = "a pilot", 
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
         SpecFuns = 
         {
            [0] = "spec_newbie_pilot", 
         }, 
         NumberOfAttacks = 0, 
         DamRoll = 0, 
         HitRoll = 0, 
         Vnum = 10355, 
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
               Code = "look diploma\
say Thank-you.\
give diploma $n\
", 
               Arguments = "p gives you a diploma.", 
               ScriptType = "MProg", 
            }, 
            [2] = 
            {
               MudProgType = "all_greet_prog", 
               Code = "bow $n\
say May I see your diploma please.\
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
         Name = "pilot", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A Mon Calamarian pilot is here ferrying academy graduates.\
", 
         ArmorClass = 0, 
      }, 
      [10340] = 
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
            HitPlus = 1000, 
            HitSizeDice = 1, 
            HitNoDice = 1, 
         }, 
         ShortDescr = "Domick", 
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
         Description = "Domick carries himself with a grace and confidence born from his\
long life and many experiences in these Realms. He is looked on\
with awe and unquestioned respect. That respect is well deserved.\
Do not attempt to kill him, for you shall surely die.\
", 
         Alignment = 1000, 
         Sex = "male", 
         Languages = 
         {
            Speaks = 
            {
               [17] = "jawaese", 
            }, 
            Speaking = 
            {
               [0] = "basic", 
               [17] = "jawaese", 
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
         Vnum = 10340, 
         Height = 0, 
         Immune = 
         {
            [20] = "magic", 
            [13] = "nonmagic", 
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         DamRoll = 0, 
         Credits = 100, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "all_greet_prog", 
               Code = "tell $n Are you ready for your lessons?\
", 
               Arguments = "100", 
               ScriptType = "MProg", 
            }, 
            [2] = 
            {
               MudProgType = "act_prog", 
               Code = "tell $n That will be 10 credits.\
mpechoat $n All teachers will charge you a certain amount \
mpechoat $n of credits, depending on the level you receive the skill at.\
mpechoat $n It is taken out automatically, so do not give Domick 10\
mpechoat $n credits :).\
", 
               Arguments = "practices", 
               ScriptType = "MProg", 
            }, 
         }, 
         Level = 1, 
         AffectedBy = 
         {
            [7] = "Sanctuary", 
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [10] = "Practice", 
            [30] = "Prototype", 
         }, 
         Name = "Domick Dom teacher", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "Domick, Lord of Knowledge, sits here reading, waiting for students.\
", 
         ArmorClass = 94, 
      }, 
      [10342] = 
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
         ShortDescr = "a student", 
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
         DamRoll = 0, 
         HitRoll = 0, 
         Vnum = 10342, 
         Height = 0, 
         Languages = 
         {
            Speaks = 
            {
               [1] = "shyriiwook", 
               [2] = "twileki", 
               [3] = "rodese", 
               [4] = "huttese", 
               [5] = "mon calamarian", 
               [6] = "shistavanen", 
               [7] = "ewokese", 
               [8] = "ithorese", 
               [9] = "antarian", 
               [10] = "devaronese", 
               [11] = "barabel", 
               [12] = "firrerreo", 
               [13] = "bothese", 
               [14] = "gamorrese", 
               [15] = "togorian", 
               [16] = "kubazian", 
               [17] = "jawaese", 
               [18] = "_clan", 
               [19] = "adarese", 
               [20] = "verpine", 
               [21] = "defel", 
               [22] = "dosh", 
               [23] = "chadra-fan", 
               [24] = "quarrenese", 
               [25] = "sullustese", 
               [0] = "basic", 
            }, 
            Speaking = 
            {
               [1] = "shyriiwook", 
               [2] = "twileki", 
               [3] = "rodese", 
               [4] = "huttese", 
               [5] = "mon calamarian", 
               [6] = "shistavanen", 
               [7] = "ewokese", 
               [8] = "ithorese", 
               [9] = "antarian", 
               [10] = "devaronese", 
               [11] = "barabel", 
               [12] = "firrerreo", 
               [13] = "bothese", 
               [14] = "gamorrese", 
               [15] = "togorian", 
               [16] = "kubazian", 
               [17] = "jawaese", 
               [18] = "_clan", 
               [19] = "adarese", 
               [20] = "verpine", 
               [21] = "defel", 
               [22] = "dosh", 
               [23] = "chadra-fan", 
               [24] = "quarrenese", 
               [25] = "sullustese", 
               [0] = "basic", 
            }, 
         }, 
         Sex = "undistinguished", 
         Credits = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "speech_prog", 
               Code = "say You can have it anyways.\
give luke $n\
drop all\
", 
               Arguments = "no nope", 
               ScriptType = "MProg", 
            }, 
            [2] = 
            {
               MudProgType = "speech_prog", 
               Code = "say Ok you can have it then.\
give luke $n\
drop all\
", 
               Arguments = "yes yep", 
               ScriptType = "MProg", 
            }, 
            [3] = 
            {
               MudProgType = "speech_prog", 
               Code = "say Hello.\
Say I found this toy ... is it yours?\
mpat 10399 mpoload 10320\
mpecho A student shows you a Luke Skywalker Action Figure.\
", 
               Arguments = "hi hello", 
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
            [30] = "Prototype", 
         }, 
         Name = "academy student", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "An acadamy student is here taking a break from his studies.\
", 
         ArmorClass = 0, 
      }, 
      [10343] = 
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
         ShortDescr = "a small child", 
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
         DamRoll = 0, 
         HitRoll = 0, 
         Vnum = 10343, 
         Height = 0, 
         Languages = 
         {
            Speaks = 
            {
               [1] = "shyriiwook", 
               [2] = "twileki", 
               [3] = "rodese", 
               [4] = "huttese", 
               [5] = "mon calamarian", 
               [6] = "shistavanen", 
               [7] = "ewokese", 
               [8] = "ithorese", 
               [9] = "antarian", 
               [10] = "devaronese", 
               [11] = "barabel", 
               [12] = "firrerreo", 
               [13] = "bothese", 
               [14] = "gamorrese", 
               [15] = "togorian", 
               [16] = "kubazian", 
               [17] = "jawaese", 
               [18] = "_clan", 
               [19] = "adarese", 
               [20] = "verpine", 
               [21] = "defel", 
               [22] = "dosh", 
               [23] = "chadra-fan", 
               [24] = "quarrenese", 
               [25] = "sullustese", 
               [0] = "basic", 
            }, 
            Speaking = 
            {
               [1] = "shyriiwook", 
               [2] = "twileki", 
               [3] = "rodese", 
               [4] = "huttese", 
               [5] = "mon calamarian", 
               [6] = "shistavanen", 
               [7] = "ewokese", 
               [8] = "ithorese", 
               [9] = "antarian", 
               [10] = "devaronese", 
               [11] = "barabel", 
               [12] = "firrerreo", 
               [13] = "bothese", 
               [14] = "gamorrese", 
               [15] = "togorian", 
               [16] = "kubazian", 
               [17] = "jawaese", 
               [18] = "_clan", 
               [19] = "adarese", 
               [20] = "verpine", 
               [21] = "defel", 
               [22] = "dosh", 
               [23] = "chadra-fan", 
               [24] = "quarrenese", 
               [25] = "sullustese", 
               [0] = "basic", 
            }, 
         }, 
         Sex = "male", 
         Credits = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "act_prog", 
               Code = "say thank you\
", 
               Arguments = "p gives you a Luke Skywalker action figure.", 
               ScriptType = "MProg", 
            }, 
            [2] = 
            {
               MudProgType = "all_greet_prog", 
               Code = "snif\
say I lost my Luke Skywalker toy\
cry\
", 
               Arguments = "100", 
               ScriptType = "MProg", 
            }, 
            [3] = 
            {
               MudProgType = "speech_prog", 
               Code = "if ovnuminv (10320) >= 1\
say You want the key for this door?\
point north\
say here let me open it for you\
mpat 10399 mpoload 10423\
unlock north\
open north\
mpat 10399 drop all\
mpat 10399 purge\
else\
cry\
endif\
", 
               Arguments = "key", 
               ScriptType = "MProg", 
            }, 
            [4] = 
            {
               MudProgType = "speech_prog", 
               Code = "if ovnuminv (10320) >= 1\
say You want the key for this door?\
point north\
say here let me open it for you\
mpat 10399 mpoload 10423\
unlock north\
open north\
mpat 10399 drop all\
mpat 10399 purge\
else\
cry\
endif\
", 
               Arguments = "door door? key?", 
               ScriptType = "MProg", 
            }, 
            [5] = 
            {
               MudProgType = "speech_prog", 
               Code = "if ovnuminv (10320) >= 1\
say You want the key for this door?\
point north\
say here let me open it for you\
mpat 10399 mpoload 10423\
unlock north\
open north\
mpat 10399 drop all\
mpat 10399 purge\
else\
cry\
endif\
", 
               Arguments = "door? north", 
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
            [30] = "Prototype", 
         }, 
         Name = "kid child", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A young child is sitting here.\
", 
         ArmorClass = 0, 
      }, 
      [10360] = 
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
            HitPlus = 5, 
            HitSizeDice = 4, 
            HitNoDice = 1, 
         }, 
         ShortDescr = "a practice droid", 
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
         HitRoll = 0, 
         Vnum = 10360, 
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
         Credits = 10, 
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
            [26] = "Droid", 
         }, 
         Name = "practice droid", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A practice droid is here waiting for combat.\
", 
         ArmorClass = 100, 
      }, 
      [10345] = 
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
            HitPlus = 1, 
            HitSizeDice = 4, 
            HitNoDice = 2, 
         }, 
         ShortDescr = "the chadoyn", 
         Race = "_85", 
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
         Description = "He looks back at you with his beady little eyes and a snarl on his face.\
You are pretty sure you can best him in regards to combat.\
", 
         Alignment = 0, 
         DamRoll = 0, 
         NumberOfAttacks = 0, 
         Languages = 
         {
            Speaks = 
            {
               [17] = "jawaese", 
            }, 
            Speaking = 
            {
               [0] = "basic", 
               [17] = "jawaese", 
            }, 
         }, 
         HitRoll = 0, 
         Vnum = 10345, 
         Height = 0, 
         Sex = "undistinguished", 
         Immune = 
         {
            [11] = "charm", 
         }, 
         Credits = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "death_prog", 
               Code = "if level($n) >= 6\
if rand(50)\
mpechoat $n You feel an overwhelming desire for greater challenge.\
else\
mpechoat $n The chadoyn is far too easy for you to kill.\
endif\
endif\
", 
               Arguments = "85", 
               ScriptType = "MProg", 
            }, 
         }, 
         Level = 2, 
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
         Name = "chadoyn cage", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "The chadoyn is straining its leash, attempting to attack you.\
", 
         ArmorClass = 25, 
      }, 
      [10394] = 
      {
         Damage = 
         {
            DamPlus = 3, 
            DamSizeDice = 6, 
            DamNoDice = 1, 
         }, 
         Position = "standing", 
         HitChance = 
         {
            HitPlus = 0, 
            HitSizeDice = 1, 
            HitNoDice = 1000, 
         }, 
         ShortDescr = "abbigayle", 
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
         Description = "This has to be one of the most beautiful women in these Realms, both inside\
and out. Her eyes have a sparkle of amusement and her face an easy smile.\
She knows you are admiring her, and she does not seem to mind. She is\
comfortable and confident that the picture she makes is breath taking. Her\
voice at last breaks the spell. Her voice is like satin, you can hardly\
wait for your lessons to begin. Any reason to hear her speak the tongues\
foreign to your ears.\
", 
         Alignment = 0, 
         Sex = "female", 
         Languages = 
         {
            Speaks = 
            {
               [1] = "shyriiwook", 
               [2] = "twileki", 
               [3] = "rodese", 
               [4] = "huttese", 
               [5] = "mon calamarian", 
               [6] = "shistavanen", 
               [11] = "barabel", 
               [12] = "firrerreo", 
               [13] = "bothese", 
               [14] = "gamorrese", 
               [15] = "togorian", 
               [16] = "kubazian", 
               [17] = "jawaese", 
               [19] = "adarese", 
               [26] = "falleen", 
               [27] = "binary", 
               [28] = "yevethan", 
               [29] = "gand", 
               [30] = "durese", 
               [31] = "coyn", 
               [0] = "basic", 
            }, 
            Speaking = 
            {
               [1] = "shyriiwook", 
               [2] = "twileki", 
               [3] = "rodese", 
               [4] = "huttese", 
               [5] = "mon calamarian", 
               [6] = "shistavanen", 
               [11] = "barabel", 
               [12] = "firrerreo", 
               [13] = "bothese", 
               [14] = "gamorrese", 
               [15] = "togorian", 
               [16] = "kubazian", 
               [17] = "jawaese", 
               [18] = "_clan", 
               [19] = "adarese", 
               [26] = "falleen", 
               [27] = "binary", 
               [28] = "yevethan", 
               [29] = "gand", 
               [30] = "durese", 
               [31] = "coyn", 
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
         Vnum = 10394, 
         Height = 0, 
         Immune = 
         {
            [20] = "magic", 
            [13] = "nonmagic", 
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         DamRoll = 0, 
         Credits = 50, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "all_greet_prog", 
               Code = "if ispc($n)\
wink $n\
if level($n) < 20\
tell $n My lessons start when you reach level 20. Have fun until then.\
else\
tell $n I am ready to teach you, are you prepared for the lessons?\
endif\
grin $n\
endif\
", 
               Arguments = "100", 
               ScriptType = "MProg", 
            }, 
            [2] = 
            {
               MudProgType = "death_prog", 
               Code = "say You know, I am really a lover, not a fighter ...\
mpslay $n\
mpat $n mpechoat $n But alas, killing me was a slaying offense.\
mpgoto 10399\
mpat 10306 mpmload 10394\
", 
               Arguments = "100", 
               ScriptType = "MProg", 
            }, 
            [3] = 
            {
               MudProgType = "act_prog", 
               Code = "mptrans 0.$n\
mpechoat $n Abbigayle says, 'You fled, so I shall spare your life!'\
mpgoto 10399\
mpat 10306 mpmload 10394\
", 
               Arguments = "p flees head over heels!", 
               ScriptType = "MProg", 
            }, 
         }, 
         Level = 5, 
         AffectedBy = 
         {
            [7] = "Sanctuary", 
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [20] = "Scholar", 
         }, 
         Name = "Abbigayle language teacher", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A beautiful lady stands here, waiting for her students.\
", 
         ArmorClass = 5, 
      }, 
      [10395] = 
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
         ShortDescr = "a sad student", 
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
         DamRoll = 0, 
         HitRoll = 0, 
         Vnum = 10395, 
         Height = 0, 
         Languages = 
         {
            Speaks = 
            {
               [1] = "shyriiwook", 
               [2] = "twileki", 
               [3] = "rodese", 
               [4] = "huttese", 
               [5] = "mon calamarian", 
               [6] = "shistavanen", 
               [7] = "ewokese", 
               [8] = "ithorese", 
               [9] = "antarian", 
               [10] = "devaronese", 
               [11] = "barabel", 
               [12] = "firrerreo", 
               [13] = "bothese", 
               [14] = "gamorrese", 
               [15] = "togorian", 
               [16] = "kubazian", 
               [17] = "jawaese", 
               [18] = "_clan", 
               [19] = "adarese", 
               [20] = "verpine", 
               [21] = "defel", 
               [22] = "dosh", 
               [23] = "chadra-fan", 
               [24] = "quarrenese", 
               [25] = "sullustese", 
               [0] = "basic", 
            }, 
            Speaking = 
            {
               [1] = "shyriiwook", 
               [2] = "twileki", 
               [3] = "rodese", 
               [4] = "huttese", 
               [5] = "mon calamarian", 
               [6] = "shistavanen", 
               [7] = "ewokese", 
               [8] = "ithorese", 
               [9] = "antarian", 
               [10] = "devaronese", 
               [11] = "barabel", 
               [12] = "firrerreo", 
               [13] = "bothese", 
               [14] = "gamorrese", 
               [15] = "togorian", 
               [16] = "kubazian", 
               [17] = "jawaese", 
               [18] = "_clan", 
               [19] = "adarese", 
               [20] = "verpine", 
               [21] = "defel", 
               [22] = "dosh", 
               [23] = "chadra-fan", 
               [24] = "quarrenese", 
               [25] = "sullustese", 
               [0] = "basic", 
            }, 
         }, 
         Sex = "undistinguished", 
         Credits = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "all_greet_prog", 
               Code = "close north\
say Don't let it happen to you $n\
", 
               Arguments = "100", 
               ScriptType = "MProg", 
            }, 
            [2] = 
            {
               MudProgType = "script_prog", 
               Code = "say My brother is dead.\
say Killed by a stray blaster shot.\
snif\
say If only he had made a clone.\
", 
               Arguments = "", 
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
            [30] = "Prototype", 
         }, 
         Name = "sad student", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A sad student leans against the wall.\
", 
         ArmorClass = 0, 
      }, 
      [10365] = 
      {
         Damage = 
         {
            DamPlus = 25, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Position = "standing", 
         HitChance = 
         {
            HitPlus = 100, 
            HitSizeDice = 0, 
            HitNoDice = 10, 
         }, 
         ShortDescr = "a service droid", 
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
         DamRoll = 0, 
         HitRoll = 0, 
         Vnum = 10365, 
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
               MudProgType = "speech_prog", 
               Code = "mpoload 10314 1\
give canteen $n\
drop all\
", 
               Arguments = "canteen? canteen", 
               ScriptType = "MProg", 
            }, 
            [2] = 
            {
               MudProgType = "speech_prog", 
               Code = "mpoload 10313 1\
give ration $n\
drop all\
", 
               Arguments = "food? ration? food ration", 
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
            [1] = "Sentinel", 
            [0] = "Npc", 
            [26] = "Droid", 
         }, 
         Name = "service droid", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A service droid is here handing out canteens and rations.\
", 
         ArmorClass = 0, 
      }, 
      [10350] = 
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
            HitPlus = 1000, 
            HitSizeDice = 1, 
            HitNoDice = 1, 
         }, 
         ShortDescr = "the Schoolmaster", 
         Race = "Human", 
         SpecFuns = 
         {
            [0] = "spec_auth", 
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
         Description = "Domick carries himself with a grace and confidence born from his\
long life and many experiences in these Realms. He is looked on\
with awe and unquestioned respect. That respect is well deserved.\
Do not attempt to kill him, for you shall surely die.\
", 
         Alignment = 1000, 
         Sex = "male", 
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
         Vnum = 10350, 
         Height = 0, 
         Immune = 
         {
            [20] = "magic", 
            [13] = "nonmagic", 
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         DamRoll = 0, 
         Credits = 100, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "all_greet_prog", 
               Code = "mpadvance $n 2\
mpoload 10423\
mpat 10323 close n\
mpat 10323 lock n\
at 10299 drop 10423\
at 10299 mppurge\
 \
if goldamt($n) > 10500\
mpechoat $n &RDon't carry so much money as a newbie.\
mpechoat $n It's hazardous to your health.\
mpdamage $n 3000\
mppurge\
endif\
", 
               Arguments = "100", 
               ScriptType = "MProg", 
            }, 
         }, 
         Level = 1, 
         AffectedBy = 
         {
            [7] = "Sanctuary", 
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         Name = "professor schoolmaster teacher headmaster", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "The schoolmaster is here offering diplomas to academy graduates.\
", 
         ArmorClass = 94, 
      }, 
      [10499] = 
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
         ShortDescr = "a newly created final mob", 
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
         HitRoll = 0, 
         Vnum = 10499, 
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
            [0] = "Npc", 
         }, 
         Name = "final mob", 
         Weight = 0, 
         DefaultPosition = "standing", 
         LongDescr = "Some god abandoned a newly created final mob here.\
", 
         ArmorClass = 0, 
      }, 
   }, 
}
