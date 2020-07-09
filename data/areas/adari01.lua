-- Adari - Baituh City
-- Last saved Thursday 09-Jul-2020 23:19:12

AreaEntry
{
   ResetMessage = "", 
   Objects = 
   {
      [29060] = 
      {
         Description = "A Large sign has been posted here.", 
         Weight = 5000, 
         Cost = 1, 
         ActionDescription = "", 
         Layers = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "sign welcome", 
               Description = "-  Welcome to Baituh City  -\
\13Please follow our laws:\
\0131. No Weapons Permitted\
\0132. No Drugs Permitted\
\0133. No \"Adult Entertainment\"\
\13", 
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
         Vnum = 29060, 
         ShortDescr = "a sign", 
         ItemType = "trash", 
         Name = "sign welcome", 
      }, 
      [29061] = 
      {
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "speech_prog", 
               Code = "mpgoto 29103\
mptransfer $n\
mpechoat $n The doors opens and you are released.\
mpecho $n exits the jail.\
mpgoto 29108\
", 
               Arguments = "sorry", 
            }, 
            [2] = 
            {
               MudProgType = "bribe_prog", 
               Code = "mpgoto 29103\
mptransfer $n\
mpechoat $n The doors opens and you are released.\
mpecho $n exits the jail.\
mpgoto 29108\
", 
               Arguments = "30", 
            }, 
         }, 
         Description = "A Bail Box has been built into the wall.", 
         Weight = 5000, 
         Cost = 0, 
         ActionDescription = "", 
         Layers = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "bail box", 
               Description = "To be released from jail you must apologize for your crimes.  Hint,\
\13say 'sorry' to be released. \
\13", 
            }, 
            [2] = 
            {
               Keyword = "bail box", 
               Description = "", 
            }, 
         }, 
         ObjectValues = 
         {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [0] = 500, 
         }, 
         Flags = 
         {
            [0] = "Glow", 
         }, 
         Vnum = 29061, 
         ShortDescr = "a Bail Box", 
         ItemType = "container", 
         Name = "bail box", 
      }, 
      [29065] = 
      {
         Description = "A copy of PlayHutt magazine has been left here.", 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "playhutt trashy magazine", 
               Description = "Be careful! You might go blind looking at such filth!\
\13", 
            }, 
         }, 
         Weight = 2, 
         Cost = 50, 
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
         ShortDescr = "a copy of PlayHutt magazine", 
         Flags = 
         {
            [4] = "Contraband", 
         }, 
         Vnum = 29065, 
         WearFlags = 
         {
            [0] = "Take", 
            [14] = "Hold", 
         }, 
         ItemType = "smut", 
         Name = "playhutt trashy magazine", 
      }, 
   }, 
   ResetFrequency = 0, 
   Author = "Merth", 
   Resets = 
   {
      [1] = 
      {
         Arg2 = 1, 
         Arg1 = 29061, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 29068, 
      }, 
      [2] = 
      {
         Arg1 = 29002, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [3] = 
      {
         Arg1 = 10313, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [4] = 
      {
         Arg1 = 10314, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [5] = 
      {
         Arg1 = 10317, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [6] = 
      {
         Arg2 = 1, 
         Arg1 = 29062, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 29083, 
      }, 
      [7] = 
      {
         Arg2 = 1, 
         Arg1 = 29063, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 29084, 
      }, 
      [8] = 
      {
         Arg2 = 3, 
         Arg1 = 29084, 
         Command = "D", 
         MiscData = 0, 
         Arg3 = 2, 
      }, 
      [9] = 
      {
         Arg2 = 1, 
         Arg1 = 29065, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 29081, 
      }, 
      [10] = 
      {
         Arg2 = 2, 
         Arg1 = 29081, 
         Command = "D", 
         MiscData = 0, 
         Arg3 = 2, 
      }, 
      [11] = 
      {
         Arg2 = 1, 
         Arg1 = 29066, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 29108, 
      }, 
      [12] = 
      {
         Arg2 = 3, 
         Arg1 = 29108, 
         Command = "D", 
         MiscData = 0, 
         Arg3 = 2, 
      }, 
      [13] = 
      {
         Arg2 = 1, 
         Arg1 = 38, 
         Command = "O", 
         MiscData = 1, 
         Arg3 = 29096, 
      }, 
      [14] = 
      {
         Arg2 = 1, 
         Arg1 = 29067, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 29066, 
      }, 
      [15] = 
      {
         Arg2 = 1, 
         Arg1 = 29009, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 16, 
      }, 
      [16] = 
      {
         Arg2 = 1, 
         Arg1 = 29006, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 5, 
      }, 
      [17] = 
      {
         Arg2 = 1, 
         Arg1 = 29007, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 7, 
      }, 
      [18] = 
      {
         Arg2 = 1, 
         Arg1 = 29008, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 8, 
      }, 
      [19] = 
      {
         Arg2 = 1, 
         Arg1 = 29068, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 29069, 
      }, 
      [20] = 
      {
         Arg2 = 1, 
         Arg1 = 29006, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 5, 
      }, 
      [21] = 
      {
         Arg2 = 1, 
         Arg1 = 29007, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 7, 
      }, 
      [22] = 
      {
         Arg2 = 1, 
         Arg1 = 29008, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 8, 
      }, 
      [23] = 
      {
         Arg2 = 1, 
         Arg1 = 29009, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 16, 
      }, 
      [24] = 
      {
         Arg2 = 2, 
         Arg1 = 29068, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 29078, 
      }, 
      [25] = 
      {
         Arg2 = 1, 
         Arg1 = 29007, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 7, 
      }, 
      [26] = 
      {
         Arg2 = 1, 
         Arg1 = 29008, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 8, 
      }, 
      [27] = 
      {
         Arg2 = 1, 
         Arg1 = 29006, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 5, 
      }, 
      [28] = 
      {
         Arg2 = 1, 
         Arg1 = 29009, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 16, 
      }, 
      [29] = 
      {
         Arg2 = 3, 
         Arg1 = 29068, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 29090, 
      }, 
      [30] = 
      {
         Arg2 = 1, 
         Arg1 = 29006, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 5, 
      }, 
      [31] = 
      {
         Arg2 = 1, 
         Arg1 = 29007, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 7, 
      }, 
      [32] = 
      {
         Arg2 = 1, 
         Arg1 = 29008, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 8, 
      }, 
      [33] = 
      {
         Arg2 = 1, 
         Arg1 = 29009, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 16, 
      }, 
      [34] = 
      {
         Arg2 = 4, 
         Arg1 = 29068, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 29100, 
      }, 
      [35] = 
      {
         Arg2 = 1, 
         Arg1 = 29006, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 5, 
      }, 
      [36] = 
      {
         Arg2 = 1, 
         Arg1 = 29007, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 7, 
      }, 
      [37] = 
      {
         Arg2 = 1, 
         Arg1 = 29008, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 8, 
      }, 
      [38] = 
      {
         Arg2 = 1, 
         Arg1 = 29009, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 16, 
      }, 
      [39] = 
      {
         Arg2 = 5, 
         Arg1 = 29068, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 29106, 
      }, 
      [40] = 
      {
         Arg2 = 1, 
         Arg1 = 29006, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 5, 
      }, 
      [41] = 
      {
         Arg2 = 1, 
         Arg1 = 29007, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 7, 
      }, 
      [42] = 
      {
         Arg2 = 1, 
         Arg1 = 29008, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 8, 
      }, 
      [43] = 
      {
         Arg2 = 1, 
         Arg1 = 29009, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 16, 
      }, 
      [44] = 
      {
         Arg2 = 6, 
         Arg1 = 29068, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 29107, 
      }, 
      [45] = 
      {
         Arg2 = 1, 
         Arg1 = 29006, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 5, 
      }, 
      [46] = 
      {
         Arg2 = 1, 
         Arg1 = 29007, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 7, 
      }, 
      [47] = 
      {
         Arg2 = 1, 
         Arg1 = 29008, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 8, 
      }, 
      [48] = 
      {
         Arg2 = 1, 
         Arg1 = 29009, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 16, 
      }, 
      [49] = 
      {
         Arg2 = 1, 
         Arg1 = 29060, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 29065, 
      }, 
      [50] = 
      {
         Arg2 = 1, 
         Arg1 = 29008, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 8, 
      }, 
      [51] = 
      {
         Arg2 = 1, 
         Arg1 = 29007, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 7, 
      }, 
      [52] = 
      {
         Arg2 = 1, 
         Arg1 = 29009, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 16, 
      }, 
      [53] = 
      {
         Arg2 = 1, 
         Arg1 = 29006, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 5, 
      }, 
      [54] = 
      {
         Arg2 = 1, 
         Arg1 = 29060, 
         Command = "O", 
         MiscData = 1, 
         Arg3 = 29065, 
      }, 
      [55] = 
      {
         Arg2 = 1, 
         Arg1 = 29069, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 29062, 
      }, 
      [56] = 
      {
         Arg2 = 1, 
         Arg1 = 29004, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 12, 
      }, 
      [57] = 
      {
         Arg2 = 2, 
         Arg1 = 29069, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 29071, 
      }, 
      [58] = 
      {
         Arg2 = 1, 
         Arg1 = 29004, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 12, 
      }, 
      [59] = 
      {
         Arg2 = 3, 
         Arg1 = 29069, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 29080, 
      }, 
      [60] = 
      {
         Arg2 = 1, 
         Arg1 = 29004, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 12, 
      }, 
      [61] = 
      {
         Arg2 = 4, 
         Arg1 = 29069, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 29073, 
      }, 
      [62] = 
      {
         Arg2 = 1, 
         Arg1 = 29004, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 12, 
      }, 
      [63] = 
      {
         Arg2 = 5, 
         Arg1 = 29069, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 29092, 
      }, 
      [64] = 
      {
         Arg2 = 1, 
         Arg1 = 29004, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 12, 
      }, 
      [65] = 
      {
         Arg2 = 6, 
         Arg1 = 29069, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 29104, 
      }, 
      [66] = 
      {
         Arg2 = 1, 
         Arg1 = 29004, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 12, 
      }, 
      [67] = 
      {
         Arg2 = 1, 
         Arg1 = 29070, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 29127, 
      }, 
      [68] = 
      {
         Arg2 = 2, 
         Arg1 = 29070, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 29129, 
      }, 
      [69] = 
      {
         Arg2 = 3, 
         Arg1 = 29070, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 29131, 
      }, 
      [70] = 
      {
         Arg2 = 4, 
         Arg1 = 29070, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 29133, 
      }, 
      [71] = 
      {
         Arg2 = 5, 
         Arg1 = 29070, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 29135, 
      }, 
      [72] = 
      {
         Arg2 = 6, 
         Arg1 = 29070, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 29137, 
      }, 
      [73] = 
      {
         Arg2 = 7, 
         Arg1 = 29070, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 29139, 
      }, 
      [74] = 
      {
         Arg2 = 8, 
         Arg1 = 29070, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 29141, 
      }, 
      [75] = 
      {
         Arg2 = 9, 
         Arg1 = 29070, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 29143, 
      }, 
      [76] = 
      {
         Arg2 = 10, 
         Arg1 = 29070, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 29145, 
      }, 
      [77] = 
      {
         Arg2 = 11, 
         Arg1 = 29070, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 29147, 
      }, 
      [78] = 
      {
         Arg2 = 12, 
         Arg1 = 29070, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 29149, 
      }, 
      [79] = 
      {
         Arg2 = 13, 
         Arg1 = 29070, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 29151, 
      }, 
      [80] = 
      {
         Arg2 = 14, 
         Arg1 = 29070, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 29153, 
      }, 
      [81] = 
      {
         Arg2 = 15, 
         Arg1 = 29070, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 29155, 
      }, 
      [82] = 
      {
         Arg2 = 16, 
         Arg1 = 29070, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 29157, 
      }, 
      [83] = 
      {
         Arg2 = 17, 
         Arg1 = 29070, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 29115, 
      }, 
      [84] = 
      {
         Arg2 = 18, 
         Arg1 = 29070, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 29119, 
      }, 
      [85] = 
      {
         Arg2 = 3, 
         Arg1 = 29027, 
         Command = "D", 
         MiscData = 0, 
         Arg3 = 2, 
      }, 
      [86] = 
      {
         Arg2 = 7, 
         Arg1 = 29068, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 29027, 
      }, 
      [87] = 
      {
         Arg2 = 1, 
         Arg1 = 29008, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 8, 
      }, 
      [88] = 
      {
         Arg2 = 1, 
         Arg1 = 29007, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 7, 
      }, 
      [89] = 
      {
         Arg2 = 1, 
         Arg1 = 29006, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 5, 
      }, 
      [90] = 
      {
         Arg2 = 1, 
         Arg1 = 29009, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 16, 
      }, 
      [91] = 
      {
         Arg2 = 3, 
         Arg1 = 29027, 
         Command = "D", 
         MiscData = 0, 
         Arg3 = 2, 
      }, 
      [92] = 
      {
         Arg2 = 8, 
         Arg1 = 29068, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 29015, 
      }, 
      [93] = 
      {
         Arg2 = 1, 
         Arg1 = 29008, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 8, 
      }, 
      [94] = 
      {
         Arg2 = 1, 
         Arg1 = 29007, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 7, 
      }, 
      [95] = 
      {
         Arg2 = 1, 
         Arg1 = 29006, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 5, 
      }, 
      [96] = 
      {
         Arg2 = 1, 
         Arg1 = 29009, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 16, 
      }, 
      [97] = 
      {
         Arg2 = 7, 
         Arg1 = 29069, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 29015, 
      }, 
      [98] = 
      {
         Arg2 = 1, 
         Arg1 = 29004, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 12, 
      }, 
      [99] = 
      {
         Arg2 = 9, 
         Arg1 = 29007, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 29021, 
      }, 
      [100] = 
      {
         Arg2 = 8, 
         Arg1 = 29069, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 29021, 
      }, 
      [101] = 
      {
         Arg2 = 1, 
         Arg1 = 29004, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 12, 
      }, 
      [102] = 
      {
         Arg2 = 9, 
         Arg1 = 29069, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 29033, 
      }, 
      [103] = 
      {
         Arg2 = 1, 
         Arg1 = 29004, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 12, 
      }, 
      [104] = 
      {
         Arg2 = 10, 
         Arg1 = 29069, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 29037, 
      }, 
      [105] = 
      {
         Arg2 = 1, 
         Arg1 = 29004, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 12, 
      }, 
      [106] = 
      {
         Arg2 = 11, 
         Arg1 = 29069, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 29042, 
      }, 
      [107] = 
      {
         Arg2 = 1, 
         Arg1 = 29004, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 12, 
      }, 
      [108] = 
      {
         Arg2 = 12, 
         Arg1 = 29069, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 29041, 
      }, 
      [109] = 
      {
         Arg2 = 1, 
         Arg1 = 29004, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 12, 
      }, 
      [110] = 
      {
         Arg2 = 13, 
         Arg1 = 29069, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 29050, 
      }, 
      [111] = 
      {
         Arg2 = 1, 
         Arg1 = 29004, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 12, 
      }, 
      [112] = 
      {
         Arg2 = 10, 
         Arg1 = 29007, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 29064, 
      }, 
      [113] = 
      {
         Arg2 = 11, 
         Arg1 = 29007, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 29088, 
      }, 
      [114] = 
      {
         Arg2 = 12, 
         Arg1 = 29007, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 29082, 
      }, 
      [115] = 
      {
         Arg2 = 13, 
         Arg1 = 29007, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 29101, 
      }, 
      [116] = 
      {
         Arg2 = 1, 
         Arg1 = 29064, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 29085, 
      }, 
      [117] = 
      {
         Arg1 = 21009, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [118] = 
      {
         Arg1 = 21008, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [119] = 
      {
         Arg1 = 21010, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [120] = 
      {
         Arg1 = 32230, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [121] = 
      {
         Arg1 = 10487, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [122] = 
      {
         Arg1 = 29065, 
         Command = "G", 
         MiscData = 1, 
         Arg2 = 1, 
      }, 
      [123] = 
      {
         Arg2 = 1, 
         Arg1 = 7316, 
         Command = "M", 
         MiscData = 1, 
         Arg3 = 29085, 
      }, 
      [124] = 
      {
         Arg2 = 1, 
         Arg1 = 28200, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 16, 
      }, 
      [125] = 
      {
         Arg2 = 1, 
         Arg1 = 32217, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 6, 
      }, 
      [126] = 
      {
         Arg2 = 1, 
         Arg1 = 32215, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 5, 
      }, 
      [127] = 
      {
         Arg2 = 1, 
         Arg1 = 32216, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 7, 
      }, 
      [128] = 
      {
         Arg2 = 1, 
         Arg1 = 32204, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 13, 
      }, 
      [129] = 
      {
         Arg2 = 1, 
         Arg1 = 32205, 
         Command = "E", 
         MiscData = 1, 
         Arg3 = 8, 
      }, 
      [130] = 
      {
         Arg2 = 0, 
         Arg1 = 29085, 
         Command = "D", 
         MiscData = 0, 
         Arg3 = 0, 
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
      [29060] = 
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
         Vnum = 29060, 
         Flags = 
         {
            [2] = "NoMob", 
         }, 
         Name = "Floating in a void", 
      }, 
      [29061] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "This is the northern most entrance and exit of Baituh City.  Jagged\
rocks prevent your travel in most directions.  The air is thick and\
full of dirt and soil.  You can continue to either the north or the\
south from here.\
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
               DestinationVnum = 29112, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29062, 
               Direction = "south", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29061, 
         Flags = 
         {
            [13] = "Arena", 
            [2] = "NoMob", 
            [7] = "NoMagic", 
         }, 
         Name = "Baituh City Road", 
      }, 
      [29062] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "Baituh City is known all over Adari for its city design.  Baituh\
City is completely unique in its city structure.  When the city was\
founded, they did not have proper equipment to remove some of the\
thicker rock.  As a result, Large pieces of mountain and volcano\
still stand in the center of each city block.  You can continue\
north, east or west from here.\
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
               DestinationVnum = 29061, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29064, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29063, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29062, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Name = "Baituh City Road", 
      }, 
      [29063] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "The path is fairly wide here.  The black soil is soft and moist\
beneath you.  Baituh City seems pretty desolate and devoid of\
intelligent life.  This once thriving city fell on hard times shortly\
after the fall of the Empire. It has been a struggle to keep most\
cities on this planet alive.  You can continue east or south from\
here.\
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
               DestinationVnum = 29062, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29066, 
               Direction = "south", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29063, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Name = "Baituh City Road", 
      }, 
      [29064] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "The path is fairly wide here.  The black soil is soft and moist\
beneath you.  Baituh City seems pretty desolate and devoid of\
intelligent life.  This once thriving city fell on hard times shortly\
after the fall of the Empire. It has been a struggle to keep most\
cities on this planet alive.  You can continue west or south from\
here.\
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
               DestinationVnum = 29067, 
               Direction = "south", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29062, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29064, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Name = "Baituh City Road", 
      }, 
      [29065] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "This barren little area is used for private space vessels to come\
and go.  This is not a nice or well kept facility, but it does serve\
a very useful purpose for the cities inhabitants.  This is not a bus\
stop. Commercial transportation does not and cannot dock here.  You\
can continue east from here.\
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
               DestinationVnum = 29066, 
               Direction = "east", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29065, 
         Flags = 
         {
            [4] = "CanLand", 
            [2] = "NoMob", 
            [18] = "NoDrop", 
         }, 
         Name = "Baituh City Landing Strip", 
      }, 
      [29066] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "The path is very wide here.  It would be possible for small vehicles\
to easily pass one another here.  Baituh City is now largely\
inhabited by vermin and rodents.  The intelligent beings who reside\
here are scoundrels and thugs primarily.  You can continue north,\
south, or west from here.\
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
               DestinationVnum = 29063, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29069, 
               Direction = "south", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29065, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29066, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Name = "Baituh City Road", 
      }, 
      [29067] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "The path is very wide here.  It would be possible for small vehicles\
to easily pass one another here.  Baituh City is now largely\
inhabited by vermin and rodents.  The intelligent beings who reside\
here are scoundrels and thugs primarily.  You can continue north,\
south, or east from here.\
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
               DestinationVnum = 29064, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29068, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29071, 
               Direction = "south", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29067, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Name = "Baituh City Road", 
      }, 
      [29068] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "You are just inside a cave.  The room is very well lit and well\
kept. Whoever runs the shop is very clean and meticulous.  The floor\
is made up of smoothed marble like rock and has very little dirt on\
it. You can exit to the west.\
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
               DestinationVnum = 29067, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29068, 
         Flags = 
         {
            [13] = "Arena", 
            [10] = "Safe", 
            [3] = "Indoors", 
         }, 
         Name = "Baituh City Cafeteria", 
      }, 
      [29069] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "There is thick volcanic ash beneath you.  It black and grainy.  The\
ash seems to stick to everything and gets onto all of your clothes. \
Be careful not to breathe in too much of this ash saturated  air. \
You can continue north or east from here.\
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
               DestinationVnum = 29066, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29070, 
               Direction = "east", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29069, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Name = "Baituh City Road", 
      }, 
      [29070] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "Baituh City is known all over Adari for its city design.  Baituh\
City is completely unique in its city structure.  When the city was\
founded, they did not have proper equipment to remove some of the\
thicker rock.  As a result, Large pieces of mountain and volcano\
still stand in the center of each city block.  You can continue\
south, east or west from here.\
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
               DestinationVnum = 29071, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29072, 
               Direction = "south", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29069, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29070, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Name = "Baituh City Road", 
      }, 
      [29071] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "There is thick volcanic ash beneath you.  It black and grainy.  The\
ash seems to stick to everything and gets onto all of your clothes. \
Be careful not to breathe in too much of this ash saturated  air. \
You can continue north or west from here.\
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
               DestinationVnum = 29067, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29070, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29071, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Name = "Baituh City Road", 
      }, 
      [29072] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "This road is covered in thick black volcanic ash.  The ash is heavy\
and very clingy.  Ash floats through the air and attaches its self to\
your clothing and other belonings. You can continue north or south\
from here.\
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
               DestinationVnum = 29070, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29073, 
               Direction = "south", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29072, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Name = "Baituh City Road", 
      }, 
      [29073] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "This is the main intersection for Baituh City.  There are city\
blocks in all directions from here.  Each direction leads to\
something completely different than the other three.  Feel free to\
look around.\
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
               DestinationVnum = 29072, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29086, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29098, 
               Direction = "south", 
            }, 
            [4] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29074, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29073, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Name = "Baituh City Road", 
      }, 
      [29074] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "This road is covered in thick black volcanic ash.  The ash is heavy\
and very clingy.  Ash floats through the air and attaches its self to\
your clothing and other belonings. You can continue east or west from\
here.\
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
               DestinationVnum = 29073, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29075, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29074, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Name = "Baituh City Road", 
      }, 
      [29075] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "The path is very wide here.  It would be possible for small vehicles\
to easily pass one another here.  Baituh City is now largely\
inhabited by vermin and rodents.  The intelligent beings who reside\
here are scoundrels and thugs primarily.  You can continue north,\
south, or east from here.\
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
               DestinationVnum = 29076, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29074, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29082, 
               Direction = "south", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29075, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Name = "Baituh City Road", 
      }, 
      [29076] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "The path is fairly wide here.  The black soil is soft and moist\
beneath you.  Baituh City seems pretty desolate and devoid of\
intelligent life.  This once thriving city fell on hard times shortly\
after the fall of the Empire. It has been a struggle to keep most\
cities on this planet alive.  You can continue west or south from\
here.\
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
               DestinationVnum = 29075, 
               Direction = "south", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29077, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29076, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Name = "Baituh City Road", 
      }, 
      [29077] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "Baituh City is known all over Adari for its city design.  Baituh\
City is completely unique in its city structure.  When the city was\
founded, they did not have proper equipment to remove some of the\
thicker rock.  As a result, Large pieces of mountain and volcano\
still stand in the center of each city block.  You can continue\
north, east or west from here.\
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
               DestinationVnum = 29083, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29076, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29078, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29077, 
         Flags = 
         {
            [13] = "Arena", 
            [7] = "NoMagic", 
         }, 
         Name = "Baituh City Road", 
      }, 
      [29078] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "The path is fairly wide here.  The black soil is soft and moist\
beneath you.  Baituh City seems pretty desolate and devoid of\
intelligent life.  This once thriving city fell on hard times shortly\
after the fall of the Empire. It has been a struggle to keep most\
cities on this planet alive.  You can continue east or south from\
here.\
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
               DestinationVnum = 29077, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29079, 
               Direction = "south", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29078, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Name = "Baituh City Road", 
      }, 
      [29079] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "The path is very wide here.  It would be possible for small vehicles\
to easily pass one another here.  Baituh City is now largely\
inhabited by vermin and rodents.  The intelligent beings who reside\
here are scoundrels and thugs primarily.  You can continue north,\
south, or west from here.\
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
               DestinationVnum = 29078, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29080, 
               Direction = "south", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29084, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29079, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Name = "Baituh City Road", 
      }, 
      [29080] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "There is thick volcanic ash beneath you.  It black and grainy.  The\
ash seems to stick to everything and gets onto all of your clothes. \
Be careful not to breathe in too much of this ash saturated  air. \
You can continue north or east from here.\
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
               DestinationVnum = 29079, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29081, 
               Direction = "east", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29080, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Name = "Baituh City Road", 
      }, 
      [29081] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "Baituh City is known all over Adari for its city design.  Baituh City\
is completely unique in its city structure.  When the city was\
founded, they did not have proper equipment to remove some of the\
thicker rock.  As a result, Large pieces of mountain and volcano\
still stand in the center of each city block.  You can continue\
south, east or west from here. To the south is a 'bar'.\
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
               DestinationVnum = 29082, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29085, 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
               }, 
               Direction = "south", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29080, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29081, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Name = "Baituh City Road", 
      }, 
      [29082] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "There is thick volcanic ash beneath you.  It black and grainy.  The\
ash seems to stick to everything and gets onto all of your clothes. \
Be careful not to breathe in too much of this ash saturated  air. \
You can continue north or west from here.\
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
               DestinationVnum = 29075, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29081, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29082, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Name = "Baituh City Road", 
      }, 
      [29083] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "At one time Baituh City produced the best and brightest Adarians in\
their state of the art academy.  Since the planet and town have hit\
hard times, things have changed.  Now students must travel to Alfuh\
to work on their fighting skills. Most of the faculty from the old\
school have also left.  This lone room now acts as a tutoring\
facility for the one remaining faculty member.\
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
               DestinationVnum = 29077, 
               Direction = "south", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29083, 
         Flags = 
         {
            [3] = "Indoors", 
         }, 
         Name = "Baituh City Academia", 
      }, 
      [29084] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "Welcome to the Baituh City Inn.  Those who need to rest and such\
can do so here.  But, you have to purchase a room of course.  This is\
not the largest hotel on the planet by any means.  But if you need to\
rest, this place is as good as any other.  You can exit to the east.\
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
               DestinationVnum = 29079, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29110, 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [23] = "BashProof", 
               }, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29084, 
         Flags = 
         {
            [15] = "NoDropAll", 
            [13] = "Arena", 
            [10] = "Safe", 
            [7] = "NoMagic", 
         }, 
         Name = "Baituh City Inn", 
      }, 
      [29085] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "This dank fouls smelling hole in the ground is one of the few\
businesses able to survive these times of hardship.  It is a bar. \
Beings come here to forget about how miserable their lives are.  Feel\
free to join them.  But watch your step.  You can exit to the north.\
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
               DestinationVnum = 29081, 
               Flags = 
               {
                  [0] = "IsDoor", 
               }, 
               Direction = "north", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29085, 
         Flags = 
         {
            [13] = "Arena", 
            [3] = "Indoors", 
         }, 
         Name = "Baituh City Bar", 
      }, 
      [29086] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "This road is covered in thick black volcanic ash.  The ash is heavy\
and very clingy.  Ash floats through the air and attaches its self to\
your clothing and other belonings. You can continue east or west from\
here.\
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
               DestinationVnum = 29087, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29073, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29086, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Name = "Baituh City Road", 
      }, 
      [29087] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "The path is very wide here.  It would be possible for small vehicles\
to easily pass one another here.  Baituh City is now largely\
inhabited by vermin and rodents.  The intelligent beings who reside\
here are scoundrels and thugs primarily.  You can continue north,\
south, or west from here.\
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
               DestinationVnum = 29088, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29094, 
               Direction = "south", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29086, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29087, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Name = "Baituh City Road", 
      }, 
      [29088] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "The path is fairly wide here.  The black soil is soft and moist\
beneath you.  Baituh City seems pretty desolate and devoid of\
intelligent life.  This once thriving city fell on hard times shortly\
after the fall of the Empire. It has been a struggle to keep most\
cities on this planet alive.  You can continue east or south from\
here.\
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
               DestinationVnum = 29089, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29087, 
               Direction = "south", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29088, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Name = "Baituh City Road", 
      }, 
      [29089] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "Baituh City is known all over Adari for its city design.  Baituh\
City is completely unique in its city structure.  When the city was\
founded, they did not have proper equipment to remove some of the\
thicker rock.  As a result, Large pieces of mountain and volcano\
still stand in the center of each city block.  You can continue\
north, east or west from here.\
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
               DestinationVnum = 29095, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29090, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29088, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29089, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Name = "Baituh City Road", 
      }, 
      [29090] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "The path is fairly wide here.  The black soil is soft and moist\
beneath you.  Baituh City seems pretty desolate and devoid of\
intelligent life.  This once thriving city fell on hard times shortly\
after the fall of the Empire. It has been a struggle to keep most\
cities on this planet alive.  You can continue west or south from\
here.\
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
               DestinationVnum = 29091, 
               Direction = "south", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29089, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29090, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Name = "Baituh City Road", 
      }, 
      [29091] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "The path is very wide here.  It would be possible for small vehicles\
to easily pass one another here.  Baituh City is now largely\
inhabited by vermin and rodents.  The intelligent beings who reside\
here are scoundrels and thugs primarily.  You can continue north,\
south, or east from here.\
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
               DestinationVnum = 29090, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29096, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29092, 
               Direction = "south", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29091, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Name = "Baituh City Road", 
      }, 
      [29092] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "There is thick volcanic ash beneath you.  It black and grainy.  The\
ash seems to stick to everything and gets onto all of your clothes. \
Be careful not to breathe in too much of this ash saturated  air. \
You can continue north or west from here.\
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
               DestinationVnum = 29091, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29093, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29092, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Name = "Baituh City Road", 
      }, 
      [29093] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "Baituh City is known all over Adari for its city design.  Baituh\
City is completely unique in its city structure.  When the city was\
founded, they did not have proper equipment to remove some of the\
thicker rock.  As a result, Large pieces of mountain and volcano\
still stand in the center of each city block.  You can continue\
south, east or west from here.\
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
               DestinationVnum = 29092, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29097, 
               Direction = "south", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29094, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29093, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Name = "Baituh City Road", 
      }, 
      [29094] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "There is thick volcanic ash beneath you.  It black and grainy.  The\
ash seems to stick to everything and gets onto all of your clothes. \
Be careful not to breathe in too much of this ash saturated  air. \
You can continue north or east from here.\
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
               DestinationVnum = 29087, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29093, 
               Direction = "east", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29094, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Name = "Baituh City Road", 
      }, 
      [29095] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "This is not quite as elegant as one would expect of a government.\
 It would seem the government has been struggling a lot too during\
this time of hardship for the planet.  The room is well lit.  The\
walls are covered in dirt and filth, the floor is even worse.  You\
can escape to the south.\
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
               DestinationVnum = 29089, 
               Direction = "south", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29095, 
         Flags = 
         {
            [13] = "Arena", 
            [3] = "Indoors", 
         }, 
         Name = "Baituh City Governmental Offices", 
      }, 
      [29096] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "Baituh City is still capable of communicating with other cities and\
planets. This was once a thriving postal service serving Baituh City\
and its the suburbs. Today, no one oversees the post office.  It is\
all done electronically.  You can exit to the west.\
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
               DestinationVnum = 29091, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29096, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Name = "Baituh City Post Office", 
      }, 
      [29097] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "It is extremely warm here.  There is a large pool of lava\
directly south of here.  To continue south would almost certainly be\
instant death.  It would be best to get as far away from here as\
possible.  This is not a safe area.  Go north if you cherish life.\
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
               DestinationVnum = 29093, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "If you go south, you will surely die!\
", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29111, 
               Direction = "south", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29097, 
         Flags = 
         {
            [10] = "Safe", 
            [13] = "Arena", 
         }, 
         Name = "Lava Resevoir", 
      }, 
      [29098] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "This road is covered in thick black volcanic ash.  The ash is heavy\
and very clingy.  Ash floats through the air and attaches its self to\
your clothing and other belonings. You can continue north or south\
from here.\
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
               DestinationVnum = 29073, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29099, 
               Direction = "south", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29098, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Name = "Baituh City Road", 
      }, 
      [29099] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "Baituh City is known all over Adari for its city design.  Baituh\
City is completely unique in its city structure.  When the city was\
founded, they did not have proper equipment to remove some of the\
thicker rock.  As a result, Large pieces of mountain and volcano\
still stand in the center of each city block.  You can continue\
north, east or west from here.\
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
               DestinationVnum = 29098, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29101, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29100, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29099, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Name = "Baituh City Road", 
      }, 
      [29100] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "The path is fairly wide here.  The black soil is soft and moist\
beneath you.  Baituh City seems pretty desolate and devoid of\
intelligent life.  This once thriving city fell on hard times shortly\
after the fall of the Empire. It has been a struggle to keep most\
cities on this planet alive.  You can continue east or south from\
here.\
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
               DestinationVnum = 29099, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29102, 
               Direction = "south", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29100, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Name = "Baituh City Road", 
      }, 
      [29101] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "The path is fairly wide here.  The black soil is soft and moist\
beneath you.  Baituh City seems pretty desolate and devoid of\
intelligent life.  This once thriving city fell on hard times shortly\
after the fall of the Empire. It has been a struggle to keep most\
cities on this planet alive.  You can continue west or south from\
here.\
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
               DestinationVnum = 29103, 
               Direction = "south", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29099, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29101, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Name = "Baituh City Road", 
      }, 
      [29102] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "The path is very wide here.  It would be possible for small vehicles\
to easily pass one another here.  Baituh City is now largely\
inhabited by vermin and rodents.  The intelligent beings who reside\
here are scoundrels and thugs primarily.  You can continue north,\
south, or west from here.\
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
               DestinationVnum = 29100, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29104, 
               Direction = "south", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29107, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29102, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Name = "Baituh City Road", 
      }, 
      [29103] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "The path is very wide here.  It would be possible for small vehicles\
to easily pass one another here.  Baituh City is now largely\
inhabited by vermin and rodents.  The intelligent beings who reside\
here are scoundrels and thugs primarily.  You can continue north,\
south, or east from here.\
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
               DestinationVnum = 29101, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29108, 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [26] = "CanLook", 
                  [10] = "NoPassdoor", 
                  [23] = "BashProof", 
               }, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29106, 
               Direction = "south", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29103, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Name = "Baituh City Road", 
      }, 
      [29104] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "There is thick volcanic ash beneath you.  It black and grainy.  The\
ash seems to stick to everything and gets onto all of your clothes. \
Be careful not to breathe in too much of this ash saturated  air. \
You can continue north or east from here.\
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
               DestinationVnum = 29102, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29105, 
               Direction = "east", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29104, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Name = "Baituh City Road", 
      }, 
      [29105] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "Baituh City is known all over Adari for its city design.  Baituh\
City is completely unique in its city structure.  When the city was\
founded, they did not have proper equipment to remove some of the\
thicker rock.  As a result, Large pieces of mountain and volcano\
still stand in the center of each city block.  You can continue\
south, east or west from here.\
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
               DestinationVnum = 29106, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29109, 
               Direction = "south", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29104, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29105, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Name = "Baituh City Road", 
      }, 
      [29106] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "There is thick volcanic ash beneath you.  It black and grainy.  The\
ash seems to stick to everything and gets onto all of your clothes. \
Be careful not to breathe in too much of this ash saturated  air. \
You can continue north or west from here.\
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
               DestinationVnum = 29103, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29105, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29106, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Name = "Baituh City Road", 
      }, 
      [29107] = 
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
               DestinationVnum = 29102, 
               Direction = "east", 
            }, 
         }, 
         TeleDelay = 0, 
         Description = "This is the Baituh City Police Station.  A large marble desk sits in\
the corner of the room.  The floor is covered in dirt and volcanic\
ash. Several communication terminals have been built into the walls\
around you.\
", 
         Vnum = 29107, 
         Name = "Baituh City Police Station", 
      }, 
      [29108] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
            [1] = 
            {
               Keyword = "bail box", 
               Description = "This is a bail box.  To bereleased from jail, you must give 30 credits\
\13worth of bail to the box.  You will promptly be freed if you pay the\
\01330credit fine. \
\13", 
            }, 
         }, 
         Tunnel = 0, 
         Description = "This is a dank foul smelling armpit of a cell.  To be locked in this\
room means you must have broken the law.  Thick rocks make up the\
walls and ceiling. \
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
               DestinationVnum = 29103, 
               Flags = 
               {
                  [1] = "Closed", 
                  [2] = "Locked", 
                  [0] = "IsDoor", 
                  [26] = "CanLook", 
                  [10] = "NoPassdoor", 
                  [23] = "BashProof", 
               }, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29108, 
         Flags = 
         {
            [15] = "NoDropAll", 
            [13] = "Arena", 
            [6] = "NoDrive", 
            [3] = "Indoors", 
         }, 
         Name = "Baituh City Jail", 
      }, 
      [29109] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "This road is very wide and seems to be in fairly decent condition. \
However, a large rock-like boulder blocks you from continuing any\
further south. \
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
               DestinationVnum = 29105, 
               Direction = "north", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29109, 
         Flags = 
         {
            [13] = "Arena", 
         }, 
         Name = "Baituh City Road", 
      }, 
      [29110] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "This is where you can safely sleep and exit the game.  When you\
reenter the game, this is the room you will start in.  Be sure to\
thank the hotel staff for putting up with you.  Enjoy your stay.  You\
can exit to the east. \
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
               DestinationVnum = 29084, 
               Direction = "east", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29110, 
         Flags = 
         {
            [23] = "Hotel", 
            [13] = "Arena", 
         }, 
         Name = "Baituh City Hotel", 
      }, 
      [29111] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "It is unbelievably hot here.  You are in a lake of lava.  To be\
here is  almost certainly suicide.  If you can still escape to the\
north, do so! \
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
               DestinationVnum = 29097, 
               Direction = "north", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29111, 
         Flags = 
         {
            [1] = "_Reserved", 
            [2] = "NoMob", 
            [16] = "Silence", 
            [13] = "Arena", 
         }, 
         Name = "Lava Lake", 
      }, 
      [29112] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.  To the south is Baituh\
City.\
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
               DestinationVnum = 29158, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29061, 
               Direction = "south", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29113, 
               Flags = 
               {
                  [11] = "Hidden", 
               }, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29112, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29113] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
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
               DestinationVnum = 29112, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29114, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29113, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29114] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
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
               DestinationVnum = 29115, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29113, 
               Direction = "east", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29114, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29115] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
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
               DestinationVnum = 29116, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29114, 
               Direction = "south", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29115, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29116] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
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
               DestinationVnum = 29117, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29115, 
               Direction = "south", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29116, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29117] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
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
               DestinationVnum = 29118, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29116, 
               Direction = "south", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29117, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29118] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
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
               DestinationVnum = 29119, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29117, 
               Direction = "south", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29118, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29119] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
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
               DestinationVnum = 29120, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29118, 
               Direction = "south", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29119, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29120] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
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
               DestinationVnum = 29121, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29119, 
               Direction = "south", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29120, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29121] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
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
               DestinationVnum = 29122, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29120, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29121, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29122] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
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
               DestinationVnum = 29123, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29121, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29122, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29123] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
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
               DestinationVnum = 29124, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29125, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29122, 
               Flags = 
               {
                  [11] = "Hidden", 
               }, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29123, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29124] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
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
               DestinationVnum = 29049, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29123, 
               Direction = "south", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29124, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [2] = "NoMob", 
            [18] = "NoDrop", 
         }, 
         Name = "Outskirts of Alfuh City", 
      }, 
      [29125] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here. \
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
               DestinationVnum = 29126, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29123, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29125, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29126] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
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
               DestinationVnum = 29127, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29125, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29126, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29127] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
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
               DestinationVnum = 29130, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29128, 
               Direction = "south", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29126, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29127, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29128] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
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
               DestinationVnum = 29127, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29129, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29128, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29129] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
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
               DestinationVnum = 29128, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29130, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29129, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29130] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
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
               DestinationVnum = 29129, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29131, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29130, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29131] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
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
               DestinationVnum = 29130, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29132, 
               Direction = "south", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29138, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29131, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29132] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
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
               DestinationVnum = 29131, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29133, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29128, 
               Direction = "south", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29132, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29133] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
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
               DestinationVnum = 29134, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29132, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29133, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29134] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
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
               DestinationVnum = 29140, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29135, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29128, 
               Direction = "south", 
            }, 
            [4] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29133, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29134, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29135] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
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
               DestinationVnum = 29136, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29134, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29135, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29136] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
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
               DestinationVnum = 29143, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29131, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29137, 
               Direction = "south", 
            }, 
            [4] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29135, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29136, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29137] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
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
               DestinationVnum = 29136, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29132, 
               Direction = "south", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29138, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29137, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29138] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
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
               DestinationVnum = 29137, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29139, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29138, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29139] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
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
               DestinationVnum = 29138, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29140, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29139, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29140] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
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
               DestinationVnum = 29139, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29136, 
               Direction = "south", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29141, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29140, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29141] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
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
               DestinationVnum = 29140, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29142, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29141, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29142] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
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
               DestinationVnum = 29141, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29143, 
               Direction = "south", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29136, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29142, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29143] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
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
               DestinationVnum = 29142, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29139, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29144, 
               Direction = "south", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29143, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29144] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
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
               DestinationVnum = 29143, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29145, 
               Direction = "east", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29144, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29145] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
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
               DestinationVnum = 29146, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29144, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29145, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29146] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
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
               DestinationVnum = 29147, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29145, 
               Direction = "south", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29146, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29147] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
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
               DestinationVnum = 29148, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29146, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29147, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29148] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
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
               DestinationVnum = 29151, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29149, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29147, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29148, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29149] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
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
               DestinationVnum = 29139, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29150, 
               Direction = "south", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29148, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29149, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29150] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
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
               DestinationVnum = 29149, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29151, 
               Direction = "east", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29150, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29151] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
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
               DestinationVnum = 29152, 
               Direction = "south", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29150, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29151, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29152] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
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
               DestinationVnum = 29151, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29147, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29153, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29152, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29153] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
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
               DestinationVnum = 29152, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29154, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29153, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29154] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
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
               DestinationVnum = 29155, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29153, 
               Direction = "east", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29154, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29155] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
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
               DestinationVnum = 29154, 
               Direction = "south", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29156, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29155, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29156] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
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
               DestinationVnum = 29155, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29157, 
               Direction = "south", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29156, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29157] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "The road is covered in thick ash.  You are surrounded by mountains\
and jagged rocks.  It is difficult to know exactly where you are.  It\
would be pretty easy to get lost out here.\
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
               DestinationVnum = 29156, 
               Direction = "north", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29147, 
               Direction = "east", 
            }, 
            [3] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29158, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29157, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
      [29158] = 
      {
         TeleVnum = 0, 
         ExtraDescriptions = 
         {
         }, 
         Tunnel = 0, 
         Description = "It would be pretty easy to get lost out here on this ash  covered\
pathway.  You are surrounded by mountains  and jagged rocks.  It is\
difficult to know exactly where you are.   \
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
               DestinationVnum = 29157, 
               Direction = "east", 
            }, 
            [2] = 
            {
               Keyword = "", 
               Description = "", 
               Distance = 0, 
               Key = -1, 
               DestinationVnum = 29112, 
               Direction = "west", 
            }, 
         }, 
         TeleDelay = 0, 
         Vnum = 29158, 
         Flags = 
         {
            [16] = "Silence", 
            [13] = "Arena", 
            [18] = "NoDrop", 
         }, 
         Name = "Enclosed Dirt Path", 
      }, 
   }, 
   Mobiles = 
   {
      [29060] = 
      {
         HitRoll = 8, 
         Description = "He is a big burly Adarian.  His only intention is to keep weapons\
from being imported or exported from Adari.\
", 
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
         SpecFuns = 
         {
            [1] = "spec_customs_spice", 
            [0] = "spec_police_jail", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "time_prog", 
               Code = "mpecho A deputy leaves in a rush.\
mpgoto 29030\
drop all\
mpgoto 29065\
mpecho A deputy has arrived.\
", 
               Arguments = "12", 
            }, 
         }, 
         Vnum = 29060, 
         DefaultPosition = "standing", 
         ShortDescr = "Smotsuk", 
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
         Race = "Adarian", 
         HitChance = 
         {
            HitNoDice = 4, 
            HitSizeDice = 40, 
            HitPlus = 0, 
         }, 
         NumberOfAttacks = 0, 
         LongDescr = "Smotsuk, a customs officer is here.\
", 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 4, 
            DamSizeDice = 20, 
         }, 
         VipFlags = 
         {
            [9] = "Adari", 
         }, 
         Position = "standing", 
         Sex = "male", 
         DamRoll = 8, 
         Height = 0, 
         Alignment = 350, 
         Languages = 
         {
            Speaking = 
            {
               [19] = "adarese", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [19] = "adarese", 
            }, 
         }, 
         ArmorClass = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         Name = "officer customs smotsuk", 
      }, 
      [29061] = 
      {
         HitRoll = 4, 
         Description = "He is an elderly Adarian shop keeper. \
", 
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
            KeeperShortDescr = "Baszturd", 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
         }, 
         Vnum = 29061, 
         DefaultPosition = "standing", 
         ShortDescr = "Baszturd", 
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
         Race = "Adarian", 
         HitChance = 
         {
            HitNoDice = 2, 
            HitSizeDice = 20, 
            HitPlus = 0, 
         }, 
         NumberOfAttacks = 0, 
         LongDescr = "A shop keeper works here.\
", 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 2, 
            DamSizeDice = 10, 
         }, 
         VipFlags = 
         {
            [9] = "Adari", 
         }, 
         Position = "standing", 
         Sex = "male", 
         DamRoll = 4, 
         Height = 0, 
         Alignment = -400, 
         Languages = 
         {
            Speaking = 
            {
               [19] = "adarese", 
            }, 
            Speaks = 
            {
               [19] = "adarese", 
            }, 
         }, 
         ArmorClass = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [6] = "StayArea", 
            [24] = "NoAssist", 
         }, 
         Name = "shop keeper shopkeeper baszturd", 
      }, 
      [29062] = 
      {
         HitRoll = 4, 
         Description = "This old Adarian may not know a great deal about fighting, but he\
knows many languages and other academic fields.  He might be able to\
help you learn another language. \
", 
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
         Vnum = 29062, 
         DefaultPosition = "standing", 
         ShortDescr = "Professor Sumaretie", 
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
         Race = "Adarian", 
         HitChance = 
         {
            HitNoDice = 2, 
            HitSizeDice = 20, 
            HitPlus = 0, 
         }, 
         NumberOfAttacks = 0, 
         LongDescr = "A saavy, old scholar studies here.\
", 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 2, 
            DamSizeDice = 10, 
         }, 
         VipFlags = 
         {
            [9] = "Adari", 
         }, 
         Position = "standing", 
         Sex = "male", 
         DamRoll = 4, 
         Height = 0, 
         Alignment = 450, 
         Languages = 
         {
            Speaking = 
            {
               [1] = "shyriiwook", 
               [2] = "twileki", 
               [0] = "basic", 
               [9] = "antarian", 
               [19] = "adarese", 
               [20] = "verpine", 
               [14] = "gamorrese", 
               [6] = "shistavanen", 
            }, 
            Speaks = 
            {
               [1] = "shyriiwook", 
               [2] = "twileki", 
               [9] = "antarian", 
               [19] = "adarese", 
               [20] = "verpine", 
               [6] = "shistavanen", 
               [14] = "gamorrese", 
            }, 
         }, 
         ArmorClass = 60, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
            [6] = "StayArea", 
            [20] = "Scholar", 
         }, 
         Name = "scholar old saavy professor sumaretie", 
      }, 
      [29063] = 
      {
         HitRoll = 6, 
         Description = "A red astromech R2 unit idles here waiting to help you.  If you would\
like  to rent a room for the evening, give 50 credits to this R2\
unit. \
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
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "all_greet_prog", 
               Code = "mpecho A little red R2 Unit whistles happily towards you.\
", 
               Arguments = "75", 
            }, 
            [2] = 
            {
               MudProgType = "bribe_prog", 
               Code = "mpgoto 29110\
mptransfer $n\
mpechoat $n The R2 Unit escorts you to a room.\
east\
", 
               Arguments = "18", 
            }, 
         }, 
         Vnum = 29063, 
         DefaultPosition = "standing", 
         ShortDescr = "An Innkeeper Droid", 
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
         Race = "Adarian", 
         HitChance = 
         {
            HitNoDice = 3, 
            HitSizeDice = 30, 
            HitPlus = 0, 
         }, 
         NumberOfAttacks = 0, 
         LongDescr = "An Innkeeper Droid idles here.\
", 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 3, 
            DamSizeDice = 15, 
         }, 
         VipFlags = 
         {
            [9] = "Adari", 
         }, 
         Position = "standing", 
         Sex = "undistinguished", 
         DamRoll = 6, 
         Height = 0, 
         Alignment = -400, 
         Languages = 
         {
            Speaking = 
            {
               [19] = "adarese", 
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
            [26] = "Droid", 
            [6] = "StayArea", 
            [24] = "NoAssist", 
         }, 
         Name = "droid innkeeper keeper r2 unit", 
      }, 
      [29064] = 
      {
         HitRoll = 10, 
         Description = "", 
         Level = 50, 
         Credits = 0, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Vnum = 29064, 
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
            KeeperShortDescr = "Puttzu", 
            BuyTypes = 
            {
               [1] = "none", 
               [2] = "none", 
               [3] = "none", 
               [4] = "none", 
               [0] = "none", 
            }, 
         }, 
         ShortDescr = "Puttzu", 
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
         Race = "Hutt", 
         HitChance = 
         {
            HitNoDice = 5, 
            HitSizeDice = 50, 
            HitPlus = 0, 
         }, 
         NumberOfAttacks = 0, 
         LongDescr = "A Hutt Bartender works here.\
", 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 5, 
            DamSizeDice = 25, 
         }, 
         Weight = 0, 
         Position = "standing", 
         Sex = "male", 
         DamRoll = 10, 
         Height = 0, 
         Alignment = -500, 
         Languages = 
         {
            Speaking = 
            {
               [19] = "adarese", 
            }, 
            Speaks = 
            {
               [4] = "huttese", 
               [0] = "basic", 
               [19] = "adarese", 
            }, 
         }, 
         ArmorClass = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [25] = "NoKill", 
         }, 
         Name = "bartender hutt puttzu", 
      }, 
      [29065] = 
      {
         HitRoll = 13, 
         Description = "This Astromech Droid is acting as a bouncer to the bar south of here.\
Only 'adults' can enter.  If you would like to enter the bar, tell\
the droid 'hutts rule!'. \
", 
         Level = 65, 
         Credits = 0, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Vnum = 29065, 
         DefaultPosition = "standing", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "speech_prog", 
               Code = "mpgoto puttzu\
mptransfer $n\
mpechoat $n The Droid ushers you into the bar.\
mpecho $n is ushered into the bar.\
mpgoto 29081\
", 
               Arguments = "p hutts rule!", 
            }, 
         }, 
         ShortDescr = "An Astromech Droid", 
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
         Race = "Adarian", 
         HitChance = 
         {
            HitNoDice = 7, 
            HitSizeDice = 65, 
            HitPlus = 0, 
         }, 
         NumberOfAttacks = 0, 
         LongDescr = "An Astromech Droid acts as a bouncer here.\
", 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 6, 
            DamSizeDice = 37, 
         }, 
         Weight = 0, 
         Position = "standing", 
         Sex = "undistinguished", 
         DamRoll = 13, 
         Height = 0, 
         Alignment = -500, 
         Languages = 
         {
            Speaking = 
            {
               [0] = "basic", 
            }, 
            Speaks = 
            {
               [0] = "basic", 
               [19] = "adarese", 
            }, 
         }, 
         ArmorClass = 0, 
         Flags = 
         {
            [1] = "Sentinel", 
            [0] = "Npc", 
            [6] = "StayArea", 
            [26] = "Droid", 
         }, 
         Name = "droid astromech bouncer", 
      }, 
      [29066] = 
      {
         HitRoll = 10, 
         Description = "", 
         Level = 50, 
         Credits = 0, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Vnum = 29066, 
         DefaultPosition = "standing", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "bribe_prog", 
               Code = "mpechoaround $n $n exits the jail.\
mpgoto 29103\
mptransfer $n\
mpechoat $n The doors opens and you are released.\
mpechoaround $n $n exits the jail.\
mpgoto 29108\
", 
               Arguments = "30", 
            }, 
         }, 
         ShortDescr = "a bail box", 
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
         LongDescr = "A Bail Box has been installed in the wall here.\
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
         ArmorClass = -100, 
         Flags = 
         {
            [0] = "Npc", 
         }, 
         Name = "bailjfk boxjfk", 
      }, 
      [29067] = 
      {
         HitRoll = 6, 
         Description = "Deputy Snopaew is a tall and gangly looking Adarian.  It is his job to\
keep weapons out of the city.\
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
         SpecFuns = 
         {
            [1] = "spec_customs_weapons", 
            [0] = "spec_police_jail", 
         }, 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "entry_prog", 
               Code = "mpecho Deputy Snopaew surveys the area.\
", 
               Arguments = "50", 
            }, 
            [2] = 
            {
               MudProgType = "all_greet_prog", 
               Code = "glare $n\
", 
               Arguments = "75", 
            }, 
         }, 
         Vnum = 29067, 
         DefaultPosition = "standing", 
         ShortDescr = "Deputy Snopaew", 
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
         Race = "Adarian", 
         HitChance = 
         {
            HitNoDice = 3, 
            HitSizeDice = 30, 
            HitPlus = 0, 
         }, 
         NumberOfAttacks = 0, 
         LongDescr = "A deputy partols the area.\
", 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 3, 
            DamSizeDice = 15, 
         }, 
         VipFlags = 
         {
            [9] = "Adari", 
         }, 
         Position = "standing", 
         Sex = "male", 
         DamRoll = 6, 
         Height = 0, 
         Alignment = 300, 
         Languages = 
         {
            Speaking = 
            {
               [19] = "adarese", 
            }, 
            Speaks = 
            {
               [19] = "adarese", 
            }, 
         }, 
         ArmorClass = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [25] = "NoKill", 
            [6] = "StayArea", 
         }, 
         Name = "deputy snopaew", 
      }, 
      [29068] = 
      {
         HitRoll = 3, 
         Description = "A young Adarian deputy.  You can see it is his dream to enforce\
laws.  He is a decent and moral being.\
", 
         Level = 15, 
         Credits = 15, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         SpecFuns = 
         {
            [1] = "spec_customs_alcohol", 
            [0] = "spec_police_attack", 
         }, 
         Vnum = 29068, 
         DefaultPosition = "standing", 
         ShortDescr = "a young deputy", 
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
         Race = "Adarian", 
         HitChance = 
         {
            HitNoDice = 2, 
            HitSizeDice = 15, 
            HitPlus = 0, 
         }, 
         NumberOfAttacks = 0, 
         LongDescr = "A deputy patrols the area.\
", 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 1, 
            DamSizeDice = 8, 
         }, 
         VipFlags = 
         {
            [9] = "Adari", 
         }, 
         Position = "standing", 
         Sex = "male", 
         DamRoll = 3, 
         Height = 0, 
         Alignment = 300, 
         Languages = 
         {
            Speaking = 
            {
               [19] = "adarese", 
            }, 
            Speaks = 
            {
               [19] = "adarese", 
            }, 
         }, 
         ArmorClass = 0, 
         Flags = 
         {
            [0] = "Npc", 
            [6] = "StayArea", 
         }, 
         Name = "deputy young", 
      }, 
      [29069] = 
      {
         HitRoll = 2, 
         Description = "Not the brightest nor most beautiful Adarian.  This is one of the\
citizens of the town.  She lives day to day.\
", 
         Level = 15, 
         Credits = 0, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Vnum = 29069, 
         DefaultPosition = "standing", 
         ShortDescr = "a Townie", 
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
         Race = "Adarian", 
         HitChance = 
         {
            HitNoDice = 1, 
            HitSizeDice = 10, 
            HitPlus = 0, 
         }, 
         NumberOfAttacks = 0, 
         LongDescr = "An Adarian Townie wanders about here.\
", 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 1, 
            DamSizeDice = 5, 
         }, 
         VipFlags = 
         {
            [9] = "Adari", 
         }, 
         Position = "standing", 
         Sex = "female", 
         DamRoll = 2, 
         Height = 0, 
         Alignment = -100, 
         Languages = 
         {
            Speaking = 
            {
               [19] = "adarese", 
            }, 
            Speaks = 
            {
               [19] = "adarese", 
            }, 
         }, 
         ArmorClass = 75, 
         Flags = 
         {
            [0] = "Npc", 
            [6] = "StayArea", 
            [24] = "NoAssist", 
         }, 
         Name = "adarian townie", 
      }, 
      [29070] = 
      {
         HitRoll = 4, 
         Description = "Ears similar to a rabbit, eyes of a fly, teeth of a lion, body of an\
ape. This can be a very frightening beast to stumble upon.\
", 
         Level = 22, 
         Credits = 0, 
         SaveVs = 
         {
            PoisonDeath = 0, 
            ParaPetri = 0, 
            SpellStaff = 0, 
            Breath = 0, 
            Wand = 0, 
         }, 
         Vnum = 29070, 
         DefaultPosition = "standing", 
         MudProgs = 
         {
            [1] = 
            {
               MudProgType = "all_greet_prog", 
               Code = "if ispc($n) \
if level($n) >= 15 \
mpkill $n \
endif \
else \
mpecho A Draagax snorts loudly.\
endif\
", 
               Arguments = "75", 
            }, 
         }, 
         ShortDescr = "a Draagax", 
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
         Race = "Adarian", 
         HitChance = 
         {
            HitNoDice = 2, 
            HitSizeDice = 22, 
            HitPlus = 0, 
         }, 
         NumberOfAttacks = 0, 
         LongDescr = "A crazed omnivore sniffs about.\
", 
         Damage = 
         {
            DamPlus = 0, 
            DamNoDice = 2, 
            DamSizeDice = 12, 
         }, 
         Weight = 0, 
         Position = "standing", 
         Sex = "undistinguished", 
         DamRoll = 4, 
         Height = 0, 
         Alignment = -100, 
         Languages = 
         {
            Speaking = 
            {
               [19] = "adarese", 
            }, 
            Speaks = 
            {
               [19] = "adarese", 
            }, 
         }, 
         ArmorClass = 65, 
         Flags = 
         {
            [0] = "Npc", 
            [25] = "NoKill", 
            [2] = "Scavenger", 
            [6] = "StayArea", 
            [18] = "Mountable", 
         }, 
         Name = "draagax crazed omnivore", 
      }, 
   }, 
   VnumRanges = 
   {
      Object = 
      {
         First = 29060, 
         Last = 29065, 
      }, 
      Room = 
      {
         First = 29060, 
         Last = 29158, 
      }, 
      Mob = 
      {
         First = 29060, 
         Last = 29070, 
      }, 
   }, 
   HighEconomy = 0, 
   FileFormatVersion = 1, 
   LowEconomy = 4999216, 
   Filename = "adari01.lua", 
   Name = "Adari - Baituh City", 
}
