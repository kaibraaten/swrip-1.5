-- Coruscant Academy
-- Last saved Thursday 26-Nov-2020 15:24:24

AreaEntry
{
   HighEconomy = 0, 
   Objects = 
   {
      [10304] = 
      {
         Layers = 0, 
         Description = "A Coruscant Academy cap is here.", 
         ShortDescr = "an academy cap", 
         WearFlags = 
         {
            [0] = "Take", 
            [4] = "Head", 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "helmet iron", 
               Description = "This is a helmet made of fine iron, from the Darkhaven Academy.  It will\
\13protect you until you can find better.\
\13", 
            }, 
         }, 
         Cost = 0, 
         Weight = 2, 
         ItemType = "armor", 
         Affects = 
         {
            [1] = 
            {
               Modifier = 1, 
               Location = 3, 
            }, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "drop_prog", 
               Arguments = "100", 
               Code = "mpforce $n sac $o\
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
         Vnum = 10304, 
         ActionDescription = "", 
         Tag = "", 
         Name = "academy cap", 
      }, 
      [10305] = 
      {
         Layers = 0, 
         Description = "A black brocade cape from the academy", 
         ShortDescr = "a black brocade cape", 
         WearFlags = 
         {
            [0] = "Take", 
            [10] = "About", 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "cape brocade", 
               Description = "This cape is made from a heavy brocade. It will offer you warmth and\
\13protection until you can find something better. You can find it at the\
\13Darkhave Academy.\
\13", 
            }, 
         }, 
         Cost = 0, 
         ItemType = "armor", 
         Weight = 3, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "drop_prog", 
               Arguments = "100", 
               Code = "mpforce $n sac $o\
", 
               ScriptType = "MProg", 
            }, 
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
         Vnum = 10305, 
         ActionDescription = "", 
         Tag = "", 
         Name = "cape brocade academy", 
      }, 
      [10306] = 
      {
         Layers = 0, 
         Description = "A strong metal collar from the academy", 
         ShortDescr = "a strong metal collar", 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "collar metal ", 
               Description = "This collar fits closely around your neck. It is thick with spikes to\
\13protect you in battle. You can find it in the Darkhaven Academy\
\13", 
            }, 
         }, 
         Cost = 0, 
         ItemType = "armor", 
         Weight = 5, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "drop_prog", 
               Arguments = "100", 
               Code = "mpforce $n sac $o\
", 
               ScriptType = "MProg", 
            }, 
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
         Vnum = 10306, 
         ActionDescription = "", 
         Tag = "", 
         Name = "collar metal academy", 
      }, 
      [10307] = 
      {
         Layers = 0, 
         Description = "A visor of completion is here, emitting a faint glow.", 
         ShortDescr = "a visor of completion", 
         WearFlags = 
         {
            [0] = "Take", 
            [17] = "Eyes", 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "visor completion", 
               Description = "Congratulations! You have completed the Darkhaven Academy and can now\
\13wear this visor with pride! It is magic too, type WEAR VISOR to use.\
\13", 
            }, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "wear_prog", 
               Arguments = "100", 
               Code = "mpechoat $n As you wear this visor, you feel more intelligent and wise!\
mpechoaround $n As $n wears the visor of completion, $e looks more complete!\
", 
               ScriptType = "MProg", 
            }, 
         }, 
         Cost = 0, 
         Affects = 
         {
            [1] = 
            {
               Modifier = 1, 
               Location = 3, 
            }, 
            [2] = 
            {
               Modifier = 1, 
               Location = 4, 
            }, 
         }, 
         ItemType = "armor", 
         Weight = 1, 
         Flags = 
         {
            [6] = "Magic", 
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
         Vnum = 10307, 
         ActionDescription = "", 
         Tag = "", 
         Name = "visor completion academy", 
      }, 
      [10308] = 
      {
         Layers = 0, 
         Description = "An academy vest was left here.", 
         ShortDescr = "an academy vest", 
         WearFlags = 
         {
            [0] = "Take", 
            [3] = "Body", 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "plate armour", 
               Description = "This plate of armour will give you protection until you can find\
\13something better. \
\13", 
            }, 
         }, 
         Cost = 0, 
         ItemType = "armor", 
         Weight = 5, 
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         Vnum = 10308, 
         ActionDescription = "", 
         Tag = "", 
         Name = "academy vest", 
      }, 
      [10309] = 
      {
         Layers = 0, 
         Description = "Lightweight tin sleeves from the academy", 
         ShortDescr = "lightweight tin sleeves", 
         WearFlags = 
         {
            [0] = "Take", 
            [8] = "Arms", 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "sleeves tin", 
               Description = "This sleeves will protect your arms until you can find something better.\
\13You can find them in the Darkhaven Academy.\
\13", 
            }, 
         }, 
         Cost = 0, 
         Weight = 1, 
         ItemType = "armor", 
         Affects = 
         {
            [1] = 
            {
               Modifier = 1, 
               Location = 1, 
            }, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "drop_prog", 
               Arguments = "100", 
               Code = "mpforce $n sac $o\
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
         Vnum = 10309, 
         ActionDescription = "", 
         Tag = "", 
         Name = "sleeves tin academy", 
      }, 
      [10310] = 
      {
         Layers = 0, 
         Description = "An energy shield was dropped here.", 
         ShortDescr = "an energy shield", 
         WearFlags = 
         {
            [0] = "Take", 
            [9] = "Shield", 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "shield crest", 
               Description = "This is your first shield, it will help keep you safe until you can\
\13find something better.\
\13", 
            }, 
         }, 
         Cost = 0, 
         ItemType = "armor", 
         Weight = 5, 
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         Vnum = 10310, 
         ActionDescription = "", 
         Tag = "", 
         Name = "forceshield energyshield shields shield", 
      }, 
      [10311] = 
      {
         Layers = 0, 
         Description = "A glowrod would make a good light source.", 
         ShortDescr = "a glowrod", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 5, 
         Affects = 
         {
            [1] = 
            {
               Modifier = -1, 
               Location = 24, 
            }, 
         }, 
         ItemType = "light", 
         Weight = 1, 
         Flags = 
         {
            [0] = "Glow", 
            [13] = "Inventory", 
            [6] = "Magic", 
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
         Vnum = 10311, 
         ActionDescription = "", 
         Tag = "", 
         Name = "light glowrod glowstick", 
      }, 
      [10312] = 
      {
         Layers = 0, 
         Description = "You see a finely honed vibro-blade here.", 
         ShortDescr = "a vibro-blade", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 250, 
         Affects = 
         {
            [1] = 
            {
               Modifier = -2, 
               Location = 18, 
            }, 
         }, 
         ItemType = "weapon", 
         Weight = 3, 
         Flags = 
         {
            [6] = "Magic", 
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
         Vnum = 10312, 
         ActionDescription = "", 
         Tag = "", 
         Name = "academy vibro blade knife dagger vibro-blade", 
      }, 
      [10313] = 
      {
         Layers = 0, 
         Description = "A packaged ration is here, waiting to be eaten.", 
         ShortDescr = "a packaged ration", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 5, 
         ItemType = "food", 
         Weight = 2, 
         Flags = 
         {
            [13] = "Inventory", 
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
         Vnum = 10313, 
         ActionDescription = "", 
         Tag = "", 
         Name = "ration standard packaged", 
      }, 
      [10314] = 
      {
         Layers = 0, 
         Description = "A small grey canteen has been drooped here.", 
         ShortDescr = "a canteen", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 10, 
         ItemType = "drink_container", 
         Weight = 1, 
         ObjectValues = 
         {
            [1] = 40, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 40, 
         }, 
         Vnum = 10314, 
         ActionDescription = "", 
         Tag = "", 
         Name = "canteen water grey stock", 
      }, 
      [10315] = 
      {
         Layers = 0, 
         Description = "A drinking fountain rests against the wall.", 
         ShortDescr = "a fountain", 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ItemType = "fountain", 
         ObjectValues = 
         {
            [1] = 1000, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 1000, 
         }, 
         Vnum = 10315, 
         ActionDescription = "", 
         Tag = "", 
         Name = "drinking fountain", 
      }, 
      [10316] = 
      {
         Layers = 1, 
         Description = "A pair of socks is in a ball on the floor.", 
         ShortDescr = "a pair of socks", 
         WearFlags = 
         {
            [0] = "Take", 
            [6] = "Feet", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 5, 
         ItemType = "armor", 
         Weight = 1, 
         Flags = 
         {
            [13] = "Inventory", 
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
         Vnum = 10316, 
         ActionDescription = "", 
         Tag = "", 
         Name = "socks", 
      }, 
      [10317] = 
      {
         Layers = 64, 
         Description = "An academy backpack was carelessly misplaced here.", 
         ShortDescr = "a backpack", 
         WearFlags = 
         {
            [0] = "Take", 
            [10] = "About", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 5, 
         ItemType = "container", 
         Affects = 
         {
            [1] = 
            {
               Modifier = -5, 
               Location = 17, 
            }, 
         }, 
         Weight = 1, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 20, 
         }, 
         Vnum = 10317, 
         ActionDescription = "", 
         Tag = "", 
         Name = "academy backpack", 
      }, 
      [10318] = 
      {
         Layers = 0, 
         Description = "A small grey button seems out of place on the wall here.", 
         ShortDescr = "a button", 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ItemType = "button", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "push_prog", 
               Arguments = "100", 
               Code = "mpoload 10316 1\
mpoload 10308 1\
mpoload 10303 1\
pull button\
drop all\
mpecho A small panel opens revealing several articles of clothing.\
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
         Vnum = 10318, 
         ActionDescription = "", 
         Tag = "", 
         Name = "grey button", 
      }, 
      [10319] = 
      {
         Layers = 0, 
         Description = "A small box .. I wonder whats inside, maybe you should open it.", 
         ShortDescr = "a box", 
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
            [1] = 1, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         Vnum = 10319, 
         ActionDescription = "", 
         Tag = "", 
         Name = "box", 
      }, 
      [10320] = 
      {
         Layers = 0, 
         Description = "A Luke Skywalker action figure was misplaced here.", 
         ShortDescr = "a Luke Skywalker action figure", 
         WearFlags = 
         {
            [0] = "Take", 
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
         Vnum = 10320, 
         ActionDescription = "", 
         Tag = "", 
         Name = "luke toy action figure doll", 
      }, 
      [10321] = 
      {
         Layers = 0, 
         Description = "Someone dropped their coruscant academy graduation diploma here.", 
         ShortDescr = "a diploma", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ItemType = "paper", 
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
         Vnum = 10321, 
         ActionDescription = "", 
         Tag = "", 
         Name = "diploma academy coruscant graduation", 
      }, 
      [10322] = 
      {
         Layers = 0, 
         Description = "A small shuttle is docked here.", 
         ShortDescr = "a shuttle", 
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
         Vnum = 10322, 
         ActionDescription = "", 
         Tag = "", 
         Name = "academy shuttle", 
      }, 
      [10323] = 
      {
         Layers = 0, 
         Description = "A practice lightsaber is here.", 
         ShortDescr = "a practice lightsaber", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "practice lightsaber", 
               Description = "Powered by a synthesized crystal, this weapon works like a real\
\13lightsaber, only significantly less powerful.\
\13", 
            }, 
            [2] = 
            {
               Keyword = "practice lightsaber", 
               Description = "Powered by a synthesized crystal, this weapon works like a real\
\13lightsaber, only significantly less powerful.\
\13", 
            }, 
         }, 
         Cost = 500, 
         ItemType = "weapon", 
         Weight = 1, 
         Flags = 
         {
            [13] = "Inventory", 
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
         Vnum = 10323, 
         ActionDescription = "", 
         Tag = "", 
         Name = "practice lightsaber", 
      }, 
      [10324] = 
      {
         Layers = 0, 
         Description = "A lightsaber battery is lying here.", 
         ShortDescr = "a lightsaber battery", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "lightsaber battery", 
               Description = "This power cell, the size of a fingertip, is\
\13well suited for powering a lightsaber.\
\13", 
            }, 
         }, 
         Cost = 50, 
         ItemType = "battery", 
         Weight = 1, 
         Flags = 
         {
            [13] = "Inventory", 
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
         Vnum = 10324, 
         ActionDescription = "", 
         Tag = "", 
         Name = "battery", 
      }, 
      [10499] = 
      {
         Layers = 0, 
         Description = "Some god dropped a newly created final object here.", 
         ShortDescr = "a newly created final object", 
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
         Vnum = 10499, 
         ActionDescription = "", 
         Tag = "", 
         Name = "final object", 
      }, 
      [10498] = 
      {
         Layers = 0, 
         Description = "A superconductor is lying here.", 
         ShortDescr = "a superconductor", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ItemType = "superconductor", 
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
         Vnum = 10498, 
         ActionDescription = "", 
         Tag = "", 
         Name = "superconductor", 
      }, 
      [10497] = 
      {
         Layers = 0, 
         Description = "A circuit board was dropped here.", 
         ShortDescr = "a circuit board", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 120, 
         ItemType = "circuit", 
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
         Vnum = 10497, 
         ActionDescription = "", 
         Tag = "", 
         Name = "circuit board", 
      }, 
      [10496] = 
      {
         Layers = 0, 
         Description = "A tiny, round mirror is lying here.", 
         ShortDescr = "a tiny, round mirror", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ItemType = "mirror", 
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
         Vnum = 10496, 
         ActionDescription = "", 
         Tag = "", 
         Name = "mirror", 
      }, 
      [10495] = 
      {
         Layers = 0, 
         Description = "A non-adegan crystal is lying here.", 
         ShortDescr = "a non-adegan crystal", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ItemType = "crystal", 
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
         Vnum = 10495, 
         ActionDescription = "", 
         Tag = "", 
         Name = "non-adegan crystal", 
      }, 
      [10494] = 
      {
         Layers = 0, 
         Description = "A scrap of some material lies here.", 
         ShortDescr = "some scrap durasteel", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 50, 
         ItemType = "durasteel", 
         Weight = 1, 
         Flags = 
         {
            [13] = "Inventory", 
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
         Vnum = 10494, 
         ActionDescription = "", 
         Tag = "", 
         Name = "some scrap durasteel", 
      }, 
      [10493] = 
      {
         Layers = 0, 
         Description = "A portable oven is here.", 
         ShortDescr = "a portable oven", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ItemType = "oven", 
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
         Vnum = 10493, 
         ActionDescription = "", 
         Tag = "", 
         Name = "portable oven", 
      }, 
      [10492] = 
      {
         Layers = 0, 
         Description = "A battery is lying here.", 
         ShortDescr = "a battery", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ItemType = "battery", 
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
         Vnum = 10492, 
         ActionDescription = "", 
         Tag = "", 
         Name = "battery", 
      }, 
      [10491] = 
      {
         Layers = 0, 
         Description = "A durastaff is lying here.", 
         ShortDescr = "a durastaff", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ItemType = "staff", 
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
         Vnum = 10491, 
         ActionDescription = "", 
         Tag = "", 
         Name = "staff durastaff", 
      }, 
      [10490] = 
      {
         Layers = 0, 
         Description = "A toolkit is lying here.", 
         ShortDescr = "a toolkit", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ItemType = "toolkit", 
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
         Vnum = 10490, 
         ActionDescription = "", 
         Tag = "", 
         Name = "toolkit", 
      }, 
      [10489] = 
      {
         Layers = 0, 
         Description = "A small lens is lying here.", 
         ShortDescr = "a small lens", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ItemType = "lens", 
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
         Vnum = 10489, 
         ActionDescription = "", 
         Tag = "", 
         Name = "lens", 
      }, 
      [10488] = 
      {
         Layers = 0, 
         Description = "An ammunition cell was carelessly left here.", 
         ShortDescr = "an ammunition cell", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 10, 
         ItemType = "ammo", 
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
            [4] = 0, 
            [5] = 0, 
            [0] = 500, 
         }, 
         Vnum = 10488, 
         ActionDescription = "", 
         Tag = "", 
         Name = "ammo cell amunition cartridge", 
      }, 
      [10487] = 
      {
         Layers = 0, 
         Description = "Some carsanum was dropped here.", 
         ShortDescr = "some poorly refined carsanum", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 200, 
         ItemType = "spice", 
         Weight = 1, 
         ObjectValues = 
         {
            [1] = 10, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 1, 
         }, 
         Vnum = 10487, 
         ActionDescription = "", 
         Tag = "", 
         Name = "carsanum spice", 
      }, 
      [10435] = 
      {
         Layers = 0, 
         Description = "A prototype spice is here.", 
         ShortDescr = "a prototype spice", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ItemType = "spice", 
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
         Vnum = 10435, 
         ActionDescription = "", 
         Tag = "", 
         Name = "prototype spice", 
      }, 
      [10434] = 
      {
         Layers = 0, 
         Description = "A prototype disguise is here.", 
         ShortDescr = "a prototype disguise", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ItemType = "disguise", 
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
         Vnum = 10434, 
         ActionDescription = "", 
         Tag = "", 
         Name = "prototype disguise", 
      }, 
      [10433] = 
      {
         Layers = 0, 
         Description = "A prototype armor is here.", 
         ShortDescr = "a prototype armor", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 100, 
         ItemType = "armor", 
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
         Vnum = 10433, 
         ActionDescription = "", 
         Tag = "", 
         Name = "prototype armor", 
      }, 
      [10414] = 
      {
         Layers = 0, 
         Description = "A student message terminal is here for you to play with.", 
         ShortDescr = "a student message terminal", 
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
         Vnum = 10414, 
         ActionDescription = "", 
         Tag = "student_message_terminal", 
         Name = "student message terminal", 
      }, 
      [10432] = 
      {
         Layers = 0, 
         Description = "A prototype container is here.", 
         ShortDescr = "a prototype container", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 100, 
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
         Vnum = 10432, 
         ActionDescription = "", 
         Tag = "", 
         Name = "prototype container", 
      }, 
      [10431] = 
      {
         Layers = 0, 
         Description = "A proottype bowcaster is here", 
         ShortDescr = "prototype bowcaster", 
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
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 9, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Vnum = 10431, 
         ActionDescription = "", 
         Tag = "", 
         Name = "prototype bowcaster", 
      }, 
      [10430] = 
      {
         Layers = 0, 
         Description = "Some god dropped a newly created prototype comlink here.", 
         ShortDescr = "a newly created prototype comlink", 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ItemType = "comlink", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Vnum = 10430, 
         ActionDescription = "", 
         Tag = "", 
         Name = "prototype comlink", 
      }, 
      [10429] = 
      {
         Layers = 0, 
         Description = "Some god dropped a newly created prototype shield here.", 
         ShortDescr = "a newly created prototype shield", 
         WearFlags = 
         {
            [0] = "Take", 
            [9] = "Shield", 
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
            [0] = 0, 
         }, 
         Vnum = 10429, 
         ActionDescription = "", 
         Tag = "", 
         Name = "prototype shield", 
      }, 
      [10428] = 
      {
         Layers = 0, 
         Description = "Some god dropped a newly created prototype light here.", 
         ShortDescr = "a newly created prototype light", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ItemType = "light", 
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
         Vnum = 10428, 
         ActionDescription = "", 
         Tag = "", 
         Name = "prototype light", 
      }, 
      [10420] = 
      {
         Layers = 0, 
         Description = "A prototype blaster is here", 
         ShortDescr = "prototype blaster", 
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
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 6, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Vnum = 10420, 
         ActionDescription = "", 
         Tag = "", 
         Name = "prototype blaster", 
      }, 
      [10421] = 
      {
         Layers = 128, 
         Description = "A prototype lightsaber shouldn't be here", 
         ShortDescr = "a prototype lightsaber", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
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
               Code = "mpechoat $n Your lightsaber ignites with a soft hum and a bright glow.\
mpechoaround $n $n's lightsaber seemingly jumps into $s hand.\
mpechoaround $n &WIt ignites with a hum and a bright glow.\
", 
               ScriptType = "MProg", 
            }, 
         }, 
         ItemType = "weapon", 
         Weight = 1, 
         Flags = 
         {
            [4] = "Contraband", 
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
         Vnum = 10421, 
         ActionDescription = "", 
         Tag = "", 
         Name = "prototype saber lightsaber", 
      }, 
      [10422] = 
      {
         Layers = 0, 
         Description = "A prototype vibro-blade shouldn't be here", 
         ShortDescr = "prototype vibro-blade", 
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
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 2, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Vnum = 10422, 
         ActionDescription = "", 
         Tag = "", 
         Name = "prototype vibro-blade", 
      }, 
      [10423] = 
      {
         Layers = 0, 
         Description = "An old fashioned mechanical key was left on the ground here.", 
         ShortDescr = "a key", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ItemType = "key", 
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
         Vnum = 10423, 
         ActionDescription = "", 
         Tag = "", 
         Name = "key", 
      }, 
      [10424] = 
      {
         Layers = 0, 
         Description = "A small hand-held comlink.", 
         ShortDescr = "a comlink", 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 50, 
         ItemType = "comlink", 
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
         Vnum = 10424, 
         ActionDescription = "", 
         Tag = "", 
         Name = "comlink radio communicator", 
      }, 
      [10425] = 
      {
         Layers = 0, 
         Description = "Some god dropped a newly created prototype grenade here.", 
         ShortDescr = "a newly created prototype grenade", 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ItemType = "grenade", 
         ObjectValues = 
         {
            [1] = 350, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 200, 
         }, 
         Vnum = 10425, 
         ActionDescription = "", 
         Tag = "", 
         Name = "prototype grenade", 
      }, 
      [10426] = 
      {
         Layers = 0, 
         Description = "Some god dropped a newly created generic armor here.", 
         ShortDescr = "a newly created generic armor", 
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ItemType = "trash", 
         Flags = 
         {
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
         Vnum = 10426, 
         ActionDescription = "", 
         Tag = "", 
         Name = "generic armor", 
      }, 
      [10427] = 
      {
         Layers = 0, 
         Description = "Some god dropped a newly created protoype landmine here.", 
         ShortDescr = "a newly created protoype landmine", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ItemType = "landmine", 
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
         Vnum = 10427, 
         ActionDescription = "", 
         Tag = "", 
         Name = "protoype landmine", 
      }, 
      [10300] = 
      {
         Layers = 0, 
         Description = "A charm bracelet from the academy lies here", 
         ShortDescr = "a charm bracelet", 
         WearFlags = 
         {
            [0] = "Take", 
            [12] = "Wrist", 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "bracelet charm", 
               Description = "This is a bracelet that will bring you luck in your travels. It can\
\13be found at the Darkhaven Acamdemy\
\13", 
            }, 
         }, 
         Cost = 0, 
         Weight = 2, 
         ItemType = "armor", 
         Affects = 
         {
            [1] = 
            {
               Modifier = 1, 
               Location = 31, 
            }, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "drop_prog", 
               Arguments = "100", 
               Code = "mpforce $n sac $o\
", 
               ScriptType = "MProg", 
            }, 
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
         Vnum = 10300, 
         ActionDescription = "", 
         Tag = "", 
         Name = "bracelet charm academy", 
      }, 
      [10301] = 
      {
         Layers = 126, 
         Description = "A pair of black combat boots from the Academy lies here", 
         ShortDescr = "a pair of black combat boots", 
         WearFlags = 
         {
            [0] = "Take", 
            [6] = "Feet", 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "combat boots", 
               Description = "This boots are so comfortable and light, you feel you can walk a lot\
\13farther. The can be found at the Darkhaven Academy.\
\13", 
            }, 
         }, 
         Cost = 0, 
         Weight = 3, 
         ItemType = "armor", 
         Affects = 
         {
            [1] = 
            {
               Modifier = 100, 
               Location = 14, 
            }, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "drop_prog", 
               Arguments = "100", 
               Code = "mpforce $n sac $o\
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
         Vnum = 10301, 
         ActionDescription = "", 
         Tag = "", 
         Name = "combat boots academy", 
      }, 
      [10302] = 
      {
         Layers = 0, 
         Description = "A braided leather belt from the Academy lies here", 
         ShortDescr = "a braided leather belt", 
         WearFlags = 
         {
            [0] = "Take", 
            [11] = "Waist", 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "belt leather", 
               Description = "This belt is made of a fine leather, braided for strength. You can get\
\13it at the Darkhaven Academy.\
\13", 
            }, 
         }, 
         Cost = 0, 
         Weight = 2, 
         ItemType = "armor", 
         Affects = 
         {
            [1] = 
            {
               Modifier = 1, 
               Location = 5, 
            }, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "drop_prog", 
               Arguments = "100", 
               Code = "mpforce $n sac $o\
", 
               ScriptType = "MProg", 
            }, 
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
         Vnum = 10302, 
         ActionDescription = "", 
         Tag = "", 
         Name = "belt leather academy", 
      }, 
      [10303] = 
      {
         Layers = 0, 
         Description = "A pair of academy leggings is here.", 
         ShortDescr = "some leggings", 
         WearFlags = 
         {
            [0] = "Take", 
            [5] = "Legs", 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "leggings", 
               Description = "These leggings will offer good protection until you can get better. They\
\13can be found at the Darkhaven Academy.\
\13", 
            }, 
         }, 
         Cost = 0, 
         ItemType = "armor", 
         Weight = 3, 
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         Vnum = 10303, 
         ActionDescription = "", 
         Tag = "", 
         Name = "pants trousers slacks leggings", 
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
         Last = 10499, 
         First = 10300, 
      }, 
      Mob = 
      {
         Last = 10499, 
         First = 10340, 
      }, 
      Room = 
      {
         Last = 10430, 
         First = 10300, 
      }, 
   }, 
   ResetMessage = "You hear the hum of repulsorlifts powering up in the distance", 
   ResetFrequency = 3, 
   Resets = 
   {
      [1] = 
      {
         Arg3 = 10303, 
         Arg1 = 10340, 
         Command = "M", 
         MiscData = 0, 
         Arg2 = 1, 
      }, 
      [2] = 
      {
         Arg3 = 10306, 
         Arg1 = 10394, 
         Command = "M", 
         MiscData = 0, 
         Arg2 = 1, 
      }, 
      [3] = 
      {
         Arg3 = 1, 
         Arg1 = 10309, 
         Command = "D", 
         MiscData = 0, 
         Arg2 = 0, 
      }, 
      [4] = 
      {
         Arg3 = 1, 
         Arg1 = 10310, 
         Command = "D", 
         MiscData = 0, 
         Arg2 = 2, 
      }, 
      [5] = 
      {
         Arg3 = 1, 
         Arg1 = 10312, 
         Command = "D", 
         MiscData = 0, 
         Arg2 = 3, 
      }, 
      [6] = 
      {
         Arg3 = 1, 
         Arg1 = 10313, 
         Command = "D", 
         MiscData = 0, 
         Arg2 = 1, 
      }, 
      [7] = 
      {
         Arg3 = 10430, 
         Arg1 = 10414, 
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [8] = 
      {
         Arg3 = 10308, 
         Arg1 = 10345, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [9] = 
      {
         Arg3 = 10320, 
         Arg1 = 10360, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [10] = 
      {
         Arg3 = 8, 
         Arg1 = 10301, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [11] = 
      {
         Arg3 = 13, 
         Arg1 = 10302, 
         Command = "E", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [12] = 
      {
         Arg3 = 0, 
         Arg1 = 10304, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [13] = 
      {
         Arg3 = 10319, 
         Arg1 = 10318, 
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [14] = 
      {
         Arg3 = 10318, 
         Arg1 = 10342, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [15] = 
      {
         Arg3 = 10323, 
         Arg1 = 10343, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [16] = 
      {
         Arg3 = 2, 
         Arg1 = 10323, 
         Command = "D", 
         MiscData = 0, 
         Arg2 = 0, 
      }, 
      [17] = 
      {
         Arg3 = 10326, 
         Arg1 = 10355, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [18] = 
      {
         Arg3 = 10317, 
         Arg1 = 10315, 
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [19] = 
      {
         Arg3 = 10317, 
         Arg1 = 10365, 
         Command = "M", 
         MiscData = 0, 
         Arg2 = 1, 
      }, 
      [20] = 
      {
         Arg3 = 10327, 
         Arg1 = 10395, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [21] = 
      {
         Arg3 = 1, 
         Arg1 = 10327, 
         Command = "D", 
         MiscData = 0, 
         Arg2 = 0, 
      }, 
      [22] = 
      {
         Arg3 = 10321, 
         Arg1 = 10370, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [23] = 
      {
         Arg3 = 0, 
         Arg1 = 10317, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [24] = 
      {
         Arg3 = 0, 
         Arg1 = 10311, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [25] = 
      {
         Arg3 = 10324, 
         Arg1 = 10350, 
         Command = "M", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [26] = 
      {
         Arg3 = 0, 
         Arg1 = 10423, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [27] = 
      {
         Arg3 = 10324, 
         Arg1 = 10414, 
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [28] = 
      {
         Arg3 = 1, 
         Arg1 = 10324, 
         Command = "D", 
         MiscData = 0, 
         Arg2 = 2, 
      }, 
      [29] = 
      {
         Arg3 = 10325, 
         Arg1 = 10322, 
         Command = "O", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
   }, 
   Author = "Scarab/Durga", 
   Rooms = 
   {
      [10304] = 
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
            [16] = "Silence", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "A Marble Corridor\
", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 10314, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "A Stone Corridor\
", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 10301, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "Wandering the Academy\
", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 10307, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 10304, 
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
         Tag = "", 
         Name = "The Reading Room", 
      }, 
      [10305] = 
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
            [10] = "Safe", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
         }, 
         Vnum = 10305, 
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
         Tag = "", 
         Name = "Chamber of Trials for Rangers", 
      }, 
      [10306] = 
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
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "A Stone Corridor\
", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 10301, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 10306, 
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
         Tag = "", 
         Name = "Abbigayle's Language Lessons", 
      }, 
      [10307] = 
      {
         Sector = "inside", 
         TeleVnum = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "Door", 
               Description = "You see a solid oak door.\
\13", 
            }, 
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
               Description = "The Reading Room\
", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 10304, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "Wandering Darkhaven Academy, it looks safe\
", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 10309, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "Back to the beginning\
", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 10304, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 10307, 
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
         Tag = "", 
         Name = "Wandering the Academy", 
      }, 
      [10308] = 
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
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "A Dank Pit\
", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 10316, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 10308, 
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
         Tag = "", 
         Name = "A Dank Pit", 
      }, 
      [10309] = 
      {
         Sector = "inside", 
         TeleVnum = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "door", 
               Description = "You see a solid oak door.\
\13", 
            }, 
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
               Description = "An Enclosed Room\
", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 10310, 
               Keyword = "door", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "Wandering the Academy\
", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 10307, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "Lost in Darkhaven Academy\
", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 10311, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Description = "Back to the beginning\
", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 10304, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 10309, 
         Description = "This is where you will start learning about exits not listed under \"Exits\".\
Doors are not seen on the game. You must read room description and LOOK\
<direction> to find them. Another method of finding a door is to \"bump\" into\
the walls. Type N. OUCH! You ran into the door. You want to be careful not\
to be affected with the pass door spell while using the bump method, as you\
may end up in a room you would rather not visit. Now, type OPEN N or OPEN\
DOOR. Next type EXIT, you will now see the north exit listed under \"Exits\".\
Type HELP OPEN to find out more information on doors.\
", 
         Tag = "", 
         Name = "Wandering Coruscant Academy", 
      }, 
      [10310] = 
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
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "Wandering Darkhaven Academy\
", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 10309, 
               Keyword = "door", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 10310, 
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
         Tag = "", 
         Name = "An Enclosed Room", 
      }, 
      [10311] = 
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
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "Lost in Darkhaven Academy\
", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 10312, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "Wandering Darkhaven Academy\
", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 10309, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "Back to the beginning\
", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 10304, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 10311, 
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
         Tag = "", 
         Name = "Lost in Coruscant Academy", 
      }, 
      [10312] = 
      {
         Sector = "inside", 
         TeleVnum = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "tapestry", 
               Description = "Upon closer inspection you realise that this is not even a tapestry, but\
\13a cunningly camouflaged wall! You can see the outline of a door as you\
\13look closer.\
\13", 
            }, 
            [2] = 
            {
               Keyword = "west", 
               Description = "You see a tapestry on the wall here, something just isn't right about it.\
\13", 
            }, 
            [3] = 
            {
               Keyword = "w", 
               Description = "You see a tapestry on the wall.\
\13", 
            }, 
            [4] = 
            {
               Keyword = "door", 
               Description = "You see a cleverly disguised door.\
\13", 
            }, 
            [5] = 
            {
               Keyword = "Crystal globes", 
               Description = "This globes cast shadows in the corners. The shadows on the west\
\13tapestry almost appears to be an opening.\
\13", 
            }, 
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
               Description = "Lost in Darkhaven Academy\
", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 10311, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "door\
", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
                  [3] = "Secret", 
               }, 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 10313, 
               Keyword = "tapestry door", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "Back to the beginning\
", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 10304, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 10312, 
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
         Tag = "", 
         Name = "Lost in Coruscant Academy", 
      }, 
      [10313] = 
      {
         Sector = "inside", 
         TeleVnum = 0, 
         Tunnel = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "wall", 
               Description = "This is a picture of fresh cut flowers in a glass vase. It seems to\
\13be hanging here just to cover a huge crack. That crack is so large, you\
\13can probably squeeze through it! Perhaps you should look closer at the\
\13crack. HINT: type CRACK.\
\13", 
            }, 
            [2] = 
            {
               Keyword = "door", 
               Description = "You see an oak door.\
\13", 
            }, 
            [3] = 
            {
               Keyword = "picture", 
               Description = "This is a picture of fresh cut flowers in a glass vase. It seems to\
\13be hanging here just to cover a huge crack. That crack is so large, you\
\13can probably squeeze through it! Perhaps you should look closer at the\
\13crack. HINT: type CRACK. \
\13", 
            }, 
            [4] = 
            {
               Keyword = "crack", 
               Description = "This is a huge CRACK, you could probably squeeze through it. \
\13", 
            }, 
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
               Description = "Lost in Darkhaven Academy\
", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 10312, 
               Keyword = "door", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "Back to the beginning\
", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 10304, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Flags = 
               {
                  [19] = "Auto", 
                  [11] = "Hidden", 
               }, 
               Key = -1, 
               Direction = "somewhere", 
               DestinationVnum = 10302, 
               Keyword = "crack", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 10313, 
         Description = "Well Done! You have found this secret room. Sometimes these secret rooms\
will contain valuable items or will lead to other parts of the area you\
are exploring. Always pay close attention to room descriptions, mobiles\
descriptions and items, this will many times bring profitable results.\
This is a where you will experience a Somewhere exit. To find your way\
out, try looking at the picture on the wall. If you can not figure it out, \
you may leave by the up exit. Good luck!\
", 
         Tag = "", 
         Name = "A Secret Alcove", 
      }, 
      [10314] = 
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
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "Preparing for combat\
", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 10315, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "The Reading Room\
", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 10304, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 10314, 
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
         Tag = "", 
         Name = "A Marble Corridor", 
      }, 
      [10315] = 
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
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 10317, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "A Marble Corridor\
", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 10314, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "A Dank Pit\
", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 10316, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 10315, 
         Description = "The time is drawing near to experience combat.  Directly below you  is the\
Chadoyn Pit, the home of a creature which will assist you in learning how\
to initiate combat. The Chadoyn is not aggressive, which means you must\
begin the fight.  There are many ways to do so.  The quickest is KILL\
<mob>. As you gain skills and spells, you may find many of them are also\
capable of initiating combat.  Some of the more popular spells that do so\
are:  DISPEL FORCE, SLEEP, DOMINATE, WEAKEN and BLINDNESS. Some of the\
most popular skills used are STEAL and BACKSTAB.\
", 
         Tag = "", 
         Name = "Preparing for combat", 
      }, 
      [10316] = 
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
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "A Dank Pit\
", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 10308, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "Preparing for combat\
", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 10315, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 10316, 
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
         Tag = "", 
         Name = "A Dank Pit", 
      }, 
      [10317] = 
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
               DestinationVnum = 10327, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 10315, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 10317, 
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
         Tag = "", 
         Name = "Time To Take A Break", 
      }, 
      [10318] = 
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
               Direction = "up", 
               DestinationVnum = 10322, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 10318, 
         Description = "Sometimes an item may appear useless at first.  There are many junk items\
that are just that, junk.  But some items can come in handy.  Try making\
small talk with this student. HE seems to have found something that might\
prove useful to you.  Sometimes one item may be found inside another.  To\
look in to an object that is a container use :  LOOK IN <container>.  To\
get an item from a container, use :  GET <item> FROM <container> as well. \
                          Hint:  say hello. \
", 
         Tag = "", 
         Name = "A Useless Item?", 
      }, 
      [10319] = 
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
               DestinationVnum = 10322, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 10319, 
         Description = "Sometimes items can be obtained by manipulating other items. Some classes\
can make items from other ones using skills such as MAKEBLASTER, MAKESPICE,\
or MAKELIGHTSABER. Other times it is as simple as opening a box or pushing\
a button as is the case in this room.\
", 
         Tag = "", 
         Name = "Up in a Small Loft", 
      }, 
      [10320] = 
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
               DestinationVnum = 10322, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 10320, 
         Description = "The most common way in most muds to gain equipment is by looting the\
corpses of dead mobiles(monsters etc). After you kill this droid use\
EXAMINE CORPSE to see what it was carrying. Then use GET ALL FROM CORPSE\
to get the goodies from it. To automaticly loot corpses when you kill\
something you can set CONFIG +AUTOLOOT or CONFIG +AUTOCRED for just\
credits.\
", 
         Tag = "", 
         Name = "Looting Your Kills", 
      }, 
      [10321] = 
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
               Direction = "east", 
               DestinationVnum = 10322, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 10321, 
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
         Tag = "", 
         Name = "Academy Store", 
      }, 
      [10322] = 
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
               DestinationVnum = 10323, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 10320, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 10327, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 10321, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [5] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "up", 
               DestinationVnum = 10319, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [6] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "down", 
               DestinationVnum = 10318, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 10322, 
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
         Tag = "", 
         Name = "Getting More Useful Items", 
      }, 
      [10323] = 
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
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
               }, 
               Key = 10423, 
               Direction = "north", 
               DestinationVnum = 10324, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 10322, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 10323, 
         Description = "Congratulations, you're almost done. The graduation hall is just to the\
north. Only one problem though. The door's locked. Maybe this kid knows\
where the key is. If only he'd stop crying long enough for you to ask.\
hint: find his doll\
hint: give doll child\
hint: say where's the key\
", 
         Tag = "", 
         Name = "The Last Challenge", 
      }, 
      [10324] = 
      {
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "iamauthed", 
               Code = "if isimmort($n)\
mpechoat $n dumbass! trans yourself!\
else\
mptransfer $n 10325\
endif\
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
            [10] = "Safe", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
                  [5] = "PickProof", 
               }, 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 10323, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 10324, 
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
         Tag = "", 
         Name = "Graduating from the Academy", 
      }, 
      [10325] = 
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
                  [17] = "CanEnter", 
                  [11] = "Hidden", 
               }, 
               Key = -1, 
               Direction = "somewhere", 
               DestinationVnum = 10326, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 10325, 
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
         Tag = "", 
         Name = "Academy Docking Bay", 
      }, 
      [10326] = 
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
               Flags = 
               {
                  [18] = "CanLeave", 
                  [11] = "Hidden", 
               }, 
               Key = -1, 
               Direction = "somewhere", 
               DestinationVnum = 10325, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 10326, 
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
         Tag = "", 
         Name = "The Shuttle home", 
      }, 
      [10327] = 
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
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 10322, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 10317, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 10327, 
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
         Tag = "", 
         Name = "Some Important Words of Advice", 
      }, 
      [10399] = 
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
         Vnum = 10399, 
         Description = "", 
         Tag = "", 
         Name = "This Room is used by a Mob program do not delete.", 
      }, 
      [10400] = 
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
            [26] = "Factory", 
         }, 
         Exits = 
         {
         }, 
         Vnum = 10400, 
         Description = "", 
         Tag = "", 
         Name = "A test workshop", 
      }, 
      [10401] = 
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
            [16] = "Silence", 
            [10] = "Safe", 
            [2] = "NoMob", 
         }, 
         Exits = 
         {
         }, 
         Vnum = 10401, 
         Description = "", 
         Tag = "", 
         Name = "a quiet place", 
      }, 
      [10340] = 
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
         Vnum = 10340, 
         Description = "", 
         Tag = "", 
         Name = "Floating in a void", 
      }, 
      [10342] = 
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
         Vnum = 10342, 
         Description = "", 
         Tag = "", 
         Name = "Floating in a void", 
      }, 
      [10430] = 
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
            [2] = "NoMob", 
            [10] = "Safe", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 10300, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 10430, 
         Description = "You stand in the player lounge.  It is the last safe zone in the galaxy.  \
Relax and have a cool drink, as this will be the last time you can let\
your guard down and not be marked for death.\
 \
A student message terminal is here for you to practice reading and writing\
messages.  Use NOTE LIST to get a list of the messages, and NOTE READ\
<message number> to read a specific message.\
Type HELP NOTE for more commands.\
", 
         Tag = "", 
         Name = "Student Lounge", 
      }, 
      [10429] = 
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
         Vnum = 10429, 
         Description = "", 
         Tag = "", 
         Name = "Floating in a void", 
      }, 
      [10300] = 
      {
         Sector = "inside", 
         TeleVnum = 0, 
         Tunnel = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "act_prog", 
               Arguments = "throat", 
               Code = "mpat 122 mpecho $n just slit his own throat at the creations room!\
mpat 101 mpecho $n just sucicided at the creations room.\
", 
               ScriptType = "MProg", 
            }, 
            [2] = 
            {
               MudProgType = "act_prog", 
               Arguments = "entered", 
               Code = "mpat 122 mpecho $n has just begun life!\
mpat 101 mpecho $n has just entered the game.\
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
               DestinationVnum = 10301, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 10430, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 10300, 
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
         Tag = "", 
         Name = "Coruscant Academy", 
      }, 
      [10301] = 
      {
         Sector = "inside", 
         TeleVnum = 0, 
         Tunnel = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "leave_prog", 
               Arguments = "100", 
               Code = "if isimmort($n)\
else\
  mpforce $n vis\
endif\
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
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "Reading Room\
", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 10304, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [2] = 
            {
               Description = "The Laboratory of Skills.\
", 
               Key = -1, 
               Direction = "east", 
               DestinationVnum = 10303, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [3] = 
            {
               Description = "Entrance to Darkhaven Academy\
", 
               Key = -1, 
               Direction = "south", 
               DestinationVnum = 10300, 
               Keyword = "", 
               Distance = 0, 
            }, 
            [4] = 
            {
               Description = "Abbigayle's Language Lessons.\
", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 10306, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 10301, 
         Description = "To the west is Lady Abbigayle's room, and to the east is Domick.  Lady\
Abbigayle has information about languages, and Domick has information on\
practicing weapons and skills. When you are finished exploring these\
areas, come back here and continue north through the Academy.\
", 
         Tag = "", 
         Name = "A Duraplast Corridor", 
      }, 
      [10302] = 
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
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "The Reading Room\
", 
               Key = -1, 
               Direction = "north", 
               DestinationVnum = 10304, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 10302, 
         Description = "You did it! You are an excellent student! To continue your education,\
please leave north. That will return you to the Reading room.\
", 
         Tag = "", 
         Name = "Somewhere", 
      }, 
      [10303] = 
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
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               Description = "A Stone Corridor\
", 
               Key = -1, 
               Direction = "west", 
               DestinationVnum = 10301, 
               Keyword = "", 
               Distance = 0, 
            }, 
         }, 
         Vnum = 10303, 
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
         Tag = "", 
         Name = "The Laboratory of Skills", 
      }, 
   }, 
   FileFormatVersion = 1, 
   Filename = "newacad.lua", 
   Mobiles = 
   {
      [10370] = 
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
            [25] = "NoKill", 
            [26] = "Droid", 
         }, 
         NumberOfAttacks = 0, 
         HitRoll = 2, 
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
         Immune = 
         {
            [20] = "magic", 
            [11] = "charm", 
         }, 
         DamRoll = 2, 
         Shop = 
         {
            KeeperShortDescr = "a shopkeeper", 
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
         ShortDescr = "a shopkeeper", 
         Weight = 0, 
         Sex = "undistinguished", 
         DefaultPosition = "standing", 
         AffectedBy = 
         {
            [3] = "DetectInvis", 
         }, 
         HitChance = 
         {
            HitNoDice = 2, 
            HitSizeDice = 20, 
            HitPlus = 2, 
         }, 
         Credits = 100, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamNoDice = 2, 
            DamPlus = 10, 
         }, 
         Level = 20, 
         LongDescr = "A droid is here selling useful items to students.\
", 
         Vnum = 10370, 
         ArmorClass = 80, 
         Tag = "", 
         Name = "shopkeeper droid", 
      }, 
      [10355] = 
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
         SpecFuns = 
         {
            [0] = "spec_newbie_pilot", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "all_greet_prog", 
               Arguments = "100", 
               Code = "bow $n\
say May I see your diploma please.\
", 
               ScriptType = "MProg", 
            }, 
            [2] = 
            {
               MudProgType = "act_prog", 
               Arguments = "p gives you a diploma.", 
               Code = "look diploma\
say Thank-you.\
give diploma $n\
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
         DamRoll = 0, 
         Description = "", 
         ShortDescr = "a pilot", 
         Weight = 0, 
         HitRoll = 0, 
         Sex = "undistinguished", 
         LongDescr = "A Mon Calamarian pilot is here ferrying academy graduates.\
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
         Vnum = 10355, 
         ArmorClass = 0, 
         Tag = "", 
         Name = "pilot", 
      }, 
      [10340] = 
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
            [10] = "Practice", 
            [30] = "Prototype", 
         }, 
         NumberOfAttacks = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "act_prog", 
               Arguments = "practices", 
               Code = "tell $n That will be 10 credits.\
mpechoat $n All teachers will charge you a certain amount \
mpechoat $n of credits, depending on the level you receive the skill at.\
mpechoat $n It is taken out automatically, so do not give Domick 10\
mpechoat $n credits :).\
", 
               ScriptType = "MProg", 
            }, 
            [2] = 
            {
               MudProgType = "all_greet_prog", 
               Arguments = "100", 
               Code = "tell $n Are you ready for your lessons?\
", 
               ScriptType = "MProg", 
            }, 
         }, 
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
         Immune = 
         {
            [20] = "magic", 
            [13] = "nonmagic", 
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         DamRoll = 0, 
         HitRoll = 0, 
         Description = "Domick carries himself with a grace and confidence born from his\
long life and many experiences in these Realms. He is looked on\
with awe and unquestioned respect. That respect is well deserved.\
Do not attempt to kill him, for you shall surely die.\
", 
         ShortDescr = "Domick", 
         Weight = 0, 
         Sex = "male", 
         DefaultPosition = "standing", 
         AffectedBy = 
         {
            [7] = "Sanctuary", 
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         HitChance = 
         {
            HitNoDice = 1, 
            HitSizeDice = 1, 
            HitPlus = 1000, 
         }, 
         Credits = 100, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         Level = 1, 
         LongDescr = "Domick, Lord of Knowledge, sits here reading, waiting for students.\
", 
         Vnum = 10340, 
         ArmorClass = 94, 
         Tag = "", 
         Name = "Domick Dom teacher", 
      }, 
      [10342] = 
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
            [30] = "Prototype", 
         }, 
         NumberOfAttacks = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "no nope", 
               Code = "say You can have it anyways.\
give luke $n\
drop all\
", 
               ScriptType = "MProg", 
            }, 
            [2] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "yes yep", 
               Code = "say Ok you can have it then.\
give luke $n\
drop all\
", 
               ScriptType = "MProg", 
            }, 
            [3] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "hi hello", 
               Code = "say Hello.\
Say I found this toy ... is it yours?\
mpat 10399 mpoload 10320\
mpecho A student shows you a Luke Skywalker Action Figure.\
", 
               ScriptType = "MProg", 
            }, 
         }, 
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
         DamRoll = 0, 
         Description = "", 
         ShortDescr = "a student", 
         Weight = 0, 
         HitRoll = 0, 
         Sex = "undistinguished", 
         LongDescr = "An acadamy student is here taking a break from his studies.\
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
         Vnum = 10342, 
         ArmorClass = 0, 
         Tag = "", 
         Name = "academy student", 
      }, 
      [10343] = 
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
            [30] = "Prototype", 
         }, 
         NumberOfAttacks = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "act_prog", 
               Arguments = "p gives you a Luke Skywalker action figure.", 
               Code = "say thank you\
", 
               ScriptType = "MProg", 
            }, 
            [2] = 
            {
               MudProgType = "all_greet_prog", 
               Arguments = "100", 
               Code = "snif\
say I lost my Luke Skywalker toy\
cry\
", 
               ScriptType = "MProg", 
            }, 
            [3] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "key", 
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
               ScriptType = "MProg", 
            }, 
            [4] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "door door? key?", 
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
               ScriptType = "MProg", 
            }, 
            [5] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "door? north", 
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
               ScriptType = "MProg", 
            }, 
         }, 
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
         DamRoll = 0, 
         Description = "", 
         ShortDescr = "a small child", 
         Weight = 0, 
         HitRoll = 0, 
         Sex = "male", 
         LongDescr = "A young child is sitting here.\
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
         Vnum = 10343, 
         ArmorClass = 0, 
         Tag = "", 
         Name = "kid child", 
      }, 
      [10360] = 
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
            [26] = "Droid", 
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
         Description = "", 
         ShortDescr = "a practice droid", 
         Weight = 0, 
         HitRoll = 0, 
         Sex = "undistinguished", 
         LongDescr = "A practice droid is here waiting for combat.\
", 
         HitChance = 
         {
            HitNoDice = 1, 
            HitSizeDice = 4, 
            HitPlus = 5, 
         }, 
         DefaultPosition = "standing", 
         Credits = 10, 
         Level = 1, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         Vnum = 10360, 
         ArmorClass = 100, 
         Tag = "", 
         Name = "practice droid", 
      }, 
      [10345] = 
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
         Race = "_85", 
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
               MudProgType = "death_prog", 
               Arguments = "85", 
               Code = "if level($n) >= 6\
if rand(50)\
mpechoat $n You feel an overwhelming desire for greater challenge.\
else\
mpechoat $n The chadoyn is far too easy for you to kill.\
endif\
endif\
", 
               ScriptType = "MProg", 
            }, 
         }, 
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
         Immune = 
         {
            [11] = "charm", 
         }, 
         DamRoll = 0, 
         Description = "He looks back at you with his beady little eyes and a snarl on his face.\
You are pretty sure you can best him in regards to combat.\
", 
         ShortDescr = "the chadoyn", 
         Weight = 0, 
         HitRoll = 0, 
         Sex = "undistinguished", 
         LongDescr = "The chadoyn is straining its leash, attempting to attack you.\
", 
         HitChance = 
         {
            HitNoDice = 2, 
            HitSizeDice = 4, 
            HitPlus = 1, 
         }, 
         DefaultPosition = "standing", 
         Credits = 0, 
         Level = 2, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         Vnum = 10345, 
         ArmorClass = 25, 
         Tag = "", 
         Name = "chadoyn cage", 
      }, 
      [10394] = 
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
            [20] = "Scholar", 
         }, 
         NumberOfAttacks = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "all_greet_prog", 
               Arguments = "100", 
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
               ScriptType = "MProg", 
            }, 
            [2] = 
            {
               MudProgType = "death_prog", 
               Arguments = "100", 
               Code = "say You know, I am really a lover, not a fighter ...\
mpslay $n\
mpat $n mpechoat $n But alas, killing me was a slaying offense.\
mpgoto 10399\
mpat 10306 mpmload 10394\
", 
               ScriptType = "MProg", 
            }, 
            [3] = 
            {
               MudProgType = "act_prog", 
               Arguments = "p flees head over heels!", 
               Code = "mptrans 0.$n\
mpechoat $n Abbigayle says, 'You fled, so I shall spare your life!'\
mpgoto 10399\
mpat 10306 mpmload 10394\
", 
               ScriptType = "MProg", 
            }, 
         }, 
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
         Immune = 
         {
            [20] = "magic", 
            [13] = "nonmagic", 
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         DamRoll = 0, 
         HitRoll = 0, 
         Description = "This has to be one of the most beautiful women in these Realms, both inside\
and out. Her eyes have a sparkle of amusement and her face an easy smile.\
She knows you are admiring her, and she does not seem to mind. She is\
comfortable and confident that the picture she makes is breath taking. Her\
voice at last breaks the spell. Her voice is like satin, you can hardly\
wait for your lessons to begin. Any reason to hear her speak the tongues\
foreign to your ears.\
", 
         ShortDescr = "abbigayle", 
         Weight = 0, 
         Sex = "female", 
         DefaultPosition = "standing", 
         AffectedBy = 
         {
            [7] = "Sanctuary", 
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         HitChance = 
         {
            HitNoDice = 1000, 
            HitSizeDice = 1, 
            HitPlus = 0, 
         }, 
         Credits = 50, 
         Damage = 
         {
            DamSizeDice = 6, 
            DamNoDice = 1, 
            DamPlus = 3, 
         }, 
         Level = 5, 
         LongDescr = "A beautiful lady stands here, waiting for her students.\
", 
         Vnum = 10394, 
         ArmorClass = 5, 
         Tag = "", 
         Name = "Abbigayle language teacher", 
      }, 
      [10395] = 
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
            [30] = "Prototype", 
         }, 
         NumberOfAttacks = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "script_prog", 
               Arguments = "", 
               Code = "say My brother is dead.\
say Killed by a stray blaster shot.\
snif\
say If only he had made a clone.\
", 
               ScriptType = "MProg", 
            }, 
            [2] = 
            {
               MudProgType = "all_greet_prog", 
               Arguments = "100", 
               Code = "close north\
say Don't let it happen to you $n\
", 
               ScriptType = "MProg", 
            }, 
         }, 
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
         DamRoll = 0, 
         Description = "", 
         ShortDescr = "a sad student", 
         Weight = 0, 
         HitRoll = 0, 
         Sex = "undistinguished", 
         LongDescr = "A sad student leans against the wall.\
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
         Vnum = 10395, 
         ArmorClass = 0, 
         Tag = "", 
         Name = "sad student", 
      }, 
      [10365] = 
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
            [26] = "Droid", 
         }, 
         NumberOfAttacks = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "food? ration? food ration", 
               Code = "mpoload 10313 1\
give ration $n\
drop all\
", 
               ScriptType = "MProg", 
            }, 
            [2] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "canteen? canteen", 
               Code = "mpoload 10314 1\
give canteen $n\
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
            }, 
            Speaking = 
            {
               [0] = "basic", 
            }, 
         }, 
         DamRoll = 0, 
         Description = "", 
         ShortDescr = "a service droid", 
         Weight = 0, 
         HitRoll = 0, 
         Sex = "undistinguished", 
         LongDescr = "A service droid is here handing out canteens and rations.\
", 
         HitChance = 
         {
            HitNoDice = 10, 
            HitSizeDice = 0, 
            HitPlus = 100, 
         }, 
         DefaultPosition = "standing", 
         Credits = 0, 
         Level = 10, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 25, 
         }, 
         Vnum = 10365, 
         ArmorClass = 0, 
         Tag = "", 
         Name = "service droid", 
      }, 
      [10350] = 
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
         SpecFuns = 
         {
            [0] = "spec_auth", 
         }, 
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
            [30] = "Prototype", 
         }, 
         NumberOfAttacks = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "all_greet_prog", 
               Arguments = "100", 
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
         Immune = 
         {
            [20] = "magic", 
            [13] = "nonmagic", 
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         DamRoll = 0, 
         HitRoll = 0, 
         Description = "Domick carries himself with a grace and confidence born from his\
long life and many experiences in these Realms. He is looked on\
with awe and unquestioned respect. That respect is well deserved.\
Do not attempt to kill him, for you shall surely die.\
", 
         ShortDescr = "the Schoolmaster", 
         Weight = 0, 
         Sex = "male", 
         DefaultPosition = "standing", 
         AffectedBy = 
         {
            [7] = "Sanctuary", 
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         HitChance = 
         {
            HitNoDice = 1, 
            HitSizeDice = 1, 
            HitPlus = 1000, 
         }, 
         Credits = 100, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamNoDice = 0, 
            DamPlus = 0, 
         }, 
         Level = 1, 
         LongDescr = "The schoolmaster is here offering diplomas to academy graduates.\
", 
         Vnum = 10350, 
         ArmorClass = 94, 
         Tag = "", 
         Name = "professor schoolmaster teacher headmaster", 
      }, 
      [10499] = 
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
         ShortDescr = "a newly created final mob", 
         Weight = 0, 
         HitRoll = 0, 
         Sex = "undistinguished", 
         LongDescr = "Some god abandoned a newly created final mob here.\
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
         Vnum = 10499, 
         ArmorClass = 0, 
         Tag = "", 
         Name = "final mob", 
      }, 
   }, 
   LowEconomy = 496051550, 
   Name = "Coruscant Academy", 
}
