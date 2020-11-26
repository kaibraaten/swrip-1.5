-- Core minimal content
-- Last saved Thursday 26-Nov-2020 15:24:24

AreaEntry
{
   LowEconomy = 41835975, 
   Author = "RoD/Durga", 
   Name = "Core minimal content", 
   Resets = 
   {
      [1] = 
      {
         Command = "M", 
         Arg1 = 1, 
         Arg2 = 1, 
         Arg3 = 2, 
         MiscData = 0, 
      }, 
      [2] = 
      {
         Command = "O", 
         Arg1 = 90, 
         Arg2 = 1, 
         Arg3 = 10, 
         MiscData = 1, 
      }, 
      [3] = 
      {
         Command = "M", 
         Arg1 = 6, 
         Arg2 = 1, 
         Arg3 = 6, 
         MiscData = 1, 
      }, 
      [4] = 
      {
         Command = "M", 
         Arg1 = 2, 
         Arg2 = 1, 
         Arg3 = 6, 
         MiscData = 1, 
      }, 
      [5] = 
      {
         Command = "M", 
         Arg1 = 7, 
         Arg2 = 1, 
         Arg3 = 6, 
         MiscData = 1, 
      }, 
      [6] = 
      {
         Command = "O", 
         Arg1 = 7, 
         Arg2 = 1, 
         Arg3 = 6, 
         MiscData = 1, 
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
      Mob = 
      {
         First = 1, 
         Last = 99, 
      }, 
      Object = 
      {
         First = 1, 
         Last = 99, 
      }, 
      Room = 
      {
         First = 1, 
         Last = 99, 
      }, 
   }, 
   HighEconomy = 0, 
   Objects = 
   {
      [2] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Description = "One miserable credit.", 
         Name = "credit credits", 
         Vnum = 2, 
         Weight = 1, 
         ItemType = "money", 
         Cost = 0, 
         ShortDescr = "a credit", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 1, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
      }, 
      [3] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Description = "Some credits.", 
         Name = "credits credit", 
         Vnum = 3, 
         Weight = 1, 
         ItemType = "money", 
         Cost = 0, 
         ShortDescr = "%d credits", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
      }, 
      [4] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Description = "A deed for a shop", 
         Name = "deed", 
         Vnum = 4, 
         Weight = 1, 
         ItemType = "paper", 
         Cost = 0, 
         ShortDescr = "A deed", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
      }, 
      [5] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Description = "A thick heavy metallic amulet with arcane writing is here.", 
         Name = "an amulet", 
         Vnum = 5, 
         Affects = 
         {
            [1] = 
            {
               Modifier = 4, 
               Location = 48, 
            }, 
            [2] = 
            {
               Modifier = 3, 
               Location = 2, 
            }, 
            [3] = 
            {
               Modifier = 11, 
               Location = 48, 
            }, 
         }, 
         Weight = 1, 
         ItemType = "armor", 
         Cost = 100000, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "a metal amulet", 
         Flags = 
         {
            [8] = "Bless", 
            [5] = "Invis", 
            [6] = "Magic", 
            [21] = "ClanObject", 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
      }, 
      [6] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Description = "A small shimmering charm hangs from a necklace is here.", 
         Name = "charm", 
         Vnum = 6, 
         Affects = 
         {
            [1] = 
            {
               Modifier = 2097152, 
               Location = 27, 
            }, 
         }, 
         Weight = 1, 
         ItemType = "armor", 
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         ShortDescr = "A small charm", 
         Flags = 
         {
            [10] = "AntiEvil", 
            [7] = "NoDrop", 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [2] = "Neck", 
            [14] = "Hold", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
      }, 
      [7] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Description = "Tipper Gore lays here in a heap, attacked by vicous republicans", 
         Name = "Tipper Gore", 
         Vnum = 7, 
         Weight = 1, 
         ItemType = "fountain", 
         Cost = 0, 
         ShortDescr = "Tipper Gore!", 
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
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
      }, 
      [9] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Description = "The shattered remains of %s are here.", 
         Name = "corpse remains pieces parts", 
         Vnum = 9, 
         Weight = 1, 
         ItemType = "droid_corpse", 
         Cost = 0, 
         ShortDescr = "the broken parts of %s", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
      }, 
      [10] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Description = "The corpse of %s lies here.", 
         Name = "corpse", 
         Vnum = 10, 
         Weight = 100, 
         ItemType = "corpse", 
         Cost = 0, 
         ShortDescr = "the corpse of %s", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
      }, 
      [11] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Description = "The corpse of %s is lying here.", 
         Name = "corpse", 
         Vnum = 11, 
         Weight = 100, 
         ItemType = "corpse_pc", 
         Cost = 0, 
         ShortDescr = "the corpse of %s", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
      }, 
      [12] = 
      {
         ActionDescription = "%s gobble$q down $p with gusto... disgusting!", 
         Layers = 0, 
         Description = "The severed head of %s is lying here.", 
         Name = "head", 
         Vnum = 12, 
         Weight = 5, 
         ItemType = "food", 
         Cost = 0, 
         ShortDescr = "the head of %s", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
      }, 
      [13] = 
      {
         ActionDescription = "%s savagely devour$q $p!", 
         Layers = 0, 
         Description = "The torn-out heart of %s is lying here.", 
         Name = "heart", 
         Vnum = 13, 
         Weight = 2, 
         ItemType = "food", 
         Cost = 0, 
         ShortDescr = "the heart of %s", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 16, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
      }, 
      [14] = 
      {
         ActionDescription = "%s chomp$q on $p.", 
         Layers = 0, 
         Description = "The sliced-off arm of %s is lying here.", 
         Name = "arm", 
         Vnum = 14, 
         Weight = 5, 
         ItemType = "food", 
         Cost = 0, 
         ShortDescr = "the arm of %s", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 20, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
      }, 
      [15] = 
      {
         ActionDescription = "%s chomp$q on $p.", 
         Layers = 0, 
         Description = "The sliced-off leg of %s is lying here.", 
         Name = "leg", 
         Vnum = 15, 
         Weight = 5, 
         ItemType = "food", 
         Cost = 0, 
         ShortDescr = "the leg of %s", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 20, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
      }, 
      [16] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Description = "The spilled guts of %s makes you lose your appetite.", 
         Name = "guts", 
         Vnum = 16, 
         Weight = 1, 
         ItemType = "trash", 
         ShortDescr = "the spilled guts of %s", 
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
      }, 
      [17] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Description = "A pool of spilled blood lies here.", 
         Name = "blood", 
         Vnum = 17, 
         Weight = 1, 
         ItemType = "_blood", 
         ShortDescr = "the spilled blood", 
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
      }, 
      [18] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Description = "Blood stains the ground.", 
         Name = "bloodstain", 
         Vnum = 18, 
         Weight = 1, 
         ItemType = "_bloodstain", 
         ShortDescr = "the bloodstain", 
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
      }, 
      [19] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Description = "The scraps of %s lie here.", 
         Name = "scraps", 
         Vnum = 19, 
         Weight = 1, 
         ItemType = "scraps", 
         Cost = 0, 
         ShortDescr = "the scraps of %s", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
      }, 
      [20] = 
      {
         ActionDescription = "%s enjoy$q $p.", 
         Layers = 0, 
         Description = "A fruit roll-up lies here", 
         Name = "fruit roll-up", 
         Vnum = 20, 
         Weight = 1, 
         ItemType = "food", 
         Cost = 10, 
         ShortDescr = "a fruit roll-up", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
      }, 
      [21] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Description = "A bright ball of light shimmers in the air.", 
         Name = "ball light", 
         Vnum = 21, 
         Weight = 1, 
         ItemType = "light", 
         Cost = 0, 
         ShortDescr = "a bright ball of light", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 50, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
      }, 
      [22] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Description = "A magical spring flows here.", 
         Name = "spring", 
         Vnum = 22, 
         Weight = 10, 
         ItemType = "fountain", 
         Cost = 10, 
         ShortDescr = "a magical spring", 
         Flags = 
         {
            [6] = "Magic", 
         }, 
         ObjectValues = 
         {
            [1] = 100000, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 100000, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
      }, 
      [23] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Description = "The skin of %s", 
         Name = "the skin of %s", 
         Vnum = 23, 
         Weight = 1, 
         Affects = 
         {
            [1] = 
            {
               Modifier = 2, 
               Location = 25, 
            }, 
         }, 
         ItemType = "fabric", 
         Cost = 0, 
         ShortDescr = "the skin of %s", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [10] = "About", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
      }, 
      [24] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Description = "A slice of raw meat from %s lies lies on the ground.", 
         Name = "meat fresh slice", 
         Vnum = 24, 
         Weight = 2, 
         ItemType = "food", 
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 15, 
         }, 
         ShortDescr = "a slice of raw meat from %s", 
         Flags = 
         {
            [18] = "SmallSize", 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
      }, 
      [25] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Description = "A shopping bag lies discarded on the ground nearby.", 
         Name = "shopping bag", 
         Vnum = 25, 
         Weight = 2, 
         ItemType = "container", 
         Cost = 20, 
         ShortDescr = "a bag", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 50, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
      }, 
      [26] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Description = "What looks like a part of a ship lies here.", 
         Name = "fighter module", 
         Vnum = 26, 
         Weight = 100, 
         ItemType = "fightercomp", 
         Cost = 0, 
         ShortDescr = "A ship part for %s", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
      }, 
      [27] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Description = "What looks like a decent size part for a ship lies here.", 
         Name = "midsize midship module", 
         Vnum = 27, 
         Weight = 150, 
         ItemType = "midcomp", 
         Cost = 0, 
         ShortDescr = "A midsize ship part for %s", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
      }, 
      [28] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Description = "What looks like a huge ship part lies here.", 
         Name = "capship capital module", 
         Vnum = 28, 
         Weight = 350, 
         ItemType = "capitalcomp", 
         Cost = 0, 
         ShortDescr = "A capital-class ship part for %s", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
      }, 
      [30] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Description = "A magical fire burns brightly.", 
         Name = "fire", 
         Vnum = 30, 
         Weight = 10, 
         ItemType = "fire", 
         Cost = 10, 
         ShortDescr = "a magical fire", 
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
            [0] = 0, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
      }, 
      [31] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Description = "You detect a trap.", 
         Name = "trap", 
         Vnum = 31, 
         Weight = 100, 
         ItemType = "trap", 
         ShortDescr = "a trap", 
         Cost = 10, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
      }, 
      [32] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Description = "A misty portal beckons you to the unknown.", 
         Name = "portal", 
         Vnum = 32, 
         Weight = 100, 
         ItemType = "_portal", 
         Cost = 10, 
         ShortDescr = "a portal", 
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
            [0] = 0, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
      }, 
      [33] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Description = "A small amount of black poisoning powder sits in a small container on the ground.", 
         Name = "black poison powder", 
         Vnum = 33, 
         Weight = 1, 
         ItemType = "trash", 
         Cost = 48000, 
         ShortDescr = "black poisoning powder", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
      }, 
      [34] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Description = "A blank scroll lays here gathering dust.", 
         Name = "scroll scribing blank", 
         Vnum = 34, 
         Weight = 2, 
         ItemType = "scroll", 
         Cost = 10000, 
         ShortDescr = "a blank scroll", 
         ObjectValues = 
         {
            [1] = -1, 
            [2] = -1, 
            [3] = -1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
      }, 
      [35] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Description = "An empty flask lays here gathering dust.", 
         Name = "flask empty", 
         Vnum = 35, 
         Weight = 1, 
         ItemType = "potion", 
         Cost = 15000, 
         ShortDescr = "an empty flask", 
         ObjectValues = 
         {
            [1] = -1, 
            [2] = -1, 
            [3] = -1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 1, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
      }, 
      [36] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Description = "A message disk has been discarded here.", 
         Name = "parchment paper note data disk message info", 
         Vnum = 36, 
         Weight = 1, 
         ItemType = "paper", 
         Cost = 1500, 
         ShortDescr = "a message disk", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
      }, 
      [37] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Description = "A datapad used for recording message disks is here.", 
         Name = "quill pen datapad recorder message disk", 
         Vnum = 37, 
         Weight = 2, 
         ItemType = "pen", 
         Cost = 2000, 
         ShortDescr = "a datapad", 
         ObjectValues = 
         {
            [1] = 15, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 15, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
      }, 
      [38] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Description = "A standard galactic-net mail terminal has been installed here.", 
         Name = "mail terminal", 
         Vnum = 38, 
         Weight = 1, 
         ItemType = "furniture", 
         ShortDescr = "a mail terminal", 
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tag = "mail_terminal", 
      }, 
      [43] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Description = "A holy symbol lies here, shining.", 
         Name = "holy symbol faith", 
         Vnum = 43, 
         Weight = 5, 
         Affects = 
         {
            [1] = 
            {
               Modifier = 2, 
               Location = 4, 
            }, 
         }, 
         ItemType = "armor", 
         Cost = 0, 
         ShortDescr = "a symbol of faith", 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
      }, 
      [45] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Description = "A grenade .... run!!!!", 
         Name = "grenade", 
         Vnum = 45, 
         Weight = 1, 
         ItemType = "grenade", 
         Cost = 1200, 
         ShortDescr = "a grenade", 
         ObjectValues = 
         {
            [1] = 200, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 100, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "grenade", 
               Description = "A Teklos low yield grenade.  Perfect for blowing your neighbor into tiny\
\13bits with. \
\13", 
            }, 
         }, 
         Tag = "", 
      }, 
      [46] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Description = "Don't step on the landmine.", 
         Name = "landmine mine", 
         Vnum = 46, 
         Weight = 1, 
         ItemType = "landmine", 
         Cost = 1000, 
         ShortDescr = "a landmine", 
         ObjectValues = 
         {
            [1] = 200, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 100, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "landmine mine", 
               Description = "A Blastech plasma mine.  Developed after the Imperial defeat at Yavin, this\
\13mine was used to saturate possible rebel bases.\
\13", 
            }, 
         }, 
         Tag = "", 
      }, 
      [50] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Description = "A Blastech E-11 blaster rifle was left here.", 
         Name = "blaster Blastech E11 rifle E-11", 
         Vnum = 50, 
         Weight = 10, 
         Affects = 
         {
            [1] = 
            {
               Modifier = 2, 
               Location = 18, 
            }, 
         }, 
         ItemType = "weapon", 
         Cost = 3250, 
         ShortDescr = "a Blastech E-11 blaster rifle", 
         ObjectValues = 
         {
            [1] = 8, 
            [2] = 4, 
            [3] = 6, 
            [4] = 2000, 
            [5] = 2000, 
            [0] = 0, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "blaster Blastech E11 rifle E-11", 
               Description = "The most common weapon in use by either the Rebel Alliance, New Order, or\
\13planetary militias. This highpowered weapon was so mass produced when\
\13first seeing service with the New Order's stormtrooper corps, that between\
\13stolen shipments and weapons scavenged from battlefields, the Alliance had\
\13almost as many of these rifles as the Empire. Later, the weapon was\
\13'cloned' by SoroSuub as the Stormtrooper One, or SoroSuub One rifle.\
\13", 
            }, 
         }, 
         Tag = "", 
      }, 
      [51] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Description = "A Blastech DL-18 lies here on the floor.", 
         Name = "blaster blastech dl-18 blaster pistol", 
         Vnum = 51, 
         Weight = 6, 
         Affects = 
         {
            [1] = 
            {
               Modifier = 1, 
               Location = 18, 
            }, 
         }, 
         ItemType = "weapon", 
         Cost = 3000, 
         ShortDescr = "a blastech DL-18 blaster pistol", 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 6, 
            [3] = 6, 
            [4] = 2000, 
            [5] = 2000, 
            [0] = 0, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "blaster blastech dl-18 blaster pistol", 
               Description = "The DL-18 is a sleek, hand-held blaster built by Blas-Tech, often referred\
\13to as the \"Mos Eisley special\". \
\13", 
            }, 
         }, 
         Tag = "", 
      }, 
      [52] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Description = "A heavy blaster pistol was dropped here.", 
         Name = "blaster blastech dl-44 heavy blaster pistol", 
         Vnum = 52, 
         Weight = 8, 
         Affects = 
         {
            [1] = 
            {
               Modifier = 1, 
               Location = 19, 
            }, 
         }, 
         ItemType = "weapon", 
         Cost = 3600, 
         ShortDescr = "a Blastech DL-44 heavy blaster pistol", 
         ObjectValues = 
         {
            [1] = 6, 
            [2] = 6, 
            [3] = 6, 
            [4] = 2000, 
            [5] = 2000, 
            [0] = 0, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "blaster blastech dl-44 heavy blaster pistol", 
               Description = "The DL-44 is a high powered hand blaster, often banned from civilian use in\
\13certain planetary systems.  Han Solo himself uses a modified version of\
\13the DL-44.\
\13", 
            }, 
         }, 
         Tag = "", 
      }, 
      [53] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Description = "An assault rifle was left here.", 
         Name = "blaster blastech dlt-19 assault rifle", 
         Vnum = 53, 
         Weight = 12, 
         Affects = 
         {
            [1] = 
            {
               Modifier = 2, 
               Location = 18, 
            }, 
         }, 
         ItemType = "weapon", 
         Cost = 3750, 
         ShortDescr = "a Blastech DLT-19 assault rifle", 
         ObjectValues = 
         {
            [1] = 9, 
            [2] = 4, 
            [3] = 6, 
            [4] = 2000, 
            [5] = 2000, 
            [0] = 0, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "blaster blastech dlt-19 assault rifle", 
               Description = "The DLT-19 is a long, sleek blaster rifle was manufactured by BlasTech.\
\13Although it mainly sees use only in the stormtrooper corps, it saw heavy\
\13combat on the side of the Alliance during the Battle of Hoth.\
\13", 
            }, 
         }, 
         Tag = "", 
      }, 
      [54] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Description = "A repeating blaster is collecting dust.", 
         Name = "blastech t-21 repeating blaster", 
         Vnum = 54, 
         Weight = 10, 
         Affects = 
         {
            [1] = 
            {
               Modifier = 3, 
               Location = 18, 
            }, 
         }, 
         ItemType = "weapon", 
         Cost = 3900, 
         ShortDescr = "a Blastech T-21 repeating blaster", 
         ObjectValues = 
         {
            [1] = 10, 
            [2] = 4, 
            [3] = 6, 
            [4] = 2000, 
            [5] = 2000, 
            [0] = 0, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "blastech t-21 repeating blaster", 
               Description = "", 
            }, 
            [2] = 
            {
               Keyword = "blastech t-21 repeating blaster", 
               Description = "A long barreled blaster\
\13", 
            }, 
            [3] = 
            {
               Keyword = "blastech t-21 repeating blaster", 
               Description = "A long, thick barreled weapon.  The T-21 is commonly seen in use with\
\13stormtrooper corps and Bounty Hunters. \
\13", 
            }, 
            [4] = 
            {
               Keyword = "blastech t-21 repeating blaster", 
               Description = "A long, thick barreled weapon, the Blastec T-21 is a high powered rifle\
\13often seen in use by private militias and the stormtrooper corps.\
\13", 
            }, 
            [5] = 
            {
               Keyword = "blastech t-21 repeating blaster", 
               Description = "A long, thick barreled weapon, the Blastec T-21 is a high powered rifle\
\13often seen in use by private militias and the stormtrooper corps.\
\13", 
            }, 
            [6] = 
            {
               Keyword = "blastech t-21 repeating blaster", 
               Description = "A long, thick barreled weapon, often seen in use by stormtroopers.\
\13/\
\13", 
            }, 
            [7] = 
            {
               Keyword = "blastech t-21 repeating blaster", 
               Description = "A long, thick barreled weapon, often used by\
\13stormtroopers.\
\13", 
            }, 
            [8] = 
            {
               Keyword = "blastech t-21 repeating blaster", 
               Description = "A long, thick barreled blaster.\
\13", 
            }, 
         }, 
         Tag = "", 
      }, 
      [55] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Description = "A Bryar heavy blaster pistol could come in handy.", 
         Name = "bryar pistol blaster", 
         Vnum = 55, 
         Weight = 8, 
         ItemType = "weapon", 
         Cost = 3700, 
         ShortDescr = "a Bryar heavy blaster pistol", 
         ObjectValues = 
         {
            [1] = 6, 
            [2] = 6, 
            [3] = 6, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "bryar pistol blaster", 
               Description = "The Bryar heavy blaster pistol. Although considered antique in comparisson\
\13with the new and more powerful BlasTech models, this old blaster still\
\13packs a punch.\
\13", 
            }, 
         }, 
         Tag = "", 
      }, 
      [56] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Description = "A cheap holdout blaster is here.", 
         Name = "blaster Budgetline 3.0/12 holdout", 
         Vnum = 56, 
         Weight = 4, 
         Affects = 
         {
            [1] = 
            {
               Modifier = -3, 
               Location = 18, 
            }, 
         }, 
         ItemType = "weapon", 
         Cost = 900, 
         ShortDescr = "a Budgetline 3.0/12", 
         ObjectValues = 
         {
            [1] = 7, 
            [2] = 4, 
            [3] = 6, 
            [4] = 300, 
            [5] = 300, 
            [0] = 0, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "blaster Budgetline 3.0/12 holdout", 
               Description = "A small, easily concealable blaster, the budgetline is used by undercover\
\13agents galaxy wide. It's lack of accuracy is made up for by it's stealth.\
\13", 
            }, 
         }, 
         Tag = "", 
      }, 
      [57] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Description = "A Sorosuub holdout blaster was dropped here.", 
         Name = "sorosuub q2 holdout blaster", 
         Vnum = 57, 
         Weight = 4, 
         ItemType = "weapon", 
         Cost = 2800, 
         ObjectValues = 
         {
            [1] = 7, 
            [2] = 4, 
            [3] = 6, 
            [4] = 1000, 
            [5] = 1000, 
            [0] = 0, 
         }, 
         ShortDescr = "a Sorosuub Q2 holdout blaster", 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
      }, 
      [58] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Description = "A very small blaster was dropped here.", 
         Name = "blastech last resort mini-blaster blaster", 
         Vnum = 58, 
         Weight = 3, 
         ItemType = "weapon", 
         Cost = 2000, 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 4, 
            [3] = 6, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "a Blastech Last Resort mini-blaster", 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
      }, 
      [59] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Description = "A sharp looking blade is here.", 
         Name = "long vibro-blade", 
         Vnum = 59, 
         Affects = 
         {
            [1] = 
            {
               Modifier = -1, 
               Location = 18, 
            }, 
         }, 
         Weight = 4, 
         ItemType = "weapon", 
         Cost = 350, 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 6, 
            [3] = 2, 
            [4] = 100, 
            [5] = 110, 
            [0] = 12, 
         }, 
         ShortDescr = "a long sharp vibro-blade", 
         Flags = 
         {
            [13] = "Inventory", 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
      }, 
      [60] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Description = "A blaster rifle was dropped here.", 
         Name = "Sorosuub One Blaster Rifle", 
         Vnum = 60, 
         Weight = 10, 
         Affects = 
         {
            [1] = 
            {
               Modifier = 1, 
               Location = 18, 
            }, 
         }, 
         ItemType = "weapon", 
         Cost = 3000, 
         ShortDescr = "a Sorosuub One blaster rifle", 
         ObjectValues = 
         {
            [1] = 8, 
            [2] = 4, 
            [3] = 6, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
      }, 
      [99] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Description = "Some god dropped a newly created final object here.", 
         Name = "final object", 
         Vnum = 99, 
         Weight = 1, 
         ItemType = "trash", 
         ShortDescr = "a newly created final object", 
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
      }, 
      [90] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Description = "The suggestions board is here.", 
         Name = "Suggestions Board", 
         Vnum = 90, 
         Weight = 1, 
         ItemType = "furniture", 
         ShortDescr = "the suggestions board", 
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
      }, 
      [70] = 
      {
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "wear_prog", 
               Arguments = "100", 
               ScriptType = "MProg", 
               Code = "mpechoat $n &R&WBoth ends of your lightsaber ignite with a hiss and glow.\
mpechoat $n Two &rcrimson&R&W blades leap into life!\
mpechoaround $n $n's lightsaber ignites with a &rred&R&W glow. \
mpechoaround $n There is a &R&whiss&R&W as its other end extends as well!\
mpechoaround $n &GA sick feeling develops in your stomach.&R&W \
", 
            }, 
            [2] = 
            {
               MudProgType = "remove_prog", 
               Arguments = "100", 
               ScriptType = "MProg", 
               Code = "mpechoat $n &R&WYour lightsaber contracts with a soft &R&whiss&R&W. \
mpechoaround $n &R&W$n's lightsaber contracts with a soft &R&whiss&R&W. \
", 
            }, 
         }, 
         ActionDescription = "", 
         Layers = 0, 
         Description = "The hilt of a lightsaber lies on the ground.", 
         Name = "quest weapon double bladed lightsaber saber", 
         Vnum = 70, 
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
         Weight = 8, 
         ItemType = "weapon", 
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 53, 
            [2] = 3, 
            [3] = 1, 
            [4] = 5000, 
            [5] = 5000, 
            [0] = 1000, 
         }, 
         ShortDescr = "&R&Wa &rd&Rou&R&Wbl&R&we-b&R&Wl&Rade&rd&R&W lightsaber", 
         Flags = 
         {
            [0] = "Glow", 
            [8] = "Bless", 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
      }, 
      [71] = 
      {
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "wear_prog", 
               Arguments = "100", 
               ScriptType = "MProg", 
               Code = "mpechoat $n &YWithin the battle helmet, your vision is sharpened. \
", 
            }, 
            [2] = 
            {
               MudProgType = "remove_prog", 
               Arguments = "100", 
               ScriptType = "MProg", 
               Code = "mpechoat $n &YYour vision returns to normal.\
", 
            }, 
         }, 
         ActionDescription = "", 
         Layers = 0, 
         Description = "An evil looking battle helmet.", 
         Name = "quest armor mandalorian battle helmet", 
         Vnum = 71, 
         Affects = 
         {
            [1] = 
            {
               Modifier = 16777216, 
               Location = 26, 
            }, 
            [2] = 
            {
               Modifier = 8, 
               Location = 18, 
            }, 
         }, 
         Weight = 10, 
         ItemType = "armor", 
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 25, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 25, 
         }, 
         ShortDescr = "&R&Wa &gMa&Gnd&zalo&Gri&gan&R&W Ba&R&wtt&R&Wle Helmet", 
         Flags = 
         {
            [6] = "Magic", 
            [8] = "Bless", 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [4] = "Head", 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "quest armor mandalorian battle helmet", 
               Description = "A Mandalorian helmet.  Worn by the most fierce warriors in the galaxy.\
\13", 
            }, 
         }, 
         Tag = "", 
      }, 
      [72] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Description = "A dud is here.", 
         Name = "quest item", 
         Vnum = 72, 
         Weight = 1, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "use_prog", 
               Arguments = "100", 
               ScriptType = "MProg", 
               Code = "mpoload 10313\
put ration item\
", 
            }, 
         }, 
         ItemType = "container", 
         Cost = 0, 
         ShortDescr = "Mystery Box 1", 
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
            [0] = 2, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
      }, 
      [73] = 
      {
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "wear_prog", 
               Arguments = "100", 
               ScriptType = "MProg", 
               Code = "mpechoat $n &CYou feel protected within the energy shield.\
mpechoaround $n &CA bluish-green energy shield envelops $n.\
", 
            }, 
            [2] = 
            {
               MudProgType = "remove_prog", 
               Arguments = "100", 
               ScriptType = "MProg", 
               Code = "mpechoat $n &CYou turn off your energy shield. \
mpechoaround $n &CThe bluish glow around $n seems to dissolve. \
", 
            }, 
         }, 
         ActionDescription = "", 
         Layers = 0, 
         Description = "A small energy device lies on the floor.", 
         Name = "quest shield generator", 
         Vnum = 73, 
         Affects = 
         {
            [1] = 
            {
               Modifier = 67108864, 
               Location = 26, 
            }, 
            [2] = 
            {
               Modifier = 8192, 
               Location = 28, 
            }, 
         }, 
         Weight = 3, 
         ItemType = "armor", 
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 30, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 30, 
         }, 
         ShortDescr = "&R&Wa p&R&wer&R&Wson&R&wal&R&W &cs&Ch&R&Wie&Cl&cd&R&W generator", 
         Flags = 
         {
            [6] = "Magic", 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
            [9] = "Shield", 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "quest shield", 
               Description = "A glowing energy shield that seems to pulse with power.  It looks strong\
\13enough to repel some blaster fire.\
\13", 
            }, 
         }, 
         Tag = "", 
      }, 
      [74] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Description = "A dud is here.", 
         Name = "quest item dinner", 
         Vnum = 74, 
         Weight = 1, 
         ItemType = "trash", 
         Cost = 0, 
         ShortDescr = "&R&WDinner with &zMa&R&wn&R&Wda&R&wl&zor&R&W", 
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
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
      }, 
      [75] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Description = "&R&WA &csp&Ca&R&Wrkl&Ci&cng&R&W gem lies at your feet.", 
         Name = "quest token sapphire", 
         Vnum = 75, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "get_prog", 
               Arguments = "100", 
               ScriptType = "MProg", 
               Code = "if questobj($n) == 75\
mpechoat $n &YYou have found the sapphire!  Return to your employer!\
else\
mpechoat $n &YYou weren't sent for this!\
mpforce $n drop sapphire\
endif\
", 
            }, 
         }, 
         Weight = 2, 
         ItemType = "treasure", 
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "&R&Wa &csp&Ca&R&Wrkl&Ci&cng &bsa&Bp&R&Wph&Bir&be&R&W", 
         Flags = 
         {
            [0] = "Glow", 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
      }, 
      [76] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Description = "&R&WA gl&R&wit&R&Wte&R&wri&R&Wng gem lies at your feet.", 
         Name = "quest token diamond", 
         Vnum = 76, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "get_prog", 
               Arguments = "100", 
               ScriptType = "MProg", 
               Code = "if questobj($n) == 76\
mpechoat $n &YYou have found the diamond!  Return to your employer! \
else\
mpechoat $n &YYou weren't sent for this!\
mpforce $n drop diamond\
endif\
", 
            }, 
         }, 
         Weight = 1, 
         ItemType = "treasure", 
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "&R&Wa gl&R&wit&R&Wte&R&wri&R&Wng d&R&wia&R&Wm&R&wo&R&Wnd", 
         Flags = 
         {
            [0] = "Glow", 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
      }, 
      [77] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Description = "&R&WA &Gsh&gin&Gy&R&W gem lies at your feet.", 
         Name = "quest token emerald", 
         Vnum = 77, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "get_prog", 
               Arguments = "100", 
               ScriptType = "MProg", 
               Code = "if questobj($n) == 77\
mpechoat $n &YYou have found the emerald!  Return to your employer! \
else\
mpechoat $n &YYou weren't sent for this!\
mpforce $n drop emerald\
endif\
", 
            }, 
         }, 
         Weight = 1, 
         ItemType = "treasure", 
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "&R&Wa sh&R&win&R&Wy &R&We&Gm&gera&Gl&R&Wd", 
         Flags = 
         {
            [0] = "Glow", 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
      }, 
      [78] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Description = "&R&WA &psp&Pa&R&Wrkl&Pi&png&R&W gem lies at your feet.", 
         Name = "quest token amythest", 
         Vnum = 78, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "get_prog", 
               Arguments = "100", 
               ScriptType = "MProg", 
               Code = "if questobj($n) == 78\
mpechoat $n &YYou have found the amythest!  Return to your employer! \
else\
mpechoat $n &YYou weren't sent for this!\
mpfroce $n drop amythest\
endif\
", 
            }, 
         }, 
         Weight = 1, 
         ItemType = "treasure", 
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "&R&Wa sp&R&war&R&Wkl&R&win&R&Wg &pam&Py&R&Wth&Pe&pst&R&W", 
         Flags = 
         {
            [0] = "Glow", 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
      }, 
      [79] = 
      {
         ActionDescription = "", 
         Layers = 0, 
         Description = "&R&WA &rb&Rl&Yazi&Rn&rg&R&W gem lies at your feet.", 
         Name = "quest token ruby", 
         Vnum = 79, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "get_prog", 
               Arguments = "100", 
               ScriptType = "MProg", 
               Code = "if questobj($n) == 79\
mpecohat $n &YYou have found the ruby!  Return to your employer! \
else\
mpechoat $n &YYou weren't sent for this! \
mpforce $n drop ruby\
endif\
", 
            }, 
         }, 
         Weight = 1, 
         ItemType = "treasure", 
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "&R&Wa &rb&Rl&Yazi&Rn&rg r&Ru&rby&R&W", 
         Flags = 
         {
            [0] = "Glow", 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tag = "", 
      }, 
   }, 
   Mobiles = 
   {
      [1] = 
      {
         DamRoll = 0, 
         Immune = 
         {
            [10] = "sleep", 
            [11] = "charm", 
            [20] = "magic", 
            [13] = "nonmagic", 
            [21] = "paralysis", 
         }, 
         Tag = "", 
         Stats = 
         {
            Constitution = 10, 
            Dexterity = 10, 
            Luck = 10, 
            Wisdom = 10, 
            Force = 0, 
            Charisma = 10, 
            Intelligence = 10, 
            Strength = 10, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "test", 
               ScriptType = "MProg", 
               Code = "say triggered by (name):\9$n\
say triggered by (name&title): \9$N\
say triggerer is (he,she,it):\9$e\
say triggerer is (him,her,it):\9$m\
say triggerer is (his,hers,its):$s\
say random char (name):\9\9$r\
say random char (name&title or short): \9$R\
say random char  (he,she,it):\9$J\
say random char (him,her,it):\9$L\
say random char (his,hers,its):\9$K\
", 
            }, 
            [2] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "test2", 
               ScriptType = "MProg", 
               Code = "say firstname of obj:\9 \9$i\
say short_desc/title of obj: \9$I\
say he/she/it of obj:\9 \9$j\
say him/her/it of obj:\9 \9$k\
say his/hers/its of obj:\9$l\
say firstname of victim: \9$t\
say short_desc/title of victim:\9$T\
say he/she/it of victim: \9$E\
say him/her/it of victim: \9$M\
say his/hers/its of victim:\9$S\
", 
            }, 
         }, 
         Weight = 0, 
         Languages = 
         {
            Speaks = 
            {
               [1] = "shyriiwook", 
               [0] = "basic", 
               [18] = "_clan", 
               [20] = "verpine", 
               [5] = "mon calamarian", 
               [6] = "shistavanen", 
               [8] = "ithorese", 
               [12] = "firrerreo", 
               [13] = "bothese", 
               [21] = "defel", 
            }, 
            Speaking = 
            {
               [1] = "shyriiwook", 
               [0] = "basic", 
               [18] = "_clan", 
               [20] = "verpine", 
               [5] = "mon calamarian", 
               [6] = "shistavanen", 
               [8] = "ithorese", 
               [12] = "firrerreo", 
               [13] = "bothese", 
               [21] = "defel", 
            }, 
         }, 
         Position = "standing", 
         Level = 50, 
         ShortDescr = "Puff", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            ParaPetri = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamPlus = 200, 
            DamNoDice = 4, 
         }, 
         AffectedBy = 
         {
            [9] = "Infrared", 
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         LongDescr = "Puff the Fractal Dragon is here, contemplating a higher reality.\
", 
         Credits = 10000, 
         HitRoll = 0, 
         Name = "Puff", 
         Vnum = 1, 
         Height = 0, 
         NumberOfAttacks = 0, 
         Race = "Gand", 
         ArmorClass = -30, 
         Sex = "female", 
         Description = "", 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitNoDice = 5, 
            HitSizeDice = 10, 
            HitPlus = 30550, 
         }, 
         AttackFlags = 
         {
            [1] = "claws", 
         }, 
         Alignment = 1000, 
      }, 
      [2] = 
      {
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
         Tag = "", 
         Stats = 
         {
            Constitution = 10, 
            Dexterity = 10, 
            Luck = 10, 
            Wisdom = 10, 
            Force = 0, 
            Charisma = 10, 
            Intelligence = 10, 
            Strength = 10, 
         }, 
         Weight = 0, 
         Position = "standing", 
         Level = 50, 
         ShortDescr = "Richard Simmons", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "act_prog", 
               Arguments = "p is DEAD!!", 
               ScriptType = "MProg", 
               Code = "mptrans $n 6\
", 
            }, 
            [2] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "25", 
               ScriptType = "MProg", 
               Code = "emote hops around singing, \"I'm a pony, I'm a pony, I'm a pony!\"\
", 
            }, 
            [3] = 
            {
               MudProgType = "act_prog", 
               Arguments = "p is dying", 
               ScriptType = "MProg", 
               Code = "mpforce $n drink\
c heal $n\
", 
            }, 
            [4] = 
            {
               MudProgType = "act_prog", 
               Arguments = "p is starved", 
               ScriptType = "MProg", 
               Code = "mpoload 20\
give roll $n\
mpforce $n eat roll\
cast heal $n\
emote cackles happily\
say Oh, the ponies!\
", 
            }, 
            [5] = 
            {
               MudProgType = "act_prog", 
               Arguments = "p bashes against", 
               ScriptType = "MProg", 
               Code = "cast heal $n\
cast heal $n\
", 
            }, 
            [6] = 
            {
               MudProgType = "act_prog", 
               Arguments = "p shivers and", 
               ScriptType = "MProg", 
               Code = "cast 'cure poison' $n\
cast heal $n\
", 
            }, 
            [7] = 
            {
               MudProgType = "act_prog", 
               Arguments = "p wears", 
               ScriptType = "MProg", 
               Code = "c heal $n\
c heal $n\
", 
            }, 
            [8] = 
            {
               MudProgType = "act_prog", 
               Arguments = "p wields", 
               ScriptType = "MProg", 
               Code = "c heal $n\
c heal $n\
", 
            }, 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            ParaPetri = 0, 
         }, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [3] = "DetectInvis", 
         }, 
         LongDescr = "Richard Simmons stands before you...he wants you...to dance....\
", 
         Credits = 10000, 
         HitRoll = 0, 
         Name = "Richard Simmons", 
         Vnum = 2, 
         Height = 0, 
         NumberOfAttacks = 0, 
         Race = "Human", 
         ArmorClass = -300, 
         Sex = "undistinguished", 
         Description = "This demon is clearly something that you don't want to mess with...\
It appears to be very agile, and very strong.  \
", 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitNoDice = 5, 
            HitSizeDice = 10, 
            HitPlus = 31550, 
         }, 
         Damage = 
         {
            DamSizeDice = 2, 
            DamPlus = 2, 
            DamNoDice = 1, 
         }, 
         Alignment = -1000, 
      }, 
      [3] = 
      {
         DamRoll = 21, 
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
         Tag = "", 
         Stats = 
         {
            Constitution = 10, 
            Dexterity = 10, 
            Luck = 10, 
            Wisdom = 10, 
            Force = 0, 
            Charisma = 10, 
            Intelligence = 10, 
            Strength = 10, 
         }, 
         Weight = 0, 
         Position = "standing", 
         Level = 105, 
         ShortDescr = "the supermob", 
         Flags = 
         {
            [0] = "Npc", 
            [21] = "Secretive", 
            [23] = "MobInvis", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "25", 
               ScriptType = "MProg", 
               Code = "mpinvis 101\
", 
            }, 
            [2] = 
            {
               MudProgType = "entry_prog", 
               Arguments = "100", 
               ScriptType = "MProg", 
               Code = "mpinvis 101\
", 
            }, 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            ParaPetri = 0, 
         }, 
         AffectedBy = 
         {
            [1] = "Invisible", 
            [16] = "Hide", 
            [5] = "DetectHidden", 
            [22] = "TrueSight", 
            [3] = "DetectInvis", 
         }, 
         LongDescr = "The supermob is here.  He looks busy as hell.\
", 
         Credits = 10000, 
         HitRoll = 21, 
         Name = "supermob", 
         Vnum = 3, 
         Height = 0, 
         NumberOfAttacks = 0, 
         Race = "Human", 
         ArmorClass = -162, 
         Sex = "undistinguished", 
         Description = "How clever he looks!\
", 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitNoDice = 21, 
            HitSizeDice = 10, 
            HitPlus = 1050, 
         }, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamPlus = 2, 
            DamNoDice = 10, 
         }, 
         Alignment = -1000, 
      }, 
      [4] = 
      {
         DamRoll = 0, 
         Immune = 
         {
            [1] = "cold", 
            [2] = "electricity", 
            [3] = "energy", 
            [4] = "blunt", 
            [5] = "pierce", 
            [6] = "slash", 
            [7] = "acid", 
            [8] = "poison", 
            [9] = "drain", 
            [10] = "sleep", 
            [11] = "charm", 
            [12] = "hold", 
            [13] = "nonmagic", 
            [14] = "plus1", 
            [15] = "plus2", 
            [16] = "plus3", 
            [17] = "plus4", 
            [18] = "plus5", 
            [19] = "plus6", 
            [20] = "magic", 
            [21] = "paralysis", 
            [22] = "steal", 
            [0] = "fire", 
         }, 
         Tag = "", 
         Stats = 
         {
            Constitution = 10, 
            Dexterity = 10, 
            Luck = 10, 
            Wisdom = 10, 
            Force = 0, 
            Charisma = 10, 
            Intelligence = 10, 
            Strength = 10, 
         }, 
         Weight = 0, 
         Position = "standing", 
         Level = 103, 
         ShortDescr = "a vendor", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [10] = "Practice", 
         }, 
         Shop = 
         {
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            KeeperShortDescr = "a vendor", 
            ProfitBuy = 120, 
            ProfitSell = 90, 
         }, 
         Languages = 
         {
            Speaks = 
            {
               [1] = "shyriiwook", 
               [3] = "rodese", 
               [4] = "huttese", 
               [5] = "mon calamarian", 
               [6] = "shistavanen", 
               [7] = "ewokese", 
               [8] = "ithorese", 
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
               [3] = "rodese", 
               [4] = "huttese", 
               [5] = "mon calamarian", 
               [6] = "shistavanen", 
               [7] = "ewokese", 
               [8] = "ithorese", 
               [9] = "antarian", 
               [10] = "devaronese", 
               [14] = "gamorrese", 
               [17] = "jawaese", 
               [18] = "_clan", 
               [19] = "adarese", 
               [20] = "verpine", 
               [22] = "dosh", 
               [23] = "chadra-fan", 
               [24] = "quarrenese", 
               [25] = "sullustese", 
               [26] = "falleen", 
               [27] = "binary", 
            }, 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            ParaPetri = 0, 
         }, 
         LongDescr = "A Vendor owned by %s\
", 
         Credits = 0, 
         HitRoll = 0, 
         Name = "a vendor", 
         Vnum = 4, 
         Height = 0, 
         NumberOfAttacks = 0, 
         Race = "Human", 
         ArmorClass = 0, 
         Sex = "undistinguished", 
         Description = "", 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         Alignment = 0, 
      }, 
      [5] = 
      {
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
         Tag = "", 
         Stats = 
         {
            Constitution = 10, 
            Dexterity = 10, 
            Luck = 10, 
            Wisdom = 10, 
            Force = 0, 
            Charisma = 10, 
            Intelligence = 10, 
            Strength = 10, 
         }, 
         Weight = 0, 
         Position = "standing", 
         Level = 1, 
         ShortDescr = "an animated corpse", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            ParaPetri = 0, 
         }, 
         LongDescr = "An animated corpse struggles with the horror of its undeath.\
", 
         Credits = 0, 
         HitRoll = 0, 
         Name = "undead animated corpse", 
         Vnum = 5, 
         Height = 0, 
         NumberOfAttacks = 0, 
         Race = "Human", 
         ArmorClass = 0, 
         Sex = "undistinguished", 
         Description = "Denied its rightful death, this animated corpse has been infused with the\
powerful energies of its master.  It exists on the precipice between life\
and unlife, even as its physical body rots and decays under the strain of\
its tasks.\
", 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         Alignment = 0, 
      }, 
      [6] = 
      {
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
         Tag = "", 
         Stats = 
         {
            Constitution = 10, 
            Dexterity = 10, 
            Luck = 10, 
            Wisdom = 10, 
            Force = 0, 
            Charisma = 10, 
            Intelligence = 10, 
            Strength = 10, 
         }, 
         Weight = 0, 
         Position = "standing", 
         Level = 1, 
         ShortDescr = "Rosie O'Donnel...", 
         Flags = 
         {
            [0] = "Npc", 
            [18] = "Mountable", 
            [30] = "Prototype", 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            ParaPetri = 0, 
         }, 
         LongDescr = "Rosie O'Donnel blubbers here...like a beached whale\
", 
         Credits = 0, 
         HitRoll = 0, 
         Name = "Rosie O'Donnel", 
         Vnum = 6, 
         Height = 0, 
         NumberOfAttacks = 0, 
         Race = "Human", 
         ArmorClass = 0, 
         Sex = "undistinguished", 
         Description = "", 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         Alignment = -1000, 
      }, 
      [7] = 
      {
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
         Tag = "", 
         Stats = 
         {
            Constitution = 10, 
            Dexterity = 10, 
            Luck = 10, 
            Wisdom = 10, 
            Force = 0, 
            Charisma = 10, 
            Intelligence = 10, 
            Strength = 10, 
         }, 
         Weight = 0, 
         Position = "standing", 
         Level = 1, 
         ShortDescr = "a newly created Al Gore", 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "act_prog", 
               Arguments = "p is thirsty", 
               ScriptType = "MProg", 
               Code = "mpforce $n drink\
emote grins quietly\
say After no dose stopped giving me\
cash...\
say The wife HAD to go.\
", 
            }, 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            ParaPetri = 0, 
         }, 
         LongDescr = "Al Gore, the greatest thing since Nyquil, stands before you\
", 
         Credits = 0, 
         HitRoll = 0, 
         Name = "Al Gore", 
         Vnum = 7, 
         Height = 0, 
         NumberOfAttacks = 0, 
         Race = "Human", 
         ArmorClass = 0, 
         Sex = "undistinguished", 
         Description = "", 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         Alignment = 0, 
      }, 
      [10] = 
      {
         DamRoll = 16, 
         Languages = 
         {
            Speaks = 
            {
               [1] = "shyriiwook", 
               [2] = "twileki", 
               [3] = "rodese", 
               [8] = "ithorese", 
               [9] = "antarian", 
               [11] = "barabel", 
               [12] = "firrerreo", 
               [13] = "bothese", 
               [15] = "togorian", 
               [0] = "basic", 
               [17] = "jawaese", 
               [20] = "verpine", 
               [27] = "binary", 
            }, 
            Speaking = 
            {
               [1] = "shyriiwook", 
               [2] = "twileki", 
               [3] = "rodese", 
               [8] = "ithorese", 
               [9] = "antarian", 
               [11] = "barabel", 
               [12] = "firrerreo", 
               [13] = "bothese", 
               [15] = "togorian", 
               [0] = "basic", 
               [17] = "jawaese", 
               [20] = "verpine", 
               [27] = "binary", 
            }, 
         }, 
         Tag = "", 
         Stats = 
         {
            Constitution = 10, 
            Dexterity = 10, 
            Luck = 10, 
            Wisdom = 10, 
            Force = 0, 
            Charisma = 10, 
            Intelligence = 10, 
            Strength = 10, 
         }, 
         Weight = 0, 
         Position = "standing", 
         Level = 80, 
         ShortDescr = "Mauzumi, the Dire Wolf", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [18] = "Mountable", 
            [11] = "Immortal", 
            [27] = "NoCorpse", 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            ParaPetri = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamPlus = 2, 
            DamNoDice = 8, 
         }, 
         LongDescr = "&z&W&zA huge Dire Wolf stands here.\
", 
         Credits = 0, 
         HitRoll = 16, 
         Name = "mauzumi die wolf", 
         Vnum = 10, 
         Height = 0, 
         NumberOfAttacks = 2, 
         Race = "_69", 
         ArmorClass = -100, 
         Sex = "undistinguished", 
         Description = "While this large beast circles you, you have a chance to see its large          \
fangs and its sharp claws.  The wolf's eyes are small, black and have           \
the aura of a deadly intent.  Its raggedy coat tells of a recent battle         \
with something.\
", 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitNoDice = 16, 
            HitSizeDice = 10, 
            HitPlus = 800, 
         }, 
         AttackFlags = 
         {
            [1] = "claws", 
            [0] = "bite", 
         }, 
         Alignment = 0, 
      }, 
      [11] = 
      {
         DamRoll = 0, 
         Languages = 
         {
            Speaks = 
            {
               [1] = "shyriiwook", 
               [0] = "basic", 
               [17] = "jawaese", 
               [3] = "rodese", 
               [20] = "verpine", 
               [7] = "ewokese", 
               [8] = "ithorese", 
               [10] = "devaronese", 
               [27] = "binary", 
               [14] = "gamorrese", 
               [15] = "togorian", 
            }, 
            Speaking = 
            {
               [1] = "shyriiwook", 
               [0] = "basic", 
               [17] = "jawaese", 
               [3] = "rodese", 
               [20] = "verpine", 
               [7] = "ewokese", 
               [8] = "ithorese", 
               [10] = "devaronese", 
               [27] = "binary", 
               [14] = "gamorrese", 
               [15] = "togorian", 
            }, 
         }, 
         Tag = "", 
         Stats = 
         {
            Constitution = 10, 
            Dexterity = 10, 
            Luck = 10, 
            Wisdom = 10, 
            Force = 0, 
            Charisma = 10, 
            Intelligence = 10, 
            Strength = 10, 
         }, 
         Weight = 0, 
         Position = "standing", 
         Level = 1, 
         ShortDescr = "mist", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            ParaPetri = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         AffectedBy = 
         {
            [21] = "Floating", 
            [15] = "Sneak", 
         }, 
         LongDescr = "A thick mist plays with your senses.\
", 
         Credits = 0, 
         HitRoll = 0, 
         Name = "mist", 
         Vnum = 11, 
         Height = 0, 
         NumberOfAttacks = 2, 
         Race = "_85", 
         ArmorClass = 0, 
         Sex = "undistinguished", 
         Description = "Is it the fog you see?  Or are your eyes playing deadly tricks on you.  The\
mist swirls around you and then quickly disappears before you can blink.  You\
suddenly find yourself overcome with an unknown power.\
", 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         AttackFlags = 
         {
            [25] = "_25", 
            [21] = "_21", 
         }, 
         Alignment = 0, 
      }, 
      [12] = 
      {
         DamRoll = 0, 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
               [2] = "twileki", 
               [3] = "rodese", 
               [30] = "durese", 
               [5] = "mon calamarian", 
               [6] = "shistavanen", 
               [29] = "gand", 
               [24] = "quarrenese", 
               [9] = "antarian", 
               [10] = "devaronese", 
               [26] = "falleen", 
               [28] = "yevethan", 
               [13] = "bothese", 
               [14] = "gamorrese", 
               [25] = "sullustese", 
            }, 
            Speaking = 
            {
               [2] = "twileki", 
               [3] = "rodese", 
               [30] = "durese", 
               [5] = "mon calamarian", 
               [6] = "shistavanen", 
               [29] = "gand", 
               [24] = "quarrenese", 
               [9] = "antarian", 
               [10] = "devaronese", 
               [26] = "falleen", 
               [28] = "yevethan", 
               [13] = "bothese", 
               [14] = "gamorrese", 
               [25] = "sullustese", 
            }, 
         }, 
         Tag = "", 
         Stats = 
         {
            Constitution = 10, 
            Dexterity = 10, 
            Luck = 10, 
            Wisdom = 10, 
            Force = 0, 
            Charisma = 10, 
            Intelligence = 10, 
            Strength = 10, 
         }, 
         Weight = 0, 
         Position = "standing", 
         Level = 1, 
         ShortDescr = "bat", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            ParaPetri = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         AffectedBy = 
         {
            [19] = "Flying", 
         }, 
         LongDescr = "A bat hovers nearby with bloody fangs.\
", 
         Credits = 0, 
         HitRoll = 0, 
         Name = "bat", 
         Vnum = 12, 
         Height = 0, 
         NumberOfAttacks = 2, 
         Race = "Barabel", 
         ArmorClass = 0, 
         Sex = "undistinguished", 
         Description = "As this bloodsucking creature flies past you, you notice the tiny black\
eyes that stare at your jugular vein.  This little black bat has the\
intentions of drinking your blood until there is none left in your body.\
", 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         AttackFlags = 
         {
            [1] = "claws", 
            [0] = "bite", 
         }, 
         Alignment = 0, 
      }, 
      [13] = 
      {
         DamRoll = 0, 
         Languages = 
         {
            Speaks = 
            {
               [1] = "shyriiwook", 
               [3] = "rodese", 
               [4] = "huttese", 
               [0] = "basic", 
               [17] = "jawaese", 
               [27] = "binary", 
               [11] = "barabel", 
               [20] = "verpine", 
               [14] = "gamorrese", 
               [6] = "shistavanen", 
               [15] = "togorian", 
            }, 
            Speaking = 
            {
               [1] = "shyriiwook", 
               [3] = "rodese", 
               [4] = "huttese", 
               [17] = "jawaese", 
               [27] = "binary", 
               [11] = "barabel", 
               [20] = "verpine", 
               [14] = "gamorrese", 
               [6] = "shistavanen", 
               [15] = "togorian", 
            }, 
         }, 
         Tag = "", 
         Stats = 
         {
            Constitution = 10, 
            Dexterity = 10, 
            Luck = 10, 
            Wisdom = 10, 
            Force = 0, 
            Charisma = 10, 
            Intelligence = 10, 
            Strength = 10, 
         }, 
         Weight = 0, 
         Position = "standing", 
         Level = 1, 
         ShortDescr = "hawk", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            ParaPetri = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         AffectedBy = 
         {
            [19] = "Flying", 
         }, 
         LongDescr = "A hawk watches you with predatory eyes from its perch.\
", 
         Credits = 0, 
         HitRoll = 0, 
         Name = "hawk", 
         Vnum = 13, 
         Height = 0, 
         NumberOfAttacks = 2, 
         Race = "_78", 
         ArmorClass = 0, 
         Sex = "undistinguished", 
         Description = "This proud creature stands upon its perch watching you with unblinking\
eyes.  Any movement made by you could make it flare its wings in disapproval\
and open its beak to scream its intent.  Its long beak open and before you\
know what has happened, it comes flying towards you.\
", 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         AttackFlags = 
         {
            [1] = "claws", 
         }, 
         Alignment = 0, 
      }, 
      [14] = 
      {
         DamRoll = 0, 
         Languages = 
         {
            Speaks = 
            {
               [1] = "shyriiwook", 
               [0] = "basic", 
               [18] = "_clan", 
               [5] = "mon calamarian", 
               [6] = "shistavanen", 
               [8] = "ithorese", 
               [10] = "devaronese", 
               [22] = "dosh", 
               [21] = "defel", 
               [13] = "bothese", 
               [14] = "gamorrese", 
               [16] = "kubazian", 
            }, 
            Speaking = 
            {
               [1] = "shyriiwook", 
               [16] = "kubazian", 
               [18] = "_clan", 
               [5] = "mon calamarian", 
               [6] = "shistavanen", 
               [8] = "ithorese", 
               [10] = "devaronese", 
               [22] = "dosh", 
               [13] = "bothese", 
               [14] = "gamorrese", 
               [21] = "defel", 
            }, 
         }, 
         Tag = "", 
         Stats = 
         {
            Constitution = 10, 
            Dexterity = 10, 
            Luck = 10, 
            Wisdom = 10, 
            Force = 0, 
            Charisma = 10, 
            Intelligence = 10, 
            Strength = 10, 
         }, 
         Weight = 0, 
         Position = "standing", 
         Level = 1, 
         ShortDescr = "black cat", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            ParaPetri = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         AffectedBy = 
         {
            [3] = "DetectInvis", 
         }, 
         LongDescr = "A black cat has crossed your path with deadly intent.\
", 
         Credits = 0, 
         HitRoll = 0, 
         Name = "black cat", 
         Vnum = 14, 
         Height = 0, 
         NumberOfAttacks = 2, 
         Race = "Gran", 
         ArmorClass = 0, 
         Sex = "undistinguished", 
         Description = "With a furry black coat, and big yellow eyes, this cat gracefully walks\
across your path, bringing you several years of bad luck.  Its tail moves\
slowly to tell you that it is laughing at your misfortune.\
", 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         AttackFlags = 
         {
            [1] = "claws", 
            [0] = "bite", 
         }, 
         Alignment = 0, 
      }, 
      [15] = 
      {
         DamRoll = 0, 
         Languages = 
         {
            Speaks = 
            {
               [1] = "shyriiwook", 
               [3] = "rodese", 
               [4] = "huttese", 
               [0] = "basic", 
               [17] = "jawaese", 
               [27] = "binary", 
               [11] = "barabel", 
               [20] = "verpine", 
               [14] = "gamorrese", 
               [6] = "shistavanen", 
               [15] = "togorian", 
            }, 
            Speaking = 
            {
               [1] = "shyriiwook", 
               [3] = "rodese", 
               [4] = "huttese", 
               [17] = "jawaese", 
               [27] = "binary", 
               [11] = "barabel", 
               [20] = "verpine", 
               [14] = "gamorrese", 
               [6] = "shistavanen", 
               [15] = "togorian", 
            }, 
         }, 
         Tag = "", 
         Stats = 
         {
            Constitution = 10, 
            Dexterity = 10, 
            Luck = 10, 
            Wisdom = 10, 
            Force = 0, 
            Charisma = 10, 
            Intelligence = 10, 
            Strength = 10, 
         }, 
         Weight = 0, 
         Position = "standing", 
         Level = 1, 
         ShortDescr = "dove", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            ParaPetri = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         AffectedBy = 
         {
            [19] = "Flying", 
         }, 
         LongDescr = "A beautiful dove sings a melancholy melody from its nest.\
", 
         Credits = 0, 
         HitRoll = 0, 
         Name = "dove", 
         Vnum = 15, 
         Height = 0, 
         NumberOfAttacks = 1, 
         Race = "_78", 
         ArmorClass = 0, 
         Sex = "undistinguished", 
         Description = "With feathers the colour of soft grey and soft loving black eyes, this small\
delicate creature sings you a tune full of romance.  The tune it sings comes\
from the small breast that rises and falls with every chorus it sings.  You\
are at peace as you listen to this lovable creature.\
", 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         AttackFlags = 
         {
            [1] = "claws", 
         }, 
         Alignment = 0, 
      }, 
      [16] = 
      {
         DamRoll = 0, 
         Languages = 
         {
            Speaks = 
            {
               [1] = "shyriiwook", 
               [3] = "rodese", 
               [4] = "huttese", 
               [5] = "mon calamarian", 
               [8] = "ithorese", 
               [9] = "antarian", 
               [10] = "devaronese", 
               [14] = "gamorrese", 
               [15] = "togorian", 
               [0] = "basic", 
               [17] = "jawaese", 
               [20] = "verpine", 
               [27] = "binary", 
            }, 
            Speaking = 
            {
               [1] = "shyriiwook", 
               [3] = "rodese", 
               [4] = "huttese", 
               [5] = "mon calamarian", 
               [8] = "ithorese", 
               [9] = "antarian", 
               [10] = "devaronese", 
               [14] = "gamorrese", 
               [15] = "togorian", 
               [20] = "verpine", 
               [17] = "jawaese", 
               [27] = "binary", 
            }, 
         }, 
         Tag = "", 
         Stats = 
         {
            Constitution = 10, 
            Dexterity = 10, 
            Luck = 10, 
            Wisdom = 10, 
            Force = 0, 
            Charisma = 10, 
            Intelligence = 10, 
            Strength = 10, 
         }, 
         Weight = 0, 
         Position = "standing", 
         Level = 1, 
         ShortDescr = "fish", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            ParaPetri = 0, 
         }, 
         AffectedBy = 
         {
            [31] = "AquaBreath", 
         }, 
         LongDescr = "A fish blows large bubbles as it quickly swims past you.\
", 
         Credits = 0, 
         HitRoll = 0, 
         Name = "fish", 
         Vnum = 16, 
         Height = 0, 
         NumberOfAttacks = 1, 
         Race = "_81", 
         ArmorClass = 0, 
         Sex = "undistinguished", 
         Description = "With fins, teeth and gills, this slippery little thing is hard to catch.\
It swims with a speed no beast, human or animal can compete with.  It's\
tiny eyes, move with every breath.  It blows several large bubbles as it\
quickly swims past you.\
", 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         Alignment = 0, 
      }, 
      [20] = 
      {
         DamRoll = 2, 
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
         Tag = "", 
         Stats = 
         {
            Constitution = 10, 
            Dexterity = 10, 
            Luck = 10, 
            Wisdom = 10, 
            Force = 0, 
            Charisma = 10, 
            Intelligence = 10, 
            Strength = 10, 
         }, 
         Weight = 0, 
         Position = "standing", 
         Level = 10, 
         ShortDescr = "a stormtrooper", 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         SpecFuns = 
         {
            [0] = "spec_stormtrooper", 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            ParaPetri = 0, 
         }, 
         LongDescr = "An imperial stormtrooper stands at attention here.\
", 
         Credits = 0, 
         HitRoll = 2, 
         Name = "imperial trooper stormtrooper", 
         Vnum = 20, 
         Height = 0, 
         NumberOfAttacks = 0, 
         Race = "Human", 
         ArmorClass = 75, 
         Sex = "undistinguished", 
         Description = "", 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitNoDice = 2, 
            HitSizeDice = 10, 
            HitPlus = 100, 
         }, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamPlus = 2, 
            DamNoDice = 1, 
         }, 
         Alignment = 0, 
      }, 
      [21] = 
      {
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
         Tag = "", 
         Stats = 
         {
            Constitution = 10, 
            Dexterity = 10, 
            Luck = 10, 
            Wisdom = 10, 
            Force = 0, 
            Charisma = 10, 
            Intelligence = 10, 
            Strength = 10, 
         }, 
         Weight = 0, 
         Position = "standing", 
         Level = 1, 
         ShortDescr = "an imperial guard", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            ParaPetri = 0, 
         }, 
         LongDescr = "An imperial guard stands at attention.\
", 
         Credits = 0, 
         HitRoll = 0, 
         Name = "imperial guard stormtrooper", 
         Vnum = 21, 
         Height = 0, 
         NumberOfAttacks = 0, 
         Race = "Human", 
         ArmorClass = 0, 
         Sex = "undistinguished", 
         Description = "", 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamPlus = 0, 
            DamNoDice = 1, 
         }, 
         Alignment = 0, 
      }, 
      [22] = 
      {
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
         Tag = "", 
         Stats = 
         {
            Constitution = 10, 
            Dexterity = 10, 
            Luck = 10, 
            Wisdom = 10, 
            Force = 0, 
            Charisma = 10, 
            Intelligence = 10, 
            Strength = 10, 
         }, 
         Weight = 0, 
         Position = "standing", 
         Level = 1, 
         ShortDescr = "a Rebel Alliance guard", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            ParaPetri = 0, 
         }, 
         LongDescr = "A Rebel Alliance guard stands at attention.\
", 
         Credits = 0, 
         HitRoll = 0, 
         Name = "Rebel Alliance guard", 
         Vnum = 22, 
         Height = 0, 
         NumberOfAttacks = 0, 
         Race = "Human", 
         ArmorClass = 0, 
         Sex = "undistinguished", 
         Description = "", 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamPlus = 0, 
            DamNoDice = 1, 
         }, 
         Alignment = 0, 
      }, 
      [23] = 
      {
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
         Tag = "", 
         Stats = 
         {
            Constitution = 10, 
            Dexterity = 10, 
            Luck = 10, 
            Wisdom = 10, 
            Force = 0, 
            Charisma = 10, 
            Intelligence = 10, 
            Strength = 10, 
         }, 
         Weight = 0, 
         Position = "standing", 
         Level = 1, 
         ShortDescr = "a rebel alliance trooper", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         SpecFuns = 
         {
            [0] = "spec_rebel_trooper", 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            ParaPetri = 0, 
         }, 
         LongDescr = "A rebel alliance trooper is ready for battle.\
", 
         Credits = 0, 
         HitRoll = 0, 
         Name = "Rebel Alliance Trooper soldier", 
         Vnum = 23, 
         Height = 0, 
         NumberOfAttacks = 0, 
         Race = "Human", 
         ArmorClass = 0, 
         Sex = "undistinguished", 
         Description = "", 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamPlus = 0, 
            DamNoDice = 1, 
         }, 
         Alignment = 0, 
      }, 
      [24] = 
      {
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
         Tag = "", 
         Stats = 
         {
            Constitution = 10, 
            Dexterity = 10, 
            Luck = 10, 
            Wisdom = 10, 
            Force = 0, 
            Charisma = 10, 
            Intelligence = 10, 
            Strength = 10, 
         }, 
         Weight = 0, 
         Position = "standing", 
         Level = 1, 
         ShortDescr = "a mercenary", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            ParaPetri = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamPlus = 0, 
            DamNoDice = 1, 
         }, 
         LongDescr = "A mercenary stands here ready for battle.\
", 
         Credits = 0, 
         HitRoll = 0, 
         Name = "A mercenary", 
         Vnum = 24, 
         Height = 0, 
         NumberOfAttacks = 1, 
         Race = "Human", 
         ArmorClass = 0, 
         Sex = "undistinguished", 
         Description = "", 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         AttackFlags = 
         {
            [5] = "kick", 
         }, 
         Alignment = 0, 
      }, 
      [25] = 
      {
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
         Tag = "", 
         Stats = 
         {
            Constitution = 10, 
            Dexterity = 10, 
            Luck = 10, 
            Wisdom = 10, 
            Force = 0, 
            Charisma = 10, 
            Intelligence = 10, 
            Strength = 10, 
         }, 
         Weight = 0, 
         Position = "standing", 
         Level = 1, 
         ShortDescr = "a guard", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            ParaPetri = 0, 
         }, 
         LongDescr = "An alert guard stands at attention.\
", 
         Credits = 0, 
         HitRoll = 0, 
         Name = "bouncer guard thug", 
         Vnum = 25, 
         Height = 0, 
         NumberOfAttacks = 0, 
         Race = "Human", 
         ArmorClass = 0, 
         Sex = "undistinguished", 
         Description = "", 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamPlus = 0, 
            DamNoDice = 1, 
         }, 
         Alignment = 0, 
      }, 
      [26] = 
      {
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
         Tag = "", 
         Stats = 
         {
            Constitution = 10, 
            Dexterity = 10, 
            Luck = 10, 
            Wisdom = 10, 
            Force = 0, 
            Charisma = 10, 
            Intelligence = 10, 
            Strength = 10, 
         }, 
         Weight = 0, 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         Position = "standing", 
         Level = 1, 
         ShortDescr = "an imperial guard", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            ParaPetri = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamPlus = 0, 
            DamNoDice = 1, 
         }, 
         AffectedBy = 
         {
            [15] = "Sneak", 
         }, 
         LongDescr = "An elite imperial guard stands at rigid attention.\
", 
         Credits = 0, 
         HitRoll = 0, 
         Name = "Imperial Elite Guard", 
         Vnum = 26, 
         Height = 0, 
         NumberOfAttacks = 3, 
         Race = "Human", 
         ArmorClass = 0, 
         Sex = "undistinguished", 
         Description = "", 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         Alignment = 0, 
      }, 
      [27] = 
      {
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
         Tag = "", 
         Stats = 
         {
            Constitution = 10, 
            Dexterity = 10, 
            Luck = 10, 
            Wisdom = 10, 
            Force = 0, 
            Charisma = 10, 
            Intelligence = 10, 
            Strength = 10, 
         }, 
         Weight = 0, 
         Position = "standing", 
         Level = 1, 
         ShortDescr = "an imperial guard", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            ParaPetri = 0, 
         }, 
         LongDescr = "An imperial guard stands at attention.\
", 
         Credits = 0, 
         HitRoll = 0, 
         Name = "The Empire", 
         Vnum = 27, 
         Height = 0, 
         NumberOfAttacks = 0, 
         Race = "Human", 
         ArmorClass = 0, 
         Sex = "undistinguished", 
         Description = "", 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamPlus = 0, 
            DamNoDice = 1, 
         }, 
         Alignment = 0, 
      }, 
      [28] = 
      {
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
         Tag = "", 
         Stats = 
         {
            Constitution = 10, 
            Dexterity = 10, 
            Luck = 10, 
            Wisdom = 10, 
            Force = 0, 
            Charisma = 10, 
            Intelligence = 10, 
            Strength = 10, 
         }, 
         Weight = 0, 
         Position = "standing", 
         Level = 10, 
         ShortDescr = "a stormtrooper", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         SpecFuns = 
         {
            [0] = "spec_stormtrooper", 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            ParaPetri = 0, 
         }, 
         LongDescr = "An imperial special forces trooper stands at rigid attention here.\
", 
         Credits = 0, 
         HitRoll = 0, 
         Name = "an imperial specfor trooper", 
         Vnum = 28, 
         Height = 0, 
         NumberOfAttacks = 0, 
         Race = "Human", 
         ArmorClass = 75, 
         Sex = "undistinguished", 
         Description = "", 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitNoDice = 2, 
            HitSizeDice = 10, 
            HitPlus = 100, 
         }, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamPlus = 2, 
            DamNoDice = 1, 
         }, 
         Alignment = 0, 
      }, 
      [29] = 
      {
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
         Tag = "", 
         Stats = 
         {
            Constitution = 10, 
            Dexterity = 10, 
            Luck = 10, 
            Wisdom = 10, 
            Force = 0, 
            Charisma = 10, 
            Intelligence = 10, 
            Strength = 10, 
         }, 
         Weight = 0, 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         Position = "standing", 
         Level = 1, 
         ShortDescr = "a Rebel Alliance guard", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            ParaPetri = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamPlus = 0, 
            DamNoDice = 1, 
         }, 
         AffectedBy = 
         {
            [15] = "Sneak", 
         }, 
         LongDescr = "An elite rebel guard stands at rigid attention.\
", 
         Credits = 0, 
         HitRoll = 0, 
         Name = "rebel elite guard", 
         Vnum = 29, 
         Height = 0, 
         NumberOfAttacks = 3, 
         Race = "Human", 
         ArmorClass = 0, 
         Sex = "undistinguished", 
         Description = "", 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         Alignment = 0, 
      }, 
      [30] = 
      {
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
         Tag = "", 
         Stats = 
         {
            Constitution = 10, 
            Dexterity = 10, 
            Luck = 10, 
            Wisdom = 10, 
            Force = 0, 
            Charisma = 10, 
            Intelligence = 10, 
            Strength = 10, 
         }, 
         Weight = 0, 
         Position = "standing", 
         Level = 1, 
         ShortDescr = "a Rebel Alliance guard", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            ParaPetri = 0, 
         }, 
         LongDescr = "A Rebel Alliance guard stands at attention.\
", 
         Credits = 0, 
         HitRoll = 0, 
         Name = "The Rebel Alliance", 
         Vnum = 30, 
         Height = 0, 
         NumberOfAttacks = 0, 
         Race = "Human", 
         ArmorClass = 0, 
         Sex = "undistinguished", 
         Description = "", 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamPlus = 0, 
            DamNoDice = 1, 
         }, 
         Alignment = 0, 
      }, 
      [31] = 
      {
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
         Tag = "", 
         Stats = 
         {
            Constitution = 10, 
            Dexterity = 10, 
            Luck = 10, 
            Wisdom = 10, 
            Force = 0, 
            Charisma = 10, 
            Intelligence = 10, 
            Strength = 10, 
         }, 
         Weight = 0, 
         SpecFuns = 
         {
            [0] = "spec_rebel_trooper", 
         }, 
         Position = "standing", 
         Level = 1, 
         ShortDescr = "a rebel alliance trooper", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            ParaPetri = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamPlus = 0, 
            DamNoDice = 1, 
         }, 
         AffectedBy = 
         {
            [15] = "Sneak", 
         }, 
         LongDescr = "A rebel special forces trooper stands at rigid attention here.\
", 
         Credits = 0, 
         HitRoll = 0, 
         Name = "a rebel specfor trooper", 
         Vnum = 31, 
         Height = 0, 
         NumberOfAttacks = 3, 
         Race = "Human", 
         ArmorClass = 0, 
         Sex = "undistinguished", 
         Description = "", 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         Alignment = 0, 
      }, 
      [32] = 
      {
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
         Tag = "", 
         Stats = 
         {
            Constitution = 10, 
            Dexterity = 10, 
            Luck = 10, 
            Wisdom = 10, 
            Force = 0, 
            Charisma = 10, 
            Intelligence = 10, 
            Strength = 10, 
         }, 
         Weight = 0, 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         Position = "standing", 
         Level = 1, 
         ShortDescr = "a guard", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            ParaPetri = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamPlus = 0, 
            DamNoDice = 1, 
         }, 
         AffectedBy = 
         {
            [15] = "Sneak", 
         }, 
         LongDescr = "An elite guard stands at rigid attention.\
", 
         Credits = 0, 
         HitRoll = 0, 
         Name = "a merc elite guard", 
         Vnum = 32, 
         Height = 0, 
         NumberOfAttacks = 3, 
         Race = "Human", 
         ArmorClass = 0, 
         Sex = "undistinguished", 
         Description = "", 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         Alignment = 0, 
      }, 
      [40] = 
      {
         DamRoll = 21, 
         Immune = 
         {
            [20] = "magic", 
         }, 
         Tag = "", 
         Stats = 
         {
            Constitution = 10, 
            Dexterity = 10, 
            Luck = 10, 
            Wisdom = 10, 
            Force = 0, 
            Charisma = 10, 
            Intelligence = 10, 
            Strength = 10, 
         }, 
         Weight = 0, 
         Position = "standing", 
         Level = 105, 
         ShortDescr = "the ship upgrades technician", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [30] = "Prototype", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "autopilot", 
               ScriptType = "MProg", 
               Code = "mpat 5991 autopilot\
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
         SaveVs = 
         {
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            ParaPetri = 0, 
         }, 
         LongDescr = "The ship upgrades technician is here.\
", 
         Credits = 0, 
         HitRoll = 21, 
         Name = "Ship Upgrades Technician", 
         Vnum = 40, 
         Height = 0, 
         NumberOfAttacks = 0, 
         Race = "Human", 
         ArmorClass = -162, 
         Sex = "undistinguished", 
         Description = "", 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitNoDice = 21, 
            HitSizeDice = 10, 
            HitPlus = 1050, 
         }, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamPlus = 2, 
            DamNoDice = 10, 
         }, 
         Alignment = 0, 
      }, 
      [33] = 
      {
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
         Tag = "", 
         Stats = 
         {
            Constitution = 10, 
            Dexterity = 10, 
            Luck = 10, 
            Wisdom = 10, 
            Force = 0, 
            Charisma = 10, 
            Intelligence = 10, 
            Strength = 10, 
         }, 
         Weight = 0, 
         Position = "standing", 
         Level = 1, 
         ShortDescr = "a guard", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         SpecFuns = 
         {
            [0] = "spec_clan_guard", 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            ParaPetri = 0, 
         }, 
         LongDescr = "An alert guard stands at attention.\
", 
         Credits = 0, 
         HitRoll = 0, 
         Name = "bouncer guard thug", 
         Vnum = 33, 
         Height = 0, 
         NumberOfAttacks = 0, 
         Race = "Human", 
         ArmorClass = 0, 
         Sex = "undistinguished", 
         Description = "", 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamPlus = 0, 
            DamNoDice = 1, 
         }, 
         Alignment = 0, 
      }, 
      [50] = 
      {
         DamRoll = 21, 
         Immune = 
         {
            [20] = "magic", 
         }, 
         Tag = "", 
         Stats = 
         {
            Constitution = 10, 
            Dexterity = 10, 
            Luck = 10, 
            Wisdom = 10, 
            Force = 0, 
            Charisma = 10, 
            Intelligence = 10, 
            Strength = 10, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "give", 
               ScriptType = "MProg", 
               Code = "chuckle \
' yes i did give a Corusca Crystal to a young apprentice of mine\
' he would have grown strong in the force, if his father would\
' not have died , and him have to return to his fathers shop.\
", 
            }, 
            [2] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "shop", 
               ScriptType = "MProg", 
               Code = "grin $n\
' yes the jedi shop in the space mall , he is the owner of it now.\
' if you seek the corusca crystal he may still have it \
' i don't believe he had crafted his lightsaber before he left.\
", 
            }, 
            [3] = 
            {
               MudProgType = "act_prog", 
               Arguments = "package.", 
               ScriptType = "MProg", 
               Code = "if ovnuminv(10208) >= 1\
say Thank you.\
mpwithdraw 2500\
give 2500 credits $n\
mpgain $n 5 100000\
else\
say hmm... Thanks, but this isn't adressed to me.\
drop all\
endif\
mpat 10299 drop all\
mpat 10299 mppurge\
", 
            }, 
            [4] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "corusca", 
               ScriptType = "MProg", 
               Code = "non $n \
' The corusca is on of the best crytals used to make a lightsaber\
' and for that reason they are very rare\
' I have seen but a few in my day.\
", 
            }, 
         }, 
         Weight = 0, 
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
         Position = "standing", 
         Level = 105, 
         ShortDescr = "Jedi Master Yoda", 
         Flags = 
         {
            [1] = "Sentinel", 
            [24] = "NoAssist", 
            [25] = "NoKill", 
            [10] = "Practice", 
            [30] = "Prototype", 
            [0] = "Npc", 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [2] = "_02", 
            [0] = "parry", 
            [11] = "_11", 
            [13] = "_13", 
            [19] = "disarm", 
            [8] = "_08", 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            ParaPetri = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamPlus = 2, 
            DamNoDice = 10, 
         }, 
         AffectedBy = 
         {
            [5] = "DetectHidden", 
            [3] = "DetectInvis", 
         }, 
         LongDescr = "Master Yoda is here to train you in the ways of the force.\
", 
         Credits = 0, 
         HitRoll = 21, 
         Name = "Master Yoda", 
         Vnum = 50, 
         Height = 0, 
         NumberOfAttacks = 0, 
         Race = "Human", 
         ArmorClass = -162, 
         Sex = "male", 
         Description = "", 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitNoDice = 21, 
            HitSizeDice = 10, 
            HitPlus = 5000, 
         }, 
         Resistant = 
         {
            [0] = "fire", 
            [20] = "magic", 
            [2] = "electricity", 
            [3] = "energy", 
         }, 
         Alignment = 1000, 
      }, 
      [98] = 
      {
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
         Tag = "", 
         Stats = 
         {
            Constitution = 10, 
            Dexterity = 10, 
            Luck = 10, 
            Wisdom = 10, 
            Force = 0, 
            Charisma = 10, 
            Intelligence = 10, 
            Strength = 10, 
         }, 
         Weight = 0, 
         Position = "standing", 
         Level = 1, 
         ShortDescr = "a janitor", 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         SpecFuns = 
         {
            [0] = "spec_janitor", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "100", 
               ScriptType = "MProg", 
               Code = "mpat 32179 drop all\
", 
            }, 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            ParaPetri = 0, 
         }, 
         LongDescr = "A janitor cleans up the ship here.\
", 
         Credits = 0, 
         HitRoll = 0, 
         Name = "janitor", 
         Vnum = 98, 
         Height = 0, 
         NumberOfAttacks = 0, 
         Race = "Human", 
         ArmorClass = 0, 
         Sex = "undistinguished", 
         Description = "", 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         Alignment = 0, 
      }, 
      [34] = 
      {
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
         Tag = "", 
         Stats = 
         {
            Constitution = 10, 
            Dexterity = 10, 
            Luck = 10, 
            Wisdom = 10, 
            Force = 0, 
            Charisma = 10, 
            Intelligence = 10, 
            Strength = 10, 
         }, 
         Weight = 0, 
         Position = "standing", 
         Level = 1, 
         ShortDescr = "a mercenary", 
         Flags = 
         {
            [0] = "Npc", 
            [30] = "Prototype", 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Wand = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            ParaPetri = 0, 
         }, 
         LongDescr = "An ex-military special forces trooper stands here, looking relaxed.\
", 
         Credits = 0, 
         HitRoll = 0, 
         Name = "A mercenary", 
         Vnum = 34, 
         Height = 0, 
         NumberOfAttacks = 0, 
         Race = "Human", 
         ArmorClass = 0, 
         Sex = "undistinguished", 
         Description = "", 
         DefaultPosition = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitSizeDice = 0, 
            HitPlus = 0, 
         }, 
         Damage = 
         {
            DamSizeDice = 10, 
            DamPlus = 0, 
            DamNoDice = 1, 
         }, 
         Alignment = 0, 
      }, 
   }, 
   Rooms = 
   {
      [1] = 
      {
         Tag = "", 
         Name = "&CCorrans Insane Apartment&g", 
         Vnum = 1, 
         Sector = "city", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "test", 
               ScriptType = "MProg", 
               Code = "say triggered by (name):\9$n\
say triggered by (name&title): \9$N\
say triggerer is (he,she,it):\9$e\
say triggerer is (him,her,it):\9$m\
say triggerer is (his,hers,its):$s\
say random char (name):\9\9$r\
say random char (name&title or short): \9$R\
say random char  (he,she,it):\9$J\
say random char (him,her,it):\9$K\
say random char (his,hers,its):\9$L\
", 
            }, 
            [2] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "test2", 
               ScriptType = "MProg", 
               Code = "say firstname of room:\9 \9$i\
say short_desc/title of room: \9$I\
say he/she/it of room:\9 \9$j\
say him/her/it of room:\9 \9$k\
say his/hers/its of room:\9$l\
say firstname of victim: \9$t\
say short_desc/title of victim:\9$T\
say he/she/it of victim: \9$E\
say him/her/it of victim: \9$M\
say his/hers/its of victim:\9$S\
", 
            }, 
            [3] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "die", 
               ScriptType = "MProg", 
               Code = "mpdamage $n 234234\
", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [26] = "Factory", 
            [23] = "Hotel", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 100, 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 107, 
               Key = -1, 
               Direction = "up", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This is Corran Horns Apartment. As you look around you see a few\
items scattered in a corner. The bed in the corner is made with \
military preciceness, all the corners straight and tucked in as \
tight as can be. There is a small desk with a DataTerminal in the \
corner displaying the Rogue Squadron crest, and a Holo-projector.\
In the closet you see Civilian clothing and a few pressed\
uniforms neatly hung in a row.\
", 
      }, 
      [2] = 
      {
         Tag = "", 
         Name = "Limbo", 
         Vnum = 2, 
         Sector = "inside", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32145, 
               Key = -1, 
               Direction = "up", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
      }, 
      [3] = 
      {
         Tag = "", 
         Name = "Supermob Office", 
         Vnum = 3, 
         Sector = "inside", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
      }, 
      [4] = 
      {
         Tag = "", 
         Name = "Spawn Location for Scripts", 
         Vnum = 4, 
         Sector = "inside", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The Imp functions spawnobj() and spawnmob() will dump their result here.\
Needless to say you should use tocontainer() to put it where it's supposed\
to go.\
\
IF THERE IS ANYTHING IN THIS ROOM, IT MEANS SOME SCRIPT IS MISBEHAVING.\
", 
      }, 
      [5] = 
      {
         Tag = "", 
         Name = "Vendor Storage", 
         Vnum = 5, 
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Exits = 
         {
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
      }, 
      [6] = 
      {
         Tag = "", 
         Name = "&GR&Ri&Gc&Rh&Ga&Rr&Gd S&bi&Rm&Gm&bo&Rn&G'&bs &RD&Wa&Bn&Rc&We &BA&bc&Ya&Bd&be&Ym&Gy&R&W", 
         Vnum = 6, 
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [17] = "LogSpeech", 
            [2] = "NoMob", 
            [3] = "Indoors", 
            [10] = "Safe", 
            [6] = "NoDrive", 
            [23] = "Hotel", 
         }, 
         Exits = 
         {
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "Now you've done it... the gods must have truly forsaken you, to have sent\
you straight to Richard Simmons and Rosie O'Donnel!\
   It is highly advised to wait here to make your appeal to the wrath of\
the gods... or face being damned to this place for all eternity!\
", 
      }, 
      [7] = 
      {
         Tag = "", 
         Name = "Mobprog Purge Room", 
         Vnum = 7, 
         Sector = "city", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "purge", 
               ScriptType = "MProg", 
               Code = "mppurge\
", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Exits = 
         {
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
      }, 
      [8] = 
      {
         Tag = "", 
         Name = "Immhood ClanStoreRoom", 
         Vnum = 8, 
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [30] = "Prototype", 
            [2] = "NoMob", 
            [19] = "ClanStoreroom", 
         }, 
         Exits = 
         {
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
      }, 
      [10] = 
      {
         Tag = "", 
         Name = "An Empty Home", 
         Vnum = 10, 
         Sector = "inside", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "entry_prog", 
               Arguments = "100", 
               ScriptType = "MProg", 
               Code = "if $n == isimm\
mpecho Hello\
endif\
", 
            }, 
            [2] = 
            {
               MudProgType = "speech_prog", 
               Arguments = "100", 
               ScriptType = "MProg", 
               Code = "mpmload 329\
mpforce mobslave mpoload 10313\
mpforce mobslave drop ration\
mppurge mobslave\
", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
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
               DestinationVnum = 100, 
               Key = -1, 
               Direction = "down", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
      }, 
      [11] = 
      {
         Tag = "", 
         Name = "Floating in a void", 
         Vnum = 11, 
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Exits = 
         {
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
      }, 
      [12] = 
      {
         Tag = "", 
         Name = "Floating in a void", 
         Vnum = 12, 
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Exits = 
         {
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
      }, 
      [19] = 
      {
         Tag = "", 
         Name = "Incognito Platform", 
         Vnum = 19, 
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [10] = "Safe", 
            [4] = "CanLand", 
            [5] = "CanFly", 
            [30] = "Prototype", 
            [2] = "NoMob", 
         }, 
         Exits = 
         {
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "A platform is here, located on a desolate shipyard located within the deep\
fabric of space. A few starships are found, being worked on by a greater\
life form and are produced for those mortals who have enough credits to\
purchase them. Quality seems of the essence, and speed nor time has no\
value.  It would seem this bleak area is managed by Den.\
", 
      }, 
      [20] = 
      {
         Tag = "", 
         Name = "Floating in a void", 
         Vnum = 20, 
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Exits = 
         {
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
      }, 
      [29] = 
      {
         Tag = "", 
         Name = "The Arena", 
         Vnum = 29, 
         Sector = "city", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "15", 
               ScriptType = "MProg", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 30, 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 32, 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 33, 
               Key = -1, 
               Direction = "southeast", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
      }, 
      [30] = 
      {
         Tag = "", 
         Name = "The Arena", 
         Vnum = 30, 
         Sector = "city", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "15", 
               ScriptType = "MProg", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 40, 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 31, 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 33, 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               DestinationVnum = 29, 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
      }, 
      [31] = 
      {
         Tag = "", 
         Name = "The Arena", 
         Vnum = 31, 
         Sector = "city", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "15", 
               ScriptType = "MProg", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 34, 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 30, 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 33, 
               Key = -1, 
               Direction = "southwest", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
      }, 
      [32] = 
      {
         Tag = "", 
         Name = "The Arena", 
         Vnum = 32, 
         Sector = "city", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "15", 
               ScriptType = "MProg", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [13] = "Arena", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 29, 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 33, 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 35, 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
      }, 
      [33] = 
      {
         Tag = "", 
         Name = "The Arena", 
         Vnum = 33, 
         Sector = "city", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "15", 
               ScriptType = "MProg", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 30, 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 34, 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 36, 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               DestinationVnum = 32, 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [5] = 
            {
               DestinationVnum = 31, 
               Key = -1, 
               Direction = "northeast", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [6] = 
            {
               DestinationVnum = 29, 
               Key = -1, 
               Direction = "northwest", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [7] = 
            {
               DestinationVnum = 37, 
               Key = -1, 
               Direction = "southeast", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [8] = 
            {
               DestinationVnum = 35, 
               Key = -1, 
               Direction = "southwest", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
      }, 
      [34] = 
      {
         Tag = "", 
         Name = "The Arena", 
         Vnum = 34, 
         Sector = "city", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "15", 
               ScriptType = "MProg", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 31, 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 37, 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 33, 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
      }, 
      [35] = 
      {
         Tag = "", 
         Name = "The Arena", 
         Vnum = 35, 
         Sector = "city", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "15", 
               ScriptType = "MProg", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 32, 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 36, 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 33, 
               Key = -1, 
               Direction = "northeast", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
      }, 
      [36] = 
      {
         Tag = "", 
         Name = "The Arena", 
         Vnum = 36, 
         Sector = "city", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "15", 
               ScriptType = "MProg", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 33, 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 37, 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 38, 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               DestinationVnum = 35, 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You find yourself on the Arena floor.  The roar of the crowd above you\
is overwhelming, while around you ... your opponent awaits your coming.\
", 
      }, 
      [37] = 
      {
         Tag = "", 
         Name = "The Arena", 
         Vnum = 37, 
         Sector = "city", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "15", 
               ScriptType = "MProg", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 34, 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 36, 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 33, 
               Key = -1, 
               Direction = "northwest", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You stand in the direct center of the Arena.  Blood pools around your\
feet, and you almost slip in this morbid mess.  The stench of death\
surrounds you, momentarily blocking from your mind the realization\
that you could be attacked from any conceivable direction.  Spinning\
slowly about, you realize the poor tactical position you hold.\
", 
      }, 
      [38] = 
      {
         Tag = "", 
         Name = "Southern Sniper Tower Entrance", 
         Vnum = 38, 
         Sector = "inside", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "15", 
               ScriptType = "MProg", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 36, 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 39, 
               Key = -1, 
               Direction = "up", 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [7] = "Climb", 
               }, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This large room is the main entrance to the Southern Sniper Tower in the\
Arena. It's a pretty bare room, and has a small set of stairs leading up\
to the main tower supervising the southern portion of the arena. The\
lighting is quite dim, and the bellowing echoes of the crowd would be\
quite distracting to the untrained combatant. The walls are of thick\
duratanium, and many charred blaster/explosive marks are strewn about the\
entire room.\
\
&RCLIMBing is essential in getting up!&R&W\
", 
      }, 
      [39] = 
      {
         Tag = "", 
         Name = "Southern Sniper Tower", 
         Vnum = 39, 
         Sector = "inside", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "15", 
               ScriptType = "MProg", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 36, 
               Key = -1, 
               Direction = "north", 
               Flags = 
               {
                  [25] = "Window", 
                  [10] = "NoPassdoor", 
                  [26] = "CanLook", 
               }, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 38, 
               Key = -1, 
               Direction = "down", 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [7] = "Climb", 
               }, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 37, 
               Key = -1, 
               Direction = "northeast", 
               Flags = 
               {
                  [25] = "Window", 
                  [10] = "NoPassdoor", 
                  [26] = "CanLook", 
               }, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               DestinationVnum = 35, 
               Key = -1, 
               Direction = "northwest", 
               Flags = 
               {
                  [25] = "Window", 
                  [10] = "NoPassdoor", 
                  [26] = "CanLook", 
               }, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This tower is the primary advantage point for the Southern side of the\
Arena killing field. Featuring a thin line, combatants can target others\
who run about on the killing field. A careful sniper would watch the\
fields and below him at all times, to avoid ambush..or even being sniped\
from below.\
\
&RCLIMBing is essential in getting down!&R&W\
", 
      }, 
      [40] = 
      {
         Tag = "", 
         Name = "Northern Sniper Tower Entrance", 
         Vnum = 40, 
         Sector = "inside", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Arguments = "15", 
               ScriptType = "MProg", 
               Code = "mpecho A slow chant floats down to you:  \"Two man enter ... one man leave.\"\
", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 30, 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 41, 
               Key = -1, 
               Direction = "up", 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [7] = "Climb", 
               }, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This large room is the main entrance to the Northern Sniper Tower in the\
Arena. It's a pretty bare room, and has a small set of stairs leading up\
to the main tower supervising a portion of the arena. The lighting is\
quite dim, and the bellowing echoes of the crowd would be quite\
distracting to the untrained fighter. The walls are of thick duratanium,\
and many charred blaster/explosive marks are strewn about the entire room.\
\
&RCLIMBing is essential in getting up!&R&W\
", 
      }, 
      [41] = 
      {
         Tag = "", 
         Name = "Northern Sniper Tower", 
         Vnum = 41, 
         Sector = "inside", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
            [1] = 
            {
               DestinationVnum = 30, 
               Key = -1, 
               Direction = "south", 
               Flags = 
               {
                  [25] = "Window", 
                  [10] = "NoPassdoor", 
                  [26] = "CanLook", 
               }, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               DestinationVnum = 40, 
               Key = -1, 
               Direction = "down", 
               Flags = 
               {
                  [16] = "CanClimb", 
                  [7] = "Climb", 
               }, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               DestinationVnum = 31, 
               Key = -1, 
               Direction = "southeast", 
               Flags = 
               {
                  [25] = "Window", 
                  [10] = "NoPassdoor", 
                  [26] = "CanLook", 
               }, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               DestinationVnum = 29, 
               Key = -1, 
               Direction = "southwest", 
               Flags = 
               {
                  [25] = "Window", 
                  [10] = "NoPassdoor", 
                  [26] = "CanLook", 
               }, 
               Distance = 0, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This tower is the primary advantage point for the Northern side of the\
Arena killing field. Featuring a thin line, combatants can target others\
who run about on the killing field. A careful sniper would watch the\
fields and below him at all times, to avoid ambush..or even being sniped\
from below. \
\
&RCLIMBing is essential in getting down!&R&W\
", 
      }, 
      [42] = 
      {
         Tag = "", 
         Name = "First Combatant's Chamber", 
         Vnum = 42, 
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [10] = "Safe", 
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You stand in a long hallway leading out into the Arena proper.  About\
you are stacked all manner of weaponry and armor.  Choose your armament\
properly, as it will be all that stands between you and death.\
", 
      }, 
      [43] = 
      {
         Tag = "", 
         Name = "Second Combatant's Chamber", 
         Vnum = 43, 
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Exits = 
         {
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You stand in a long hallway leading out into the Arena proper.  About\
you are stacked all manner of weaponry and armor.  Choose your armament\
properly, as it will be all that stands between you and death.\
", 
      }, 
      [44] = 
      {
         Tag = "", 
         Name = "Lost in Space", 
         Vnum = 44, 
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Exits = 
         {
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
      }, 
      [45] = 
      {
         Tag = "", 
         Name = "Limbo Shipyard", 
         Vnum = 45, 
         Sector = "city", 
         TeleVnum = 0, 
         Tunnel = 0, 
         TeleDelay = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [29] = "Spacecraft", 
         }, 
         Exits = 
         {
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "A wet grey mist hangs over this large yard of old an unused vessels.\
Ships of all types and sizes rest here empty and abandoned...\
", 
      }, 
   }, 
   Filename = "core.lua", 
   ResetFrequency = 0, 
   FileFormatVersion = 1, 
   ResetMessage = "&rYour soul burns...", 
}
