-- Tatooine
-- Last saved Thursday 26-Nov-2020 15:26:28

AreaEntry
{
   HighEconomy = 0, 
   FileFormatVersion = 1, 
   Name = "Tatooine", 
   Filename = "tatooine.lua", 
   Author = "Satin", 
   ResetFrequency = 3, 
   Objects = 
   {
      [31500] = 
      {
         Weight = 1, 
         Cost = 0, 
         Name = "candle", 
         Tag = "", 
         ItemType = "light", 
         Layers = 0, 
         Affects = 
         {
            [1] = 
            {
               Location = 18, 
               Modifier = 1, 
            }, 
         }, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 1, 
            [2] = 30, 
            [3] = 1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "a small white candle", 
         Flags = 
         {
            [0] = "Glow", 
            [10] = "AntiEvil", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "A candle rests here.", 
         Vnum = 31500, 
      }, 
      [31501] = 
      {
         Weight = 3, 
         Name = "brain jar", 
         Tag = "", 
         ItemType = "container", 
         Layers = 0, 
         Cost = 0, 
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
         ShortDescr = "a large brain jar with flashing lights", 
         Flags = 
         {
            [0] = "Glow", 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         Description = "A large jar containing a sacred brain lies here. ", 
         Vnum = 31501, 
      }, 
      [31502] = 
      {
         Weight = 100, 
         Name = "corpse dead Jawa", 
         Tag = "", 
         ItemType = "corpse", 
         Layers = 0, 
         ActionDescription = "", 
         Cost = 0, 
         ShortDescr = "a dead Jawa", 
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
            [1] = 
            {
               Keyword = "look jawa", 
               Description = "This jawa has been laying here for quite a while as it seems. His skin has\
\13begun decaying and you can see his bones in certain spots.", 
            }, 
         }, 
         Description = "A dead Jawa lies motionless on the ground here.", 
         Vnum = 31502, 
      }, 
      [31503] = 
      {
         ObjectValues = 
         {
            [1] = 97000, 
            [2] = 10000, 
            [3] = 11000, 
            [4] = 0, 
            [5] = 0, 
            [0] = 100000, 
         }, 
         Weight = 2, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "look egg", 
               Description = "A large egg with different colors on it lays here. It would probably not be\
\13wise to take it or the mother might get mad.", 
            }, 
         }, 
         Name = "Egg", 
         Tag = "", 
         ItemType = "trash", 
         Cost = 0, 
         Affects = 
         {
            [1] = 
            {
               Location = 9, 
               Modifier = 0, 
            }, 
         }, 
         ActionDescription = "", 
         Layers = 0, 
         ShortDescr = "a large egg", 
         Flags = 
         {
            [12] = "NoRemove", 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Description = "A large egg lays here, falling over every once in a while.", 
         Vnum = 31503, 
      }, 
      [31504] = 
      {
         Weight = 1, 
         Cost = 0, 
         Name = "Shiny krayt crystal", 
         Tag = "", 
         ItemType = "light", 
         ExtraDescriptions = 
         {
         }, 
         Affects = 
         {
            [1] = 
            {
               Location = 17, 
               Modifier = 5, 
            }, 
         }, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 9000, 
            [2] = 110, 
            [3] = 1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 100000, 
         }, 
         ShortDescr = "a shiny krayt crystal", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Description = "A shiny krayt crystal lays here.", 
         Vnum = 31504, 
      }, 
      [31505] = 
      {
         Weight = 1, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Pearl", 
         Tag = "", 
         ItemType = "armor", 
         Cost = 0, 
         ObjectValues = 
         {
            [1] = 2000, 
            [2] = 6000, 
            [3] = 1100, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10000, 
         }, 
         ActionDescription = "", 
         Layers = 0, 
         ShortDescr = "a krayt pearl", 
         Flags = 
         {
            [0] = "Glow", 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Description = "A glowing pearl lays here.", 
         Vnum = 31505, 
      }, 
      [31506] = 
      {
         Weight = 2, 
         Name = "Canteen", 
         Tag = "", 
         ItemType = "drink_container", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 10, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         ShortDescr = "a canteen", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Description = "A canteen rests here, waiting to be picked up.", 
         Vnum = 31506, 
      }, 
      [31507] = 
      {
         Weight = 5, 
         Name = "jug", 
         Tag = "", 
         ItemType = "drink_container", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 15, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 15, 
         }, 
         ShortDescr = "a jug of water", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Description = "A jug of water rests here.", 
         Vnum = 31507, 
      }, 
      [31508] = 
      {
         Weight = 1, 
         Name = "Circuit", 
         Tag = "", 
         ItemType = "circuit", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 1, 
            [2] = 5, 
            [3] = 3, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         ShortDescr = "a torn up circuit", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Description = "A torn up circuit lies here, waiting to be picked up.", 
         Vnum = 31508, 
      }, 
      [31509] = 
      {
         Weight = 3, 
         Cost = 0, 
         Name = "Jawa Robe", 
         Tag = "", 
         ItemType = "armor", 
         Layers = 0, 
         Affects = 
         {
            [1] = 
            {
               Location = 5, 
               Modifier = 0, 
            }, 
         }, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 1345, 
            [4] = 0, 
            [5] = 0, 
            [0] = 1, 
         }, 
         ShortDescr = "a dirty Jawa robe", 
         Flags = 
         {
            [0] = "Glow", 
            [18] = "SmallSize", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "A Jawa robe is here, waiting to be taken.", 
         Vnum = 31509, 
      }, 
      [31510] = 
      {
         Weight = 2, 
         Name = "Wire", 
         Tag = "", 
         ItemType = "trash", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 15, 
            [2] = 6, 
            [3] = 11, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         ShortDescr = "some wire", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Description = "Some wire is here, waiting to be taken", 
         Vnum = 31510, 
      }, 
      [31511] = 
      {
         Weight = 6, 
         Cost = 0, 
         Name = "Jawa Blaster", 
         Tag = "", 
         ItemType = "weapon", 
         ExtraDescriptions = 
         {
         }, 
         Affects = 
         {
            [1] = 
            {
               Location = 18, 
               Modifier = 0, 
            }, 
         }, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 6, 
            [3] = 6, 
            [4] = 0, 
            [5] = 0, 
            [0] = 7200, 
         }, 
         ShortDescr = "a Jawa Blaster", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Description = "A elegant little blaster lays here on the ground.", 
         Vnum = 31511, 
      }, 
      [31512] = 
      {
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = -259084288, 
            [4] = 0, 
            [5] = 0, 
            [0] = 200, 
         }, 
         Weight = 1, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "look belt", 
               Description = "This belt glows and hums with extreme power comming from it. This object cannot be handled by a mortal mind for its powers are to great.", 
            }, 
         }, 
         Name = "Glimmering Belt", 
         Tag = "", 
         ItemType = "armor", 
         Cost = 0, 
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
         ActionDescription = "", 
         Layers = 0, 
         ShortDescr = "Satin's Glimmering Belt.", 
         Flags = 
         {
            [0] = "Glow", 
         }, 
         WearFlags = 
         {
            [11] = "Waist", 
         }, 
         Description = "A powerful godly belt lays on the ground here.", 
         Vnum = 31512, 
      }, 
      [31513] = 
      {
         Weight = 1, 
         Name = "Stick", 
         Tag = "", 
         ItemType = "treasure", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 17000, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "a large stick", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Description = "A large stick of the Wise Storyteller lays here.", 
         Vnum = 31513, 
      }, 
      [31514] = 
      {
         Weight = 150, 
         Name = "large oak desk", 
         Tag = "", 
         ItemType = "furniture", 
         Layers = 0, 
         ActionDescription = "", 
         Cost = 0, 
         ShortDescr = "a large oak desk", 
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
         Description = "A large oak desk collects dust on the ground here.", 
         Vnum = 31514, 
      }, 
      [31515] = 
      {
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 1300, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         Weight = 4, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Belt", 
         Tag = "", 
         ItemType = "armor", 
         Cost = 0, 
         Affects = 
         {
            [1] = 
            {
               Location = 4, 
               Modifier = 0, 
            }, 
         }, 
         ActionDescription = "", 
         Layers = 0, 
         ShortDescr = "a mechanics belt", 
         Flags = 
         {
            [31] = "HumanSize", 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Description = "A mechanics belt lays here waiting to be used.", 
         Vnum = 31515, 
      }, 
      [31516] = 
      {
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 600, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         Weight = 2, 
         ExtraDescriptions = 
         {
         }, 
         Name = "Hat", 
         Tag = "", 
         ItemType = "armor", 
         Cost = 0, 
         Affects = 
         {
            [1] = 
            {
               Location = 2, 
               Modifier = 0, 
            }, 
         }, 
         ActionDescription = "", 
         Layers = 0, 
         ShortDescr = "a mechanics hat", 
         Flags = 
         {
            [31] = "HumanSize", 
         }, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Description = "A mechanics hat collects dust on the ground.", 
         Vnum = 31516, 
      }, 
      [31517] = 
      {
         Weight = 8, 
         Name = "Ionization Gun", 
         Tag = "", 
         ItemType = "weapon", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 6, 
            [2] = 6, 
            [3] = 6, 
            [4] = 1000, 
            [5] = 1000, 
            [0] = 7200, 
         }, 
         ShortDescr = "a Jawa ionization gun", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [13] = "Wield", 
         }, 
         Description = "A Jawa ionization gun has been foolishly left behind.", 
         Vnum = 31517, 
      }, 
      [31518] = 
      {
         Weight = 5, 
         Name = "key", 
         Tag = "", 
         ItemType = "key", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
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
         ShortDescr = "a small hide Key", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Description = "A small key crafted from hide", 
         Vnum = 31518, 
      }, 
      [31519] = 
      {
         Weight = 900, 
         Name = "Detector", 
         Tag = "", 
         ItemType = "furniture", 
         Cost = 0, 
         Layers = 0, 
         ActionDescription = "", 
         MudProgs = 
         {
            [1] = 
            {
               Code = "if isdroid($n)\
    mpechoat $n The droid detector flashes and beeps as you enter.\
    mpechoaround $n The droid detector flashes and beeps as $n enters.\
    mpecho From within the cantina someone shouts, 'Hey! We don't serve your kind here!'\
endif\
", 
               Arguments = "100", 
               MudProgType = "greet_prog", 
               ScriptType = "MProg", 
            }, 
         }, 
         ShortDescr = "a droid detector", 
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
         Description = "A droid detector is mounted on the wall here.", 
         Vnum = 31519, 
      }, 
      [31520] = 
      {
         Weight = 5, 
         Name = "Drink Machine", 
         Tag = "", 
         ItemType = "furniture", 
         Layers = 0, 
         Cost = 0, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 1, 
            [2] = 6, 
            [3] = 11, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "a large drink machine", 
         Flags = 
         {
            [0] = "Glow", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "A large and complex drink machine sits here. It is used by Wuher\
\13to dispense drinks.", 
         Vnum = 31520, 
      }, 
      [31521] = 
      {
         Weight = 1, 
         Name = "Bed", 
         Tag = "", 
         ItemType = "trash", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 0, 
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
         ShortDescr = "a bed", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Description = "A comfortable bed lays here. Maybe laying down would not hurt you.", 
         Vnum = 31521, 
      }, 
      [31522] = 
      {
         Weight = 1, 
         Name = "Bantha rib", 
         Tag = "", 
         ItemType = "food", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 10, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 3, 
         }, 
         ShortDescr = "a bantha rib", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Description = "A bantha rib is here for your enjoyment.", 
         Vnum = 31522, 
      }, 
      [31523] = 
      {
         Weight = 1, 
         Name = "Banthaburger", 
         Tag = "", 
         ItemType = "food", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 15, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 5, 
         }, 
         ShortDescr = "a banthaburger", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Description = "A banthaburger site here ready to eat.", 
         Vnum = 31523, 
      }, 
      [31524] = 
      {
         Weight = 1, 
         Name = "Grilled Womp Rat", 
         Tag = "", 
         ItemType = "food", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 16, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 4, 
         }, 
         ShortDescr = "some grilled womp rat", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Description = "Some grilled womp rat is here ready to be snatched up.", 
         Vnum = 31524, 
      }, 
      [31525] = 
      {
         Weight = 1, 
         Name = "hologram projector", 
         Tag = "", 
         ItemType = "trash", 
         Layers = 0, 
         ActionDescription = "", 
         Cost = 0, 
         ShortDescr = "a hologram projector", 
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
            [1] = 
            {
               Keyword = "hologram projector", 
               Description = "This projector creates an illusory wall to the north to keep\
\13this passage hidden.\
\13", 
            }, 
         }, 
         Description = "A hologram projector is here.", 
         Vnum = 31525, 
      }, 
      [31526] = 
      {
         Weight = 1, 
         Name = "worn couch", 
         Tag = "", 
         ItemType = "furniture", 
         Layers = 0, 
         ActionDescription = "", 
         Cost = 0, 
         ShortDescr = "a worn couch", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 3, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 3, 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "worn couch", 
               Description = "This couch looks very worn out. The seats look like they're made\
\13out of bantha hide, but you can't be sure.\
\13", 
            }, 
         }, 
         Description = "A worn couch is here.", 
         Vnum = 31526, 
      }, 
      [31527] = 
      {
         Weight = 1, 
         Name = "spacious seats", 
         Tag = "", 
         ItemType = "furniture", 
         Layers = 0, 
         ActionDescription = "", 
         Cost = 0, 
         ShortDescr = "spacious seats", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 2, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "spacious seats", 
               Description = "The seats are very comfortable, allowing even large species like Wookiees to\
stretch their legs.\
", 
            }, 
         }, 
         Description = "Rows of spacious seats fill this section.", 
         Vnum = 31527, 
      }, 
      [31528] = 
      {
         Weight = 1, 
         Name = "cramped seats", 
         Tag = "", 
         ItemType = "furniture", 
         Layers = 0, 
         ActionDescription = "", 
         Cost = 0, 
         ShortDescr = "cramped seats", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 2, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 10, 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "cramped seats", 
               Description = "The seats are very dirty, as you might expect on Tatooine. There's no room\
to stretch your legs, even if you're a Jawa.\
", 
            }, 
         }, 
         Description = "Cramped seats fill the economy section.", 
         Vnum = 31528, 
      }, 
      [31529] = 
      {
         Weight = 1, 
         Name = "refridgerator fridge", 
         Tag = "", 
         ItemType = "container", 
         Cost = 0, 
         Layers = 0, 
         ActionDescription = "", 
         MudProgs = 
         {
            [1] = 
            {
               Code = "from objs.fridge31529 import *\
", 
               Arguments = "100", 
               MudProgType = "rand_prog", 
               ScriptType = "Imp", 
            }, 
         }, 
         ShortDescr = "a refridgerator", 
         ObjectValues = 
         {
            [1] = 5, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 20, 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "refridgerator fridge", 
               Description = "The refridgerator is an older model, and gives off a fairly loud humming\
noise. It seems quite dirty on the outside. One can only hope it's better\
on the inside.\
", 
            }, 
         }, 
         Description = "A small refridgerator stands in a corner.", 
         Vnum = 31529, 
      }, 
      [31530] = 
      {
         Weight = 1, 
         Name = "fake flower", 
         Tag = "", 
         ItemType = "trash", 
         Layers = 0, 
         ActionDescription = "", 
         Cost = 0, 
         ShortDescr = "a fake flower", 
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
            [1] = 
            {
               Keyword = "fake flower", 
               Description = "The flower is deep purple. The stalk is about one meter long and has green\
leaves. The pot is white, with specks of dirt on it. The flower looks kind\
of real, but smells very fake.\
", 
            }, 
         }, 
         Description = "A large fake flower in a large pot.", 
         Vnum = 31530, 
      }, 
      [31531] = 
      {
         Weight = 1, 
         Name = "mysterious machinery", 
         Tag = "", 
         ItemType = "trash", 
         Layers = 0, 
         ActionDescription = "", 
         Cost = 0, 
         ShortDescr = "the machinery", 
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
            [1] = 
            {
               Keyword = "mysterious machinery", 
               Description = "This large machine towers above you for several meters. It have many large\
tubes, valves and gauges. It seems likely that the purpose of this machinery\
is to pump the sewer somewhere, but one can't be sure.\
", 
            }, 
         }, 
         Description = "Some mysterious-looking machinery is here, making a lot of noise.", 
         Vnum = 31531, 
      }, 
      [31532] = 
      {
         Weight = 1, 
         Name = "jumpsuit", 
         Tag = "", 
         ItemType = "armor", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "jumpsuit", 
               Description = "The jumpsuit is blue, and has multiple pockets. It full of oil and dirt, and smells\
pretty bad.\
", 
            }, 
         }, 
         Cost = 10, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 4, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 4, 
         }, 
         ShortDescr = "a jumpsuit", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
            [3] = "Body", 
         }, 
         Description = "A jumpsuit lies neatly folded on the ground.", 
         Vnum = 31532, 
      }, 
      [31533] = 
      {
         Weight = 1, 
         Name = "low-quality rodent skin", 
         Tag = "", 
         ItemType = "fabric", 
         ExtraDescriptions = 
         {
         }, 
         Cost = 25, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 2, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ShortDescr = "a low-quality rodent skin", 
         Layers = 0, 
         WearFlags = 
         {
            [0] = "Take", 
         }, 
         Description = "Some low-quality rodent skin is lying on the ground.", 
         Vnum = 31533, 
      }, 
      [31534] = 
      {
         Weight = 1, 
         Name = "platic table chairs", 
         Tag = "", 
         ItemType = "furniture", 
         Layers = 0, 
         ActionDescription = "", 
         Cost = 0, 
         ShortDescr = "a plastic table", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 1, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 6, 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "platic table chairs", 
               Description = "The table looks cheap and simple. The table legs are gray and the tabletop is\
white. At least it used to be white. Now it's slightly yellowed and dirty.\
", 
            }, 
         }, 
         Description = "A plastic table with some chairs is here.", 
         Vnum = 31534, 
      }, 
      [31535] = 
      {
         Weight = 1, 
         Name = "rusty pipes", 
         Tag = "", 
         ItemType = "trash", 
         Cost = 0, 
         Layers = 0, 
         ActionDescription = "", 
         MudProgs = 
         {
            [1] = 
            {
               Code = "mpecho The rusty pipes spew out more sewage into the river.\
", 
               Arguments = "25", 
               MudProgType = "rand_prog", 
               ScriptType = "MProg", 
            }, 
         }, 
         ShortDescr = "a few rusty pipes", 
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
         Description = "A few rusty pipes comes down from the ceiling.", 
         Vnum = 31535, 
      }, 
      [31536] = 
      {
         Weight = 1, 
         Name = "uncomfortable bed", 
         Tag = "", 
         ItemType = "furniture", 
         Layers = 0, 
         Cost = 0, 
         ActionDescription = "", 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 2, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 2, 
         }, 
         ShortDescr = "an uncomfortable bed", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "An uncomfortable bed is here.", 
         Vnum = 31536, 
      }, 
      [31537] = 
      {
         Weight = 1, 
         Name = "workbench drawers", 
         Tag = "", 
         ItemType = "container", 
         Layers = 0, 
         Cost = 0, 
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
         ShortDescr = "a workbench", 
         Flags = 
         {
            [30] = "Prototype", 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Description = "A workbench with drawers.", 
         Vnum = 31537, 
      }, 
      [31538] = 
      {
         Weight = 1, 
         Name = "mysterious book", 
         Tag = "", 
         ItemType = "book", 
         Layers = 0, 
         ActionDescription = "", 
         Cost = 0, 
         ShortDescr = "a mysterious book", 
         ObjectValues = 
         {
            [1] = 115, 
            [2] = -1, 
            [3] = -1, 
            [4] = 0, 
            [5] = 0, 
            [0] = 0, 
         }, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "mysterious book", 
               Description = "This is an old fashioned book with leather binding and actual paper pages.\
As you page through the volume, you can't believe what you're reading.\
It is a detailed account of how to construct a lightsaber! Maybe you\
should try to STUDY it.\
", 
            }, 
         }, 
         Description = "A mysterious book is here.", 
         Vnum = 31538, 
      }, 
      [31999] = 
      {
         Weight = 1, 
         Name = "lastobject", 
         Tag = "", 
         ItemType = "trash", 
         Layers = 0, 
         ActionDescription = "", 
         Cost = 0, 
         ShortDescr = "a newly created lastobject", 
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
         Description = "Some god dropped a newly created lastobject here.", 
         Vnum = 31999, 
      }, 
   }, 
   Rooms = 
   {
      [31744] = 
      {
         TeleDelay = 0, 
         Name = "Jundland Wastes", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31745, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31743, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "mountain", 
         TeleVnum = 0, 
         Vnum = 31744, 
         Description = "You can smell an odour developing around you.\
", 
      }, 
      [31745] = 
      {
         TeleDelay = 0, 
         Name = "Jundland Wastes", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31744, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "mountain", 
         TeleVnum = 0, 
         Vnum = 31745, 
         Description = "You stand on a hard rocky surface. The air around you is very unpleasant.\
", 
      }, 
      [31746] = 
      {
         TeleDelay = 0, 
         Name = "Long Hallway", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31747, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31735, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31746, 
         Description = "You are walking down a long, narrow hallway which turns at the end.\
", 
      }, 
      [31747] = 
      {
         TeleDelay = 0, 
         Name = "Hallway Through Jabba's Palace", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31748, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31746, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31747, 
         Description = "You are walking down a hallway. It is old and there is a rather digusting\
smell all around you.\
", 
      }, 
      [31748] = 
      {
         TeleDelay = 0, 
         Name = "Long Hallway in Jabba's Palace", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31749, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31747, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31748, 
         Description = "You are standing in a hallway. To each side all along the hall there are\
small individual rooms.\
", 
      }, 
      [31749] = 
      {
         TeleDelay = 0, 
         Name = "Long Hallway End", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31750, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31748, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31749, 
         Description = "You are coming to the end of the hallway which curves both to the east and\
to the west.\
", 
      }, 
      [31750] = 
      {
         TeleDelay = 0, 
         Name = "Narrow Hallway", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31751, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31749, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31770, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "up", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31788, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31750, 
         Description = "You are in a small narrow hallway which has a very disgusting odour, not\
surprising considering what creatures and animals have lived here in the past\
and even now. The ground is cool and hard full of ripples as if never crafted\
or taken care of.\
", 
      }, 
      [31751] = 
      {
         TeleDelay = 0, 
         Name = "Hallway Facing A Dark Room", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31768, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31752, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31769, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31750, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31751, 
         Description = "You are standing in a hallway facing east. As you look down the hallway at\
the end you can see different colored lights flashing in the dimness and the\
darkness. The ground is rough and the air is hot and heavy. Above a burnt out\
glowpanel lays motionless but you can still see pretty well.\
", 
      }, 
      [31752] = 
      {
         TeleDelay = 0, 
         Name = "Narrow Hallway ", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31766, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31753, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31767, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31751, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31752, 
         Description = "You are walking down a narrow hallway. To each side there are very small rooms\
which are vacant.\
", 
      }, 
      [31753] = 
      {
         TeleDelay = 0, 
         Name = "A Long Hallway ", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31764, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31754, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31765, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31752, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31753, 
         Description = "You are walking down a hallway towards a very large opening. It appears not\
to be guarded or have a door in place. The ground beneath you is hard and full\
of cracks and uneven places. The air is heavy and hot but nothing that cannot\
be lived with.\
", 
      }, 
      [31754] = 
      {
         TeleDelay = 0, 
         Name = "End Of Hallway Before A Large Room", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31762, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31755, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31763, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31753, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31754, 
         Description = "You approach the dark room at the end of the hallway with every step you\
take. To you sides you continually see small occupied rooms. The ground\
beneath your feet is rough and uneven making you feet ache all over. The\
lighting here is minimal but you can still see down the hall.\
", 
      }, 
      [31755] = 
      {
         TeleDelay = 0, 
         Name = "In Front Of A Large Room", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31760, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31756, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31761, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31754, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31755, 
         Description = "You are standing in front of a very large room with different sections in it.\
The entrance used to have doors but as you can see they have been removed for\
all that remains is the hinges.\
", 
      }, 
      [31756] = 
      {
         TeleDelay = 0, 
         Name = "Brain Jar Room", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31759, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31757, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31755, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [0] = "Dark", 
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31756, 
         Description = "You stand in a dark room filled with brain jars. Each brain is used to put\
inside of a spiderwalker. You can go down the rows in front of you. The ground\
is softer in here as if taken care of, there is not one ripple in the whole\
surface showing grace and care from the person or people that finished this\
room.\
", 
      }, 
      [31757] = 
      {
         TeleDelay = 0, 
         Name = "Brain Room", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31758, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31756, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [0] = "Dark", 
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31757, 
         Description = "All around you there are brains in jars. As you walk by they start screaming.\
As they scream the lights on the jars change color indicating that they are\
not calm at all. In front of you there is a row of containing shelves with\
jars gently placed on them.\
", 
      }, 
      [31758] = 
      {
         TeleDelay = 0, 
         Name = "Brain Compartment", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31757, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [0] = "Dark", 
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31758, 
         Description = "You are walking down a row. To your sides shelves are filled with brains from\
all species of the galaxy. These jars seem to be a bit calmer for their lights\
are not flaring off when you pass by them. this shows they are mature and\
prepared to be put into a body of some sort, most likely a spiderwalker.\
", 
      }, 
      [31759] = 
      {
         TeleDelay = 0, 
         Name = "Row Of Jars", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31756, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [0] = "Dark", 
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31759, 
         Description = "You are standing in a row with shelves in it. On each shelf jars have been\
placed carefully to ensure that they are safe and will not fall to the ground\
and break. The air is crisp and provides stability as you stare longly at the\
large amounts of jars.\
", 
      }, 
      [31760] = 
      {
         TeleDelay = 0, 
         Name = "Old Room", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31755, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31760, 
         Description = "You are standing in small room which was initially designed to home a person.\
It has a window facing the sun.\
", 
      }, 
      [31761] = 
      {
         TeleDelay = 0, 
         Name = "Dusty Old Room", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31755, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31761, 
         Description = "You are standing in room. It has dust all over it for it has not been used\
for many, many years.\
", 
      }, 
      [31762] = 
      {
         TeleDelay = 0, 
         Name = "Large Guest Room", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31754, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31762, 
         Description = "This is a larger room. It was probably designed to hold a larger species.\
", 
      }, 
      [31763] = 
      {
         TeleDelay = 0, 
         Name = "Old Small Calibered Room", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31754, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31763, 
         Description = "The room you are standing in is very small room. It has a window in the\
corner and an old bedframe in the corner which seems to have been destroyed by\
small rodents.\
", 
      }, 
      [31764] = 
      {
         TeleDelay = 0, 
         Name = "Storage Compartment For Droids", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31753, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31764, 
         Description = "You are standing in an extremely small room that was designed to hold a\
cleaning droid or two.\
", 
      }, 
      [31765] = 
      {
         TeleDelay = 0, 
         Name = "Large Specimen Room", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31753, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31765, 
         Description = "You are in a large room. It was made for a larger type species. It is used to\
house and for sleeping. This room has a very disgusting odour.\
", 
      }, 
      [31766] = 
      {
         TeleDelay = 0, 
         Name = "Small Unused Room", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31752, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31766, 
         Description = "You are standing in a small room with a window facing the great sand dune\
sea.\
", 
      }, 
      [31767] = 
      {
         TeleDelay = 0, 
         Name = "Habitated Room", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31752, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31767, 
         Description = "You are standing in a room which seems to be habitated. There is a small bed\
in the corner with a window mounted on the wall which looks outside.\
", 
      }, 
      [31768] = 
      {
         TeleDelay = 0, 
         Name = "Small Enclosed Room", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31751, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31768, 
         Description = "You are in a room of small caliber. You feel enclosed as you look around the\
room.\
", 
      }, 
      [31769] = 
      {
         TeleDelay = 0, 
         Name = "Unhabitated Room", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31751, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31769, 
         Description = "You are standing in a bedroom. It is not habitated but could be.\
", 
      }, 
      [31770] = 
      {
         TeleDelay = 0, 
         Name = "Long Hallway", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31750, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31771, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31770, 
         Description = "You walk down a long narrow hallway which floor is covered with stone and\
provides discomfort for your feet. To each side you can see some small and\
large rooms all with different uses. There is a glowpanel above your head\
barely functioning providing the dimmest of light all over.\
", 
      }, 
      [31771] = 
      {
         TeleDelay = 0, 
         Name = "A Hallway Passage", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31770, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31772, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31771, 
         Description = "The hallway you walk down is on an uneven\
surface, it has ripples all along it and provides not much for heat or for\
comfort. There is no lighting here but you can still see down the gloomy\
hallway but not always with ease.\
", 
      }, 
      [31772] = 
      {
         TeleDelay = 0, 
         Name = "Dense Hallway", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31782, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31771, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31784, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31773, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31772, 
         Description = "As you walk down the hallway on a cool stone floor you smell an odour, a\
rather unpleasant one, but having been in this palace it is no surprise that\
this smell is located here. The hallway is gloomy and the floor has a rough\
texture as if never smoothed out.\
", 
      }, 
      [31773] = 
      {
         TeleDelay = 0, 
         Name = "Long Narrowed Hallway", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31780, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31772, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31781, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31774, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31773, 
         Description = "The ground beneath your feet is made of pure stone, rather cold at night and\
still cool in the day the stone is what covers all the palace floors. You can\
see the end of the hallway just ahead of yourself. Large and without any\
features. Just a simple stone wall.\
", 
      }, 
      [31774] = 
      {
         TeleDelay = 0, 
         Name = "Hallway Leading To Individual Rooms", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31778, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31773, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31779, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31775, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31774, 
         Description = "The hallway you walk down is covered in stone, cold on your feet as you walk\
over it for it does not preserve heat well. A glowpanel above is burnt out\
and every once in a while a small burst of electricity comes rippling through\
the end of the cables. The air here is dense but not filled with a stench, a\
rather unusual thing for this palace. To both sides there are rooms of\
different caliber. There is a great stone wall stopping the end of the hall\
just ahead.\
", 
      }, 
      [31775] = 
      {
         TeleDelay = 0, 
         Name = "End Of A Long Hallway", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31776, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31774, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31777, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31775, 
         Description = "You are standing at the end of the hallway. There is a very large stone wall\
before you covering your way further down the hallway. The stone wall is\
thick and rough with different textures all over its surface.\
", 
      }, 
      [31776] = 
      {
         TeleDelay = 0, 
         Name = "Extra Small Compartment Room", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31775, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31776, 
         Description = "You are standing in room of very small caliber. It was probably constructed to\
hold extra blankets. There are closets all along the walls.\
", 
      }, 
      [31777] = 
      {
         TeleDelay = 0, 
         Name = "Large Old Room", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31775, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31777, 
         Description = "You are in a large room. It was probably used as a sleeping quarter. There is\
a small bed in the corner which has been chewed away at by a small rodent.\
", 
      }, 
      [31778] = 
      {
         TeleDelay = 0, 
         Name = "Well Sized Room", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31774, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31778, 
         Description = "You are in a well sized room. It was used as a living quarters in the past.\
", 
      }, 
      [31779] = 
      {
         TeleDelay = 0, 
         Name = "Habitated Living Quarters", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31774, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31779, 
         Description = "You are standing in a living quarters. It is currently habitated. You can\
tell because of food on the floor.\
", 
      }, 
      [31780] = 
      {
         TeleDelay = 0, 
         Name = "Supply Storage", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31773, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31780, 
         Description = "You are standing in a small room used to store extra supplies.\
", 
      }, 
      [31781] = 
      {
         TeleDelay = 0, 
         Name = "Large Living Quarters", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31773, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31781, 
         Description = "You are in a very large room. It was made as a living quaters. There is a\
large window in front of you.\
", 
      }, 
      [31782] = 
      {
         TeleDelay = 0, 
         Name = "Small Room", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31772, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31782, 
         Description = "You are in a smaller room. It can be used for any purpose.\
", 
      }, 
      [31784] = 
      {
         TeleDelay = 0, 
         Name = "Large Room", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31772, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31784, 
         Description = "You are standing in a large room. There is a bed that can hold any species\
and a large window on the back wall.\
", 
      }, 
      [31788] = 
      {
         TeleDelay = 0, 
         Name = "Top Of Staircase", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31789, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "down", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31750, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31788, 
         Description = "You are standing at the top of a staircase. In front of you there is a long\
hallway. Along the hallway many prison cells are there because Jabba use them\
for keeping people of unimportance.\
", 
      }, 
      [31789] = 
      {
         TeleDelay = 0, 
         Name = "Prison Hallway", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31788, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31790, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31789, 
         Description = "You are walking down the hallway. As you walk along you notice that all of\
the doors have been removed.\
", 
      }, 
      [31790] = 
      {
         TeleDelay = 0, 
         Name = "Prison Hallway", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31789, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31794, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31791, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31795, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31790, 
         Description = "You are in the hallway. It ends just up ahead making it a rather short\
corridor.\
", 
      }, 
      [31791] = 
      {
         TeleDelay = 0, 
         Name = "Prison Hallway End", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31790, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31792, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31793, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31791, 
         Description = "You have come to the end of the hall. A stone wall lays in front of you,\
preventing you from advancing.\
", 
      }, 
      [31792] = 
      {
         TeleDelay = 0, 
         Name = "Small Prison Cell", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31791, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31792, 
         Description = "You are standing in a prison cell. If you turn back there are metal bars\
across the wall. All around you the only furniture in this cell is a prison\
bed.\
", 
      }, 
      [31793] = 
      {
         TeleDelay = 0, 
         Name = "Large Prison Cell", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31791, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31793, 
         Description = "You are standing in a large prison cell. This cell was used for larger\
specimens. It has a toilet and a small bunk in the corner.\
", 
      }, 
      [31794] = 
      {
         TeleDelay = 0, 
         Name = "Extremely Small Cell", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31790, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31794, 
         Description = "You are standing in the smallest cell. This cell was used to hold very small\
specimens of life.\
", 
      }, 
      [31795] = 
      {
         TeleDelay = 0, 
         Name = "Very Large Prison Cell", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31790, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31795, 
         Description = "You are standing in a very large prison cell. It scares you to think what was\
kept in here. There is an awful smell.\
", 
      }, 
      [31796] = 
      {
         TeleDelay = 0, 
         Name = "Rancor's Pit", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Sector = "inside", 
         Vnum = 31796, 
         Description = "You just fell down the trapdoor into the rancor's pit. Here there is a very\
disgusting smell. This room is immense. To the north is the smaller\
compartment the rancor was kept in while his cage was cleaned.\
", 
      }, 
      [31797] = 
      {
         TeleDelay = 0, 
         Name = "DT", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Sector = "inside", 
         Vnum = 31797, 
         Description = "You get crushed by gate and die(d.t)\
", 
      }, 
      [31798] = 
      {
         TeleDelay = 0, 
         Name = "Rancor's Cage", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31799, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "up", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31733, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31798, 
         Description = "You just slid down the chute into the rancor's cage. The room is an immense\
room and has a very foul odour to it. To the north the smaller room lays which\
the rancor was put when the cage was cleaned.\
", 
      }, 
      [31799] = 
      {
         TeleDelay = 0, 
         Name = "DT", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31798, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31799, 
         Description = "EDIT\
", 
      }, 
      [31800] = 
      {
         TeleDelay = 0, 
         Name = "Hallway to Rancor Pit", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31733, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31802, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31801, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31800, 
         Description = "You are standing in front of hallway which leads down into the rancor pit. To\
the south is the kitchen. To continue down the hall go east.\
", 
      }, 
      [31801] = 
      {
         TeleDelay = 0, 
         Name = "Jabba's Palace's Kitchen", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31800, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31801, 
         Description = "You are standing inside the kitchen that is used to make Jabba the Hutt's\
disgusting foods. There is a table in the center of the room with a cutting\
board and extra utensils. On the wall there are many shelves and utensils\
layed everywhere.\
", 
      }, 
      [31802] = 
      {
         TeleDelay = 0, 
         Name = "Hallway Past Docking Bay", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31803, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31800, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31802, 
         Description = "You are walking down a hall which passes the docking bay and many living\
quarters.\
", 
      }, 
      [31803] = 
      {
         TeleDelay = 0, 
         Name = "Hallway Past A Room", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31802, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31803, 
         Description = "You are standing in front of one of many rooms located on the bottom level.\
", 
      }, 
      [31804] = 
      {
         TeleDelay = 0, 
         Name = "Landing Pad 6", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Sector = "city", 
         Vnum = 31804, 
         Description = "You are standing on a rather small sized landing pad. It can be used to keep\
smaller sized vehicles of any origin.\
", 
      }, 
      [31805] = 
      {
         TeleDelay = 0, 
         Name = "Rocky Cliff", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31589, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "up", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31806, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "mountain", 
         TeleVnum = 0, 
         Vnum = 31805, 
         Description = "You are standing at the top of a high cliff. As you look downwards it is not a\
far drop but what scares you is that you would land on sharp jagged stones of\
all shapes and sizes. As you look the other way there is a steep cliff. If you\
can climb it go ahead.\
", 
      }, 
      [31806] = 
      {
         TeleDelay = 0, 
         Name = "Krayt Nest", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "down", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31805, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "mountain", 
         TeleVnum = 0, 
         Vnum = 31806, 
         Description = "You are standing in the middle of a Krayt Dragon's nest. It does not smell\
particularly good. A large female krayt towers over you here wondering what\
you are doing.\
", 
      }, 
      [31807] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31501, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31808, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31807, 
         Description = "All around you is sand and shiny dunes piling as high as you can see. As far\
as you can guess anything could be behind there. The towering sand dunes make\
you feel scared as you are so small and enclosed by the towering heaps of\
sand.\
", 
      }, 
      [31808] = 
      {
         TeleDelay = 0, 
         Name = "Deserty Path", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31809, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31807, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31812, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31808, 
         Description = "You are walking along the hot sand heated by the twin suns of Tatooine. The\
ground beneath you is hardening gradually as you walk over it or is it just\
your imagination?\
", 
      }, 
      [31809] = 
      {
         TeleDelay = 0, 
         Name = "Hard Sandy Area", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31814, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31808, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31810, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31809, 
         Description = "You walk along a large area covered with sand. This sand seems to have\
hardened gradually over the years and is now almost of the consistency of\
sandstone. To the west the sand slopes downward in many directions. \
", 
      }, 
      [31810] = 
      {
         TeleDelay = 0, 
         Name = "Sandy Surface", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31809, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31811, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31810, 
         Description = "You are standing on top of very hard sand, yet maybe even rock covered with\
sand. As you look westwards you see the dune sea stop abruptly and plummet\
downwards. I wonder why.\
", 
      }, 
      [31811] = 
      {
         TeleDelay = 0, 
         Name = "Overseeing A Small Colony.", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31810, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31811, 
         Description = "You are standing on the edge of a very steep drop that falls directly into the\
heart of what looks to be a colony of some sorts. You would not want to fall\
down this cliff for it is a ways down.\
", 
      }, 
      [31812] = 
      {
         TeleDelay = 0, 
         Name = "Flat Area", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31808, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31813, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31812, 
         Description = "You are walking on one of the only things on this planet. Sand. It is nice and\
soft but some patches of hardened sand can bee seen all around.\
", 
      }, 
      [31813] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31812, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31813, 
         Description = "You look about, look from the direction you came, nothing, nothing at all but\
sand. You wonder how much of this stuff could there possibly be?\
", 
      }, 
      [31814] = 
      {
         TeleDelay = 0, 
         Name = "Unstable Ground", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31815, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31809, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31814, 
         Description = "As the ground beaneath your feet is in a transition from sand to rock\
it seems to be versatile and flakes away in some areas with every\
step that you take on it. Northward you see all the sand is no longer\
there but it is totally a rock surface.\
", 
      }, 
      [31815] = 
      {
         TeleDelay = 0, 
         Name = "Rocky Area", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31814, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "down", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31816, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "mountain", 
         TeleVnum = 0, 
         Vnum = 31815, 
         Description = "The texture beneath your feet is no longer primarily sand but totally\
rock. The rock continues for twenty or thirty feet ahead of you but\
then stops abruptly and becomes sand once again. Downwards a cliff\
slopes downwards. This side is still very steep but you can perceive\
that it is very possible to go up and down of it.\
", 
      }, 
      [31816] = 
      {
         TeleDelay = 0, 
         Name = "Side Of Steep Path", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31817, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "up", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31815, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "down", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31818, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "mountain", 
         TeleVnum = 0, 
         Vnum = 31816, 
         Description = "You are on a pathway facing a severe angle which makes it so that\
there is not much room to move around without falling downwards\
towards flat ground. To the east there is a small cave in the side of\
a cliff. If you continue downwards you will be entering the city.\
", 
      }, 
      [31817] = 
      {
         TeleDelay = 0, 
         Name = "Water Shack", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31816, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Sector = "mountain", 
         Vnum = 31817, 
         Description = "You are standing in a dimly lit room. There is an aged Jawa shopkeeper\
sitting in the corner behind a table selling items you may need to\
explore this vast land filled with opportunities and predators. In\
this small cave it is darker which makes the temperature drop\
drastically and therefore makes this place a good one to stay in for\
long periods of time especially when both suns are up, sending rays of\
heat onto you. \
", 
      }, 
      [31818] = 
      {
         TeleDelay = 0, 
         Name = "Entering The City", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31819, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31870, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "up", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31816, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Sector = "mountain", 
         Vnum = 31818, 
         Description = "You are standing on the same level most of this city is based on. All\
around tere are small shops and tents set up quickly used for\
merchandising goods to any passers.\
", 
      }, 
      [31819] = 
      {
         TeleDelay = 0, 
         Name = "Path In The City", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31818, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31849, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31820, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31851, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "mountain", 
         TeleVnum = 0, 
         Vnum = 31819, 
         Description = "You are walking down a wide path in the middle of this small city\
seemingly belonging to the Jawas. It has been used frequently and\
you can tell this for the rock is shaved away by weight and the path\
is full of marks. Straight ahead also there is a huge fortress of\
some sorts. It is simply constructed and seems old, but that is\
probably because of the wind and the scorching suns of Tatooine. \
", 
      }, 
      [31820] = 
      {
         TeleDelay = 0, 
         Name = "Dusty Path", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31819, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31821, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "mountain", 
         TeleVnum = 0, 
         Vnum = 31820, 
         Description = "You walk along a wide dusty path between two of the most popular\
places in this small veritable city. All around Jawas and small\
creatures of likes you do not want to be aquainted with. As you\
continue down this path you recognize many things and see the\
fortress growing with every step you take, seemingly growing to an \
endless extent. Although it is rather large it seems to be of simple\
construction and not very complicated.\
", 
      }, 
      [31821] = 
      {
         TeleDelay = 0, 
         Name = "Path", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31820, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31822, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "mountain", 
         TeleVnum = 0, 
         Vnum = 31821, 
         Description = "You walk along a wide path seemingly wider than you think because of\
the reflection and glare of the two twin suns of Tatooine. In front\
of you the Jawa fortress stands immensely with not much architectural\
design to it. You can continue down this road towards the fortress or\
turn off into one of the side streets leading to who knows where.\
", 
      }, 
      [31822] = 
      {
         TeleDelay = 0, 
         Name = "Directly In Front Of The Jawa Fortress", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31821, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               DestinationVnum = 31823, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "mountain", 
         TeleVnum = 0, 
         Vnum = 31822, 
         Description = "You are standing directly in front of the Jawa Fortress. It seems rather\
large from this viewpoint but is limited to levels and interior space\
due to its design. there are some small designs on the fortress but\
they seem to not have been part of the original plans of the fortress\
but added in by certain individuals. \
", 
      }, 
      [31823] = 
      {
         TeleDelay = 0, 
         Name = "Entrance To Jawa Fortress", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               DestinationVnum = 31822, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31827, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31824, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31823, 
         Description = "You are standing in a very large room. It was built plainly and simply\
and there are no signs of art even from their own culture in this\
room. There are some narrow corridors in many directions leading to\
different parts of the fortress.\
", 
      }, 
      [31824] = 
      {
         TeleDelay = 0, 
         Name = "A Narrow Hallway", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31823, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31825, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31824, 
         Description = "You are walking down a small narrow hallway that is not very well\
lit. The few glowpanels that are left on the ceiling are either\
inoperative or malfunctioning. Further down the hallway, the hallway\
come to an abrupt stop and turn off. The ground you walk on is rough\
but the lack of sunlight keeps its moisture and color well. \
", 
      }, 
      [31825] = 
      {
         TeleDelay = 0, 
         Name = "Hallway", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31824, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31829, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31825, 
         Description = "You are standing on a colder harder surface than in the hot desert. It\
is like this because of the lack of sunlight in this enormous\
fortress. The glow panels above flicker as if running out of energy.\
Directly in front of you the hallway splits off with a sharp turn\
towards the south. \
", 
      }, 
      [31827] = 
      {
         TeleDelay = 0, 
         Name = "A Large Room", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31828, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31823, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31827, 
         Description = "You walk along in a large room. The ground beneath your feet is rocky\
and yet sandy at the same time making your feet feel better for the\
ground is not as rough as straight rock. There is no lighting in this\
room but you can still make your way around. The air is cool and crisp\
making it a little easier to breathe. \
", 
      }, 
      [31828] = 
      {
         TeleDelay = 0, 
         Name = "A room", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31827, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31828, 
         Description = "You are standing in room #31828.\
", 
      }, 
      [31829] = 
      {
         TeleDelay = 0, 
         Name = "Large Room", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31825, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31832, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31830, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31829, 
         Description = "You are standing in an enormous room. There are small bags, matresses\
and all sorts of small things all over the room layed about. There\
are a few Jawas young and old roaming these hallways. This here room\
is used for more of a storage place and not for eating.\
", 
      }, 
      [31830] = 
      {
         TeleDelay = 0, 
         Name = "Quarters", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31829, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "down", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31831, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "somewhere", 
               Key = -1, 
               Flags = 
               {
                  [17] = "CanEnter", 
                  [11] = "Hidden", 
               }, 
               Distance = 0, 
               DestinationVnum = 31876, 
               Keyword = "bed", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [23] = "Hotel", 
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31830, 
         Description = "Here, at night Jawas go to sleep. There are millions of tiny things\
from wires and circuits to translator droid in here. Considering the\
fact that Jawas sleep in this room it has a quite awful stench.\
Downwards there is a small opening leading to lower levels or\
something of an interesting nature. This room is very comfortable and\
safe with guard in pretty much all directions.\
 \
You may safely quit from here.\
", 
      }, 
      [31831] = 
      {
         TeleDelay = 0, 
         Name = "Small Room", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "up", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31830, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31831, 
         Description = "You are standing in what seems to be an area where extra things and stolen\
goods are kept. In the corners there are baskets full of wires and old\
goods that are probably useless to the everyday person. There is a jawa\
guard half asleep here watching over the items. This room does not seem to\
have been dug out yet was put here by nature.\
", 
      }, 
      [31832] = 
      {
         TeleDelay = 0, 
         Name = "Entrance", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31833, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31829, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31832, 
         Description = "You are standing in a simple room. Designed and built with ease this room\
posed no problem to the people that built it. It is extremely dark in here and\
not much is visible to the plain eye. The ground is cold and stiff and makes\
your feet feel cold as you walk over it.\
", 
      }, 
      [31833] = 
      {
         TeleDelay = 0, 
         Name = "Intersection", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31832, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31839, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31834, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31833, 
         Description = "You are at an intersection. You may go either east or west and explore this\
vast place. In both directions the small corridors lighten up further down.\
", 
      }, 
      [31834] = 
      {
         TeleDelay = 0, 
         Name = "Hallway", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31833, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31835, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31834, 
         Description = "You are standing in a think gloomy hallway. Towards the south you can hear\
the sounds of discussion and occasional laughter. The ground is cool and soft\
for it is not dried by the everydays suns of Tatooine. The hallway is a gloomy\
place and makes you think twice before you do anything.\
", 
      }, 
      [31835] = 
      {
         TeleDelay = 0, 
         Name = "End Of Hallway", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31834, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31836, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31835, 
         Description = "You reach the end of the small and tight gloomy hallway and see a few\
guardians discussing near a heavily guarded door leading into a large room\
with someone, or something, important inside of it.\
", 
      }, 
      [31836] = 
      {
         TeleDelay = 0, 
         Name = "Opening", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31837, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31835, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31836, 
         Description = "You are standing in the beginning of the large room filled with\
guardians. Just ahead they talk to each other silently trying not to\
disturb anyone. The ground is more of a sand color and is quite soft\
and hot. Upwards there is an oppening in the roof letting sunlight in\
and momentarily blinding you.\
", 
      }, 
      [31837] = 
      {
         TeleDelay = 0, 
         Name = "Entrance", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [5] = "PickProof", 
                  [23] = "BashProof", 
               }, 
               Distance = 1, 
               DestinationVnum = 31838, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31836, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31837, 
         Description = "You stand before the heavily guarded entrance into the Wise Mans\
chambers. the two guardians stand up watching you closely so that you\
cause no harm to their master. The room has a large crack in the\
ceiling and it is rather hot in here. The way you see it staying in this\
fortress is not a bad idea. \
", 
      }, 
      [31838] = 
      {
         TeleDelay = 0, 
         Name = "Chambers", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Key = -1, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               DestinationVnum = 31837, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31838, 
         Description = "You are standing in the chambers of the Wise Jawa of these parts. The\
walls are poorly decorated and any signs of extra materials does not\
exist. Maybe you should try to understand him before coming to any\
conclusions for he may able to help you, or to teach you something of\
use. \
", 
      }, 
      [31839] = 
      {
         TeleDelay = 0, 
         Name = "Hallway", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31833, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31839, 
         Description = "You are standing in a hallway leading to a stone wall. At the end of the hall\
the hallway itself curves toward the south leaving only two way to go, south\
and back from where you came.\
", 
      }, 
      [31840] = 
      {
         TeleDelay = 0, 
         Name = "Neighberhood Junk Pile", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31653, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         TeleVnum = 0, 
         Vnum = 31840, 
         Description = "You are standing on a large pile of junk. People throw things they dont need\
here just to get rid of it. But for some people this place is where they can\
get everything they need to start out. Everything from scrap metal to blasters\
are here waiting for anyone to pick them up.\
", 
      }, 
      [31841] = 
      {
         TeleDelay = 0, 
         Name = "Entrance To Docking Bay 94", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31872, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31842, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31605, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         TeleVnum = 0, 
         Vnum = 31841, 
         Description = "You are standing in front of the infamous Dockingbay 94. From here Han Solo\
and the Millenium Falcon escaped with their newly acquired passengers for a\
trip to Alderaan. There is a large entrance into the docking bay. All the\
ground beneath you is made of stone and sand. The air is warm yet lighter\
here for it is sheltered by the docking bay.\
", 
      }, 
      [31842] = 
      {
         TeleDelay = 0, 
         Name = "Inside The Entrance To Docking Bay 92", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31841, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               DestinationVnum = 31843, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         TeleVnum = 0, 
         Vnum = 31842, 
         Description = "You are standing in front of a large sliding door. When opened you can enter\
the docking bay with ease and embark on a ship to go to other places in the\
galaxy. The door is made of metal and has blaster scorching all over it from\
when the imperials chased Han Solo and Chewbacca in a race to capture the\
droid R2-D2 and return him to Darth Vader. The ground is hard and covered with\
sand as most of this planet is and the air is rather refreshing.\
", 
      }, 
      [31843] = 
      {
         TeleDelay = 0, 
         Name = "Inside Docking Bay 92", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               DestinationVnum = 31842, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31847, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "city", 
         Vnum = 31843, 
         Description = "You are standing inside a large room that can contain a few smaller sized\
ships or one large ship like the Millenium Falcon. The ground here is covered\
with sand, but there are patches where you can see the stone floor beneath.\
The air in here is cool and refreshing and gives you a warm sensation. There\
are ships comming and leaving here continually and make it so that the air\
smells of fumes and exhaust.\
", 
      }, 
      [31846] = 
      {
         TeleDelay = 0, 
         Name = "Floating in a void", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Sector = "city", 
         Vnum = 31846, 
         Description = "", 
      }, 
      [31847] = 
      {
         TeleDelay = 0, 
         Name = "Docking Bay 92", 
         Tag = "tatooine_mos_eisley_landing", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31843, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [4] = "CanLand", 
            [3] = "Indoors", 
         }, 
         Sector = "city", 
         Vnum = 31847, 
         Description = "All around you there is only one thing. A large room stands here waiting to\
be filled with crafts and vessels. The air is crisp and cool unlike\
outside in the sun, but smells of ships. On the walls there are blaster\
bolts. Extra tools lay on the ground for a mechanic that walks around\
here.   \
", 
      }, 
      [31849] = 
      {
         TeleDelay = 0, 
         Name = "Hundo's Shop", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               DestinationVnum = 31850, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31819, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31849, 
         Description = "You are standing inside a small store. Here Hundo the owner will\
gladly sell you clothing or possibly custom make some for you if the\
price is right. There is a small workstation in the corner and a\
entry to a room near the back of the store. The store is pretty run\
down but serves it's purpose.\
", 
      }, 
      [31850] = 
      {
         TeleDelay = 0, 
         Name = "Back Of The Shop", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Key = -1, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               DestinationVnum = 31849, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31850, 
         Description = "There are some small crates scattered along the floor. Most of them are empty\
but some seem to be filled with cloth and useless items. This room is very\
dirty and has a rather disturbing smell to it. The ground is smooth and cold\
being made of stone. The air is fresher in here than most parts of this city\
and it makes you want to stay here.\
", 
      }, 
      [31851] = 
      {
         TeleDelay = 0, 
         Name = "In Front Of A Large Keeping Area", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31819, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               DestinationVnum = 31852, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "mountain", 
         TeleVnum = 0, 
         Vnum = 31851, 
         Description = "You are standing in front of some large fences. Inside these fences are kept\
many rontos, the animal that Jawas ride to go to different areas. There is a\
rather tall Jawa at the gate entry with an ionization gun ready to shoot any\
thieves or trespassers.\
", 
      }, 
      [31852] = 
      {
         TeleDelay = 0, 
         Name = "Ronto Keeping Area", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               DestinationVnum = 31851, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "mountain", 
         TeleVnum = 0, 
         Vnum = 31852, 
         Description = "You are standing inside a large pen sourrounded by gates that are filled with\
rontos. These rontos have been trained to a certain degree so it is not\
likely that they will try to escape. The ground is rough and is filled with\
cracks for the weight of these beasts is quite surprising. The sun shines down\
all day long and makes it warm here but the rontos have adjusted to the\
temperature.\
", 
      }, 
      [31853] = 
      {
         TeleDelay = 0, 
         Name = "Entrance To The Cantina", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31655, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31854, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31853, 
         Description = "You are standing in the entrance to the well known cantina. Here some of the\
filthiest and richest scum hang around. Watch your step. Mounted on the wall is\
a droid detector. For here in this cantina they do not serve their kind.\
", 
      }, 
      [31854] = 
      {
         TeleDelay = 0, 
         Name = "Interior Of The Cantina", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31853, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31855, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31856, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31854, 
         Description = "You are facing the bar slowly. With small booths all around filled with\
people talking. Wuher slowly pours drinks for his customers being careful not\
to get hurt. The floor is poorly covered and the walls filled with blaster\
marks and other such things from fights and encounters.\
", 
      }, 
      [31855] = 
      {
         TeleDelay = 0, 
         Name = "Large Open Way", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31858, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31859, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31854, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31855, 
         Description = "Most of this section is rather empty for it leads the entrance into the\
cantina. For the other part there is a few tables with some stools and chairs\
but for the most part they are empty as for people seem to have adopted a\
liking towards the booths.\
", 
      }, 
      [31856] = 
      {
         TeleDelay = 0, 
         Name = "A Large Section Of The Cantina", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31854, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31861, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31857, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31856, 
         Description = "You stand in awe as many horrible characters walk around. Some you\
recognize and some you do not. There are small tables filled with\
people all along this large area of the Cantina. The air is full of\
smoke from hookas being used all along. There is some broke glass on\
the floor. As you walk over it it cracks and makes you shiver.\
", 
      }, 
      [31857] = 
      {
         TeleDelay = 0, 
         Name = "A Small Booth", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31856, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [10] = "Safe", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31857, 
         Description = "You are standing inside a small booth. Here a table is mounted in the middle\
with all sorts of seats and chairs aligned around. The table is beat up with\
holes all over it, vandalized over and over. This booth has less lighting in\
it for the glow panel has shorted out and makes it relaxing with the change in\
temperature from the outdoors.\
", 
      }, 
      [31858] = 
      {
         TeleDelay = 0, 
         Name = "A Large Double Booth", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31855, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31858, 
         Description = "There are two small booths attached together here making one large booth.\
This booth is a very well known booth for here Han Solo fried Greedo the\
bounty hunter. There is a large table in the middle of the booth. The seats\
are dirty and the table even more so. There is a hookah on the table but it\
seems to be stuck to it.\
", 
      }, 
      [31859] = 
      {
         TeleDelay = 0, 
         Name = "A Section Of The Cantina", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31855, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31860, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31859, 
         Description = "This room is located on the far side of the cantina, beside one of the\
small corner booths towards the west. The floor is dirty, filled with blood in\
some places from a recent fight. The air is full of smoke as people walk\
around you, some smoking hookahs.\
", 
      }, 
      [31860] = 
      {
         TeleDelay = 0, 
         Name = "A Very Small Booth", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31859, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31860, 
         Description = "This booth is one of very small size. There is a small table in the\
middle with 2 stools set down around it. The stools are in rather\
good shape but the table is in horrible condition. The ground is\
cracked and makes you feel you will fall through the floor. The air\
is dirty and heavy here and makes you want to leave.\
", 
      }, 
      [31861] = 
      {
         TeleDelay = 0, 
         Name = "Section Of The Cantina", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31856, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               Flags = 
               {
                  [0] = "IsDoor", 
                  [17] = "CanEnter", 
                  [18] = "CanLeave", 
                  [26] = "CanLook", 
                  [23] = "BashProof", 
               }, 
               Distance = 0, 
               DestinationVnum = 31863, 
               Keyword = "Counter", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31862, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31861, 
         Description = "You are standing in an open area filled with tables. To the east the bar\
stands. Chairs all around filled with different people and different species.\
The chairs themselves are rather dirty and so most people stand. The smell\
here is not too bad but not a beautiful one neither.\
", 
      }, 
      [31862] = 
      {
         TeleDelay = 0, 
         Name = "A Corner Booth", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31861, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31862, 
         Description = "You are standing in a rather large both in the furthest corner of the\
cantina. The table here is very used yet in good shape compared to the others.\
The chairs on the other hand are worn down to the nub. The air here is less\
filthy for many people whom do not want to be bothered by the smoke sit\
here.\
", 
      }, 
      [31863] = 
      {
         TeleDelay = 0, 
         Name = "Inside The Bar", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Key = -1, 
               Flags = 
               {
                  [0] = "IsDoor", 
                  [5] = "PickProof", 
               }, 
               Distance = 0, 
               DestinationVnum = 31861, 
               Keyword = "counter", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "up", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31618, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31863, 
         Description = "You are standing in front of Wuher, the man who serves drinks to people here.\
The beverage machine is very large and complex but seems to be efficient in\
the way it works. AS he sees you he gets angry. Maybe you should run.\
", 
      }, 
      [31870] = 
      {
         TeleDelay = 0, 
         Name = "Inside A Large Cave", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31818, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31871, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Sector = "city", 
         Vnum = 31870, 
         Description = "You are inside a large cave. It has two parts to it. It is rather dark\
making the air cool. The cave protects you from the sand being\
blown by the winds. Inside this cave many womp rats seek shelter for\
the only other places are inside the city of Mos Eisley where they\
will most likely be prosecuted. The ground is hard and has little to\
no sand on it. This place is sure a break to the outdoors.\
", 
      }, 
      [31871] = 
      {
         TeleDelay = 0, 
         Name = "In The Back Of A Cave", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31870, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "city", 
         Vnum = 31871, 
         Description = "You are in the back portion of a large cave planted into the side of\
the cliff. The air here is very cool and relaxing giving you the\
sensation of being relaxed. The ground is hard and made entirely of\
rock, without a trace of sand this cave is rather clean besides the\
womp rat mess. There is a particular smell in here from the mess but\
nothing to be concerned about if you do not stay in this cave for an\
extended period of time.\
", 
      }, 
      [31872] = 
      {
         TeleDelay = 0, 
         Name = "The Bus Stop", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31841, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         TeleVnum = 0, 
         Vnum = 31872, 
         Description = "You are standing on a platform where the public busses land every so\
often. You can access different planets using these busses. Although\
the busses are slow they are a means of transportation. The only\
reason they are slow is because they are provided to the public for\
free. Thinking about this it makes it hard to maintain the busses\
without enough resources.\
", 
      }, 
      [31873] = 
      {
         TeleDelay = 0, 
         Name = "Walking Through The City", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31875, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31881, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31882, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31655, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         TeleVnum = 0, 
         Vnum = 31873, 
         Description = "You walk along a path inside the well known city of Mos Eisley. The\
ground here is hard yet made fully of sand. As you walk over it, it is\
hot and sharp. The wind blows in your face, sometimes bringing\
particles of sand into your face stinging you and sometimes getting\
into your eyes. The air is very warm, heated by the twin suns of the\
planet. The heat makes the air heavier and harder to breath yet you\
move on. Ahead you can see a corner that curves into a store of some\
kind. On the front it says \"Spaceport Speeders\".\
", 
      }, 
      [31874] = 
      {
         TeleDelay = 0, 
         Name = "Walking Down A Side Street", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31655, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         TeleVnum = 0, 
         Vnum = 31874, 
         Description = "You are walking down an unused side street. The street is mostly shady\
because the buildings to the sides cover the sunlight from the\
street. The ground is softer and less dense and compact, but when the\
wind blows it hurts more for the grains of sand hit you in larger\
numbers making you ache all over. The air is hot, not as hot as the\
rest of the city because the street is covered in shade, but it is\
still hot. The air is also lighter and makes you relax as you walk.\
", 
      }, 
      [31875] = 
      {
         TeleDelay = 0, 
         Name = "Inside The Spaceport Speeders", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31873, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         TeleVnum = 0, 
         Vnum = 31875, 
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
      }, 
      [31876] = 
      {
         TeleDelay = 0, 
         Name = "On A Bed", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "somewhere", 
               Key = -1, 
               Flags = 
               {
                  [18] = "CanLeave", 
                  [11] = "Hidden", 
               }, 
               Distance = 0, 
               DestinationVnum = 31830, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "feel cure $n\
emote Vapors slowly seep into your body helping you relax.\
", 
               Arguments = "100", 
               MudProgType = "rand_prog", 
               ScriptType = "MProg", 
            }, 
         }, 
         Tunnel = 0, 
         Sector = "city", 
         TeleVnum = 0, 
         Vnum = 31876, 
         Description = "Here in this bed hot steam rises from the cushions making your tense\
muscles relax. As they heat your body you start to feel better. The\
atmosphere is very moisturized with a lot of heat surrounding you\
also. The bed is made of a comfortable looking material but has been\
chewed at by small rodents making the bed kind of ugly looking. \
", 
      }, 
      [31878] = 
      {
         TeleDelay = 0, 
         Name = "Along The Bottom Of The Cliff", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31601, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31879, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Sector = "desert", 
         Vnum = 31878, 
         Description = "You are walking along the bottom of the cliff. High above you see the edge\
of the cliff and you think about how much it would hurt to fall from\
there. The sand here is much harder than normal as for the wind does not\
get at it very well because the cliff covers the sand from being swept\
away by the gusting winds. The sun is also not so intense here but it is\
still very warm and just as dry as the rest of the planet.\
", 
      }, 
      [31879] = 
      {
         TeleDelay = 0, 
         Name = "Nearing The Curve In The Cliff", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31878, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31880, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31879, 
         Description = "You are walking along the bottom of the cliff. High above you see the edge\
of the cliff and you think about how much it would hurt to fall from\
there. The sand here is much harder than normal as for the wind does not\
get at it very well because the cliff covers the sand from being swept\
away by the gusting winds. The sun is also not so intense here but it is\
still very warm and just as dry as the rest of the planet.\
", 
      }, 
      [31880] = 
      {
         TeleDelay = 0, 
         Name = "On The Curve Of The Cliff", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31879, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31880, 
         Description = "You are walking along the bottom of the cliff. High above you see the edge\
of the cliff and you think about how much it would hurt to fall from\
there. As you think of that you notice some blood splatter on the sand.\
Then you look up to see a large chunk of the cliff missing as if someone\
had fell from there taking a large portion of the side of the cliff with\
them. \
", 
      }, 
      [31881] = 
      {
         TeleDelay = 0, 
         Name = "On A Path In The City", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 6600, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31873, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         TeleVnum = 0, 
         Vnum = 31881, 
         Description = "You walk along a path inside the well known city of Mos Eisley. The ground\
here is hard yet made fully of sand. As you walk over it, it is hot and\
sharp. The wind blows in your face, sometimes bringing particles of sand\
into your face stinging you and sometimes getting into your eyes. The air\
is very warm, heated by the twin suns of the planet. The heat makes the\
air heavier and harder to breath yet you move on. To the north you can see\
a scattering of buildings.\
", 
      }, 
      [31882] = 
      {
         TeleDelay = 0, 
         Name = "In The Depths Of The City", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31873, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31883, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31624, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         TeleVnum = 0, 
         Vnum = 31882, 
         Description = "You walk along a path inside the well known city of Mos Eisley. The ground\
here is hard yet made fully of sand. As you walk over it it is hot and sharp.\
The wind blows in your face, sometimes bringing particles of sand into your\
face stinging you and sometimes getting into your eyes. The air is very warm,\
heated by the twin suns of the planet. The heat makes the air heavier and\
harder to breath yet you move on. To the west you see smoke coming from\
freshly cooked meat and food. \
", 
      }, 
      [31883] = 
      {
         TeleDelay = 0, 
         Name = "Gep's Grill", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31882, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         TeleVnum = 0, 
         Vnum = 31883, 
         Description = "You are standing in front of an old man. Here he makes his own food to sell\
to people passing by. He has a large selection, everything from\
banthaburgers to dewback ribs depending on how carnivorous your appetite\
is. His booth is made of old junk probably scavenged or bought from the\
Jawas. His cooking supplies are rather disgusting to look at and when you\
think of what you are eating from it makes your stomach churn.\
", 
      }, 
      [31898] = 
      {
         TeleDelay = 0, 
         Name = "An Empty Home", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "northeast", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 106, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [20] = "PlayerHome", 
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31898, 
         Description = "This is a small apartment with the bare essentials required to live here.\
Apart from the cramped bathroom, the rest of the apartment is a single room.\
", 
      }, 
      [31899] = 
      {
         TeleDelay = 0, 
         Name = "A Hidden Passage In The Sewers", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31904, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31900, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31899, 
         Description = "This passage looks somewhat cleaner than the reset of the sewer, suggesting\
that someone maintains it. There's no sewage flowing here, rather the ground\
is quite dry.\
", 
      }, 
      [31900] = 
      {
         TeleDelay = 0, 
         Name = "Common Room", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31899, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31901, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31902, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31909, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31900, 
         Description = "This circular area seems to be a simple common room, complete with cheap\
furniture and some faded posters on the walls.\
", 
      }, 
      [31901] = 
      {
         TeleDelay = 0, 
         Name = "Kitchen", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31900, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31901, 
         Description = "The kitchen bench is full of unwashed plates, glasses and cutlery. Above the\
bench are a few cupboards. Despite the mess on the bench, the place smells\
clean.\
", 
      }, 
      [31902] = 
      {
         TeleDelay = 0, 
         Name = "Hallway", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31900, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31903, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31905, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31906, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31902, 
         Description = "The hallway has light gray walls with some lamps hanging on them. Doors\
lead to other rooms in the small complex.\
", 
      }, 
      [31903] = 
      {
         TeleDelay = 0, 
         Name = "Sleeping Quarters", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31902, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [23] = "Hotel", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31903, 
         Description = "There are a few cheap beds scattered around this dimly lit room. Otherwise\
it's quite empty.\
", 
      }, 
      [31904] = 
      {
         TeleDelay = 0, 
         Name = "A Tunnel In The Sewers", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31907, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Flags = 
               {
                  [11] = "Hidden", 
               }, 
               Distance = 0, 
               DestinationVnum = 31899, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "southwest", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31505, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "def on_enter(room, actor):\
    if isjedi(actor) and level(actor) < 25:\
        echo(actor, \"You sense that the south wall is a hologram.\")\
", 
               Arguments = "100", 
               MudProgType = "entry_prog", 
               ScriptType = "Imp", 
            }, 
         }, 
         Tunnel = 0, 
         Sector = "underground", 
         TeleVnum = 0, 
         Vnum = 31904, 
         Description = "There is a river of sewage flowing at a slow, steady pace. There's a rusty\
catwalk about a meter above it, running along one wall. Old grime is covering\
the walls. There's a nasty smell in the air, making it uncomfortable to\
breath, even for a Gamorrean.\
", 
      }, 
      [31905] = 
      {
         TeleDelay = 0, 
         Name = "Zim's Meditation Chamber", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31902, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31905, 
         Description = "In theory this is where Zim would meditate and attune himself to the Force.\
But in reality it's where he drinks all day, feeling sorry for himself.\
There's a smell of alcohol in the air.\
", 
      }, 
      [31906] = 
      {
         TeleDelay = 0, 
         Name = "Workshop", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31902, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [16] = "Silence", 
            [26] = "Factory", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31906, 
         Description = "This rooms contains all facilities you need to craft just about anything.\
It's very cluttered. A few broken items that someone failed to assemble\
correctly have been tossed into a corner.\
", 
      }, 
      [31907] = 
      {
         TeleDelay = 0, 
         Name = "Mos Eisley Sewers", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31908, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31904, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "up", 
               Key = -1, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 1, 
               DestinationVnum = 31654, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "underground", 
         TeleVnum = 0, 
         Vnum = 31907, 
         Description = "This is the main entrance to the sewers. There is a river of sewage flowing\
through the tunnel, giving off a strong smell. Along one wall is a catwalk\
allowing one to walk through the sewers.\
", 
      }, 
      [31908] = 
      {
         TeleDelay = 0, 
         Name = "A Tunnel In The Sewers", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31502, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31907, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "underground", 
         TeleVnum = 0, 
         Vnum = 31908, 
         Description = "#31904\
", 
      }, 
      [31909] = 
      {
         TeleDelay = 0, 
         Name = "Sparring Area", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31900, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31909, 
         Description = "The sparring area is a square room about 10x10 meters. Most of the floor is\
covered by a gray mat so that people won't land too hard when they fall.\
", 
      }, 
      [31997] = 
      {
         TeleDelay = 0, 
         Name = "Economy Class Section", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31999, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31997, 
         Description = "This section is smelly and dirty. It's probably not cleaned very often.\
The noise from the engines at the back of the shuttle contributes to making\
it an uncomfortable trip.\
", 
      }, 
      [31998] = 
      {
         TeleDelay = 0, 
         Name = "Business Class Section", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               Flags = 
               {
                  [1] = "Closed", 
               }, 
               Distance = 1, 
               DestinationVnum = 31999, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31998, 
         Description = "This section of the shuttle is clean, quiet and comfortable. In other words\
it's the opposite of what you usually meet on this planet.\
", 
      }, 
      [31999] = 
      {
         TeleDelay = 0, 
         Name = "Tatooine Planetary Shuttle Entrance", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Distance = 1, 
               DestinationVnum = 31998, 
               Keyword = "curtain", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31997, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [29] = "Spacecraft", 
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31999, 
         Description = "The Tatooine Planetary Shuttle travels between major settlements on this\
backwater planet. The entrance area leads to the business class section in one\
direction, and the economy class section in the other. The business class\
section is behind a curtain so that the wealthier passengers won't have to\
look at the seedier elements in the back.\
", 
      }, 
      [31500] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31501, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31557, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31500, 
         Description = "The dunes around you are normal as you walk over the endless amount of sand.\
The sea of rippling sand still surrounds you with overwhelming greatness. The\
sand has a reflective shine to it assisted by the sunrays of the heating suns.\
You feel enclosed because the dunes tower over you greatly.\
", 
      }, 
      [31501] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31507, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31500, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31807, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31501, 
         Description = "You are walking along the soft sand in the desert of Tatooine. Just ahead of\
you you can see the dune sea developping. Behind you the small city diminishes\
into only a spot. With every step you take the city becomes smaller and\
smaller.\
", 
      }, 
      [31502] = 
      {
         TeleDelay = 0, 
         Name = "Tunnel Junction", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31503, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31504, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31908, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "underground", 
         TeleVnum = 0, 
         Vnum = 31502, 
         Description = "A junction breaks up the monotony of these tunnels. The river of sewage runs\
south, but to the north there seems to be a dry area.\
", 
      }, 
      [31503] = 
      {
         TeleDelay = 0, 
         Name = "Pumping Station", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
               }, 
               Distance = 1, 
               DestinationVnum = 31623, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31502, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31503, 
         Description = "This room is about 20x20 meters, and several meters high. It smells as bad\
as the rest of the sewers. In the middle of the room is a large piece of\
machinery enclosed in an old-fashioned wire fence.\
", 
      }, 
      [31504] = 
      {
         TeleDelay = 0, 
         Name = "Endless Tunnels In The Sewers", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31502, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31621, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "underground", 
         TeleVnum = 0, 
         Vnum = 31504, 
         Description = "#31904\
", 
      }, 
      [31505] = 
      {
         TeleDelay = 0, 
         Name = "A Deep Pool Of Sewage", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31506, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "northeast", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31904, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "underground", 
         TeleVnum = 0, 
         Vnum = 31505, 
         Description = "The tunnel widens into a room filled with sewage that gathers into a large\
pool. Just like the rest of the sewers, there's a rusty catwalk running along\
one wall where it's possible to walk through the area.\
", 
      }, 
      [31506] = 
      {
         TeleDelay = 0, 
         Name = "A Tunnel In The Sewers", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31505, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "southeast", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31591, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "underground", 
         TeleVnum = 0, 
         Vnum = 31506, 
         Description = "#31904\
", 
      }, 
      [31507] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31509, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31508, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31501, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31507, 
         Description = "You are standing on a hard sandy surface, there is nothing around you unless\
you turn back. In all directions you can see but sand. The dunes in the sea\
are enourmous and grow with every step that you take.\
", 
      }, 
      [31508] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31555, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31507, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31508, 
         Description = "All around you is sand and shiny dunes piling as high as you can see. As far\
as you can guess anything could be behind there. The towering sand dunes make\
you feel scared as you are so small and enclosed by the towering heaps of sand.\
", 
      }, 
      [31509] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31510, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31507, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31509, 
         Description = "You are surrounded by sand from all possible directions. You can still see a\
glimpse of the city behind you but once you leave the city the land is yours\
to explore.\
", 
      }, 
      [31510] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31511, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31513, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31509, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31510, 
         Description = "Around you there is only sand as far as you can see. The direction is not\
noticable and civilization is far away. If you wander too far be careful\
of where you end up.\
", 
      }, 
      [31511] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31512, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31510, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31511, 
         Description = "The sand is soft and is still all around you. It is high and shinning in your\
face as you repeatidly walk over endless amounts of sand. You feel enclosed\
because of their great mass. As you walk forward, with every step you take the\
sand dunes grow in size and proportion.\
", 
      }, 
      [31512] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31511, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31512, 
         Description = "The sand is soft and is still all around you. It is high and shinning in your\
face as you repeatidly walk over endless amounts of sand. You feel enclosed\
because of their great mass. As you walk forward, with every step you take\
the sand dunes grow in size and proportion.\
", 
      }, 
      [31513] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31514, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31510, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31513, 
         Description = "The sand is soft and is still all around you. The sun is high and shining in\
your face as you repeatedly walk over endless amounts of sand. You feel\
enclosed because of their great mass. As you walk forward, with every step you\
take the sand dunes grow in size and proportion.\
", 
      }, 
      [31514] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31513, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31515, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31514, 
         Description = "The sand is soft and is still all around you. It is high and shining in your\
face as you repeatidly walk over endless amounts of sand. You feel enclosed\
because of their great mass. As you walk forward, with every step you take\
the sand dunes grow in size and proportion.\
", 
      }, 
      [31515] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31514, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31516, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31515, 
         Description = "All around you is sand and shiny dunes piling as high as you can see. As far\
as you can guess anything could be behind there. The towering sand dunes make\
you feel scared as you are so small and enclosed by the towering heaps of sand.\
", 
      }, 
      [31516] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31515, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31517, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31516, 
         Description = "You are on the top of a sand dune and you can see across the whole dune sea.\
It is just a great sight to see. The sand dunes dip in and out of the ground.\
The immense amount of sand frightens you as you look across the great sand\
dune sea of Tatooine.\
", 
      }, 
      [31517] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31516, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31518, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31517, 
         Description = "You are heading down the side of a sand a dune entering another valley of\
dunes. With every step you take the sand seems to be increasing.\
", 
      }, 
      [31518] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31519, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31517, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31522, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31518, 
         Description = "You are on the top of a sand dune and you can see across the whole dune sea.\
It is just a great sight to see. The sand dunes dip in and out of the ground.\
The immense amount of sand frightens you as you look across the great sand\
dune sea of Tatooine.\
", 
      }, 
      [31519] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31520, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31518, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31519, 
         Description = "The sand is soft and is still all around you. It is high and shining in your\
face as you repeatedly walk over endless amounts of sand. You feel enclosed\
because of their great mass. As you walk forward, with every step you take the\
sand dunes grow in size and proportion.\
", 
      }, 
      [31520] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31521, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31519, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31520, 
         Description = "You are on the top of a sand dune and you can see across the whole dune sea.\
It is just a great sight to see. The sand dunes dip in and out of the ground.\
The immense amount of sand frightens you as you look across the great sand dune\
sea of Tatooine.\
", 
      }, 
      [31521] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31520, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31521, 
         Description = "You are on the top of a sand dune and you can see across the whole dune sea.\
It is just a great sight to see. The sand dunes dip in and out of the ground.\
The immense amount of sand frightens you as you look across the great sand\
dune sea of Tatooine.\
", 
      }, 
      [31522] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31518, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31523, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31524, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31522, 
         Description = "The sand is soft and is still all around you. It is high and shining in your\
face as you repeatedly walk over endless amounts of sand. You feel enclosed\
because of their great mass. As you walk forward, with every step you take the\
sand dunes grow in size and proportion.\
", 
      }, 
      [31523] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31522, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31646, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31523, 
         Description = "The dunes around you are normal as you walk over the endless amount of dunes.\
The sea of dunes still surrounds you with overwhelming greatness. The sand has\
a reflective shine to it assisted by the sunrays of the heating suns.  You feel\
enclosed because the dunes tower over you greatly.\
", 
      }, 
      [31524] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31525, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31522, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31524, 
         Description = "All around you is sand and you are The dunes around you are normal as you walk\
over the endless amount of dunes. The sea of dunes still surrounds you with\
overwhelming greatness. The sand has a reflective shine to it assisted by the\
sunrays of the heating suns. You feel enclosed because the dunes tower over\
you greatly.\
", 
      }, 
      [31525] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31526, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31524, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31525, 
         Description = "The dunes around you are normal as you walk over the endless amount of dunes.\
The sea of dunes still surrounds you with overwhelming greatness. The sand has\
a reflective shine to it assisted by the sunrays of the heating suns. You feel\
enclosed because the dunes tower over you greatly.\
", 
      }, 
      [31526] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31527, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31525, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31526, 
         Description = "All around you is sand and shiny dunes piling as high as you can see. As far\
as you can guess anything could be behind there. The towering sand dunes make\
you feel scared as you are so small and enclosed by the towering heaps of sand.\
", 
      }, 
      [31527] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31528, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31536, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31526, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31527, 
         Description = "All around you is sand and shiny dunes piling as high as you can see. As far\
as you can guess anything could be behind there. The towering sand dunes make\
you feel scared as you are so small and enclosed by the towering heaps of sand.\
", 
      }, 
      [31528] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31529, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31527, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31530, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31528, 
         Description = "You start walking over the tip of a dune an can see something in the far sea\
of dunes. All around you is sand and shiny dunes piling as high as you can\
see. As far as you can guess anything could be behind there. The towering sand\
dunes make you feel scared as you are so small and enclosed by the towering\
heaps of sand.\
", 
      }, 
      [31529] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31528, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31531, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31529, 
         Description = "The dunes around you are normal as you walk over the endless amount of dunes.\
The sea of dunes still surrounds you with overwhelming greatness. The sand has\
a reflective shine to it assisted by the sunrays of the heating suns. You feel\
enclosed because the dunes tower over you greatly.\
", 
      }, 
      [31530] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31528, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31537, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31530, 
         Description = "All around you is sand and shiny dunes piling as high as you can see. As far\
as you can guess anything could be behind there. The towering sand dunes make\
you feel scared as you are so small and enclosed by the towering heaps of sand.\
", 
      }, 
      [31531] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31529, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31532, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31531, 
         Description = "All around you is sand and shiny dunes piling as high as you can see. As far\
as you can guess anything could be behind there. The towering sand dunes make\
you feel scared as you are so small and enclosed by the towering heaps of sand.\
", 
      }, 
      [31532] = 
      {
         TeleDelay = 0, 
         Name = "Opening", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31531, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31533, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31532, 
         Description = "The sand is soft and is still all around you. It is high and shinning in your\
face as you repeatidly walk over endless amounts of sand. You feel enclosed\
because of their great mass. As you walk forward, with every step you take the\
sand dunes grow in size and proportion.\
", 
      }, 
      [31533] = 
      {
         TeleDelay = 0, 
         Name = "Opening", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31534, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31532, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31533, 
         Description = "You are traveling along the side of the large opening and can see something in\
the center of the opening.\
", 
      }, 
      [31534] = 
      {
         TeleDelay = 0, 
         Name = "Opening", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31533, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31535, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31534, 
         Description = "You are standing infront of a very large opening in the ground that seems to\
have endless turns inside itself. To explore this hold continue to the west.\
", 
      }, 
      [31535] = 
      {
         TeleDelay = 0, 
         Name = "Sarlacc", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31534, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31535, 
         Description = "This is a D.T(To be edited)\
", 
      }, 
      [31536] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31527, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31536, 
         Description = "You are in the middle of the sea of dunes and are hopelessly lost.\
", 
      }, 
      [31537] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31530, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31538, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31537, 
         Description = "You can now perceive that the object that you are walking towars is a metallic\
form of some sort.\
", 
      }, 
      [31538] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31539, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31537, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31538, 
         Description = "You are very close to the object and you can now identify it in the sand. It\
is a very old shipwreck plowed into the top of a dune.\
", 
      }, 
      [31539] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31540, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31538, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31552, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31539, 
         Description = "You are infront of the shipwreck and it seems to be habitible. To explore it\
continue north up the hatch.\
", 
      }, 
      [31540] = 
      {
         TeleDelay = 0, 
         Name = "Hatch Of Derelict Ship", 
         Tag = "TatooineDerelictShip", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31547, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31542, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31539, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Key = -1, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               DestinationVnum = 31541, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31540, 
         Description = "You are inside the hatch of a ship which seems very new and cared for.\
", 
      }, 
      [31541] = 
      {
         TeleDelay = 0, 
         Name = "Cargo Hold", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               DestinationVnum = 31540, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31541, 
         Description = "You are standing infront of an immense cargo room containing many\
crates of items.\
", 
      }, 
      [31542] = 
      {
         TeleDelay = 0, 
         Name = "Tunnel", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               DestinationVnum = 31543, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31540, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31542, 
         Description = "You are in a small room with lots of wiring and you can see the maintenance\
tunnel in front of you.\
", 
      }, 
      [31543] = 
      {
         TeleDelay = 0, 
         Name = "Mainentance Tunnel", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31544, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               DestinationVnum = 31542, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31543, 
         Description = "You are inside the maintenance tunnel. It is a very small space so you must\
crawl inside the tunnel to move.\
", 
      }, 
      [31544] = 
      {
         TeleDelay = 0, 
         Name = "Tunnel", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31543, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31545, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31544, 
         Description = "You are crawling through the tunnel and can see an opening to the west.\
", 
      }, 
      [31545] = 
      {
         TeleDelay = 0, 
         Name = "Secret Compartment", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31546, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31544, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31545, 
         Description = "You enter a small compartment room filled with electronic equipment. It seems\
to be an interrogation room of some sort. You can see computers mounted the\
wall.\
", 
      }, 
      [31546] = 
      {
         TeleDelay = 0, 
         Name = "Death", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31545, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31546, 
         Description = "You are in a room containing nothing but an assault droid in the corner.\
", 
      }, 
      [31547] = 
      {
         TeleDelay = 0, 
         Name = "Corridor", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31540, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "up", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31548, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31547, 
         Description = "You are walking down a corridor and can see a ladder at the end of the hall.\
", 
      }, 
      [31548] = 
      {
         TeleDelay = 0, 
         Name = "Ladder", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31550, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31551, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31549, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "down", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31547, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31548, 
         Description = "You are heading up a ladder headed towards the top portion of the ship.\
", 
      }, 
      [31549] = 
      {
         TeleDelay = 0, 
         Name = "Passenger Compartment", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31548, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31549, 
         Description = "You enter a passenger compartment that seems to have been inhabitated.\
", 
      }, 
      [31550] = 
      {
         TeleDelay = 0, 
         Name = "Pilot Compartment", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31548, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31550, 
         Description = "You are in the pilot compartment and you look out the viewer console to see\
sand covering it. The computer equipment seems to be usable and undamaged.\
", 
      }, 
      [31551] = 
      {
         TeleDelay = 0, 
         Name = "Room", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31548, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31551, 
         Description = "This room contains nothing in it besides a viewer console and\
seems very strange.\
", 
      }, 
      [31552] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31539, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31553, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31552, 
         Description = "You walk around the immense shuttle to the top of a dune and continue exploring\
the dune sea of Tatooine. It tower around you fromm all directions.\
", 
      }, 
      [31553] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31554, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31552, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31553, 
         Description = "The shuttle starts to get smaller and you can see only sand in front of you.\
", 
      }, 
      [31554] = 
      {
         TeleDelay = 0, 
         Name = "Desert ", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31553, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31554, 
         Description = "You walk slowly and exhausted to find nothing here.\
", 
      }, 
      [31555] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31508, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31556, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31555, 
         Description = "All around you is sand and shiny dunes piling as high as you can see. As far\
as you can guess anything could be behind there. The towering sand dunes make\
you feel scared as you are so small and enclosed by the towering heaps of sand.\
", 
      }, 
      [31556] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31555, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31556, 
         Description = "All around you is sand and shiny dunes piling as high as you can see. As far\
as you can guess anything could be behind there. The towering sand dunes make\
you feel scared as you are so small and enclosed by the towering heaps of sand.\
", 
      }, 
      [31557] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31500, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31558, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31592, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31557, 
         Description = "All around you is sand and shiny dunes piling as high as you can see.\
As far as you can guess anything could be behind there. The towering\
sand dunes make you  eel scared as you are so small and enclosed by\
the towering heaps of sand.\
", 
      }, 
      [31558] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31559, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31557, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31558, 
         Description = "You are on the top of a sand dune and you can see across the whole dune sea.\
It is just a great sight to see. The sand dunes dip in and out of the ground.\
The immense amount of sand frightens you as you look across the great sand\
dune sea of Tatooine.\
", 
      }, 
      [31559] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31560, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31565, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31558, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31559, 
         Description = "The sand is soft and is still all around you. It is high and shinning in your\
face as you repeatedly walk over endless amounts of sand. You feel enclosed\
because of their great mass. As you walk forward, with every step you take the\
sand dunes grow in size and proportion.\
", 
      }, 
      [31560] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31561, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31559, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31560, 
         Description = "The dunes you are walking on are reaching a few feet high now and you are\
approaching the greater dunes at a rather fast pace.\
", 
      }, 
      [31561] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31560, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31562, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31564, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31561, 
         Description = "You are on a large dune right now and you can see dunes for a long way.\
", 
      }, 
      [31562] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31563, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31561, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31562, 
         Description = "You are heading into the sea of dunes. Be careful where you go or you might not come back.\
", 
      }, 
      [31563] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31569, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31562, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31563, 
         Description = "The dunes under you appear to be growing with every step that you take.\
", 
      }, 
      [31564] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31561, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31571, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31564, 
         Description = "You are on a large dune heading further and further away from the grasp of\
civilization.\
", 
      }, 
      [31565] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31559, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31566, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31565, 
         Description = "You are walking on the rippling surface of the sand which has been\
exposed to extreme heat over the many years. The sand is very warm and\
stings your face as the wind blows it up onto your soft skin. The air\
is thick and very heavy to breathe, but living with it is something you\
accepted when you entered the desert.\
", 
      }, 
      [31566] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31565, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31567, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31566, 
         Description = "The hard sand beneath your feet is hot and you can only see the same things\
for miles to come. You are walking on the rippling surface of the sand\
which has been exposed to extreme heat over the many years. The sand is\
very warm and stings your face as the wind blows it up onto your soft\
skin. The air is thick and very heavy to breathe, but living with it\
something you accepted when you entered the desert. \
", 
      }, 
      [31567] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31566, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31568, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31567, 
         Description = "The sand is hard and hot but you continue to explore this vast area.\
", 
      }, 
      [31568] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31567, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31568, 
         Description = "The hard sand is getting softer as you walk endlessly.\
", 
      }, 
      [31569] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31563, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31570, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31569, 
         Description = "You are walking up and down endless amounts of sound shaped into great dunes\
trying to find something in this vast sea.\
", 
      }, 
      [31570] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31569, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 3301, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Sector = "desert", 
         Vnum = 31570, 
         Description = "The sand dunes seem to get bigger and higher but it only seems this way from\
exhaustion.\
", 
      }, 
      [31571] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31564, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31572, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31571, 
         Description = "The pummeling dunes are passing under your feet at an alarming rate. Yet there\
is nothing else in sight but sand.\
", 
      }, 
      [31572] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31571, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31573, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31572, 
         Description = "You walk down to the base of one of the largest dunes you have climbed in your\
trip through the great sea of Tatooine.\
", 
      }, 
      [31573] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31574, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31572, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31573, 
         Description = "You turn at the bottom of a dune and start climbing a rather small one.\
", 
      }, 
      [31574] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31575, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31577, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31573, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31574, 
         Description = "The dune you just climbed was a rather small one but when you look down off of\
the dune you realize you are heading down into a valley.\
", 
      }, 
      [31575] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31576, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31574, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31575, 
         Description = "You walk through the valley of sand dunes slowly. The harsh conditions are\
slowing you down gradually over the course of many minutes, hours or even days\
depending on how long you last before you find civilization.\
", 
      }, 
      [31576] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31575, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31576, 
         Description = "The sand dunes around you are making you nautious on what is still left\
to climb over.\
", 
      }, 
      [31577] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31574, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31578, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31577, 
         Description = "You are walking and walking through the treacherous sea of never ending sand.\
", 
      }, 
      [31578] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31577, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31582, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31579, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31578, 
         Description = "You look on but can only see endless amounts of sand but nothing else.\
", 
      }, 
      [31579] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31578, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31580, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31579, 
         Description = "The great sea starts becoming a blur after looking at the bare sands\
for many long hours now.\
", 
      }, 
      [31580] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31579, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31581, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31580, 
         Description = "The sea of dunes is making a great impression on what you think of Tatooine.\
", 
      }, 
      [31581] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31580, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31590, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31581, 
         Description = "You are coming up to a rise of harder sand than all around. The flat\
continues to the west.\
", 
      }, 
      [31582] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31583, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31578, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31582, 
         Description = "The sand is plunging downwards and all of the sea seems to be heading to\
a point of falling.\
", 
      }, 
      [31583] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31584, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31582, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31583, 
         Description = "You are standing on the last dune before the entry point and can see what\
is developed inside.\
", 
      }, 
      [31584] = 
      {
         TeleDelay = 0, 
         Name = "Edge Of The Jundland Wastes", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31585, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31583, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31584, 
         Description = "You are heading down a slope towards a rocky assortment of caves once lived\
in by the native race of this planet. The Jundland Wastes are very large and\
you can see many things from here.\
", 
      }, 
      [31585] = 
      {
         TeleDelay = 0, 
         Name = "Jundland Wastes", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31584, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31586, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "mountain", 
         TeleVnum = 0, 
         Vnum = 31585, 
         Description = "You can see immense caves all around you and feel enclosed by the high walls\
of the caves.\
", 
      }, 
      [31586] = 
      {
         TeleDelay = 0, 
         Name = "Jundland Wastes", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31738, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31589, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31587, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31585, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "mountain", 
         TeleVnum = 0, 
         Vnum = 31586, 
         Description = "You are walking down a rocky path that passes many old caves. To the south you\
see a cave that is still in pretty good condition. All around there is a\
distinct odour.\
", 
      }, 
      [31587] = 
      {
         TeleDelay = 0, 
         Name = "Cave", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31586, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31588, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [0] = "Dark", 
         }, 
         Sector = "mountain", 
         Vnum = 31587, 
         Description = "You are inside a dark cave which has a strong odour of some sort. The cave\
continues to the south.\
", 
      }, 
      [31588] = 
      {
         TeleDelay = 0, 
         Name = "Cave", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31587, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [0] = "Dark", 
         }, 
         Sector = "mountain", 
         Vnum = 31588, 
         Description = "You are in the back of a cave which seems to have been used as a living\
habitat. On the floor in the corner you are appaled when seing three dead\
Jawas. There are some blaster scars on the walls and big gashes everywhere.\
Only one thing could have done this... Sand people.\
", 
      }, 
      [31589] = 
      {
         TeleDelay = 0, 
         Name = "Dry Area", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31805, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31742, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31586, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "mountain", 
         TeleVnum = 0, 
         Vnum = 31589, 
         Description = "You see many things in the rocks around you but the camp seems lifless in many\
ways. The ground is hard and dry for with the twin suns no moisture can be\
kept in the ground.\
", 
      }, 
      [31590] = 
      {
         TeleDelay = 0, 
         Name = "Teeth", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31581, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31590, 
         Description = "D.T(to be edited)\
", 
      }, 
      [31591] = 
      {
         TeleDelay = 0, 
         Name = "A Junction In The Sewer Tunnels", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31620, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31619, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "northwest", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31506, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "underground", 
         TeleVnum = 0, 
         Vnum = 31591, 
         Description = "The river of sewage flows into the area from the east and and northwest, and\
disappears off south.\
", 
      }, 
      [31592] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31557, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31593, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31592, 
         Description = "You are walking along a hardened sand path which seems to be headed to a\
cliff. The towering sand dunes make you feel scared as you are so small\
and enclosed by the towering heaps of sand. The sun is too warm and is\
getting to you as you tread towards what is to be seen.\
", 
      }, 
      [31593] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31592, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31594, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31593, 
         Description = "You are coming to the end of the path as far as you can see. The cliff is\
right ahead of you. The sand blows slowly into your face stinging your\
eyes and the rest of your face. The sun pounds down onto your back making\
you feel twice as heavy as usual. At some points down this way it gets\
steep and you slip a little landing right on your behind.\
", 
      }, 
      [31594] = 
      {
         TeleDelay = 0, 
         Name = "The Cliff", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31593, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31595, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31597, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31594, 
         Description = "You are standing on the edge of a cliff. It overlooks the great city of Mos\
Eisley. It is a great sight. To the east you see the path curve down the\
side of the cliff. The sand blows slowly into your face stinging your eyes\
and the rest of your face. The sun pounds down onto your back making you\
feel twice as heavy as usual. As you walk slowly down the side of the\
cliff the sand gets sharper and if you are not wearing foot gear it could\
get painful.\
", 
      }, 
      [31595] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31596, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31594, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31595, 
         Description = "Still walking along the cliff you start curving down the side of a\
mountain. You are walking down a hard sand path filled with sharp\
minerals that hurt your feet as you walk over the sand. The heat is\
driving against your back as the twin suns start burning your skin, the\
air is hot and heavy lacking moisture. As the sand blows slowly against\
your face you wish you had something to protect it as shards or sand start\
stinging against your face.\
", 
      }, 
      [31596] = 
      {
         TeleDelay = 0, 
         Name = "Desert End", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31601, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31595, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Sector = "desert", 
         Vnum = 31596, 
         Description = "You Curve down the bottom of the path and approach the entry to the city. \
You are walking down a hard sand path filled with sharp minerals that hurt\
your feet as you walk over the sand. The heat is driving against your back\
as the twin suns start burning your skin, the air is hot and heavy lacking\
moisture. As the sand blows slowly against your face you wish you had\
something to protect it as shards or sand start stinging against your\
face.\
", 
      }, 
      [31597] = 
      {
         TeleDelay = 0, 
         Name = "Cliff", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31600, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31594, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31598, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31597, 
         Description = "You are walking along the edge of the cliff. Be careful where you go. The\
sand blows slowly into your face, stinging your eyes and the rest of your\
face. The sand flies into your eyes like annoying bugs stinging your eyes\
until the point where you are going to cry. The sun pounds down onto your\
back making you feel twice as heavy as usual.\
", 
      }, 
      [31598] = 
      {
         TeleDelay = 0, 
         Name = "Cliff", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31667, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31597, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31599, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31598, 
         Description = "You are very near the edge and should return. Be careful. As you walk down\
the edge of the cliff you see chunks of sand falling down the side of the\
cliff. Seconds later you hear the thumping of the sand hitting the ground\
far below. The sand blows slowly into your face stinging your eyes and the\
rest of your face. To the south the sand looks very unstable. It would be\
advisable not to go there.\
", 
      }, 
      [31599] = 
      {
         TeleDelay = 0, 
         Name = "Cliffside", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31598, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "down", 
               Key = -1, 
               Flags = 
               {
                  [11] = "Hidden", 
               }, 
               Distance = 0, 
               DestinationVnum = 31880, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [24] = "NoFloor", 
         }, 
         Sector = "desert", 
         Vnum = 31599, 
         Description = "Aaah, you are loosing your grip! Looking down would not be a good idea as for\
you're about to fall!\
", 
      }, 
      [31600] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31658, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31597, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31600, 
         Description = "You are walking along the flat sands of Tatooine.\
", 
      }, 
      [31601] = 
      {
         TeleDelay = 0, 
         Name = "Edge Of Mos Eisley", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31596, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31602, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31878, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         TeleVnum = 0, 
         Vnum = 31601, 
         Description = "You walk into the city, it is a large places with many uses. The thugs of\
the galaxy hang around this town. You are walking down a hard sand path\
filled with sharp minerals that hurt your feet as you walk over the sand.\
The heat is driving against your back as the twin suns start burning your\
skin, the air is hot and heavy lacking moisture. As the sand blows slowly\
against your face you wish you had something to protect it as shards or\
sand start stinging against your face.\
", 
      }, 
      [31602] = 
      {
         TeleDelay = 0, 
         Name = "City", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31601, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31628, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31603, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         TeleVnum = 0, 
         Vnum = 31602, 
         Description = "You are walking towards the inner town of Mos Eisley and towards the\
spaceport. The market is also in the vicinity of the inner city. You are\
walking down a hard sand path filled with sharp minerals that hurt your\
feet as you walk over the sand. The heat is driving against your back as\
the twin suns start burning your skin, the air is hot and heavy lacking\
moisture. As the sand blows slowly against your face you wish you had\
something to protect it as shards or sand start stinging against your\
face.\
", 
      }, 
      [31603] = 
      {
         TeleDelay = 0, 
         Name = "City", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31602, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31604, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         TeleVnum = 0, 
         Vnum = 31603, 
         Description = "You are approaching an intersection which will bring you to different parts\
of the city. You are walking down a hard sand path filled with sharp\
minerals that hurt your feet as you walk over the sand. The heat is\
driving against your back as the twin suns start burning your skin, the\
air is hot and heavy lacking moisture. As the sand blows slowly against\
your face you wish you had something to protect it as shards or sand start\
stinging against your face.\
", 
      }, 
      [31604] = 
      {
         TeleDelay = 0, 
         Name = "In Front Of Mos Eisley Spaceport", 
         Tag = "PlayerStart", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31603, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31653, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31605, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         TeleVnum = 0, 
         Vnum = 31604, 
         Description = "You are walking down the path heading directly to the Spaceport. You are\
walking through the large, scum filled city of Mos Eisley. You are\
walking down a hard sand path filled with sharp minerals that hurt your\
feet as you walk over the sand. The heat is driving against your back as\
the twin suns start burning your skin, the air is hot and heavy lacking\
moisture. As the sand blows slowly against your face you wish you had\
something to protect it as shards or sand start stinging against your\
face.\
", 
      }, 
      [31605] = 
      {
         TeleDelay = 0, 
         Name = "Pathway To Control Center", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31604, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31841, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31606, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         TeleVnum = 0, 
         Vnum = 31605, 
         Description = "You are walking down a path to the control center. There they watch the\
activities of vessels from all parts of the galaxy. It is not a very large\
building but is suitable for its purpose. The ground beneath your feet is\
hardening as you approach the centre and the air is continuasly heavy and\
warm.\
", 
      }, 
      [31606] = 
      {
         TeleDelay = 0, 
         Name = "Pathway To Control Center", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31605, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31607, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         TeleVnum = 0, 
         Vnum = 31606, 
         Description = "You are in front of the control center for the spaceport. Inside this building\
many descisions are made to decide who should be allowed to land on this\
planet and not to cause air havoc.\
", 
      }, 
      [31607] = 
      {
         TeleDelay = 0, 
         Name = "In Front Of The Control Center", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31606, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               DestinationVnum = 31608, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         TeleVnum = 0, 
         Vnum = 31607, 
         Description = "You are in front of the doors to the spaceport control center. To enter it go\
to the west. At many times of the year this building is just chained up and\
locked. Left here abandoned for the law here is not really kept up tight. The\
door is of solid wood and looks very strong.\
", 
      }, 
      [31608] = 
      {
         TeleDelay = 0, 
         Name = "Inside The Control Center", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31609, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               DestinationVnum = 31607, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31613, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31615, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31608, 
         Description = "You are in the entrance to the control center. There are turbolifts moving\
all around you. The control tower is on the higher levels but the offices are\
here on the main level of the building. The ground is hard and seems to be\
made of stone. The air is crisp and relaxing in here for it is shielded from\
the twin suns of Tatooine.\
", 
      }, 
      [31609] = 
      {
         TeleDelay = 0, 
         Name = "Hallway", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31608, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31610, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31609, 
         Description = "You are in a hallway with doors to executive offices all the way down the\
hall. There are doors placed on both sides of the hall leading into individual\
offices.\
", 
      }, 
      [31610] = 
      {
         TeleDelay = 0, 
         Name = "In The Hallway", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               DestinationVnum = 31611, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31609, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Key = -1, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               DestinationVnum = 31612, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31610, 
         Description = "You walk down a narrow hallway which has not much space to each side. To your\
sides there are two offices which hold different things. The ground here is\
made of stone and the illumination is poor as for only one glowpanel remains\
to light up this entire hallway. The air is relaxing and constantly flooding\
your lungs for it is a change towards the hot and heavy air outdoors.\
", 
      }, 
      [31611] = 
      {
         TeleDelay = 0, 
         Name = "Large Conference Room", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               DestinationVnum = 31610, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31611, 
         Description = "You are in one of the first offices ever built. It is well furnished and\
decorated. It is used for conferences because of its size but there are not\
many conferences because of the slackness of law on this planet.\
", 
      }, 
      [31612] = 
      {
         TeleDelay = 0, 
         Name = "Manager's Office", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               DestinationVnum = 31610, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31612, 
         Description = "This office is a private office for the manager of this facility. It is a\
rather large office with many vents in it to allow the entrance of crisp air\
to enter the room. There is a large desk made from oak in the middle of the\
room stacked up with 3 pieces of paper.\
", 
      }, 
      [31613] = 
      {
         TeleDelay = 0, 
         Name = "Hallway", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31608, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               DestinationVnum = 31614, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31613, 
         Description = "This hallway heads towards the rooms with the generating and computer\
equipment of the control center.\
", 
      }, 
      [31614] = 
      {
         TeleDelay = 0, 
         Name = "Generator Room", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               DestinationVnum = 31613, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31614, 
         Description = "This room contains all of the power generating equipment for the spaceport.\
The generators and computer systems are all mounted on the walls.\
", 
      }, 
      [31615] = 
      {
         TeleDelay = 0, 
         Name = "Lobby", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31608, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "up", 
               Key = -1, 
               Flags = 
               {
                  [0] = "IsDoor", 
                  [5] = "PickProof", 
               }, 
               Distance = 0, 
               DestinationVnum = 31616, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31615, 
         Description = "This is the lobby of the control center. In the corner a secretary takes\
messages and allows passage to the tower.\
", 
      }, 
      [31616] = 
      {
         TeleDelay = 0, 
         Name = "Tower", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31617, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "down", 
               Key = -1, 
               Flags = 
               {
                  [0] = "IsDoor", 
                  [5] = "PickProof", 
               }, 
               Distance = 0, 
               DestinationVnum = 31615, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31616, 
         Description = "You are standing in the control tower. Most of the tower is run by droids and\
computers. The only living creatures are humans.\
", 
      }, 
      [31617] = 
      {
         TeleDelay = 0, 
         Name = "Viewscreen", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31616, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31617, 
         Description = "Here you can see the whole spaceport from this large viewing screen. As you\
peer through it you can see many different species of life from all across the\
galaxy.\
", 
      }, 
      [31618] = 
      {
         TeleDelay = 0, 
         Name = "Upstairs In The Cantina", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "down", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31863, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [10] = "Safe", 
            [23] = "Hotel", 
         }, 
         Sector = "city", 
         Vnum = 31618, 
         Description = "The upstairs of the cantina contains a few rooms that Wuher rents out for a\
small fee. They are barren and comfortable but the locks all work so at\
least they should be a safe.\
 \
This would be a good place to rest for a while. You may quit and reenter\
the game from here.\
 \
", 
      }, 
      [31619] = 
      {
         TeleDelay = 0, 
         Name = "Tunnel Blocked By A Large Grate", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31591, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "underground", 
         TeleVnum = 0, 
         Vnum = 31619, 
         Description = "Beyond a large grate blocking the way ahead, you see a light far ahead, at the\
end of the tunnel. This is probably where the sewege goes. You probably don't\
even want to know what happens to it next.\
", 
      }, 
      [31620] = 
      {
         TeleDelay = 0, 
         Name = "A Large Chamber", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31622, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31591, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "underground", 
         TeleVnum = 0, 
         Vnum = 31620, 
         Description = "The tunnels widen into a large chamber. The river of sewage runs through it,\
but most of the floor is dry ground. The purpose of this chamber is not\
obvious, as it's otherwise empty.\
", 
      }, 
      [31621] = 
      {
         TeleDelay = 0, 
         Name = "A Bend In The Tunnels", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31504, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "southwest", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31622, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "underground", 
         TeleVnum = 0, 
         Vnum = 31621, 
         Description = "The tunnel bends as the river flows from the east to the southwest. There are\
some large fans embedded into the wall, probably to provide breathable air\
into the tunnels.\
", 
      }, 
      [31622] = 
      {
         TeleDelay = 0, 
         Name = "A Tunnel In The Sewers", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31620, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "northeast", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31621, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "underground", 
         TeleVnum = 0, 
         Vnum = 31622, 
         Description = "#31904\
", 
      }, 
      [31623] = 
      {
         TeleDelay = 0, 
         Name = "Maintenance Personnel's Area", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
               }, 
               Distance = 1, 
               DestinationVnum = 31503, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "underground", 
         Vnum = 31623, 
         Description = "Even the people working down here deserve a break, and this is where they\
take it. There are some posters on the walls that otherwise has an industrial\
look to them.\
", 
      }, 
      [31624] = 
      {
         TeleDelay = 0, 
         Name = "Mercs For Hire", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31882, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31625, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31624, 
         Description = "", 
      }, 
      [31625] = 
      {
         TeleDelay = 0, 
         Name = "Foyer Of Facility", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31626, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31624, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31627, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31625, 
         Description = "", 
      }, 
      [31626] = 
      {
         TeleDelay = 0, 
         Name = "Combat Trainer", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31625, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31626, 
         Description = "", 
      }, 
      [31627] = 
      {
         TeleDelay = 0, 
         Name = "Equipment Shop", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31625, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31627, 
         Description = "", 
      }, 
      [31628] = 
      {
         TeleDelay = 0, 
         Name = "Another Street In Mos Eisley", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31629, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31602, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         TeleVnum = 0, 
         Vnum = 31628, 
         Description = "", 
      }, 
      [31629] = 
      {
         TeleDelay = 0, 
         Name = "Straight Street", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31630, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31634, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31628, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         TeleVnum = 0, 
         Vnum = 31629, 
         Description = "", 
      }, 
      [31630] = 
      {
         TeleDelay = 0, 
         Name = "Artisan Guild", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31631, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31629, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31630, 
         Description = "", 
      }, 
      [31631] = 
      {
         TeleDelay = 0, 
         Name = "Guild Foyer", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31633, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31630, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31632, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31631, 
         Description = "", 
      }, 
      [31632] = 
      {
         TeleDelay = 0, 
         Name = "Engineering Classes", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31631, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31632, 
         Description = "", 
      }, 
      [31633] = 
      {
         TeleDelay = 0, 
         Name = "A Large Workshop", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31631, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [26] = "Factory", 
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31633, 
         Description = "", 
      }, 
      [31634] = 
      {
         TeleDelay = 0, 
         Name = "Straight Street", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31635, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31629, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         TeleVnum = 0, 
         Vnum = 31634, 
         Description = "", 
      }, 
      [31635] = 
      {
         TeleDelay = 0, 
         Name = "The Mayor's Building", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31634, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31636, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31635, 
         Description = "", 
      }, 
      [31636] = 
      {
         TeleDelay = 0, 
         Name = "A Spacious Office", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31635, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [10] = "Safe", 
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31636, 
         Description = "", 
      }, 
      [31637] = 
      {
         TeleDelay = 0, 
         Name = "Floating in a void", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [30] = "Prototype", 
         }, 
         Sector = "inside", 
         Vnum = 31637, 
         Description = "", 
      }, 
      [31638] = 
      {
         TeleDelay = 0, 
         Name = "Outside Old Ben's Hut", 
         Tag = "BensHut", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Distance = 1, 
               DestinationVnum = 31639, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31681, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31638, 
         Description = "You're standing in front of a small hut made out of synstone. Because of\
the occasional sand storms in the area tearing at the building, it's hard\
to predict how old this structure is.\
", 
      }, 
      [31639] = 
      {
         TeleDelay = 0, 
         Name = "The Living Area", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31641, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Distance = 1, 
               DestinationVnum = 31638, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31640, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31639, 
         Description = "", 
      }, 
      [31640] = 
      {
         TeleDelay = 0, 
         Name = "A Semi-circular Sleeping Alcove", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31639, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31640, 
         Description = "The alcove is small and semicircular. The walls are simple without anything\
interesting on them. There's just enough room for a bed, but nothing else.\
", 
      }, 
      [31641] = 
      {
         TeleDelay = 0, 
         Name = "A Simple Kitchen", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31642, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31639, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "down", 
               Key = -1, 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Distance = 1, 
               DestinationVnum = 31644, 
               Keyword = "trapdoor", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31641, 
         Description = "", 
      }, 
      [31642] = 
      {
         TeleDelay = 0, 
         Name = "Pantry", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31643, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31641, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31642, 
         Description = "", 
      }, 
      [31643] = 
      {
         TeleDelay = 0, 
         Name = "Bathroom", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31642, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31643, 
         Description = "", 
      }, 
      [31644] = 
      {
         TeleDelay = 0, 
         Name = "The Cellar", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31645, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "up", 
               Key = -1, 
               Flags = 
               {
                  [1] = "Closed", 
                  [0] = "IsDoor", 
               }, 
               Distance = 1, 
               DestinationVnum = 31641, 
               Keyword = "trapdoor", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31644, 
         Description = "", 
      }, 
      [31645] = 
      {
         TeleDelay = 0, 
         Name = "A Small Workshop", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31644, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [16] = "Silence", 
            [26] = "Factory", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31645, 
         Description = "", 
      }, 
      [31646] = 
      {
         TeleDelay = 0, 
         Name = "Northern Edge Of The Jundland Wastes", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31523, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31647, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31646, 
         Description = "", 
      }, 
      [31647] = 
      {
         TeleDelay = 0, 
         Name = "Fort Tusken", 
         Tag = "FortTusken", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31646, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31647, 
         Description = "", 
      }, 
      [31648] = 
      {
         TeleDelay = 0, 
         Name = "TATOOINE BUILDER'S CONTROL CENTER", 
         Tag = "TATOOINE_CONTROL_CENTER", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31648, 
         Description = "This is a room where the builders can work in peace. Very useful to create\
mobs without them starting to wander about.\
", 
      }, 
      [31653] = 
      {
         TeleDelay = 0, 
         Name = "Large Pathway Through The City", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31840, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31654, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31604, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         TeleVnum = 0, 
         Vnum = 31653, 
         Description = "You are walking down one of the main roads in Mos Eisley. As you walk by you\
notice a huge pile of junk where people deposit their goods. The ground you\
walk on is hard and sharp and the air continues to remain the same, heavy and\
warm. The air seems to be getting to you with every step you take but you can\
manage it, after all it's only air.\
", 
      }, 
      [31654] = 
      {
         TeleDelay = 0, 
         Name = "City Road", 
         Tag = "", 
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31655, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31653, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "down", 
               Key = -1, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 1, 
               DestinationVnum = 31907, 
               Keyword = "manhole", 
               Description = "", 
            }, 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "if isjedi($n)\
    if level($n) < 25\
        mpechoat $n You sense that there's something of interest below.\
    endif\
endif\
", 
               Arguments = "100", 
               MudProgType = "entry_prog", 
               ScriptType = "MProg", 
            }, 
         }, 
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Sector = "city", 
         Vnum = 31654, 
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
      }, 
      [31655] = 
      {
         TeleDelay = 0, 
         Name = "City", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31874, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31873, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31853, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31654, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "city", 
         TeleVnum = 0, 
         Vnum = 31655, 
         Description = "You are still continuing down the path through Mos Eisley. Just ahead\
you can see the famous cantina. If you would like to enter it veer to\
the south. But beware this place is dangerous. The ground is hot and\
sandy, the air hot and heavy and of course the heat continuously\
pelts down on you as the twin suns heat the planet. The many business\
places that are around you look interesting and some may be of use. \
There is some active life all around you and it scares you at how\
many dirty people can be in one place. \
", 
      }, 
      [31658] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31659, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31600, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31658, 
         Description = "You are standing on the harsh sand of Tatooine. You are walking on the\
rippling surface of the sand which has been exposed to extreme heat over\
the many years. The sand is very warm and stings your face as the wind\
blows it up onto your soft skin. The air is thick and very heavy to\
breathe, but living with it something you accepted when you entered the\
desert.\
", 
      }, 
      [31659] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31660, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31658, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31659, 
         Description = "You are on the hard sand of Tatooine. All around you you can see sand for\
miles unless you look back.\
", 
      }, 
      [31660] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31661, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31659, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31660, 
         Description = "You are standing on the thickening sand of Tatooine.\
", 
      }, 
      [31661] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31660, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31662, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31661, 
         Description = "The sand under you is still hard and glowing. As you look around all you can\
see is shiny sand.\
", 
      }, 
      [31662] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31661, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31663, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31662, 
         Description = "You walk on the sand of Tatooine. As you walk over it your feet sink into the\
ground leaving an everlasting mark.\
", 
      }, 
      [31663] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31662, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31664, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31663, 
         Description = "You are walking on the sand of Tatooine. The sand gradually hardens with\
every minute exposed to the sun.\
", 
      }, 
      [31664] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31663, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31665, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31664, 
         Description = "The sand under you is feeling hotter with rays of the sun beaming down on it.\
", 
      }, 
      [31665] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31664, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31666, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31665, 
         Description = "You are standing on the great sands of Tatooine. Far away in the distance you\
can see the developing sea of sand dunes.\
", 
      }, 
      [31666] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31683, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31665, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31666, 
         Description = "You are heading towards the great sand dunes, yet it is still a long journey\
to reach the sand dune sea.\
", 
      }, 
      [31667] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31668, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31598, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31667, 
         Description = "You are headed towards the great dune sea, leaving civilization behind.\
", 
      }, 
      [31668] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31669, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31667, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31668, 
         Description = "You are standing on the hard sand of the planet which has been exposed to\
harsh sun rays.\
", 
      }, 
      [31669] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31670, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31668, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31669, 
         Description = "The sand under you is continually getting softer every step you take towards\
the great sea of sand dunes.\
", 
      }, 
      [31670] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31671, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31669, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31670, 
         Description = "You can now clearly make out the sand dunes ahead of you, but they are still\
very far away.\
", 
      }, 
      [31671] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31672, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31670, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31671, 
         Description = "You are nearing the great sea of sand dunes with every step you take.\
", 
      }, 
      [31672] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31673, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31671, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31672, 
         Description = "You are approaching the sand dunes quickly now and will be there soon. With\
every step you take the sand seems to be getting softer and thicker.\
", 
      }, 
      [31673] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31674, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31672, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31673, 
         Description = "You are only but feet of in reach of the great sea.\
", 
      }, 
      [31674] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31675, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31673, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31674, 
         Description = "You are nearing the bottom of the first sand dune in sight. All of a sudden\
they seem much bigger than before. They also seem to be growing with every\
step you take.\
", 
      }, 
      [31675] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31676, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31674, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31675, 
         Description = "The great dune sea now seems so vast and enormous with every step you take.\
In all directions there are sand dunes towering around and over you.\
", 
      }, 
      [31676] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31675, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31677, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31676, 
         Description = "You are surrounded by sand, the dunes extend as far as you can see.\
", 
      }, 
      [31677] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31676, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31678, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31677, 
         Description = "You walk endlessly on the sand beneath you. It towers all around and\
makes you feel enclosed.\
", 
      }, 
      [31678] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31677, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31679, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31678, 
         Description = "You are walking on a dune. It is shaped by the everlasting winds of Tatooine.\
", 
      }, 
      [31679] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31678, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31680, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31679, 
         Description = "The sand around you is thick and hot. In the daytime the sunrays make the\
sand extremely hot.\
", 
      }, 
      [31680] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31679, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31681, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31680, 
         Description = "You are walking on the sand dunes of the great sea. They tower around you in\
all directions.\
", 
      }, 
      [31681] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 1, 
               DestinationVnum = 31638, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31680, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31681, 
         Description = "You are walking though the thick sand. It covers your feet and makes you feel\
enclosed.\
", 
      }, 
      [31682] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Sector = "desert", 
         Vnum = 31682, 
         Description = "You walk on the sand dunes of the great sea of Tatooine. They shimmer around\
you in the daylight.\
", 
      }, 
      [31683] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31684, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31666, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31683, 
         Description = "You are standing on the thickening sand of the desert.\
", 
      }, 
      [31684] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31685, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31683, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31684, 
         Description = "You are nearing the first of many sand dunes. All around you can now\
see the sand dunes of the great sea. You can already feel the wind\
blowing the sharp sand into your face. The sand is very sharp so\
wearing something on your face would be a good idea. The twin suns of\
the planet are pounding heat onto your back as you walk slowly\
through the drifts of sand. Your lungs are hurting because this heavy\
air is making their job two times harder. \
", 
      }, 
      [31685] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31686, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31698, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31684, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31694, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31685, 
         Description = "You are at the step of the first sand dune. You can enter the sand dune sea\
of Tatooine to the north, the west and the east.\
", 
      }, 
      [31686] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31687, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31685, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31686, 
         Description = "You are on one of many large sand dunes in this vast sea.\
", 
      }, 
      [31687] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31688, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31686, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31687, 
         Description = "All around you are large sand dunes. If you would like to stay out of the sea\
turn back now.\
", 
      }, 
      [31688] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31689, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31687, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31688, 
         Description = "You are inside a small valley of sand dunes. All around you shimmering sand\
dunes tower over you.\
", 
      }, 
      [31689] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31688, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31690, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31689, 
         Description = "You are now in the great sea. The only thing you will find is this great sea\
is probably death.\
", 
      }, 
      [31690] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31689, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31691, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31690, 
         Description = "You are standing on a vast sand dune which is high enough for you to see\
clearly across the sea.\
", 
      }, 
      [31691] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31690, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31692, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31691, 
         Description = "You are among many sand dunes. All around you the great sand dunes tower over\
you and you now wonder what you're doing here.\
", 
      }, 
      [31692] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31691, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31693, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31692, 
         Description = "The vast sand dunes around you make you feel enclosed. For as far as you can\
see there is only sand.\
", 
      }, 
      [31693] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31692, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31693, 
         Description = "You are going endlessly over sand dunes wondering why you are here.\
", 
      }, 
      [31694] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31685, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31695, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31694, 
         Description = "You are standing in front of a largely spaced sea of sand dunes which seems\
never ending.\
", 
      }, 
      [31695] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31694, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31696, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31695, 
         Description = "You are leaving any hopes of finding civilization behind. The only thing you\
shall find out here is certain death.\
", 
      }, 
      [31696] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31702, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31695, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31697, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31696, 
         Description = "You are looking endlessly at the sand around you. You are but only a small\
figure compared to the sand surrounding you.\
", 
      }, 
      [31697] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31706, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31696, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31711, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31697, 
         Description = "You are on a sand dune. You can glare far out into the dune sea, but all you\
can see is sand, sand and more sand.\
", 
      }, 
      [31698] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31699, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31685, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31698, 
         Description = "You are standing in front of a sand dune. In all directions but the one you\
came are sand dunes.\
", 
      }, 
      [31699] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31700, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31698, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31699, 
         Description = "The sand is thicker now that you are on the sand dunes. The great sea is\
greater than you thought and it might be wise to turn back now.\
", 
      }, 
      [31700] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31701, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31699, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31700, 
         Description = "You are on a sand dune. As you look the sand dunes never end in this vast sea.\
", 
      }, 
      [31701] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31700, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31701, 
         Description = "You are in the endless sea of sand dunes. All around you all you can see is\
sand.\
", 
      }, 
      [31702] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31703, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31696, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31702, 
         Description = "You are still in the endless sea of sand dunes. As you peer around yourself\
it feels hopeless in regards to where you are.\
", 
      }, 
      [31703] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31704, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31702, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31703, 
         Description = "You are in between many sand dunes. They are around you from every angle and\
you feel enclosed because of their height.\
", 
      }, 
      [31704] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31705, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31703, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31704, 
         Description = "You are on the side of a sand dune. You look around you and there are still\
no traces of life.\
", 
      }, 
      [31705] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31704, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31705, 
         Description = "All around you all you can see is sand. The towering sand dunes are all\
around you and you cannot figure out where you are.\
", 
      }, 
      [31706] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31707, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31697, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31714, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31706, 
         Description = "You are standing on soft sand. With sand dunes surrounding you, you just\
keep on walking.\
", 
      }, 
      [31707] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31708, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31706, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31707, 
         Description = "You are walking on a sand dune. All around you there are sand dunes. They\
tower high over you until you reach the top of one and start heading back\
down.\
", 
      }, 
      [31708] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31709, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31707, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31718, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31708, 
         Description = "You are standing on the top of a sand dune. And as you hope for something all\
you can see is the voyage down the side of yet another sand dune.\
", 
      }, 
      [31709] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31710, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31708, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31709, 
         Description = "You are heading down the side of a dune. Its size makes you feel tired for it\
only makes the journey longer.\
", 
      }, 
      [31710] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31709, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31710, 
         Description = "You are surrounded by sand dunes and as they tower over you, you feel\
enclosed.\
", 
      }, 
      [31711] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31697, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31712, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31711, 
         Description = "You are enlosed by many sand dunes which lay around you.\
", 
      }, 
      [31712] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31711, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31713, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31712, 
         Description = "You are on a sand dune. You can only see sand and formations of dunes in your range of vision.\
", 
      }, 
      [31713] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31712, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31713, 
         Description = "You are standing on the top of a sand dune. You feel bigger when you reach the\
top of a sand dune but there is always the way down to think about.\
", 
      }, 
      [31714] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31706, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31715, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31714, 
         Description = "You are walking down the side of a sand dune. All around you is sand as far\
as you can see.\
", 
      }, 
      [31715] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31714, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31716, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31715, 
         Description = "The dunes around you are normal as you walk over the endless amount of sand.\
The sea of rippling sand still surrounds you with overwhelming greatness. The\
sand has a reflective shine to it assisted by the sunrays of the heating suns.\
You feel enclosed because the dunes tower over you greatly.\
", 
      }, 
      [31716] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31715, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31717, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31716, 
         Description = "You are on the side of a dune. It is a large dune so walking down it only to\
walk up another is starting to bother you. The dunes around you are normal as\
you walk over the endless amount of sand. The sea of rippling sand still\
surrounds you with overwhelming greatness. The sand has a reflective shine to\
it assisted by the sunrays of the heating suns. You feel enclosed because the\
dunes tower over you greatly.\
", 
      }, 
      [31717] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31716, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31717, 
         Description = "You are standing in between various sand dunes of all sizes and shapes.\
", 
      }, 
      [31718] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31708, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31719, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31718, 
         Description = "You are walking on soft sand. The sand dunes tower around you from all\
directions.\
", 
      }, 
      [31719] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31718, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31720, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31719, 
         Description = "You are on the side of a sand dune approaching the top.\
", 
      }, 
      [31720] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31719, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31721, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31720, 
         Description = "You are on the top edge of a sand dune. As you peer around you there is only\
sand.\
", 
      }, 
      [31721] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31722, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31720, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31721, 
         Description = "You are standing on the side of the sharply shaped sand dune. You are\
approaching the bottom once again so that you can continue with your\
journey.\
", 
      }, 
      [31722] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31723, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31721, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31722, 
         Description = "You are on a large sand dune. All around you can see sand.\
", 
      }, 
      [31723] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31722, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31724, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31723, 
         Description = "You are walking on the side of a sand dune. All around you sand dunes tower\
over you.\
", 
      }, 
      [31724] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31725, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31723, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31724, 
         Description = "You are standing on the top of a sand dune. All around you there is sand.\
", 
      }, 
      [31725] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31724, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31726, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31725, 
         Description = "You are surrounded by sand from all sides and feel enclosed.\
", 
      }, 
      [31726] = 
      {
         TeleDelay = 0, 
         Name = "Desert", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31725, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31727, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31726, 
         Description = "You are standing on the top of a sand dune. You can see what seems to be a\
palace of some sort in the side of a sand dune just ahead.\
", 
      }, 
      [31727] = 
      {
         TeleDelay = 0, 
         Name = "The Dune Sea", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31728, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31726, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "desert", 
         TeleVnum = 0, 
         Vnum = 31727, 
         Description = "You are standing in front of what you now recognize as Jabba the Hutt's former\
home.\
", 
      }, 
      [31728] = 
      {
         TeleDelay = 0, 
         Name = "In Front Of Jabba's Palace", 
         Tag = "JabbasPalace", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               DestinationVnum = 31729, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31727, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Sector = "desert", 
         Vnum = 31728, 
         Description = "You are in front of a large door. It seems to not have been opened in years.\
", 
      }, 
      [31729] = 
      {
         TeleDelay = 0, 
         Name = "Entrance To Jabba's Palace", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31730, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Distance = 0, 
               DestinationVnum = 31728, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31729, 
         Description = "You are standing in a large opening surrounded by large walls which tower\
around you. It is very dark in here and you can only continue to the north.\
", 
      }, 
      [31730] = 
      {
         TeleDelay = 0, 
         Name = "Hallway In Jabba's Palace", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31731, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31729, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31730, 
         Description = "You are walking down a corridor towards the what seems to be a large room.\
The air around you is thick and has a foul odor.\
", 
      }, 
      [31731] = 
      {
         TeleDelay = 0, 
         Name = "In Front Of Audience Chamber", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31732, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31733, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31730, 
               Keyword = "", 
               Description = "", 
            }, 
            [4] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31734, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31731, 
         Description = "You are standing in front of the large audience chamber. It was designed to\
hold many people including dancing girls, bands and tables full of people.\
But, since the Monks took over the palace it has not been used.\
", 
      }, 
      [31732] = 
      {
         TeleDelay = 0, 
         Name = "Jabba's Dais", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31731, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "inside", 
         TeleVnum = 0, 
         Vnum = 31732, 
         Description = "You are standing on Jabba the Hutt's former Dais. It is a very large area\
which has an exellent view of the audience chamber.\
", 
      }, 
      [31733] = 
      {
         TeleDelay = 0, 
         Name = "Trapdoor", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31800, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31731, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "down", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31798, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31733, 
         Description = "You are standing directly on the trapdoor that was used to feed traitors to\
the Rancor which was killed by Luke Skywalker.\
", 
      }, 
      [31734] = 
      {
         TeleDelay = 0, 
         Name = "Audience Chambers", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31736, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31731, 
               Keyword = "", 
               Description = "", 
            }, 
            [3] = 
            {
               Direction = "up", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31735, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31734, 
         Description = "You are in the audience chambers of the palace. You can go up the stairs\
towards some of the living quarters of the monks.\
", 
      }, 
      [31735] = 
      {
         TeleDelay = 0, 
         Name = "Upper Level Entrance", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31746, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "down", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31734, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31735, 
         Description = "You are on the upper level of the palace that is now inhabited by mainly\
boormir monks and spiderwalkers.\
", 
      }, 
      [31736] = 
      {
         TeleDelay = 0, 
         Name = "Beside The Dais", 
         Tag = "", 
         ExtraDescriptions = 
         {
         }, 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31734, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         TeleVnum = 0, 
         Tunnel = 0, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Sector = "inside", 
         Vnum = 31736, 
         Description = "You are standing beside the Dais of the former Jabba the Hutt. From here you\
cannot see very well but you are very near the Dais.\
", 
      }, 
      [31737] = 
      {
         TeleDelay = 0, 
         Name = "Beside The Dais", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31733, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "inside", 
         TeleVnum = 0, 
         Vnum = 31737, 
         Description = "You are standing beside the Dais. From here you have a good view of the chambers.\
", 
      }, 
      [31738] = 
      {
         TeleDelay = 0, 
         Name = "Jundland Wastes", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31739, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31586, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "mountain", 
         TeleVnum = 0, 
         Vnum = 31738, 
         Description = "You are standing on a flat rocky surface. As you peer around you see that the\
Jundland Wastes are very large.\
", 
      }, 
      [31739] = 
      {
         TeleDelay = 0, 
         Name = "Jundland Wastes", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31740, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31738, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "mountain", 
         TeleVnum = 0, 
         Vnum = 31739, 
         Description = "You walk around the Jundland Wastes. All around you there is a very\
strong odour.\
", 
      }, 
      [31740] = 
      {
         TeleDelay = 0, 
         Name = "Jundland Wastes", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "north", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31741, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31739, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "mountain", 
         TeleVnum = 0, 
         Vnum = 31740, 
         Description = "You stand on rock. It is a very large area you are about to explore. The odour\
is still strong around you.\
", 
      }, 
      [31741] = 
      {
         TeleDelay = 0, 
         Name = "The Lars Homestead", 
         Tag = "LarsHomestead", 
         Exits = 
         {
            [1] = 
            {
               Direction = "south", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31740, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "mountain", 
         TeleVnum = 0, 
         Vnum = 31741, 
         Description = "You can see lots of rocks and cliffs of many different shapes and sizes all\
around you. The odour is still all around you.\
", 
      }, 
      [31742] = 
      {
         TeleDelay = 0, 
         Name = "Vague Area", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31743, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31589, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "mountain", 
         TeleVnum = 0, 
         Vnum = 31742, 
         Description = "You are walking through the Jundland Wastes. All around you there is a\
distinct odour. Things and small creatures many dead lay here but cannot be\
taken without effort, they must not be worth anything.\
", 
      }, 
      [31743] = 
      {
         TeleDelay = 0, 
         Name = "Jundland Wastes", 
         Tag = "", 
         Exits = 
         {
            [1] = 
            {
               Direction = "east", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31744, 
               Keyword = "", 
               Description = "", 
            }, 
            [2] = 
            {
               Direction = "west", 
               Key = -1, 
               Distance = 0, 
               DestinationVnum = 31742, 
               Keyword = "", 
               Description = "", 
            }, 
         }, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Sector = "mountain", 
         TeleVnum = 0, 
         Vnum = 31743, 
         Description = "You walk down a path through the wastes. All around you the odour thickens.\
", 
      }, 
   }, 
   ResetMessage = "", 
   Resets = 
   {
      [1] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 31500, 
         Command = "M", 
         Arg3 = 31767, 
      }, 
      [2] = 
      {
         Arg2 = 100, 
         MiscData = 1, 
         Arg1 = 31500, 
         Command = "E", 
         Arg3 = 0, 
      }, 
      [3] = 
      {
         Arg2 = 100, 
         MiscData = 1, 
         Arg1 = 31501, 
         Command = "O", 
         Arg3 = 31756, 
      }, 
      [4] = 
      {
         Arg2 = 100, 
         MiscData = 1, 
         Arg1 = 31501, 
         Command = "O", 
         Arg3 = 31756, 
      }, 
      [5] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 31500, 
         Command = "M", 
         Arg3 = 31756, 
      }, 
      [6] = 
      {
         Arg2 = 100, 
         MiscData = 1, 
         Arg1 = 31500, 
         Command = "E", 
         Arg3 = 0, 
      }, 
      [7] = 
      {
         Arg2 = 100, 
         MiscData = 1, 
         Arg1 = 31501, 
         Command = "O", 
         Arg3 = 31759, 
      }, 
      [8] = 
      {
         Arg2 = 100, 
         MiscData = 1, 
         Arg1 = 31501, 
         Command = "O", 
         Arg3 = 31758, 
      }, 
      [9] = 
      {
         Arg2 = 100, 
         MiscData = 1, 
         Arg1 = 31501, 
         Command = "O", 
         Arg3 = 31758, 
      }, 
      [10] = 
      {
         Arg2 = 100, 
         MiscData = 1, 
         Arg1 = 31501, 
         Command = "O", 
         Arg3 = 31758, 
      }, 
      [11] = 
      {
         Arg2 = 100, 
         MiscData = 1, 
         Arg1 = 31502, 
         Command = "O", 
         Arg3 = 31588, 
      }, 
      [12] = 
      {
         Arg2 = 100, 
         MiscData = 1, 
         Arg1 = 31502, 
         Command = "O", 
         Arg3 = 31588, 
      }, 
      [13] = 
      {
         Arg2 = 100, 
         MiscData = 1, 
         Arg1 = 31502, 
         Command = "O", 
         Arg3 = 31588, 
      }, 
      [14] = 
      {
         Arg2 = 100, 
         MiscData = 1, 
         Arg1 = 31503, 
         Command = "O", 
         Arg3 = 31806, 
      }, 
      [15] = 
      {
         Arg2 = 100, 
         MiscData = 1, 
         Arg1 = 31503, 
         Command = "O", 
         Arg3 = 31806, 
      }, 
      [16] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 31502, 
         Command = "M", 
         Arg3 = 31806, 
      }, 
      [17] = 
      {
         Arg2 = 100, 
         MiscData = 1, 
         Arg1 = 31504, 
         Command = "E", 
         Arg3 = 0, 
      }, 
      [18] = 
      {
         Arg2 = 100, 
         MiscData = 1, 
         Arg1 = 31505, 
         Command = "E", 
         Arg3 = 6, 
      }, 
      [19] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 31505, 
         Command = "M", 
         Arg3 = 31831, 
      }, 
      [20] = 
      {
         Arg2 = 100, 
         MiscData = 1, 
         Arg1 = 31508, 
         Command = "O", 
         Arg3 = 31833, 
      }, 
      [21] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 31511, 
         Command = "M", 
         Arg3 = 31837, 
      }, 
      [22] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 31511, 
         Command = "M", 
         Arg3 = 31837, 
      }, 
      [23] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 31511, 
         Command = "M", 
         Arg3 = 31837, 
      }, 
      [24] = 
      {
         Arg2 = 100, 
         MiscData = 1, 
         Arg1 = 31511, 
         Command = "E", 
         Arg3 = 16, 
      }, 
      [25] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 31510, 
         Command = "M", 
         Arg3 = 31838, 
      }, 
      [26] = 
      {
         Arg2 = 100, 
         MiscData = 1, 
         Arg1 = 31508, 
         Command = "O", 
         Arg3 = 31831, 
      }, 
      [27] = 
      {
         Arg2 = 100, 
         MiscData = 1, 
         Arg1 = 31514, 
         Command = "O", 
         Arg3 = 31612, 
      }, 
      [28] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 31517, 
         Command = "M", 
         Arg3 = 31847, 
      }, 
      [29] = 
      {
         Arg2 = 100, 
         MiscData = 1, 
         Arg1 = 31516, 
         Command = "E", 
         Arg3 = 6, 
      }, 
      [30] = 
      {
         Arg2 = 100, 
         MiscData = 1, 
         Arg1 = 31515, 
         Command = "E", 
         Arg3 = 13, 
      }, 
      [31] = 
      {
         Arg2 = 5, 
         MiscData = 1, 
         Arg1 = 31850, 
         Command = "D", 
         Arg3 = 2, 
      }, 
      [32] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 31518, 
         Command = "M", 
         Arg3 = 31851, 
      }, 
      [33] = 
      {
         Arg2 = 100, 
         MiscData = 1, 
         Arg1 = 31517, 
         Command = "E", 
         Arg3 = 16, 
      }, 
      [34] = 
      {
         Arg2 = 4, 
         MiscData = 1, 
         Arg1 = 31515, 
         Command = "M", 
         Arg3 = 31852, 
      }, 
      [35] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 31515, 
         Command = "M", 
         Arg3 = 31852, 
      }, 
      [36] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 31515, 
         Command = "M", 
         Arg3 = 31852, 
      }, 
      [37] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 31515, 
         Command = "M", 
         Arg3 = 31852, 
      }, 
      [38] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 31515, 
         Command = "M", 
         Arg3 = 31852, 
      }, 
      [39] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 31515, 
         Command = "M", 
         Arg3 = 31852, 
      }, 
      [40] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 31512, 
         Command = "M", 
         Arg3 = 31715, 
      }, 
      [41] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 31512, 
         Command = "M", 
         Arg3 = 31715, 
      }, 
      [42] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 31513, 
         Command = "M", 
         Arg3 = 31715, 
      }, 
      [43] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 31514, 
         Command = "M", 
         Arg3 = 31715, 
      }, 
      [44] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 31513, 
         Command = "M", 
         Arg3 = 31715, 
      }, 
      [45] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 31516, 
         Command = "M", 
         Arg3 = 31715, 
      }, 
      [46] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 31516, 
         Command = "M", 
         Arg3 = 31715, 
      }, 
      [47] = 
      {
         Arg2 = 100, 
         MiscData = 1, 
         Arg1 = 31519, 
         Command = "O", 
         Arg3 = 31853, 
      }, 
      [48] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 31519, 
         Command = "M", 
         Arg3 = 31863, 
      }, 
      [49] = 
      {
         Arg2 = 100, 
         MiscData = 1, 
         Arg1 = 31520, 
         Command = "O", 
         Arg3 = 31863, 
      }, 
      [50] = 
      {
         Arg2 = 12, 
         MiscData = 1, 
         Arg1 = 31520, 
         Command = "M", 
         Arg3 = 31871, 
      }, 
      [51] = 
      {
         Arg2 = 12, 
         MiscData = 1, 
         Arg1 = 31520, 
         Command = "M", 
         Arg3 = 31871, 
      }, 
      [52] = 
      {
         Arg2 = 12, 
         MiscData = 1, 
         Arg1 = 31520, 
         Command = "M", 
         Arg3 = 31871, 
      }, 
      [53] = 
      {
         Arg2 = 12, 
         MiscData = 1, 
         Arg1 = 31520, 
         Command = "M", 
         Arg3 = 31871, 
      }, 
      [54] = 
      {
         Arg2 = 12, 
         MiscData = 1, 
         Arg1 = 31520, 
         Command = "M", 
         Arg3 = 31871, 
      }, 
      [55] = 
      {
         Arg2 = 12, 
         MiscData = 1, 
         Arg1 = 31520, 
         Command = "M", 
         Arg3 = 31871, 
      }, 
      [56] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 31501, 
         Command = "M", 
         Arg3 = 31817, 
      }, 
      [57] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 31509, 
         Command = "E", 
         Arg3 = 12, 
      }, 
      [58] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 10314, 
         Command = "G", 
         Arg3 = 0, 
      }, 
      [59] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 31504, 
         Command = "M", 
         Arg3 = 31861, 
      }, 
      [60] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 31527, 
         Command = "M", 
         Arg3 = 31861, 
      }, 
      [61] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 31507, 
         Command = "M", 
         Arg3 = 31861, 
      }, 
      [62] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 31526, 
         Command = "M", 
         Arg3 = 31862, 
      }, 
      [63] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 31521, 
         Command = "M", 
         Arg3 = 31862, 
      }, 
      [64] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 31524, 
         Command = "M", 
         Arg3 = 31862, 
      }, 
      [65] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 31525, 
         Command = "M", 
         Arg3 = 31857, 
      }, 
      [66] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 31506, 
         Command = "M", 
         Arg3 = 31857, 
      }, 
      [67] = 
      {
         Arg2 = 2, 
         MiscData = 1, 
         Arg1 = 31527, 
         Command = "M", 
         Arg3 = 31854, 
      }, 
      [68] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 31523, 
         Command = "M", 
         Arg3 = 31854, 
      }, 
      [69] = 
      {
         Arg2 = 2, 
         MiscData = 1, 
         Arg1 = 31525, 
         Command = "M", 
         Arg3 = 31854, 
      }, 
      [70] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 31528, 
         Command = "M", 
         Arg3 = 31854, 
      }, 
      [71] = 
      {
         Arg2 = 2, 
         MiscData = 1, 
         Arg1 = 31526, 
         Command = "M", 
         Arg3 = 31856, 
      }, 
      [72] = 
      {
         Arg2 = 2, 
         MiscData = 1, 
         Arg1 = 31528, 
         Command = "M", 
         Arg3 = 31856, 
      }, 
      [73] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 31529, 
         Command = "M", 
         Arg3 = 31858, 
      }, 
      [74] = 
      {
         Arg2 = 13, 
         MiscData = 1, 
         Arg1 = 31520, 
         Command = "M", 
         Arg3 = 31855, 
      }, 
      [75] = 
      {
         Arg2 = 2, 
         MiscData = 1, 
         Arg1 = 31524, 
         Command = "M", 
         Arg3 = 31855, 
      }, 
      [76] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 31503, 
         Command = "M", 
         Arg3 = 31653, 
      }, 
      [77] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 31514, 
         Command = "O", 
         Arg3 = 31840, 
      }, 
      [78] = 
      {
         Arg2 = 19, 
         MiscData = 1, 
         Arg1 = 31520, 
         Command = "M", 
         Arg3 = 31870, 
      }, 
      [79] = 
      {
         Arg2 = 19, 
         MiscData = 1, 
         Arg1 = 31520, 
         Command = "M", 
         Arg3 = 31870, 
      }, 
      [80] = 
      {
         Arg2 = 19, 
         MiscData = 1, 
         Arg1 = 31520, 
         Command = "M", 
         Arg3 = 31870, 
      }, 
      [81] = 
      {
         Arg2 = 19, 
         MiscData = 1, 
         Arg1 = 31520, 
         Command = "M", 
         Arg3 = 31870, 
      }, 
      [82] = 
      {
         Arg2 = 19, 
         MiscData = 1, 
         Arg1 = 31520, 
         Command = "M", 
         Arg3 = 31870, 
      }, 
      [83] = 
      {
         Arg2 = 19, 
         MiscData = 1, 
         Arg1 = 31520, 
         Command = "M", 
         Arg3 = 31870, 
      }, 
      [84] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 31521, 
         Command = "O", 
         Arg3 = 31830, 
      }, 
      [85] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 31531, 
         Command = "M", 
         Arg3 = 31875, 
      }, 
      [86] = 
      {
         Arg2 = 100, 
         MiscData = 0, 
         Arg1 = 31504, 
         Command = "M", 
         Arg3 = 31601, 
      }, 
      [87] = 
      {
         Arg2 = 100, 
         MiscData = 0, 
         Arg1 = 31504, 
         Command = "M", 
         Arg3 = 31602, 
      }, 
      [88] = 
      {
         Arg2 = 100, 
         MiscData = 0, 
         Arg1 = 31504, 
         Command = "M", 
         Arg3 = 31603, 
      }, 
      [89] = 
      {
         Arg2 = 100, 
         MiscData = 0, 
         Arg1 = 31504, 
         Command = "M", 
         Arg3 = 31604, 
      }, 
      [90] = 
      {
         Arg2 = 100, 
         MiscData = 0, 
         Arg1 = 31504, 
         Command = "M", 
         Arg3 = 31819, 
      }, 
      [91] = 
      {
         Arg2 = 100, 
         MiscData = 0, 
         Arg1 = 31504, 
         Command = "M", 
         Arg3 = 31821, 
      }, 
      [92] = 
      {
         Arg2 = 100, 
         MiscData = 0, 
         Arg1 = 31504, 
         Command = "M", 
         Arg3 = 31822, 
      }, 
      [93] = 
      {
         Arg2 = 100, 
         MiscData = 0, 
         Arg1 = 31504, 
         Command = "M", 
         Arg3 = 31824, 
      }, 
      [94] = 
      {
         Arg2 = 100, 
         MiscData = 0, 
         Arg1 = 31504, 
         Command = "M", 
         Arg3 = 31828, 
      }, 
      [95] = 
      {
         Arg2 = 100, 
         MiscData = 0, 
         Arg1 = 31504, 
         Command = "M", 
         Arg3 = 31829, 
      }, 
      [96] = 
      {
         Arg2 = 100, 
         MiscData = 0, 
         Arg1 = 31504, 
         Command = "M", 
         Arg3 = 31830, 
      }, 
      [97] = 
      {
         Arg2 = 100, 
         MiscData = 0, 
         Arg1 = 31504, 
         Command = "M", 
         Arg3 = 31832, 
      }, 
      [98] = 
      {
         Arg2 = 100, 
         MiscData = 0, 
         Arg1 = 31504, 
         Command = "M", 
         Arg3 = 31834, 
      }, 
      [99] = 
      {
         Arg2 = 100, 
         MiscData = 0, 
         Arg1 = 31504, 
         Command = "M", 
         Arg3 = 31835, 
      }, 
      [100] = 
      {
         Arg2 = 100, 
         MiscData = 0, 
         Arg1 = 31504, 
         Command = "M", 
         Arg3 = 31837, 
      }, 
      [101] = 
      {
         Arg2 = 20, 
         MiscData = 0, 
         Arg1 = 31503, 
         Command = "M", 
         Arg3 = 31601, 
      }, 
      [102] = 
      {
         Arg2 = 20, 
         MiscData = 0, 
         Arg1 = 31503, 
         Command = "M", 
         Arg3 = 31602, 
      }, 
      [103] = 
      {
         Arg2 = 20, 
         MiscData = 0, 
         Arg1 = 31503, 
         Command = "M", 
         Arg3 = 31603, 
      }, 
      [104] = 
      {
         Arg2 = 20, 
         MiscData = 0, 
         Arg1 = 31503, 
         Command = "M", 
         Arg3 = 31604, 
      }, 
      [105] = 
      {
         Arg2 = 20, 
         MiscData = 0, 
         Arg1 = 31503, 
         Command = "M", 
         Arg3 = 31653, 
      }, 
      [106] = 
      {
         Arg2 = 20, 
         MiscData = 0, 
         Arg1 = 31503, 
         Command = "M", 
         Arg3 = 31840, 
      }, 
      [107] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 31532, 
         Command = "M", 
         Arg3 = 31883, 
      }, 
      [108] = 
      {
         Arg2 = 1, 
         MiscData = 0, 
         Arg1 = 328, 
         Command = "M", 
         Arg3 = 31863, 
      }, 
      [109] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 55, 
         Command = "E", 
         Arg3 = 16, 
      }, 
      [110] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 31900, 
         Command = "M", 
         Arg3 = 31905, 
      }, 
      [111] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 10323, 
         Command = "G", 
         Arg3 = 0, 
      }, 
      [112] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 10324, 
         Command = "G", 
         Arg3 = 0, 
      }, 
      [113] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 31525, 
         Command = "O", 
         Arg3 = 31899, 
      }, 
      [114] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 31526, 
         Command = "O", 
         Arg3 = 31900, 
      }, 
      [115] = 
      {
         Arg2 = 1, 
         MiscData = 0, 
         Arg1 = 31527, 
         Command = "O", 
         Arg3 = 31998, 
      }, 
      [116] = 
      {
         Arg2 = 1, 
         MiscData = 0, 
         Arg1 = 31528, 
         Command = "O", 
         Arg3 = 31997, 
      }, 
      [117] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 31901, 
         Command = "M", 
         Arg3 = 31909, 
      }, 
      [118] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 10323, 
         Command = "E", 
         Arg3 = 16, 
      }, 
      [119] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 31902, 
         Command = "M", 
         Arg3 = 31901, 
      }, 
      [120] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 31529, 
         Command = "O", 
         Arg3 = 31901, 
      }, 
      [121] = 
      {
         Arg2 = 1, 
         MiscData = 0, 
         Arg1 = 31522, 
         Command = "P", 
         Arg3 = 0, 
      }, 
      [122] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 31524, 
         Command = "P", 
         Arg3 = 0, 
      }, 
      [123] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 31530, 
         Command = "O", 
         Arg3 = 31902, 
      }, 
      [124] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 31533, 
         Command = "M", 
         Arg3 = 31503, 
      }, 
      [125] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 32210, 
         Command = "G", 
         Arg3 = 0, 
      }, 
      [126] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 31532, 
         Command = "E", 
         Arg3 = 5, 
      }, 
      [127] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 31531, 
         Command = "O", 
         Arg3 = 31503, 
      }, 
      [128] = 
      {
         Arg2 = 2, 
         MiscData = 1, 
         Arg1 = 31534, 
         Command = "M", 
         Arg3 = 31502, 
      }, 
      [129] = 
      {
         Arg2 = 2, 
         MiscData = 1, 
         Arg1 = 31534, 
         Command = "M", 
         Arg3 = 31502, 
      }, 
      [130] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 31534, 
         Command = "O", 
         Arg3 = 31623, 
      }, 
      [131] = 
      {
         Arg2 = 2, 
         MiscData = 0, 
         Arg1 = 31623, 
         Command = "D", 
         Arg3 = 2, 
      }, 
      [132] = 
      {
         Arg2 = 3, 
         MiscData = 1, 
         Arg1 = 31534, 
         Command = "M", 
         Arg3 = 31908, 
      }, 
      [133] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 31535, 
         Command = "O", 
         Arg3 = 31908, 
      }, 
      [134] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 31535, 
         Command = "M", 
         Arg3 = 31626, 
      }, 
      [135] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 31536, 
         Command = "M", 
         Arg3 = 31632, 
      }, 
      [136] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 31537, 
         Command = "M", 
         Arg3 = 31636, 
      }, 
      [137] = 
      {
         Arg2 = 1, 
         MiscData = 0, 
         Arg1 = 31538, 
         Command = "M", 
         Arg3 = 31857, 
      }, 
      [138] = 
      {
         Arg2 = 31612, 
         MiscData = 0, 
         Arg1 = 31539, 
         Command = "M", 
         Arg3 = 31612, 
      }, 
      [139] = 
      {
         Arg2 = 0, 
         MiscData = 0, 
         Arg1 = 31638, 
         Command = "D", 
         Arg3 = 1, 
      }, 
      [140] = 
      {
         Arg2 = 2, 
         MiscData = 0, 
         Arg1 = 31639, 
         Command = "D", 
         Arg3 = 1, 
      }, 
      [141] = 
      {
         Arg2 = 5, 
         MiscData = 0, 
         Arg1 = 31641, 
         Command = "D", 
         Arg3 = 1, 
      }, 
      [142] = 
      {
         Arg2 = 4, 
         MiscData = 0, 
         Arg1 = 31644, 
         Command = "D", 
         Arg3 = 1, 
      }, 
      [143] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 31536, 
         Command = "O", 
         Arg3 = 31640, 
      }, 
      [144] = 
      {
         Arg2 = 1, 
         MiscData = 1, 
         Arg1 = 31537, 
         Command = "O", 
         Arg3 = 31645, 
      }, 
      [145] = 
      {
         Arg2 = 1, 
         MiscData = 0, 
         Arg1 = 31538, 
         Command = "P", 
         Arg3 = 0, 
      }, 
      [146] = 
      {
         Arg2 = 2, 
         MiscData = 1, 
         Arg1 = 31541, 
         Command = "M", 
         Arg3 = 31676, 
      }, 
      [147] = 
      {
         Arg2 = 15, 
         MiscData = 1, 
         Arg1 = 31520, 
         Command = "M", 
         Arg3 = 31676, 
      }, 
      [148] = 
      {
         Arg2 = 2, 
         MiscData = 1, 
         Arg1 = 31540, 
         Command = "M", 
         Arg3 = 31676, 
      }, 
      [149] = 
      {
         Arg2 = 2, 
         MiscData = 1, 
         Arg1 = 31542, 
         Command = "M", 
         Arg3 = 31676, 
      }, 
      [150] = 
      {
         Arg2 = 3, 
         MiscData = 1, 
         Arg1 = 31541, 
         Command = "M", 
         Arg3 = 31567, 
      }, 
      [151] = 
      {
         Arg2 = 16, 
         MiscData = 1, 
         Arg1 = 31520, 
         Command = "M", 
         Arg3 = 31567, 
      }, 
      [152] = 
      {
         Arg2 = 3, 
         MiscData = 1, 
         Arg1 = 31540, 
         Command = "M", 
         Arg3 = 31567, 
      }, 
      [153] = 
      {
         Arg2 = 3, 
         MiscData = 1, 
         Arg1 = 31542, 
         Command = "M", 
         Arg3 = 31567, 
      }, 
      [154] = 
      {
         Arg2 = 4, 
         MiscData = 1, 
         Arg1 = 31541, 
         Command = "M", 
         Arg3 = 31812, 
      }, 
      [155] = 
      {
         Arg2 = 17, 
         MiscData = 1, 
         Arg1 = 31520, 
         Command = "M", 
         Arg3 = 31812, 
      }, 
      [156] = 
      {
         Arg2 = 4, 
         MiscData = 1, 
         Arg1 = 31540, 
         Command = "M", 
         Arg3 = 31812, 
      }, 
      [157] = 
      {
         Arg2 = 4, 
         MiscData = 1, 
         Arg1 = 31542, 
         Command = "M", 
         Arg3 = 31812, 
      }, 
      [158] = 
      {
         Arg2 = 5, 
         MiscData = 1, 
         Arg1 = 31541, 
         Command = "M", 
         Arg3 = 31511, 
      }, 
      [159] = 
      {
         Arg2 = 18, 
         MiscData = 1, 
         Arg1 = 31520, 
         Command = "M", 
         Arg3 = 31511, 
      }, 
      [160] = 
      {
         Arg2 = 5, 
         MiscData = 1, 
         Arg1 = 31540, 
         Command = "M", 
         Arg3 = 31511, 
      }, 
      [161] = 
      {
         Arg2 = 5, 
         MiscData = 1, 
         Arg1 = 31542, 
         Command = "M", 
         Arg3 = 31511, 
      }, 
      [162] = 
      {
         Arg2 = 6, 
         MiscData = 1, 
         Arg1 = 31541, 
         Command = "M", 
         Arg3 = 31555, 
      }, 
      [163] = 
      {
         Arg2 = 19, 
         MiscData = 1, 
         Arg1 = 31520, 
         Command = "M", 
         Arg3 = 31555, 
      }, 
      [164] = 
      {
         Arg2 = 6, 
         MiscData = 1, 
         Arg1 = 31540, 
         Command = "M", 
         Arg3 = 31555, 
      }, 
      [165] = 
      {
         Arg2 = 6, 
         MiscData = 1, 
         Arg1 = 31542, 
         Command = "M", 
         Arg3 = 31555, 
      }, 
      [166] = 
      {
         Arg2 = 7, 
         MiscData = 1, 
         Arg1 = 31541, 
         Command = "M", 
         Arg3 = 31553, 
      }, 
      [167] = 
      {
         Arg2 = 20, 
         MiscData = 1, 
         Arg1 = 31520, 
         Command = "M", 
         Arg3 = 31553, 
      }, 
      [168] = 
      {
         Arg2 = 7, 
         MiscData = 1, 
         Arg1 = 31540, 
         Command = "M", 
         Arg3 = 31553, 
      }, 
      [169] = 
      {
         Arg2 = 7, 
         MiscData = 1, 
         Arg1 = 31542, 
         Command = "M", 
         Arg3 = 31553, 
      }, 
      [170] = 
      {
         Arg2 = 8, 
         MiscData = 1, 
         Arg1 = 31541, 
         Command = "M", 
         Arg3 = 31520, 
      }, 
      [171] = 
      {
         Arg2 = 21, 
         MiscData = 1, 
         Arg1 = 31520, 
         Command = "M", 
         Arg3 = 31520, 
      }, 
      [172] = 
      {
         Arg2 = 8, 
         MiscData = 1, 
         Arg1 = 31540, 
         Command = "M", 
         Arg3 = 31520, 
      }, 
      [173] = 
      {
         Arg2 = 8, 
         MiscData = 1, 
         Arg1 = 31542, 
         Command = "M", 
         Arg3 = 31520, 
      }, 
      [174] = 
      {
         Arg2 = 9, 
         MiscData = 1, 
         Arg1 = 31541, 
         Command = "M", 
         Arg3 = 31575, 
      }, 
      [175] = 
      {
         Arg2 = 22, 
         MiscData = 1, 
         Arg1 = 31520, 
         Command = "M", 
         Arg3 = 31575, 
      }, 
      [176] = 
      {
         Arg2 = 9, 
         MiscData = 1, 
         Arg1 = 31540, 
         Command = "M", 
         Arg3 = 31575, 
      }, 
      [177] = 
      {
         Arg2 = 9, 
         MiscData = 1, 
         Arg1 = 31542, 
         Command = "M", 
         Arg3 = 31575, 
      }, 
      [178] = 
      {
         Arg2 = 10, 
         MiscData = 1, 
         Arg1 = 31541, 
         Command = "M", 
         Arg3 = 31584, 
      }, 
      [179] = 
      {
         Arg2 = 23, 
         MiscData = 1, 
         Arg1 = 31520, 
         Command = "M", 
         Arg3 = 31584, 
      }, 
      [180] = 
      {
         Arg2 = 10, 
         MiscData = 1, 
         Arg1 = 31540, 
         Command = "M", 
         Arg3 = 31584, 
      }, 
      [181] = 
      {
         Arg2 = 10, 
         MiscData = 1, 
         Arg1 = 31542, 
         Command = "M", 
         Arg3 = 31584, 
      }, 
      [182] = 
      {
         Arg2 = 11, 
         MiscData = 1, 
         Arg1 = 31541, 
         Command = "M", 
         Arg3 = 31666, 
      }, 
      [183] = 
      {
         Arg2 = 24, 
         MiscData = 1, 
         Arg1 = 31520, 
         Command = "M", 
         Arg3 = 31666, 
      }, 
      [184] = 
      {
         Arg2 = 11, 
         MiscData = 1, 
         Arg1 = 31540, 
         Command = "M", 
         Arg3 = 31666, 
      }, 
      [185] = 
      {
         Arg2 = 11, 
         MiscData = 1, 
         Arg1 = 31542, 
         Command = "M", 
         Arg3 = 31666, 
      }, 
      [186] = 
      {
         Arg2 = 12, 
         MiscData = 1, 
         Arg1 = 31541, 
         Command = "M", 
         Arg3 = 31700, 
      }, 
      [187] = 
      {
         Arg2 = 25, 
         MiscData = 1, 
         Arg1 = 31520, 
         Command = "M", 
         Arg3 = 31700, 
      }, 
      [188] = 
      {
         Arg2 = 12, 
         MiscData = 1, 
         Arg1 = 31540, 
         Command = "M", 
         Arg3 = 31700, 
      }, 
      [189] = 
      {
         Arg2 = 12, 
         MiscData = 1, 
         Arg1 = 31542, 
         Command = "M", 
         Arg3 = 31700, 
      }, 
      [190] = 
      {
         Arg2 = 13, 
         MiscData = 1, 
         Arg1 = 31541, 
         Command = "M", 
         Arg3 = 31692, 
      }, 
      [191] = 
      {
         Arg2 = 26, 
         MiscData = 1, 
         Arg1 = 31520, 
         Command = "M", 
         Arg3 = 31692, 
      }, 
      [192] = 
      {
         Arg2 = 13, 
         MiscData = 1, 
         Arg1 = 31540, 
         Command = "M", 
         Arg3 = 31692, 
      }, 
      [193] = 
      {
         Arg2 = 13, 
         MiscData = 1, 
         Arg1 = 31542, 
         Command = "M", 
         Arg3 = 31692, 
      }, 
      [194] = 
      {
         Arg2 = 14, 
         MiscData = 1, 
         Arg1 = 31541, 
         Command = "M", 
         Arg3 = 31689, 
      }, 
      [195] = 
      {
         Arg2 = 27, 
         MiscData = 1, 
         Arg1 = 31520, 
         Command = "M", 
         Arg3 = 31689, 
      }, 
      [196] = 
      {
         Arg2 = 14, 
         MiscData = 1, 
         Arg1 = 31540, 
         Command = "M", 
         Arg3 = 31689, 
      }, 
      [197] = 
      {
         Arg2 = 14, 
         MiscData = 1, 
         Arg1 = 31542, 
         Command = "M", 
         Arg3 = 31689, 
      }, 
      [198] = 
      {
         Arg2 = 14, 
         MiscData = 1, 
         Arg1 = 31541, 
         Command = "M", 
         Arg3 = 31685, 
      }, 
      [199] = 
      {
         Arg2 = 27, 
         MiscData = 1, 
         Arg1 = 31520, 
         Command = "M", 
         Arg3 = 31685, 
      }, 
      [200] = 
      {
         Arg2 = 14, 
         MiscData = 1, 
         Arg1 = 31540, 
         Command = "M", 
         Arg3 = 31685, 
      }, 
      [201] = 
      {
         Arg2 = 14, 
         MiscData = 1, 
         Arg1 = 31542, 
         Command = "M", 
         Arg3 = 31685, 
      }, 
      [202] = 
      {
         Arg2 = 15, 
         MiscData = 1, 
         Arg1 = 31541, 
         Command = "M", 
         Arg3 = 31708, 
      }, 
      [203] = 
      {
         Arg2 = 28, 
         MiscData = 1, 
         Arg1 = 31520, 
         Command = "M", 
         Arg3 = 31708, 
      }, 
      [204] = 
      {
         Arg2 = 15, 
         MiscData = 1, 
         Arg1 = 31540, 
         Command = "M", 
         Arg3 = 31708, 
      }, 
      [205] = 
      {
         Arg2 = 15, 
         MiscData = 1, 
         Arg1 = 31542, 
         Command = "M", 
         Arg3 = 31708, 
      }, 
      [206] = 
      {
         Arg2 = 16, 
         MiscData = 1, 
         Arg1 = 31541, 
         Command = "M", 
         Arg3 = 31704, 
      }, 
      [207] = 
      {
         Arg2 = 29, 
         MiscData = 1, 
         Arg1 = 31520, 
         Command = "M", 
         Arg3 = 31704, 
      }, 
      [208] = 
      {
         Arg2 = 16, 
         MiscData = 1, 
         Arg1 = 31540, 
         Command = "M", 
         Arg3 = 31704, 
      }, 
      [209] = 
      {
         Arg2 = 16, 
         MiscData = 1, 
         Arg1 = 31542, 
         Command = "M", 
         Arg3 = 31704, 
      }, 
      [210] = 
      {
         Arg2 = 17, 
         MiscData = 1, 
         Arg1 = 31541, 
         Command = "M", 
         Arg3 = 31727, 
      }, 
      [211] = 
      {
         Arg2 = 30, 
         MiscData = 1, 
         Arg1 = 31520, 
         Command = "M", 
         Arg3 = 31727, 
      }, 
      [212] = 
      {
         Arg2 = 17, 
         MiscData = 1, 
         Arg1 = 31540, 
         Command = "M", 
         Arg3 = 31727, 
      }, 
      [213] = 
      {
         Arg2 = 17, 
         MiscData = 1, 
         Arg1 = 31542, 
         Command = "M", 
         Arg3 = 31727, 
      }, 
   }, 
   Mobiles = 
   {
      [31500] = 
      {
         Credits = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Name = "monk", 
         Tag = "", 
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
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Stats = 
         {
            Force = 0, 
            Constitution = 10, 
            Strength = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Charisma = 10, 
            Luck = 10, 
            Intelligence = 10, 
         }, 
         Description = "This is a aged monk. He has lived here for many years and has small scars on\
his body.\
", 
         Level = 22, 
         DamRoll = 0, 
         Alignment = 100, 
         LongDescr = "A monk wanders around the palace.\
", 
         Sex = "male", 
         HitRoll = 0, 
         NumberOfAttacks = 0, 
         ArmorClass = 0, 
         Weight = 0, 
         Position = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         Height = 0, 
         ShortDescr = "a short monk", 
         DefaultPosition = "standing", 
         Race = "Human", 
         Flags = 
         {
            [0] = "Npc", 
            [2] = "Scavenger", 
            [6] = "StayArea", 
         }, 
         Vnum = 31500, 
      }, 
      [31501] = 
      {
         Credits = 30000, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Name = "water jawa", 
         Tag = "", 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
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
         MudProgs = 
         {
            [1] = 
            {
               Code = "say If you're looking for some goods...\
say ... you've come to the right place.\
", 
               Arguments = "100", 
               MudProgType = "all_greet_prog", 
               ScriptType = "MProg", 
            }, 
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
            ProfitSell = 0, 
            KeeperShortDescr = "a large Jawa", 
            ProfitBuy = 110, 
         }, 
         Stats = 
         {
            Force = 0, 
            Constitution = 10, 
            Strength = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Charisma = 10, 
            Luck = 10, 
            Intelligence = 10, 
         }, 
         DamRoll = 0, 
         Description = "This jawa seems fierce and old. He has a small pouch where he keeps his money\
and change for customers willing to purchase something.\
", 
         Level = 35, 
         HitRoll = 0, 
         Alignment = 111, 
         LongDescr = "A large, mean looking Jawa sits in his chair comfortably here selling liquids for journeys out into the great dune sea.\
", 
         Sex = "male", 
         NumberOfAttacks = 0, 
         Weight = 0, 
         ArmorClass = 0, 
         Height = 0, 
         Position = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         Race = "Jawa", 
         ShortDescr = "a large Jawa", 
         DefaultPosition = "standing", 
         AffectedBy = 
         {
            [7] = "Sanctuary", 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [6] = "StayArea", 
            [7] = "Wimpy", 
         }, 
         Vnum = 31501, 
      }, 
      [31502] = 
      {
         Credits = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Name = "Krayt dragon", 
         Tag = "", 
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
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Stats = 
         {
            Force = 0, 
            Constitution = 10, 
            Strength = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Charisma = 10, 
            Luck = 10, 
            Intelligence = 10, 
         }, 
         DamRoll = 0, 
         Description = "This ferocious creature is rare but very valuble to many people throughout\
this galaxy. As it eyes you, you wonder what to do.\
", 
         Level = 100, 
         HitRoll = 0, 
         Alignment = 0, 
         LongDescr = "A large krayt stands here towering over you, staring you in the eye.\
", 
         Sex = "female", 
         NumberOfAttacks = 0, 
         Weight = 0, 
         ArmorClass = -170, 
         Height = 0, 
         Position = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         Race = "Reptile", 
         ShortDescr = "a large krayt dragon", 
         DefaultPosition = "standing", 
         AffectedBy = 
         {
            [7] = "Sanctuary", 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [2] = "Scavenger", 
            [0] = "Npc", 
            [5] = "Aggressive", 
            [6] = "StayArea", 
         }, 
         Vnum = 31502, 
      }, 
      [31503] = 
      {
         Credits = 0, 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 0, 
         }, 
         Name = "womp rat", 
         Tag = "", 
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
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Stats = 
         {
            Force = 0, 
            Constitution = 10, 
            Strength = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Charisma = 10, 
            Luck = 10, 
            Intelligence = 10, 
         }, 
         Description = "This creature does not look to be of one of the more appreciated kind.\
", 
         Level = 1, 
         DamRoll = 0, 
         Alignment = 0, 
         LongDescr = "A womp rat hops by.\
", 
         Sex = "male", 
         HitRoll = 0, 
         NumberOfAttacks = 0, 
         ArmorClass = 97, 
         Weight = 0, 
         Position = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 10, 
            HitSizeDice = 10, 
         }, 
         Height = 0, 
         ShortDescr = "a small womp Rat", 
         DefaultPosition = "standing", 
         Race = "Rodent", 
         Flags = 
         {
            [0] = "Npc", 
            [2] = "Scavenger", 
            [6] = "StayArea", 
         }, 
         Vnum = 31503, 
      }, 
      [31504] = 
      {
         Credits = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Name = "Young Jawa", 
         Tag = "", 
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
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Stats = 
         {
            Force = 0, 
            Constitution = 10, 
            Strength = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Charisma = 10, 
            Luck = 10, 
            Intelligence = 10, 
         }, 
         Description = "This creature is not one of the more respectable species but manages to live\
on its own. This Jawa is a very young and untrained.\
", 
         Level = 3, 
         DamRoll = 0, 
         Alignment = 115, 
         LongDescr = "A young Jawa walks around here.\
", 
         Sex = "male", 
         HitRoll = 0, 
         NumberOfAttacks = 0, 
         ArmorClass = 0, 
         Weight = 0, 
         Position = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         Height = 0, 
         ShortDescr = "a young Jawa", 
         DefaultPosition = "standing", 
         Race = "Jawa", 
         Flags = 
         {
            [0] = "Npc", 
            [2] = "Scavenger", 
            [6] = "StayArea", 
         }, 
         Vnum = 31504, 
      }, 
      [31505] = 
      {
         Credits = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Name = "jawa guard", 
         Tag = "", 
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
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Stats = 
         {
            Force = 0, 
            Constitution = 10, 
            Strength = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Charisma = 10, 
            Luck = 10, 
            Intelligence = 10, 
         }, 
         Description = "This is not a regular filthy creature. This Jawa is trained and armed to the\
teeth. Consider it before you attack him.\
", 
         Level = 25, 
         DamRoll = 0, 
         Alignment = 150, 
         LongDescr = "The Jawa guard stands here guarding something.\
", 
         Sex = "male", 
         HitRoll = 0, 
         NumberOfAttacks = 0, 
         ArmorClass = 0, 
         Weight = 0, 
         Position = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         Height = 0, 
         ShortDescr = "a Jawa guard", 
         DefaultPosition = "standing", 
         Race = "Jawa", 
         Flags = 
         {
            [1] = "Sentinel", 
            [2] = "Scavenger", 
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         Vnum = 31505, 
      }, 
      [31506] = 
      {
         Credits = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Name = "Scavenger", 
         Tag = "", 
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
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Stats = 
         {
            Force = 0, 
            Constitution = 10, 
            Strength = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Charisma = 10, 
            Luck = 10, 
            Intelligence = 10, 
         }, 
         Description = "This scavenger is a small animal whom which no attention is regarded.\
", 
         Level = 3, 
         DamRoll = 0, 
         Alignment = 0, 
         LongDescr = "A scavenger walks around here picking up anything he can see.\
", 
         Sex = "male", 
         HitRoll = 0, 
         NumberOfAttacks = 0, 
         ArmorClass = 0, 
         Weight = 0, 
         Position = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         Height = 0, 
         ShortDescr = "a scavenger", 
         DefaultPosition = "standing", 
         Race = "Creature", 
         Flags = 
         {
            [0] = "Npc", 
            [2] = "Scavenger", 
            [6] = "StayArea", 
         }, 
         Vnum = 31506, 
      }, 
      [31507] = 
      {
         Credits = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Name = "Moisture Farmer", 
         Tag = "", 
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
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Stats = 
         {
            Force = 0, 
            Constitution = 10, 
            Strength = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Charisma = 10, 
            Luck = 10, 
            Intelligence = 10, 
         }, 
         Description = "You are looking at one of the ancestors of this planet. They have been here\
ever since the Dowager Queen crashed into the planet.\
", 
         Level = 9, 
         DamRoll = 0, 
         Alignment = 140, 
         LongDescr = "A moisture farmer walks around here, trying to find his destination.\
", 
         Sex = "male", 
         HitRoll = 0, 
         NumberOfAttacks = 0, 
         ArmorClass = 0, 
         Weight = 0, 
         Position = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         Height = 0, 
         ShortDescr = "a moisture farmer", 
         DefaultPosition = "standing", 
         Race = "Human", 
         Flags = 
         {
            [0] = "Npc", 
            [2] = "Scavenger", 
            [6] = "StayArea", 
         }, 
         Vnum = 31507, 
      }, 
      [31508] = 
      {
         Credits = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Name = "Power droid", 
         Tag = "", 
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
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Stats = 
         {
            Force = 0, 
            Constitution = 10, 
            Strength = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Charisma = 10, 
            Luck = 10, 
            Intelligence = 10, 
         }, 
         Description = "This power droid is rather old and has been used for many different purposes\
over the years of its existence. Although it is still functional it is almost\
ready to be trashed. Small wires and shorted connections are sprawled out on\
different parts of the droids surface.\
", 
         Level = 8, 
         DamRoll = 0, 
         Alignment = 0, 
         LongDescr = "A power droid moves around on the ground here, humming.\
", 
         Sex = "undistinguished", 
         HitRoll = 0, 
         NumberOfAttacks = 0, 
         ArmorClass = 0, 
         Weight = 0, 
         Position = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         Height = 0, 
         ShortDescr = "a square power droid", 
         DefaultPosition = "standing", 
         Race = "Droid", 
         Flags = 
         {
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         Vnum = 31508, 
      }, 
      [31509] = 
      {
         Credits = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Name = "Astromech droid.", 
         Tag = "", 
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
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Stats = 
         {
            Force = 0, 
            Constitution = 10, 
            Strength = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Charisma = 10, 
            Luck = 10, 
            Intelligence = 10, 
         }, 
         Description = "This droid, when speaking, makes no sense to you. Throught its beeps and\
sounds its trying to say something to you but you have no clue what. This\
droid seems to have been used before but is in excellent shape.\
", 
         Level = 15, 
         DamRoll = 0, 
         Alignment = 0, 
         LongDescr = "A small astromech droid stands around here chirping away.\
", 
         Sex = "undistinguished", 
         HitRoll = 0, 
         NumberOfAttacks = 0, 
         ArmorClass = 0, 
         Weight = 0, 
         Position = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         Height = 0, 
         ShortDescr = "an astromech droid", 
         DefaultPosition = "standing", 
         Race = "Astromech", 
         Flags = 
         {
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         Vnum = 31509, 
      }, 
      [31510] = 
      {
         Credits = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Name = "Wise Jawa", 
         Tag = "", 
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
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Stats = 
         {
            Force = 0, 
            Constitution = 10, 
            Strength = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Charisma = 10, 
            Luck = 10, 
            Intelligence = 10, 
         }, 
         VipFlags = 
         {
            [8] = "Tatooine", 
         }, 
         DamRoll = 0, 
         Description = "This Jawa has studied the ways of this world for many years, and if you pay\
attention can teach you may things of many uses. Be careful not to attack him\
for he has great powers.\
", 
         Level = 45, 
         HitRoll = 0, 
         Alignment = 210, 
         LongDescr = "A wise Jawa stands here ready to teach you skills.\
", 
         Sex = "undistinguished", 
         NumberOfAttacks = 0, 
         Weight = 0, 
         ArmorClass = 0, 
         Height = 0, 
         Position = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         Race = "Jawa", 
         ShortDescr = "a wise Jawa", 
         DefaultPosition = "standing", 
         AffectedBy = 
         {
            [7] = "Sanctuary", 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [9] = "Train", 
            [6] = "StayArea", 
         }, 
         Vnum = 31510, 
      }, 
      [31511] = 
      {
         Credits = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Name = "Guardian", 
         Tag = "", 
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
         MudProgs = 
         {
            [1] = 
            {
               Code = "say Welcome! Are you ready to learn young apprentice?\
", 
               Arguments = "p arrives from the west.", 
               MudProgType = "act_prog", 
               ScriptType = "MProg", 
            }, 
            [2] = 
            {
               Code = "mpechoat $n The guard ushers you into the chamber.\
mpechoaround $n The guard ushers $n into the chamber.\
mptransfer $n 31838\
mpat $n mpechoaround $n $n is ushered into the chamber.\
", 
               Arguments = "p yes", 
               MudProgType = "speech_prog", 
               ScriptType = "MProg", 
            }, 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Stats = 
         {
            Force = 0, 
            Constitution = 10, 
            Strength = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Charisma = 10, 
            Luck = 10, 
            Intelligence = 10, 
         }, 
         DamRoll = 0, 
         Description = "This is no mere guard. He too has developed many skills and is powerful. You\
should consider attacking him, wisely.\
", 
         Level = 40, 
         HitRoll = 0, 
         Alignment = 0, 
         LongDescr = "A guardian stands here watching over The Wise One.\
", 
         Sex = "male", 
         NumberOfAttacks = 0, 
         Weight = 0, 
         ArmorClass = 0, 
         Height = 0, 
         Position = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         Race = "Jawa", 
         ShortDescr = "a guardian", 
         DefaultPosition = "standing", 
         AffectedBy = 
         {
            [7] = "Sanctuary", 
         }, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         Vnum = 31511, 
      }, 
      [31512] = 
      {
         Credits = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Name = "Sand person tusken raider", 
         Tag = "", 
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
         MudProgs = 
         {
            [1] = 
            {
               Code = "snarl\
swear $n\
", 
               Arguments = "70", 
               MudProgType = "all_greet_prog", 
               ScriptType = "MProg", 
            }, 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Stats = 
         {
            Force = 0, 
            Constitution = 10, 
            Strength = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Charisma = 10, 
            Luck = 10, 
            Intelligence = 10, 
         }, 
         VipFlags = 
         {
            [8] = "Tatooine", 
         }, 
         Description = "This species has adapted to the ways of living in the desert. He is strong in\
mind and is very vicious. Be careful what you do.\
", 
         Level = 23, 
         DamRoll = 0, 
         Alignment = 0, 
         LongDescr = "A Tusken Raider watches you waiting for the right moment to attack.\
", 
         Sex = "male", 
         HitRoll = 0, 
         NumberOfAttacks = 0, 
         ArmorClass = 0, 
         Weight = 0, 
         Position = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         Height = 0, 
         ShortDescr = "a Tusken Raider", 
         DefaultPosition = "standing", 
         Race = "Tusken", 
         Flags = 
         {
            [0] = "Npc", 
            [5] = "Aggressive", 
            [2] = "Scavenger", 
            [6] = "StayArea", 
         }, 
         Vnum = 31512, 
      }, 
      [31513] = 
      {
         Credits = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Name = "Sand people tusken raider Storyteller.", 
         Tag = "", 
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
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Stats = 
         {
            Force = 0, 
            Constitution = 10, 
            Strength = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Charisma = 10, 
            Luck = 10, 
            Intelligence = 10, 
         }, 
         Description = "This Tusken Raider has survived years of training and memory. To become what\
he is he cannot make any mistakes or alter in any way a story told from the\
past or he will be killed, for the Sand People believe that once told a story\
can never be altered in any way.\
", 
         Level = 30, 
         DamRoll = 0, 
         Alignment = 0, 
         LongDescr = "A Wise Tusken Raider sits here telling a story.\
", 
         Sex = "male", 
         HitRoll = 0, 
         NumberOfAttacks = 0, 
         ArmorClass = 0, 
         Weight = 0, 
         Position = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         Height = 0, 
         ShortDescr = "a Tusken Raider storyteller.", 
         DefaultPosition = "standing", 
         Race = "Tusken", 
         Flags = 
         {
            [0] = "Npc", 
            [2] = "Scavenger", 
            [6] = "StayArea", 
         }, 
         Vnum = 31513, 
      }, 
      [31514] = 
      {
         Credits = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Name = "Storyteller training.", 
         Tag = "", 
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
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Stats = 
         {
            Force = 0, 
            Constitution = 10, 
            Strength = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Charisma = 10, 
            Luck = 10, 
            Intelligence = 10, 
         }, 
         Description = "This is one of the younger, wiser Sand People. He is being trained to become\
the next Storyteller of the Sand People. He just hopes in his mind that he\
will remember and remember well every story precisely.\
", 
         Level = 25, 
         DamRoll = 0, 
         Alignment = 0, 
         LongDescr = "A storyteller in training listens carefully here so that he may remember every story with precision and awe.      \
", 
         Sex = "male", 
         HitRoll = 0, 
         NumberOfAttacks = 0, 
         ArmorClass = 0, 
         Weight = 0, 
         Position = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         Height = 0, 
         ShortDescr = "a storyteller in training", 
         DefaultPosition = "standing", 
         Race = "Tusken", 
         Flags = 
         {
            [0] = "Npc", 
            [2] = "Scavenger", 
            [6] = "StayArea", 
         }, 
         Vnum = 31514, 
      }, 
      [31515] = 
      {
         Credits = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Name = "Ronto", 
         Tag = "", 
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
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Stats = 
         {
            Force = 0, 
            Constitution = 10, 
            Strength = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Charisma = 10, 
            Luck = 10, 
            Intelligence = 10, 
         }, 
         Description = "This creature is rather tame but when provoked can be aggressive and\
dangerous. Watch your step.\
", 
         Level = 45, 
         DamRoll = 0, 
         Alignment = 0, 
         LongDescr = "A ronto stands here towering over you.\
", 
         Sex = "male", 
         HitRoll = 0, 
         NumberOfAttacks = 0, 
         ArmorClass = 0, 
         Weight = 0, 
         Position = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         Height = 0, 
         ShortDescr = "a ronto", 
         DefaultPosition = "standing", 
         Race = "Ronto", 
         Flags = 
         {
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         Vnum = 31515, 
      }, 
      [31516] = 
      {
         Credits = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Name = "Bantha", 
         Tag = "", 
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
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Stats = 
         {
            Force = 0, 
            Constitution = 10, 
            Strength = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Charisma = 10, 
            Luck = 10, 
            Intelligence = 10, 
         }, 
         Description = "This is a large furry creature which is rumored to have crushed people with\
one step. Be careful for he does not like people who are not his master.\
", 
         Level = 35, 
         DamRoll = 0, 
         Alignment = 0, 
         LongDescr = "A bantha walks around here slowly, waiting for its master.\
", 
         Sex = "male", 
         HitRoll = 0, 
         NumberOfAttacks = 0, 
         ArmorClass = 0, 
         Weight = 0, 
         Position = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         Height = 0, 
         ShortDescr = "a bantha", 
         DefaultPosition = "standing", 
         Race = "Bantha", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [5] = "Aggressive", 
            [6] = "StayArea", 
         }, 
         Vnum = 31516, 
      }, 
      [31517] = 
      {
         Credits = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Name = "Mechanic", 
         Tag = "", 
         MudProgs = 
         {
            [1] = 
            {
               Code = "say So ya need something fixed, eh?\
", 
               Arguments = "100", 
               MudProgType = "all_greet_prog", 
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
         SaveVs = 
         {
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Stats = 
         {
            Force = 0, 
            Constitution = 10, 
            Strength = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Charisma = 10, 
            Luck = 10, 
            Intelligence = 10, 
         }, 
         Description = "This mechanic is rather young, he has marks and wrinkles from work and\
possibly war. He seems to be calm and will stay away from you unless you\
need something which he may sometimes have.\
", 
         Level = 14, 
         DamRoll = 0, 
         Alignment = 0, 
         LongDescr = "A mechanic waits here to be hired.\
", 
         Sex = "male", 
         HitRoll = 0, 
         NumberOfAttacks = 0, 
         ArmorClass = 0, 
         Weight = 0, 
         Position = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         Height = 0, 
         ShortDescr = "a mechanic", 
         DefaultPosition = "standing", 
         Race = "Human", 
         Flags = 
         {
            [1] = "Sentinel", 
            [2] = "Scavenger", 
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         Vnum = 31517, 
      }, 
      [31518] = 
      {
         Credits = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Name = "tall jawa", 
         Tag = "", 
         MudProgs = 
         {
            [1] = 
            {
               Code = "say So...\
say You're interested in rontos, eh?\
nudge $n\
", 
               Arguments = "100", 
               MudProgType = "all_greet_prog", 
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
         SaveVs = 
         {
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Stats = 
         {
            Force = 0, 
            Constitution = 10, 
            Strength = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Charisma = 10, 
            Luck = 10, 
            Intelligence = 10, 
         }, 
         Description = "This Jawa is probably the tallest Jawa ever. Although he is still smaller than\
you he looks tough, and with that gun I would be scared.\
", 
         Level = 19, 
         DamRoll = 0, 
         Alignment = 140, 
         LongDescr = "A tall jawa stands here protecting his Rontos.\
", 
         Sex = "male", 
         HitRoll = 0, 
         NumberOfAttacks = 0, 
         ArmorClass = 0, 
         Weight = 0, 
         Position = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         Height = 0, 
         ShortDescr = "a tall Jawa", 
         DefaultPosition = "standing", 
         Race = "Jawa", 
         Flags = 
         {
            [1] = "Sentinel", 
            [2] = "Scavenger", 
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         Vnum = 31518, 
      }, 
      [31519] = 
      {
         Credits = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Name = "Wuher", 
         Tag = "", 
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
         Shop = 
         {
            BusinessHours = 
            {
               Open = 1, 
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
            ProfitSell = 100, 
            KeeperShortDescr = "Wuher", 
            ProfitBuy = 105, 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Stats = 
         {
            Force = 0, 
            Constitution = 10, 
            Strength = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Charisma = 10, 
            Luck = 10, 
            Intelligence = 10, 
         }, 
         Description = "This man is rather old and has been working here for many years as bartender.\
Be careful though, he still has his same old edge.\
", 
         Level = 65, 
         DamRoll = 0, 
         Alignment = 0, 
         LongDescr = "Wuher stands here serving people their drinks.\
", 
         Sex = "male", 
         HitRoll = 0, 
         NumberOfAttacks = 0, 
         ArmorClass = 0, 
         Weight = 0, 
         Position = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         Height = 0, 
         ShortDescr = "Wuher", 
         DefaultPosition = "standing", 
         Race = "Human", 
         Flags = 
         {
            [1] = "Sentinel", 
            [2] = "Scavenger", 
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         Vnum = 31519, 
      }, 
      [31520] = 
      {
         Credits = 0, 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 2, 
         }, 
         Name = "Womp rat", 
         Tag = "", 
         Weight = 0, 
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
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Stats = 
         {
            Force = 0, 
            Constitution = 10, 
            Strength = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Charisma = 10, 
            Luck = 10, 
            Intelligence = 10, 
         }, 
         Description = "A small womp rat walk around here seeking shelter.\
", 
         Level = 20, 
         DamRoll = 4, 
         Alignment = 0, 
         LongDescr = "A small womp rat walks around here.\
", 
         Sex = "undistinguished", 
         HitRoll = 4, 
         NumberOfAttacks = 0, 
         ArmorClass = 50, 
         SpecFuns = 
         {
            [0] = "spec_fido", 
         }, 
         Position = "standing", 
         HitChance = 
         {
            HitNoDice = 4, 
            HitPlus = 200, 
            HitSizeDice = 10, 
         }, 
         Height = 0, 
         ShortDescr = "a small womp rat", 
         DefaultPosition = "standing", 
         Race = "Rodent", 
         Flags = 
         {
            [0] = "Npc", 
            [24] = "NoAssist", 
         }, 
         Vnum = 31520, 
      }, 
      [31521] = 
      {
         Credits = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Name = "Small Thief", 
         Tag = "", 
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
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Stats = 
         {
            Force = 0, 
            Constitution = 10, 
            Strength = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Charisma = 10, 
            Luck = 10, 
            Intelligence = 10, 
         }, 
         AttackFlags = 
         {
            [5] = "kick", 
         }, 
         Description = "", 
         Level = 9, 
         DamRoll = 0, 
         Alignment = 0, 
         LongDescr = "A small thief Walks about trying to pick your pocket.\
", 
         Sex = "undistinguished", 
         HitRoll = 0, 
         NumberOfAttacks = 0, 
         ArmorClass = 0, 
         Weight = 0, 
         Position = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         Height = 0, 
         ShortDescr = "a small thief", 
         DefaultPosition = "standing", 
         Race = "Human", 
         Flags = 
         {
            [0] = "Npc", 
            [24] = "NoAssist", 
         }, 
         Vnum = 31521, 
      }, 
      [31522] = 
      {
         Credits = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Name = "Large thief", 
         Tag = "", 
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
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Stats = 
         {
            Force = 0, 
            Constitution = 10, 
            Strength = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Charisma = 10, 
            Luck = 10, 
            Intelligence = 10, 
         }, 
         AttackFlags = 
         {
            [4] = "punch", 
         }, 
         Description = "", 
         Level = 11, 
         DamRoll = 0, 
         Alignment = 0, 
         LongDescr = "A large thief walks about here.\
", 
         Sex = "undistinguished", 
         HitRoll = 0, 
         NumberOfAttacks = 0, 
         ArmorClass = 0, 
         Weight = 0, 
         Position = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         Height = 0, 
         ShortDescr = "a large thief", 
         DefaultPosition = "standing", 
         Race = "Human", 
         Flags = 
         {
            [0] = "Npc", 
            [24] = "NoAssist", 
         }, 
         Vnum = 31522, 
      }, 
      [31523] = 
      {
         Credits = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Name = "skillful thief", 
         Tag = "", 
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
         MudProgs = 
         {
            [1] = 
            {
               Code = "Steal credits $n\
", 
               Arguments = "35", 
               MudProgType = "rand_prog", 
               ScriptType = "MProg", 
            }, 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Stats = 
         {
            Force = 0, 
            Constitution = 10, 
            Strength = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Charisma = 10, 
            Luck = 10, 
            Intelligence = 10, 
         }, 
         AttackFlags = 
         {
            [4] = "punch", 
         }, 
         Description = "", 
         Level = 17, 
         DamRoll = 0, 
         Alignment = 0, 
         LongDescr = "A skillful thief walks about here.\
", 
         Sex = "undistinguished", 
         HitRoll = 0, 
         NumberOfAttacks = 0, 
         ArmorClass = 0, 
         Weight = 0, 
         Position = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         Height = 0, 
         ShortDescr = "a skillful thief", 
         DefaultPosition = "standing", 
         Race = "Human", 
         Flags = 
         {
            [0] = "Npc", 
            [24] = "NoAssist", 
         }, 
         Vnum = 31523, 
      }, 
      [31524] = 
      {
         Credits = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Name = "Smuggler", 
         Tag = "", 
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
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Stats = 
         {
            Force = 0, 
            Constitution = 10, 
            Strength = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Charisma = 10, 
            Luck = 10, 
            Intelligence = 10, 
         }, 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         Description = "", 
         Level = 18, 
         DamRoll = 0, 
         Alignment = 0, 
         LongDescr = "A smuggler sits at a table watching.\
", 
         Sex = "undistinguished", 
         HitRoll = 0, 
         NumberOfAttacks = 0, 
         ArmorClass = 0, 
         Weight = 0, 
         Position = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         Height = 0, 
         ShortDescr = "a smuggler", 
         DefaultPosition = "standing", 
         Race = "Human", 
         Flags = 
         {
            [0] = "Npc", 
            [24] = "NoAssist", 
         }, 
         Vnum = 31524, 
      }, 
      [31525] = 
      {
         Credits = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Name = "Experienced Smuggler", 
         Tag = "", 
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
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Stats = 
         {
            Force = 0, 
            Constitution = 10, 
            Strength = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Charisma = 10, 
            Luck = 10, 
            Intelligence = 10, 
         }, 
         AttackFlags = 
         {
            [5] = "kick", 
            [6] = "_06", 
            [9] = "_09", 
         }, 
         Description = "", 
         Level = 26, 
         DamRoll = 0, 
         Alignment = 0, 
         LongDescr = "An experienced smuggler waits for his contact here.\
", 
         Sex = "undistinguished", 
         HitRoll = 0, 
         NumberOfAttacks = 0, 
         ArmorClass = 0, 
         Weight = 0, 
         Position = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         Height = 0, 
         ShortDescr = "an experienced smuggler", 
         DefaultPosition = "standing", 
         Race = "Human", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Vnum = 31525, 
      }, 
      [31526] = 
      {
         Credits = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Name = "Ithorian", 
         Tag = "", 
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
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Stats = 
         {
            Force = 0, 
            Constitution = 10, 
            Strength = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Charisma = 10, 
            Luck = 10, 
            Intelligence = 10, 
         }, 
         AttackFlags = 
         {
            [6] = "_06", 
            [5] = "kick", 
         }, 
         Description = "", 
         Level = 14, 
         DamRoll = 0, 
         Alignment = 0, 
         LongDescr = "An Ithorian drinks his liquors here.\
", 
         Sex = "undistinguished", 
         HitRoll = 0, 
         NumberOfAttacks = 0, 
         ArmorClass = 0, 
         Weight = 0, 
         Position = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         Height = 0, 
         ShortDescr = "an Ithorian", 
         DefaultPosition = "standing", 
         Race = "Ithorian", 
         Flags = 
         {
            [0] = "Npc", 
            [24] = "NoAssist", 
         }, 
         Vnum = 31526, 
      }, 
      [31527] = 
      {
         Credits = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Name = "Female citizen", 
         Tag = "", 
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
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Stats = 
         {
            Force = 0, 
            Constitution = 10, 
            Strength = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Charisma = 10, 
            Luck = 10, 
            Intelligence = 10, 
         }, 
         Description = "", 
         Level = 6, 
         DamRoll = 0, 
         Alignment = 0, 
         LongDescr = "A female citizen minds her own business here.\
", 
         Sex = "undistinguished", 
         HitRoll = 0, 
         NumberOfAttacks = 0, 
         ArmorClass = 0, 
         Weight = 0, 
         Position = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         Height = 0, 
         ShortDescr = "a female citizen", 
         DefaultPosition = "standing", 
         Race = "Human", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Vnum = 31527, 
      }, 
      [31528] = 
      {
         Credits = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Name = "Male citizen", 
         Tag = "", 
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
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Stats = 
         {
            Force = 0, 
            Constitution = 10, 
            Strength = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Charisma = 10, 
            Luck = 10, 
            Intelligence = 10, 
         }, 
         Description = "", 
         Level = 13, 
         DamRoll = 0, 
         Alignment = 0, 
         LongDescr = "A male citizen walks around here.\
", 
         Sex = "undistinguished", 
         HitRoll = 0, 
         NumberOfAttacks = 0, 
         ArmorClass = 0, 
         Weight = 0, 
         Position = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         Height = 0, 
         ShortDescr = "a male citizen", 
         DefaultPosition = "standing", 
         Race = "Human", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Vnum = 31528, 
      }, 
      [31529] = 
      {
         Credits = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Name = "Rodian", 
         Tag = "", 
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
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Stats = 
         {
            Force = 0, 
            Constitution = 10, 
            Strength = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Charisma = 10, 
            Luck = 10, 
            Intelligence = 10, 
         }, 
         Description = "", 
         Level = 9, 
         DamRoll = 0, 
         Alignment = 0, 
         LongDescr = "A Rodian sits here contemplating his navel.\
", 
         Sex = "undistinguished", 
         HitRoll = 0, 
         NumberOfAttacks = 0, 
         ArmorClass = 0, 
         Weight = 0, 
         Position = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         Height = 0, 
         ShortDescr = "a Rodian", 
         DefaultPosition = "standing", 
         Race = "Rodian", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Vnum = 31529, 
      }, 
      [31530] = 
      {
         Credits = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Name = "Merth", 
         Tag = "", 
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
         MudProgs = 
         {
            [1] = 
            {
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
               MudProgType = "fight_prog", 
               ScriptType = "MProg", 
            }, 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Stats = 
         {
            Force = 0, 
            Constitution = 10, 
            Strength = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Charisma = 10, 
            Luck = 10, 
            Intelligence = 10, 
         }, 
         AttackFlags = 
         {
            [9] = "_09", 
            [5] = "kick", 
         }, 
         Description = "", 
         Level = 103, 
         DamRoll = 0, 
         Alignment = 0, 
         LongDescr = "Merth walks around here.\
", 
         Sex = "undistinguished", 
         HitRoll = 0, 
         NumberOfAttacks = 0, 
         ArmorClass = 0, 
         Weight = 0, 
         Position = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         Height = 0, 
         ShortDescr = "Merth", 
         DefaultPosition = "standing", 
         Race = "Human", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Vnum = 31530, 
      }, 
      [31531] = 
      {
         Credits = 0, 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 3, 
         }, 
         Name = "Wioslea", 
         Tag = "", 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
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
         MudProgs = 
         {
            [1] = 
            {
               Code = "say Business is bad, get outta here!\
grin\
", 
               Arguments = "100", 
               MudProgType = "all_greet_prog", 
               ScriptType = "MProg", 
            }, 
         }, 
         Shop = 
         {
            BusinessHours = 
            {
               Open = 1, 
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
            ProfitSell = 0, 
            KeeperShortDescr = "Wioslea", 
            ProfitBuy = 120, 
         }, 
         Stats = 
         {
            Force = 0, 
            Constitution = 10, 
            Strength = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Charisma = 10, 
            Luck = 10, 
            Intelligence = 10, 
         }, 
         VipFlags = 
         {
            [8] = "Tatooine", 
         }, 
         Description = "", 
         Level = 32, 
         DamRoll = 6, 
         Alignment = 0, 
         LongDescr = "Wioslea tends to her customers need.\
", 
         Sex = "undistinguished", 
         HitRoll = 6, 
         NumberOfAttacks = 0, 
         ArmorClass = 20, 
         Weight = 0, 
         Position = "standing", 
         HitChance = 
         {
            HitNoDice = 6, 
            HitPlus = 320, 
            HitSizeDice = 10, 
         }, 
         Height = 0, 
         ShortDescr = "Wioslea", 
         DefaultPosition = "standing", 
         Race = "Human", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         Vnum = 31531, 
      }, 
      [31532] = 
      {
         Credits = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Name = "Gep", 
         Tag = "", 
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
         MudProgs = 
         {
            [1] = 
            {
               Code = "if ispc($n)\
    say Hello customer.\
    say I have everything you need just type \"list\".\
endif\
", 
               Arguments = "100", 
               MudProgType = "all_greet_prog", 
               ScriptType = "MProg", 
            }, 
         }, 
         Shop = 
         {
            BusinessHours = 
            {
               Open = 1, 
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
            ProfitSell = 100, 
            KeeperShortDescr = "Gep", 
            ProfitBuy = 110, 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Stats = 
         {
            Force = 0, 
            Constitution = 10, 
            Strength = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Charisma = 10, 
            Luck = 10, 
            Intelligence = 10, 
         }, 
         Description = "", 
         Level = 1, 
         DamRoll = 0, 
         Alignment = 0, 
         LongDescr = "Gep Stands here selling you food for your travels.\
", 
         Sex = "undistinguished", 
         HitRoll = 0, 
         NumberOfAttacks = 0, 
         ArmorClass = 0, 
         Weight = 0, 
         Position = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         Height = 0, 
         ShortDescr = "Gep", 
         DefaultPosition = "standing", 
         Race = "Human", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         Vnum = 31532, 
      }, 
      [31533] = 
      {
         Credits = 200, 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 2, 
         }, 
         Name = "Sullustan pump mechanic", 
         Tag = "", 
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
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Stats = 
         {
            Force = 0, 
            Constitution = 10, 
            Strength = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Charisma = 10, 
            Luck = 10, 
            Intelligence = 10, 
         }, 
         Description = "Taller than most Sullustans, the pump maintenance mechanic appears to be\
in decent shape. His ears is also larger than usual, and his eyes are dark\
and gleaming.\
", 
         Level = 20, 
         DamRoll = 4, 
         Alignment = 0, 
         LongDescr = "A Sullustan pump maintenance mechanic seems to be goofing off here.\
", 
         Sex = "male", 
         HitRoll = 4, 
         NumberOfAttacks = 0, 
         ArmorClass = 50, 
         Weight = 0, 
         Position = "standing", 
         HitChance = 
         {
            HitNoDice = 4, 
            HitPlus = 200, 
            HitSizeDice = 10, 
         }, 
         Height = 0, 
         ShortDescr = "a pump mechanic", 
         DefaultPosition = "standing", 
         Race = "Sullustan", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Vnum = 31533, 
      }, 
      [31534] = 
      {
         Credits = 0, 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 2, 
         }, 
         Name = "tatoo-rat", 
         Tag = "", 
         MudProgs = 
         {
            [1] = 
            {
               Code = "from quest.zim import *\
def on_death(rat, killer):\
    zim_kill_vermin_on_death(killer)\
", 
               Arguments = "100", 
               MudProgType = "death_prog", 
               ScriptType = "Imp", 
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
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Stats = 
         {
            Force = 0, 
            Constitution = 10, 
            Strength = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Charisma = 10, 
            Luck = 10, 
            Intelligence = 10, 
         }, 
         Description = "A tatoo-rat is a small rodent with brown fur and a long tail.\
", 
         Level = 20, 
         DamRoll = 4, 
         Alignment = 0, 
         LongDescr = "A tatoo-rat seems to be searching for food.\
", 
         Sex = "undistinguished", 
         HitRoll = 4, 
         NumberOfAttacks = 0, 
         ArmorClass = 50, 
         Weight = 0, 
         Position = "standing", 
         HitChance = 
         {
            HitNoDice = 4, 
            HitPlus = 200, 
            HitSizeDice = 10, 
         }, 
         Height = 0, 
         ShortDescr = "a tatoo-rat", 
         DefaultPosition = "standing", 
         Race = "Rodent", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Vnum = 31534, 
      }, 
      [31535] = 
      {
         Credits = 0, 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 10, 
         }, 
         Name = "retired merc", 
         Tag = "", 
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
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Stats = 
         {
            Force = 0, 
            Constitution = 25, 
            Strength = 25, 
            Dexterity = 25, 
            Wisdom = 10, 
            Charisma = 10, 
            Luck = 10, 
            Intelligence = 10, 
         }, 
         Description = "", 
         Level = 100, 
         DamRoll = 20, 
         Alignment = 0, 
         LongDescr = "A retired merc is here, eager to teach the next generation.\
", 
         Sex = "male", 
         HitRoll = 20, 
         NumberOfAttacks = 0, 
         ArmorClass = -150, 
         Weight = 0, 
         Position = "standing", 
         HitChance = 
         {
            HitNoDice = 20, 
            HitPlus = 20000, 
            HitSizeDice = 10, 
         }, 
         Height = 0, 
         ShortDescr = "a retired merc", 
         DefaultPosition = "standing", 
         Race = "Human", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [10] = "Practice", 
            [30] = "Prototype", 
            [9] = "Train", 
         }, 
         Vnum = 31535, 
      }, 
      [31536] = 
      {
         Credits = 0, 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 10, 
         }, 
         Name = "experienced zabrak engineer", 
         Tag = "", 
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
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Stats = 
         {
            Force = 0, 
            Constitution = 10, 
            Strength = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Charisma = 10, 
            Luck = 10, 
            Intelligence = 25, 
         }, 
         Description = "", 
         Level = 100, 
         DamRoll = 20, 
         Alignment = 0, 
         LongDescr = "An experienced zabrak engineer teaches basic engineering skills.\
", 
         Sex = "male", 
         HitRoll = 20, 
         NumberOfAttacks = 0, 
         ArmorClass = -150, 
         Weight = 0, 
         Position = "standing", 
         HitChance = 
         {
            HitNoDice = 20, 
            HitPlus = 20000, 
            HitSizeDice = 10, 
         }, 
         Height = 0, 
         ShortDescr = "an experienced zabrak engineer", 
         DefaultPosition = "standing", 
         Race = "Zabrak", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [10] = "Practice", 
            [30] = "Prototype", 
            [9] = "Train", 
         }, 
         Vnum = 31536, 
      }, 
      [31537] = 
      {
         Credits = 0, 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 10, 
         }, 
         Name = "Mayor Mikdanyell Guh'rantt", 
         Tag = "", 
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
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Stats = 
         {
            Force = 0, 
            Constitution = 10, 
            Strength = 10, 
            Dexterity = 10, 
            Wisdom = 25, 
            Charisma = 25, 
            Luck = 10, 
            Intelligence = 25, 
         }, 
         Description = "", 
         Level = 100, 
         DamRoll = 20, 
         Alignment = 0, 
         LongDescr = "Mayor Mikdanyell Guh'rantt is here.\
", 
         Sex = "male", 
         HitRoll = 20, 
         NumberOfAttacks = 0, 
         ArmorClass = -150, 
         Weight = 0, 
         Position = "standing", 
         HitChance = 
         {
            HitNoDice = 20, 
            HitPlus = 20000, 
            HitSizeDice = 10, 
         }, 
         Height = 0, 
         ShortDescr = "Mayor Mikdanyell Guh'rantt", 
         DefaultPosition = "standing", 
         Race = "Rodian", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [9] = "Train", 
            [10] = "Practice", 
            [20] = "Scholar", 
            [30] = "Prototype", 
            [25] = "NoKill", 
         }, 
         Vnum = 31537, 
      }, 
      [31538] = 
      {
         Credits = 0, 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 10, 
         }, 
         Name = "Bothan smuggler", 
         Tag = "", 
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
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Stats = 
         {
            Force = 0, 
            Constitution = 10, 
            Strength = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Charisma = 10, 
            Luck = 20, 
            Intelligence = 10, 
         }, 
         Description = "", 
         Level = 100, 
         DamRoll = 20, 
         Alignment = 0, 
         LongDescr = "A Bothan smuggler is enjoying some downtime.\
", 
         Sex = "male", 
         HitRoll = 20, 
         NumberOfAttacks = 0, 
         ArmorClass = -150, 
         Weight = 0, 
         Position = "standing", 
         HitChance = 
         {
            HitNoDice = 20, 
            HitPlus = 20000, 
            HitSizeDice = 10, 
         }, 
         Height = 0, 
         ShortDescr = "a Bothan smuggler", 
         DefaultPosition = "standing", 
         Race = "Bothan", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [10] = "Practice", 
            [30] = "Prototype", 
            [9] = "Train", 
         }, 
         Vnum = 31538, 
      }, 
      [31539] = 
      {
         Credits = 0, 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 10, 
         }, 
         Name = "facility manager", 
         Tag = "", 
         MudProgs = 
         {
            [1] = 
            {
               Code = "if ispc($n)\
    if level($n) <= 25\
        say Welcome. I can give you some basic flight lessons if you want.\
    endif\
endif\
", 
               Arguments = "100", 
               MudProgType = "all_greet_prog", 
               ScriptType = "MProg", 
            }, 
            [2] = 
            {
               Code = "if ispc($n)\
    say Great. Just type PRACTICE and we can get down to business.\
endif\
", 
               Arguments = "p yes", 
               MudProgType = "speech_prog", 
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
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Stats = 
         {
            Force = 0, 
            Constitution = 10, 
            Strength = 10, 
            Dexterity = 25, 
            Wisdom = 10, 
            Charisma = 10, 
            Luck = 10, 
            Intelligence = 10, 
         }, 
         Description = "", 
         Level = 100, 
         DamRoll = 20, 
         Alignment = 0, 
         LongDescr = "The facility manager is doing some paperwork.\
", 
         Sex = "male", 
         HitRoll = 20, 
         NumberOfAttacks = 0, 
         ArmorClass = -150, 
         Weight = 0, 
         Position = "standing", 
         HitChance = 
         {
            HitNoDice = 20, 
            HitPlus = 20000, 
            HitSizeDice = 10, 
         }, 
         Height = 0, 
         ShortDescr = "the facility manager", 
         DefaultPosition = "standing", 
         Race = "Duros", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [9] = "Train", 
            [10] = "Practice", 
            [25] = "NoKill", 
         }, 
         Vnum = 31539, 
      }, 
      [31540] = 
      {
         Credits = 0, 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 8, 
            DamNoDice = 4, 
         }, 
         Name = "rill", 
         Tag = "", 
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
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Stats = 
         {
            Force = 0, 
            Constitution = 10, 
            Strength = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Charisma = 10, 
            Luck = 10, 
            Intelligence = 10, 
         }, 
         Description = "The rill is a lizard native to Tatooine. It looks much like a scyk, with\
spines along its back and very sharp teeth. But it's not aggressive\
unless attacked.\
", 
         Level = 20, 
         DamRoll = 4, 
         Alignment = 0, 
         LongDescr = "A docile rill is wandering the dunes.\
", 
         Sex = "male", 
         HitRoll = 4, 
         NumberOfAttacks = 0, 
         ArmorClass = 50, 
         Weight = 0, 
         Position = "standing", 
         HitChance = 
         {
            HitNoDice = 4, 
            HitPlus = 400, 
            HitSizeDice = 10, 
         }, 
         Height = 0, 
         ShortDescr = "a rill", 
         DefaultPosition = "standing", 
         Race = "Reptile", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Vnum = 31540, 
      }, 
      [31541] = 
      {
         Credits = 0, 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 2, 
         }, 
         Name = "Dewback", 
         Tag = "", 
         MudProgs = 
         {
            [1] = 
            {
               Code = "if rand(50)\
    emote makes a strange, lowing noise.\
else\
    emote licks $s back with $s flicking tongue.\
endif\
", 
               Arguments = "3", 
               MudProgType = "rand_prog", 
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
         SaveVs = 
         {
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Stats = 
         {
            Force = 0, 
            Constitution = 10, 
            Strength = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Charisma = 10, 
            Luck = 10, 
            Intelligence = 10, 
         }, 
         Description = "The dewback is a large reptile native to Tatooine, frequently used as a\
beast of burden. It has thick, scaly, green skin and four clawed feet.\
", 
         Level = 25, 
         DamRoll = 5, 
         Alignment = 0, 
         LongDescr = "A large, green-skinned dewback roams the sands. \
", 
         Sex = "undistinguished", 
         HitRoll = 5, 
         NumberOfAttacks = 0, 
         ArmorClass = 37, 
         Weight = 0, 
         Position = "standing", 
         HitChance = 
         {
            HitNoDice = 5, 
            HitPlus = 500, 
            HitSizeDice = 10, 
         }, 
         Height = 0, 
         ShortDescr = "a dewback", 
         DefaultPosition = "standing", 
         Race = "Dewback", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Vnum = 31541, 
      }, 
      [31542] = 
      {
         Credits = 0, 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 2, 
         }, 
         Name = "Worrt", 
         Tag = "", 
         Weight = 0, 
         MudProgs = 
         {
            [1] = 
            {
               Code = "emote catches an insect with $s long tongue, then swallows it followed by a loud belch.\
", 
               Arguments = "3", 
               MudProgType = "rand_prog", 
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
         SaveVs = 
         {
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Stats = 
         {
            Force = 0, 
            Constitution = 10, 
            Strength = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Charisma = 10, 
            Luck = 10, 
            Intelligence = 10, 
         }, 
         Description = "", 
         Level = 20, 
         DamRoll = 4, 
         Alignment = 0, 
         LongDescr = "A worrt is sitting here perfectly still.\
", 
         Sex = "undistinguished", 
         HitRoll = 4, 
         NumberOfAttacks = 0, 
         ArmorClass = 50, 
         SpecFuns = 
         {
            [0] = "spec_poison", 
         }, 
         Position = "standing", 
         HitChance = 
         {
            HitNoDice = 4, 
            HitPlus = 200, 
            HitSizeDice = 10, 
         }, 
         Height = 0, 
         ShortDescr = "a worrt", 
         DefaultPosition = "standing", 
         Race = "Creature", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
         }, 
         Vnum = 31542, 
      }, 
      [31900] = 
      {
         Credits = 0, 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 10, 
         }, 
         Name = "zim failed jedi", 
         Tag = "", 
         Stats = 
         {
            Force = 20, 
            Constitution = 10, 
            Strength = 10, 
            Dexterity = 10, 
            Wisdom = 25, 
            Charisma = 10, 
            Luck = 10, 
            Intelligence = 10, 
         }, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
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
         MudProgs = 
         {
            [1] = 
            {
               Code = "from mobs.zim import *\
", 
               Arguments = "100", 
               MudProgType = "all_greet_prog", 
               ScriptType = "Imp", 
            }, 
            [2] = 
            {
               Code = "from mobs.zim import *\
", 
               Arguments = "3", 
               MudProgType = "rand_prog", 
               ScriptType = "Imp", 
            }, 
            [3] = 
            {
               Code = "from mobs.zim import *\
", 
               Arguments = "yes", 
               MudProgType = "speech_prog", 
               ScriptType = "Imp", 
            }, 
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
            ProfitSell = 90, 
            KeeperShortDescr = "Zim the Failed Jedi", 
            ProfitBuy = 120, 
         }, 
         DefenseFlags = 
         {
            [1] = "dodge", 
            [0] = "parry", 
         }, 
         AttackFlags = 
         {
            [4] = "punch", 
            [5] = "kick", 
         }, 
         Description = "Zim is a middle-aged male human with silvery stripes in his dark brown hair.\
His stomach is bulging over a leather belt that has a lightsaber hanging from\
it. \
\
In his younger days, during the Clone Wars, he was an apprentice to a minor\
Jedi Master. Unfortunately Zim never quite had the talent to pass the Jedi\
trials, and when Order 66 was issued, he was somehow overlooked. Since then\
he's been in hiding, seeking to pass on what little he learned. \
", 
         Level = 100, 
         DamRoll = 20, 
         Alignment = 0, 
         LongDescr = "Zim the Failed Jedi stands here before you.\
", 
         Sex = "male", 
         HitRoll = 20, 
         NumberOfAttacks = 0, 
         ArmorClass = -150, 
         Weight = 0, 
         Position = "standing", 
         HitChance = 
         {
            HitNoDice = 20, 
            HitPlus = 15000, 
            HitSizeDice = 10, 
         }, 
         Height = 0, 
         ShortDescr = "Zim the Failed Jedi", 
         DefaultPosition = "standing", 
         Race = "Human", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [10] = "Practice", 
            [30] = "Prototype", 
            [9] = "Train", 
         }, 
         Vnum = 31900, 
      }, 
      [31902] = 
      {
         Credits = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Name = "disillusioned student", 
         Tag = "", 
         MudProgs = 
         {
            [1] = 
            {
               Code = "def on_greet(mob, actor):\
    locs = {\"kitchen\": 31901, \"commonroom\": 31900, \"workshop\": 31906, \"sleepingquarters\": 31903}\
    location = inroom(mob)\
    wait(1.0)\
\
    if vnum(location) == locs[\"kitchen\"]:\
        echo(actor, str(mob) + \" looks at you with weary eyes.\")\
        echoaround(actor, str(mob) + \" looks at \" + str(actor) + \" with weary eyes.\")\
        say(mob, \"I really hate kitchen duty.\")\
        interpret(mob, \"sigh\")\
    elif vnum(location) == locs[\"commonroom\"]:\
        echo(actor, \"Upon seeing you, \" + str(mob) + \" grabs a broom and pretends he was doing his chores.\")\
    elif vnum(location) == locs[\"workshop\"]:\
        echo(location, str(mob) + \" seems to be on the verge of crying as he fails assembling a lightsaber.\")\
    elif vnum(location) == locs[\"sleepingquarters\"]:\
        interpret(mob, \"yawn\")\
", 
               Arguments = "100", 
               MudProgType = "greet_prog", 
               ScriptType = "Imp", 
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
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Stats = 
         {
            Force = 0, 
            Constitution = 10, 
            Strength = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Charisma = 10, 
            Luck = 10, 
            Intelligence = 10, 
         }, 
         Description = "", 
         Level = 1, 
         DamRoll = 0, 
         Alignment = 0, 
         LongDescr = "A disillusioned student is doing chores.\
", 
         Sex = "male", 
         HitRoll = 0, 
         NumberOfAttacks = 0, 
         ArmorClass = 0, 
         Weight = 0, 
         Position = "standing", 
         HitChance = 
         {
            HitNoDice = 10, 
            HitPlus = 0, 
            HitSizeDice = 100, 
         }, 
         Height = 0, 
         ShortDescr = "a disillusioned student", 
         DefaultPosition = "standing", 
         Race = "Human", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Vnum = 31902, 
      }, 
      [31901] = 
      {
         Credits = 0, 
         Damage = 
         {
            DamPlus = 2, 
            DamSizeDice = 4, 
            DamNoDice = 2, 
         }, 
         Name = "jedi sparring partner", 
         Tag = "", 
         MudProgs = 
         {
            [1] = 
            {
               Code = "from mobs.jedisparringpartner import *\
", 
               Arguments = "10", 
               MudProgType = "rand_prog", 
               ScriptType = "Imp", 
            }, 
            [2] = 
            {
               Code = "from mobs.jedisparringpartner import *\
", 
               Arguments = "p disarm me", 
               MudProgType = "speech_prog", 
               ScriptType = "Imp", 
            }, 
            [3] = 
            {
               Code = "from mobs.jedisparringpartner import *\
", 
               Arguments = "100", 
               MudProgType = "all_greet_prog", 
               ScriptType = "Imp", 
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
            PoisonDeath = 0, 
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Stats = 
         {
            Force = 0, 
            Constitution = 10, 
            Strength = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Charisma = 10, 
            Luck = 10, 
            Intelligence = 10, 
         }, 
         Description = "This young Jedi apprentice has long, brown hair in a low ponytail. His bland\
facial features are covered by a cropped beard. He's wearing plain clothes to\
blend in with the Mos Eisley population. Wearing Jedi robes would be very\
risky these days.\
", 
         Level = 20, 
         DamRoll = 4, 
         Alignment = 0, 
         LongDescr = "A Jedi sparring partner looks eager for action.\
", 
         Sex = "male", 
         HitRoll = 4, 
         NumberOfAttacks = 0, 
         ArmorClass = 50, 
         Weight = 0, 
         Position = "standing", 
         HitChance = 
         {
            HitNoDice = 4, 
            HitPlus = 10000, 
            HitSizeDice = 10, 
         }, 
         Height = 0, 
         ShortDescr = "a Jedi sparring partner", 
         DefaultPosition = "standing", 
         Race = "Human", 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
         }, 
         Vnum = 31901, 
      }, 
      [31999] = 
      {
         Credits = 0, 
         Damage = 
         {
            DamPlus = 0, 
            DamSizeDice = 0, 
            DamNoDice = 0, 
         }, 
         Name = "lastmob", 
         Tag = "", 
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
            Breath = 0, 
            ParaPetri = 0, 
            Wand = 0, 
            SpellStaff = 0, 
         }, 
         Stats = 
         {
            Force = 0, 
            Constitution = 10, 
            Strength = 10, 
            Dexterity = 10, 
            Wisdom = 10, 
            Charisma = 10, 
            Luck = 10, 
            Intelligence = 10, 
         }, 
         Description = "", 
         Level = 1, 
         DamRoll = 0, 
         Alignment = 0, 
         LongDescr = "Some god abandoned a newly created lastmob here.\
", 
         Sex = "undistinguished", 
         HitRoll = 0, 
         NumberOfAttacks = 0, 
         ArmorClass = 0, 
         Weight = 0, 
         Position = "standing", 
         HitChance = 
         {
            HitNoDice = 0, 
            HitPlus = 0, 
            HitSizeDice = 0, 
         }, 
         Height = 0, 
         ShortDescr = "a newly created lastmob", 
         DefaultPosition = "standing", 
         Race = "Human", 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Vnum = 31999, 
      }, 
   }, 
   LowEconomy = 27489139, 
   VnumRanges = 
   {
      Room = 
      {
         First = 31500, 
         Last = 31999, 
      }, 
      Object = 
      {
         First = 31500, 
         Last = 31999, 
      }, 
      Mob = 
      {
         First = 31500, 
         Last = 31999, 
      }, 
   }, 
   LevelRanges = 
   {
      Hard = 
      {
         High = 105, 
         Low = 0, 
      }, 
      Soft = 
      {
         High = 105, 
         Low = 0, 
      }, 
   }, 
}
