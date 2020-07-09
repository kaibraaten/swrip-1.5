-- Tatooine
-- Last saved Thursday 09-Jul-2020 23:21:57

AreaEntry
{
   Name = "Tatooine", 
   LowEconomy = 28606539, 
   LevelRanges = 
   {
      Hard = 
      {
         Low = 0, 
         High = 105, 
      }, 
      Soft = 
      {
         Low = 0, 
         High = 105, 
      }, 
   }, 
   Filename = "tatooine.lua", 
   VnumRanges = 
   {
      Mob = 
      {
         Last = 31999, 
         First = 31500, 
      }, 
      Object = 
      {
         Last = 31999, 
         First = 31500, 
      }, 
      Room = 
      {
         Last = 31999, 
         First = 31500, 
      }, 
   }, 
   Objects = 
   {
      [31500] = 
      {
         Layers = 0, 
         Weight = 1, 
         ItemType = "light", 
         Vnum = 31500, 
         ExtraDescriptions = 
         {
         }, 
         Description = "A candle rests here.", 
         Cost = 0, 
         ShortDescr = "a small white candle", 
         ObjectValues = 
         {
            [1] = 1, 
            [2] = 30, 
            [3] = 1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Affects = 
         {
            [1] = 
            {
               Location = 18, 
               Modifier = 1, 
            }, 
         }, 
         Name = "candle", 
         ActionDescription = "", 
         Flags = 
         {
            [0] = "Glow", 
            [10] = "AntiEvil", 
         }, 
      }, 
      [31501] = 
      {
         Layers = 0, 
         Weight = 3, 
         ItemType = "container", 
         Vnum = 31501, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
            }, 
         }, 
         Description = "A large jar containing a sacred brain lies here. ", 
         Cost = 0, 
         ShortDescr = "a large brain jar with flashing lights", 
         ObjectValues = 
         {
            [1] = 1, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Name = "brain jar", 
         ActionDescription = "", 
         Flags = 
         {
            [0] = "Glow", 
         }, 
      }, 
      [31502] = 
      {
         Layers = 0, 
         Weight = 100, 
         ItemType = "corpse", 
         Vnum = 31502, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "This jawa has been laying here for quite a while as it seems. His skin has\
\13begun decaying and you can see his bones in certain spots.", 
               Keyword = "look jawa", 
            }, 
         }, 
         Description = "A dead Jawa lies motionless on the ground here.", 
         Cost = 0, 
         ShortDescr = "a dead Jawa", 
         Name = "corpse dead Jawa", 
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
      }, 
      [31503] = 
      {
         Layers = 0, 
         Weight = 2, 
         ItemType = "trash", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 31503, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "A large egg with different colors on it lays here. It would probably not be\
\13wise to take it or the mother might get mad.", 
               Keyword = "look egg", 
            }, 
         }, 
         Description = "A large egg lays here, falling over every once in a while.", 
         Cost = 0, 
         ShortDescr = "a large egg", 
         ObjectValues = 
         {
            [1] = 97000, 
            [2] = 10000, 
            [3] = 11000, 
            [4] = 0, 
            [5] = 0, 
            [0] = 100000, 
         }, 
         Affects = 
         {
            [1] = 
            {
               Location = 9, 
               Modifier = 0, 
            }, 
         }, 
         Name = "Egg", 
         ActionDescription = "", 
         Flags = 
         {
            [12] = "NoRemove", 
         }, 
      }, 
      [31504] = 
      {
         Layers = 0, 
         Weight = 1, 
         ItemType = "light", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 31504, 
         ExtraDescriptions = 
         {
         }, 
         Description = "A shiny krayt crystal lays here.", 
         Cost = 0, 
         ShortDescr = "a shiny krayt crystal", 
         Affects = 
         {
            [1] = 
            {
               Location = 17, 
               Modifier = 5, 
            }, 
         }, 
         ObjectValues = 
         {
            [1] = 9000, 
            [2] = 110, 
            [3] = 1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 100000, 
         }, 
         ActionDescription = "", 
         Name = "Shiny krayt crystal", 
      }, 
      [31505] = 
      {
         Layers = 0, 
         Weight = 1, 
         ItemType = "armor", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 31505, 
         ExtraDescriptions = 
         {
         }, 
         Description = "A glowing pearl lays here.", 
         Cost = 0, 
         ShortDescr = "a krayt pearl", 
         ObjectValues = 
         {
            [1] = 2000, 
            [2] = 6000, 
            [3] = 1100, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10000, 
         }, 
         Name = "Pearl", 
         ActionDescription = "", 
         Flags = 
         {
            [0] = "Glow", 
         }, 
      }, 
      [31506] = 
      {
         Layers = 0, 
         Weight = 2, 
         ItemType = "drink_container", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 31506, 
         ExtraDescriptions = 
         {
         }, 
         Description = "A canteen rests here, waiting to be picked up.", 
         Cost = 0, 
         ShortDescr = "a canteen", 
         ObjectValues = 
         {
            [1] = 10, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         ActionDescription = "", 
         Name = "Canteen", 
      }, 
      [31507] = 
      {
         Layers = 0, 
         Weight = 5, 
         ItemType = "drink_container", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 31507, 
         ExtraDescriptions = 
         {
         }, 
         Description = "A jug of water rests here.", 
         Cost = 0, 
         ShortDescr = "a jug of water", 
         ObjectValues = 
         {
            [1] = 15, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 15, 
         }, 
         ActionDescription = "", 
         Name = "jug", 
      }, 
      [31508] = 
      {
         Layers = 0, 
         Weight = 1, 
         ItemType = "circuit", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 31508, 
         ExtraDescriptions = 
         {
         }, 
         Description = "A torn up circuit lies here, waiting to be picked up.", 
         Cost = 0, 
         ShortDescr = "a torn up circuit", 
         ObjectValues = 
         {
            [1] = 1, 
            [2] = 5, 
            [3] = 3, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         ActionDescription = "", 
         Name = "Circuit", 
      }, 
      [31509] = 
      {
         Layers = 0, 
         Weight = 3, 
         ItemType = "armor", 
         Vnum = 31509, 
         ExtraDescriptions = 
         {
         }, 
         Description = "A Jawa robe is here, waiting to be taken.", 
         Cost = 0, 
         ShortDescr = "a dirty Jawa robe", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 1345, 
            [4] = 0, 
            [5] = 0, 
            [0] = 1, 
         }, 
         Affects = 
         {
            [1] = 
            {
               Location = 5, 
               Modifier = 0, 
            }, 
         }, 
         Name = "Jawa Robe", 
         ActionDescription = "", 
         Flags = 
         {
            [0] = "Glow", 
            [18] = "SmallSize", 
         }, 
      }, 
      [31510] = 
      {
         Layers = 0, 
         Weight = 2, 
         ItemType = "trash", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 31510, 
         ExtraDescriptions = 
         {
         }, 
         Description = "Some wire is here, waiting to be taken", 
         Cost = 0, 
         ShortDescr = "some wire", 
         ObjectValues = 
         {
            [1] = 15, 
            [2] = 6, 
            [3] = 11, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         ActionDescription = "", 
         Name = "Wire", 
      }, 
      [31511] = 
      {
         Layers = 0, 
         Weight = 6, 
         ItemType = "weapon", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Vnum = 31511, 
         ExtraDescriptions = 
         {
         }, 
         Description = "A elegant little blaster lays here on the ground.", 
         Cost = 0, 
         ShortDescr = "a Jawa Blaster", 
         Affects = 
         {
            [1] = 
            {
               Location = 18, 
               Modifier = 0, 
            }, 
         }, 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 6, 
            [3] = 6, 
            [4] = 0, 
            [5] = 0, 
            [0] = 7200, 
         }, 
         ActionDescription = "", 
         Name = "Jawa Blaster", 
      }, 
      [31512] = 
      {
         Layers = 0, 
         Weight = 1, 
         ItemType = "armor", 
         WearFlags = 
         {
            [11] = "Waist", 
         }, 
         Vnum = 31512, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "This belt glows and hums with extreme power comming from it. This object cannot be handled by a mortal mind for its powers are to great.", 
               Keyword = "look belt", 
            }, 
         }, 
         Description = "A powerful godly belt lays on the ground here.", 
         Cost = 0, 
         ShortDescr = "Satin's Glimmering Belt.", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = -259084288, 
            [4] = 0, 
            [5] = 0, 
            [0] = 200, 
         }, 
         Affects = 
         {
            [1] = 
            {
               Location = 1, 
               Modifier = 0, 
            }, 
            [2] = 
            {
               Location = 2, 
               Modifier = 10, 
            }, 
            [3] = 
            {
               Location = 3, 
               Modifier = 10, 
            }, 
            [4] = 
            {
               Location = 4, 
               Modifier = 10, 
            }, 
            [5] = 
            {
               Location = 5, 
               Modifier = 10, 
            }, 
            [6] = 
            {
               Location = 9, 
               Modifier = 20, 
            }, 
            [7] = 
            {
               Location = 18, 
               Modifier = 500, 
            }, 
            [8] = 
            {
               Location = 19, 
               Modifier = 500, 
            }, 
            [9] = 
            {
               Location = 19, 
               Modifier = 0, 
            }, 
         }, 
         Name = "Glimmering Belt", 
         ActionDescription = "", 
         Flags = 
         {
            [0] = "Glow", 
         }, 
      }, 
      [31513] = 
      {
         Layers = 0, 
         Weight = 1, 
         ItemType = "treasure", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 31513, 
         ExtraDescriptions = 
         {
         }, 
         Description = "A large stick of the Wise Storyteller lays here.", 
         Cost = 0, 
         ShortDescr = "a large stick", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 17000, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ActionDescription = "", 
         Name = "Stick", 
      }, 
      [31514] = 
      {
         Layers = 0, 
         Weight = 150, 
         ItemType = "furniture", 
         Vnum = 31514, 
         ExtraDescriptions = 
         {
         }, 
         Description = "A large oak desk collects dust on the ground here.", 
         Cost = 0, 
         ShortDescr = "a large oak desk", 
         Name = "large oak desk", 
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
      }, 
      [31515] = 
      {
         Layers = 0, 
         Weight = 4, 
         ItemType = "armor", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 31515, 
         ExtraDescriptions = 
         {
         }, 
         Description = "A mechanics belt lays here waiting to be used.", 
         Cost = 0, 
         ShortDescr = "a mechanics belt", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 1300, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         Affects = 
         {
            [1] = 
            {
               Location = 4, 
               Modifier = 0, 
            }, 
         }, 
         Name = "Belt", 
         ActionDescription = "", 
         Flags = 
         {
            [31] = "HumanSize", 
         }, 
      }, 
      [31516] = 
      {
         Layers = 0, 
         Weight = 2, 
         ItemType = "armor", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 31516, 
         ExtraDescriptions = 
         {
         }, 
         Description = "A mechanics hat collects dust on the ground.", 
         Cost = 0, 
         ShortDescr = "a mechanics hat", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 600, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         Affects = 
         {
            [1] = 
            {
               Location = 2, 
               Modifier = 0, 
            }, 
         }, 
         Name = "Hat", 
         ActionDescription = "", 
         Flags = 
         {
            [31] = "HumanSize", 
         }, 
      }, 
      [31517] = 
      {
         Layers = 0, 
         Weight = 8, 
         ItemType = "weapon", 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Vnum = 31517, 
         ExtraDescriptions = 
         {
         }, 
         Description = "A Jawa ionization gun has been foolishly left behind.", 
         Cost = 0, 
         ShortDescr = "a Jawa ionization gun", 
         ObjectValues = 
         {
            [1] = 6, 
            [2] = 6, 
            [3] = 6, 
            [4] = 1000, 
            [5] = 1000, 
            [0] = 7200, 
         }, 
         ActionDescription = "", 
         Name = "Ionization Gun", 
      }, 
      [31518] = 
      {
         Layers = 0, 
         Weight = 5, 
         ItemType = "key", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 31518, 
         ExtraDescriptions = 
         {
         }, 
         Description = "A small key crafted from hide", 
         Cost = 0, 
         ShortDescr = "a small hide Key", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ActionDescription = "", 
         Name = "key", 
      }, 
      [31519] = 
      {
         Layers = 0, 
         Weight = 900, 
         ItemType = "furniture", 
         Vnum = 31519, 
         ExtraDescriptions = 
         {
         }, 
         Description = "A droid detector is mounted on the wall here.", 
         Cost = 0, 
         ShortDescr = "a droid detector", 
         Name = "Detector", 
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
      }, 
      [31520] = 
      {
         Layers = 0, 
         Weight = 5, 
         ItemType = "furniture", 
         Vnum = 31520, 
         ExtraDescriptions = 
         {
         }, 
         Description = "A large and complex drink machine sits here. It is used by Wuher\
\13to dispense drinks.", 
         Cost = 0, 
         ShortDescr = "a large drink machine", 
         ObjectValues = 
         {
            [1] = 1, 
            [2] = 6, 
            [3] = 11, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         Name = "Drink Machine", 
         ActionDescription = "", 
         Flags = 
         {
            [0] = "Glow", 
         }, 
      }, 
      [31521] = 
      {
         Layers = 0, 
         Weight = 1, 
         ItemType = "trash", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 31521, 
         ExtraDescriptions = 
         {
         }, 
         Description = "A comfortable bed lays here. Maybe laying down would not hurt you.", 
         Cost = 0, 
         ShortDescr = "a bed", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ActionDescription = "", 
         Name = "Bed", 
      }, 
      [31522] = 
      {
         Layers = 0, 
         Weight = 1, 
         ItemType = "food", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 31522, 
         ExtraDescriptions = 
         {
         }, 
         Description = "A bantha rib is here for your enjoyment.", 
         Cost = 10, 
         ShortDescr = "a bantha rib", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 3, 
         }, 
         ActionDescription = "", 
         Name = "Bantha rib", 
      }, 
      [31523] = 
      {
         Layers = 0, 
         Weight = 1, 
         ItemType = "food", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 31523, 
         ExtraDescriptions = 
         {
         }, 
         Description = "A banthaburger site here ready to eat.", 
         Cost = 15, 
         ShortDescr = "a banthaburger", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         ActionDescription = "", 
         Name = "Banthaburger", 
      }, 
      [31524] = 
      {
         Layers = 0, 
         Weight = 1, 
         ItemType = "food", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 31524, 
         ExtraDescriptions = 
         {
         }, 
         Description = "Some grilled womp rat is here ready to be snatched up.", 
         Cost = 16, 
         ShortDescr = "some grilled womp rat", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 4, 
         }, 
         ActionDescription = "", 
         Name = "Grilled Womp Rat", 
      }, 
      [31525] = 
      {
         Layers = 0, 
         Weight = 1, 
         ItemType = "trash", 
         Vnum = 31525, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "This projector creates an illusory wall to the north to keep\
\13this passage hidden.\
\13", 
               Keyword = "hologram projector", 
            }, 
         }, 
         Description = "A hologram projector is here.", 
         Cost = 0, 
         ShortDescr = "a hologram projector", 
         Name = "hologram projector", 
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
      }, 
      [31526] = 
      {
         Layers = 0, 
         Weight = 1, 
         ItemType = "furniture", 
         Vnum = 31526, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "This couch looks very worn out. The seats look like they're made\
\13out of bantha hide, but you can't be sure.\
\13", 
               Keyword = "worn couch", 
            }, 
         }, 
         Description = "A worn couch is here.", 
         Cost = 0, 
         ShortDescr = "a worn couch", 
         Name = "worn couch", 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 3, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 3, 
         }, 
      }, 
      [31527] = 
      {
         Layers = 0, 
         Weight = 1, 
         ItemType = "furniture", 
         Vnum = 31527, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "The seats are very comfortable, allowing even large species like Wookiees to\
stretch their legs.\
", 
               Keyword = "spacious seats", 
            }, 
         }, 
         Description = "Rows of spacious seats fill this section.", 
         Cost = 0, 
         ShortDescr = "spacious seats", 
         Name = "spacious seats", 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 2, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
      }, 
      [31528] = 
      {
         Layers = 0, 
         Weight = 1, 
         ItemType = "furniture", 
         Vnum = 31528, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "The seats are very dirty, as you might expect on Tatooine. There's no room\
to stretch your legs, even if you're a Jawa.\
", 
               Keyword = "cramped seats", 
            }, 
         }, 
         Description = "Cramped seats fill the economy section.", 
         Cost = 0, 
         ShortDescr = "cramped seats", 
         Name = "cramped seats", 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 2, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
      }, 
      [31529] = 
      {
         Layers = 0, 
         Weight = 1, 
         ItemType = "container", 
         Vnum = 31529, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "The refridgerator is an older model, and gives off a fairly loud humming\
noise. It seems quite dirty on the outside. One can only hope it's better\
on the inside.\
", 
               Keyword = "refridgerator fridge", 
            }, 
         }, 
         Description = "A small refridgerator stands in a corner.", 
         Cost = 0, 
         ShortDescr = "a refridgerator", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Code = "-- This script restocks the fridge with a randomly picked item of food\
if otypeinobj(food) < 3\
    macro opoload_one_of 31522 31523 31524\
    mpecho The refridgerator makes a loud humming noise.\
endif\
", 
               Arguments = "100", 
            }, 
         }, 
         Name = "refridgerator fridge", 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 20, 
         }, 
      }, 
      [31530] = 
      {
         Layers = 0, 
         Weight = 1, 
         ItemType = "trash", 
         Vnum = 31530, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "The flower is deep purple. The stalk is about one meter long and has green\
leaves. The pot is white, with specks of dirt on it. The flower looks kind\
of real, but smells very fake.\
", 
               Keyword = "fake flower", 
            }, 
         }, 
         Description = "A large fake flower in a large pot.", 
         Cost = 0, 
         ShortDescr = "a fake flower", 
         Name = "fake flower", 
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
      }, 
      [31531] = 
      {
         Layers = 0, 
         Weight = 1, 
         ItemType = "trash", 
         Vnum = 31531, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "This large machine towers above you for several meters. It have many large\
tubes, valves and gauges. It seems likely that the purpose of this machinery\
is to pump the sewer somewhere, but one can't be sure.\
", 
               Keyword = "mysterious machinery", 
            }, 
         }, 
         Description = "Some mysterious-looking machinery is here, making a lot of noise.", 
         Cost = 0, 
         ShortDescr = "the machinery", 
         Name = "mysterious machinery", 
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
      }, 
      [31532] = 
      {
         Layers = 0, 
         Weight = 1, 
         ItemType = "armor", 
         WearFlags = 
         {
            [0] = "Take", 
            [3] = "Body", 
         }, 
         Vnum = 31532, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "The jumpsuit is blue, and has multiple pockets. It full of oil and dirt, and smells\
pretty bad.\
", 
               Keyword = "jumpsuit", 
            }, 
         }, 
         Description = "A jumpsuit lies neatly folded on the ground.", 
         Cost = 10, 
         ShortDescr = "a jumpsuit", 
         ObjectValues = 
         {
            [1] = 4, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 4, 
         }, 
         ActionDescription = "", 
         Name = "jumpsuit", 
      }, 
      [31533] = 
      {
         Layers = 0, 
         Weight = 1, 
         ItemType = "fabric", 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Vnum = 31533, 
         ExtraDescriptions = 
         {
         }, 
         Description = "Some low-quality rodent skin is lying on the ground.", 
         Cost = 25, 
         ShortDescr = "a low-quality rodent skin", 
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ActionDescription = "", 
         Name = "low-quality rodent skin", 
      }, 
      [31534] = 
      {
         Layers = 0, 
         Weight = 1, 
         ItemType = "furniture", 
         Vnum = 31534, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Description = "The table looks cheap and simple. The table legs are gray and the tabletop is\
white. At least it used to be white. Now it's slightly yellowed and dirty.\
", 
               Keyword = "platic table chairs", 
            }, 
         }, 
         Description = "A plastic table with some chairs is here.", 
         Cost = 0, 
         ShortDescr = "a plastic table", 
         Name = "platic table chairs", 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 1, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 6, 
         }, 
      }, 
      [31535] = 
      {
         Layers = 0, 
         Weight = 1, 
         ItemType = "trash", 
         Vnum = 31535, 
         ExtraDescriptions = 
         {
         }, 
         Description = "A few rusty pipes comes down from the ceiling.", 
         Cost = 0, 
         ShortDescr = "a few rusty pipes", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Code = "mpecho The rusty pipes spew out more sewage into the river.\
", 
               Arguments = "25", 
            }, 
         }, 
         Name = "rusty pipes", 
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
      }, 
      [31999] = 
      {
         Layers = 0, 
         Weight = 1, 
         ItemType = "trash", 
         Vnum = 31999, 
         ExtraDescriptions = 
         {
         }, 
         Description = "Some god dropped a newly created lastobject here.", 
         Cost = 0, 
         ShortDescr = "a newly created lastobject", 
         Name = "lastobject", 
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
      }, 
   }, 
   Mobiles = 
   {
      [31500] = 
      {
         ArmorClass = 0, 
         Sex = "male", 
         Vnum = 31500, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
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
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Height = 0, 
         DamRoll = 0, 
         HitRoll = 0, 
         Name = "monk", 
         Weight = 0, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         Race = "Human", 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
         }, 
         NumberOfAttacks = 0, 
         Level = 22, 
         Credits = 0, 
         Position = "standing", 
         Alignment = 100, 
         DefaultPosition = "standing", 
         LongDescr = "A monk wanders around the palace.\
", 
         Description = "This is a aged monk. He has lived here for many years and has small scars on\
his body.\
", 
         ShortDescr = "a short monk", 
         Flags = 
         {
            [0] = "Npc", 
            [2] = "Scavenger", 
            [6] = "StayArea", 
         }, 
      }, 
      [31501] = 
      {
         ArmorClass = 0, 
         Sex = "male", 
         Vnum = 31501, 
         AffectedBy = 
         {
            [7] = "Sanctuary", 
         }, 
         Shop = 
         {
            KeeperShortDescr = "a large Jawa", 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            ProfitSell = 0, 
            ProfitBuy = 110, 
         }, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "all_greet_prog", 
               Code = "say If you're looking for some goods...\
say ... you've come to the right place.\
", 
               Arguments = "100", 
            }, 
         }, 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
               [17] = "jawaese", 
            }, 
            Speaking = 
            {
               [17] = "jawaese", 
            }, 
         }, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Height = 0, 
         DamRoll = 0, 
         HitRoll = 0, 
         Name = "water jawa", 
         Weight = 0, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         Race = "Human", 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
         }, 
         NumberOfAttacks = 0, 
         Level = 35, 
         Description = "This jawa seems fierce and old. He has a small pouch where he keeps his money\
and change for customers willing to purchase something.\
", 
         Position = "standing", 
         Credits = 30000, 
         Alignment = 111, 
         DefaultPosition = "standing", 
         LongDescr = "A large, mean looking Jawa sits in his chair comfortably here selling liquids for journeys out into the great dune sea.\
", 
         ShortDescr = "a large Jawa", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [6] = "StayArea", 
            [7] = "Wimpy", 
         }, 
      }, 
      [31502] = 
      {
         ArmorClass = -170, 
         Sex = "female", 
         Vnum = 31502, 
         AffectedBy = 
         {
            [7] = "Sanctuary", 
         }, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
            }, 
            Speaking = 
            {
               [17] = "jawaese", 
            }, 
         }, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Height = 0, 
         DamRoll = 0, 
         HitRoll = 0, 
         Name = "Krayt dragon", 
         Weight = 0, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         Race = "Human", 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
         }, 
         NumberOfAttacks = 0, 
         Level = 100, 
         Description = "This ferocious creature is rare but very valuble to many people throughout\
this galaxy. As it eyes you, you wonder what to do.\
", 
         Position = "standing", 
         Credits = 0, 
         Alignment = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A large krayt stands here towering over you, staring you in the eye.\
", 
         ShortDescr = "a large krayt dragon", 
         Flags = 
         {
            [1] = "Sentinel", 
            [2] = "Scavenger", 
            [0] = "Npc", 
            [5] = "Aggressive", 
            [6] = "StayArea", 
         }, 
      }, 
      [31503] = 
      {
         ArmorClass = 97, 
         Sex = "male", 
         Vnum = 31503, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 10, 
            HitSizeDice = 10, 
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
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Height = 0, 
         DamRoll = 0, 
         HitRoll = 0, 
         Name = "womp rat", 
         Weight = 0, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamPlus = 2, 
            DamNoDice = 0, 
         }, 
         Race = "Human", 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
         }, 
         NumberOfAttacks = 0, 
         Level = 1, 
         Credits = 0, 
         Position = "standing", 
         Alignment = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A womp rat hops by.\
", 
         Description = "This creature does not look to be of one of the more appreciated kind.\
", 
         ShortDescr = "a small womp Rat", 
         Flags = 
         {
            [0] = "Npc", 
            [2] = "Scavenger", 
            [6] = "StayArea", 
         }, 
      }, 
      [31504] = 
      {
         ArmorClass = 0, 
         Sex = "male", 
         Vnum = 31504, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         Languages = 
         {
            Speaks = 
            {
               [17] = "jawaese", 
            }, 
            Speaking = 
            {
               [17] = "jawaese", 
            }, 
         }, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Height = 0, 
         DamRoll = 0, 
         HitRoll = 0, 
         Name = "Young Jawa", 
         Weight = 0, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         Race = "Human", 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
         }, 
         NumberOfAttacks = 0, 
         Level = 3, 
         Credits = 0, 
         Position = "standing", 
         Alignment = 115, 
         DefaultPosition = "standing", 
         LongDescr = "A young Jawa walks around here.\
", 
         Description = "This creature is not one of the more respectable species but manages to live\
on its own. This Jawa is a very young and untrained.\
", 
         ShortDescr = "a young Jawa", 
         Flags = 
         {
            [0] = "Npc", 
            [2] = "Scavenger", 
            [6] = "StayArea", 
         }, 
      }, 
      [31505] = 
      {
         ArmorClass = 0, 
         Sex = "male", 
         Vnum = 31505, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
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
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Height = 0, 
         DamRoll = 0, 
         HitRoll = 0, 
         Name = "jawa guard", 
         Weight = 0, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         Race = "Human", 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
         }, 
         NumberOfAttacks = 0, 
         Level = 25, 
         Credits = 0, 
         Position = "standing", 
         Alignment = 150, 
         DefaultPosition = "standing", 
         LongDescr = "The Jawa guard stands here guarding something.\
", 
         Description = "This is not a regular filthy creature. This Jawa is trained and armed to the\
teeth. Consider it before you attack him.\
", 
         ShortDescr = "a Jawa guard", 
         Flags = 
         {
            [1] = "Sentinel", 
            [2] = "Scavenger", 
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
      }, 
      [31506] = 
      {
         ArmorClass = 0, 
         Sex = "male", 
         Vnum = 31506, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
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
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Height = 0, 
         DamRoll = 0, 
         HitRoll = 0, 
         Name = "Scavenger", 
         Weight = 0, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         Race = "Human", 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
         }, 
         NumberOfAttacks = 0, 
         Level = 3, 
         Credits = 0, 
         Position = "standing", 
         Alignment = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A scavenger walks around here picking up anything he can see.\
", 
         Description = "This scavenger is a small animal whom which no attention is regarded.\
", 
         ShortDescr = "a scavenger", 
         Flags = 
         {
            [0] = "Npc", 
            [2] = "Scavenger", 
            [6] = "StayArea", 
         }, 
      }, 
      [31507] = 
      {
         ArmorClass = 0, 
         Sex = "male", 
         Vnum = 31507, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
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
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Height = 0, 
         DamRoll = 0, 
         HitRoll = 0, 
         Name = "Moisture Farmer", 
         Weight = 0, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         Race = "Human", 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
         }, 
         NumberOfAttacks = 0, 
         Level = 9, 
         Credits = 0, 
         Position = "standing", 
         Alignment = 140, 
         DefaultPosition = "standing", 
         LongDescr = "A moisture farmer walks around here, trying to find his destination.\
", 
         Description = "You are looking at one of the ancestors of this planet. They have been here\
ever since the Dowager Queen crashed into the planet.\
", 
         ShortDescr = "a moisture farmer", 
         Flags = 
         {
            [0] = "Npc", 
            [2] = "Scavenger", 
            [6] = "StayArea", 
         }, 
      }, 
      [31508] = 
      {
         ArmorClass = 0, 
         Sex = "undistinguished", 
         Vnum = 31508, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
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
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Height = 0, 
         DamRoll = 0, 
         HitRoll = 0, 
         Name = "Power droid", 
         Weight = 0, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         Race = "Human", 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
         }, 
         NumberOfAttacks = 0, 
         Level = 8, 
         Credits = 0, 
         Position = "standing", 
         Alignment = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A power droid moves around on the ground here, humming.\
", 
         Description = "This power droid is rather old and has been used for many different purposes\
over the years of its existence. Although it is still functional it is almost\
ready to be trashed. Small wires and shorted connections are sprawled out on\
different parts of the droids surface.\
", 
         ShortDescr = "a square power droid", 
         Flags = 
         {
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
      }, 
      [31509] = 
      {
         ArmorClass = 0, 
         Sex = "undistinguished", 
         Vnum = 31509, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
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
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Height = 0, 
         DamRoll = 0, 
         HitRoll = 0, 
         Name = "Astromech droid.", 
         Weight = 0, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         Race = "Human", 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
         }, 
         NumberOfAttacks = 0, 
         Level = 15, 
         Credits = 0, 
         Position = "standing", 
         Alignment = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A small astromech droid stands around here chirping away.\
", 
         Description = "This droid, when speaking, makes no sense to you. Throught its beeps and\
sounds its trying to say something to you but you have no clue what. This\
droid seems to have been used before but is in excellent shape.\
", 
         ShortDescr = "an astromech droid", 
         Flags = 
         {
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
      }, 
      [31510] = 
      {
         ArmorClass = 0, 
         Sex = "undistinguished", 
         Vnum = 31510, 
         AffectedBy = 
         {
            [7] = "Sanctuary", 
         }, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
               [17] = "jawaese", 
            }, 
            Speaking = 
            {
               [17] = "jawaese", 
            }, 
         }, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Height = 0, 
         LongDescr = "A wise Jawa stands here ready to teach you skills.\
", 
         DamRoll = 0, 
         HitRoll = 0, 
         Name = "Wise Jawa", 
         Weight = 0, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         Race = "Human", 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
         }, 
         NumberOfAttacks = 0, 
         Level = 45, 
         Description = "This Jawa has studied the ways of this world for many years, and if you pay\
attention can teach you may things of many uses. Be careful not to attack him\
for he has great powers.\
", 
         Position = "standing", 
         Credits = 0, 
         Alignment = 210, 
         DefaultPosition = "standing", 
         VipFlags = 
         {
            [8] = "Tatooine", 
         }, 
         ShortDescr = "a wise Jawa", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [9] = "Train", 
            [6] = "StayArea", 
         }, 
      }, 
      [31511] = 
      {
         ArmorClass = 0, 
         Sex = "male", 
         Vnum = 31511, 
         AffectedBy = 
         {
            [7] = "Sanctuary", 
         }, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "speech_prog", 
               Code = "mpechoat $n The guard ushers you into the chamber.\
mpechoaround $n The guard ushers $n into the chamber.\
mptransfer $n 31838\
mpat $n mpechoaround $n $n is ushered into the chamber.\
", 
               Arguments = "p yes", 
            }, 
            [2] = 
            {
               MudProgType = "act_prog", 
               Code = "say Welcome! Are you ready to learn young apprentice?\
", 
               Arguments = "p arrives from the west.", 
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
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Height = 0, 
         DamRoll = 0, 
         HitRoll = 0, 
         Name = "Guardian", 
         Weight = 0, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         Race = "Human", 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
         }, 
         NumberOfAttacks = 0, 
         Level = 40, 
         Description = "This is no mere guard. He too has developed many skills and is powerful. You\
should consider attacking him, wisely.\
", 
         Position = "standing", 
         Credits = 0, 
         Alignment = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A guardian stands here watching over The Wise One.\
", 
         ShortDescr = "a guardian", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
      }, 
      [31512] = 
      {
         ArmorClass = 0, 
         Sex = "male", 
         Vnum = 31512, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "all_greet_prog", 
               Code = "snarl\
swear $n\
", 
               Arguments = "70", 
            }, 
         }, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
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
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Height = 0, 
         Description = "This species has adapted to the ways of living in the desert. He is strong in\
mind and is very vicious. Be careful what you do.\
", 
         DamRoll = 0, 
         HitRoll = 0, 
         Name = "Sand person tusken raider", 
         Weight = 0, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         Race = "Human", 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
         }, 
         NumberOfAttacks = 0, 
         Level = 23, 
         Credits = 0, 
         Position = "standing", 
         Alignment = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A Tusken Rauder watches you waiting for the right moment to attack.\
", 
         VipFlags = 
         {
            [8] = "Tatooine", 
         }, 
         ShortDescr = "a Tusken Raider", 
         Flags = 
         {
            [0] = "Npc", 
            [5] = "Aggressive", 
            [2] = "Scavenger", 
            [6] = "StayArea", 
         }, 
      }, 
      [31513] = 
      {
         ArmorClass = 0, 
         Sex = "male", 
         Vnum = 31513, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
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
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Height = 0, 
         DamRoll = 0, 
         HitRoll = 0, 
         Name = "Sand people tusken raider Storyteller.", 
         Weight = 0, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         Race = "Human", 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
         }, 
         NumberOfAttacks = 0, 
         Level = 30, 
         Credits = 0, 
         Position = "standing", 
         Alignment = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A Wise Tusken Raider sits here telling a story.\
", 
         Description = "This Tusken Raider has survived years of training and memory. To become what\
he is he cannot make any mistakes or alter in any way a story told from the\
past or he will be killed, for the Sand People believe that once told a story\
can never be altered in any way.\
", 
         ShortDescr = "a Tusken Raider storyteller.", 
         Flags = 
         {
            [0] = "Npc", 
            [2] = "Scavenger", 
            [6] = "StayArea", 
         }, 
      }, 
      [31514] = 
      {
         ArmorClass = 0, 
         Sex = "male", 
         Vnum = 31514, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
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
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Height = 0, 
         DamRoll = 0, 
         HitRoll = 0, 
         Name = "Storyteller training.", 
         Weight = 0, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         Race = "Human", 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
         }, 
         NumberOfAttacks = 0, 
         Level = 25, 
         Credits = 0, 
         Position = "standing", 
         Alignment = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A storyteller in training listens carefully here so that he may remember every story with precision and awe.      \
", 
         Description = "This is one of the younger, wiser Sand People. He is being trained to become\
the next Storyteller of the Sand People. He just hopes in his mind that he\
will remember and remember well every story precisely.\
", 
         ShortDescr = "a storyteller in training", 
         Flags = 
         {
            [0] = "Npc", 
            [2] = "Scavenger", 
            [6] = "StayArea", 
         }, 
      }, 
      [31515] = 
      {
         ArmorClass = 0, 
         Sex = "male", 
         Vnum = 31515, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
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
            }, 
         }, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Height = 0, 
         DamRoll = 0, 
         HitRoll = 0, 
         Name = "Ronto", 
         Weight = 0, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         Race = "Human", 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
         }, 
         NumberOfAttacks = 0, 
         Level = 45, 
         Credits = 0, 
         Position = "standing", 
         Alignment = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A ronto stands here towering over you.\
", 
         Description = "This creature is rather tame but when provoked can be aggressive and\
dangerous. Watch your step.\
", 
         ShortDescr = "a ronto", 
         Flags = 
         {
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
      }, 
      [31516] = 
      {
         ArmorClass = 0, 
         Sex = "male", 
         Vnum = 31516, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
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
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Height = 0, 
         DamRoll = 0, 
         HitRoll = 0, 
         Name = "Bantha", 
         Weight = 0, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         Race = "Human", 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
         }, 
         NumberOfAttacks = 0, 
         Level = 35, 
         Credits = 0, 
         Position = "standing", 
         Alignment = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A bantha walks around here slowly, waiting for its master.\
", 
         Description = "This is a large furry creature which is rumored to have crushed people with\
one step. Be careful for he does not like people who are not his master.\
", 
         ShortDescr = "a bantha", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [5] = "Aggressive", 
            [6] = "StayArea", 
         }, 
      }, 
      [31517] = 
      {
         ArmorClass = 0, 
         Sex = "male", 
         Vnum = 31517, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "all_greet_prog", 
               Code = "say So ya need something fixed, eh?\
", 
               Arguments = "100", 
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
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Height = 0, 
         DamRoll = 0, 
         HitRoll = 0, 
         Name = "Mechanic", 
         Weight = 0, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         Race = "Human", 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
         }, 
         NumberOfAttacks = 0, 
         Level = 14, 
         Credits = 0, 
         Position = "standing", 
         Alignment = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A mechanic waits here to be hired.\
", 
         Description = "This mechanic is rather young, he has marks and wrinkles from work and\
possibly war. He seems to be calm and will stay away from you unless you\
need something which he may sometimes have.\
", 
         ShortDescr = "a mechanic", 
         Flags = 
         {
            [1] = "Sentinel", 
            [2] = "Scavenger", 
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
      }, 
      [31518] = 
      {
         ArmorClass = 0, 
         Sex = "male", 
         Vnum = 31518, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "all_greet_prog", 
               Code = "say So...\
say You're interested in rontos, eh?\
nudge $n\
", 
               Arguments = "100", 
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
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Height = 0, 
         DamRoll = 0, 
         HitRoll = 0, 
         Name = "tall jawa", 
         Weight = 0, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         Race = "Human", 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
         }, 
         NumberOfAttacks = 0, 
         Level = 19, 
         Credits = 0, 
         Position = "standing", 
         Alignment = 140, 
         DefaultPosition = "standing", 
         LongDescr = "A tall jawa stands here protecting his Rontos.\
", 
         Description = "This Jawa is probably the tallest Jawa ever. Although he is still smaller than\
you he looks tough, and with that gun I would be scared.\
", 
         ShortDescr = "a tall Jawa", 
         Flags = 
         {
            [1] = "Sentinel", 
            [2] = "Scavenger", 
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
      }, 
      [31519] = 
      {
         ArmorClass = 0, 
         Sex = "male", 
         Vnum = 31519, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         Shop = 
         {
            KeeperShortDescr = "Wuher", 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            BusinessHours = 
            {
               Open = 1, 
               Close = 23, 
            }, 
            ProfitSell = 100, 
            ProfitBuy = 105, 
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
               [17] = "jawaese", 
            }, 
         }, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Height = 0, 
         DamRoll = 0, 
         HitRoll = 0, 
         Name = "Wuher", 
         Weight = 0, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         Race = "Human", 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
         }, 
         NumberOfAttacks = 0, 
         Level = 65, 
         Credits = 0, 
         Position = "standing", 
         Alignment = 0, 
         DefaultPosition = "standing", 
         LongDescr = "Wuher stands here serving people their drinks.\
", 
         Description = "This man is rather old and has been working here for many years as bartender.\
Be careful though, he still has his same old edge.\
", 
         ShortDescr = "Wuher", 
         Flags = 
         {
            [1] = "Sentinel", 
            [2] = "Scavenger", 
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
      }, 
      [31520] = 
      {
         ArmorClass = 0, 
         Sex = "undistinguished", 
         Vnum = 31520, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         Languages = 
         {
            Speaks = 
            {
               [17] = "jawaese", 
            }, 
            Speaking = 
            {
               [17] = "jawaese", 
            }, 
         }, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Height = 0, 
         DamRoll = 0, 
         HitRoll = 0, 
         Name = "small Womp Rat", 
         Weight = 0, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         Race = "Jawa", 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
         }, 
         NumberOfAttacks = 0, 
         Level = 0, 
         Credits = 0, 
         Position = "standing", 
         Alignment = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A small womp rat walks around here.\
", 
         Description = "A small womp rat walk around here seeking shelter.\
", 
         ShortDescr = "a small womp rat", 
         Flags = 
         {
            [0] = "Npc", 
            [24] = "NoAssist", 
         }, 
      }, 
      [31521] = 
      {
         ArmorClass = 0, 
         Sex = "undistinguished", 
         Vnum = 31521, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
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
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Height = 0, 
         AttackFlags = 
         {
            [5] = "kick", 
         }, 
         DamRoll = 0, 
         HitRoll = 0, 
         Name = "Small Thief", 
         Weight = 0, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         Race = "Human", 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
         }, 
         NumberOfAttacks = 0, 
         Level = 9, 
         Credits = 0, 
         Position = "standing", 
         Alignment = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A small thief Walks about trying to pick your pocket.\
", 
         Description = "", 
         ShortDescr = "a small thief", 
         Flags = 
         {
            [0] = "Npc", 
            [24] = "NoAssist", 
         }, 
      }, 
      [31522] = 
      {
         ArmorClass = 0, 
         Sex = "undistinguished", 
         Vnum = 31522, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
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
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Height = 0, 
         AttackFlags = 
         {
            [4] = "punch", 
         }, 
         DamRoll = 0, 
         HitRoll = 0, 
         Name = "Large thief", 
         Weight = 0, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         Race = "Human", 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
         }, 
         NumberOfAttacks = 0, 
         Level = 11, 
         Credits = 0, 
         Position = "standing", 
         Alignment = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A large thief walks about here.\
", 
         Description = "", 
         ShortDescr = "a large thief", 
         Flags = 
         {
            [0] = "Npc", 
            [24] = "NoAssist", 
         }, 
      }, 
      [31523] = 
      {
         ArmorClass = 0, 
         Sex = "undistinguished", 
         Vnum = 31523, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Code = "Steal credits $n\
", 
               Arguments = "35", 
            }, 
         }, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
               [17] = "jawaese", 
            }, 
            Speaking = 
            {
               [17] = "jawaese", 
            }, 
         }, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Height = 0, 
         AttackFlags = 
         {
            [4] = "punch", 
         }, 
         DamRoll = 0, 
         HitRoll = 0, 
         Name = "skillful thief", 
         Weight = 0, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         Race = "Human", 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
         }, 
         NumberOfAttacks = 0, 
         Level = 17, 
         Credits = 0, 
         Position = "standing", 
         Alignment = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A skillful thief walks about here.\
", 
         Description = "", 
         ShortDescr = "a skillful thief", 
         Flags = 
         {
            [0] = "Npc", 
            [24] = "NoAssist", 
         }, 
      }, 
      [31524] = 
      {
         ArmorClass = 0, 
         Sex = "undistinguished", 
         Vnum = 31524, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
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
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Height = 0, 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         DamRoll = 0, 
         HitRoll = 0, 
         Name = "Smuggler", 
         Weight = 0, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         Race = "Human", 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
         }, 
         NumberOfAttacks = 0, 
         Level = 18, 
         Credits = 0, 
         Position = "standing", 
         Alignment = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A smuggler sits at a table watching.\
", 
         Description = "", 
         ShortDescr = "a smuggler", 
         Flags = 
         {
            [0] = "Npc", 
            [24] = "NoAssist", 
         }, 
      }, 
      [31525] = 
      {
         ArmorClass = 0, 
         Sex = "undistinguished", 
         Vnum = 31525, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
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
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Height = 0, 
         AttackFlags = 
         {
            [5] = "kick", 
            [6] = "_06", 
            [9] = "_09", 
         }, 
         DamRoll = 0, 
         HitRoll = 0, 
         Name = "Experienced Smuggler", 
         Weight = 0, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         Race = "Human", 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
         }, 
         NumberOfAttacks = 0, 
         Level = 26, 
         Credits = 0, 
         Position = "standing", 
         Alignment = 0, 
         DefaultPosition = "standing", 
         LongDescr = "An experienced smuggler waits for his contact here.\
", 
         Description = "", 
         ShortDescr = "an experienced smuggler", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
      }, 
      [31526] = 
      {
         ArmorClass = 0, 
         Sex = "undistinguished", 
         Vnum = 31526, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
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
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Height = 0, 
         AttackFlags = 
         {
            [6] = "_06", 
            [5] = "kick", 
         }, 
         DamRoll = 0, 
         HitRoll = 0, 
         Name = "Ithorian", 
         Weight = 0, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         Race = "Human", 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
         }, 
         NumberOfAttacks = 0, 
         Level = 14, 
         Credits = 0, 
         Position = "standing", 
         Alignment = 0, 
         DefaultPosition = "standing", 
         LongDescr = "An Ithorian drinks his liquors here.\
", 
         Description = "", 
         ShortDescr = "an Ithorian", 
         Flags = 
         {
            [0] = "Npc", 
            [24] = "NoAssist", 
         }, 
      }, 
      [31527] = 
      {
         ArmorClass = 0, 
         Sex = "undistinguished", 
         Vnum = 31527, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
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
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Height = 0, 
         DamRoll = 0, 
         HitRoll = 0, 
         Name = "Female citizen", 
         Weight = 0, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         Race = "Human", 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
         }, 
         NumberOfAttacks = 0, 
         Level = 6, 
         Credits = 0, 
         Position = "standing", 
         Alignment = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A female citizen minds her own buisness here.\
", 
         Description = "", 
         ShortDescr = "a female citizen", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
      }, 
      [31528] = 
      {
         ArmorClass = 0, 
         Sex = "undistinguished", 
         Vnum = 31528, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
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
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Height = 0, 
         DamRoll = 0, 
         HitRoll = 0, 
         Name = "Male citizen", 
         Weight = 0, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         Race = "Human", 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
         }, 
         NumberOfAttacks = 0, 
         Level = 13, 
         Credits = 0, 
         Position = "standing", 
         Alignment = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A male citizen walks around here.\
", 
         Description = "", 
         ShortDescr = "a male citizen", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
      }, 
      [31529] = 
      {
         ArmorClass = 0, 
         Sex = "undistinguished", 
         Vnum = 31529, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
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
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Height = 0, 
         DamRoll = 0, 
         HitRoll = 0, 
         Name = "Rodian", 
         Weight = 0, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         Race = "Human", 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
         }, 
         NumberOfAttacks = 0, 
         Level = 9, 
         Credits = 0, 
         Position = "standing", 
         Alignment = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A Rodian sits here contemplating his navel.\
", 
         Description = "", 
         ShortDescr = "a Rodian", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
      }, 
      [31530] = 
      {
         ArmorClass = 0, 
         Sex = "undistinguished", 
         Vnum = 31530, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "fight_prog", 
               Code = "mpforce $n remove rifle\
mpforce $n give rifle merth\
mpinvis\
flee\
mpinvis\
feel heal merth\
feel heal merth\
feel heal merth\
wield blaster\
", 
               Arguments = "100", 
            }, 
         }, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
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
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Height = 0, 
         AttackFlags = 
         {
            [9] = "_09", 
            [5] = "kick", 
         }, 
         DamRoll = 0, 
         HitRoll = 0, 
         Name = "Merth", 
         Weight = 0, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         Race = "Human", 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
         }, 
         NumberOfAttacks = 0, 
         Level = 103, 
         Credits = 0, 
         Position = "standing", 
         Alignment = 0, 
         DefaultPosition = "standing", 
         LongDescr = "Merth walks around here.\
", 
         Description = "", 
         ShortDescr = "Merth", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
      }, 
      [31531] = 
      {
         ArmorClass = 20, 
         Sex = "undistinguished", 
         Vnum = 31531, 
         Shop = 
         {
            KeeperShortDescr = "Wioslea", 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            BusinessHours = 
            {
               Open = 1, 
               Close = 23, 
            }, 
            ProfitSell = 0, 
            ProfitBuy = 120, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "all_greet_prog", 
               Code = "say Business is bad, get outta here!\
grin\
", 
               Arguments = "100", 
            }, 
         }, 
         HitChance = 
         {
            HitNoDice = 6, 
            HitPlus = 320, 
            HitSizeDice = 10, 
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
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Height = 0, 
         Description = "", 
         DamRoll = 6, 
         HitRoll = 6, 
         Name = "Wioslea", 
         Weight = 0, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamPlus = 2, 
            DamNoDice = 3, 
         }, 
         Race = "Human", 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
         }, 
         NumberOfAttacks = 0, 
         Level = 32, 
         Credits = 0, 
         Position = "standing", 
         Alignment = 0, 
         DefaultPosition = "standing", 
         LongDescr = "Wioslea tends to her customers need.\
", 
         VipFlags = 
         {
            [8] = "Tatooine", 
         }, 
         ShortDescr = "Wioslea", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
      }, 
      [31532] = 
      {
         ArmorClass = 0, 
         Sex = "undistinguished", 
         Vnum = 31532, 
         Shop = 
         {
            KeeperShortDescr = "Gep", 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            BusinessHours = 
            {
               Open = 1, 
               Close = 23, 
            }, 
            ProfitSell = 100, 
            ProfitBuy = 110, 
         }, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "all_greet_prog", 
               Code = "say Hello customer.\
say I have everything you need just type \"list\".\
", 
               Arguments = "100", 
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
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Height = 0, 
         DamRoll = 0, 
         HitRoll = 0, 
         Name = "Gep", 
         Weight = 0, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         Race = "Human", 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
         }, 
         NumberOfAttacks = 0, 
         Level = 1, 
         Credits = 0, 
         Position = "standing", 
         Alignment = 0, 
         DefaultPosition = "standing", 
         LongDescr = "Gep Stands here selling you food for your travels.\
", 
         Description = "", 
         ShortDescr = "Gep", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
      }, 
      [31533] = 
      {
         ArmorClass = 50, 
         Sex = "male", 
         Vnum = 31533, 
         HitChance = 
         {
            HitNoDice = 4, 
            HitPlus = 200, 
            HitSizeDice = 10, 
         }, 
         Languages = 
         {
            Speaks = 
            {
               [0] = "basic", 
               [25] = "sullustese", 
            }, 
            Speaking = 
            {
               [0] = "basic", 
            }, 
         }, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Height = 0, 
         DamRoll = 4, 
         HitRoll = 4, 
         Name = "Sullustan pump mechanic", 
         Weight = 0, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamPlus = 2, 
            DamNoDice = 2, 
         }, 
         Race = "Sullustan", 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
         }, 
         NumberOfAttacks = 0, 
         Level = 20, 
         Credits = 200, 
         Position = "standing", 
         Alignment = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A Sullustan pump maintenance mechanic seems to be goofing off here.\
", 
         Description = "Taller than most Sullustans, the pump maintenance mechanic appears to be\
in decent shape. His ears is also larger than usual, and his eyes are dark\
and gleaming.\
", 
         ShortDescr = "a pump mechanic", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
      }, 
      [31534] = 
      {
         ArmorClass = 50, 
         Sex = "undistinguished", 
         Vnum = 31534, 
         HitChance = 
         {
            HitNoDice = 4, 
            HitPlus = 200, 
            HitSizeDice = 10, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "death_prog", 
               Code = "-- Drop loot on death\
if rand(50)\
    -- Low-quality rodent skin\
    mpoload 31533\
endif\
", 
               Arguments = "100", 
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
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Height = 0, 
         DamRoll = 4, 
         HitRoll = 4, 
         Name = "tatoo-rat", 
         Weight = 0, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamPlus = 2, 
            DamNoDice = 2, 
         }, 
         Race = "Rodent", 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
         }, 
         NumberOfAttacks = 0, 
         Level = 20, 
         Credits = 0, 
         Position = "standing", 
         Alignment = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A tatoo-rat seems to be searching for food.\
", 
         Description = "A tatoo-rat is a small rodent with brown fur and a long tail.\
", 
         ShortDescr = "a tatoo-rat", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
      }, 
      [31535] = 
      {
         ArmorClass = -150, 
         Sex = "male", 
         Vnum = 31535, 
         HitChance = 
         {
            HitNoDice = 20, 
            HitPlus = 20000, 
            HitSizeDice = 10, 
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
               [19] = "adarese", 
               [20] = "verpine", 
               [21] = "defel", 
               [22] = "dosh", 
               [23] = "chadra-fan", 
               [24] = "quarrenese", 
               [25] = "sullustese", 
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
               [0] = "basic", 
            }, 
         }, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Height = 0, 
         DamRoll = 20, 
         HitRoll = 20, 
         Name = "retired merc", 
         Weight = 0, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamPlus = 2, 
            DamNoDice = 10, 
         }, 
         Race = "Human", 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Constitution = 25, 
            Intelligence = 10, 
            Dexterity = 25, 
            Strength = 25, 
         }, 
         NumberOfAttacks = 0, 
         Level = 100, 
         Credits = 0, 
         Position = "standing", 
         Alignment = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A retired merc is here, eager to teach the next generation.\
", 
         Description = "", 
         ShortDescr = "a retired merc", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [10] = "Practice", 
            [30] = "Prototype", 
            [9] = "Train", 
         }, 
      }, 
      [31536] = 
      {
         ArmorClass = -150, 
         Sex = "male", 
         Vnum = 31536, 
         HitChance = 
         {
            HitNoDice = 20, 
            HitPlus = 20000, 
            HitSizeDice = 10, 
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
               [19] = "adarese", 
               [20] = "verpine", 
               [21] = "defel", 
               [22] = "dosh", 
               [23] = "chadra-fan", 
               [24] = "quarrenese", 
               [25] = "sullustese", 
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
               [0] = "basic", 
            }, 
         }, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Height = 0, 
         DamRoll = 20, 
         HitRoll = 20, 
         Name = "experienced zabrak engineer", 
         Weight = 0, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamPlus = 2, 
            DamNoDice = 10, 
         }, 
         Race = "Zabrak", 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Constitution = 10, 
            Intelligence = 25, 
            Dexterity = 10, 
            Strength = 10, 
         }, 
         NumberOfAttacks = 0, 
         Level = 100, 
         Credits = 0, 
         Position = "standing", 
         Alignment = 0, 
         DefaultPosition = "standing", 
         LongDescr = "An experienced zabrak engineer teaches basic engineering skills.\
", 
         Description = "", 
         ShortDescr = "an experienced zabrak engineer", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [10] = "Practice", 
            [30] = "Prototype", 
            [9] = "Train", 
         }, 
      }, 
      [31537] = 
      {
         ArmorClass = -150, 
         Sex = "male", 
         Vnum = 31537, 
         HitChance = 
         {
            HitNoDice = 20, 
            HitPlus = 20000, 
            HitSizeDice = 10, 
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
               [19] = "adarese", 
               [20] = "verpine", 
               [21] = "defel", 
               [22] = "dosh", 
               [23] = "chadra-fan", 
               [24] = "quarrenese", 
               [25] = "sullustese", 
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
               [0] = "basic", 
            }, 
         }, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Height = 0, 
         DamRoll = 20, 
         HitRoll = 20, 
         Name = "Mayor Mikdanyell Guh'rantt", 
         Weight = 0, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamPlus = 2, 
            DamNoDice = 10, 
         }, 
         Race = "Rodian", 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 25, 
            Wisdom = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
         }, 
         NumberOfAttacks = 0, 
         Level = 100, 
         Credits = 0, 
         Position = "standing", 
         Alignment = 0, 
         DefaultPosition = "standing", 
         LongDescr = "Mayor Mikdanyell Guh'rantt is here.\
", 
         Description = "", 
         ShortDescr = "Mayor Mikdanyell Guh'rantt", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [10] = "Practice", 
            [30] = "Prototype", 
            [9] = "Train", 
         }, 
      }, 
      [31900] = 
      {
         ArmorClass = -150, 
         Sex = "male", 
         Vnum = 31900, 
         Shop = 
         {
            KeeperShortDescr = "Zim the Failed Jedi", 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
            BusinessHours = 
            {
               Open = 0, 
               Close = 23, 
            }, 
            ProfitSell = 90, 
            ProfitBuy = 120, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Code = "if rand(33)\
    hiccup\
elif rand(50)\
    say Where did I put that bottle?\
else\
    mutter\
endif\
", 
               Arguments = "3", 
            }, 
            [2] = 
            {
               MudProgType = "all_greet_prog", 
               Code = "if ispc($n)\
if isjedi($n)\
  if level($n) >= 25\
    say There isn't much more I can teach you, $n. Find Obi-Wan Kenobi.\
    say I hear he's hiding somewhere out in the desert. I never managed to find him myself, though.\
  else\
    if rand(25)\
      say Did you know I sell practice lightsabers? I make them myself, you know.\
      emote beams proudly\
    else\
      say Why did you come here? To learn?\
      say Maybe I can teach you some basics, even if I never completed my own training.\
    endif\
  endif\
else\
  mpechoat $n $I looks you over disapprovingly.\
endif\
endif\
", 
               Arguments = "100", 
            }, 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         HitChance = 
         {
            HitNoDice = 20, 
            HitPlus = 15000, 
            HitSizeDice = 10, 
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
               [19] = "adarese", 
               [20] = "verpine", 
               [21] = "defel", 
               [22] = "dosh", 
               [23] = "chadra-fan", 
               [24] = "quarrenese", 
               [25] = "sullustese", 
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
               [0] = "basic", 
            }, 
         }, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Height = 0, 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         DamRoll = 20, 
         HitRoll = 20, 
         Name = "zim failed jedi", 
         Weight = 0, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamPlus = 2, 
            DamNoDice = 10, 
         }, 
         Race = "Human", 
         Stats = 
         {
            Force = 20, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 25, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
         }, 
         NumberOfAttacks = 0, 
         Level = 100, 
         Credits = 0, 
         Position = "standing", 
         Alignment = 0, 
         DefaultPosition = "standing", 
         LongDescr = "Zim the Failed Jedi stands here before you.\
", 
         Description = "Zim is a middle-aged male human with silvery stripes in his dark brown hair.\
His stomach is bulging over a leather belt that has a lightsaber hanging from\
it. \
\
In his younger days, during the Clone Wars, he was an apprentice to a minor\
Jedi Master. Unfortunately Zim never quite had the talent to pass the Jedi\
trials, and when Order 66 was issued, he was somehow overlooked. Since then\
he's been in hiding, seeking to pass on what little he learned. \
", 
         ShortDescr = "Zim the Failed Jedi", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [10] = "Practice", 
            [30] = "Prototype", 
            [9] = "Train", 
         }, 
      }, 
      [31902] = 
      {
         ArmorClass = 0, 
         Sex = "male", 
         Vnum = 31902, 
         HitChance = 
         {
            HitNoDice = 10, 
            HitPlus = 0, 
            HitSizeDice = 100, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "greet_prog", 
               Code = "-- Kitchen duty\
if inroom($i) == 31901\
    mpechoat $n $I looks at you with weary eyes.\
    mpechoaround $n $I looks at $n with weary eyes.\
    say I really hate kitchen duty.\
    sigh\
endif\
\
-- In common room, pretending to do his chores\
if inroom($i) == 31900\
    mpechoat $n Upon seeing you, $I grabs a broom and pretends $j was doing $l chores.\
endif\
\
-- Trying to assemble a lightsaber, and failing miserably\
if inroom($i) == 31906\
    mpecho $I seems to be on the verge of crying as $j fails assembling a lightsaber.\
endif\
\
-- In sleeping quarters\
if inroom($i) == 31903\
    yawn\
endif\
", 
               Arguments = "100", 
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
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Height = 0, 
         DamRoll = 0, 
         HitRoll = 0, 
         Name = "disillusioned student", 
         Weight = 0, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         Race = "Human", 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
         }, 
         NumberOfAttacks = 0, 
         Level = 1, 
         Credits = 0, 
         Position = "standing", 
         Alignment = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A disillusioned student is doing chores.\
", 
         Description = "", 
         ShortDescr = "a disillusioned student", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
      }, 
      [31901] = 
      {
         ArmorClass = 50, 
         Sex = "male", 
         Vnum = 31901, 
         HitChance = 
         {
            HitNoDice = 4, 
            HitPlus = 10000, 
            HitSizeDice = 10, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "speech_prog", 
               Code = "if knowsskill($n) == grip\
    if isfight($i)\
        say En guarde!\
        disarm\
    else\
        say We need to be fighting first.\
    endif\
else\
    say You'd better learn the GRIP skill first.\
endif\
", 
               Arguments = "p disarm me", 
            }, 
            [2] = 
            {
               MudProgType = "all_greet_prog", 
               Code = "if ispc($n)\
say Welcome, I'm your sparring partner today.\
\
if knowsskill($n) == disarm\
    say You can practice your disarm skill on me. I'll fetch a new 'saber when needed.\
endif\
\
if knowsskill($n) == grip\
    say If your want to practice your grip skill, I can try disarming you when you say DISARM ME.\
endif\
endif\
", 
               Arguments = "100", 
            }, 
            [3] = 
            {
               MudProgType = "rand_prog", 
               Code = "-- Load up and replace lightsaber battery every now and then.\
\
if not isfight($i)\
    if ovnuminv(10324) < 1\
        mpoload 10324\
    endif\
\
    battery\
endif\
", 
               Arguments = "1", 
            }, 
            [4] = 
            {
               MudProgType = "rand_prog", 
               Code = "-- This script will make sure the mob always has a working lightsaber.\
-- This way the mob can be used to grind the disarm skill.\
\
if ovnumcarry(10323) < 1\
    mpoload 10323\
endif\
\
wield lightsaber\
", 
               Arguments = "10", 
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
               [1] = "shyriiwook", 
               [0] = "basic", 
               [17] = "jawaese", 
            }, 
         }, 
         SaveVs = 
         {
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Height = 0, 
         DamRoll = 4, 
         HitRoll = 4, 
         Name = "jedi sparring partner", 
         Weight = 0, 
         Damage = 
         {
            DamSizeDice = 4, 
            DamPlus = 2, 
            DamNoDice = 2, 
         }, 
         Race = "Human", 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
         }, 
         NumberOfAttacks = 0, 
         Level = 20, 
         Credits = 0, 
         Position = "standing", 
         Alignment = 0, 
         DefaultPosition = "standing", 
         LongDescr = "A Jedi sparring partner looks eager for action.\
", 
         Description = "This young Jedi apprentice has long, brown hair in a low ponytail. His bland\
facial features are covered by a cropped beard. He's wearing plain clothes to\
blend in with the Mos Eisley population. Wearing Jedi robes would be very\
risky these days.\
", 
         ShortDescr = "a Jedi sparring partner", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
         }, 
      }, 
      [31999] = 
      {
         ArmorClass = 0, 
         Sex = "undistinguished", 
         Vnum = 31999, 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
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
            Wand = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            PoisonDeath = 0, 
         }, 
         Height = 0, 
         DamRoll = 0, 
         HitRoll = 0, 
         Name = "lastmob", 
         Weight = 0, 
         Damage = 
         {
            DamSizeDice = 0, 
            DamPlus = 0, 
            DamNoDice = 0, 
         }, 
         Race = "Human", 
         Stats = 
         {
            Force = 0, 
            Luck = 10, 
            Charisma = 10, 
            Wisdom = 10, 
            Constitution = 10, 
            Intelligence = 10, 
            Dexterity = 10, 
            Strength = 10, 
         }, 
         NumberOfAttacks = 0, 
         Level = 1, 
         Credits = 0, 
         Position = "standing", 
         Alignment = 0, 
         DefaultPosition = "standing", 
         LongDescr = "Some god abandoned a newly created lastmob here.\
", 
         Description = "", 
         ShortDescr = "a newly created lastmob", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
      }, 
   }, 
   Rooms = 
   {
      [31744] = 
      {
         Name = "Wastes", 
         TeleVnum = 0, 
         Vnum = 31744, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You can smell an odour developing around you.\
", 
         Tunnel = 0, 
         Sector = "mountain", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31745, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31743, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31745] = 
      {
         Name = "Wastes", 
         TeleVnum = 0, 
         Vnum = 31745, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You stand on a hard rocky surface. The air around you is very unpleasant.\
", 
         Tunnel = 0, 
         Sector = "mountain", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31744, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31746] = 
      {
         Name = "Long Hallway", 
         TeleVnum = 0, 
         Vnum = 31746, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are walking down a long, narrow hallway which turns at the end.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31747, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31735, 
               Direction = "south", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31747] = 
      {
         Name = "Hallway Through Jabba's Palace", 
         TeleVnum = 0, 
         Vnum = 31747, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are walking down a hallway. It is old and there is a rather digusting\
smell all around you.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31748, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31746, 
               Direction = "south", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31748] = 
      {
         Name = "Long Hallway in Jabba's Palace", 
         TeleVnum = 0, 
         Vnum = 31748, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are standing in a hallway. To each side all along the hall there are\
small individual rooms.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31749, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31747, 
               Direction = "south", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31749] = 
      {
         Name = "Long Hallway End", 
         TeleVnum = 0, 
         Vnum = 31749, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are coming to the end of the hallway which curves both to the east and\
to the west.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31750, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31748, 
               Direction = "south", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31750] = 
      {
         Name = "Narrow Hallway", 
         TeleVnum = 0, 
         Vnum = 31750, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are in a small narrow hallway which has a very disgusting odour, not\
surprising considering what creatures and animals have lived here in the past\
and even now. The ground is cool and hard full of ripples as if never crafted\
or taken care of.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31751, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31749, 
               Direction = "south", 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31770, 
               Direction = "west", 
            }, 
            [4] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31788, 
               Direction = "up", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31751] = 
      {
         Name = "Hallway Facing A Dark Room", 
         TeleVnum = 0, 
         Vnum = 31751, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are standing in a hallway facing east. As you look down the hallway at\
the end you can see different colored lights flashing in the dimness and the\
darkness. The ground is rough and the air is hot and heavy. Above a burnt out\
glowpanel lays motionless but you can still see pretty well.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31768, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31752, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31769, 
               Direction = "south", 
            }, 
            [4] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31750, 
               Direction = "west", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31752] = 
      {
         Name = "Narrow Hallway ", 
         TeleVnum = 0, 
         Vnum = 31752, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are walking down a narrow hallway. To each side there are very small rooms\
which are vacant.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31766, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31753, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31767, 
               Direction = "south", 
            }, 
            [4] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31751, 
               Direction = "west", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31753] = 
      {
         Name = "A Long Hallway ", 
         TeleVnum = 0, 
         Vnum = 31753, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are walking down a hallway towards a very large opening. It appears not\
to be guarded or have a door in place. The ground beneath you is hard and full\
of cracks and uneven places. The air is heavy and hot but nothing that cannot\
be lived with.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31764, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31754, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31765, 
               Direction = "south", 
            }, 
            [4] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31752, 
               Direction = "west", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31754] = 
      {
         Name = "End Of Hallway Before A Large Room", 
         TeleVnum = 0, 
         Vnum = 31754, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You approach the dark room at the end of the hallway with every step you\
take. To you sides you continually see small occupied rooms. The ground\
beneath your feet is rough and uneven making you feet ache all over. The\
lighting here is minimal but you can still see down the hall.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31762, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31755, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31763, 
               Direction = "south", 
            }, 
            [4] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31753, 
               Direction = "west", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31755] = 
      {
         Name = "In Front Of A Large Room", 
         TeleVnum = 0, 
         Vnum = 31755, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are standing in front of a very large room with different sections in it.\
The entrance used to have doors but as you can see they have been removed for\
all that remains is the hinges.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31760, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31756, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31761, 
               Direction = "south", 
            }, 
            [4] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31754, 
               Direction = "west", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31756] = 
      {
         Name = "Brain Jar Room", 
         TeleVnum = 0, 
         Vnum = 31756, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You stand in a dark room filled with brain jars. Each brain is used to put\
inside of a spiderwalker. You can go down the rows in front of you. The ground\
is softer in here as if taken care of, there is not one ripple in the whole\
surface showing grace and care from the person or people that finished this\
room.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31759, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31757, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31755, 
               Direction = "west", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [0] = "Dark", 
            [3] = "Indoors", 
         }, 
      }, 
      [31757] = 
      {
         Name = "Brain Room", 
         TeleVnum = 0, 
         Vnum = 31757, 
         ExtraDescriptions = 
         {
         }, 
         Description = "All around you there are brains in jars. As you walk by they start screaming.\
As they scream the lights on the jars change color indicating that they are\
not calm at all. In front of you there is a row of containing shelves with\
jars gently placed on them.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31758, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31756, 
               Direction = "west", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [0] = "Dark", 
            [3] = "Indoors", 
         }, 
      }, 
      [31758] = 
      {
         Name = "Brain Compartment", 
         TeleVnum = 0, 
         Vnum = 31758, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are walking down a row. To your sides shelves are filled with brains from\
all species of the galaxy. These jars seem to be a bit calmer for their lights\
are not flaring off when you pass by them. this shows they are mature and\
prepared to be put into a body of some sort, most likely a spiderwalker.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31757, 
               Direction = "south", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [0] = "Dark", 
            [3] = "Indoors", 
         }, 
      }, 
      [31759] = 
      {
         Name = "Row Of Jars", 
         TeleVnum = 0, 
         Vnum = 31759, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are standing in a row with shelves in it. On each shelf jars have been\
placed carefully to ensure that they are safe and will not fall to the ground\
and break. The air is crisp and provides stability as you stare longly at the\
large amounts of jars.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31756, 
               Direction = "south", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [0] = "Dark", 
            [3] = "Indoors", 
         }, 
      }, 
      [31760] = 
      {
         Name = "Old Room", 
         TeleVnum = 0, 
         Vnum = 31760, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are standing in small room which was initially designed to home a person.\
It has a window facing the sun.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31755, 
               Direction = "south", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31761] = 
      {
         Name = "Dusty Old Room", 
         TeleVnum = 0, 
         Vnum = 31761, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are standing in room. It has dust all over it for it has not been used\
for many, many years.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31755, 
               Direction = "north", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31762] = 
      {
         Name = "Large Guest Room", 
         TeleVnum = 0, 
         Vnum = 31762, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This is a larger room. It was probably designed to hold a larger species.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31754, 
               Direction = "south", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31763] = 
      {
         Name = "Old Small Calibered Room", 
         TeleVnum = 0, 
         Vnum = 31763, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The room you are standing in is very small room. It has a window in the\
corner and an old bedframe in the corner which seems to have been destroyed by\
small rodents.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31754, 
               Direction = "north", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31764] = 
      {
         Name = "Storage Compartment For Droids", 
         TeleVnum = 0, 
         Vnum = 31764, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are standing in an extremely small room that was designed to hold a\
cleaning droid or two.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31753, 
               Direction = "south", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31765] = 
      {
         Name = "Large Specimen Room", 
         TeleVnum = 0, 
         Vnum = 31765, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are in a large room. It was made for a larger type species. It is used to\
house and for sleeping. This room has a very disgusting odour.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31753, 
               Direction = "north", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31766] = 
      {
         Name = "Small Unused Room", 
         TeleVnum = 0, 
         Vnum = 31766, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are standing in a small room with a window facing the great sand dune\
sea.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31752, 
               Direction = "south", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31767] = 
      {
         Name = "Habitated Room", 
         TeleVnum = 0, 
         Vnum = 31767, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are standing in a room which seems to be habitated. There is a small bed\
in the corner with a window mounted on the wall which looks outside.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31752, 
               Direction = "north", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31768] = 
      {
         Name = "Small Enclosed Room", 
         TeleVnum = 0, 
         Vnum = 31768, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are in a room of small caliber. You feel enclosed as you look around the\
room.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31751, 
               Direction = "south", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31769] = 
      {
         Name = "Unhabitated Room", 
         TeleVnum = 0, 
         Vnum = 31769, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are standing in a bedroom. It is not habitated but could be.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31751, 
               Direction = "north", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31770] = 
      {
         Name = "Long Hallway", 
         TeleVnum = 0, 
         Vnum = 31770, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You walk down a long narrow hallway which floor is covered with stone and\
provides discomfort for your feet. To each side you can see some small and\
large rooms all with different uses. There is a glowpanel above your head\
barely functioning providing the dimmest of light all over.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31750, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31771, 
               Direction = "west", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31771] = 
      {
         Name = "A Hallway Passage", 
         TeleVnum = 0, 
         Vnum = 31771, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The hallway you walk down is on an uneven\
surface, it has ripples all along it and provides not much for heat or for\
comfort. There is no lighting here but you can still see down the gloomy\
hallway but not always with ease.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31770, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31772, 
               Direction = "west", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31772] = 
      {
         Name = "Dense Hallway", 
         TeleVnum = 0, 
         Vnum = 31772, 
         ExtraDescriptions = 
         {
         }, 
         Description = "As you walk down the hallway on a cool stone floor you smell an odour, a\
rather unpleasant one, but having been in this palace it is no surprise that\
this smell is located here. The hallway is gloomy and the floor has a rough\
texture as if never smoothed out.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31782, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31771, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31784, 
               Direction = "south", 
            }, 
            [4] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31773, 
               Direction = "west", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31773] = 
      {
         Name = "Long Narrowed Hallway", 
         TeleVnum = 0, 
         Vnum = 31773, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The ground beneath your feet is made of pure stone, rather cold at night and\
still cool in the day the stone is what covers all the palace floors. You can\
see the end of the hallway just ahead of yourself. Large and without any\
features. Just a simple stone wall.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31780, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31772, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31781, 
               Direction = "south", 
            }, 
            [4] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31774, 
               Direction = "west", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31774] = 
      {
         Name = "Hallway Leading To Individual Rooms", 
         TeleVnum = 0, 
         Vnum = 31774, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The hallway you walk down is covered in stone, cold on your feet as you walk\
over it for it does not preserve heat well. A glowpanel above is burnt out\
and every once in a while a small burst of electricity comes rippling through\
the end of the cables. The air here is dense but not filled with a stench, a\
rather unusual thing for this palace. To both sides there are rooms of\
different caliber. There is a great stone wall stopping the end of the hall\
just ahead.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31778, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31773, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31779, 
               Direction = "south", 
            }, 
            [4] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31775, 
               Direction = "west", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31775] = 
      {
         Name = "End Of A Long Hallway", 
         TeleVnum = 0, 
         Vnum = 31775, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are standing at the end of the hallway. There is a very large stone wall\
before you covering your way further down the hallway. The stone wall is\
thick and rough with different textures all over its surface.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31776, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31774, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31777, 
               Direction = "south", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31776] = 
      {
         Name = "Extra Small Compartment Room", 
         TeleVnum = 0, 
         Vnum = 31776, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are standing in room of very small caliber. It was probably constructed to\
hold extra blankets. There are closets all along the walls.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31775, 
               Direction = "south", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31777] = 
      {
         Name = "Large Old Room", 
         TeleVnum = 0, 
         Vnum = 31777, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are in a large room. It was probably used as a sleeping quarter. There is\
a small bed in the corner which has been chewed away at by a small rodent.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31775, 
               Direction = "north", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31778] = 
      {
         Name = "Well Sized Room", 
         TeleVnum = 0, 
         Vnum = 31778, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are in a well sized room. It was used as a living quarters in the past.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31774, 
               Direction = "south", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31779] = 
      {
         Name = "Habitated Living Quarters", 
         TeleVnum = 0, 
         Vnum = 31779, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are standing in a living quarters. It is currently habitated. You can\
tell because of food on the floor.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31774, 
               Direction = "north", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31780] = 
      {
         Name = "Supply Storage", 
         TeleVnum = 0, 
         Vnum = 31780, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are standing in a small room used to store extra supplies.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31773, 
               Direction = "south", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31781] = 
      {
         Name = "Large Living Quarters", 
         TeleVnum = 0, 
         Vnum = 31781, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are in a very large room. It was made as a living quaters. There is a\
large window in front of you.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31773, 
               Direction = "north", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31782] = 
      {
         Name = "Small Room", 
         TeleVnum = 0, 
         Vnum = 31782, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are in a smaller room. It can be used for any purpose.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31772, 
               Direction = "south", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31784] = 
      {
         Name = "Large Room", 
         TeleVnum = 0, 
         Vnum = 31784, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are standing in a large room. There is a bed that can hold any species\
and a large window on the back wall.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31772, 
               Direction = "north", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31788] = 
      {
         Name = "Top Of Staircase", 
         TeleVnum = 0, 
         Vnum = 31788, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are standing at the top of a staircase. In front of you there is a long\
hallway. Along the hallway many prison cells are there because Jabba use them\
for keeping people of unimportance.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31789, 
               Direction = "south", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31750, 
               Direction = "down", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31789] = 
      {
         Name = "Prison Hallway", 
         TeleVnum = 0, 
         Vnum = 31789, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are walking down the hallway. As you walk along you notice that all of\
the doors have been removed.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31788, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31790, 
               Direction = "south", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31790] = 
      {
         Name = "Prison Hallway", 
         TeleVnum = 0, 
         Vnum = 31790, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are in the hallway. It ends just up ahead making it a rather short\
corridor.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31789, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31794, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31791, 
               Direction = "south", 
            }, 
            [4] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31795, 
               Direction = "west", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31791] = 
      {
         Name = "Prison Hallway End", 
         TeleVnum = 0, 
         Vnum = 31791, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You have come to the end of the hall. A stone wall lays in front of you,\
preventing you from advancing.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31790, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31792, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31793, 
               Direction = "west", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31792] = 
      {
         Name = "Small Prison Cell", 
         TeleVnum = 0, 
         Vnum = 31792, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are standing in a prison cell. If you turn back there are metal bars\
across the wall. All around you the only furniture in this cell is a prison\
bed.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31791, 
               Direction = "west", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31793] = 
      {
         Name = "Large Prison Cell", 
         TeleVnum = 0, 
         Vnum = 31793, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are standing in a large prison cell. This cell was used for larger\
specimens. It has a toilet and a small bunk in the corner.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31791, 
               Direction = "east", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31794] = 
      {
         Name = "Extremely Small Cell", 
         TeleVnum = 0, 
         Vnum = 31794, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are standing in the smallest cell. This cell was used to hold very small\
specimens of life.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31790, 
               Direction = "west", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31795] = 
      {
         Name = "Very Large Prison Cell", 
         TeleVnum = 0, 
         Vnum = 31795, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are standing in a very large prison cell. It scares you to think what was\
kept in here. There is an awful smell.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31790, 
               Direction = "east", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31796] = 
      {
         Name = "Rancor's Pit", 
         TeleVnum = 0, 
         Vnum = 31796, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You just fell down the trapdoor into the rancor's pit. Here there is a very\
disgusting smell. This room is immense. To the north is the smaller\
compartment the rancor was kept in while his cage was cleaned.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
         }, 
         Sector = "inside", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
      }, 
      [31797] = 
      {
         Name = "DT", 
         TeleVnum = 0, 
         Vnum = 31797, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You get crushed by gate and die(d.t)\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
         }, 
         Sector = "inside", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
      }, 
      [31798] = 
      {
         Name = "Rancor's Cage", 
         TeleVnum = 0, 
         Vnum = 31798, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You just slid down the chute into the rancor's cage. The room is an immense\
room and has a very foul odour to it. To the north the smaller room lays which\
the rancor was put when the cage was cleaned.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31799, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31733, 
               Direction = "up", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31799] = 
      {
         Name = "DT", 
         TeleVnum = 0, 
         Vnum = 31799, 
         ExtraDescriptions = 
         {
         }, 
         Description = "EDIT\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31798, 
               Direction = "south", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31800] = 
      {
         Name = "Hallway to Rancor Pit", 
         TeleVnum = 0, 
         Vnum = 31800, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are standing in front of hallway which leads down into the rancor pit. To\
the south is the kitchen. To continue down the hall go east.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31733, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31802, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31801, 
               Direction = "south", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31801] = 
      {
         Name = "Jabba's Palace's Kitchen", 
         TeleVnum = 0, 
         Vnum = 31801, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are standing inside the kitchen that is used to make Jabba the Hutt's\
disgusting foods. There is a table in the center of the room with a cutting\
board and extra utensils. On the wall there are many shelves and utensils\
layed everywhere.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31800, 
               Direction = "north", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31802] = 
      {
         Name = "Hallway Past Docking Bay", 
         TeleVnum = 0, 
         Vnum = 31802, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are walking down a hall which passes the docking bay and many living\
quarters.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31803, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31800, 
               Direction = "west", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31803] = 
      {
         Name = "Hallway Past A Room", 
         TeleVnum = 0, 
         Vnum = 31803, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are standing in front of one of many rooms located on the bottom level.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31802, 
               Direction = "west", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31804] = 
      {
         Name = "Landing Pad 6", 
         TeleVnum = 0, 
         Vnum = 31804, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are standing on a rather small sized landing pad. It can be used to keep\
smaller sized vehicles of any origin.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
         }, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
      }, 
      [31805] = 
      {
         Name = "Rocky Cliff", 
         TeleVnum = 0, 
         Vnum = 31805, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are standing at the top of a high cliff. As you look downwards it is not a\
far drop but what scares you is that you would land on sharp jagged stones of\
all shapes and sizes. As you look the other way there is a steep cliff. If you\
can climb it go ahead.\
", 
         Tunnel = 0, 
         Sector = "mountain", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31589, 
               Direction = "south", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31806, 
               Direction = "up", 
            }, 
         }, 
      }, 
      [31806] = 
      {
         Name = "Krayt Nest", 
         TeleVnum = 0, 
         Vnum = 31806, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are standing in the middle of a Krayt Dragon's nest. It does not smell\
particularly good. A large female krayt towers over you here wondering what\
you are doing.\
", 
         Tunnel = 0, 
         Sector = "mountain", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31805, 
               Direction = "down", 
            }, 
         }, 
      }, 
      [31807] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31807, 
         ExtraDescriptions = 
         {
         }, 
         Description = "All around you is sand and shiny dunes piling as high as you can see. As far\
as you can guess anything could be behind there. The towering sand dunes make\
you feel scared as you are so small and enclosed by the towering heaps of\
sand.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31501, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31808, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31808] = 
      {
         Name = "Deserty Path", 
         TeleVnum = 0, 
         Vnum = 31808, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are walking along the hot sand heated by the twin suns of Tatooine. The\
ground beneath you is hardening gradually as you walk over it or is it just\
your imagination?\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31809, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31807, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31812, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31809] = 
      {
         Name = "Hard Sandy Area", 
         TeleVnum = 0, 
         Vnum = 31809, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You walk along a large area covered with sand. This sand seems to have\
hardened gradually over the years and is now almost of the consistency of\
sandstone. To the west the sand slopes downward in many directions. \
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31814, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31808, 
               Direction = "south", 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31810, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31810] = 
      {
         Name = "Sandy Surface", 
         TeleVnum = 0, 
         Vnum = 31810, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are standing on top of very hard sand, yet maybe even rock covered with\
sand. As you look westwards you see the dune sea stop abruptly and plummet\
downwards. I wonder why.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31809, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31811, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31811] = 
      {
         Name = "Overseeing A Small Colony.", 
         TeleVnum = 0, 
         Vnum = 31811, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are standing on the edge of a very steep drop that falls directly into the\
heart of what looks to be a colony of some sorts. You would not want to fall\
down this cliff for it is a ways down.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31810, 
               Direction = "east", 
            }, 
         }, 
      }, 
      [31812] = 
      {
         Name = "Flat Area", 
         TeleVnum = 0, 
         Vnum = 31812, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are walking on one of the only things on this planet. Sand. It is nice and\
soft but some patches of hardened sand can bee seen all around.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31808, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31813, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31813] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31813, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You look about, look from the direction you came, nothing, nothing at all but\
sand. You wonder how much of this stuff could there possibly be?\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31812, 
               Direction = "east", 
            }, 
         }, 
      }, 
      [31814] = 
      {
         Name = "Unstable Ground", 
         TeleVnum = 0, 
         Vnum = 31814, 
         ExtraDescriptions = 
         {
         }, 
         Description = "As the ground beaneath your feet is in a transition from sand to rock\
it seems to be versatile and flakes away in some areas with every\
step that you take on it. Northward you see all the sand is no longer\
there but it is totally a rock surface.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31815, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31809, 
               Direction = "south", 
            }, 
         }, 
      }, 
      [31815] = 
      {
         Name = "Rocky Area", 
         TeleVnum = 0, 
         Vnum = 31815, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The texture beneath your feet is no longer primarily sand but totally\
rock. The rock continues for twenty or thirty feet ahead of you but\
then stops abruptly and becomes sand once again. Downwards a cliff\
slopes downwards. This side is still very steep but you can perceive\
that it is very possible to go up and down of it.\
", 
         Tunnel = 0, 
         Sector = "mountain", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31814, 
               Direction = "south", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31816, 
               Direction = "down", 
            }, 
         }, 
      }, 
      [31816] = 
      {
         Name = "Side Of Steep Path", 
         TeleVnum = 0, 
         Vnum = 31816, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are on a pathway facing a severe angle which makes it so that\
there is not much room to move around without falling downwards\
towards flat ground. To the east there is a small cave in the side of\
a cliff. If you continue downwards you will be entering the city.\
", 
         Tunnel = 0, 
         Sector = "mountain", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31817, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31815, 
               Direction = "up", 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31818, 
               Direction = "down", 
            }, 
         }, 
      }, 
      [31817] = 
      {
         Name = "Water Shack", 
         TeleVnum = 0, 
         Vnum = 31817, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are standing in a dimly lit room. There is an aged Jawa shopkeeper\
sitting in the corner behind a table selling items you may need to\
explore this vast land filled with opportunities and predators. In\
this small cave it is darker which makes the temperature drop\
drastically and therefore makes this place a good one to stay in for\
long periods of time especially when both suns are up, sending rays of\
heat onto you. \
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31816, 
               Direction = "west", 
            }, 
         }, 
         Sector = "mountain", 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
      }, 
      [31818] = 
      {
         Name = "Entering The City", 
         TeleVnum = 0, 
         Vnum = 31818, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are standing on the same level most of this city is based on. All\
around tere are small shops and tents set up quickly used for\
merchandising goods to any passers.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31819, 
               Direction = "south", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31870, 
               Direction = "west", 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31816, 
               Direction = "up", 
            }, 
         }, 
         Sector = "mountain", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
      }, 
      [31819] = 
      {
         Name = "Path In The City", 
         TeleVnum = 0, 
         Vnum = 31819, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are walking down a wide path in the middle of this small city\
seemingly belonging to the Jawas. It has been used frequently and\
you can tell this for the rock is shaved away by weight and the path\
is full of marks. Straight ahead also there is a huge fortress of\
some sorts. It is simply constructed and seems old, but that is\
probably because of the wind and the scorching suns of Tatooine. \
", 
         Tunnel = 0, 
         Sector = "mountain", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31818, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31849, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31820, 
               Direction = "south", 
            }, 
            [4] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31851, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31820] = 
      {
         Name = "Dusty Path", 
         TeleVnum = 0, 
         Vnum = 31820, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You walk along a wide dusty path between two of the most popular\
places in this small veritable city. All around Jawas and small\
creatures of likes you do not want to be aquainted with. As you\
continue down this path you recognize many things and see the\
fortress growing with every step you take, seemingly growing to an \
endless extent. Although it is rather large it seems to be of simple\
construction and not very complicated.\
", 
         Tunnel = 0, 
         Sector = "mountain", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31819, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31821, 
               Direction = "south", 
            }, 
         }, 
      }, 
      [31821] = 
      {
         Name = "Path", 
         TeleVnum = 0, 
         Vnum = 31821, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You walk along a wide path seemingly wider than you think because of\
the reflection and glare of the two twin suns of Tatooine. In front\
of you the Jawa fortress stands immensely with not much architectural\
design to it. You can continue down this road towards the fortress or\
turn off into one of the side streets leading to who knows where.\
", 
         Tunnel = 0, 
         Sector = "mountain", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31820, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31822, 
               Direction = "south", 
            }, 
         }, 
      }, 
      [31822] = 
      {
         Name = "Directly In Front Of The Jawa Fortress", 
         TeleVnum = 0, 
         Vnum = 31822, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are standing directly in front of the Jawa Fortress. It seems rather\
large from this viewpoint but is limited to levels and interior space\
due to its design. there are some small designs on the fortress but\
they seem to not have been part of the original plans of the fortress\
but added in by certain individuals. \
", 
         Tunnel = 0, 
         Sector = "mountain", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31821, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               DestinationVnum = 31823, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
            }, 
         }, 
      }, 
      [31823] = 
      {
         Name = "Entrance To Jawa Fortress", 
         TeleVnum = 0, 
         Vnum = 31823, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are standing in a very large room. It was built plainly and simply\
and there are no signs of art even from their own culture in this\
room. There are some narrow corridors in many directions leading to\
different parts of the fortress.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               DestinationVnum = 31822, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31827, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31824, 
               Direction = "west", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31824] = 
      {
         Name = "A Narrow Hallway", 
         TeleVnum = 0, 
         Vnum = 31824, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are walking down a small narrow hallway that is not very well\
lit. The few glowpanels that are left on the ceiling are either\
inoperative or malfunctioning. Further down the hallway, the hallway\
come to an abrupt stop and turn off. The ground you walk on is rough\
but the lack of sunlight keeps its moisture and color well. \
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31823, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31825, 
               Direction = "west", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31825] = 
      {
         Name = "Hallway", 
         TeleVnum = 0, 
         Vnum = 31825, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are standing on a colder harder surface than in the hot desert. It\
is like this because of the lack of sunlight in this enormous\
fortress. The glow panels above flicker as if running out of energy.\
Directly in front of you the hallway splits off with a sharp turn\
towards the south. \
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31824, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31829, 
               Direction = "south", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31827] = 
      {
         Name = "A Large Room", 
         TeleVnum = 0, 
         Vnum = 31827, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You walk along in a large room. The ground beneath your feet is rocky\
and yet sandy at the same time making your feet feel better for the\
ground is not as rough as straight rock. There is no lighting in this\
room but you can still make your way around. The air is cool and crisp\
making it a little easier to breathe. \
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31828, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31823, 
               Direction = "west", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31828] = 
      {
         Name = "A room", 
         TeleVnum = 0, 
         Vnum = 31828, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are standing in room #31828.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31827, 
               Direction = "west", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31829] = 
      {
         Name = "Large Room", 
         TeleVnum = 0, 
         Vnum = 31829, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are standing in an enormous room. There are small bags, matresses\
and all sorts of small things all over the room layed about. There\
are a few Jawas young and old roaming these hallways. This here room\
is used for more of a storage place and not for eating.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31825, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31832, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31830, 
               Direction = "west", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31830] = 
      {
         Name = "Quarters", 
         TeleVnum = 0, 
         Vnum = 31830, 
         ExtraDescriptions = 
         {
         }, 
         Description = "Here, at night Jawas go to sleep. There are millions of tiny things\
from wires and circuits to translator droid in here. Considering the\
fact that Jawas sleep in this room it has a quite awful stench.\
Downwards there is a small opening leading to lower levels or\
something of an interesting nature. This room is very comfortable and\
safe with guard in pretty much all directions.\
 \
You may safely quit from here.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31829, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31831, 
               Direction = "down", 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "bed", 
               Key = -1, 
               Direction = "somewhere", 
               Distance = 0, 
               DestinationVnum = 31876, 
               Flags = 
               {
                  [17] = "CanEnter", 
                  [11] = "Hidden", 
               }, 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
      }, 
      [31831] = 
      {
         Name = "Small Room", 
         TeleVnum = 0, 
         Vnum = 31831, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are standing in what seems to be an area where extra things and stolen\
goods are kept. In the corners there are baskets full of wires and old\
goods that are probably useless to the everyday person. There is a jawa\
guard half asleep here watching over the items. This room does not seem to\
have been dug out yet was put here by nature.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31830, 
               Direction = "up", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31832] = 
      {
         Name = "Entrance", 
         TeleVnum = 0, 
         Vnum = 31832, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are standing in a simple room. Designed and built with ease this room\
posed no problem to the people that built it. It is extremely dark in here and\
not much is visible to the plain eye. The ground is cold and stiff and makes\
your feet feel cold as you walk over it.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31833, 
               Direction = "south", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31829, 
               Direction = "west", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31833] = 
      {
         Name = "Intersection", 
         TeleVnum = 0, 
         Vnum = 31833, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are at an intersection. You may go either east or west and explore this\
vast place. In both directions the small corridors lighten up further down.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31832, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31839, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31834, 
               Direction = "west", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31834] = 
      {
         Name = "Hallway", 
         TeleVnum = 0, 
         Vnum = 31834, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are standing in a think gloomy hallway. Towards the south you can hear\
the sounds of discussion and occasional laughter. The ground is cool and soft\
for it is not dried by the everydays suns of Tatooine. The hallway is a gloomy\
place and makes you think twice before you do anything.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31833, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31835, 
               Direction = "south", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31835] = 
      {
         Name = "End Of Hallway", 
         TeleVnum = 0, 
         Vnum = 31835, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You reach the end of the small and tight gloomy hallway and see a few\
guardians discussing near a heavily guarded door leading into a large room\
with someone, or something, important inside of it.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31834, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31836, 
               Direction = "east", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31836] = 
      {
         Name = "Opening", 
         TeleVnum = 0, 
         Vnum = 31836, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are standing in the beginning of the large room filled with\
guardians. Just ahead they talk to each other silently trying not to\
disturb anyone. The ground is more of a sand color and is quite soft\
and hot. Upwards there is an oppening in the roof letting sunlight in\
and momentarily blinding you.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31837, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31835, 
               Direction = "west", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31837] = 
      {
         Name = "Entrance", 
         TeleVnum = 0, 
         Vnum = 31837, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You stand before the heavily guarded entrance into the Wise Mans\
chambers. the two guardians stand up watching you closely so that you\
cause no harm to their master. The room has a large crack in the\
ceiling and it is rather hot in here. The way you see it staying in this\
fortress is not a bad idea. \
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 1, 
               DestinationVnum = 31838, 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [5] = "PickProof", 
                  [23] = "BashProof", 
               }, 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31836, 
               Direction = "west", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31838] = 
      {
         Name = "Chambers", 
         TeleVnum = 0, 
         Vnum = 31838, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are standing in the chambers of the Wise Jawa of these parts. The\
walls are poorly decorated and any signs of extra materials does not\
exist. Maybe you should try to understand him before coming to any\
conclusions for he may able to help you, or to teach you something of\
use. \
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               DestinationVnum = 31837, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31839] = 
      {
         Name = "Hallway", 
         TeleVnum = 0, 
         Vnum = 31839, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are standing in a hallway leading to a stone wall. At the end of the hall\
the hallway itself curves toward the south leaving only two way to go, south\
and back from where you came.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31833, 
               Direction = "west", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31840] = 
      {
         Name = "Neighberhood Junk Pile", 
         TeleVnum = 0, 
         Vnum = 31840, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are standing on a large pile of junk. People throw things they dont need\
here just to get rid of it. But for some people this place is where they can\
get everything they need to start out. Everything from scrap metal to blasters\
are here waiting for anyone to pick them up.\
", 
         Tunnel = 0, 
         Sector = "city", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31653, 
               Direction = "south", 
            }, 
         }, 
      }, 
      [31841] = 
      {
         Name = "Entrance To Docking Bay 94", 
         TeleVnum = 0, 
         Vnum = 31841, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are standing in front of the infamous Dockingbay 94. From here Han Solo\
and the Millenium Falcon escaped with their newly acquired passengers for a\
trip to Alderaan. There is a large entrance into the docking bay. All the\
ground beneath you is made of stone and sand. The air is warm yet lighter\
here for it is sheltered by the docking bay.\
", 
         Tunnel = 0, 
         Sector = "city", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31872, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31842, 
               Direction = "south", 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31605, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31842] = 
      {
         Name = "Inside The Entrance To Docking Bay 92", 
         TeleVnum = 0, 
         Vnum = 31842, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are standing in front of a large sliding door. When opened you can enter\
the docking bay with ease and embark on a ship to go to other places in the\
galaxy. The door is made of metal and has blaster scorching all over it from\
when the imperials chased Han Solo and Chewbacca in a race to capture the\
droid R2-D2 and return him to Darth Vader. The ground is hard and covered with\
sand as most of this planet is and the air is rather refreshing.\
", 
         Tunnel = 0, 
         Sector = "city", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31841, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               DestinationVnum = 31843, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
            }, 
         }, 
      }, 
      [31843] = 
      {
         Name = "Inside Docking Bay 92", 
         TeleVnum = 0, 
         Vnum = 31843, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are standing inside a large room that can contain a few smaller sized\
ships or one large ship like the Millenium Falcon. The ground here is covered\
with sand, but there are patches where you can see the stone floor beneath.\
The air in here is cool and refreshing and gives you a warm sensation. There\
are ships comming and leaving here continually and make it so that the air\
smells of fumes and exhaust.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               DestinationVnum = 31842, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31847, 
               Direction = "west", 
            }, 
         }, 
         Sector = "city", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31846] = 
      {
         Name = "Floating in a void", 
         TeleVnum = 0, 
         Vnum = 31846, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
         }, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
      }, 
      [31847] = 
      {
         Name = "Docking Bay 92", 
         TeleVnum = 0, 
         Vnum = 31847, 
         ExtraDescriptions = 
         {
         }, 
         Description = "All around you there is only one thing. A large room stands here waiting to\
be filled with crafts and vessels. The air is crisp and cool unlike\
outside in the sun, but smells of ships. On the walls there are blaster\
bolts. Extra tools lay on the ground for a mechanic that walks around\
here.   \
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31843, 
               Direction = "east", 
            }, 
         }, 
         Sector = "city", 
         Flags = 
         {
            [4] = "CanLand", 
            [3] = "Indoors", 
         }, 
      }, 
      [31849] = 
      {
         Name = "Hundo's Shop", 
         TeleVnum = 0, 
         Vnum = 31849, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are standing inside a small store. Here Hundo the owner will\
gladly sell you clothing or possibly custom make some for you if the\
price is right. There is a small workstation in the corner and a\
entry to a room near the back of the store. The store is pretty run\
down but serves it's purpose.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               DestinationVnum = 31850, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31819, 
               Direction = "west", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31850] = 
      {
         Name = "Back Of The Shop", 
         TeleVnum = 0, 
         Vnum = 31850, 
         ExtraDescriptions = 
         {
         }, 
         Description = "There are some small crates scattered along the floor. Most of them are empty\
but some seem to be filled with cloth and useless items. This room is very\
dirty and has a rather disturbing smell to it. The ground is smooth and cold\
being made of stone. The air is fresher in here than most parts of this city\
and it makes you want to stay here.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               DestinationVnum = 31849, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31851] = 
      {
         Name = "In Front Of A Large Keeping Area", 
         TeleVnum = 0, 
         Vnum = 31851, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are standing in front of some large fences. Inside these fences are kept\
many rontos, the animal that Jawas ride to go to different areas. There is a\
rather tall Jawa at the gate entry with an ionization gun ready to shoot any\
thieves or trespassers.\
", 
         Tunnel = 0, 
         Sector = "mountain", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31819, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               DestinationVnum = 31852, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
            }, 
         }, 
      }, 
      [31852] = 
      {
         Name = "Ronto Keeping Area", 
         TeleVnum = 0, 
         Vnum = 31852, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are standing inside a large pen sourrounded by gates that are filled with\
rontos. These rontos have been trained to a certain degree so it is not\
likely that they will try to escape. The ground is rough and is filled with\
cracks for the weight of these beasts is quite surprising. The sun shines down\
all day long and makes it warm here but the rontos have adjusted to the\
temperature.\
", 
         Tunnel = 0, 
         Sector = "mountain", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               DestinationVnum = 31851, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
            }, 
         }, 
      }, 
      [31853] = 
      {
         Name = "Entrance To The Cantina", 
         TeleVnum = 0, 
         Vnum = 31853, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are standing in the entrance to the well known cantina. Here some of the\
filthiest and richest scum hang around. Watch your step. Mounted on the wall is\
a droid detector. For here in this cantina they do not serve their kind.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31655, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31854, 
               Direction = "south", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
      }, 
      [31854] = 
      {
         Name = "Interior Of The Cantina", 
         TeleVnum = 0, 
         Vnum = 31854, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are facing the bar slowly. With small booths all around filled with\
people talking. Wuher slowly pours drinks for his customers being careful not\
to get hurt. The floor is poorly covered and the walls filled with blaster\
marks and other such things from fights and encounters.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31853, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31855, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31856, 
               Direction = "west", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31855] = 
      {
         Name = "Large Open Way", 
         TeleVnum = 0, 
         Vnum = 31855, 
         ExtraDescriptions = 
         {
         }, 
         Description = "Most of this section is rather empty for it leads the entrance into the\
cantina. For the other part there is a few tables with some stools and chairs\
but for the most part they are empty as for people seem to have adopted a\
liking towards the booths.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31858, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31859, 
               Direction = "south", 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31854, 
               Direction = "west", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31856] = 
      {
         Name = "A Large Section Of The Cantina", 
         TeleVnum = 0, 
         Vnum = 31856, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You stand in awe as many horrible characters walk around. Some you\
recognize and some you do not. There are small tables filled with\
people all along this large area of the Cantina. The air is full of\
smoke from hookas being used all along. There is some broke glass on\
the floor. As you walk over it it cracks and makes you shiver.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31854, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31861, 
               Direction = "south", 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31857, 
               Direction = "west", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31857] = 
      {
         Name = "A Small Booth", 
         TeleVnum = 0, 
         Vnum = 31857, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are standing inside a small booth. Here a table is mounted in the middle\
with all sorts of seats and chairs aligned around. The table is beat up with\
holes all over it, vandalized over and over. This booth has less lighting in\
it for the glow panel has shorted out and makes it relaxing with the change in\
temperature from the outdoors.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31856, 
               Direction = "east", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31858] = 
      {
         Name = "A Large Double Booth", 
         TeleVnum = 0, 
         Vnum = 31858, 
         ExtraDescriptions = 
         {
         }, 
         Description = "There are two small booths attached together here making one large booth.\
This booth is a very well known booth for here Han Solo fried Greedo the\
bounty hunter. There is a large table in the middle of the booth. The seats\
are dirty and the table even more so. There is a hookah on the table but it\
seems to be stuck to it.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31855, 
               Direction = "west", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31859] = 
      {
         Name = "A Section Of The Cantina", 
         TeleVnum = 0, 
         Vnum = 31859, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This room is located on the far side of the cantina, beside one of the\
small corner booths towards the west. The floor is dirty, filled with blood in\
some places from a recent fight. The air is full of smoke as people walk\
around you, some smoking hookahs.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31855, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31860, 
               Direction = "east", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31860] = 
      {
         Name = "A Very Small Booth", 
         TeleVnum = 0, 
         Vnum = 31860, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This booth is one of very small size. There is a small table in the\
middle with 2 stools set down around it. The stools are in rather\
good shape but the table is in horrible condition. The ground is\
cracked and makes you feel you will fall through the floor. The air\
is dirty and heavy here and makes you want to leave.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31859, 
               Direction = "west", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31861] = 
      {
         Name = "Section Of The Cantina", 
         TeleVnum = 0, 
         Vnum = 31861, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are standing in an open area filled with tables. To the east the bar\
stands. Chairs all around filled with different people and different species.\
The chairs themselves are rather dirty and so most people stand. The smell\
here is not too bad but not a beautiful one neither.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31856, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "Counter", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               DestinationVnum = 31863, 
               Flags = 
               {
                  [0] = "IsDoor", 
                  [17] = "CanEnter", 
                  [18] = "CanLeave", 
                  [26] = "CanLook", 
                  [23] = "BashProof", 
               }, 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31862, 
               Direction = "west", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31862] = 
      {
         Name = "A Corner Booth", 
         TeleVnum = 0, 
         Vnum = 31862, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are standing in a rather large both in the furthest corner of the\
cantina. The table here is very used yet in good shape compared to the others.\
The chairs on the other hand are worn down to the nub. The air here is less\
filthy for many people whom do not want to be bothered by the smoke sit\
here.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31861, 
               Direction = "east", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31863] = 
      {
         Name = "Inside The Bar", 
         TeleVnum = 0, 
         Vnum = 31863, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are standing in front of Wuher, the man who serves drinks to people here.\
The beverage machine is very large and complex but seems to be efficient in\
the way it works. AS he sees you he gets angry. Maybe you should run.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "counter", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               DestinationVnum = 31861, 
               Flags = 
               {
                  [0] = "IsDoor", 
                  [5] = "PickProof", 
               }, 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31618, 
               Direction = "up", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31870] = 
      {
         Name = "Inside A Large Cave", 
         TeleVnum = 0, 
         Vnum = 31870, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are inside a large cave. It has two parts to it. It is rather dark\
making the air cool. The cave protects you from the sand being\
blown by the winds. Inside this cave many womp rats seek shelter for\
the only other places are inside the city of Mos Eisley where they\
will most likely be prosecuted. The ground is hard and has little to\
no sand on it. This place is sure a break to the outdoors.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31818, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31871, 
               Direction = "west", 
            }, 
         }, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
      }, 
      [31871] = 
      {
         Name = "In The Back Of A Cave", 
         TeleVnum = 0, 
         Vnum = 31871, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are in the back portion of a large cave planted into the side of\
the cliff. The air here is very cool and relaxing giving you the\
sensation of being relaxed. The ground is hard and made entirely of\
rock, without a trace of sand this cave is rather clean besides the\
womp rat mess. There is a particular smell in here from the mess but\
nothing to be concerned about if you do not stay in this cave for an\
extended period of time.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31870, 
               Direction = "east", 
            }, 
         }, 
         Sector = "city", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31872] = 
      {
         Name = "The Bus Stop", 
         TeleVnum = 0, 
         Vnum = 31872, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are standing on a platform where the public busses land every so\
often. You can access different planets using these busses. Although\
the busses are slow they are a means of transportation. The only\
reason they are slow is because they are provided to the public for\
free. Thinking about this it makes it hard to maintain the busses\
without enough resources.\
", 
         Tunnel = 0, 
         Sector = "city", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31841, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31873] = 
      {
         Name = "Walking Through The City", 
         TeleVnum = 0, 
         Vnum = 31873, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You walk along a path inside the well known city of Mos Eisley. The\
ground here is hard yet made fully of sand. As you walk over it, it is\
hot and sharp. The wind blows in your face, sometimes bringing\
particles of sand into your face stinging you and sometimes getting\
into your eyes. The air is very warm, heated by the twin suns of the\
planet. The heat makes the air heavier and harder to breath yet you\
move on. Ahead you can see a corner that curves into a store of some\
kind. On the front it says \"Spaceport Speeders\".\
", 
         Tunnel = 0, 
         Sector = "city", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31875, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31881, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31882, 
               Direction = "south", 
            }, 
            [4] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31655, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31874] = 
      {
         Name = "Walking Down A Side Street", 
         TeleVnum = 0, 
         Vnum = 31874, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are walking down an unused side street. The street is mostly shady\
because the buildings to the sides cover the sunlight from the\
street. The ground is softer and less dense and compact, but when the\
wind blows it hurts more for the grains of sand hit you in larger\
numbers making you ache all over. The air is hot, not as hot as the\
rest of the city because the street is covered in shade, but it is\
still hot. The air is also lighter and makes you relax as you walk.\
", 
         Tunnel = 0, 
         Sector = "city", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31655, 
               Direction = "south", 
            }, 
         }, 
      }, 
      [31875] = 
      {
         Name = "Inside The Spaceport Speeders", 
         TeleVnum = 0, 
         Vnum = 31875, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are standing just inside the entrance to the spaceport speeders.\
Here you can help yourself by buying or getting a droid fixed. The\
people that work here are experienced and can offer you what is\
considered to be good prices for this planet. The atmosphere inside\
here is a bit rough with some edgy people hanging around but its not\
the end of the world. The store itself is pretty dirty with only the\
front room for helping out the customers. The intensity of the heat\
is not covered here as the air recycling system is not working to\
well.\
", 
         Tunnel = 0, 
         Sector = "city", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31873, 
               Direction = "south", 
            }, 
         }, 
      }, 
      [31876] = 
      {
         Name = "On A Bed", 
         TeleVnum = 0, 
         Vnum = 31876, 
         ExtraDescriptions = 
         {
         }, 
         Description = "Here in this bed hot steam rises from the cushions making your tense\
muscles relax. As they heat your body you start to feel better. The\
atmosphere is very moisturized with a lot of heat surrounding you\
also. The bed is made of a comfortable looking material but has been\
chewed at by small rodents making the bed kind of ugly looking. \
", 
         Tunnel = 0, 
         Sector = "city", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "rand_prog", 
               Code = "feel cure $n\
emote Vapors slowly seep into your body helping you relax.\
", 
               Arguments = "100", 
            }, 
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Direction = "somewhere", 
               Distance = 0, 
               DestinationVnum = 31830, 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [11] = "Hidden", 
               }, 
            }, 
         }, 
      }, 
      [31878] = 
      {
         Name = "Along The Bottom Of The Cliff", 
         TeleVnum = 0, 
         Vnum = 31878, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are walking along the bottom of the cliff. High above you see the edge\
of the cliff and you think about how much it would hurt to fall from\
there. The sand here is much harder than normal as for the wind does not\
get at it very well because the cliff covers the sand from being swept\
away by the gusting winds. The sun is also not so intense here but it is\
still very warm and just as dry as the rest of the planet.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31601, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31879, 
               Direction = "west", 
            }, 
         }, 
         Sector = "desert", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
      }, 
      [31879] = 
      {
         Name = "Nearing The Curve In The Cliff", 
         TeleVnum = 0, 
         Vnum = 31879, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are walking along the bottom of the cliff. High above you see the edge\
of the cliff and you think about how much it would hurt to fall from\
there. The sand here is much harder than normal as for the wind does not\
get at it very well because the cliff covers the sand from being swept\
away by the gusting winds. The sun is also not so intense here but it is\
still very warm and just as dry as the rest of the planet.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31878, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31880, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31880] = 
      {
         Name = "On The Curve Of The Cliff", 
         TeleVnum = 0, 
         Vnum = 31880, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are walking along the bottom of the cliff. High above you see the edge\
of the cliff and you think about how much it would hurt to fall from\
there. As you think of that you notice some blood splatter on the sand.\
Then you look up to see a large chunk of the cliff missing as if someone\
had fell from there taking a large portion of the side of the cliff with\
them. \
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31879, 
               Direction = "east", 
            }, 
         }, 
      }, 
      [31881] = 
      {
         Name = "On A Path In The City", 
         TeleVnum = 0, 
         Vnum = 31881, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You walk along a path inside the well known city of Mos Eisley. The ground\
here is hard yet made fully of sand. As you walk over it, it is hot and\
sharp. The wind blows in your face, sometimes bringing particles of sand\
into your face stinging you and sometimes getting into your eyes. The air\
is very warm, heated by the twin suns of the planet. The heat makes the\
air heavier and harder to breath yet you move on. To the north you can see\
a scattering of buildings.\
", 
         Tunnel = 0, 
         Sector = "city", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 6600, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31873, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31882] = 
      {
         Name = "In The Depths Of The City", 
         TeleVnum = 0, 
         Vnum = 31882, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You walk along a path inside the well known city of Mos Eisley. The ground\
here is hard yet made fully of sand. As you walk over it it is hot and sharp.\
The wind blows in your face, sometimes bringing particles of sand into your\
face stinging you and sometimes getting into your eyes. The air is very warm,\
heated by the twin suns of the planet. The heat makes the air heavier and\
harder to breath yet you move on. To the west you see smoke coming from\
freshly cooked meat and food. \
", 
         Tunnel = 0, 
         Sector = "city", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31873, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31883, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31624, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31883] = 
      {
         Name = "Gep's Grill", 
         TeleVnum = 0, 
         Vnum = 31883, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are standing in front of an old man. Here he makes his own food to sell\
to people passing by. He has a large selection, everything from\
banthaburgers to dewbak ribs depending on how carnivorous your appetite\
is. His booth is made of old junk probably scavenged or bought from the\
Jawas. His cooking supplies are rather disgusting to look at and when you\
think of what you are eating from it makes your stomach churn.\
", 
         Tunnel = 0, 
         Sector = "city", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31882, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31898] = 
      {
         Name = "An Empty Home", 
         TeleVnum = 0, 
         Vnum = 31898, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 106, 
               Direction = "northeast", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
      }, 
      [31899] = 
      {
         Name = "A Hidden Passage In The Sewers", 
         TeleVnum = 0, 
         Vnum = 31899, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This passage looks somewhat cleaner than the reset of the sewer, suggesting\
that someone maintains it. There's no sewage flowing here, rather the ground\
is quite dry.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31904, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31900, 
               Direction = "south", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
      }, 
      [31900] = 
      {
         Name = "Common Room", 
         TeleVnum = 0, 
         Vnum = 31900, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This circular area seems to be a simple common room, complete with cheap\
furniture and some faded posters on the walls.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31899, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31901, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31902, 
               Direction = "south", 
            }, 
            [4] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31909, 
               Direction = "west", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
      }, 
      [31901] = 
      {
         Name = "Kitchen", 
         TeleVnum = 0, 
         Vnum = 31901, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The kitchen bench is full of unwashed plates, glasses and cutlery. Above the\
bench are a few cupboards. Despite the mess on the bench, the place smells\
clean.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31900, 
               Direction = "west", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
      }, 
      [31902] = 
      {
         Name = "Hallway", 
         TeleVnum = 0, 
         Vnum = 31902, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The hallway has light gray walls with some lamps hanging on them. Doors\
lead to other rooms in the small complex.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31900, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31903, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31905, 
               Direction = "south", 
            }, 
            [4] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31906, 
               Direction = "west", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
      }, 
      [31903] = 
      {
         Name = "Sleeping Quarters", 
         TeleVnum = 0, 
         Vnum = 31903, 
         ExtraDescriptions = 
         {
         }, 
         Description = "There are a few cheap beds scattered around this dimly lit room. Otherwise\
it's quite empty.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31902, 
               Direction = "west", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
      }, 
      [31904] = 
      {
         Name = "A Tunnel In The Sewers", 
         TeleVnum = 0, 
         Vnum = 31904, 
         ExtraDescriptions = 
         {
         }, 
         Description = "There is a river of sewage flowing at a slow, steady pace. There's a rusty\
catwalk about a meter above it, running along one wall. Old grime is covering\
the walls. There's a nasty smell in the air, making it uncomfortable to\
breath, even for a Gamorrean.\
", 
         Tunnel = 0, 
         Sector = "underground", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "entry_prog", 
               Code = "if isjedi($n)\
    if level($n) < 25\
        mpechoat $n You sense that the south wall is a hologram.\
    endif\
endif\
", 
               Arguments = "100", 
            }, 
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31907, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               DestinationVnum = 31899, 
               Flags = 
               {
                  [11] = "Hidden", 
               }, 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31505, 
               Direction = "southwest", 
            }, 
         }, 
      }, 
      [31905] = 
      {
         Name = "Zim's Meditation Chamber", 
         TeleVnum = 0, 
         Vnum = 31905, 
         ExtraDescriptions = 
         {
         }, 
         Description = "In theory this is where Zim would meditate and attune himself to the Force.\
But in reality it's where he drinks all day, feeling sorry for himself.\
There's a smell of alcohol in the air.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31902, 
               Direction = "north", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
      }, 
      [31906] = 
      {
         Name = "Workshop", 
         TeleVnum = 0, 
         Vnum = 31906, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This rooms contains all facilities you need to craft just about anything.\
It's very cluttered. A few broken items that someone failed to assemble\
correctly have been tossed into a corner.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31902, 
               Direction = "east", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [16] = "Silence", 
            [26] = "Factory", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
      }, 
      [31907] = 
      {
         Name = "Mos Eisley Sewers", 
         TeleVnum = 0, 
         Vnum = 31907, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This is the main entrance to the sewers. There is a river of sewage flowing\
through the tunnel, giving off a strong smell. Along one wall is a catwalk\
allowing one to walk through the sewers.\
", 
         Tunnel = 0, 
         Sector = "underground", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31908, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31904, 
               Direction = "west", 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Direction = "up", 
               Distance = 1, 
               DestinationVnum = 31654, 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
            }, 
         }, 
      }, 
      [31908] = 
      {
         Name = "A Tunnel In The Sewers", 
         TeleVnum = 0, 
         Vnum = 31908, 
         ExtraDescriptions = 
         {
         }, 
         Description = "#31904\
", 
         Tunnel = 0, 
         Sector = "underground", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31502, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31907, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31909] = 
      {
         Name = "Sparring Area", 
         TeleVnum = 0, 
         Vnum = 31909, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The sparring area is a square room about 10x10 meters. Most of the floor is\
covered by a gray mat so that people won't land too hard when they fall.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31900, 
               Direction = "east", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31997] = 
      {
         Name = "Economy Class Section", 
         TeleVnum = 0, 
         Vnum = 31997, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This section is smelly and dirty. It's probably not cleaned very often.\
The noise from the engines at the back of the shuttle contributes to making\
it an uncomfortable trip.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31999, 
               Direction = "north", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
      }, 
      [31998] = 
      {
         Name = "Business Class Section", 
         TeleVnum = 0, 
         Vnum = 31998, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This section of the shuttle is clean, quiet and comfortable. In other words\
it's the opposite of what you usually meet on this planet.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 1, 
               DestinationVnum = 31999, 
               Flags = 
               {
                  [1] = "Closed", 
               }, 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
      }, 
      [31999] = 
      {
         Name = "Tatooine Planetary Shuttle Entrance", 
         TeleVnum = 0, 
         Vnum = 31999, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The Tatooine Planetary Shuttle travels between major settlements on this\
backwater planet. The entrance area leads to the business class section in one\
direction, and the economy class section in the other. The business class\
section is behind a curtain so that the wealthier passengers won't have to\
look at the seedier elements in the back.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "curtain", 
               Key = -1, 
               Direction = "north", 
               Distance = 1, 
               DestinationVnum = 31998, 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31997, 
               Direction = "south", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
      }, 
      [31500] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31500, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The dunes around you are normal as you walk over the endless amount of sand.\
The sea of rippling sand still surrounds you with overwhelming greatness. The\
sand has a reflective shine to it assisted by the sunrays of the heating suns.\
You feel enclosed because the dunes tower over you greatly.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31501, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31557, 
               Direction = "south", 
            }, 
         }, 
      }, 
      [31501] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31501, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are walking along the soft sand in the desert of Tatooine. Just ahead of\
you you can see the dune sea developping. Behind you the small city diminishes\
into only a spot. With every step you take the city becomes smaller and\
smaller.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31507, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31500, 
               Direction = "south", 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31807, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31502] = 
      {
         Name = "Tunnel Junction", 
         TeleVnum = 0, 
         Vnum = 31502, 
         ExtraDescriptions = 
         {
         }, 
         Description = "A junction breaks up the monotony of these tunnels. The river of sewage runs\
south, but to the north there seems to be a dry area.\
", 
         Tunnel = 0, 
         Sector = "underground", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31503, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31504, 
               Direction = "south", 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31908, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31503] = 
      {
         Name = "Pumping Station", 
         TeleVnum = 0, 
         Vnum = 31503, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This room is about 20x20 meters, and several meters high. It smells as bad\
as the rest of the sewers. In the middle of the room is a large piece of\
machinery enclosed in an old-fashioned wire fence.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 1, 
               DestinationVnum = 31623, 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
               }, 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31502, 
               Direction = "south", 
            }, 
         }, 
         Sector = "underground", 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
      }, 
      [31504] = 
      {
         Name = "Endless Tunnels In The Sewers", 
         TeleVnum = 0, 
         Vnum = 31504, 
         ExtraDescriptions = 
         {
         }, 
         Description = "#31904\
", 
         Tunnel = 0, 
         Sector = "underground", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31502, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31621, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31505] = 
      {
         Name = "A Deep Pool Of Sewage", 
         TeleVnum = 0, 
         Vnum = 31505, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The tunnel widens into a room filled with sewage that gathers into a large\
pool. Just like the rest of the sewers, there's a rusty catwalk running along\
one wall where it's possible to walk through the area.\
", 
         Tunnel = 0, 
         Sector = "underground", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31506, 
               Direction = "south", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31904, 
               Direction = "northeast", 
            }, 
         }, 
      }, 
      [31506] = 
      {
         Name = "A Tunnel In The Sewers", 
         TeleVnum = 0, 
         Vnum = 31506, 
         ExtraDescriptions = 
         {
         }, 
         Description = "#31904\
", 
         Tunnel = 0, 
         Sector = "underground", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31505, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31591, 
               Direction = "southeast", 
            }, 
         }, 
      }, 
      [31507] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31507, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are standing on a hard sandy surface, there is nothing around you unless\
you turn back. In all directions you can see but sand. The dunes in the sea\
are enourmous and grow with every step that you take.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31509, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31508, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31501, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31508] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31508, 
         ExtraDescriptions = 
         {
         }, 
         Description = "All around you is sand and shiny dunes piling as high as you can see. As far\
as you can guess anything could be behind there. The towering sand dunes make\
you feel scared as you are so small and enclosed by the towering heaps of sand.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31555, 
               Direction = "south", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31507, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31509] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31509, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are surrounded by sand from all possible directions. You can still see a\
glimpse of the city behind you but once you leave the city the land is yours\
to explore.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31510, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31507, 
               Direction = "south", 
            }, 
         }, 
      }, 
      [31510] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31510, 
         ExtraDescriptions = 
         {
         }, 
         Description = "Around you there is only sand as far as you can see. The direction is not\
noticable and civilization is far away. If you wander too far be careful\
of where you end up.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31511, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31513, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31509, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31511] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31511, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The sand is soft and is still all around you. It is high and shinning in your\
face as you repeatidly walk over endless amounts of sand. You feel enclosed\
because of their great mass. As you walk forward, with every step you take the\
sand dunes grow in size and proportion.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31512, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31510, 
               Direction = "south", 
            }, 
         }, 
      }, 
      [31512] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31512, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The sand is soft and is still all around you. It is high and shinning in your\
face as you repeatidly walk over endless amounts of sand. You feel enclosed\
because of their great mass. As you walk forward, with every step you take\
the sand dunes grow in size and proportion.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31511, 
               Direction = "south", 
            }, 
         }, 
      }, 
      [31513] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31513, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The sand is soft and is still all around you. The sun is high and shining in\
your face as you repeatedly walk over endless amounts of sand. You feel\
enclosed because of their great mass. As you walk forward, with every step you\
take the sand dunes grow in size and proportion.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31514, 
               Direction = "south", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31510, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31514] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31514, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The sand is soft and is still all around you. It is high and shining in your\
face as you repeatidly walk over endless amounts of sand. You feel enclosed\
because of their great mass. As you walk forward, with every step you take\
the sand dunes grow in size and proportion.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31513, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31515, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31515] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31515, 
         ExtraDescriptions = 
         {
         }, 
         Description = "All around you is sand and shiny dunes piling as high as you can see. As far\
as you can guess anything could be behind there. The towering sand dunes make\
you feel scared as you are so small and enclosed by the towering heaps of sand.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31514, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31516, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31516] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31516, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are on the top of a sand dune and you can see across the whole dune sea.\
It is just a great sight to see. The sand dunes dip in and out of the ground.\
The immense amount of sand frightens you as you look across the great sand\
dune sea of Tatooine.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31515, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31517, 
               Direction = "south", 
            }, 
         }, 
      }, 
      [31517] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31517, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are heading down the side of a sand a dune entering another valley of\
dunes. With every step you take the sand seems to be increasing.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31516, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31518, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31518] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31518, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are on the top of a sand dune and you can see across the whole dune sea.\
It is just a great sight to see. The sand dunes dip in and out of the ground.\
The immense amount of sand frightens you as you look across the great sand\
dune sea of Tatooine.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31519, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31517, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31522, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31519] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31519, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The sand is soft and is still all around you. It is high and shining in your\
face as you repeatedly walk over endless amounts of sand. You feel enclosed\
because of their great mass. As you walk forward, with every step you take the\
sand dunes grow in size and proportion.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31520, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31518, 
               Direction = "south", 
            }, 
         }, 
      }, 
      [31520] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31520, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are on the top of a sand dune and you can see across the whole dune sea.\
It is just a great sight to see. The sand dunes dip in and out of the ground.\
The immense amount of sand frightens you as you look across the great sand dune\
sea of Tatooine.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31521, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31519, 
               Direction = "south", 
            }, 
         }, 
      }, 
      [31521] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31521, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are on the top of a sand dune and you can see across the whole dune sea.\
It is just a great sight to see. The sand dunes dip in and out of the ground.\
The immense amount of sand frightens you as you look across the great sand\
dune sea of Tatooine.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31520, 
               Direction = "south", 
            }, 
         }, 
      }, 
      [31522] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31522, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The sand is soft and is still all around you. It is high and shining in your\
face as you repeatedly walk over endless amounts of sand. You feel enclosed\
because of their great mass. As you walk forward, with every step you take the\
sand dunes grow in size and proportion.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31518, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31523, 
               Direction = "south", 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31524, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31523] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31523, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The dunes around you are normal as you walk over the endless amount of dunes.\
The sea of dunes still surrounds you with overwhelming greatness. The sand has\
a reflective shine to it assisted by the sunrays of the heating suns.  You feel\
enclosed because the dunes tower over you greatly.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31522, 
               Direction = "north", 
            }, 
         }, 
      }, 
      [31524] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31524, 
         ExtraDescriptions = 
         {
         }, 
         Description = "All around you is sand and you are The dunes around you are normal as you walk\
over the endless amount of dunes. The sea of dunes still surrounds you with\
overwhelming greatness. The sand has a reflective shine to it assisted by the\
sunrays of the heating suns. You feel enclosed because the dunes tower over\
you greatly.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31525, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31522, 
               Direction = "east", 
            }, 
         }, 
      }, 
      [31525] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31525, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The dunes around you are normal as you walk over the endless amount of dunes.\
The sea of dunes still surrounds you with overwhelming greatness. The sand has\
a reflective shine to it assisted by the sunrays of the heating suns. You feel\
enclosed because the dunes tower over you greatly.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31526, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31524, 
               Direction = "south", 
            }, 
         }, 
      }, 
      [31526] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31526, 
         ExtraDescriptions = 
         {
         }, 
         Description = "All around you is sand and shiny dunes piling as high as you can see. As far\
as you can guess anything could be behind there. The towering sand dunes make\
you feel scared as you are so small and enclosed by the towering heaps of sand.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31527, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31525, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31527] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31527, 
         ExtraDescriptions = 
         {
         }, 
         Description = "All around you is sand and shiny dunes piling as high as you can see. As far\
as you can guess anything could be behind there. The towering sand dunes make\
you feel scared as you are so small and enclosed by the towering heaps of sand.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31528, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31536, 
               Direction = "south", 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31526, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31528] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31528, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You start walking over the tip of a dune an can see something in the far sea\
of dunes. All around you is sand and shiny dunes piling as high as you can\
see. As far as you can guess anything could be behind there. The towering sand\
dunes make you feel scared as you are so small and enclosed by the towering\
heaps of sand.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31529, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31527, 
               Direction = "south", 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31530, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31529] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31529, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The dunes around you are normal as you walk over the endless amount of dunes.\
The sea of dunes still surrounds you with overwhelming greatness. The sand has\
a reflective shine to it assisted by the sunrays of the heating suns. You feel\
enclosed because the dunes tower over you greatly.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31528, 
               Direction = "south", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31531, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31530] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31530, 
         ExtraDescriptions = 
         {
         }, 
         Description = "All around you is sand and shiny dunes piling as high as you can see. As far\
as you can guess anything could be behind there. The towering sand dunes make\
you feel scared as you are so small and enclosed by the towering heaps of sand.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31528, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31537, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31531] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31531, 
         ExtraDescriptions = 
         {
         }, 
         Description = "All around you is sand and shiny dunes piling as high as you can see. As far\
as you can guess anything could be behind there. The towering sand dunes make\
you feel scared as you are so small and enclosed by the towering heaps of sand.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31529, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31532, 
               Direction = "south", 
            }, 
         }, 
      }, 
      [31532] = 
      {
         Name = "Opening", 
         TeleVnum = 0, 
         Vnum = 31532, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The sand is soft and is still all around you. It is high and shinning in your\
face as you repeatidly walk over endless amounts of sand. You feel enclosed\
because of their great mass. As you walk forward, with every step you take the\
sand dunes grow in size and proportion.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31531, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31533, 
               Direction = "east", 
            }, 
         }, 
      }, 
      [31533] = 
      {
         Name = "Opening", 
         TeleVnum = 0, 
         Vnum = 31533, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are traveling along the side of the large opening and can see something in\
the center of the opening.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31534, 
               Direction = "south", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31532, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31534] = 
      {
         Name = "Opening", 
         TeleVnum = 0, 
         Vnum = 31534, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are standing infront of a very large opening in the ground that seems to\
have endless turns inside itself. To explore this hold continue to the west.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31533, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31535, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31535] = 
      {
         Name = "Sarlacc", 
         TeleVnum = 0, 
         Vnum = 31535, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This is a D.T(To be edited)\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31534, 
               Direction = "east", 
            }, 
         }, 
      }, 
      [31536] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31536, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are in the middle of the sea of dunes and are hopelessly lost.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31527, 
               Direction = "north", 
            }, 
         }, 
      }, 
      [31537] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31537, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You can now perceive that the object that you are walking towars is a metallic\
form of some sort.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31530, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31538, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31538] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31538, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are very close to the object and you can now identify it in the sand. It\
is a very old shipwreck plowed into the top of a dune.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31539, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31537, 
               Direction = "east", 
            }, 
         }, 
      }, 
      [31539] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31539, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are infront of the shipwreck and it seems to be habitible. To explore it\
continue north up the hatch.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31540, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31538, 
               Direction = "south", 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31552, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31540] = 
      {
         Name = "Hatch", 
         TeleVnum = 0, 
         Vnum = 31540, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are inside the hatch of a ship which seems very new and cared for.\
", 
         Tunnel = 0, 
         Sector = "inside", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31547, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31542, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31539, 
               Direction = "south", 
            }, 
            [4] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               DestinationVnum = 31541, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
            }, 
         }, 
      }, 
      [31541] = 
      {
         Name = "Cargo Hold", 
         TeleVnum = 0, 
         Vnum = 31541, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are standing infront of an immense cargo room containing many\
crates of items.\
", 
         Tunnel = 0, 
         Sector = "inside", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               DestinationVnum = 31540, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
            }, 
         }, 
      }, 
      [31542] = 
      {
         Name = "Tunnel", 
         TeleVnum = 0, 
         Vnum = 31542, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are in a small room with lots of wiring and you can see the maintenance\
tunnel in front of you.\
", 
         Tunnel = 0, 
         Sector = "inside", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               DestinationVnum = 31543, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31540, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31543] = 
      {
         Name = "Mainentance Tunnel", 
         TeleVnum = 0, 
         Vnum = 31543, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are inside the maintenance tunnel. It is a very small space so you must\
crawl inside the tunnel to move.\
", 
         Tunnel = 0, 
         Sector = "inside", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31544, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               DestinationVnum = 31542, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
            }, 
         }, 
      }, 
      [31544] = 
      {
         Name = "Tunnel", 
         TeleVnum = 0, 
         Vnum = 31544, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are crawling through the tunnel and can see an opening to the west.\
", 
         Tunnel = 0, 
         Sector = "inside", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31543, 
               Direction = "south", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31545, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31545] = 
      {
         Name = "Secret Compartment", 
         TeleVnum = 0, 
         Vnum = 31545, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You enter a small compartment room filled with electronic equipment. It seems\
to be an interrogation room of some sort. You can see computers mounted the\
wall.\
", 
         Tunnel = 0, 
         Sector = "inside", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31546, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31544, 
               Direction = "east", 
            }, 
         }, 
      }, 
      [31546] = 
      {
         Name = "Death", 
         TeleVnum = 0, 
         Vnum = 31546, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are in a room containing nothing but an assault droid in the corner.\
", 
         Tunnel = 0, 
         Sector = "inside", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31545, 
               Direction = "south", 
            }, 
         }, 
      }, 
      [31547] = 
      {
         Name = "Corridor", 
         TeleVnum = 0, 
         Vnum = 31547, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are walking down a corridor and can see a ladder at the end of the hall.\
", 
         Tunnel = 0, 
         Sector = "inside", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31540, 
               Direction = "south", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31548, 
               Direction = "up", 
            }, 
         }, 
      }, 
      [31548] = 
      {
         Name = "Ladder", 
         TeleVnum = 0, 
         Vnum = 31548, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are heading up a ladder headed towards the top portion of the ship.\
", 
         Tunnel = 0, 
         Sector = "inside", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31550, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31551, 
               Direction = "south", 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31549, 
               Direction = "west", 
            }, 
            [4] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31547, 
               Direction = "down", 
            }, 
         }, 
      }, 
      [31549] = 
      {
         Name = "Passenger Compartment", 
         TeleVnum = 0, 
         Vnum = 31549, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You enter a passenger compartment that seems to have been inhabitated.\
", 
         Tunnel = 0, 
         Sector = "inside", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31548, 
               Direction = "east", 
            }, 
         }, 
      }, 
      [31550] = 
      {
         Name = "Pilot Compartment", 
         TeleVnum = 0, 
         Vnum = 31550, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are in the pilot compartment and you look out the viewer console to see\
sand covering it. The computer equipment seems to be usable and undamaged.\
", 
         Tunnel = 0, 
         Sector = "inside", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31548, 
               Direction = "south", 
            }, 
         }, 
      }, 
      [31551] = 
      {
         Name = "Room", 
         TeleVnum = 0, 
         Vnum = 31551, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This room contains nothing in it besides a viewer console and\
seems very strange.\
", 
         Tunnel = 0, 
         Sector = "inside", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31548, 
               Direction = "north", 
            }, 
         }, 
      }, 
      [31552] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31552, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You walk around the immense shuttle to the top of a dune and continue exploring\
the dune sea of Tatooine. It tower around you fromm all directions.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31539, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31553, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31553] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31553, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The shuttle starts to get smaller and you can see only sand in front of you.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31554, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31552, 
               Direction = "east", 
            }, 
         }, 
      }, 
      [31554] = 
      {
         Name = "Desert ", 
         TeleVnum = 0, 
         Vnum = 31554, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You walk slowly and exhausted to find nothing here.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31553, 
               Direction = "south", 
            }, 
         }, 
      }, 
      [31555] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31555, 
         ExtraDescriptions = 
         {
         }, 
         Description = "All around you is sand and shiny dunes piling as high as you can see. As far\
as you can guess anything could be behind there. The towering sand dunes make\
you feel scared as you are so small and enclosed by the towering heaps of sand.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31508, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31556, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31556] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31556, 
         ExtraDescriptions = 
         {
         }, 
         Description = "All around you is sand and shiny dunes piling as high as you can see. As far\
as you can guess anything could be behind there. The towering sand dunes make\
you feel scared as you are so small and enclosed by the towering heaps of sand.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31555, 
               Direction = "east", 
            }, 
         }, 
      }, 
      [31557] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31557, 
         ExtraDescriptions = 
         {
         }, 
         Description = "All around you is sand and shiny dunes piling as high as you can see.\
As far as you can guess anything could be behind there. The towering\
sand dunes make you  eel scared as you are so small and enclosed by\
the towering heaps of sand.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31500, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31558, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31592, 
               Direction = "south", 
            }, 
         }, 
      }, 
      [31558] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31558, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are on the top of a sand dune and you can see across the whole dune sea.\
It is just a great sight to see. The sand dunes dip in and out of the ground.\
The immense amount of sand frightens you as you look across the great sand\
dune sea of Tatooine.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31559, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31557, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31559] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31559, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The sand is soft and is still all around you. It is high and shinning in your\
face as you repeatedly walk over endless amounts of sand. You feel enclosed\
because of their great mass. As you walk forward, with every step you take the\
sand dunes grow in size and proportion.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31560, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31565, 
               Direction = "south", 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31558, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31560] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31560, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The dunes you are walking on are reaching a few feet high now and you are\
approaching the greater dunes at a rather fast pace.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31561, 
               Direction = "south", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31559, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31561] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31561, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are on a large dune right now and you can see dunes for a long way.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31560, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31562, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31564, 
               Direction = "south", 
            }, 
         }, 
      }, 
      [31562] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31562, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are heading into the sea of dunes. Be careful where you go or you might not come back.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31563, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31561, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31563] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31563, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The dunes under you appear to be growing with every step that you take.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31569, 
               Direction = "south", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31562, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31564] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31564, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are on a large dune heading further and further away from the grasp of\
civilization.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31561, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31571, 
               Direction = "south", 
            }, 
         }, 
      }, 
      [31565] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31565, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are walking on the rippling surface of the sand which has been\
exposed to extreme heat over the many years. The sand is very warm and\
stings your face as the wind blows it up onto your soft skin. The air\
is thick and very heavy to breathe, but living with it is something you\
accepted when you entered the desert.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31559, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31566, 
               Direction = "south", 
            }, 
         }, 
      }, 
      [31566] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31566, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The hard sand beneath your feet is hot and you can only see the same things\
for miles to come. You are walking on the rippling surface of the sand\
which has been exposed to extreme heat over the many years. The sand is\
very warm and stings your face as the wind blows it up onto your soft\
skin. The air is thick and very heavy to breathe, but living with it\
something you accepted when you entered the desert. \
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31565, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31567, 
               Direction = "south", 
            }, 
         }, 
      }, 
      [31567] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31567, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The sand is hard and hot but you continue to explore this vast area.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31566, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31568, 
               Direction = "south", 
            }, 
         }, 
      }, 
      [31568] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31568, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The hard sand is getting softer as you walk endlessly.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31567, 
               Direction = "north", 
            }, 
         }, 
      }, 
      [31569] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31569, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are walking up and down endless amounts of sound shaped into great dunes\
trying to find something in this vast sea.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31563, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31570, 
               Direction = "south", 
            }, 
         }, 
      }, 
      [31570] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31570, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The sand dunes seem to get bigger and higher but it only seems this way from\
exhaustion.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31569, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 3301, 
               Direction = "east", 
            }, 
         }, 
         Sector = "desert", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
      }, 
      [31571] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31571, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The pummeling dunes are passing under your feet at an alarming rate. Yet there\
is nothing else in sight but sand.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31564, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31572, 
               Direction = "south", 
            }, 
         }, 
      }, 
      [31572] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31572, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You walk down to the base of one of the largest dunes you have climbed in your\
trip through the great sea of Tatooine.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31571, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31573, 
               Direction = "east", 
            }, 
         }, 
      }, 
      [31573] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31573, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You turn at the bottom of a dune and start climbing a rather small one.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31574, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31572, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31574] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31574, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The dune you just climbed was a rather small one but when you look down off of\
the dune you realize you are heading down into a valley.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31575, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31577, 
               Direction = "south", 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31573, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31575] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31575, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You walk through the valley of sand dunes slowly. The harsh conditions are\
slowing you down gradually over the course of many minutes, hours or even days\
depending on how long you last before you find civilization.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31576, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31574, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31576] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31576, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The sand dunes around you are making you nautious on what is still left\
to climb over.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31575, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31577] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31577, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are walking and walking through the treacherous sea of never ending sand.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31574, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31578, 
               Direction = "south", 
            }, 
         }, 
      }, 
      [31578] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31578, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You look on but can only see endless amounts of sand but nothing else.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31577, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31582, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31579, 
               Direction = "south", 
            }, 
         }, 
      }, 
      [31579] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31579, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The great sea starts becoming a blur after looking at the bare sands\
for many long hours now.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31578, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31580, 
               Direction = "south", 
            }, 
         }, 
      }, 
      [31580] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31580, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The sea of dunes is making a great impression on what you think of Tatooine.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31579, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31581, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31581] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31581, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are coming up to a rise of harder sand than all around. The flat\
continues to the west.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31580, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31590, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31582] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31582, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The sand is plunging downwards and all of the sea seems to be heading to\
a point of falling.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31583, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31578, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31583] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31583, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are standing on the last dune before the entry point and can see what\
is developed inside.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31584, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31582, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31584] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31584, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are heading down a slope towards a rocky assortment of caves once lived\
in by the native race of this planet. The Jundland Wastes are very large and\
you can see many things from here.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31585, 
               Direction = "south", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31583, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31585] = 
      {
         Name = "Wastes", 
         TeleVnum = 0, 
         Vnum = 31585, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You can see immense caves all around you and feel enclosed by the high walls\
of the caves.\
", 
         Tunnel = 0, 
         Sector = "mountain", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31584, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31586, 
               Direction = "east", 
            }, 
         }, 
      }, 
      [31586] = 
      {
         Name = "Wastes", 
         TeleVnum = 0, 
         Vnum = 31586, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are walking down a rocky path that passes many old caves. To the south you\
see a cave that is still in pretty good condition. All around there is a\
distinct odour.\
", 
         Tunnel = 0, 
         Sector = "mountain", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31738, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31589, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31587, 
               Direction = "south", 
            }, 
            [4] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31585, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31587] = 
      {
         Name = "Cave", 
         TeleVnum = 0, 
         Vnum = 31587, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are inside a dark cave which has a strong odour of some sort. The cave\
continues to the south.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31586, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31588, 
               Direction = "south", 
            }, 
         }, 
         Sector = "mountain", 
         Flags = 
         {
            [0] = "Dark", 
         }, 
      }, 
      [31588] = 
      {
         Name = "Cave", 
         TeleVnum = 0, 
         Vnum = 31588, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are in the back of a cave which seems to have been used as a living\
habitat. On the floor in the corner you are appaled when seing three dead\
Jawas. There are some blaster scars on the walls and big gashes everywhere.\
Only one thing could have done this... Sand people.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31587, 
               Direction = "north", 
            }, 
         }, 
         Sector = "mountain", 
         Flags = 
         {
            [0] = "Dark", 
         }, 
      }, 
      [31589] = 
      {
         Name = "Dry Area", 
         TeleVnum = 0, 
         Vnum = 31589, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You see many things in the rocks around you but the camp seems lifless in many\
ways. The ground is hard and dry for with the twin suns no moisture can be\
kept in the ground.\
", 
         Tunnel = 0, 
         Sector = "mountain", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31805, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31742, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31586, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31590] = 
      {
         Name = "Teeth", 
         TeleVnum = 0, 
         Vnum = 31590, 
         ExtraDescriptions = 
         {
         }, 
         Description = "D.T(to be edited)\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31581, 
               Direction = "east", 
            }, 
         }, 
      }, 
      [31591] = 
      {
         Name = "A Junction In The Sewer Tunnels", 
         TeleVnum = 0, 
         Vnum = 31591, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The river of sewage flows into the area from the east and and northwest, and\
disappears off south.\
", 
         Tunnel = 0, 
         Sector = "underground", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31620, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31619, 
               Direction = "south", 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31506, 
               Direction = "northwest", 
            }, 
         }, 
      }, 
      [31592] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31592, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are walking along a hardened sand path which seems to be headed to a\
cliff. The towering sand dunes make you feel scared as you are so small\
and enclosed by the towering heaps of sand. The sun is too warm and is\
getting to you as you tread towards what is to be seen.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31557, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31593, 
               Direction = "south", 
            }, 
         }, 
      }, 
      [31593] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31593, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are coming to the end of the path as far as you can see. The cliff is\
right ahead of you. The sand blows slowly into your face stinging your\
eyes and the rest of your face. The sun pounds down onto your back making\
you feel twice as heavy as usual. At some points down this way it gets\
steep and you slip a little landing right on your behind.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31592, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31594, 
               Direction = "south", 
            }, 
         }, 
      }, 
      [31594] = 
      {
         Name = "The Cliff", 
         TeleVnum = 0, 
         Vnum = 31594, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are standing on the edge of a cliff. It overlooks the great city of Mos\
Eisley. It is a great sight. To the east you see the path curve down the\
side of the cliff. The sand blows slowly into your face stinging your eyes\
and the rest of your face. The sun pounds down onto your back making you\
feel twice as heavy as usual. As you walk slowly down the side of the\
cliff the sand gets sharper and if you are not wearing foot gear it could\
get painful.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31593, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31595, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31597, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31595] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31595, 
         ExtraDescriptions = 
         {
         }, 
         Description = "Still walking along the cliff you start curving down the side of a\
mountain. You are walking down a hard sand path filled with sharp\
minerals that hurt your feet as you walk over the sand. The heat is\
driving against your back as the twin suns start burning your skin, the\
air is hot and heavy lacking moisture. As the sand blows slowly against\
your face you wish you had something to protect it as shards or sand start\
stinging against your face.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31596, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31594, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31596] = 
      {
         Name = "Desert End", 
         TeleVnum = 0, 
         Vnum = 31596, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You Curve down the bottom of the path and approach the entry to the city. \
You are walking down a hard sand path filled with sharp minerals that hurt\
your feet as you walk over the sand. The heat is driving against your back\
as the twin suns start burning your skin, the air is hot and heavy lacking\
moisture. As the sand blows slowly against your face you wish you had\
something to protect it as shards or sand start stinging against your\
face.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31601, 
               Direction = "south", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31595, 
               Direction = "west", 
            }, 
         }, 
         Sector = "desert", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
      }, 
      [31597] = 
      {
         Name = "Cliff", 
         TeleVnum = 0, 
         Vnum = 31597, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are walking along the edge of the cliff. Be careful where you go. The\
sand blows slowly into your face, stinging your eyes and the rest of your\
face. The sand flies into your eyes like annoying bugs stinging your eyes\
until the point where you are going to cry. The sun pounds down onto your\
back making you feel twice as heavy as usual.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31600, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31594, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31598, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31598] = 
      {
         Name = "Cliff", 
         TeleVnum = 0, 
         Vnum = 31598, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are very near the edge and should return. Be careful. As you walk down\
the edge of the cliff you see chunks of sand falling down the side of the\
cliff. Seconds later you hear the thumping of the sand hitting the ground\
far below. The sand blows slowly into your face stinging your eyes and the\
rest of your face. To the south the sand looks very unstable. It would be\
advisable not to go there.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31667, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31597, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31599, 
               Direction = "south", 
            }, 
         }, 
      }, 
      [31599] = 
      {
         Name = "Cliffside", 
         TeleVnum = 0, 
         Vnum = 31599, 
         ExtraDescriptions = 
         {
         }, 
         Description = "Aaah, you are loosing your grip! Looking down would not be a good idea as for\
you're about to fall!\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31598, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Direction = "down", 
               Distance = 0, 
               DestinationVnum = 31880, 
               Flags = 
               {
                  [11] = "Hidden", 
               }, 
            }, 
         }, 
         Sector = "desert", 
         Flags = 
         {
            [24] = "NoFloor", 
         }, 
      }, 
      [31600] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31600, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are walking along the flat sands of Tatooine.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31658, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31597, 
               Direction = "south", 
            }, 
         }, 
      }, 
      [31601] = 
      {
         Name = "City", 
         TeleVnum = 0, 
         Vnum = 31601, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You walk into the city, it is a large places with many uses. The thugs of\
the galaxy hang around this town. You are walking down a hard sand path\
filled with sharp minerals that hurt your feet as you walk over the sand.\
The heat is driving against your back as the twin suns start burning your\
skin, the air is hot and heavy lacking moisture. As the sand blows slowly\
against your face you wish you had something to protect it as shards or\
sand start stinging against your face.\
", 
         Tunnel = 0, 
         Sector = "city", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31596, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31602, 
               Direction = "south", 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31878, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31602] = 
      {
         Name = "City", 
         TeleVnum = 0, 
         Vnum = 31602, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are walking towards the inner town of Mos Eisley and towards the\
spaceport. The market is also in the vicinity of the inner city. You are\
walking down a hard sand path filled with sharp minerals that hurt your\
feet as you walk over the sand. The heat is driving against your back as\
the twin suns start burning your skin, the air is hot and heavy lacking\
moisture. As the sand blows slowly against your face you wish you had\
something to protect it as shards or sand start stinging against your\
face.\
", 
         Tunnel = 0, 
         Sector = "city", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31601, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31628, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31603, 
               Direction = "south", 
            }, 
         }, 
      }, 
      [31603] = 
      {
         Name = "City", 
         TeleVnum = 0, 
         Vnum = 31603, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are approaching an intersection which will bring you to different parts\
of the city. You are walking down a hard sand path filled with sharp\
minerals that hurt your feet as you walk over the sand. The heat is\
driving against your back as the twin suns start burning your skin, the\
air is hot and heavy lacking moisture. As the sand blows slowly against\
your face you wish you had something to protect it as shards or sand start\
stinging against your face.\
", 
         Tunnel = 0, 
         Sector = "city", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31602, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31604, 
               Direction = "south", 
            }, 
         }, 
      }, 
      [31604] = 
      {
         Name = "In Front Of Mos Eisley Spaceport", 
         TeleVnum = 0, 
         Vnum = 31604, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are walking down the path heading directly to the Spaceport. You are\
walking through the large, scum filled city of Mos Eisley. You are\
walking down a hard sand path filled with sharp minerals that hurt your\
feet as you walk over the sand. The heat is driving against your back as\
the twin suns start burning your skin, the air is hot and heavy lacking\
moisture. As the sand blows slowly against your face you wish you had\
something to protect it as shards or sand start stinging against your\
face.\
", 
         Tunnel = 0, 
         Sector = "city", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31603, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31653, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31605, 
               Direction = "south", 
            }, 
         }, 
      }, 
      [31605] = 
      {
         Name = "Pathway To Control Center", 
         TeleVnum = 0, 
         Vnum = 31605, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are walking down a path to the control center. There they watch the\
activities of vessels from all parts of the galaxy. It is not a very large\
building but is suitable for its purpose. The ground beneath your feet is\
hardening as you approach the centre and the air is continuasly heavy and\
warm.\
", 
         Tunnel = 0, 
         Sector = "city", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31604, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31841, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31606, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31606] = 
      {
         Name = "Pathway To Control Center", 
         TeleVnum = 0, 
         Vnum = 31606, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are in front of the control center for the spaceport. Inside this building\
many descisions are made to decide who should be allowed to land on this\
planet and not to cause air havoc.\
", 
         Tunnel = 0, 
         Sector = "city", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31605, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31607, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31607] = 
      {
         Name = "In Front Of The Control Center", 
         TeleVnum = 0, 
         Vnum = 31607, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are in front of the doors to the spaceport control center. To enter it go\
to the west. At many times of the year this building is just chained up and\
locked. Left here abandoned for the law here is not really kept up tight. The\
door is of solid wood and looks very strong.\
", 
         Tunnel = 0, 
         Sector = "city", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31606, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               DestinationVnum = 31608, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
            }, 
         }, 
      }, 
      [31608] = 
      {
         Name = "Inside The Control Center", 
         TeleVnum = 0, 
         Vnum = 31608, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are in the entrance to the control center. There are turbolifts moving\
all around you. The control tower is on the higher levels but the offices are\
here on the main level of the building. The ground is hard and seems to be\
made of stone. The air is crisp and relaxing in here for it is shielded from\
the twin suns of Tatooine.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31609, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               DestinationVnum = 31607, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31613, 
               Direction = "south", 
            }, 
            [4] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31615, 
               Direction = "west", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31609] = 
      {
         Name = "Hallway", 
         TeleVnum = 0, 
         Vnum = 31609, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are in a hallway with doors to executive offices all the way down the\
hall. There are doors placed on both sides of the hall leading into individual\
offices.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31608, 
               Direction = "south", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31610, 
               Direction = "west", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31610] = 
      {
         Name = "In The Hallway", 
         TeleVnum = 0, 
         Vnum = 31610, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You walk down a narrow hallway which has not much space to each side. To your\
sides there are two offices which hold different things. The ground here is\
made of stone and the illumination is poor as for only one glowpanel remains\
to light up this entire hallway. The air is relaxing and constantly flooding\
your lungs for it is a change towards the hot and heavy air outdoors.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               DestinationVnum = 31611, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31609, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               DestinationVnum = 31612, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31611] = 
      {
         Name = "Large Conference Room", 
         TeleVnum = 0, 
         Vnum = 31611, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are in one of the first offices ever built. It is well furnished and\
decorated. It is used for conferences because of its size but there are not\
many conferences because of the slackness of law on this planet.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               DestinationVnum = 31610, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31612] = 
      {
         Name = "Manager's Office", 
         TeleVnum = 0, 
         Vnum = 31612, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This office is a private office for the manager of this facility. It is a\
rather large office with many vents in it to allow the entrance of crisp air\
to enter the room. There is a large desk made from oak in the middle of the\
room stacked up with 3 pieces of paper.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               DestinationVnum = 31610, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31613] = 
      {
         Name = "Hallway", 
         TeleVnum = 0, 
         Vnum = 31613, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This hallway heads towards the rooms with the generating and computer\
equipment of the control center.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31608, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Direction = "west", 
               Distance = 0, 
               DestinationVnum = 31614, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31614] = 
      {
         Name = "Generator Room", 
         TeleVnum = 0, 
         Vnum = 31614, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This room contains all of the power generating equipment for the spaceport.\
The generators and computer systems are all mounted on the walls.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Direction = "east", 
               Distance = 0, 
               DestinationVnum = 31613, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31615] = 
      {
         Name = "Lobby", 
         TeleVnum = 0, 
         Vnum = 31615, 
         ExtraDescriptions = 
         {
         }, 
         Description = "This is the lobby of the control center. In the corner a secretary takes\
messages and allows passage to the tower.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31608, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Direction = "up", 
               Distance = 0, 
               DestinationVnum = 31616, 
               Flags = 
               {
                  [0] = "IsDoor", 
                  [5] = "PickProof", 
               }, 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31616] = 
      {
         Name = "Tower", 
         TeleVnum = 0, 
         Vnum = 31616, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are standing in the control tower. Most of the tower is run by droids and\
computers. The only living creatures are humans.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31617, 
               Direction = "west", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Direction = "down", 
               Distance = 0, 
               DestinationVnum = 31615, 
               Flags = 
               {
                  [0] = "IsDoor", 
                  [5] = "PickProof", 
               }, 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31617] = 
      {
         Name = "Viewscreen", 
         TeleVnum = 0, 
         Vnum = 31617, 
         ExtraDescriptions = 
         {
         }, 
         Description = "Here you can see the whole spaceport from this large viewing screen. As you\
peer through it you can see many different species of life from all across the\
galaxy.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31616, 
               Direction = "east", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31618] = 
      {
         Name = "Upstairs In The Cantina", 
         TeleVnum = 0, 
         Vnum = 31618, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The upstairs of the cantina contains a few rooms that Wuher rents out for a\
small fee. They are barren and comfortable but the locks all work so at\
least they should be a safe.\
 \
This would be a good place to rest for a while. You may quit and reenter\
the game from here.\
 \
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31863, 
               Direction = "down", 
            }, 
         }, 
         Sector = "city", 
         Flags = 
         {
            [2] = "NoMob", 
            [10] = "Safe", 
            [23] = "Hotel", 
         }, 
      }, 
      [31619] = 
      {
         Name = "Tunnel Blocked By A Large Grate", 
         TeleVnum = 0, 
         Vnum = 31619, 
         ExtraDescriptions = 
         {
         }, 
         Description = "Beyond a large grate blocking the way ahead, you see a light far ahead, at the\
end of the tunnel. This is probably where the sewege goes. You probably don't\
even want to know what happens to it next.\
", 
         Tunnel = 0, 
         Sector = "underground", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31591, 
               Direction = "north", 
            }, 
         }, 
      }, 
      [31620] = 
      {
         Name = "A Large Chamber", 
         TeleVnum = 0, 
         Vnum = 31620, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The tunnels widen into a large chamber. The river of sewage runs through it,\
but most of the floor is dry ground. The purpose of this chamber is not\
obvious, as it's otherwise empty.\
", 
         Tunnel = 0, 
         Sector = "underground", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31622, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31591, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31621] = 
      {
         Name = "A Bend In The Tunnels", 
         TeleVnum = 0, 
         Vnum = 31621, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The tunnel bends as the river flows from the east to the southwest. There are\
some large fans embedded into the wall, probably to provide breathable air\
into the tunnels.\
", 
         Tunnel = 0, 
         Sector = "underground", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31504, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31622, 
               Direction = "southwest", 
            }, 
         }, 
      }, 
      [31622] = 
      {
         Name = "A Tunnel In The Sewers", 
         TeleVnum = 0, 
         Vnum = 31622, 
         ExtraDescriptions = 
         {
         }, 
         Description = "#31904\
", 
         Tunnel = 0, 
         Sector = "underground", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31620, 
               Direction = "west", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31621, 
               Direction = "northeast", 
            }, 
         }, 
      }, 
      [31623] = 
      {
         Name = "Maintenance Personnel's Area", 
         TeleVnum = 0, 
         Vnum = 31623, 
         ExtraDescriptions = 
         {
         }, 
         Description = "Even the people working down here deserve a break, and this is where they\
take it. There are some posters on the walls that otherwise has an industrial\
look to them.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 1, 
               DestinationVnum = 31503, 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
               }, 
            }, 
         }, 
         Sector = "underground", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31624] = 
      {
         Name = "Mercs For Hire", 
         TeleVnum = 0, 
         Vnum = 31624, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31882, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31625, 
               Direction = "west", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
      }, 
      [31625] = 
      {
         Name = "Foyer Of Facility", 
         TeleVnum = 0, 
         Vnum = 31625, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31626, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31624, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31627, 
               Direction = "west", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31626] = 
      {
         Name = "Combat Trainer", 
         TeleVnum = 0, 
         Vnum = 31626, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31625, 
               Direction = "south", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
      }, 
      [31627] = 
      {
         Name = "Equipment Shop", 
         TeleVnum = 0, 
         Vnum = 31627, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31625, 
               Direction = "east", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
      }, 
      [31628] = 
      {
         Name = "Another Street In Mos Eisley", 
         TeleVnum = 0, 
         Vnum = 31628, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Tunnel = 0, 
         Sector = "city", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31629, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31602, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31629] = 
      {
         Name = "Straight Street", 
         TeleVnum = 0, 
         Vnum = 31629, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Tunnel = 0, 
         Sector = "city", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31630, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31634, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31628, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31630] = 
      {
         Name = "Artisan Guild", 
         TeleVnum = 0, 
         Vnum = 31630, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31631, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31629, 
               Direction = "south", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
      }, 
      [31631] = 
      {
         Name = "Guild Foyer", 
         TeleVnum = 0, 
         Vnum = 31631, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31633, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31630, 
               Direction = "south", 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31632, 
               Direction = "west", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31632] = 
      {
         Name = "Engineering Classes", 
         TeleVnum = 0, 
         Vnum = 31632, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31631, 
               Direction = "east", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
      }, 
      [31633] = 
      {
         Name = "A Large Workshop", 
         TeleVnum = 0, 
         Vnum = 31633, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31631, 
               Direction = "south", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [26] = "Factory", 
            [3] = "Indoors", 
         }, 
      }, 
      [31634] = 
      {
         Name = "Straight Street", 
         TeleVnum = 0, 
         Vnum = 31634, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Tunnel = 0, 
         Sector = "city", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31635, 
               Direction = "south", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31629, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31635] = 
      {
         Name = "The Mayor's Building", 
         TeleVnum = 0, 
         Vnum = 31635, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31634, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31636, 
               Direction = "south", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31636] = 
      {
         Name = "A Spacious Office", 
         TeleVnum = 0, 
         Vnum = 31636, 
         ExtraDescriptions = 
         {
         }, 
         Description = "", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31635, 
               Direction = "north", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [10] = "Safe", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
      }, 
      [31653] = 
      {
         Name = "Large Pathway Through The City", 
         TeleVnum = 0, 
         Vnum = 31653, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are walking down one of the main roads in Mos Eisley. As you walk by you\
notice a huge pile of junk where people deposit their goods. The ground you\
walk on is hard and sharp and the air continues to remain the same, heavy and\
warm. The air seems to be getting to you with every step you take but you can\
manage it, after all it's only air.\
", 
         Tunnel = 0, 
         Sector = "city", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31840, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31654, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31604, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31654] = 
      {
         Name = "City Road", 
         TeleVnum = 0, 
         Vnum = 31654, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are walking through the city. To explore other parts of the city\
turn down any one of the number of roads and paths. The ground here is\
hot and sandy as most of this planet is. But as it is a city it is\
placed over a flat area. The air here is hot and heavy and makes you\
slow down, but you stride on. You can feel the warmth pounding down\
on your back as you walk, but for now that is not your concern. The\
sand is blowing up into your face and when it hits you it feels as if\
someone is there slapping you. Just keep your head down and hope your\
goggles can withstand the many sand storms this planet has to deal\
with.\
", 
         Tunnel = 0, 
         Sector = "city", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "entry_prog", 
               Code = "if isjedi($n)\
    if level($n) < 25\
        mpechoat $n You sense that there's something of interest below.\
    endif\
endif\
", 
               Arguments = "100", 
            }, 
         }, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31655, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31653, 
               Direction = "west", 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "manhole", 
               Key = -1, 
               Direction = "down", 
               Distance = 1, 
               DestinationVnum = 31907, 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
            }, 
         }, 
      }, 
      [31655] = 
      {
         Name = "City", 
         TeleVnum = 0, 
         Vnum = 31655, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are still continuing down the path through Mos Eisley. Just ahead\
you can see the famous cantina. If you would like to enter it veer to\
the south. But beware this place is dangerous. The ground is hot and\
sandy, the air hot and heavy and of course the heat continuously\
pelts down on you as the twin suns heat the planet. The many business\
places that are around you look interesting and some may be of use. \
There is some active life all around you and it scares you at how\
many dirty people can be in one place. \
", 
         Tunnel = 0, 
         Sector = "city", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31874, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31873, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31853, 
               Direction = "south", 
            }, 
            [4] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31654, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31658] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31658, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are standing on the harsh sand of Tatooine. You are walking on the\
rippling surface of the sand which has been exposed to extreme heat over\
the many years. The sand is very warm and stings your face as the wind\
blows it up onto your soft skin. The air is thick and very heavy to\
breathe, but living with it something you accepted when you entered the\
desert.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31659, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31600, 
               Direction = "south", 
            }, 
         }, 
      }, 
      [31659] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31659, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are on the hard sand of Tatooine. All around you you can see sand for\
miles unless you look back.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31660, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31658, 
               Direction = "south", 
            }, 
         }, 
      }, 
      [31660] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31660, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are standing on the thickening sand of Tatooine.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31661, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31659, 
               Direction = "south", 
            }, 
         }, 
      }, 
      [31661] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31661, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The sand under you is still hard and glowing. As you look around all you can\
see is shiny sand.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31660, 
               Direction = "south", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31662, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31662] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31662, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You walk on the sand of Tatooine. As you walk over it your feet sink into the\
ground leaving an everlasting mark.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31661, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31663, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31663] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31663, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are walking on the sand of Tatooine. The sand gradually hardens with\
every minute exposed to the sun.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31662, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31664, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31664] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31664, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The sand under you is feeling hotter with rays of the sun beaming down on it.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31663, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31665, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31665] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31665, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are standing on the great sands of Tatooine. Far away in the distance you\
can see the developing sea of sand dunes.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31664, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31666, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31666] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31666, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are heading towards the great sand dunes, yet it is still a long journey\
to reach the sand dune sea.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31683, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31665, 
               Direction = "east", 
            }, 
         }, 
      }, 
      [31667] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31667, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are headed towards the great dune sea, leaving civilization behind.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31668, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31598, 
               Direction = "south", 
            }, 
         }, 
      }, 
      [31668] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31668, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are standing on the hard sand of the planet which has been exposed to\
harsh sun rays.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31669, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31667, 
               Direction = "south", 
            }, 
         }, 
      }, 
      [31669] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31669, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The sand under you is continually getting softer every step you take towards\
the great sea of sand dunes.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31670, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31668, 
               Direction = "south", 
            }, 
         }, 
      }, 
      [31670] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31670, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You can now clearly make out the sand dunes ahead of you, but they are still\
very far away.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31671, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31669, 
               Direction = "south", 
            }, 
         }, 
      }, 
      [31671] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31671, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are nearing the great sea of sand dunes with every step you take.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31672, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31670, 
               Direction = "south", 
            }, 
         }, 
      }, 
      [31672] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31672, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are approaching the sand dunes quickly now and will be there soon. With\
every step you take the sand seems to be getting softer and thicker.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31673, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31671, 
               Direction = "south", 
            }, 
         }, 
      }, 
      [31673] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31673, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are only but feet of in reach of the great sea.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31674, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31672, 
               Direction = "south", 
            }, 
         }, 
      }, 
      [31674] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31674, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are nearing the bottom of the first sand dune in sight. All of a sudden\
they seem much bigger than before. They also seem to be growing with every\
step you take.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31675, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31673, 
               Direction = "south", 
            }, 
         }, 
      }, 
      [31675] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31675, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The great dune sea now seems so vast and enormous with every step you take.\
In all directions there are sand dunes towering around and over you.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31676, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31674, 
               Direction = "south", 
            }, 
         }, 
      }, 
      [31676] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31676, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are surrounded by sand, the dunes extend as far as you can see.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31675, 
               Direction = "south", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31677, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31677] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31677, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You walk endlessly on the sand beneath you. It towers all around and\
makes you feel enclosed.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31676, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31678, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31678] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31678, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are walking on a dune. It is shaped by the everlasting winds of Tatooine.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31677, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31679, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31679] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31679, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The sand around you is thick and hot. In the daytime the sunrays make the\
sand extremely hot.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31678, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31680, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31680] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31680, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are walking on the sand dunes of the great sea. They tower around you in\
all directions.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31679, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31681, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31681] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31681, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are walking though the thick sand. It covers your feet and makes you feel\
enclosed.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31680, 
               Direction = "east", 
            }, 
         }, 
      }, 
      [31682] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31682, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You walk on the sand dunes of the great sea of Tatooine. They shimmer around\
you in the daylight.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
         }, 
         Sector = "desert", 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
      }, 
      [31683] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31683, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are standing on the thickening sand of the desert.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31684, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31666, 
               Direction = "south", 
            }, 
         }, 
      }, 
      [31684] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31684, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are nearing the first of many sand dunes. All around you can now\
see the sand dunes of the great sea. You can already feel the wind\
blowing the sharp sand into your face. The sand is very sharp so\
wearing something on your face would be a good idea. The twin suns of\
the planet are pounding heat onto your back as you walk slowly\
through the drifts of sand. Your lungs are hurting because this heavy\
air is making their job two times harder. \
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31685, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31683, 
               Direction = "south", 
            }, 
         }, 
      }, 
      [31685] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31685, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are at the step of the first sand dune. You can enter the sand dune sea\
of Tatooine to the north, the west and the east.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31686, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31698, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31684, 
               Direction = "south", 
            }, 
            [4] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31694, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31686] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31686, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are on one of many large sand dunes in this vast sea.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31687, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31685, 
               Direction = "south", 
            }, 
         }, 
      }, 
      [31687] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31687, 
         ExtraDescriptions = 
         {
         }, 
         Description = "All around you are large sand dunes. If you would like to stay out of the sea\
turn back now.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31688, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31686, 
               Direction = "south", 
            }, 
         }, 
      }, 
      [31688] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31688, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are inside a small valley of sand dunes. All around you shimmering sand\
dunes tower over you.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31689, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31687, 
               Direction = "south", 
            }, 
         }, 
      }, 
      [31689] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31689, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are now in the great sea. The only thing you will find is this great sea\
is probably death.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31688, 
               Direction = "south", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31690, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31690] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31690, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are standing on a vast sand dune which is high enough for you to see\
clearly across the sea.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31689, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31691, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31691] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31691, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are among many sand dunes. All around you the great sand dunes tower over\
you and you now wonder what you're doing here.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31690, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31692, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31692] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31692, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The vast sand dunes around you make you feel enclosed. For as far as you can\
see there is only sand.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31691, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31693, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31693] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31693, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are going endlessly over sand dunes wondering why you are here.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31692, 
               Direction = "east", 
            }, 
         }, 
      }, 
      [31694] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31694, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are standing in front of a largely spaced sea of sand dunes which seems\
never ending.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31685, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31695, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31695] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31695, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are leaving any hopes of finding civilization behind. The only thing you\
shall find out here is certain death.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31694, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31696, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31696] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31696, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are looking endlessly at the sand around you. You are but only a small\
figure compared to the sand surrounding you.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31702, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31695, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31697, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31697] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31697, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are on a sand dune. You can glare far out into the dune sea, but all you\
can see is sand, sand and more sand.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31706, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31696, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31711, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31698] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31698, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are standing in front of a sand dune. In all directions but the one you\
came are sand dunes.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31699, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31685, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31699] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31699, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The sand is thicker now that you are on the sand dunes. The great sea is\
greater than you thought and it might be wise to turn back now.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31700, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31698, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31700] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31700, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are on a sand dune. As you look the sand dunes never end in this vast sea.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31701, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31699, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31701] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31701, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are in the endless sea of sand dunes. All around you all you can see is\
sand.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31700, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31702] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31702, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are still in the endless sea of sand dunes. As you peer around yourself\
it feels hopeless in regards to where you are.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31703, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31696, 
               Direction = "south", 
            }, 
         }, 
      }, 
      [31703] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31703, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are in between many sand dunes. They are around you from every angle and\
you feel enclosed because of their height.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31704, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31702, 
               Direction = "south", 
            }, 
         }, 
      }, 
      [31704] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31704, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are on the side of a sand dune. You look around you and there are still\
no traces of life.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31705, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31703, 
               Direction = "south", 
            }, 
         }, 
      }, 
      [31705] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31705, 
         ExtraDescriptions = 
         {
         }, 
         Description = "All around you all you can see is sand. The towering sand dunes are all\
around you and you cannot figure out where you are.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31704, 
               Direction = "south", 
            }, 
         }, 
      }, 
      [31706] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31706, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are standing on soft sand. With sand dunes surrounding you, you just\
keep on walking.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31707, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31697, 
               Direction = "south", 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31714, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31707] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31707, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are walking on a sand dune. All around you there are sand dunes. They\
tower high over you until you reach the top of one and start heading back\
down.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31708, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31706, 
               Direction = "south", 
            }, 
         }, 
      }, 
      [31708] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31708, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are standing on the top of a sand dune. And as you hope for something all\
you can see is the voyage down the side of yet another sand dune.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31709, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31707, 
               Direction = "south", 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31718, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31709] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31709, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are heading down the side of a dune. Its size makes you feel tired for it\
only makes the journey longer.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31710, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31708, 
               Direction = "south", 
            }, 
         }, 
      }, 
      [31710] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31710, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are surrounded by sand dunes and as they tower over you, you feel\
enclosed.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31709, 
               Direction = "south", 
            }, 
         }, 
      }, 
      [31711] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31711, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are enlosed by many sand dunes which lay around you.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31697, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31712, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31712] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31712, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are on a sand dune. You can only see sand and formations of dunes in your range of vision.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31711, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31713, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31713] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31713, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are standing on the top of a sand dune. You feel bigger when you reach the\
top of a sand dune but there is always the way down to think about.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31712, 
               Direction = "east", 
            }, 
         }, 
      }, 
      [31714] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31714, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are walking down the side of a sand dune. All around you is sand as far\
as you can see.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31706, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31715, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31715] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31715, 
         ExtraDescriptions = 
         {
         }, 
         Description = "The dunes around you are normal as you walk over the endless amount of sand.\
The sea of rippling sand still surrounds you with overwhelming greatness. The\
sand has a reflective shine to it assisted by the sunrays of the heating suns.\
You feel enclosed because the dunes tower over you greatly.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31714, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31716, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31716] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31716, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are on the side of a dune. It is a large dune so walking down it only to\
walk up another is starting to bother you. The dunes around you are normal as\
you walk over the endless amount of sand. The sea of rippling sand still\
surrounds you with overwhelming greatness. The sand has a reflective shine to\
it assisted by the sunrays of the heating suns. You feel enclosed because the\
dunes tower over you greatly.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31715, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31717, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31717] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31717, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are standing in between various sand dunes of all sizes and shapes.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31716, 
               Direction = "east", 
            }, 
         }, 
      }, 
      [31718] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31718, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are walking on soft sand. The sand dunes tower around you from all\
directions.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31708, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31719, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31719] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31719, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are on the side of a sand dune approaching the top.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31718, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31720, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31720] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31720, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are on the top edge of a sand dune. As you peer around you there is only\
sand.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31719, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31721, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31721] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31721, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are standing on the side of the sharply shaped sand dune. You are\
approaching the bottom once again so that you can continue with your\
journey.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31722, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31720, 
               Direction = "east", 
            }, 
         }, 
      }, 
      [31722] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31722, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are on a large sand dune. All around you can see sand.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31723, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31721, 
               Direction = "south", 
            }, 
         }, 
      }, 
      [31723] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31723, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are walking on the side of a sand dune. All around you sand dunes tower\
over you.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31722, 
               Direction = "south", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31724, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31724] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31724, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are standing on the top of a sand dune. All around you there is sand.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31725, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31723, 
               Direction = "east", 
            }, 
         }, 
      }, 
      [31725] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31725, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are surrounded by sand from all sides and feel enclosed.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31724, 
               Direction = "south", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31726, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31726] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31726, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are standing on the top of a sand dune. You can see what seems to be a\
palace of some sort in the side of a sand dune just ahead.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31725, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31727, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31727] = 
      {
         Name = "Desert", 
         TeleVnum = 0, 
         Vnum = 31727, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are standing in front of what you now recognize as Jabba the Hutt's former\
home.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31728, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31726, 
               Direction = "east", 
            }, 
         }, 
      }, 
      [31728] = 
      {
         Name = "In Front Of Jabba's Palace", 
         TeleVnum = 0, 
         Vnum = 31728, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are in front of a large door. It seems to not have been opened in years.\
", 
         Tunnel = 0, 
         Sector = "desert", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Direction = "north", 
               Distance = 0, 
               DestinationVnum = 31729, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31727, 
               Direction = "south", 
            }, 
         }, 
      }, 
      [31729] = 
      {
         Name = "Entrance To Jabba's Palace", 
         TeleVnum = 0, 
         Vnum = 31729, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are standing in a large opening surrounded by large walls which tower\
around you. It is very dark in here and you can only continue to the north.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31730, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Direction = "south", 
               Distance = 0, 
               DestinationVnum = 31728, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31730] = 
      {
         Name = "Hallway In Jabba's Palace", 
         TeleVnum = 0, 
         Vnum = 31730, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are walking down a corridor towards the what seems to be a large room.\
The air around you is thick and has a foul odor.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31731, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31729, 
               Direction = "south", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31731] = 
      {
         Name = "In Front Of Audience Chamber", 
         TeleVnum = 0, 
         Vnum = 31731, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are standing in front of the large audience chamber. It was designed to\
hold many people including dancing girls, bands and tables full of people.\
But, since the Monks took over the palace it has not been used.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31732, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31733, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31730, 
               Direction = "south", 
            }, 
            [4] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31734, 
               Direction = "west", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31732] = 
      {
         Name = "Jabba's Dais", 
         TeleVnum = 0, 
         Vnum = 31732, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are standing on Jabba the Hutt's former Dais. It is a very large area\
which has an exellent view of the audience chamber.\
", 
         Tunnel = 0, 
         Sector = "inside", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31731, 
               Direction = "south", 
            }, 
         }, 
      }, 
      [31733] = 
      {
         Name = "Trapdoor", 
         TeleVnum = 0, 
         Vnum = 31733, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are standing directly on the trapdoor that was used to feed traitors to\
the Rancor which was killed by Luke Skywalker.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31800, 
               Direction = "south", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31731, 
               Direction = "west", 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31798, 
               Direction = "down", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31734] = 
      {
         Name = "Audience Chambers", 
         TeleVnum = 0, 
         Vnum = 31734, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are in the audience chambers of the palace. You can go up the stairs\
towards some of the living quarters of the monks.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31736, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31731, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31735, 
               Direction = "up", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31735] = 
      {
         Name = "Upper Level Entrance", 
         TeleVnum = 0, 
         Vnum = 31735, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are on the upper level of the palace that is now inhabited by mainly\
boormir monks and spiderwalkers.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31746, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31734, 
               Direction = "down", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31736] = 
      {
         Name = "Beside The Dais", 
         TeleVnum = 0, 
         Vnum = 31736, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are standing beside the Dais of the former Jabba the Hutt. From here you\
cannot see very well but you are very near the Dais.\
", 
         Tunnel = 0, 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31734, 
               Direction = "south", 
            }, 
         }, 
         Sector = "inside", 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
      }, 
      [31737] = 
      {
         Name = "Beside The Dais", 
         TeleVnum = 0, 
         Vnum = 31737, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are standing beside the Dais. From here you have a good view of the chambers.\
", 
         Tunnel = 0, 
         Sector = "inside", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31733, 
               Direction = "south", 
            }, 
         }, 
      }, 
      [31738] = 
      {
         Name = "Wastes", 
         TeleVnum = 0, 
         Vnum = 31738, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are standing on a flat rocky surface. As you peer around you see that the\
Jundland Wastes are very large.\
", 
         Tunnel = 0, 
         Sector = "mountain", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31739, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31586, 
               Direction = "south", 
            }, 
         }, 
      }, 
      [31739] = 
      {
         Name = "Wastes", 
         TeleVnum = 0, 
         Vnum = 31739, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You walk around the Jundland Wastes. All around you there is a very\
strong odour.\
", 
         Tunnel = 0, 
         Sector = "mountain", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31740, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31738, 
               Direction = "south", 
            }, 
         }, 
      }, 
      [31740] = 
      {
         Name = "Wastes", 
         TeleVnum = 0, 
         Vnum = 31740, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You stand on rock. It is a very large area you are about to explore. The odour\
is still strong around you.\
", 
         Tunnel = 0, 
         Sector = "mountain", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31741, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31739, 
               Direction = "south", 
            }, 
         }, 
      }, 
      [31741] = 
      {
         Name = "Wastes", 
         TeleVnum = 0, 
         Vnum = 31741, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You can see lots of rocks and cliffs of many different shapes and sizes all\
around you. The odour is still all around you.\
", 
         Tunnel = 0, 
         Sector = "mountain", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31740, 
               Direction = "south", 
            }, 
         }, 
      }, 
      [31742] = 
      {
         Name = "Vague Area", 
         TeleVnum = 0, 
         Vnum = 31742, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You are walking through the Jundland Wastes. All around you there is a\
distinct odour. Things and small creatures many dead lay here but cannot be\
taken without effort, they must not be worth anything.\
", 
         Tunnel = 0, 
         Sector = "mountain", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31743, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31589, 
               Direction = "west", 
            }, 
         }, 
      }, 
      [31743] = 
      {
         Name = "Wastes", 
         TeleVnum = 0, 
         Vnum = 31743, 
         ExtraDescriptions = 
         {
         }, 
         Description = "You walk down a path through the wastes. All around you the odour thickens.\
", 
         Tunnel = 0, 
         Sector = "mountain", 
         TeleDelay = 0, 
         Exits = 
         {
            [1] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31744, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Description = "", 
               Keyword = "", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31742, 
               Direction = "west", 
            }, 
         }, 
      }, 
   }, 
   Resets = 
   {
      [1] = 
      {
         Arg1 = 31500, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31767, 
         MiscData = 1, 
      }, 
      [2] = 
      {
         Arg1 = 31500, 
         Command = "E", 
         Arg2 = 100, 
         Arg3 = 0, 
         MiscData = 1, 
      }, 
      [3] = 
      {
         Arg1 = 31501, 
         Command = "O", 
         Arg2 = 100, 
         Arg3 = 31756, 
         MiscData = 1, 
      }, 
      [4] = 
      {
         Arg1 = 31501, 
         Command = "O", 
         Arg2 = 100, 
         Arg3 = 31756, 
         MiscData = 1, 
      }, 
      [5] = 
      {
         Arg1 = 31500, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31756, 
         MiscData = 1, 
      }, 
      [6] = 
      {
         Arg1 = 31500, 
         Command = "E", 
         Arg2 = 100, 
         Arg3 = 0, 
         MiscData = 1, 
      }, 
      [7] = 
      {
         Arg1 = 31501, 
         Command = "O", 
         Arg2 = 100, 
         Arg3 = 31759, 
         MiscData = 1, 
      }, 
      [8] = 
      {
         Arg1 = 31501, 
         Command = "O", 
         Arg2 = 100, 
         Arg3 = 31758, 
         MiscData = 1, 
      }, 
      [9] = 
      {
         Arg1 = 31501, 
         Command = "O", 
         Arg2 = 100, 
         Arg3 = 31758, 
         MiscData = 1, 
      }, 
      [10] = 
      {
         Arg1 = 31501, 
         Command = "O", 
         Arg2 = 100, 
         Arg3 = 31758, 
         MiscData = 1, 
      }, 
      [11] = 
      {
         Arg1 = 31502, 
         Command = "O", 
         Arg2 = 100, 
         Arg3 = 31588, 
         MiscData = 1, 
      }, 
      [12] = 
      {
         Arg1 = 31502, 
         Command = "O", 
         Arg2 = 100, 
         Arg3 = 31588, 
         MiscData = 1, 
      }, 
      [13] = 
      {
         Arg1 = 31502, 
         Command = "O", 
         Arg2 = 100, 
         Arg3 = 31588, 
         MiscData = 1, 
      }, 
      [14] = 
      {
         Arg1 = 31503, 
         Command = "O", 
         Arg2 = 100, 
         Arg3 = 31806, 
         MiscData = 1, 
      }, 
      [15] = 
      {
         Arg1 = 31503, 
         Command = "O", 
         Arg2 = 100, 
         Arg3 = 31806, 
         MiscData = 1, 
      }, 
      [16] = 
      {
         Arg1 = 31502, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31806, 
         MiscData = 1, 
      }, 
      [17] = 
      {
         Arg1 = 31504, 
         Command = "E", 
         Arg2 = 100, 
         Arg3 = 0, 
         MiscData = 1, 
      }, 
      [18] = 
      {
         Arg1 = 31505, 
         Command = "E", 
         Arg2 = 100, 
         Arg3 = 6, 
         MiscData = 1, 
      }, 
      [19] = 
      {
         Arg1 = 31505, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31831, 
         MiscData = 1, 
      }, 
      [20] = 
      {
         Arg1 = 31508, 
         Command = "O", 
         Arg2 = 100, 
         Arg3 = 31833, 
         MiscData = 1, 
      }, 
      [21] = 
      {
         Arg1 = 31511, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31837, 
         MiscData = 1, 
      }, 
      [22] = 
      {
         Arg1 = 31511, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31837, 
         MiscData = 1, 
      }, 
      [23] = 
      {
         Arg1 = 31511, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31837, 
         MiscData = 1, 
      }, 
      [24] = 
      {
         Arg1 = 31511, 
         Command = "E", 
         Arg2 = 100, 
         Arg3 = 16, 
         MiscData = 1, 
      }, 
      [25] = 
      {
         Arg1 = 31510, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31838, 
         MiscData = 1, 
      }, 
      [26] = 
      {
         Arg1 = 31508, 
         Command = "O", 
         Arg2 = 100, 
         Arg3 = 31831, 
         MiscData = 1, 
      }, 
      [27] = 
      {
         Arg1 = 31514, 
         Command = "O", 
         Arg2 = 100, 
         Arg3 = 31612, 
         MiscData = 1, 
      }, 
      [28] = 
      {
         Arg1 = 31517, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31847, 
         MiscData = 1, 
      }, 
      [29] = 
      {
         Arg1 = 31516, 
         Command = "E", 
         Arg2 = 100, 
         Arg3 = 6, 
         MiscData = 1, 
      }, 
      [30] = 
      {
         Arg1 = 31515, 
         Command = "E", 
         Arg2 = 100, 
         Arg3 = 13, 
         MiscData = 1, 
      }, 
      [31] = 
      {
         Arg1 = 31850, 
         Command = "D", 
         Arg2 = 5, 
         Arg3 = 2, 
         MiscData = 1, 
      }, 
      [32] = 
      {
         Arg1 = 31518, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31851, 
         MiscData = 1, 
      }, 
      [33] = 
      {
         Arg1 = 31517, 
         Command = "E", 
         Arg2 = 100, 
         Arg3 = 16, 
         MiscData = 1, 
      }, 
      [34] = 
      {
         Arg1 = 31515, 
         Command = "M", 
         Arg2 = 4, 
         Arg3 = 31852, 
         MiscData = 1, 
      }, 
      [35] = 
      {
         Arg1 = 31515, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31852, 
         MiscData = 1, 
      }, 
      [36] = 
      {
         Arg1 = 31515, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31852, 
         MiscData = 1, 
      }, 
      [37] = 
      {
         Arg1 = 31515, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31852, 
         MiscData = 1, 
      }, 
      [38] = 
      {
         Arg1 = 31515, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31852, 
         MiscData = 1, 
      }, 
      [39] = 
      {
         Arg1 = 31515, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31852, 
         MiscData = 1, 
      }, 
      [40] = 
      {
         Arg1 = 31512, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31715, 
         MiscData = 1, 
      }, 
      [41] = 
      {
         Arg1 = 31512, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31715, 
         MiscData = 1, 
      }, 
      [42] = 
      {
         Arg1 = 31513, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31715, 
         MiscData = 1, 
      }, 
      [43] = 
      {
         Arg1 = 31514, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31715, 
         MiscData = 1, 
      }, 
      [44] = 
      {
         Arg1 = 31513, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31715, 
         MiscData = 1, 
      }, 
      [45] = 
      {
         Arg1 = 31516, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31715, 
         MiscData = 1, 
      }, 
      [46] = 
      {
         Arg1 = 31516, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31715, 
         MiscData = 1, 
      }, 
      [47] = 
      {
         Arg1 = 31519, 
         Command = "O", 
         Arg2 = 100, 
         Arg3 = 31853, 
         MiscData = 1, 
      }, 
      [48] = 
      {
         Arg1 = 31519, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31863, 
         MiscData = 1, 
      }, 
      [49] = 
      {
         Arg1 = 31520, 
         Command = "O", 
         Arg2 = 100, 
         Arg3 = 31863, 
         MiscData = 1, 
      }, 
      [50] = 
      {
         Arg1 = 31520, 
         Command = "M", 
         Arg2 = 12, 
         Arg3 = 31871, 
         MiscData = 1, 
      }, 
      [51] = 
      {
         Arg1 = 31520, 
         Command = "M", 
         Arg2 = 12, 
         Arg3 = 31871, 
         MiscData = 1, 
      }, 
      [52] = 
      {
         Arg1 = 31520, 
         Command = "M", 
         Arg2 = 12, 
         Arg3 = 31871, 
         MiscData = 1, 
      }, 
      [53] = 
      {
         Arg1 = 31520, 
         Command = "M", 
         Arg2 = 12, 
         Arg3 = 31871, 
         MiscData = 1, 
      }, 
      [54] = 
      {
         Arg1 = 31520, 
         Command = "M", 
         Arg2 = 12, 
         Arg3 = 31871, 
         MiscData = 1, 
      }, 
      [55] = 
      {
         Arg1 = 31520, 
         Command = "M", 
         Arg2 = 12, 
         Arg3 = 31871, 
         MiscData = 1, 
      }, 
      [56] = 
      {
         Arg1 = 31501, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31817, 
         MiscData = 1, 
      }, 
      [57] = 
      {
         Arg1 = 31509, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 12, 
         MiscData = 1, 
      }, 
      [58] = 
      {
         MiscData = 1, 
         Arg1 = 10314, 
         Arg2 = 1, 
         Command = "G", 
      }, 
      [59] = 
      {
         Arg1 = 31504, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31861, 
         MiscData = 1, 
      }, 
      [60] = 
      {
         Arg1 = 31527, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31861, 
         MiscData = 1, 
      }, 
      [61] = 
      {
         Arg1 = 31507, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31861, 
         MiscData = 1, 
      }, 
      [62] = 
      {
         Arg1 = 31526, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31862, 
         MiscData = 1, 
      }, 
      [63] = 
      {
         Arg1 = 31521, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31862, 
         MiscData = 1, 
      }, 
      [64] = 
      {
         Arg1 = 31524, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31862, 
         MiscData = 1, 
      }, 
      [65] = 
      {
         Arg1 = 31525, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31857, 
         MiscData = 1, 
      }, 
      [66] = 
      {
         Arg1 = 31506, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31857, 
         MiscData = 1, 
      }, 
      [67] = 
      {
         Arg1 = 31527, 
         Command = "M", 
         Arg2 = 2, 
         Arg3 = 31854, 
         MiscData = 1, 
      }, 
      [68] = 
      {
         Arg1 = 31523, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31854, 
         MiscData = 1, 
      }, 
      [69] = 
      {
         Arg1 = 31525, 
         Command = "M", 
         Arg2 = 2, 
         Arg3 = 31854, 
         MiscData = 1, 
      }, 
      [70] = 
      {
         Arg1 = 31528, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31854, 
         MiscData = 1, 
      }, 
      [71] = 
      {
         Arg1 = 31526, 
         Command = "M", 
         Arg2 = 2, 
         Arg3 = 31856, 
         MiscData = 1, 
      }, 
      [72] = 
      {
         Arg1 = 31528, 
         Command = "M", 
         Arg2 = 2, 
         Arg3 = 31856, 
         MiscData = 1, 
      }, 
      [73] = 
      {
         Arg1 = 31529, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31858, 
         MiscData = 1, 
      }, 
      [74] = 
      {
         Arg1 = 31520, 
         Command = "M", 
         Arg2 = 13, 
         Arg3 = 31855, 
         MiscData = 1, 
      }, 
      [75] = 
      {
         Arg1 = 31524, 
         Command = "M", 
         Arg2 = 2, 
         Arg3 = 31855, 
         MiscData = 1, 
      }, 
      [76] = 
      {
         Arg1 = 31503, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31653, 
         MiscData = 1, 
      }, 
      [77] = 
      {
         Arg1 = 31514, 
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 31840, 
         MiscData = 1, 
      }, 
      [78] = 
      {
         Arg1 = 31520, 
         Command = "M", 
         Arg2 = 19, 
         Arg3 = 31870, 
         MiscData = 1, 
      }, 
      [79] = 
      {
         Arg1 = 31520, 
         Command = "M", 
         Arg2 = 19, 
         Arg3 = 31870, 
         MiscData = 1, 
      }, 
      [80] = 
      {
         Arg1 = 31520, 
         Command = "M", 
         Arg2 = 19, 
         Arg3 = 31870, 
         MiscData = 1, 
      }, 
      [81] = 
      {
         Arg1 = 31520, 
         Command = "M", 
         Arg2 = 19, 
         Arg3 = 31870, 
         MiscData = 1, 
      }, 
      [82] = 
      {
         Arg1 = 31520, 
         Command = "M", 
         Arg2 = 19, 
         Arg3 = 31870, 
         MiscData = 1, 
      }, 
      [83] = 
      {
         Arg1 = 31520, 
         Command = "M", 
         Arg2 = 19, 
         Arg3 = 31870, 
         MiscData = 1, 
      }, 
      [84] = 
      {
         Arg1 = 31521, 
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 31830, 
         MiscData = 1, 
      }, 
      [85] = 
      {
         Arg1 = 31531, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31875, 
         MiscData = 1, 
      }, 
      [86] = 
      {
         Arg1 = 31504, 
         Command = "M", 
         Arg2 = 100, 
         Arg3 = 31601, 
         MiscData = 0, 
      }, 
      [87] = 
      {
         Arg1 = 31504, 
         Command = "M", 
         Arg2 = 100, 
         Arg3 = 31602, 
         MiscData = 0, 
      }, 
      [88] = 
      {
         Arg1 = 31504, 
         Command = "M", 
         Arg2 = 100, 
         Arg3 = 31603, 
         MiscData = 0, 
      }, 
      [89] = 
      {
         Arg1 = 31504, 
         Command = "M", 
         Arg2 = 100, 
         Arg3 = 31604, 
         MiscData = 0, 
      }, 
      [90] = 
      {
         Arg1 = 31504, 
         Command = "M", 
         Arg2 = 100, 
         Arg3 = 31819, 
         MiscData = 0, 
      }, 
      [91] = 
      {
         Arg1 = 31504, 
         Command = "M", 
         Arg2 = 100, 
         Arg3 = 31821, 
         MiscData = 0, 
      }, 
      [92] = 
      {
         Arg1 = 31504, 
         Command = "M", 
         Arg2 = 100, 
         Arg3 = 31822, 
         MiscData = 0, 
      }, 
      [93] = 
      {
         Arg1 = 31504, 
         Command = "M", 
         Arg2 = 100, 
         Arg3 = 31824, 
         MiscData = 0, 
      }, 
      [94] = 
      {
         Arg1 = 31504, 
         Command = "M", 
         Arg2 = 100, 
         Arg3 = 31828, 
         MiscData = 0, 
      }, 
      [95] = 
      {
         Arg1 = 31504, 
         Command = "M", 
         Arg2 = 100, 
         Arg3 = 31829, 
         MiscData = 0, 
      }, 
      [96] = 
      {
         Arg1 = 31504, 
         Command = "M", 
         Arg2 = 100, 
         Arg3 = 31830, 
         MiscData = 0, 
      }, 
      [97] = 
      {
         Arg1 = 31504, 
         Command = "M", 
         Arg2 = 100, 
         Arg3 = 31832, 
         MiscData = 0, 
      }, 
      [98] = 
      {
         Arg1 = 31504, 
         Command = "M", 
         Arg2 = 100, 
         Arg3 = 31834, 
         MiscData = 0, 
      }, 
      [99] = 
      {
         Arg1 = 31504, 
         Command = "M", 
         Arg2 = 100, 
         Arg3 = 31835, 
         MiscData = 0, 
      }, 
      [100] = 
      {
         Arg1 = 31504, 
         Command = "M", 
         Arg2 = 100, 
         Arg3 = 31837, 
         MiscData = 0, 
      }, 
      [101] = 
      {
         Arg1 = 31503, 
         Command = "M", 
         Arg2 = 20, 
         Arg3 = 31601, 
         MiscData = 0, 
      }, 
      [102] = 
      {
         Arg1 = 31503, 
         Command = "M", 
         Arg2 = 20, 
         Arg3 = 31602, 
         MiscData = 0, 
      }, 
      [103] = 
      {
         Arg1 = 31503, 
         Command = "M", 
         Arg2 = 20, 
         Arg3 = 31603, 
         MiscData = 0, 
      }, 
      [104] = 
      {
         Arg1 = 31503, 
         Command = "M", 
         Arg2 = 20, 
         Arg3 = 31604, 
         MiscData = 0, 
      }, 
      [105] = 
      {
         Arg1 = 31503, 
         Command = "M", 
         Arg2 = 20, 
         Arg3 = 31653, 
         MiscData = 0, 
      }, 
      [106] = 
      {
         Arg1 = 31503, 
         Command = "M", 
         Arg2 = 20, 
         Arg3 = 31840, 
         MiscData = 0, 
      }, 
      [107] = 
      {
         Arg1 = 31532, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31883, 
         MiscData = 1, 
      }, 
      [108] = 
      {
         Arg1 = 328, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31863, 
         MiscData = 0, 
      }, 
      [109] = 
      {
         Arg1 = 55, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 16, 
         MiscData = 1, 
      }, 
      [110] = 
      {
         Arg1 = 31900, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31905, 
         MiscData = 1, 
      }, 
      [111] = 
      {
         MiscData = 1, 
         Arg1 = 10323, 
         Arg2 = 1, 
         Command = "G", 
      }, 
      [112] = 
      {
         MiscData = 1, 
         Arg1 = 10324, 
         Arg2 = 1, 
         Command = "G", 
      }, 
      [113] = 
      {
         Arg1 = 31525, 
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 31899, 
         MiscData = 1, 
      }, 
      [114] = 
      {
         Arg1 = 31526, 
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 31900, 
         MiscData = 1, 
      }, 
      [115] = 
      {
         Arg1 = 31527, 
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 31998, 
         MiscData = 0, 
      }, 
      [116] = 
      {
         Arg1 = 31528, 
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 31997, 
         MiscData = 0, 
      }, 
      [117] = 
      {
         Arg1 = 31901, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31909, 
         MiscData = 1, 
      }, 
      [118] = 
      {
         Arg1 = 10323, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 16, 
         MiscData = 1, 
      }, 
      [119] = 
      {
         Arg1 = 31902, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31901, 
         MiscData = 1, 
      }, 
      [120] = 
      {
         Arg1 = 31529, 
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 31901, 
         MiscData = 1, 
      }, 
      [121] = 
      {
         Arg1 = 31522, 
         Command = "P", 
         Arg2 = 1, 
         Arg3 = 0, 
         MiscData = 0, 
      }, 
      [122] = 
      {
         Arg1 = 31524, 
         Command = "P", 
         Arg2 = 1, 
         Arg3 = 0, 
         MiscData = 1, 
      }, 
      [123] = 
      {
         Arg1 = 31530, 
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 31902, 
         MiscData = 1, 
      }, 
      [124] = 
      {
         Arg1 = 31533, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31503, 
         MiscData = 1, 
      }, 
      [125] = 
      {
         MiscData = 1, 
         Arg1 = 32210, 
         Arg2 = 1, 
         Command = "G", 
      }, 
      [126] = 
      {
         Arg1 = 31532, 
         Command = "E", 
         Arg2 = 1, 
         Arg3 = 5, 
         MiscData = 1, 
      }, 
      [127] = 
      {
         Arg1 = 31531, 
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 31503, 
         MiscData = 1, 
      }, 
      [128] = 
      {
         Arg1 = 31534, 
         Command = "M", 
         Arg2 = 2, 
         Arg3 = 31502, 
         MiscData = 1, 
      }, 
      [129] = 
      {
         Arg1 = 31534, 
         Command = "M", 
         Arg2 = 2, 
         Arg3 = 31502, 
         MiscData = 1, 
      }, 
      [130] = 
      {
         Arg1 = 31534, 
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 31623, 
         MiscData = 1, 
      }, 
      [131] = 
      {
         Arg1 = 31623, 
         Command = "D", 
         Arg2 = 2, 
         Arg3 = 2, 
         MiscData = 0, 
      }, 
      [132] = 
      {
         Arg1 = 31534, 
         Command = "M", 
         Arg2 = 3, 
         Arg3 = 31908, 
         MiscData = 1, 
      }, 
      [133] = 
      {
         Arg1 = 31535, 
         Command = "O", 
         Arg2 = 1, 
         Arg3 = 31908, 
         MiscData = 1, 
      }, 
      [134] = 
      {
         Arg1 = 31535, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31626, 
         MiscData = 1, 
      }, 
      [135] = 
      {
         Arg1 = 31536, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31632, 
         MiscData = 1, 
      }, 
      [136] = 
      {
         Arg1 = 31537, 
         Command = "M", 
         Arg2 = 1, 
         Arg3 = 31636, 
         MiscData = 1, 
      }, 
   }, 
   FileFormatVersion = 1, 
   Author = "Satin", 
   HighEconomy = 0, 
   ResetFrequency = 0, 
   ResetMessage = "", 
}
