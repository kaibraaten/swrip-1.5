-- Coruscant Academy
-- Last saved Wednesday 01-Jul-2020 11:08:17

AreaEntry
{
   Flags = 
   {
      [1] = "_01", 
      [0] = "NoPkill", 
   }, 
   ResetMessage = "You hear the hum of repulsorlifts powering up in the distance", 
   FileFormatVersion = 1, 
   ResetFrequency = 3, 
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
         ShortDescr = "an academy cap", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "drop_prog", 
               Arguments = "100", 
               Code = "mpforce $n sac $o\
", 
            }, 
         }, 
         Layers = 0, 
         Cost = 0, 
         Description = "A Coruscant Academy cap is here.", 
         ItemType = "armor", 
         Vnum = 10304, 
         Weight = 2, 
         WearFlags = 
         {
            [0] = "Take", 
            [4] = "Head", 
         }, 
         Affects = 
         {
            [1] = 
            {
               Modifier = 1, 
               Location = 3, 
            }, 
         }, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 3, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 3, 
         }, 
         Name = "academy cap", 
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
         ShortDescr = "a black brocade cape", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "drop_prog", 
               Arguments = "100", 
               Code = "mpforce $n sac $o\
", 
            }, 
         }, 
         Cost = 0, 
         Description = "A black brocade cape from the academy", 
         ItemType = "armor", 
         Vnum = 10305, 
         Weight = 3, 
         WearFlags = 
         {
            [0] = "Take", 
            [10] = "About", 
         }, 
         Layers = 0, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         Name = "cape brocade academy", 
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
         ShortDescr = "a strong metal collar", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "drop_prog", 
               Arguments = "100", 
               Code = "mpforce $n sac $o\
", 
            }, 
         }, 
         Cost = 0, 
         Description = "A strong metal collar from the academy", 
         ItemType = "armor", 
         Vnum = 10306, 
         Weight = 5, 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
         }, 
         Layers = 0, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 3, 
         }, 
         Name = "collar metal academy", 
      }, 
      [10307] = 
      {
         Flags = 
         {
            [6] = "Magic", 
         }, 
         ShortDescr = "a visor of completion", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "wear_prog", 
               Arguments = "100", 
               Code = "mpechoat $n As you wear this visor, you feel more intelligent and wise!\
mpechoaround $n As $n wears the visor of completion, $e looks more complete!\
", 
            }, 
         }, 
         Layers = 0, 
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
         Cost = 0, 
         Description = "A visor of completion is here, emitting a faint glow.", 
         ItemType = "armor", 
         Vnum = 10307, 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
            [17] = "Eyes", 
         }, 
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
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         Name = "visor completion academy", 
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
         ShortDescr = "an academy vest", 
         Cost = 0, 
         Description = "An academy vest was left here.", 
         ItemType = "armor", 
         Vnum = 10308, 
         Weight = 5, 
         WearFlags = 
         {
            [0] = "Take", 
            [3] = "Body", 
         }, 
         Layers = 0, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         Name = "academy vest", 
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
         ShortDescr = "lightweight tin sleeves", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "drop_prog", 
               Arguments = "100", 
               Code = "mpforce $n sac $o\
", 
            }, 
         }, 
         Layers = 0, 
         Cost = 0, 
         Description = "Lightweight tin sleeves from the academy", 
         ItemType = "armor", 
         Vnum = 10309, 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
            [8] = "Arms", 
         }, 
         Affects = 
         {
            [1] = 
            {
               Modifier = 1, 
               Location = 1, 
            }, 
         }, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 3, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 3, 
         }, 
         Name = "sleeves tin academy", 
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
         ShortDescr = "an energy shield", 
         Cost = 0, 
         Description = "An energy shield was dropped here.", 
         ItemType = "armor", 
         Vnum = 10310, 
         Weight = 5, 
         WearFlags = 
         {
            [0] = "Take", 
            [9] = "Shield", 
         }, 
         Layers = 0, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         Name = "forceshield energyshield shields shield", 
      }, 
      [10311] = 
      {
         Flags = 
         {
            [0] = "Glow", 
            [13] = "Inventory", 
            [6] = "Magic", 
         }, 
         ShortDescr = "a glowrod", 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 5, 
         Description = "A glowrod would make a good light source.", 
         ItemType = "light", 
         Vnum = 10311, 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Affects = 
         {
            [1] = 
            {
               Modifier = -1, 
               Location = 24, 
            }, 
         }, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 50, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Name = "light glowrod glowstick", 
      }, 
      [10312] = 
      {
         Flags = 
         {
            [6] = "Magic", 
         }, 
         ShortDescr = "a vibro-blade", 
         Layers = 0, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 250, 
         Description = "You see a finely honed vibro-blade here.", 
         ItemType = "weapon", 
         Vnum = 10312, 
         Weight = 3, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Affects = 
         {
            [1] = 
            {
               Modifier = -2, 
               Location = 18, 
            }, 
         }, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 4, 
            [3] = 2, 
            [4] = 1000, 
            [5] = 1000, 
            [0] = 12, 
         }, 
         Name = "academy vibro blade knife dagger vibro-blade", 
      }, 
      [10313] = 
      {
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         ShortDescr = "a packaged ration", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 5, 
         Description = "A packaged ration is here, waiting to be eaten.", 
         ItemType = "food", 
         Vnum = 10313, 
         Weight = 2, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Layers = 0, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 50, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 50, 
         }, 
         Name = "ration standard packaged", 
      }, 
      [10314] = 
      {
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a canteen", 
         Cost = 10, 
         Description = "A small grey canteen has been drooped here.", 
         ItemType = "drink_container", 
         Vnum = 10314, 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Layers = 0, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 40, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 40, 
         }, 
         Name = "canteen water grey stock", 
      }, 
      [10315] = 
      {
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a fountain", 
         Cost = 0, 
         ItemType = "fountain", 
         Vnum = 10315, 
         Weight = 1, 
         Layers = 0, 
         Description = "A drinking fountain rests against the wall.", 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 1000, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 1000, 
         }, 
         Name = "drinking fountain", 
      }, 
      [10316] = 
      {
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         ShortDescr = "a pair of socks", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 5, 
         Description = "A pair of socks is in a ball on the floor.", 
         ItemType = "armor", 
         Vnum = 10316, 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
            [6] = "Feet", 
         }, 
         Layers = 1, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 1, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Name = "socks", 
      }, 
      [10317] = 
      {
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a backpack", 
         Layers = 64, 
         Cost = 5, 
         Description = "An academy backpack was carelessly misplaced here.", 
         ItemType = "container", 
         Vnum = 10317, 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
            [10] = "About", 
         }, 
         Affects = 
         {
            [1] = 
            {
               Modifier = -5, 
               Location = 17, 
            }, 
         }, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 20, 
         }, 
         Name = "academy backpack", 
      }, 
      [10318] = 
      {
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a button", 
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
            }, 
         }, 
         Cost = 0, 
         ItemType = "button", 
         Vnum = 10318, 
         Weight = 1, 
         Layers = 0, 
         Description = "A small grey button seems out of place on the wall here.", 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Name = "grey button", 
      }, 
      [10319] = 
      {
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a box", 
         Cost = 0, 
         Description = "A small box .. I wonder whats inside, maybe you should open it.", 
         ItemType = "container", 
         Vnum = 10319, 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Layers = 0, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 1, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         Name = "box", 
      }, 
      [10320] = 
      {
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a Luke Skywalker action figure", 
         Cost = 0, 
         Description = "A Luke Skywalker action figure was misplaced here.", 
         ItemType = "trash", 
         Vnum = 10320, 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Layers = 0, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Name = "luke toy action figure doll", 
      }, 
      [10321] = 
      {
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a diploma", 
         Cost = 0, 
         Description = "Someone dropped their coruscant academy graduation diploma here.", 
         ItemType = "paper", 
         Vnum = 10321, 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Layers = 0, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Name = "diploma academy coruscant graduation", 
      }, 
      [10322] = 
      {
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a shuttle", 
         Cost = 0, 
         ItemType = "trash", 
         Vnum = 10322, 
         Weight = 1, 
         Layers = 0, 
         Description = "A small shuttle is docked here.", 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Name = "academy shuttle", 
      }, 
      [10323] = 
      {
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         ShortDescr = "a practice lightsaber", 
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
         Cost = 500, 
         Description = "A practice lightsaber is here.", 
         ItemType = "weapon", 
         Vnum = 10323, 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Layers = 0, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 4, 
            [3] = 3, 
            [4] = 1000, 
            [5] = 1000, 
            [0] = 12, 
         }, 
         Name = "practice lightsaber", 
      }, 
      [10324] = 
      {
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         ShortDescr = "a lightsaber battery", 
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
         Cost = 50, 
         Description = "A lightsaber battery is lying here.", 
         ItemType = "battery", 
         Vnum = 10324, 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Layers = 0, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 1000, 
         }, 
         Name = "battery", 
      }, 
      [10499] = 
      {
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a newly created final object", 
         Cost = 0, 
         ItemType = "trash", 
         Vnum = 10499, 
         Weight = 1, 
         Layers = 0, 
         Description = "Some god dropped a newly created final object here.", 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Name = "final object", 
      }, 
      [10498] = 
      {
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a superconductor", 
         Cost = 0, 
         Description = "A superconductor is lying here.", 
         ItemType = "superconductor", 
         Vnum = 10498, 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Layers = 0, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Name = "superconductor", 
      }, 
      [10497] = 
      {
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a circuit board", 
         Cost = 120, 
         Description = "A circuit board was dropped here.", 
         ItemType = "circuit", 
         Vnum = 10497, 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Layers = 0, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Name = "circuit board", 
      }, 
      [10496] = 
      {
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a tiny, round mirror", 
         Cost = 0, 
         Description = "A tiny, round mirror is lying here.", 
         ItemType = "mirror", 
         Vnum = 10496, 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Layers = 0, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Name = "mirror", 
      }, 
      [10495] = 
      {
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a non-adegan crystal", 
         Cost = 0, 
         Description = "A non-adegan crystal is lying here.", 
         ItemType = "crystal", 
         Vnum = 10495, 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Layers = 0, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Name = "non-adegan crystal", 
      }, 
      [10494] = 
      {
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         ShortDescr = "some scrap durasteel", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 50, 
         Description = "A scrap of some material lies here.", 
         ItemType = "durasteel", 
         Vnum = 10494, 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Layers = 0, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Name = "some scrap durasteel", 
      }, 
      [10493] = 
      {
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a portable oven", 
         Cost = 0, 
         Description = "A portable oven is here.", 
         ItemType = "oven", 
         Vnum = 10493, 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Layers = 0, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Name = "portable oven", 
      }, 
      [10492] = 
      {
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a battery", 
         Cost = 0, 
         Description = "A battery is lying here.", 
         ItemType = "battery", 
         Vnum = 10492, 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Layers = 0, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Name = "battery", 
      }, 
      [10491] = 
      {
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a durastaff", 
         Cost = 0, 
         Description = "A durastaff is lying here.", 
         ItemType = "staff", 
         Vnum = 10491, 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Layers = 0, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Name = "staff durastaff", 
      }, 
      [10490] = 
      {
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a toolkit", 
         Cost = 0, 
         Description = "A toolkit is lying here.", 
         ItemType = "toolkit", 
         Vnum = 10490, 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Layers = 0, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Name = "toolkit", 
      }, 
      [10489] = 
      {
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a small lens", 
         Cost = 0, 
         Description = "A small lens is lying here.", 
         ItemType = "lens", 
         Vnum = 10489, 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Layers = 0, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Name = "lens", 
      }, 
      [10488] = 
      {
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         ShortDescr = "an ammunition cell", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 10, 
         Description = "An ammunition cell was carelessly left here.", 
         ItemType = "ammo", 
         Vnum = 10488, 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Layers = 0, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 500, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 500, 
         }, 
         Name = "ammo cell amunition cartridge", 
      }, 
      [10487] = 
      {
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "some poorly refined carsanum", 
         Cost = 200, 
         Description = "Some carsanum was dropped here.", 
         ItemType = "spice", 
         Vnum = 10487, 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Layers = 0, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 10, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 1, 
         }, 
         Name = "carsanum spice", 
      }, 
      [10435] = 
      {
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a prototype spice", 
         Cost = 0, 
         Description = "A prototype spice is here.", 
         ItemType = "spice", 
         Vnum = 10435, 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Layers = 0, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Name = "prototype spice", 
      }, 
      [10434] = 
      {
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a prototype disguise", 
         Cost = 0, 
         Description = "A prototype disguise is here.", 
         ItemType = "disguise", 
         Vnum = 10434, 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Layers = 0, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Name = "prototype disguise", 
      }, 
      [10433] = 
      {
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a prototype armor", 
         Cost = 100, 
         Description = "A prototype armor is here.", 
         ItemType = "armor", 
         Vnum = 10433, 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Layers = 0, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Name = "prototype armor", 
      }, 
      [10414] = 
      {
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a student message terminal", 
         Cost = 0, 
         ItemType = "furniture", 
         Vnum = 10414, 
         Weight = 1, 
         Layers = 0, 
         Description = "A student message terminal is here for you to play with.", 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Name = "student message terminal", 
      }, 
      [10432] = 
      {
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a prototype container", 
         Cost = 100, 
         Description = "A prototype container is here.", 
         ItemType = "container", 
         Vnum = 10432, 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Layers = 0, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Name = "prototype container", 
      }, 
      [10431] = 
      {
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "prototype bowcaster", 
         Cost = 0, 
         Description = "A proottype bowcaster is here", 
         ItemType = "weapon", 
         Vnum = 10431, 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Layers = 0, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 9, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Name = "prototype bowcaster", 
      }, 
      [10430] = 
      {
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a newly created prototype comlink", 
         Cost = 0, 
         ItemType = "comlink", 
         Vnum = 10430, 
         Weight = 1, 
         Layers = 0, 
         Description = "Some god dropped a newly created prototype comlink here.", 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Name = "prototype comlink", 
      }, 
      [10429] = 
      {
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a newly created prototype shield", 
         Cost = 0, 
         Description = "Some god dropped a newly created prototype shield here.", 
         ItemType = "armor", 
         Vnum = 10429, 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
            [9] = "Shield", 
         }, 
         Layers = 0, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Name = "prototype shield", 
      }, 
      [10428] = 
      {
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a newly created prototype light", 
         Cost = 0, 
         Description = "Some god dropped a newly created prototype light here.", 
         ItemType = "light", 
         Vnum = 10428, 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Layers = 0, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Name = "prototype light", 
      }, 
      [10420] = 
      {
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "prototype blaster", 
         Cost = 0, 
         Description = "A prototype blaster is here", 
         ItemType = "weapon", 
         Vnum = 10420, 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Layers = 0, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 6, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Name = "prototype blaster", 
      }, 
      [10421] = 
      {
         Flags = 
         {
            [4] = "Contraband", 
         }, 
         ShortDescr = "a prototype lightsaber", 
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
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         Description = "A prototype lightsaber shouldn't be here", 
         ItemType = "weapon", 
         Vnum = 10421, 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Layers = 128, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 3, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Name = "prototype saber lightsaber", 
      }, 
      [10422] = 
      {
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "prototype vibro-blade", 
         Cost = 0, 
         Description = "A prototype vibro-blade shouldn't be here", 
         ItemType = "weapon", 
         Vnum = 10422, 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Layers = 0, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 2, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Name = "prototype vibro-blade", 
      }, 
      [10423] = 
      {
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a key", 
         Cost = 0, 
         Description = "An old fashioned mechanical key was left on the ground here.", 
         ItemType = "key", 
         Vnum = 10423, 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Layers = 0, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Name = "key", 
      }, 
      [10424] = 
      {
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a comlink", 
         Cost = 50, 
         Description = "A small hand-held comlink.", 
         ItemType = "comlink", 
         Vnum = 10424, 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         Layers = 0, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Name = "comlink radio communicator", 
      }, 
      [10425] = 
      {
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a newly created prototype grenade", 
         Cost = 0, 
         ItemType = "grenade", 
         Vnum = 10425, 
         Weight = 1, 
         Layers = 0, 
         Description = "Some god dropped a newly created prototype grenade here.", 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 350, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 200, 
         }, 
         Name = "prototype grenade", 
      }, 
      [10426] = 
      {
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         ShortDescr = "a newly created generic armor", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ItemType = "trash", 
         Vnum = 10426, 
         Weight = 1, 
         Description = "Some god dropped a newly created generic armor here.", 
         Layers = 0, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Name = "generic armor", 
      }, 
      [10427] = 
      {
         ExtraDescriptions = 
         {
         }, 
         ShortDescr = "a newly created protoype landmine", 
         Cost = 0, 
         Description = "Some god dropped a newly created protoype landmine here.", 
         ItemType = "landmine", 
         Vnum = 10427, 
         Weight = 1, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Layers = 0, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Name = "protoype landmine", 
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
         ShortDescr = "a charm bracelet", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "drop_prog", 
               Arguments = "100", 
               Code = "mpforce $n sac $o\
", 
            }, 
         }, 
         Layers = 0, 
         Cost = 0, 
         Description = "A charm bracelet from the academy lies here", 
         ItemType = "armor", 
         Vnum = 10300, 
         Weight = 2, 
         WearFlags = 
         {
            [0] = "Take", 
            [12] = "Wrist", 
         }, 
         Affects = 
         {
            [1] = 
            {
               Modifier = 1, 
               Location = 31, 
            }, 
         }, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         Name = "bracelet charm academy", 
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
         ShortDescr = "a pair of black combat boots", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "drop_prog", 
               Arguments = "100", 
               Code = "mpforce $n sac $o\
", 
            }, 
         }, 
         Layers = 126, 
         Cost = 0, 
         Description = "A pair of black combat boots from the Academy lies here", 
         ItemType = "armor", 
         Vnum = 10301, 
         Weight = 3, 
         WearFlags = 
         {
            [0] = "Take", 
            [6] = "Feet", 
         }, 
         Affects = 
         {
            [1] = 
            {
               Modifier = 100, 
               Location = 14, 
            }, 
         }, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 3, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 3, 
         }, 
         Name = "combat boots academy", 
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
         ShortDescr = "a braided leather belt", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "drop_prog", 
               Arguments = "100", 
               Code = "mpforce $n sac $o\
", 
            }, 
         }, 
         Layers = 0, 
         Cost = 0, 
         Description = "A braided leather belt from the Academy lies here", 
         ItemType = "armor", 
         Vnum = 10302, 
         Weight = 2, 
         WearFlags = 
         {
            [0] = "Take", 
            [11] = "Waist", 
         }, 
         Affects = 
         {
            [1] = 
            {
               Modifier = 1, 
               Location = 5, 
            }, 
         }, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         Name = "belt leather academy", 
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
         ShortDescr = "some leggings", 
         Cost = 0, 
         Description = "A pair of academy leggings is here.", 
         ItemType = "armor", 
         Vnum = 10303, 
         Weight = 3, 
         WearFlags = 
         {
            [0] = "Take", 
            [5] = "Legs", 
         }, 
         Layers = 0, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         Name = "pants trousers slacks leggings", 
      }, 
   }, 
   Resets = 
   {
      [1] = 
      {
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 10303, 
         MiscData = 0, 
         Arg1 = 10340, 
      }, 
      [2] = 
      {
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 10306, 
         MiscData = 0, 
         Arg1 = 10394, 
      }, 
      [3] = 
      {
         Command = "D", 
         Arg2 = 0, 
         Arg3 = 1, 
         MiscData = 0, 
         Arg1 = 10309, 
      }, 
      [4] = 
      {
         Command = "D", 
         Arg2 = 2, 
         Arg3 = 1, 
         MiscData = 0, 
         Arg1 = 10310, 
      }, 
      [5] = 
      {
         Command = "D", 
         Arg2 = 3, 
         Arg3 = 1, 
         MiscData = 0, 
         Arg1 = 10312, 
      }, 
      [6] = 
      {
         Command = "D", 
         Arg2 = 1, 
         Arg3 = 1, 
         MiscData = 0, 
         Arg1 = 10313, 
      }, 
      [7] = 
      {
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 10430, 
         MiscData = 1, 
         Arg1 = 10414, 
      }, 
      [8] = 
      {
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 10308, 
         MiscData = 1, 
         Arg1 = 10345, 
      }, 
      [9] = 
      {
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 10320, 
         MiscData = 1, 
         Arg1 = 10360, 
      }, 
      [10] = 
      {
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 8, 
         MiscData = 1, 
         Arg1 = 10301, 
      }, 
      [11] = 
      {
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 13, 
         MiscData = 1, 
         Arg1 = 10302, 
      }, 
      [12] = 
      {
         Arg1 = 10304, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [13] = 
      {
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 10319, 
         MiscData = 1, 
         Arg1 = 10318, 
      }, 
      [14] = 
      {
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 10318, 
         MiscData = 1, 
         Arg1 = 10342, 
      }, 
      [15] = 
      {
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 10323, 
         MiscData = 1, 
         Arg1 = 10343, 
      }, 
      [16] = 
      {
         Command = "D", 
         Arg2 = 0, 
         Arg3 = 2, 
         MiscData = 0, 
         Arg1 = 10323, 
      }, 
      [17] = 
      {
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 10326, 
         MiscData = 1, 
         Arg1 = 10355, 
      }, 
      [18] = 
      {
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 10317, 
         MiscData = 1, 
         Arg1 = 10315, 
      }, 
      [19] = 
      {
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 10317, 
         MiscData = 0, 
         Arg1 = 10365, 
      }, 
      [20] = 
      {
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 10327, 
         MiscData = 1, 
         Arg1 = 10395, 
      }, 
      [21] = 
      {
         Command = "D", 
         Arg2 = 0, 
         Arg3 = 1, 
         MiscData = 0, 
         Arg1 = 10327, 
      }, 
      [22] = 
      {
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 10321, 
         MiscData = 1, 
         Arg1 = 10370, 
      }, 
      [23] = 
      {
         Arg1 = 10317, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [24] = 
      {
         Arg1 = 10311, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [25] = 
      {
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 10324, 
         MiscData = 1, 
         Arg1 = 10350, 
      }, 
      [26] = 
      {
         Arg1 = 10423, 
         Arg2 = 1, 
         MiscData = 1, 
         Command = "G", 
      }, 
      [27] = 
      {
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 10324, 
         MiscData = 1, 
         Arg1 = 10414, 
      }, 
      [28] = 
      {
         Command = "D", 
         Arg2 = 2, 
         Arg3 = 1, 
         MiscData = 0, 
         Arg1 = 10324, 
      }, 
      [29] = 
      {
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 10325, 
         MiscData = 1, 
         Arg1 = 10322, 
      }, 
   }, 
   Filename = "newacad.lua", 
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
   HighEconomy = 0, 
   Mobiles = 
   {
      [10370] = 
      {
         Position = "standing", 
         NumberOfAttacks = 0, 
         AffectedBy = 
         {
            [3] = "DetectInvis", 
         }, 
         DefaultPosition = "standing", 
         Shop = 
         {
            KeeperShortDescr = "a shopkeeper", 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            ProfitBuy = 120, 
            BusinessHours = 
            {
               Close = 23, 
               Open = 0, 
            }, 
            ProfitSell = 90, 
         }, 
         Vnum = 10370, 
         Weight = 0, 
         ArmorClass = 80, 
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
         Race = "Human", 
         Name = "shopkeeper droid", 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         ShortDescr = "a shopkeeper", 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Constitution = 0, 
            Luck = 0, 
            Charisma = 0, 
            Wisdom = 0, 
         }, 
         Alignment = 0, 
         HitChance = 
         {
            HitNoDice = 2, 
            HitPlus = 2, 
            HitSizeDice = 20, 
         }, 
         HitRoll = 2, 
         Immune = 
         {
            [20] = "magic", 
            [11] = "charm", 
         }, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamPlus = 10, 
            DamNoDice = 2, 
         }, 
         LongDescr = "A droid is here selling useful items to students.\
", 
         DamRoll = 2, 
         Credits = 100, 
         Sex = "undistinguished", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [26] = "Droid", 
         }, 
         Height = 0, 
         Level = 20, 
         Description = "", 
      }, 
      [10355] = 
      {
         Position = "standing", 
         NumberOfAttacks = 0, 
         DefaultPosition = "standing", 
         SpecFuns = 
         {
            [0] = "spec_newbie_pilot", 
         }, 
         Vnum = 10355, 
         Weight = 0, 
         ArmorClass = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "act_prog", 
               Arguments = "p gives you a diploma.", 
               Code = "look diploma\
say Thank-you.\
give diploma $n\
", 
            }, 
            [2] = 
            {
               MudProgType = "all_greet_prog", 
               Arguments = "100", 
               Code = "bow $n\
say May I see your diploma please.\
", 
            }, 
         }, 
         Race = "Human", 
         Name = "pilot", 
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
         ShortDescr = "a pilot", 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         Alignment = 0, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         HitRoll = 0, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Constitution = 0, 
            Luck = 0, 
            Charisma = 0, 
            Wisdom = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         LongDescr = "A Mon Calamarian pilot is here ferrying academy graduates.\
", 
         DamRoll = 0, 
         Credits = 0, 
         Sex = "undistinguished", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Height = 0, 
         Level = 1, 
         Description = "", 
      }, 
      [10340] = 
      {
         Position = "standing", 
         NumberOfAttacks = 0, 
         AffectedBy = 
         {
            [7] = "Sanctuary", 
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         DefaultPosition = "standing", 
         Vnum = 10340, 
         Weight = 0, 
         ArmorClass = 94, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "all_greet_prog", 
               Arguments = "100", 
               Code = "tell $n Are you ready for your lessons?\
", 
            }, 
            [2] = 
            {
               MudProgType = "act_prog", 
               Arguments = "practices", 
               Code = "tell $n That will be 10 credits.\
mpechoat $n All teachers will charge you a certain amount \
mpechoat $n of credits, depending on the level you receive the skill at.\
mpechoat $n It is taken out automatically, so do not give Domick 10\
mpechoat $n credits :).\
", 
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
         Race = "Human", 
         Name = "Domick Dom teacher", 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         ShortDescr = "Domick", 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Constitution = 0, 
            Luck = 0, 
            Charisma = 0, 
            Wisdom = 0, 
         }, 
         Alignment = 1000, 
         HitChance = 
         {
            HitNoDice = 1, 
            HitPlus = 1000, 
            HitSizeDice = 1, 
         }, 
         HitRoll = 0, 
         Immune = 
         {
            [20] = "magic", 
            [13] = "nonmagic", 
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         LongDescr = "Domick, Lord of Knowledge, sits here reading, waiting for students.\
", 
         DamRoll = 0, 
         Credits = 100, 
         Sex = "male", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [10] = "Practice", 
            [30] = "Prototype", 
         }, 
         Height = 0, 
         Level = 1, 
         Description = "Domick carries himself with a grace and confidence born from his\
long life and many experiences in these Realms. He is looked on\
with awe and unquestioned respect. That respect is well deserved.\
Do not attempt to kill him, for you shall surely die.\
", 
      }, 
      [10342] = 
      {
         Position = "standing", 
         NumberOfAttacks = 0, 
         DefaultPosition = "standing", 
         Vnum = 10342, 
         Weight = 0, 
         ArmorClass = 0, 
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
            }, 
            [2] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "yes yep", 
               Code = "say Ok you can have it then.\
give luke $n\
drop all\
", 
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
            }, 
         }, 
         Race = "Human", 
         Name = "academy student", 
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
         ShortDescr = "a student", 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         Alignment = 0, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         HitRoll = 0, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Constitution = 0, 
            Luck = 0, 
            Charisma = 0, 
            Wisdom = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         LongDescr = "An acadamy student is here taking a break from his studies.\
", 
         DamRoll = 0, 
         Credits = 0, 
         Sex = "undistinguished", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         Height = 0, 
         Level = 1, 
         Description = "", 
      }, 
      [10343] = 
      {
         Position = "standing", 
         NumberOfAttacks = 0, 
         DefaultPosition = "standing", 
         Vnum = 10343, 
         Weight = 0, 
         ArmorClass = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "act_prog", 
               Arguments = "p gives you a Luke Skywalker action figure.", 
               Code = "say thank you\
", 
            }, 
            [2] = 
            {
               MudProgType = "all_greet_prog", 
               Arguments = "100", 
               Code = "snif\
say I lost my Luke Skywalker toy\
cry\
", 
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
            }, 
         }, 
         Race = "Human", 
         Name = "kid child", 
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
         ShortDescr = "a small child", 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         Alignment = 0, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         HitRoll = 0, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Constitution = 0, 
            Luck = 0, 
            Charisma = 0, 
            Wisdom = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         LongDescr = "A young child is sitting here.\
", 
         DamRoll = 0, 
         Credits = 0, 
         Sex = "male", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         Height = 0, 
         Level = 1, 
         Description = "", 
      }, 
      [10360] = 
      {
         Position = "standing", 
         NumberOfAttacks = 0, 
         DefaultPosition = "standing", 
         Vnum = 10360, 
         Weight = 0, 
         ArmorClass = 100, 
         Race = "Human", 
         Name = "practice droid", 
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
         ShortDescr = "a practice droid", 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         Alignment = 0, 
         HitChance = 
         {
            HitNoDice = 1, 
            HitPlus = 5, 
            HitSizeDice = 4, 
         }, 
         HitRoll = 0, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Constitution = 0, 
            Luck = 0, 
            Charisma = 0, 
            Wisdom = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         LongDescr = "A practice droid is here waiting for combat.\
", 
         DamRoll = 0, 
         Credits = 10, 
         Sex = "undistinguished", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [26] = "Droid", 
         }, 
         Height = 0, 
         Level = 1, 
         Description = "", 
      }, 
      [10345] = 
      {
         Position = "standing", 
         NumberOfAttacks = 0, 
         DefaultPosition = "standing", 
         Vnum = 10345, 
         Weight = 0, 
         ArmorClass = 25, 
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
         Race = "_85", 
         Name = "chadoyn cage", 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         ShortDescr = "the chadoyn", 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Constitution = 0, 
            Luck = 0, 
            Charisma = 0, 
            Wisdom = 0, 
         }, 
         Alignment = 0, 
         HitChance = 
         {
            HitNoDice = 2, 
            HitPlus = 1, 
            HitSizeDice = 4, 
         }, 
         HitRoll = 0, 
         Immune = 
         {
            [11] = "charm", 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         LongDescr = "The chadoyn is straining its leash, attempting to attack you.\
", 
         DamRoll = 0, 
         Credits = 0, 
         Sex = "undistinguished", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Height = 0, 
         Level = 2, 
         Description = "He looks back at you with his beady little eyes and a snarl on his face.\
You are pretty sure you can best him in regards to combat.\
", 
      }, 
      [10394] = 
      {
         Position = "standing", 
         NumberOfAttacks = 0, 
         AffectedBy = 
         {
            [7] = "Sanctuary", 
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         DefaultPosition = "standing", 
         Vnum = 10394, 
         Weight = 0, 
         ArmorClass = 5, 
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
         Race = "Human", 
         Name = "Abbigayle language teacher", 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         ShortDescr = "abbigayle", 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Constitution = 0, 
            Luck = 0, 
            Charisma = 0, 
            Wisdom = 0, 
         }, 
         Alignment = 0, 
         HitChance = 
         {
            HitNoDice = 1000, 
            HitPlus = 0, 
            HitSizeDice = 1, 
         }, 
         HitRoll = 0, 
         Immune = 
         {
            [20] = "magic", 
            [13] = "nonmagic", 
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         Damage = 
         {
            DamSizeDice = 6, 
            DamPlus = 3, 
            DamNoDice = 1, 
         }, 
         LongDescr = "A beautiful lady stands here, waiting for her students.\
", 
         DamRoll = 0, 
         Credits = 50, 
         Sex = "female", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [20] = "Scholar", 
         }, 
         Height = 0, 
         Level = 5, 
         Description = "This has to be one of the most beautiful women in these Realms, both inside\
and out. Her eyes have a sparkle of amusement and her face an easy smile.\
She knows you are admiring her, and she does not seem to mind. She is\
comfortable and confident that the picture she makes is breath taking. Her\
voice at last breaks the spell. Her voice is like satin, you can hardly\
wait for your lessons to begin. Any reason to hear her speak the tongues\
foreign to your ears.\
", 
      }, 
      [10395] = 
      {
         Position = "standing", 
         NumberOfAttacks = 0, 
         DefaultPosition = "standing", 
         Vnum = 10395, 
         Weight = 0, 
         ArmorClass = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "all_greet_prog", 
               Arguments = "100", 
               Code = "close north\
say Don't let it happen to you $n\
", 
            }, 
            [2] = 
            {
               MudProgType = "script_prog", 
               Arguments = "", 
               Code = "say My brother is dead.\
say Killed by a stray blaster shot.\
snif\
say If only he had made a clone.\
", 
            }, 
         }, 
         Race = "Human", 
         Name = "sad student", 
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
         ShortDescr = "a sad student", 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         Alignment = 0, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         HitRoll = 0, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Constitution = 0, 
            Luck = 0, 
            Charisma = 0, 
            Wisdom = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         LongDescr = "A sad student leans against the wall.\
", 
         DamRoll = 0, 
         Credits = 0, 
         Sex = "undistinguished", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         Height = 0, 
         Level = 1, 
         Description = "", 
      }, 
      [10365] = 
      {
         Position = "standing", 
         NumberOfAttacks = 0, 
         DefaultPosition = "standing", 
         Vnum = 10365, 
         Weight = 0, 
         ArmorClass = 0, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "canteen? canteen", 
               Code = "mpoload 10314 1\
give canteen $n\
drop all\
", 
            }, 
            [2] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "food? ration? food ration", 
               Code = "mpoload 10313 1\
give ration $n\
drop all\
", 
            }, 
         }, 
         Race = "Human", 
         Name = "service droid", 
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
         ShortDescr = "a service droid", 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         Alignment = 0, 
         HitChance = 
         {
            HitNoDice = 10, 
            HitPlus = 100, 
            HitSizeDice = 0, 
         }, 
         HitRoll = 0, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Constitution = 0, 
            Luck = 0, 
            Charisma = 0, 
            Wisdom = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 25, 
            DamNoDice = 0, 
         }, 
         LongDescr = "A service droid is here handing out canteens and rations.\
", 
         DamRoll = 0, 
         Credits = 0, 
         Sex = "undistinguished", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [26] = "Droid", 
         }, 
         Height = 0, 
         Level = 10, 
         Description = "", 
      }, 
      [10350] = 
      {
         Position = "standing", 
         NumberOfAttacks = 0, 
         AffectedBy = 
         {
            [7] = "Sanctuary", 
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         DefaultPosition = "standing", 
         SpecFuns = 
         {
            [0] = "spec_auth", 
         }, 
         Vnum = 10350, 
         Weight = 0, 
         ArmorClass = 94, 
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
         Race = "Human", 
         Name = "professor schoolmaster teacher headmaster", 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         ShortDescr = "the Schoolmaster", 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Constitution = 0, 
            Luck = 0, 
            Charisma = 0, 
            Wisdom = 0, 
         }, 
         Alignment = 1000, 
         HitChance = 
         {
            HitNoDice = 1, 
            HitPlus = 1000, 
            HitSizeDice = 1, 
         }, 
         HitRoll = 0, 
         Immune = 
         {
            [20] = "magic", 
            [13] = "nonmagic", 
            [10] = "sleep", 
            [11] = "charm", 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         LongDescr = "The schoolmaster is here offering diplomas to academy graduates.\
", 
         DamRoll = 0, 
         Credits = 100, 
         Sex = "male", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         Height = 0, 
         Level = 1, 
         Description = "Domick carries himself with a grace and confidence born from his\
long life and many experiences in these Realms. He is looked on\
with awe and unquestioned respect. That respect is well deserved.\
Do not attempt to kill him, for you shall surely die.\
", 
      }, 
      [10499] = 
      {
         Position = "standing", 
         NumberOfAttacks = 0, 
         DefaultPosition = "standing", 
         Vnum = 10499, 
         Weight = 0, 
         ArmorClass = 0, 
         Race = "Human", 
         Name = "final mob", 
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
         ShortDescr = "a newly created final mob", 
         SaveVs = 
         {
            ParaPetri = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
            SpellStaff = 0, 
            Wand = 0, 
         }, 
         Alignment = 0, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         HitRoll = 0, 
         Stats = 
         {
            Dexterity = 0, 
            Force = 0, 
            Intelligence = 0, 
            Strength = 0, 
            Constitution = 0, 
            Luck = 0, 
            Charisma = 0, 
            Wisdom = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         LongDescr = "Some god abandoned a newly created final mob here.\
", 
         DamRoll = 0, 
         Credits = 0, 
         Sex = "undistinguished", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Height = 0, 
         Level = 1, 
         Description = "", 
      }, 
   }, 
   LowEconomy = 496054790, 
   VnumRanges = 
   {
      Mob = 
      {
         Last = 10499, 
         First = 10340, 
      }, 
      Object = 
      {
         Last = 10499, 
         First = 10300, 
      }, 
      Room = 
      {
         Last = 10430, 
         First = 10300, 
      }, 
   }, 
   Rooms = 
   {
      [10304] = 
      {
         Flags = 
         {
            [16] = "Silence", 
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         TeleVnum = 0, 
         Vnum = 10304, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Distance = 0, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 10314, 
               Description = "A Marble Corridor\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               Distance = 0, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 10301, 
               Description = "A Stone Corridor\
", 
            }, 
            [3] = 
            {
               Key = -1, 
               Distance = 0, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 10307, 
               Description = "Wandering the Academy\
", 
            }, 
         }, 
         TeleDelay = 0, 
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
         Name = "The Reading Room", 
      }, 
      [10305] = 
      {
         Flags = 
         {
            [10] = "Safe", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         TeleVnum = 0, 
         Vnum = 10305, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
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
         Name = "Chamber of Trials for Rangers", 
      }, 
      [10306] = 
      {
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         TeleVnum = 0, 
         Vnum = 10306, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Distance = 0, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 10301, 
               Description = "A Stone Corridor\
", 
            }, 
         }, 
         TeleDelay = 0, 
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
         Name = "Abbigayle's Language Lessons", 
      }, 
      [10307] = 
      {
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         TeleVnum = 0, 
         Vnum = 10307, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "You see a solid oak door.\
\13", 
               Keyword = "Door", 
            }, 
         }, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Distance = 0, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 10304, 
               Description = "The Reading Room\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               Distance = 0, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 10309, 
               Description = "Wandering Darkhaven Academy, it looks safe\
", 
            }, 
            [3] = 
            {
               Key = -1, 
               Distance = 0, 
               Direction = "up", 
               Keyword = "", 
               DestinationVnum = 10304, 
               Description = "Back to the beginning\
", 
            }, 
         }, 
         TeleDelay = 0, 
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
         Name = "Wandering the Academy", 
      }, 
      [10308] = 
      {
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         TeleVnum = 0, 
         Vnum = 10308, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Distance = 0, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 10316, 
               Description = "A Dank Pit\
", 
            }, 
         }, 
         TeleDelay = 0, 
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
         Name = "A Dank Pit", 
      }, 
      [10309] = 
      {
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         TeleVnum = 0, 
         Vnum = 10309, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "You see a solid oak door.\
\13", 
               Keyword = "door", 
            }, 
         }, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Distance = 0, 
               Direction = "north", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Keyword = "door", 
               DestinationVnum = 10310, 
               Description = "An Enclosed Room\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               Distance = 0, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 10307, 
               Description = "Wandering the Academy\
", 
            }, 
            [3] = 
            {
               Key = -1, 
               Distance = 0, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 10311, 
               Description = "Lost in Darkhaven Academy\
", 
            }, 
            [4] = 
            {
               Key = -1, 
               Distance = 0, 
               Direction = "up", 
               Keyword = "", 
               DestinationVnum = 10304, 
               Description = "Back to the beginning\
", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "This is where you will start learning about exits not listed under \"Exits\".\
Doors are not seen on the game. You must read room description and LOOK\
<direction> to find them. Another method of finding a door is to \"bump\" into\
the walls. Type N. OUCH! You ran into the door. You want to be careful not\
to be affected with the pass door spell while using the bump method, as you\
may end up in a room you would rather not visit. Now, type OPEN N or OPEN\
DOOR. Next type EXIT, you will now see the north exit listed under \"Exits\".\
Type HELP OPEN to find out more information on doors.\
", 
         Name = "Wandering Coruscant Academy", 
      }, 
      [10310] = 
      {
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         TeleVnum = 0, 
         Vnum = 10310, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Distance = 0, 
               Direction = "south", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Keyword = "door", 
               DestinationVnum = 10309, 
               Description = "Wandering Darkhaven Academy\
", 
            }, 
         }, 
         TeleDelay = 0, 
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
         Name = "An Enclosed Room", 
      }, 
      [10311] = 
      {
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         TeleVnum = 0, 
         Vnum = 10311, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Distance = 0, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 10312, 
               Description = "Lost in Darkhaven Academy\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               Distance = 0, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 10309, 
               Description = "Wandering Darkhaven Academy\
", 
            }, 
            [3] = 
            {
               Key = -1, 
               Distance = 0, 
               Direction = "up", 
               Keyword = "", 
               DestinationVnum = 10304, 
               Description = "Back to the beginning\
", 
            }, 
         }, 
         TeleDelay = 0, 
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
         Name = "Lost in Coruscant Academy", 
      }, 
      [10312] = 
      {
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         TeleVnum = 0, 
         Vnum = 10312, 
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
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Distance = 0, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 10311, 
               Description = "Lost in Darkhaven Academy\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               Distance = 0, 
               Direction = "west", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
                  [3] = "Secret", 
               }, 
               Keyword = "tapestry door", 
               DestinationVnum = 10313, 
               Description = "door\
", 
            }, 
            [3] = 
            {
               Key = -1, 
               Distance = 0, 
               Direction = "up", 
               Keyword = "", 
               DestinationVnum = 10304, 
               Description = "Back to the beginning\
", 
            }, 
         }, 
         TeleDelay = 0, 
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
         Name = "Lost in Coruscant Academy", 
      }, 
      [10313] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         TeleVnum = 0, 
         Vnum = 10313, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "You see an oak door.\
\13", 
               Keyword = "door", 
            }, 
            [2] = 
            {
               Description = "This is a picture of fresh cut flowers in a glass vase. It seems to\
\13be hanging here just to cover a huge crack. That crack is so large, you\
\13can probably squeeze through it! Perhaps you should look closer at the\
\13crack. HINT: type CRACK. \
\13", 
               Keyword = "picture", 
            }, 
            [3] = 
            {
               Description = "This is a huge CRACK, you could probably squeeze through it. \
\13", 
               Keyword = "crack", 
            }, 
            [4] = 
            {
               Description = "This is a picture of fresh cut flowers in a glass vase. It seems to\
\13be hanging here just to cover a huge crack. That crack is so large, you\
\13can probably squeeze through it! Perhaps you should look closer at the\
\13crack. HINT: type CRACK.\
\13", 
               Keyword = "wall", 
            }, 
         }, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Distance = 0, 
               Direction = "east", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Keyword = "door", 
               DestinationVnum = 10312, 
               Description = "Lost in Darkhaven Academy\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               Distance = 0, 
               Direction = "up", 
               Keyword = "", 
               DestinationVnum = 10304, 
               Description = "Back to the beginning\
", 
            }, 
            [3] = 
            {
               Key = -1, 
               Distance = 0, 
               Direction = "somewhere", 
               Flags = 
               {
                  [19] = "Auto", 
                  [11] = "Hidden", 
               }, 
               Keyword = "crack", 
               DestinationVnum = 10302, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "Well Done! You have found this secret room. Sometimes these secret rooms\
will contain valuable items or will lead to other parts of the area you\
are exploring. Always pay close attention to room descriptions, mobiles\
descriptions and items, this will many times bring profitable results.\
This is a where you will experience a Somewhere exit. To find your way\
out, try looking at the picture on the wall. If you can not figure it out, \
you may leave by the up exit. Good luck!\
", 
         Name = "A Secret Alcove", 
      }, 
      [10314] = 
      {
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         TeleVnum = 0, 
         Vnum = 10314, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Distance = 0, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 10315, 
               Description = "Preparing for combat\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               Distance = 0, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 10304, 
               Description = "The Reading Room\
", 
            }, 
         }, 
         TeleDelay = 0, 
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
         Name = "A Marble Corridor", 
      }, 
      [10315] = 
      {
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         TeleVnum = 0, 
         Vnum = 10315, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Distance = 0, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 10317, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Distance = 0, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 10314, 
               Description = "A Marble Corridor\
", 
            }, 
            [3] = 
            {
               Key = -1, 
               Distance = 0, 
               Direction = "down", 
               Keyword = "", 
               DestinationVnum = 10316, 
               Description = "A Dank Pit\
", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "The time is drawing near to experience combat.  Directly below you  is the\
Chadoyn Pit, the home of a creature which will assist you in learning how\
to initiate combat. The Chadoyn is not aggressive, which means you must\
begin the fight.  There are many ways to do so.  The quickest is KILL\
<mob>. As you gain skills and spells, you may find many of them are also\
capable of initiating combat.  Some of the more popular spells that do so\
are:  DISPEL FORCE, SLEEP, DOMINATE, WEAKEN and BLINDNESS. Some of the\
most popular skills used are STEAL and BACKSTAB.\
", 
         Name = "Preparing for combat", 
      }, 
      [10316] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         TeleVnum = 0, 
         Vnum = 10316, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Distance = 0, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 10308, 
               Description = "A Dank Pit\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               Distance = 0, 
               Direction = "up", 
               Keyword = "", 
               DestinationVnum = 10315, 
               Description = "Preparing for combat\
", 
            }, 
         }, 
         TeleDelay = 0, 
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
         Name = "A Dank Pit", 
      }, 
      [10317] = 
      {
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Sector = "city", 
         TeleVnum = 0, 
         Vnum = 10317, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Distance = 0, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 10327, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Distance = 0, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 10315, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
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
         Name = "Time To Take A Break", 
      }, 
      [10318] = 
      {
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Sector = "city", 
         TeleVnum = 0, 
         Vnum = 10318, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Distance = 0, 
               Direction = "up", 
               Keyword = "", 
               DestinationVnum = 10322, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "Sometimes an item may appear useless at first.  There are many junk items\
that are just that, junk.  But some items can come in handy.  Try making\
small talk with this student. HE seems to have found something that might\
prove useful to you.  Sometimes one item may be found inside another.  To\
look in to an object that is a container use :  LOOK IN <container>.  To\
get an item from a container, use :  GET <item> FROM <container> as well. \
                          Hint:  say hello. \
", 
         Name = "A Useless Item?", 
      }, 
      [10319] = 
      {
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "city", 
         TeleVnum = 0, 
         Vnum = 10319, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Distance = 0, 
               Direction = "down", 
               Keyword = "", 
               DestinationVnum = 10322, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "Sometimes items can be obtained by manipulating other items. Some classes\
can make items from other ones using skills such as MAKEBLASTER, MAKESPICE,\
or MAKELIGHTSABER. Other times it is as simple as opening a box or pushing\
a button as is the case in this room.\
", 
         Name = "Up in a Small Loft", 
      }, 
      [10320] = 
      {
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "city", 
         TeleVnum = 0, 
         Vnum = 10320, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Distance = 0, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 10322, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "The most common way in most muds to gain equipment is by looting the\
corpses of dead mobiles(monsters etc). After you kill this droid use\
EXAMINE CORPSE to see what it was carrying. Then use GET ALL FROM CORPSE\
to get the goodies from it. To automaticly loot corpses when you kill\
something you can set CONFIG +AUTOLOOT or CONFIG +AUTOCRED for just\
credits.\
", 
         Name = "Looting Your Kills", 
      }, 
      [10321] = 
      {
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Sector = "city", 
         TeleVnum = 0, 
         Vnum = 10321, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Distance = 0, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 10322, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
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
         Name = "Academy Store", 
      }, 
      [10322] = 
      {
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "city", 
         TeleVnum = 0, 
         Vnum = 10322, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Distance = 0, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 10323, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Distance = 0, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 10320, 
               Description = "", 
            }, 
            [3] = 
            {
               Key = -1, 
               Distance = 0, 
               Direction = "south", 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Keyword = "", 
               DestinationVnum = 10327, 
               Description = "", 
            }, 
            [4] = 
            {
               Key = -1, 
               Distance = 0, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 10321, 
               Description = "", 
            }, 
            [5] = 
            {
               Key = -1, 
               Distance = 0, 
               Direction = "up", 
               Keyword = "", 
               DestinationVnum = 10319, 
               Description = "", 
            }, 
            [6] = 
            {
               Key = -1, 
               Distance = 0, 
               Direction = "down", 
               Keyword = "", 
               DestinationVnum = 10318, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
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
         Name = "Getting More Useful Items", 
      }, 
      [10323] = 
      {
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Sector = "city", 
         TeleVnum = 0, 
         Vnum = 10323, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = 10423, 
               Distance = 0, 
               Direction = "north", 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
               }, 
               Keyword = "", 
               DestinationVnum = 10324, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Distance = 0, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 10322, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "Congratulations, you're almost done. The graduation hall is just to the\
north. Only one problem though. The door's locked. Maybe this kid knows\
where the key is. If only he'd stop crying long enough for you to ask.\
hint: find his doll\
hint: give doll child\
hint: say where's the key\
", 
         Name = "The Last Challenge", 
      }, 
      [10324] = 
      {
         Flags = 
         {
            [10] = "Safe", 
         }, 
         Sector = "city", 
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
            }, 
         }, 
         TeleVnum = 0, 
         Vnum = 10324, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Distance = 0, 
               Direction = "south", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
                  [5] = "PickProof", 
               }, 
               Keyword = "", 
               DestinationVnum = 10323, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
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
         Name = "Graduating from the Academy", 
      }, 
      [10325] = 
      {
         ExtraDescriptions = 
         {
         }, 
         Sector = "city", 
         Tunnel = 0, 
         Vnum = 10325, 
         TeleVnum = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Distance = 0, 
               Direction = "somewhere", 
               Flags = 
               {
                  [17] = "CanEnter", 
                  [11] = "Hidden", 
               }, 
               Keyword = "", 
               DestinationVnum = 10326, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
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
         Name = "Academy Docking Bay", 
      }, 
      [10326] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Sector = "city", 
         TeleVnum = 0, 
         Vnum = 10326, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Distance = 0, 
               Direction = "somewhere", 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [11] = "Hidden", 
               }, 
               Keyword = "", 
               DestinationVnum = 10325, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
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
         Name = "The Shuttle home", 
      }, 
      [10327] = 
      {
         Flags = 
         {
            [30] = "Prototype", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Sector = "city", 
         TeleVnum = 0, 
         Vnum = 10327, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Distance = 0, 
               Direction = "north", 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Keyword = "", 
               DestinationVnum = 10322, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Distance = 0, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 10317, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
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
         Name = "Some Important Words of Advice", 
      }, 
      [10399] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Sector = "city", 
         TeleVnum = 0, 
         Vnum = 10399, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Description = "", 
         Name = "This Room is used by a Mob program do not delete.", 
      }, 
      [10400] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [26] = "Factory", 
         }, 
         Sector = "city", 
         TeleVnum = 0, 
         Vnum = 10400, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Description = "", 
         Name = "A test workshop", 
      }, 
      [10401] = 
      {
         Flags = 
         {
            [16] = "Silence", 
            [10] = "Safe", 
            [2] = "NoMob", 
         }, 
         Sector = "city", 
         TeleVnum = 0, 
         Vnum = 10401, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Description = "", 
         Name = "a quiet place", 
      }, 
      [10340] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Sector = "city", 
         TeleVnum = 0, 
         Vnum = 10340, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Description = "", 
         Name = "Floating in a void", 
      }, 
      [10342] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Sector = "city", 
         TeleVnum = 0, 
         Vnum = 10342, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Description = "", 
         Name = "Floating in a void", 
      }, 
      [10430] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [10] = "Safe", 
         }, 
         Sector = "inside", 
         TeleVnum = 0, 
         Vnum = 10430, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Distance = 0, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 10300, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "You stand in the player lounge.  It is the last safe zone in the galaxy.  \
Relax and have a cool drink, as this will be the last time you can let\
your guard down and not be marked for death.\
 \
A student message terminal is here for you to practice reading and writing\
messages.  Use NOTE LIST to get a list of the messages, and NOTE READ\
<message number> to read a specific message.\
Type HELP NOTE for more commands.\
", 
         Name = "Student Lounge", 
      }, 
      [10429] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Sector = "city", 
         TeleVnum = 0, 
         Vnum = 10429, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Exits = 
         {
         }, 
         TeleDelay = 0, 
         Description = "", 
         Name = "Floating in a void", 
      }, 
      [10300] = 
      {
         Flags = 
         {
            [23] = "Hotel", 
            [10] = "Safe", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "act_prog", 
               Arguments = "entered", 
               Code = "mpat 122 mpecho $n has just begun life!\
mpat 101 mpecho $n has just entered the game.\
", 
            }, 
            [2] = 
            {
               MudProgType = "act_prog", 
               Arguments = "throat", 
               Code = "mpat 122 mpecho $n just slit his own throat at the creations room!\
mpat 101 mpecho $n just sucicided at the creations room.\
", 
            }, 
         }, 
         TeleVnum = 0, 
         Vnum = 10300, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Distance = 0, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 10301, 
               Description = "", 
            }, 
            [2] = 
            {
               Key = -1, 
               Distance = 0, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 10430, 
               Description = "", 
            }, 
         }, 
         TeleDelay = 0, 
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
         Name = "Coruscant Academy", 
      }, 
      [10301] = 
      {
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
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
            }, 
         }, 
         TeleVnum = 0, 
         Vnum = 10301, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Distance = 0, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 10304, 
               Description = "Reading Room\
", 
            }, 
            [2] = 
            {
               Key = -1, 
               Distance = 0, 
               Direction = "east", 
               Keyword = "", 
               DestinationVnum = 10303, 
               Description = "The Laboratory of Skills.\
", 
            }, 
            [3] = 
            {
               Key = -1, 
               Distance = 0, 
               Direction = "south", 
               Keyword = "", 
               DestinationVnum = 10300, 
               Description = "Entrance to Darkhaven Academy\
", 
            }, 
            [4] = 
            {
               Key = -1, 
               Distance = 0, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 10306, 
               Description = "Abbigayle's Language Lessons.\
", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "To the west is Lady Abbigayle's room, and to the east is Domick.  Lady\
Abbigayle has information about languages, and Domick has information on\
practicing weapons and skills. When you are finished exploring these\
areas, come back here and continue north through the Academy.\
", 
         Name = "A Duraplast Corridor", 
      }, 
      [10302] = 
      {
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         TeleVnum = 0, 
         Vnum = 10302, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Distance = 0, 
               Direction = "north", 
               Keyword = "", 
               DestinationVnum = 10304, 
               Description = "The Reading Room\
", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "You did it! You are an excellent student! To continue your education,\
please leave north. That will return you to the Reading room.\
", 
         Name = "Somewhere", 
      }, 
      [10303] = 
      {
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         TeleVnum = 0, 
         Vnum = 10303, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Exits = 
         {
            [1] = 
            {
               Key = -1, 
               Distance = 0, 
               Direction = "west", 
               Keyword = "", 
               DestinationVnum = 10301, 
               Description = "A Stone Corridor\
", 
            }, 
         }, 
         TeleDelay = 0, 
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
         Name = "The Laboratory of Skills", 
      }, 
   }, 
   Author = "Scarab/Durga", 
   Name = "Coruscant Academy", 
}
